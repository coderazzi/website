#!/usr/bin/env python
#
#       Program to remove rename or reorder columns in a sqlite3 database
#       It takes care of tables and indexes, but not of views or triggers
#       dependencies: sqlite3
#
# Copyright (c) 2013 Luis M. Pena  -  lu@coderazzi.net  All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# Redistributions in bytecode form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in
# the documentation and/or other materials provided with the
# distribution.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import os
import re
import shutil
import sqlite3
import sys

ALTER_PREFIX='altered-'

def exit(msg):
    print >> sys.stderr, msg
    sys.exit(1)


def showHelp():
    out=sys.stderr
    print >> out, 'alter_table.py v0.21 (c) Coderazzi'
    print >> out, 'Utility to rename or drop columns in sqlite3 tables'
    print >> out, '\narguments: filename table[:alter_op]+'
    print >> out, '       where operations are one or more of:'
    print >> out, '             table[:alter_op]+'
    print >> out, '       where alter_op can be'
    print >> out, '             -column         : drops the given column'
    print >> out, '             column@number   : reorders the column (0...)'
    print >> out, '             column=new_name : renames a column\n'
    sys.exit(1)


def getDbInfo(filename):
    """
        Returns db info on the sqlite database in filename
        The info is returned as a tuple:
        1- columns:   map : table name lower case 
                            -> list of columns in lower case
        2- sql:       map : table name lower case 
                            -> associated sql
        3- index sql: map : table name lower case 
                            -> list of sql for associated indexes
    """
    beautifier = re.compile('\s+', re.S)
    def beautifySql(sql):
        return beautifier.sub(' ', sql).strip()

    with sqlite3.connect(filename) as db:
        cursor, exCursor = db.cursor(), db.cursor()
        table_columns, sql_tables, sql_indexes={}, {}, {}       
        sql = "SELECT tbl_name, sql FROM sqlite_master WHERE type='table'"
        for each in cursor.execute(sql).fetchall():
            table=each[0].lower()
            columns=table_columns[table]=[]
            sql_tables[table]=beautifySql(each[1])
            sql_indexes[table]=[]
            sql = 'pragma table_info(%s)'%table
            for info in cursor.execute(sql).fetchall():
                columns.append(info[1].lower())
        sql = "SELECT tbl_name, sql FROM sqlite_master WHERE type='index'"
        for each in cursor.execute(sql).fetchall():
            if each[1]:
                sql_indexes[each[0].lower()].append(beautifySql(each[1]))
        cursor.close()
        exCursor.close()
        return table_columns, sql_tables, sql_indexes


def getNewNameForColumn(current, changes):
    """
        Returns the new name for a column with the users' directives.
        If the column is to be removed, None is returned
        @param current: the current name, case preserved.
        @param changes: a map where the key is the current column in
               lowercase, and the value the new column name, or None
               to remove it
    """
    l=current.lower()
    return changes.get(l, current)


def getTableChanges(sql, rowid, colRenames, colReorder):
    """
        Returns the changes in the SQL creation for a table with the 
        given user's directives. 
        @param sql: the sql currently used for the table creation.
        @param rowid: new name for rowid
        @param colRenames: a map where the key is the current column in
               lowercase, and the value the new column name, or None
               to remove it
        @param colReorder: a list of tuples where the first element is
               the current column in lowercase, and the second, the 
               required target position, 0 based
        The info is returned as a tuple:
        1- New SQL for that table
        2- Columns to be preserved when transfering data, 
            in the exact creation order
    """
    sqlMatcher = re.compile('([^\(]+)\((.*?)\)\s*$', re.S)
    colMatcher = re.compile('\s*([\S]+)(.*)', re.S)
    matcher = sqlMatcher.match(sql)
    if not matcher:
        exit('Invalid sql:'+sql)
    sqlPrefix = matcher.group(1)
    cols, preserve, finalNames =[], [], []
    for each in [colMatcher.match(c) for c in matcher.group(2).split(',')]:
        if not each:
            exit('Invalid sql:'+sql)
        colName = each.group(1).strip()
        newColName=getNewNameForColumn(colName, colRenames)
        if newColName:
            lc =newColName.lower()
            if lc in finalNames:
                exit('Column '+newColName+' would be repeated on '+sqlPrefix)
            finalNames.append(lc)
            preserve.append(colName)
            cols.append(newColName+' '+each.group(2).strip())
    for col, pos in colReorder:
        if col not in finalNames:
            exit('Column '+col+' invalid for reordering')
        index=finalNames.index(col)
        if index != pos:
            preserve.insert(pos, preserve.pop(index))
            cols.insert(pos, cols.pop(index))
    if rowid:
        if rowid in finalNames:
            exit('Column '+newColName+' would be repeated on '+sqlPrefix)
        preserve.insert(0, 'rowid')
        cols.insert(0, rowid+' integer primary key')
    return sqlPrefix+'('+','.join(cols)+')', preserve


