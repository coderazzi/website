#!/usr/bin/env python
#
# Script to enable restarting a network: 
#       network interfaces are detached / reattached
#
# (c) Luis M Pena <coderazzi@gmail.com> 2014
#     Version 1.1
#
# This work is herewith placed in public domain.


import argparse, libvirt, sys, time, subprocess
import xml.etree.ElementTree as XTree

clParser = argparse.ArgumentParser(description='VIRT network restarter')
clParser.add_argument('networks', type=str, nargs='+')
clParser.add_argument('-c', '--connect')
clParser.add_argument('-n', '--no-iptables', action='store_true')
args = clParser.parse_args()


conn = libvirt.open(args.connect)
if not conn:
    hypervisor = args.connect or '(default)'
    print 'Failed to open connection to the hypervisor:', hypervisor
    sys.exit(1)

devices=[]
for network in args.networks:
    try:
        net = conn.networkLookupByName(network)
    except:
        print >> sys.stderr, 'Invalid network name:', network
        continue
    iptables = None if args.no_iptables else subprocess.check_output(['iptables-save'])
    print 'Stopping network', network
    net.destroy()
    for did in conn.listDomainsID():
        domain  = conn.lookupByID(did)
        xmlDesc = domain.XMLDesc(0)
        for n in XTree.fromstring(xmlDesc).findall('devices/interface'):
            if n.get('type')=='network':
                source, mac = [n.find(x) for x in ['source', 'mac']]
                source      = source is not None and source.get('network')
                mac         = mac    is not None and mac.get('address')
                if network == source:
                    message = '%s: detaching device %s, on network %s'
                    print message % (domain.name(), mac, network)
                    xml = XTree.tostring(n)
                    domain.detachDevice(xml)
                    devices.append((domain, mac, xml))
    print 'Starting network', network
    net.create()

if devices:
    print 'Reattaching devices...'
    time.sleep(1)
    for domain, mac, xml in devices:
        print 'Attaching device', mac,'to domain', domain.name()
        domain.attachDevice(xml)
    if iptables:
        print 'Restoring now iptables....'
        p = subprocess.Popen(['iptables-restore'], 
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = p.communicate(iptables)
        if p.returncode:
            print stdout
            print >> sys.stderr, stderr