def getIndexChanges(sqls, changes):
    """
        Returns the changes in the SQL creation for the indexes associated 
        to a table, with the given user's directives.
        @param sql: the sql currently used for the index creation.
        @param changes: a map where the key is the current column in
               lowercase, and the value the new column name, or None
               to remove it
    """
    ret=[]
    for sql in sqls:
        sqlMatcher = re.compile('([^\(]+)\((.*?)\)\s*$', re.S)
        matcher = sqlMatcher.match(sql)
        if not matcher:
            exit('Invalid sql:'+sql)
        sqlPrefix = matcher.group(1)
        cols=[]
        for col in matcher.group(2).split(','):
            newColName=getNewNameForColumn(col.strip(), changes)
            if newColName:
                cols.append(newColName)
        if cols:
            ret.append(sqlPrefix+'('+','.join(cols)+')')
    return ret


def transfer(dbOrig, dbTarget, table, colsToPreserve):
    """
        Transfer the given table from database dbOrig to database dbTarget,
        removing all columns not specified in colsToPreserve.
        colsToPreserve must have the order defined on table creation
    """
    def convert(value):
        if isinstance(value, unicode):
            return '"'+value+'"'
        if value==None:
            return "null"
        return str(value)
    cursor=dbOrig.cursor()
    try:
        target = dbTarget.cursor()
        try:
            sql='select '+','.join(colsToPreserve)+' from '+table
            for each in cursor.execute(sql).fetchall():
                values=','.join([convert(e) for e in each])
                target.execute('insert into '+table+ ' values('+values+')')
            dbTarget.commit()
        finally:
            target.close()
    finally:
        cursor.close()


def handle(filename, changes, reorder):
    try:
        info, sql_tables, sql_indexes=getDbInfo(filename)
    except sqlite3.DatabaseError:
        exit('Invalid sqlite3 file: %s' % filename)
    newSql, newIndexes, colsToPreserve, rowid={}, {}, {}, None
    pkey_check = re.compile('^.*primary\s+key.*$', re.I | re.S)
    for table, ops in changes.items():
        cols = info.get(table)
        if not cols:
            exit('No such table %s' % table)
        for op, val in ops.items():
            if op not in cols:
                if op=='rowid' and not pkey_check.match(sql_tables[table]):
                    rowid=ops.pop(op)
                else:
                    exit('No such column in table %s: %s' % (table, op))
        sql, keep = getTableChanges(sql_tables[table], rowid, ops, reorder)
        newIndexes[table]=getIndexChanges(sql_indexes[table], ops)
        newSql[table]=sql
        colsToPreserve[table]=keep

    dirname, basename = os.path.split(filename)
    newFile=os.path.join(dirname, ALTER_PREFIX+basename)
    workOn = shutil.copyfile(filename, newFile)
    with sqlite3.connect(filename) as dbOrig:
        with sqlite3.connect(newFile) as dbWork:
            for table, ops in changes.items():              
                dbWork.execute('drop table '+table)
                preserve = colsToPreserve[table]
                if preserve:
                    dbWork.execute(newSql[table])
                    for each in newIndexes[table]:
                        dbWork.execute(each)
                    transfer(dbOrig, dbWork, table, preserve)
        dbWork.execute('vacuum')
                

if __name__=='__main__':
    if len(sys.argv)<3 or sys.argv[1][0]=='-':
        showHelp()
    reorder, changes, filename = [], {}, sys.argv[1]
    if not os.path.exists(filename) or os.path.isdir(filename):
        exit('Invalid sqlite3 file: %s' % filename)
    opArgs = sys.argv[2:]
    tableOp = re.compile('([^\:\s]+)\:(.+)$')
    basicOp = re.compile('^(?:-(.+))|(?:([^=]+)=([a-zA-Z].*))|(?:([^@]+)@(\d+))$')
    for arg in opArgs:
        match = tableOp.match(arg)
        if not match:
            exit('Invalid argument: '+arg)
        table=match.group(1).lower()
        try:
            opTable = changes[table]
        except KeyError:
            changes[table] = opTable = {}
        for each in match.group(2).split(':'):
            match=basicOp.match(each)
            if not match:
                exit('Invalid operation: '+arg)
            column = match.group(4)
            if column:
                reorder.append((column.lower(), int(match.group(5))))
            else:
                column, value = match.group(1), None
                if not column:
                    column = match.group(2)
                    value = match.group(3) 
                opTable[column.lower()]=value
    handle(filename, changes, reorder)
