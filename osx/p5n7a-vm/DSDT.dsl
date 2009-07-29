/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080213
 *
 * Disassembly of /Users/DiaboliK/Desktop/DSDT_Patcher1.0.1e/Tools/DSDT.aml, Tue Dec  9 04:56:45 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00009D0E (40206)
 *     Revision         0x01
 *     Checksum         0xFF
 *     OEM ID           "APPLE "
 *     OEM Table ID     "P5N7AVM"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20051117 (537202967)
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "APPLE ", "P5N7AVM", 0x00000000)
{
    Scope (_PR)
    {
        Processor (_PR.CPU0, 0x01, 0x00004010, 0x06) {}
        Processor (_PR.CPU1, 0x02, 0x00000000, 0x00) {}
    }

    Method (DTGP, 5, NotSerialized)
    {
        If (LEqual (Arg0, Buffer (0x10)
                {
                    /* 0000 */    0xC6, 0xB7, 0xB5, 0xA0, 0x18, 0x13, 0x1C, 0x44, 
                    /* 0008 */    0xB0, 0xC9, 0xFE, 0x69, 0x5E, 0xAF, 0x94, 0x9B
                }))
        {
            If (LEqual (Arg1, One))
            {
                If (LEqual (Arg2, Zero))
                {
                    Store (Buffer (0x01)
                        {
                            0x03
                        }, Arg4)
                    Return (One)
                }

                If (LEqual (Arg2, One))
                {
                    Return (One)
                }
            }
        }

        Store (Buffer (0x01)
            {
                0x00
            }, Arg4)
        Return (Zero)
    }

    Name (DP80, 0x80)
    Name (DP90, 0x90)
    Name (DP40, 0x4001)
    Name (SPIO, 0x2E)
    Name (IOHW, 0x0290)
    Name (SSMI, 0x442E)
    Name (MRN0, 0xFC060000)
    Name (MRN1, 0xFC068000)
    Name (APIC, One)
    Name (SHPB, 0xFED00000)
    Name (SHPL, 0x1000)
    Name (PMBS, 0x4000)
    Name (PMLN, 0x0100)
    Name (SCBS, 0x4400)
    Name (SCLN, 0x0100)
    Name (ACBS, 0x4800)
    Name (ACLN, 0x0100)
    Name (MTAB, 0x4F00)
    Name (MTAL, 0x0100)
    Name (ACA4, 0x40A4)
    Name (SCIO, 0x4400)
    Name (GIOB, 0x44C0)
    Name (SCTL, 0x4090)
    Name (SNAS, One)
    Name (SNAM, 0xFEFE1000)
    Name (SNAL, 0x1000)
    Name (SPAS, One)
    Name (SPAM, 0xFEFE2000)
    Name (SPAL, 0x2000)
    Name (MUAE, Zero)
    Name (MXF0, 0x3F)
    Name (SMIP, 0x442E)
    Name (EAQF, One)
    Name (CQST, 0x3C)
    Name (CFTE, Zero)
    Name (SQST, 0x28)
    Name (NIMP, One)
    Name (SLOW, Zero)
    Name (SVEN, One)
    Name (SVSS, 0x40)
    Name (PCIB, 0xFC000000)
    Name (PCIL, 0x02000000)
    Name (WKTP, One)
    Name (GPBS, 0x44C0)
    Name (SMBS, 0x4D00)
    OperationRegion (BIOS, SystemMemory, 0xCFF9E064, 0xFF)
    Field (BIOS, ByteAcc, NoLock, Preserve)
    {
        SS1,    1, 
        SS2,    1, 
        SS3,    1, 
        SS4,    1, 
                Offset (0x01), 
        IOST,   16, 
        TOPM,   32, 
        ROMS,   32, 
        MG1B,   32, 
        MG1L,   32, 
        MG2B,   32, 
        MG2L,   32, 
                Offset (0x1C), 
        DMAX,   8, 
        HPTA,   32, 
        CPB0,   32, 
        CPB1,   32, 
        CPB2,   32, 
        CPB3,   32, 
        ASSB,   8, 
        AOTB,   8, 
        AAXB,   32, 
        SMIF,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        MPEN,   8, 
        TPMF,   8, 
        MG3B,   32, 
        MG3L,   32, 
        MH1B,   32, 
        MH1L,   32, 
        OSTP,   8, 
        CMO1,   8, 
        HYCM,   8, 
        HPSP,   8, 
        HBDP,   8, 
        TVCC,   8, 
        TVFC,   8, 
        PPOL,   8, 
        PFLG,   8
    }

    Method (RRIO, 4, NotSerialized)
    {
        Store ("RRIO", Debug)
    }

    Method (RDMA, 3, NotSerialized)
    {
        Store ("rDMA", Debug)
    }

    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)
    {
        If (Arg0)
        {
            Store (0xAA, DBG8)
        }
        Else
        {
            Store (0xAC, DBG8)
        }

        Store (Arg0, PICM)
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If (LNotEqual (OSVR, Ones))
        {
            Return (OSVR)
        }

        Name (T_0, Zero)
        Store (OSYS (), T_0)
        If (LEqual (T_0, One))
        {
            Store (0x03, OSVR)
        }
        Else
        {
            If (LEqual (T_0, 0x10))
            {
                Store (One, OSVR)
            }
            Else
            {
                If (LEqual (T_0, 0x11))
                {
                    Store (0x02, OSVR)
                }
                Else
                {
                    If (LEqual (T_0, 0x12))
                    {
                        Store (0x04, OSVR)
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x13))
                        {
                            Store (Zero, OSVR)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x14))
                            {
                                Store (Zero, OSVR)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x15))
                                {
                                    Store (Zero, OSVR)
                                }
                            }
                        }
                    }
                }
            }
        }

        Return (OSVR)
    }

    Method (MCTH, 2, NotSerialized)
    {
        If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Store (Arg1, BUF1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (ShiftLeft (SS1, One), Local0)
        Or (Local0, ShiftLeft (SS2, 0x02), Local0)
        Or (Local0, ShiftLeft (SS3, 0x03), Local0)
        Or (Local0, ShiftLeft (SS4, 0x04), Local0)
        If (And (ShiftLeft (One, Arg1), Local0))
        {
            Store (Arg1, Index (PRWP, One))
        }
        Else
        {
            ShiftRight (Local0, One, Local0)
            If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
            {
                FindSetLeftBit (Local0, Index (PRWP, One))
            }
            Else
            {
                FindSetRightBit (Local0, Index (PRWP, One))
            }
        }

        Return (PRWP)
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, DP80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, DP90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    OperationRegion (DEB2, SystemIO, DP40, 0x02)
    Field (DEB2, WordAcc, NoLock, Preserve)
    {
        DBGA,   16
    }

   Method (OSYS, 0, NotSerialized)
    {
        Store (0x10, Local0)
        If (CondRefOf (_OSI, Local1))
        {
            If (_OSI ("Windows 2000"))
            {
                Store (0x12, Local0)
            }

            If (_OSI ("Windows 2001"))
            {
                Store (0x13, Local0)
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                Store (0x13, Local0)
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                Store (0x13, Local0)
            }

            If (_OSI ("Windows 2001.1"))
            {
                Store (0x14, Local0)
            }

            If (_OSI ("Windows 2001.1 SP1"))
            {
                Store (0x14, Local0)
            }

            If (_OSI ("Windows 2006"))
            {
                Store (0x15, Local0)
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                Store (0x12, Local0)
            }
            Else
            {
                If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
                {
                    Store (0x11, Local0)
                }

                If (MCTH (_OS, "Linux"))
                {
                    Store (One, Local0)
                }
            }
        }

        If (_OSI ("Darwin"))
        {
	        Store (0x14, Local0)
    	}

        Return (Local0)
    }

    Scope (_SB)
    {
        Name (PR00, Package (0x10)
        {
            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LSMB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LPMU, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LUB0, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LUB2, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                UB11, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                UB12, 
                Zero
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                Zero, 
                LMAC, 
                Zero
            }, 

            Package (0x04)
            {
                0x000BFFFF, 
                Zero, 
                LSA0, 
                Zero
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                Zero, 
                LAZA, 
                Zero
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                Zero, 
                LRP0, 
                Zero
            }, 

            Package (0x04)
            {
                0x000DFFFF, 
                Zero, 
                LRP1, 
                Zero
            }, 

            Package (0x04)
            {
                0x000EFFFF, 
                Zero, 
                LRP2, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                Zero, 
                LRP3, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LRP4, 
                Zero
            }, 

            Package (0x04)
            {
                0x0017FFFF, 
                Zero, 
                LRP5, 
                Zero
            }, 

            Package (0x04)
            {
                0x0018FFFF, 
                Zero, 
                LRP6, 
                Zero
            }
        })
        Name (AR00, Package (0x10)
        {
            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LSMB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LPMU, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LUB0, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LUB2, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                UB11, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                UB12, 
                Zero
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                Zero, 
                LMAC, 
                Zero
            }, 

            Package (0x04)
            {
                0x000BFFFF, 
                Zero, 
                LSA0, 
                Zero
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                Zero, 
                LAZA, 
                Zero
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                Zero, 
                LRP0, 
                Zero
            }, 

            Package (0x04)
            {
                0x000DFFFF, 
                Zero, 
                LRP1, 
                Zero
            }, 

            Package (0x04)
            {
                0x000EFFFF, 
                Zero, 
                LRP2, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                Zero, 
                LRP3, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LRP4, 
                Zero
            }, 

            Package (0x04)
            {
                0x0017FFFF, 
                Zero, 
                LRP5, 
                Zero
            }, 

            Package (0x04)
            {
                0x0018FFFF, 
                Zero, 
                LRP6, 
                Zero
            }
        })
        Name (PR02, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                SGRU, 
                Zero
            }
        })
        Name (AR02, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                SGRU, 
                Zero
            }
        })
        Name (PR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN0A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN0B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN0C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN0D, 
                Zero
            }
        })
        Name (AR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN0A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN0B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN0C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN0D, 
                Zero
            }
        })
        Name (PR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN1A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN1B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN1C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN1D, 
                Zero
            }
        })
        Name (AR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN1A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN1B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN1C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN1D, 
                Zero
            }
        })
        Name (PR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN2A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN2B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN2C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN2D, 
                Zero
            }
        })
        Name (AR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN2A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN2B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN2C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN2D, 
                Zero
            }
        })
        Name (PR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN3A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN3B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN3C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN3D, 
                Zero
            }
        })
        Name (AR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN3A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN3B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN3C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN3D, 
                Zero
            }
        })
        Name (PR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN4A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN4B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN4C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN4D, 
                Zero
            }
        })
        Name (AR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN4A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN4B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN4C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN4D, 
                Zero
            }
        })
        Name (PR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN5A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN5B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN5C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN5D, 
                Zero
            }
        })
        Name (AR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN5A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN5B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN5C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN5D, 
                Zero
            }
        })
        Name (PR09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN6A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN6B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN6C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN6D, 
                Zero
            }
        })
        Name (AR09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN6A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN6B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN6C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN6D, 
                Zero
            }
        })
        Name (PR01, Package (0x08)
        {
            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR01, Package (0x08)
        {
            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (RSA0, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {10}
        })
        Name (RSAC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,7,9,11,14,15}
        })
        Alias (RSAC, RSB0)
        Alias (RSAC, RSB2)
        Alias (RSAC, RS11)
        Alias (RSAC, RS12)
        Alias (RSAC, RSMB)
        Alias (RSAC, RSMU)
        Alias (RSAC, RSZA)
        Alias (RSAC, RSRU)
        Alias (RSAC, RSTA)
        Alias (RSAC, PRSA)
        Alias (RSAC, PRSB)
        Alias (RSAC, PRSC)
        Alias (RSAC, PRSD)
        Alias (RSAC, RS0A)
        Alias (RSAC, RS0B)
        Alias (RSAC, RS0C)
        Alias (RSAC, RS0D)
        Alias (RSAC, RS1A)
        Alias (RSAC, RS1B)
        Alias (RSAC, RS1C)
        Alias (RSAC, RS1D)
        Alias (RSAC, RS2A)
        Alias (RSAC, RS2B)
        Alias (RSAC, RS2C)
        Alias (RSAC, RS2D)
        Alias (RSAC, RS3A)
        Alias (RSAC, RS3B)
        Alias (RSAC, RS3C)
        Alias (RSAC, RS3D)
        Alias (RSAC, RS4A)
        Alias (RSAC, RS4B)
        Alias (RSAC, RS4C)
        Alias (RSAC, RS4D)
        Alias (RSAC, RS5A)
        Alias (RSAC, RS5B)
        Alias (RSAC, RS5C)
        Alias (RSAC, RS5D)
        Alias (RSAC, RS6A)
        Alias (RSAC, RS6B)
        Alias (RSAC, RS6C)
        Alias (RSAC, RS6D)
        Alias (RSAC, RS7A)
        Alias (RSAC, RS7B)
        Alias (RSAC, RS7C)
        Alias (RSAC, RS7D)
        Alias (RSAC, RSP0)
        Alias (RSAC, RSP1)
        Alias (RSAC, RSP2)
        Alias (RSAC, RSP3)
        Alias (RSAC, RSP4)
        Alias (RSAC, RSP5)
        Alias (RSAC, RSP6)
        Name (RSIR, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
            {
                0x00000010,
                0x00000011,
                0x00000012,
                0x00000013,
            }
        })
        Name (RSII, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
            {
                0x00000014,
                0x00000015,
                0x00000016,
                0x00000017,
            }
        })
        Alias (RSII, RSIG)
        Alias (RSII, RSU1)
        Alias (RSII, RSU2)
        Alias (RSII, RSI1)
        Alias (RSII, RSI2)
        Alias (RSII, RSSA)
        Alias (RSII, RSMA)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, Zero)
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)
            Method (_PRT, 0, NotSerialized)
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Method (NPTS, 1, NotSerialized)
            {
            }

            Method (NWAK, 1, NotSerialized)
            {
            }

            Device (LPCB)
            {
                Name (_ADR, 0x00030000)
                Method (SPTS, 1, NotSerialized)
                {
                    Store (One, PS1S)
                    Store (One, PS1E)
                }

                Method (SWAK, 1, NotSerialized)
                {
                    Store (Zero, PS1E)
                    Store (0x02, S1CT)
                    Store (0x02, S3CT)
                    Store (0x02, S4CT)
                    Store (0x02, S5CT)
                }

                OperationRegion (SMIE, SystemIO, SCIO, 0x08)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PS1S,   1, 
                        ,   31, 
                    PS1E,   1, 
                            Offset (0x08)
                }

                OperationRegion (SXCT, SystemIO, SCTL, 0x10)
                Field (SXCT, ByteAcc, NoLock, Preserve)
                {
                    S1CT,   2, 
                            Offset (0x04), 
                    S3CT,   2, 
                            Offset (0x08), 
                    S4CT,   2, 
                            Offset (0x0C), 
                    S5CT,   2, 
                            Offset (0x10)
                }

                Scope (\_SB)
                {
                    OperationRegion (\SCPP, SystemIO, SSMI, One)
                    Field (SCPP, ByteAcc, NoLock, Preserve)
                    {
                        SMIP,   8
                    }

                    Scope (PCI0)
                    {
                        OperationRegion (IONB, SystemIO, 0x4400, 0xFF)
                        Field (IONB, ByteAcc, NoLock, Preserve)
                        {
                                    Offset (0xC3), 
                            GP04,   8, 
                            GP05,   8, 
                                    Offset (0xD0), 
                            GP17,   8, 
                                    Offset (0xE5), 
                            GP38,   8, 
                                    Offset (0xEE), 
                            GP47,   8, 
                            GP48,   8
                        }

                        OperationRegion (IONA, SystemIO, 0x4800, 0xFF)
                        Field (IONA, ByteAcc, NoLock, Preserve)
                        {
                            NAID,   4, 
                                    Offset (0x70), 
                            HPMK,   7
                        }

                        Method (_S3D, 0, NotSerialized)
                        {
                            If (LEqual (OSFL (), 0x02))
                            {
                                Return (0x02)
                            }
                            Else
                            {
                                Return (0x03)
                            }
                        }

                        Name (_S1D, One)
                        Name (NATA, Package (0x01)
                        {
                            0x00100000
                        })
                        Device (NVRB)
                        {
                            Name (_HID, "NVRAID20")
                            Name (FNVR, 0xFF)
                            Method (_DIS, 0, NotSerialized)
                            {
                                Store (Zero, FNVR)
                            }

                            Method (_SRS, 1, NotSerialized)
                            {
                                Store (0xFF, FNVR)
                            }

                            Method (_STA, 0, NotSerialized)
                            {
                                If (And (CPB0, One))
                                {
                                    If (LEqual (FNVR, 0xFF))
                                    {
                                        Return (0x0F)
                                    }
                                    Else
                                    {
                                        Return (0x0D)
                                    }
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }

                            Name (_CRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x04D2,             // Range Minimum
                                    0x04D2,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                            })
                        }
                    }
                }

                OperationRegion (UCFG, PCI_Config, 0x78, One)
                Field (UCFG, ByteAcc, NoLock, Preserve)
                {
                    U1CF,   8
                }

                Device (MUAR)
                {
                    Name (_UID, 0xFF)
                    Name (_HID, EisaId ("PNP0501"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (MUAE)
                        {
                            And (U1CF, 0x83, Local0)
                            If (LEqual (Local0, 0x82))
                            {
                                Return (0x0F)
                            }
                        }

                        Return (Zero)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LEqual (U1CF, 0xC2))
                        {
                            Store (0x03F8, UIO1)
                            ShiftLeft (One, 0x04, UIRQ)
                            Store (One, _UID)
                        }

                        If (LEqual (U1CF, 0xA6))
                        {
                            Store (0x02F8, UIO1)
                            ShiftLeft (One, 0x03, UIRQ)
                            Store (0x02, _UID)
                        }

                        Store (UIO1, UIO2)
                        Return (UCRS)
                    }

                    Name (UCRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y01)
                        IRQNoFlags (_Y00)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, )
                            {}
                    })
                    CreateWordField (UCRS, \_SB.PCI0.LPCB.MUAR._Y00._INT, UIRQ)
                    CreateWordField (UCRS, \_SB.PCI0.LPCB.MUAR._Y01._MIN, UIO1)
                    CreateWordField (UCRS, \_SB.PCI0.LPCB.MUAR._Y01._MAX, UIO2)
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (FDC)
                {
                    Name (_HID, EisaId ("PNP0700"))
                    Method (_FDE, 0, NotSerialized)
                    {
                        Name (FDEP, Package (0x05)
                        {
                            Zero, 
                            Zero, 
                            0x02, 
                            0x02, 
                            0x02
                        })
                        If (_STA ())
                        {
                            Store (One, Index (FDEP, Zero))
                        }

                        Return (FDEP)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (DSTA (0x03))
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        DCNT (0x03, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        DCRS (0x03, One)
                        Store (IRQM, IRQE)
                        Store (DMAM, DMAE)
                        Store (IO11, IO21)
                        Store (IO12, IO22)
                        Store (0x06, LEN2)
                        Add (IO21, 0x07, IO31)
                        Store (IO31, IO32)
                        Store (One, LEN3)
                        Return (CRS2)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        DSRS (Arg0, 0x03)
                        CreateWordField (Arg0, One, IRQE)
                        CreateByteField (Arg0, 0x04, DMAE)
                        ENFG (CGLD (0x03))
                        If (IRQE)
                        {
                            FindSetRightBit (IRQE, Local0)
                            Subtract (Local0, One, INTR)
                        }
                        Else
                        {
                            Store (Zero, INTR)
                        }

                        If (DMAE)
                        {
                            FindSetRightBit (DMAE, Local0)
                            Subtract (Local0, One, DMCH)
                        }
                        Else
                        {
                            Store (0x04, DMCH)
                        }

                        EXFG ()
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0370,             // Range Minimum
                                0x0370,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x0377,             // Range Minimum
                                0x0377,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        EndDependentFn ()
                    })
                }

                Device (LPTE)
                {
                    Method (_HID, 0, NotSerialized)
                    {
                        If (LPTM (0x02))
                        {
                            Return (0x0104D041)
                        }
                        Else
                        {
                            Return (0x0004D041)
                        }
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (DSTA (0x02))
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        DCNT (0x02, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        DCRS (0x02, One)
                        If (LPTM (0x02))
                        {
                            Store (IRQM, IRQE)
                            Store (DMAM, DMAE)
                            Store (IO11, IO21)
                            Store (IO12, IO22)
                            Store (LEN1, LEN2)
                            Add (IO21, 0x0400, IO31)
                            Store (IO31, IO32)
                            Store (LEN2, LEN3)
                            Return (CRS2)
                        }
                        Else
                        {
                            Return (CRS1)
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        DSRS (Arg0, 0x02)
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        If (LPTM (0x02))
                        {
                            Return (EPPR)
                        }
                        Else
                        {
                            Return (LPPR)
                        }
                    }

                    Name (LPPR, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                    Name (EPPR, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0778,             // Range Minimum
                                0x0778,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0778,             // Range Minimum
                                0x0778,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0678,             // Range Minimum
                                0x0678,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IO (Decode16,
                                0x07BC,             // Range Minimum
                                0x07BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        EndDependentFn ()
                    })
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x10)
                    Name (CRS, ResourceTemplate ()
                    {
                        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                            0x00000000,         // Granularity
                            0x000D0000,         // Range Minimum
                            0x000D3FFF,         // Range Maximum
                            0x00000000,         // Translation Offset
                            0x00004000,         // Length
                            ,, , AddressRangeMemory, TypeStatic)
                        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                            0x00000000,         // Granularity
                            0x000D4000,         // Range Minimum
                            0x000D7FFF,         // Range Maximum
                            0x00000000,         // Translation Offset
                            0x00004000,         // Length
                            ,, , AddressRangeMemory, TypeStatic)
                        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                            0x00000000,         // Granularity
                            0x000DE000,         // Range Minimum
                            0x000DFFFF,         // Range Maximum
                            0x00000000,         // Translation Offset
                            0x00002000,         // Length
                            ,, , AddressRangeMemory, TypeStatic)
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x0A,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y02)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y03)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y04)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y05)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y06)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y07)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0A)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y08)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y09)
                        Memory32Fixed (ReadOnly,
                            0xFEE01000,         // Address Base
                            0x000FF000,         // Address Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y02._MIN, GP00)
                        CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y02._MAX, GP01)
                        CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y02._LEN, GP0L)
                        CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y03._MIN, GP10)
                        CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y03._MAX, GP11)
                        CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y03._LEN, GP1L)
                        Store (PMBS, GP00)
                        Store (PMBS, GP01)
                        If (LGreaterEqual (PMLN, 0x0100))
                        {
                            ShiftRight (PMLN, One, GP0L)
                            Add (GP00, GP0L, GP10)
                            Add (GP01, GP0L, GP11)
                            Subtract (PMLN, GP0L, GP1L)
                        }
                        Else
                        {
                            Store (PMLN, GP0L)
                        }

                        If (SCBS)
                        {
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y04._MIN, SC00)
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y04._MAX, SC01)
                            CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y04._LEN, SC0L)
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y05._MIN, SC10)
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y05._MAX, SC11)
                            CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y05._LEN, SC1L)
                            Store (SCBS, SC00)
                            Store (SCBS, SC01)
                            If (LGreaterEqual (SCLN, 0x0100))
                            {
                                ShiftRight (SCLN, One, SC0L)
                                Add (SC00, SC0L, SC10)
                                Add (SC01, SC0L, SC11)
                                Subtract (SCLN, SC0L, SC1L)
                            }
                            Else
                            {
                                Store (SCLN, SC0L)
                            }
                        }

                        If (ACBS)
                        {
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y06._MIN, AC00)
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y06._MAX, AC01)
                            CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y06._LEN, AC0L)
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y07._MIN, AC10)
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y07._MAX, AC11)
                            CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y07._LEN, AC1L)
                            Store (ACBS, AC00)
                            Store (ACBS, AC01)
                            If (LGreaterEqual (ACLN, 0x0100))
                            {
                                ShiftRight (ACLN, One, AC0L)
                                Add (AC00, AC0L, AC10)
                                Add (AC01, AC0L, AC11)
                                Subtract (ACLN, AC0L, AC1L)
                            }
                            Else
                            {
                                Store (ACLN, AC0L)
                            }
                        }

                        If (SPAS)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y08._BAS, BB01)
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y08._LEN, BL01)
                            Store (SPAM, BB01)
                            Store (SPAL, BL01)
                        }

                        If (SNAS)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y09._BAS, AB01)
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y09._LEN, AL01)
                            Store (SNAM, AB01)
                            Store (SNAL, AL01)
                        }

                        CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y0A._BAS, MB01)
                        CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y0A._LEN, ML01)
                        Store (CPB1, MB01)
                        Store (CPB2, ML01)
                        Return (CRS)
                    }
                }

                Scope (\)
                {
                    OperationRegion (RAMW, SystemMemory, 0xCFFF0000, 0x00010000)
                    Field (RAMW, ByteAcc, NoLock, Preserve)
                    {
                        PAR0,   32, 
                        PAR1,   32, 
                        PAR2,   32
                    }

                    OperationRegion (IOB2, SystemIO, 0x442E, 0x02)
                    Field (IOB2, ByteAcc, NoLock, Preserve)
                    {
                        SMIC,   8, 
                        SMIS,   8
                    }

                    Method (ISMI, 1, Serialized)
                    {
                        Store (Arg0, SMIC)
                    }

                    Method (GNVS, 1, Serialized)
                    {
                        Store (Arg0, PAR0)
                        ISMI (0x70)
                        Return (PAR1)
                    }

                    Method (SNVS, 2, Serialized)
                    {
                        Store (Arg0, PAR0)
                        Store (Arg1, PAR1)
                        ISMI (0x71)
                    }

                    Method (GMAX, 1, Serialized)
                    {
                        Store (Arg0, PAR0)
                        ISMI (0x74)
                        Return (PAR1)
                    }

                    Method (GMDX, 1, Serialized)
                    {
                        Store (Arg0, PAR0)
                        ISMI (0x75)
                        Return (PAR1)
                    }

                    Method (GCAX, 1, Serialized)
                    {
                        Store (Arg0, PAR0)
                        ISMI (0x76)
                        Return (PAR1)
                    }

                    Method (GCDX, 1, Serialized)
                    {
                        Store (Arg0, PAR0)
                        ISMI (0x77)
                        Return (PAR1)
                    }
                }

                Scope (\_SB.PCI0.LPCB)
                {
                    Device (ASOC)
                    {
                        Name (_HID, "ATK0110")
                        Name (_UID, 0x01010110)
                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x0F)
                        }

                        Method (_INI, 0, NotSerialized)
                        {
                            INI0 ()
                            INI4 ()
                            INI6 ()
                            INI9 ()
                            INIB ()
                            INIE ()
                        }

                        Name (MBIF, Package (0x08)
                        {
                            0x03, 
                            "P5N7A-VM", 
                            0x01010101, 
                            0x01000100, 
                            0xE0000001, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (ASBF, Buffer (0x08)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (ASBF, Zero, ASB0)
                        CreateDWordField (ASBF, 0x04, ASB1)
                        Method (GGRP, 1, Serialized)
                        {
                            Name (T_0, Zero)
                            Store (Arg0, T_0)
                            If (LEqual (T_0, Zero))
                            {
                                Return (GRP0)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x04))
                                {
                                    Return (GRP4)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x06))
                                    {
                                        Return (GRP6)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x09))
                                        {
                                            Return (GRP9)
                                        }
                                        Else
                                        {
                                            If (LEqual (T_0, 0x0B))
                                            {
                                                Return (GRPB)
                                            }
                                            Else
                                            {
                                                If (LEqual (T_0, 0x0E))
                                                {
                                                    Return (GRPE)
                                                }
                                                Else
                                                {
                                                    Return (Zero)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Method (GITM, 1, Serialized)
                        {
                            CreateDWordField (Arg0, Zero, PRM0)
                            CreateByteField (Arg0, 0x03, GPID)
                            Store (One, ASB0)
                            Name (T_0, Zero)
                            Store (GPID, T_0)
                            If (LEqual (T_0, Zero))
                            {
                                GIT0 (PRM0)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x04))
                                {
                                    GIT4 (PRM0)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x06))
                                    {
                                        GIT6 (PRM0)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x09))
                                        {
                                            GIT9 (PRM0)
                                        }
                                        Else
                                        {
                                            If (LEqual (T_0, 0x0B))
                                            {
                                                GITB (PRM0)
                                            }
                                            Else
                                            {
                                                If (LEqual (T_0, 0x0E))
                                                {
                                                    GITE (PRM0)
                                                }
                                                Else
                                                {
                                                    Store (Zero, ASB0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Return (ASBF)
                        }

                        Method (SITM, 1, Serialized)
                        {
                            CreateDWordField (Arg0, Zero, PRM0)
                            CreateDWordField (Arg0, 0x04, PRM1)
                            CreateDWordField (Arg0, 0x08, PRM2)
                            CreateByteField (Arg0, 0x03, GPID)
                            Store (One, ASB0)
                            Name (T_0, Zero)
                            Store (GPID, T_0)
                            If (LEqual (T_0, Zero))
                            {
                                SIT0 (PRM0, PRM1, PRM2)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x04))
                                {
                                    SIT4 (PRM0, PRM1, PRM2)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x06))
                                    {
                                        SIT6 (PRM0, PRM1, PRM2)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x09))
                                        {
                                            SIT9 (PRM0, PRM1, PRM2)
                                        }
                                        Else
                                        {
                                            If (LEqual (T_0, 0x0B))
                                            {
                                                SITB (PRM0, PRM1, PRM2)
                                            }
                                            Else
                                            {
                                                If (LEqual (T_0, 0x0E))
                                                {
                                                    SITE (PRM0, PRM1, PRM2)
                                                }
                                                Else
                                                {
                                                    Store (Zero, ASB0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Return (ASBF)
                        }

                        Method (OP2V, 2, NotSerialized)
                        {
                            Store (DerefOf (Index (Arg1, 0x04)), Local0)
                            Store (DerefOf (Index (Arg1, 0x05)), Local1)
                            Multiply (Arg0, Local1, Local1)
                            Add (Local0, Local1, Local0)
                            Return (Local0)
                        }

                        Method (V2OP, 2, NotSerialized)
                        {
                            Store (DerefOf (Index (Arg1, 0x04)), Local0)
                            Store (DerefOf (Index (Arg1, 0x05)), Local1)
                            Subtract (Arg0, Local0, Local0)
                            Divide (Local0, Local1, Local1, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (_UID, Zero)
                    Name (CRS0, ResourceTemplate ()
                    {
                    })
                    Name (CRS1, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadWrite,
                            0xFED00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
  			Return (Zero)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
			Return (CRS1)
                    }
                }

                OperationRegion (LPDC, PCI_Config, 0xA0, 0x06)
                Field (LPDC, ByteAcc, NoLock, Preserve)
                {
                    S3F8,   1, 
                    S2F8,   1, 
                        ,   3, 
                    S2E8,   1, 
                        ,   1, 
                    S3E8,   1, 
                        ,   4, 
                    M300,   1, 
                        ,   2, 
                    M330,   1, 
                        ,   4, 
                    FDC0,   1, 
                            Offset (0x03), 
                    P378,   1, 
                    P278,   1, 
                    P3BC,   1, 
                            Offset (0x04), 
                    G200,   8, 
                    G208,   8
                }

                Method (RRIO, 4, NotSerialized)
                {
                    If (LOr (LEqual (Arg0, Zero), LEqual (Arg0, One)))
                    {
                        If (LEqual (Arg2, 0x03F8))
                        {
                            Store (Arg1, S3F8)
                        }

                        If (LEqual (Arg2, 0x02F8))
                        {
                            Store (Arg1, S2F8)
                        }

                        If (LEqual (Arg2, 0x03E8))
                        {
                            Store (Arg1, S3E8)
                        }

                        If (LEqual (Arg2, 0x02E8))
                        {
                            Store (Arg1, S2E8)
                        }
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        If (LEqual (Arg2, 0x0378))
                        {
                            Store (Arg1, P378)
                        }

                        If (LEqual (Arg2, 0x0278))
                        {
                            Store (Arg1, P278)
                        }

                        If (LEqual (Arg2, 0x03BC))
                        {
                            Store (Arg1, P3BC)
                        }
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, FDC0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        If (LEqual (Arg2, 0x0330))
                        {
                            Store (Arg1, M330)
                        }

                        If (LEqual (Arg2, 0x0300))
                        {
                            Store (Arg1, M300)
                        }
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (Zero, Local0)
                        If (Arg1)
                        {
                            Store (0xFF, Local0)
                        }

                        If (LEqual (Arg2, 0x0200))
                        {
                            Store (Local0, G200)
                        }

                        If (LEqual (Arg2, 0x0208))
                        {
                            Store (Local0, G208)
                        }
                    }
                }

                Method (RDMA, 3, NotSerialized)
                {
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (CRS0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
 			Return (CRS1)
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (CRS0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        Return (CRS1)
                    }
                }

                Device (^PCIE)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x11)
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFC000000,         // Address Base
                            0x02000000,         // Address Length
                            _Y0D)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (CRS, \_SB.PCI0.PCIE._Y0D._BAS, BAS1)
                        CreateDWordField (CRS, \_SB.PCI0.PCIE._Y0D._LEN, LEN1)
                        Store (PCIB, BAS1)
                        Store (PCIL, LEN1)
                        Return (CRS)
                    }
                }

                Scope (\_GPE)
                {
                    Method (_L22, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPCB.ASOC, One)
                        Sleep (0x03E8)
                    }
                }

                Scope (ASOC)
                {
                    Name (VESL, Zero)
                    Method (SPLV, 1, Serialized)
                    {
                        And (Arg0, 0xFFFF, VESL)
                        Store (VESL, PAR0)
                        ISMI (0x88)
                        Store (And (PAR0, 0xFFFF), Local0)
                        Return (Local0)
                    }

                    Method (GPLV, 0, Serialized)
                    {
                        Return (VESL)
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CID, 0x0B03D041)
                    Method (_STA, 0, NotSerialized)
                    {
                        ShiftLeft (One, 0x0A, Local0)
                        If (And (IOST, Local0))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Name (KBFG, One)
                Method (PS2K._PSW, 1, NotSerialized)
                {
                    If (LNot (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02))))
                    {
                        If (Arg0)
                        {
                            Store (One, KBFG)
                        }
                        Else
                        {
                            Store (Zero, KBFG)
                        }
                    }
                }

                Method (PS2K._PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x10, 0x04))
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03"))
                    Name (_CID, 0x130FD041)
                    Method (_STA, 0, NotSerialized)
                    {
                        ShiftLeft (One, 0x0C, Local0)
                        If (And (IOST, Local0))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (M2R0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (M2R1, ResourceTemplate ()
                    {
                        FixedIO (
                            0x0060,             // Address
                            0x01,               // Length
                            )
                        FixedIO (
                            0x0064,             // Address
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        ShiftLeft (One, 0x0A, Local0)
                        If (And (IOST, Local0))
                        {
                            Return (M2R0)
                        }
                        Else
                        {
                            Return (M2R1)
                        }
                    }
                }

                Name (MSFG, One)
                Method (PS2M._PSW, 1, NotSerialized)
                {
                    If (LNot (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02))))
                    {
                        If (Arg0)
                        {
                            Store (One, MSFG)
                        }
                        Else
                        {
                            Store (Zero, MSFG)
                        }
                    }
                }

                Method (PS2M._PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x10, 0x04))
                }

                Device (SIOR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Method (_UID, 0, NotSerialized)
                    {
                        Return (SPIO)
                    }

                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y0E)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            )
                        IO (Decode16,
                            0x0290,             // Range Minimum
                            0x0290,             // Range Maximum
                            0x00,               // Alignment
                            0x08,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LAnd (LNotEqual (SPIO, 0x03F0), LGreater (SPIO, 0xF0)))
                        {
                            CreateWordField (CRS, \_SB.PCI0.LPCB.SIOR._Y0E._MIN, GP10)
                            CreateWordField (CRS, \_SB.PCI0.LPCB.SIOR._Y0E._MAX, GP11)
                            CreateByteField (CRS, \_SB.PCI0.LPCB.SIOR._Y0E._LEN, GPL1)
                            Store (SPIO, GP10)
                            Store (SPIO, GP11)
                            Store (0x02, GPL1)
                        }

                        Return (CRS)
                    }
                }

                Name (DCAT, Package (0x15)
                {
                    0x02, 
                    0x03, 
                    One, 
                    Zero, 
                    0xFF, 
                    0x07, 
                    0xFF, 
                    0xFF, 
                    0x07, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0xFF, 
                    0xFF
                })
                Mutex (IOCF, 0x00)
                Method (ENFG, 1, NotSerialized)
                {
                    Acquire (IOCF, 0xFFFF)
                    Store (0x87, INDX)
                    Store (0x87, INDX)
                    Store (Arg0, LDN)
                }

                Method (EXFG, 0, NotSerialized)
                {
                    Store (0xAA, INDX)
                    Release (IOCF)
                }

                Method (LPTM, 1, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    And (OPT0, 0x02, Local0)
                    EXFG ()
                    Return (Local0)
                }

                Method (UHID, 1, NotSerialized)
                {
                    If (LEqual (Arg0, One))
                    {
                        ENFG (CGLD (Arg0))
                        And (OPT1, 0x38, Local0)
                        EXFG ()
                        If (Local0)
                        {
                            Return (0x1005D041)
                        }
                    }

                    Return (0x0105D041)
                }

                Method (SIOK, 1, NotSerialized)
                {
                    ENFG (0x0A)
                    And (CRE0, 0x9F, CRE0)
                    And (CRE4, 0xF3, CRE4)
                    If (LAnd (Arg0, LNotEqual (Arg0, 0x05)))
                    {
                        If (KBFG)
                        {
                            Or (CRE0, 0x41, CRE0)
                        }

                        If (MSFG)
                        {
                            Or (CRE0, 0x22, CRE0)
                            Or (CRE6, 0x80, CRE6)
                        }

                        If (LEqual (Arg0, One))
                        {
                            Or (CRE4, 0x0C, CRE4)
                        }
                        Else
                        {
                            Or (CRE4, 0x10, CRE4)
                        }
                    }

                    Store (CRE3, Local0)
                    EXFG ()
                }

                Method (SIOS, 1, NotSerialized)
                {
                    Store ("SIOS", Debug)
                    SIOK (Arg0)
                }

                Method (SIOW, 1, NotSerialized)
                {
                    Store ("SIOW", Debug)
                    SIOK (Zero)
                }

                Method (SIOH, 0, NotSerialized)
                {
                    Store ("SIOH", Debug)
                    ENFG (0x0A)
                    If (And (OPT3, 0x10))
                    {
                        Notify (PS2K, 0x02)
                    }

                    If (And (OPT3, 0x20))
                    {
                        Notify (PS2M, 0x02)
                    }

                    EXFG ()
                    SIOK (Zero)
                }

                OperationRegion (IOID, SystemIO, SPIO, 0x02)
                Field (IOID, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x07), 
                    LDN,    8, 
                            Offset (0x22), 
                    FDCP,   1, 
                        ,   2, 
                    LPTP,   1, 
                    URAP,   1, 
                    URBP,   1, 
                            Offset (0x30), 
                    ACTR,   8, 
                            Offset (0x60), 
                    IOAH,   8, 
                    IOAL,   8, 
                    IOH2,   8, 
                    IOL2,   8, 
                            Offset (0x70), 
                    INTR,   4, 
                            Offset (0x74), 
                    DMCH,   3, 
                            Offset (0xE0), 
                    CRE0,   8, 
                    CRE1,   8, 
                    CRE2,   8, 
                    CRE3,   8, 
                    CRE4,   8, 
                    CRE5,   8, 
                    CRE6,   8, 
                            Offset (0xF0), 
                    OPT0,   8, 
                    OPT1,   8, 
                    OPT2,   8, 
                    OPT3,   8, 
                    OPT4,   8, 
                    OPT5,   8, 
                    OPT6,   8, 
                            Offset (0xF9), 
                    OPT9,   8
                }

                Method (CGLD, 1, NotSerialized)
                {
                    Return (DerefOf (Index (DCAT, Arg0)))
                }

                Method (DSTA, 1, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    Store (ACTR, Local0)
                    EXFG ()
                    If (LEqual (Local0, 0xFF))
                    {
                        Return (Zero)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        ShiftRight (Local0, 0x02, Local0)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        ShiftRight (Local0, One, Local0)
                    }

                    And (Local0, One, Local0)
                    Or (IOST, ShiftLeft (Local0, Arg0), IOST)
                    If (Local0)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        If (And (ShiftLeft (One, Arg0), IOST))
                        {
                            Return (0x0D)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Method (DCNT, 2, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    If (LEqual (Arg0, 0x05))
                    {
                        ShiftLeft (IOH2, 0x08, Local1)
                        Or (IOL2, Local1, Local1)
                    }
                    Else
                    {
                        ShiftLeft (IOAH, 0x08, Local1)
                        Or (IOAL, Local1, Local1)
                    }

                    RRIO (Arg0, Arg1, Local1, 0x08)
                    If (LAnd (LLess (DMCH, 0x04), LNotEqual (And (DMCH, 0x03, 
                        Local1), Zero)))
                    {
                        RDMA (Arg0, Arg1, Increment (Local1))
                    }

                    Store (Arg1, Local1)
                    Store (One, Local2)
                    If (LEqual (Arg0, 0x05))
                    {
                        ShiftLeft (Arg1, 0x02, Local1)
                        ShiftLeft (Local2, 0x02, Local2)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        ShiftLeft (Arg1, One, Local1)
                        ShiftLeft (Local2, One, Local2)
                    }

                    Store (ACTR, Local0)
                    Not (Local2, Local3)
                    And (Local0, Local3, Local0)
                    Or (Local0, Local1, Local0)
                    Store (Local0, ACTR)
                    EXFG ()
                }

                Name (CRS1, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {}
                    DMA (Compatibility, NotBusMaster, Transfer8, _Y0F)
                        {}
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x00,               // Length
                        _Y10)
                })
                CreateWordField (CRS1, One, IRQM)
                CreateByteField (CRS1, \_SB.PCI0.LPCB._Y0F._DMA, DMAM)
                CreateWordField (CRS1, \_SB.PCI0.LPCB._Y10._MIN, IO11)
                CreateWordField (CRS1, \_SB.PCI0.LPCB._Y10._MAX, IO12)
                CreateByteField (CRS1, \_SB.PCI0.LPCB._Y10._LEN, LEN1)
                Name (CRS2, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {6}
                    DMA (Compatibility, NotBusMaster, Transfer8, _Y11)
                        {2}
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x00,               // Length
                        _Y12)
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x00,               // Length
                        _Y13)
                })
                CreateWordField (CRS2, One, IRQE)
                CreateByteField (CRS2, \_SB.PCI0.LPCB._Y11._DMA, DMAE)
                CreateWordField (CRS2, \_SB.PCI0.LPCB._Y12._MIN, IO21)
                CreateWordField (CRS2, \_SB.PCI0.LPCB._Y12._MAX, IO22)
                CreateByteField (CRS2, \_SB.PCI0.LPCB._Y12._LEN, LEN2)
                CreateWordField (CRS2, \_SB.PCI0.LPCB._Y13._MIN, IO31)
                CreateWordField (CRS2, \_SB.PCI0.LPCB._Y13._MAX, IO32)
                CreateByteField (CRS2, \_SB.PCI0.LPCB._Y13._LEN, LEN3)
                Method (DCRS, 2, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    ShiftLeft (IOAH, 0x08, IO11)
                    Or (IOAL, IO11, IO11)
                    Store (IO11, IO12)
                    Subtract (FindSetRightBit (IO11), One, Local0)
                    ShiftLeft (One, Local0, LEN1)
                    If (INTR)
                    {
                        ShiftLeft (One, INTR, IRQM)
                    }
                    Else
                    {
                        Store (Zero, IRQM)
                    }

                    If (LOr (LGreater (DMCH, 0x03), LEqual (Arg1, Zero)))
                    {
                        Store (Zero, DMAM)
                    }
                    Else
                    {
                        And (DMCH, 0x03, Local1)
                        ShiftLeft (One, Local1, DMAM)
                    }

                    EXFG ()
                    Return (CRS1)
                }

                Method (DSRS, 2, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQM)
                    CreateByteField (Arg0, 0x04, DMAM)
                    CreateWordField (Arg0, 0x08, IO11)
                    ENFG (CGLD (Arg1))
                    And (IO11, 0xFF, IOAL)
                    ShiftRight (IO11, 0x08, IOAH)
                    If (IRQM)
                    {
                        FindSetRightBit (IRQM, Local0)
                        Subtract (Local0, One, INTR)
                    }
                    Else
                    {
                        Store (Zero, INTR)
                    }

                    If (DMAM)
                    {
                        FindSetRightBit (DMAM, Local0)
                        Subtract (Local0, One, DMCH)
                    }
                    Else
                    {
                        Store (0x07, DMCH)
                    }

                    EXFG ()
                    DCNT (Arg1, One)
                }

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, Zero)
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y14)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y15)
                    })
                    Name (CRS1, ResourceTemplate ()
                    {
                        FixedIO (
                            0x0060,             // Address
                            0x01,               // Length
                            )
                        FixedIO (
                            0x0064,             // Address
                            0x01,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y16)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y17)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (APIC)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.LDRC._Y14._LEN, ML01)
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.LDRC._Y14._BAS, MB01)
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.LDRC._Y15._LEN, ML02)
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.LDRC._Y15._BAS, MB02)
                            Store (0xFEC00000, MB01)
                            Store (0x1000, ML01)
                            Store (0xFEE00000, MB02)
                            Store (0x1000, ML02)
                            CreateDWordField (CRS1, \_SB.PCI0.LPCB.LDRC._Y16._LEN, ML03)
                            CreateDWordField (CRS1, \_SB.PCI0.LPCB.LDRC._Y16._BAS, MB03)
                            CreateDWordField (CRS1, \_SB.PCI0.LPCB.LDRC._Y17._LEN, ML04)
                            CreateDWordField (CRS1, \_SB.PCI0.LPCB.LDRC._Y17._BAS, MB04)
                            Store (0xFEC00000, MB03)
                            Store (0x1000, ML03)
                            Store (0xFEE00000, MB04)
                            Store (0x1000, ML04)
                        }

                        ShiftLeft (0x05, 0x0A, Local0)
                        If (And (IOST, Local0))
                        {
                            Return (CRS)
                        }
                        Else
                        {
                            Return (CRS1)
                        }
                    }
                }

                Device (^^RMEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Name (_UID, One)
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x000A0000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y18)
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            _Y19)
                        Memory32Fixed (ReadWrite,
                            0x00100000,         // Address Base
                            0x00000000,         // Address Length
                            _Y1A)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y1B)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (CRS, \_SB.RMEM._Y18._BAS, BAS1)
                        CreateDWordField (CRS, \_SB.RMEM._Y18._LEN, LEN1)
                        CreateDWordField (CRS, \_SB.RMEM._Y19._BAS, BAS2)
                        CreateDWordField (CRS, \_SB.RMEM._Y19._LEN, LEN2)
                        CreateDWordField (CRS, \_SB.RMEM._Y1A._LEN, LEN3)
                        CreateDWordField (CRS, \_SB.RMEM._Y1B._BAS, BAS4)
                        CreateDWordField (CRS, \_SB.RMEM._Y1B._LEN, LEN4)
                        If (OSFL ()) {}
                        Else
                        {
                            If (MG1B)
                            {
                                If (LGreater (MG1B, 0x000C0000))
                                {
                                    Store (0x000C0000, BAS1)
                                    Subtract (MG1B, BAS1, LEN1)
                                }
                            }
                            Else
                            {
                                Store (0x000C0000, BAS1)
                                Store (0x00020000, LEN1)
                            }

                            If (Add (MG1B, MG1L, Local0))
                            {
                                Store (Local0, BAS2)
                                Subtract (0x00100000, BAS2, LEN2)
                            }
                        }

                        Subtract (MG2B, 0x00100000, LEN3)
                        Store (MH1B, BAS4)
                        Subtract (Zero, BAS4, LEN4)
                        Return (CRS)
                    }
                }

                Device (UAR1)
                {
                    Name (_UID, One)
                    Name (_HID, EisaId ("PNP0501"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (DSTA (Zero))
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        DCNT (Zero, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Return (DCRS (Zero, Zero))
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        DSRS (Arg0, Zero)
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (CMPR)
                    }

                    Name (CMPR, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                }

                Method (UAR1._PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x26, 0x04))
                }
            }

            Device (IMAP)
            {
                Name (_ADR, 0x00030001)
                OperationRegion (PIMC, PCI_Config, 0x60, 0x54)
                Field (PIMC, ByteAcc, NoLock, Preserve)
                {
                    PIID,   8, 
                            Offset (0x04), 
                    PILN,   8, 
                            Offset (0x08), 
                    PIU0,   8, 
                    PIU2,   8, 
                    UBR1,   8, 
                    UBR2,   8, 
                            Offset (0x0D), 
                            Offset (0x0E), 
                    PIRM,   8, 
                    PMUD,   8, 
                    PAZA,   8, 
                    GPUR,   8, 
                    PR0E,   8, 
                            Offset (0x14), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                            Offset (0x1C), 
                    P0EA,   8, 
                    P0EB,   8, 
                    P0EC,   8, 
                    P0ED,   8, 
                    P1EA,   8, 
                    P1EB,   8, 
                    P1EC,   8, 
                    P1ED,   8, 
                    P2EA,   8, 
                    P2EB,   8, 
                    P2EC,   8, 
                    P2ED,   8, 
                    P3EA,   8, 
                    P3EB,   8, 
                    P3EC,   8, 
                    P3ED,   8, 
                    P4EA,   8, 
                    P4EB,   8, 
                    P4EC,   8, 
                    P4ED,   8, 
                    P5EA,   8, 
                    P5EB,   8, 
                    P5EC,   8, 
                    P5ED,   8, 
                    P6EA,   8, 
                    P6EB,   8, 
                    P6EC,   8, 
                    P6ED,   8, 
                    P7EA,   8, 
                    P7EB,   8, 
                    P7EC,   8, 
                    P7ED,   8, 
                            Offset (0x4C), 
                    XVE0,   8, 
                    XVE1,   8, 
                    XVE2,   8, 
                    XVE3,   8, 
                    XVE4,   8, 
                    XVE5,   8, 
                    XVE6,   8, 
                    XVE7,   8
                }
            }

            Device (SBUS)
            {
                Name (_ADR, 0x00030002)
                OperationRegion (SMAD, PCI_Config, 0x20, 0x08)
                Field (SMAD, DWordAcc, NoLock, Preserve)
                {
                    SB1,    32, 
                    SB2,    32
                }

                OperationRegion (SMCF, PCI_Config, 0x48, 0x10)
                Field (SMCF, DWordAcc, NoLock, Preserve)
                {
                    SMPM,   4, 
                    SMT1,   28, 
                    SMT2,   32
                }

                OperationRegion (SME4, PCI_Config, 0xE4, 0x04)
                Field (SME4, AnyAcc, NoLock, Preserve)
                {
                        ,   17, 
                    XPME,   1
                }

                Method (GPMD, 1, NotSerialized)
                {
                    Store (Arg0, XPME)
                }

                Method (SMBB, 0, NotSerialized)
                {
                    And (SB1, 0xFFFE, Local0)
                    Return (Local0)
                }

                Scope (^^PCI0)
                {
                    OperationRegion (SM00, SystemIO, SBUS.SMBB (), 0x40)
                    Field (SM00, ByteAcc, NoLock, Preserve)
                    {
                        CTLR,   8, 
                        HSTS,   8, 
                        ADDR,   8, 
                        CMDR,   8, 
                        DAT0,   8, 
                        DAT1,   8, 
                                Offset (0x25), 
                        ALAD,   8, 
                        ALDL,   8, 
                        ALDH,   8
                    }

                    Field (SM00, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x04), 
                        SB32,   256
                    }

                    Method (SWFS, 0, NotSerialized)
                    {
                        And (HSTS, 0x80, Local0)
                        While (LEqual (Local0, Zero))
                        {
                            Stall (One)
                            And (HSTS, 0x80, Local0)
                        }
                    }

                    Method (SRBY, 2, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (0x04, CTLR)
                        SWFS ()
                    }

                    Method (WBYT, 3, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (Arg2, DAT0)
                        Store (0x06, CTLR)
                        SWFS ()
                    }

                    Method (SMWW, 4, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (Arg2, DAT0)
                        Store (Arg3, DAT1)
                        Store (0x08, CTLR)
                        SWFS ()
                    }

                    Method (RBYT, 2, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (0x07, CTLR)
                        SWFS ()
                        Return (DAT0)
                    }

                    Method (SMRW, 2, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (0x09, CTLR)
                        SWFS ()
                        Store (DAT0, Local0)
                        ShiftLeft (DAT1, 0x08, Local1)
                        Or (Local0, Local1, Local2)
                        Return (Local2)
                    }

                    Method (SMRB, 2, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (0x0B, CTLR)
                        SWFS ()
                        Return (SB32)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }
            }

            Device (TRIM)
            {
                Name (_ADR, 0x00030004)
            }
            Device (P4MI)
            {
                Name (_ADR, 0x00030003)
            }
            Device (NVPM)
            {
                Name (_ADR, 0x00030005)
            }
            Device (OHC1)
            {
                Name (_ADR, 0x00040000)
                Name (_S1D, One)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (EHC1)
            {
                Name (_ADR, 0x00040001)
                Name (_S1D, One)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x05, 0x04))
                }
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00060000)
                Name (_S1D, One)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x18, 0x04))
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x00060001)
                Name (_S1D, One)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x17, 0x04))
                }
            }

            Device (GIGE)
            {
                Name (_ADR, 0x000A0000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x05
                })
                Scope (\_GPE)
                {
                    Method (_L0B, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.GIGE, 0x02)
                        Notify (\_SB.PWRB, 0x02)
                    }
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x000B0000)
                Device (PRI0)
                {
                    Name (_ADR, Zero)
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x17, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SPTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Concatenate (Local0, FZTF))
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                }, Local0)
                            Return (Concatenate (Local0, FZTF))
                        }
                    }
                }

                Device (SEC0)
                {
                    Name (_ADR, One)
                    Name (SSTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x17, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SSTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SSTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Concatenate (Local0, FZTF))
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                }, Local0)
                            Return (Concatenate (Local0, FZTF))
                        }
                    }
                }

                Method (DRMP, 0, NotSerialized)
                {
                    Store (0x08, Local0)
                    ShiftRight (CPB0, Local0, Local1)
                    And (Local1, 0x3F, Local0)
                    Return (Local0)
                }
            }

            Device (PBB0)
            {
                Name (_ADR, 0x00090000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (Zero, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR01)
                    }

                    Return (PR01)
                }
            }

            Device (HDAC)
            {
                Name (_ADR, 0x00080000)
                Name (SCID, Zero)
                Name (SACW, Zero)
                Method (_PS0, 0, NotSerialized)
                {
                    If (SCID)
                    {
                        Store (Zero, PMDS)
                        Store (Zero, PMEN)
                        Store (SCID, CDID)
                        Store (SACW, AOCW)
                    }
                }

                Method (_PS3, 0, NotSerialized)
                {
                    Store (AOCW, SACW)
                    Store (CDID, SCID)
                    Store (One, PMST)
                    Store (0x03, PMDS)
                    Store (One, PMEN)
                }

                OperationRegion (PMCF, PCI_Config, 0x48, 0x02)
                Field (PMCF, ByteAcc, NoLock, Preserve)
                {
                    PMDS,   2, 
                            Offset (0x01), 
                    PMEN,   1, 
                        ,   6, 
                    PMST,   1
                }

                OperationRegion (DCF2, PCI_Config, 0xE0, 0x08)
                Field (DCF2, ByteAcc, NoLock, Preserve)
                {
                    AOCW,   32, 
                            Offset (0x06), 
                    CDID,   8
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x15, 0x04))
                }
            }

            Device (IXVE)
            {
                Name (_ADR, 0x00100000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR02)
                    }

                    Return (PR02)
                }

                Device (IGPU)
                {
                    Name (_ADR, Zero)
                }
            }

            Device (XVR0)
            {
                Name (_ADR, 0x000C0000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x11, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR03)
                    }

                    Return (PR03)
                }

                Device (XVS0)
                {
                    Name (_ADR, 0xFFFF)
                }
            }

            Device (XVR1)
            {
                Name (_ADR, 0x000D0000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x11, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }

                Device (XVS1)
                {
                    Name (_ADR, 0xFFFF)
                }
            }

            Device (P0P5)
            {
                Name (_ADR, 0x000E0000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x11, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR05)
                    }

                    Return (PR05)
                }
            }
            Device (MCH2)
            {
                Name (_ADR, 0x00000001)
            }
			Device (MCHC)
            {
                Name (_ADR, Zero)
            }
            Device (RP04)
            {
                Name (_ADR, 0x00150000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x11, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR06)
                    }

                    Return (PR06)
                }
            }

            Device (P0P7)
            {
                Name (_ADR, 0x00160000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x11, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR07)
                    }

                    Return (PR07)
                }

                Device (JMF0)
                {
                    Name (_ADR, Zero)
                    OperationRegion (CF40, PCI_Config, 0x40, 0x04)
                    Field (CF40, ByteAcc, NoLock, Preserve)
                    {
                        CHE0,   1, 
                        FUN1,   1, 
                            ,   1, 
                        CAB0,   1, 
                        CHE1,   1, 
                                Offset (0x01), 
                        AHEN,   1, 
                            ,   3, 
                        PRT0,   1, 
                        AHM0,   1, 
                        PRT1,   1, 
                        AHM1,   1, 
                        CF42,   6, 
                        SWAP,   1, 
                        PATA,   1, 
                            ,   6, 
                        WTEN,   1, 
                                Offset (0x04)
                    }

                    Name (PIOT, Package (0x05)
                    {
                        0x0258, 
                        0x0186, 
                        0x014A, 
                        0xB4, 
                        0x78
                    })
                    Name (UDMA, Package (0x07)
                    {
                        0x78, 
                        0x50, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14, 
                        0x0F
                    })
                    Name (MDMA, Package (0x03)
                    {
                        0x01E0, 
                        0x96, 
                        0x78
                    })
                    Name (IDEB, Buffer (0x14) {})
                    CreateDWordField (IDEB, Zero, GTM0)
                    CreateDWordField (IDEB, 0x04, GTM1)
                    CreateDWordField (IDEB, 0x08, GTM2)
                    CreateDWordField (IDEB, 0x0C, GTM3)
                    CreateDWordField (IDEB, 0x10, GTM4)
                    Name (PIO0, 0x04)
                    Name (DMA0, 0x06)
                    Name (MDA0, 0x02)
                    Name (PIO1, 0x04)
                    Name (DMA1, 0x06)
                    Name (MDA1, 0x02)
                    Name (PIO2, 0x04)
                    Name (DMA2, 0x06)
                    Name (MDA2, 0x02)
                    Name (PIO3, 0x04)
                    Name (DMA3, 0x06)
                    Name (MDA3, 0x02)
                    Name (FLGP, 0x1F)
                    Name (FLGS, 0x1F)
                    Device (IDE0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTM, 0, NotSerialized)
                        {
                            Store (DerefOf (Index (PIOT, PIO0)), Local0)
                            Store (DerefOf (Index (PIOT, PIO1)), Local2)
                            Store (0x1A, Local4)
                            If (LAnd (FLGP, One))
                            {
                                If (LNot (FUN1))
                                {
                                    If (LAnd (CAB0, SWAP))
                                    {
                                        Store (0x02, DMA0)
                                    }
                                }

                                Store (DerefOf (Index (UDMA, DMA0)), Local1)
                                Or (Local4, One, Local4)
                            }
                            Else
                            {
                                Store (DerefOf (Index (MDMA, MDA0)), Local1)
                            }

                            If (LAnd (FLGP, 0x04))
                            {
                                If (LAnd (CAB0, SWAP))
                                {
                                    Store (0x02, DMA1)
                                }

                                Store (DerefOf (Index (UDMA, DMA1)), Local3)
                                Or (Local4, 0x04, Local4)
                            }
                            Else
                            {
                                Store (DerefOf (Index (MDMA, MDA1)), Local3)
                            }

                            Store (Local0, GTM0)
                            Store (Local1, GTM1)
                            Store (Local2, GTM2)
                            Store (Local3, GTM3)
                            Store (Local4, GTM4)
                            Return (IDEB)
                        }

                        Method (_STM, 3, NotSerialized)
                        {
                            Store (Arg0, IDEB)
                            Store (GTM0, Local0)
                            Store (GTM1, Local1)
                            Store (GTM2, Local2)
                            Store (GTM3, Local3)
                            Store (GTM4, Local4)
                            Store (Local4, FLGP)
                            If (LAnd (LNotEqual (Local0, Ones), LNotEqual (Local0, Zero)))
                            {
                                Store (Match (PIOT, MEQ, Local0, MTR, Zero, Zero), PIO0)
                            }

                            If (LAnd (LNotEqual (Local1, Ones), LNotEqual (Local1, Zero)))
                            {
                                If (LAnd (FLGP, One))
                                {
                                    Store (Match (UDMA, MEQ, Local1, MTR, Zero, Zero), DMA0)
                                }
                                Else
                                {
                                    Store (Match (MDMA, MEQ, Local1, MTR, Zero, Zero), MDA0)
                                }
                            }

                            If (LAnd (LNotEqual (Local2, Ones), LNotEqual (Local2, Zero)))
                            {
                                Store (Match (PIOT, MEQ, Local2, MTR, Zero, Zero), PIO1)
                            }

                            If (LAnd (LNotEqual (Local3, Ones), LNotEqual (Local3, Zero)))
                            {
                                If (LAnd (FLGP, 0x04))
                                {
                                    Store (Match (UDMA, MEQ, Local3, MTR, Zero, Zero), DMA1)
                                }
                                Else
                                {
                                    Store (Match (MDMA, MEQ, Local3, MTR, Zero, Zero), MDA1)
                                }
                            }
                        }

                        Device (DRV0)
                        {
                            Name (_ADR, Zero)
                            Method (_GTF, 0, NotSerialized)
                            {
                                Store (Buffer (0x07)
                                    {
                                        0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                    }, Local0)
                                Store (Buffer (0x07)
                                    {
                                        0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                    }, Local1)
                                CreateByteField (Local0, One, PIOM)
                                CreateByteField (Local1, One, DMAM)
                                Store (PIO0, PIOM)
                                Or (PIOM, 0x08, PIOM)
                                If (LAnd (FLGP, One))
                                {
                                    Store (DMA0, DMAM)
                                    Or (DMAM, 0x40, DMAM)
                                }
                                Else
                                {
                                    Store (MDA0, DMAM)
                                    Or (DMAM, 0x20, DMAM)
                                }

                                Concatenate (Local0, Local1, Local2)
                                Return (Local2)
                            }
                        }

                        Device (DRV1)
                        {
                            Name (_ADR, One)
                            Method (_GTF, 0, NotSerialized)
                            {
                                Store (Buffer (0x07)
                                    {
                                        0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                    }, Local0)
                                Store (Buffer (0x07)
                                    {
                                        0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                    }, Local1)
                                CreateByteField (Local0, One, PIOM)
                                CreateByteField (Local1, One, DMAM)
                                Store (PIO1, PIOM)
                                Or (PIOM, 0x08, PIOM)
                                If (LAnd (FLGP, 0x04))
                                {
                                    Store (DMA1, DMAM)
                                    Or (DMAM, 0x40, DMAM)
                                }
                                Else
                                {
                                    Store (MDA1, DMAM)
                                    Or (DMAM, 0x20, DMAM)
                                }

                                Concatenate (Local0, Local1, Local2)
                                Return (Local2)
                            }
                        }
                    }

                    Device (IDE1)
                    {
                        Name (_ADR, One)
                        Method (_GTM, 0, NotSerialized)
                        {
                            Store (DerefOf (Index (PIOT, PIO2)), Local0)
                            Store (DerefOf (Index (PIOT, PIO3)), Local2)
                            Store (0x1A, Local4)
                            If (LAnd (FLGS, One))
                            {
                                If (LNot (FUN1))
                                {
                                    If (LAnd (CAB0, LNot (SWAP)))
                                    {
                                        Store (0x02, DMA2)
                                    }
                                }

                                Store (DerefOf (Index (UDMA, DMA2)), Local1)
                                Or (Local4, One, Local4)
                            }
                            Else
                            {
                                Store (DerefOf (Index (MDMA, MDA2)), Local1)
                            }

                            If (LAnd (FLGS, 0x04))
                            {
                                If (LAnd (CAB0, LNot (SWAP)))
                                {
                                    Store (0x02, DMA3)
                                }

                                Store (DerefOf (Index (UDMA, DMA3)), Local3)
                                Or (Local4, 0x04, Local4)
                            }
                            Else
                            {
                                Store (DerefOf (Index (MDMA, MDA3)), Local3)
                            }

                            Store (Local0, GTM0)
                            Store (Local1, GTM1)
                            Store (Local2, GTM2)
                            Store (Local3, GTM3)
                            Store (Local4, GTM4)
                            Return (IDEB)
                        }

                        Method (_STM, 3, NotSerialized)
                        {
                            Store (Arg0, IDEB)
                            Store (GTM0, Local0)
                            Store (GTM1, Local1)
                            Store (GTM2, Local2)
                            Store (GTM3, Local3)
                            Store (GTM4, Local4)
                            Store (Local4, FLGS)
                            If (LAnd (LNotEqual (Local0, Ones), LNotEqual (Local0, Zero)))
                            {
                                Store (Match (PIOT, MEQ, Local0, MTR, Zero, Zero), PIO2)
                            }

                            If (LAnd (LNotEqual (Local1, Ones), LNotEqual (Local1, Zero)))
                            {
                                If (LAnd (FLGS, One))
                                {
                                    Store (Match (UDMA, MEQ, Local1, MTR, Zero, Zero), DMA2)
                                }
                                Else
                                {
                                    Store (Match (MDMA, MEQ, Local1, MTR, Zero, Zero), MDA2)
                                }
                            }

                            If (LAnd (LNotEqual (Local2, Ones), LNotEqual (Local2, Zero)))
                            {
                                Store (Match (PIOT, MEQ, Local2, MTR, Zero, Zero), PIO3)
                            }

                            If (LAnd (LNotEqual (Local3, Ones), LNotEqual (Local3, Zero)))
                            {
                                If (LAnd (FLGS, 0x04))
                                {
                                    Store (Match (UDMA, MEQ, Local3, MTR, Zero, Zero), DMA3)
                                }
                                Else
                                {
                                    Store (Match (MDMA, MEQ, Local3, MTR, Zero, Zero), MDA3)
                                }
                            }
                        }

                        Device (DRV0)
                        {
                            Name (_ADR, Zero)
                            Method (_GTF, 0, NotSerialized)
                            {
                                Store (Buffer (0x07)
                                    {
                                        0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                    }, Local0)
                                Store (Buffer (0x07)
                                    {
                                        0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                    }, Local1)
                                CreateByteField (Local0, One, PIOM)
                                CreateByteField (Local1, One, DMAM)
                                Store (PIO2, PIOM)
                                Or (PIOM, 0x08, PIOM)
                                If (LAnd (FLGS, One))
                                {
                                    Store (DMA2, DMAM)
                                    Or (DMAM, 0x40, DMAM)
                                }
                                Else
                                {
                                    Store (MDA2, DMAM)
                                    Or (DMAM, 0x20, DMAM)
                                }

                                Concatenate (Local0, Local1, Local2)
                                Return (Local2)
                            }
                        }

                        Device (DRV1)
                        {
                            Name (_ADR, One)
                            Method (_GTF, 0, NotSerialized)
                            {
                                Store (Buffer (0x07)
                                    {
                                        0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                    }, Local0)
                                Store (Buffer (0x07)
                                    {
                                        0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                    }, Local1)
                                CreateByteField (Local0, One, PIOM)
                                CreateByteField (Local1, One, DMAM)
                                Store (PIO3, PIOM)
                                Or (PIOM, 0x08, PIOM)
                                If (LAnd (FLGS, 0x04))
                                {
                                    Store (DMA3, DMAM)
                                    Or (DMAM, 0x40, DMAM)
                                }
                                Else
                                {
                                    Store (MDA3, DMAM)
                                    Or (DMAM, 0x20, DMAM)
                                }

                                Concatenate (Local0, Local1, Local2)
                                Return (Local2)
                            }
                        }
                    }
                }
            }

            Device (P0P8)
            {
                Name (_ADR, 0x00170000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x11, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR08)
                    }

                    Return (PR08)
                }
            }

            Device (P0P9)
            {
                Name (_ADR, 0x00180000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x11, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR09)
                    }

                    Return (PR09)
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L10, 0, NotSerialized)
            {
                \_SB.PCI0.LPCB.SIOH ()
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L26, 0, NotSerialized)
            {
                \_SB.PCI0.LPCB.SIOH ()
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L09, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.SBUS, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0D, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.OHC1, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L05, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.EHC1, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L18, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.OHC2, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L17, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.EHC2, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L00, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.PBB0, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L15, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.HDAC, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L11, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.XVR0, 0x02)
                Notify (\_SB.PCI0.XVR1, 0x02)
                Notify (\_SB.PCI0.P0P5, 0x02)
                Notify (\_SB.PCI0.RP04, 0x02)
                Notify (\_SB.PCI0.P0P7, 0x02)
                Notify (\_SB.PCI0.P0P8, 0x02)
                Notify (\_SB.PCI0.P0P9, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
            Name (_UID, 0xAA)
            Name (_STA, 0x0B)
        }
    }

    Scope (_SB.PCI0.LPCB.ASOC)
    {
        Method (INI0, 0, NotSerialized)
        {
        }

        Name (G0T3, Package (0x07)
        {
            0x00070005, 
            "New CPU Installed", 
            One, 
            Zero, 
            Zero, 
            One, 
            0x02
        })
        Name (GRP0, Package (0x01)
        {
            G0T3
        })
        Method (GIT0, 1, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, 0x05))
            {
                Store (GNVS (0x1334), ASB1)
            }
            Else
            {
                Store (Zero, ASB0)
            }
        }

        Method (SIT0, 3, NotSerialized)
        {
            If (And (Arg2, 0xFFFF))
            {
                Name (T_0, Zero)
                Store (And (Arg0, 0xFFFF), T_0)
                If (LEqual (T_0, 0x05))
                {
                    SNVS (0x1334, Arg1)
                    Store (0x03, ASB0)
                }
                Else
                {
                    Store (Zero, ASB0)
                }
            }
            Else
            {
                Store (0x03, ASB0)
            }
        }
    }

    Scope (_SB.PCI0.LPCB.ASOC)
    {
        Method (INI4, 0, NotSerialized)
        {
        }

        Name (G4T0, Package (0x04)
        {
            0x04070010, 
            "CPU Q-FAN Control", 
            0x80000000, 
            Zero
        })
        Name (G4T1, Package (0x08)
        {
            0x04080011, 
            "CPU Q-FAN Profile", 
            0x00100001, 
            Zero, 
            0x03, 
            "Optimal", 
            "Silent", 
            "Performance"
        })
        Name (G420, Package (0x04)
        {
            0x04070070, 
            "Chassis Q-FAN Control", 
            0x80000000, 
            Zero
        })
        Name (G421, Package (0x08)
        {
            0x04080071, 
            "Chassis Q-FAN Profile", 
            0x00710001, 
            Zero, 
            0x03, 
            "Optimal", 
            "Silent", 
            "Performance"
        })
        Name (GRP4, Package (0x04)
        {
            G4T0, 
            G4T1, 
            G420, 
            G421
        })
        Method (GIT4, 1, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, 0x10))
            {
                Store (GNVS (0x15F3), ASB1)
            }
            Else
            {
                If (LEqual (T_0, 0x11))
                {
                    Store (GNVS (0x256A), ASB1)
                }
                Else
                {
                    If (LEqual (T_0, 0x70))
                    {
                        Store (GNVS (0x15F6), ASB1)
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x71))
                        {
                            Store (GNVS (0x256C), ASB1)
                        }
                        Else
                        {
                            Store (Zero, ASB0)
                        }
                    }
                }
            }
        }

        Method (SIT4, 3, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, 0x10))
            {
                If (LNotEqual (GNVS (0x15F3), Arg1))
                {
                    If (And (Arg2, One))
                    {
                        SNVS (0x15F3, Arg1)
                    }

                    Or (ASB0, 0x02, ASB0)
                }
            }
            Else
            {
                If (LEqual (T_0, 0x11))
                {
                    If (LNotEqual (GNVS (0x256A), Arg1))
                    {
                        If (And (Arg2, One))
                        {
                            SNVS (0x256A, Arg1)
                        }

                        Or (ASB0, 0x02, ASB0)
                    }
                }
                Else
                {
                    If (LEqual (T_0, 0x70))
                    {
                        If (LNotEqual (GNVS (0x15F6), Arg1))
                        {
                            If (And (Arg2, One))
                            {
                                SNVS (0x15F6, Arg1)
                            }

                            Or (ASB0, 0x02, ASB0)
                        }
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x71))
                        {
                            If (LNotEqual (GNVS (0x256C), Arg1))
                            {
                                If (And (Arg2, One))
                                {
                                    SNVS (0x256C, Arg1)
                                }

                                Or (ASB0, 0x02, ASB0)
                            }
                        }
                        Else
                        {
                            Store (Zero, ASB0)
                        }
                    }
                }
            }
        }
    }

    Scope (_SB.PCI0.LPCB.ASOC)
    {
        Method (INI6, 0, NotSerialized)
        {
        }

        Name (G6T1, Package (0x07)
        {
            0x06020011, 
            "Vcore Voltage", 
            0x20000000, 
            Zero, 
            0x0352, 
            0x02EE, 
            0x02
        })
        Name (G6T2, Package (0x07)
        {
            0x06030012, 
            "CPU Temperature", 
            0x20000000, 
            Zero, 
            0x0258, 
            0x015E, 
            0x02
        })
        Name (G6T3, Package (0x07)
        {
            0x06040013, 
            "CPU FAN Speed", 
            0x20000000, 
            Zero, 
            0x0258, 
            0x1900, 
            0x02
        })
        Name (G6T4, Package (0x07)
        {
            0x06040073, 
            "Chassis FAN Speed", 
            0x20000000, 
            Zero, 
            0x0258, 
            0x1900, 
            0x02
        })
        Name (G6T5, Package (0x07)
        {
            0x060400C3, 
            "Power FAN Speed", 
            0x20000000, 
            Zero, 
            0x0258, 
            0x1900, 
            0x02
        })
        Name (G6T6, Package (0x07)
        {
            0x06020061, 
            "+12V Voltage", 
            0x20000000, 
            0x2EE0, 
            0x27D8, 
            0x0E10, 
            0x02
        })
        Name (G6T7, Package (0x07)
        {
            0x06020062, 
            "+5V Voltage", 
            0x20000000, 
            0x1388, 
            0x1194, 
            0x03E8, 
            0x02
        })
        Name (G6T8, Package (0x07)
        {
            0x06020063, 
            "+3.3V Voltage", 
            0x20000000, 
            0x0CE4, 
            0x0B9A, 
            0x0294, 
            0x02
        })
        Name (G6T9, Package (0x07)
        {
            0x06030074, 
            "MB Temperature", 
            0x20000000, 
            Zero, 
            0x01C2, 
            0x01F4, 
            0x02
        })
        Name (GRP6, Package (0x09)
        {
            G6T1, 
            G6T2, 
            G6T3, 
            G6T4, 
            G6T5, 
            G6T6, 
            G6T7, 
            G6T8, 
            G6T9
        })
        Method (GIT6, 1, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, 0x11))
            {
                Store (0x0600, ASB1)
            }
            Else
            {
                If (LEqual (T_0, 0x12))
                {
                    Store (0x0601, ASB1)
                }
                Else
                {
                    If (LEqual (T_0, 0x13))
                    {
                        Store (0x0602, ASB1)
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x73))
                        {
                            Store (0x0603, ASB1)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0xC3))
                            {
                                Store (0x0604, ASB1)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x61))
                                {
                                    Store (0x0605, ASB1)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x62))
                                    {
                                        Store (0x0606, ASB1)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x63))
                                        {
                                            Store (0x0607, ASB1)
                                        }
                                        Else
                                        {
                                            If (LEqual (T_0, 0x74))
                                            {
                                                Store (0x0608, ASB1)
                                            }
                                            Else
                                            {
                                                Store (Zero, ASB0)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Method (SIT6, 3, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, 0x11))
            {
                Store (0x0600, DBG8)
            }
            Else
            {
                If (LEqual (T_0, 0x12))
                {
                    Store (0x0601, DBG8)
                }
                Else
                {
                    If (LEqual (T_0, 0x13))
                    {
                        Store (0x0602, DBG8)
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x73))
                        {
                            Store (0x0603, DBG8)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0xC3))
                            {
                                Store (0x0604, DBG8)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x61))
                                {
                                    Store (0x0605, DBG8)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x62))
                                    {
                                        Store (0x0606, DBG8)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x63))
                                        {
                                            Store (0x0607, DBG8)
                                        }
                                        Else
                                        {
                                            If (LEqual (T_0, 0x74))
                                            {
                                                Store (0x0608, DBG8)
                                            }
                                            Else
                                            {
                                                Store (Zero, ASB0)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Scope (_SB.PCI0.LPCB.ASOC)
    {
        Method (INI9, 0, NotSerialized)
        {
        }

        Name (G9T0, Package (0x0B)
        {
            0x09080000, 
            "AI Overclocking", 
            Zero, 
            One, 
            0x06, 
            "Manual", 
            "Auto", 
            "Standard", 
            Zero, 
            "N.O.S.", 
            Zero
        })
        Name (GRP9, Package (0x01)
        {
            G9T0
        })
        Method (GIT9, 1, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, Zero))
            {
                Store (GNVS (0x32D0), ASB1)
            }
            Else
            {
                Store (Zero, ASB0)
            }
        }

        Method (SIT9, 3, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, Zero))
            {
                If (LNotEqual (GNVS (0x32D0), Arg1))
                {
                    If (And (Arg2, One))
                    {
                        SNVS (0x32D0, Arg1)
                    }

                    Or (ASB0, 0x02, ASB0)
                }
            }
            Else
            {
                Store (Zero, ASB0)
            }
        }
    }

    Scope (_SB.PCI0.LPCB.ASOC)
    {
        Method (INIB, 0, NotSerialized)
        {
        }

        Name (GBT0, Package (0x07)
        {
            0x0B060001, 
            "System Performance", 
            Zero, 
            Zero, 
            0x03, 
            One, 
            0x04
        })
        Name (GBT1, Package (0x07)
        {
            0x0B060002, 
            "System Performance Control", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GBT2, Package (0x07)
        {
            0x0B060003, 
            "System GUI", 
            0x08, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GBT5, Package (0x07)
        {
            0x0B060010, 
            "Level Switch", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GBT8, Package (0x07)
        {
            0x0B060022, 
            "AI Gear load line select", 
            Zero, 
            Zero, 
            Zero, 
            One, 
            0x03
        })
        Name (GBT9, Package (0x07)
        {
            0x0B060023, 
            "AI Gear CPU voltage", 
            Zero, 
            Zero, 
            Zero, 
            One, 
            0x03
        })
        Name (GRPB, Package (0x06)
        {
            GBT0, 
            GBT1, 
            GBT2, 
            GBT5, 
            GBT8, 
            GBT9
        })
        Method (GITB, 1, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, One))
            {
                Store (And (DerefOf (Index (GBT0, 0x02)), 0xFFFF), ASB1)
            }
            Else
            {
                If (LEqual (T_0, 0x02))
                {
                    Store (DerefOf (Index (GBT1, 0x02)), ASB1)
                }
                Else
                {
                    If (LEqual (T_0, 0x03))
                    {
                        Store (DerefOf (Index (GBT2, 0x02)), ASB1)
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x22))
                        {
                            Store (GDEF (0x04), ASB1)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x23))
                            {
                                Store (GDEF (0x02), ASB1)
                            }
                            Else
                            {
                                Store (Zero, ASB0)
                            }
                        }
                    }
                }
            }
        }

        Method (SITB, 3, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, One))
            {
                Name (T_1, Zero)
                Store (And (Arg2, 0xFFFF), T_1)
                If (LEqual (T_1, Zero))
                {
                    Store (And (DerefOf (Index (GBT0, 0x02)), 0xFFFF), Local0)
                    If (LEqual (Local0, Zero))
                    {
                        Store (Local0, PAR0)
                    }
                }
                Else
                {
                    If (LEqual (T_1, One))
                    {
                        And (Arg1, 0xFFFF, Local0)
                        Store (Local0, Index (GBT0, 0x02))
                        Store (SICL (Local0), ASB0)
                        Store (Local0, PAR0)
                        ISMI (0x88)
                    }
                    Else
                    {
                        Store (Zero, ASB0)
                    }
                }
            }
            Else
            {
                If (LEqual (T_0, 0x02))
                {
                    Store (And (Arg1, 0xFF), Local0)
                    If (LEqual (STCG (Local0), One))
                    {
                        Store (Local0, Index (GBT1, 0x02))
                    }
                    Else
                    {
                        Store (Zero, ASB0)
                    }
                }
                Else
                {
                    If (LEqual (T_0, 0x10))
                    {
                        Store (And (Arg1, 0xFF), Local0)
                        AGLS (Local0)
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x22))
                        {
                            Store (And (Arg1, 0xFF), Local0)
                            AGLI (Local0)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x23))
                            {
                                Store (And (Arg1, 0xFF), Local0)
                                AGCV (Local0)
                            }
                            Else
                            {
                                Store (Zero, ASB0)
                            }
                        }
                    }
                }
            }
        }
    }

    Scope (_GPE)
    {
        Method (_L23, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.LPCB.ASOC, 0x05)
            If (LEqual (\_SB.PCI0.LPCB.ASOC.AIGC, One))
            {
                \_SB.PCI0.LPCB.ASOC.GITE (0x0E060001)
                \_SB.PCI0.LPCB.ASOC.SICL (Or (0x8010, \_SB.PCI0.LPCB.ASOC.ASB1))
            }

            \_SB.PCI0.LPCB.ASOC.RCAS ()
        }
    }

    OperationRegion (GPS0, SystemIO, GPBS, 0x40)
    Field (GPS0, ByteAcc, NoLock, Preserve)
    {
                Offset (0x04), 
        PWTH,   1
    }

    Scope (_SB.PCI0.LPCB.ASOC)
    {
        Method (INIE, 0, NotSerialized)
        {
        }

        Name (GET1, Package (0x07)
        {
            0x0E060001, 
            "OC Status", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET2, Package (0x07)
        {
            0x0E0A0011, 
            "ICPU Value", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET3, Package (0x07)
        {
            0x0E020012, 
            "VCPU Value", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET4, Package (0x07)
        {
            0x0E0B0013, 
            "PCPU Value", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET5, Package (0x07)
        {
            0x0E0A0014, 
            "OC Threshold1", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET6, Package (0x07)
        {
            0x0E0A0015, 
            "OC Threshold2", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GET7, Package (0x07)
        {
            0x0E0A0016, 
            "OC Threshold3", 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (GRPE, Package (0x07)
        {
            GET1, 
            GET2, 
            GET3, 
            GET4, 
            GET5, 
            GET6, 
            GET7
        })
        Name (ADP3, Package (0x0B)
        {
            0x40, 
            0xF5, 
            0xF1, 
            0x8B, 
            0x96, 
            0xEE, 
            0xEF, 
            0xF0, 
            0xDD, 
            0xDF, 
            0x03
        })
        Name (OCST, Buffer (0x04)
        {
            0x00, 0x01, 0x02, 0x03
        })
        Method (GITE, 1, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, One))
            {
                Store (DerefOf (Index (OCST, RBYT (DerefOf (Index (ADP3, Zero)), 
                    DerefOf (Index (ADP3, One))))), ASB1)
            }
            Else
            {
                If (LEqual (T_0, 0x11))
                {
                    Store (RBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 
                        0x02))), ASB1)
                }
                Else
                {
                    If (LEqual (T_0, 0x12))
                    {
                        Store (SMRW (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 
                            0x03))), ASB1)
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x13))
                        {
                            Store (SMRW (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 
                                0x04))), ASB1)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x14))
                            {
                                Store (RBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 
                                    0x05))), ASB1)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x15))
                                {
                                    Store (RBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 
                                        0x06))), ASB1)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x16))
                                    {
                                        Store (RBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 
                                            0x07))), ASB1)
                                    }
                                    Else
                                    {
                                        Store (Zero, ASB0)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Method (SITE, 3, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFFFF), T_0)
            If (LEqual (T_0, 0x14))
            {
                WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x05
                    )), Arg1)
            }
            Else
            {
                If (LEqual (T_0, 0x15))
                {
                    WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x06
                        )), Arg1)
                }
                Else
                {
                    If (LEqual (T_0, 0x16))
                    {
                        WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x07
                            )), Arg1)
                    }
                    Else
                    {
                        Store (Zero, ASB0)
                    }
                }
            }
        }

        Name (OLTB, Buffer (0x14)
        {
            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
            /* 0008 */    0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x00, 
            /* 0010 */    0x01, 0x01, 0x00, 0x01
        })
        Name (LDLE, Package (0x04)
        {
            Package (0x03)
            {
                0x19, 
                0x19, 
                0x19
            }, 

            Package (0x03)
            {
                0x19, 
                0x19, 
                0x19
            }, 

            Package (0x03)
            {
                0x0A, 
                0x0D, 
                0x11
            }, 

            Package (0x03)
            {
                0x04, 
                0x07, 
                0x0B
            }
        })
        Name (CUVR, Package (0x04)
        {
            Package (0x03)
            {
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x03)
            {
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x03)
            {
                0x34, 
                0x30, 
                0x2C
            }, 

            Package (0x03)
            {
                0x2C, 
                0x28, 
                0x24
            }
        })
        Name (AIGC, Zero)
        Name (PICL, One)
        Name (LVIC, Zero)
        Method (STCG, 1, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFF), T_0)
            If (LEqual (T_0, Zero))
            {
                Store (Zero, Local0)
            }
            Else
            {
                If (LEqual (T_0, One))
                {
                    Store (Zero, Local0)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Return (One)
        }

        Method (GDEF, 1, NotSerialized)
        {
            Name (T_0, Zero)
            Store (And (Arg0, 0xFF), T_0)
            If (LEqual (T_0, 0x02))
            {
                Return (GVOT (0x02, LVIC))
            }
            Else
            {
                If (LEqual (T_0, 0x04))
                {
                    Return (GVOT (0x04, LVIC))
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Method (AGLS, 1, NotSerialized)
        {
            Store (Arg0, LVIC)
            Return (One)
        }

        Method (AGLI, 1, NotSerialized)
        {
            SVOT (0x04, LVIC, Arg0)
            Return (One)
        }

        Method (AGCV, 1, NotSerialized)
        {
            SVOT (0x02, LVIC, Arg0)
            Return (One)
        }

        Method (SVOT, 3, NotSerialized)
        {
            Add (Arg0, Multiply (Arg1, 0x05), Local0)
            Store (Arg2, Index (OLTB, Local0))
            Return (One)
        }

        Method (GVOT, 2, NotSerialized)
        {
            Add (Arg0, Multiply (Arg1, 0x05), Local0)
            Store (DerefOf (Index (OLTB, Local0)), Local1)
            Return (Local1)
        }

        Method (SICL, 1, NotSerialized)
        {
            If (And (Arg0, 0x8000))
            {
                Store (One, AIGC)
                Name (T_0, Zero)
                Store (And (Arg0, 0xFF), T_0)
                If (LEqual (T_0, Zero))
                {
                    ITAT ()
                }
                Else
                {
                    If (LEqual (T_0, 0x10))
                    {
                        SPIC (One)
                        Store (One, PICL)
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x11))
                        {
                            SPIC (One)
                            Store (One, PICL)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x12))
                            {
                                SPIC (0x02)
                                Store (0x02, PICL)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x13))
                                {
                                    SPIC (0x03)
                                    Store (0x03, PICL)
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                        }
                    }
                }
            }
            Else
            {
                Store (Zero, AIGC)
                Name (T_1, Zero)
                Store (And (Arg0, 0xFF), T_1)
                If (LEqual (T_1, Zero))
                {
                    SPIC (One)
                    Store (One, PICL)
                }
                Else
                {
                    If (LEqual (T_1, One))
                    {
                        SPIC (0x02)
                        Store (0x02, PICL)
                    }
                    Else
                    {
                        If (LEqual (T_1, 0x02))
                        {
                            SPIC (0x03)
                            Store (0x03, PICL)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Return (One)
        }

        Method (SPIC, 1, NotSerialized)
        {
            If (LLessEqual (Arg0, PICL))
            {
                WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x08
                    )), DerefOf (Index (DerefOf (Index (CUVR, Arg0)), GVOT (0x02, Arg0)
                    )))
                WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x09
                    )), DerefOf (Index (DerefOf (Index (LDLE, Arg0)), GVOT (0x04, Arg0)
                    )))
                If (LEqual (Arg0, 0x03))
                {
                    Store (One, PWTH)
                }
                Else
                {
                    Store (Zero, PWTH)
                }

                If (LEqual (AIGC, Zero))
                {
                    SFSB (Arg0)
                }
            }
            Else
            {
                If (LEqual (AIGC, Zero))
                {
                    SFSB (Arg0)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Store (One, PWTH)
                }
                Else
                {
                    Store (Zero, PWTH)
                }

                WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x09
                    )), DerefOf (Index (DerefOf (Index (LDLE, Arg0)), GVOT (0x04, Arg0)
                    )))
                WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x08
                    )), DerefOf (Index (DerefOf (Index (CUVR, Arg0)), GVOT (0x02, Arg0)
                    )))
            }

            RCAS ()
        }

        Name (PSLV, Package (0x04)
        {
            Package (0x03)
            {
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x03)
            {
                Zero, 
                Zero, 
                0xFF
            }, 

            Package (0x03)
            {
                Zero, 
                0xFF, 
                0xFF
            }, 

            Package (0x03)
            {
                0xFF, 
                0xFF, 
                0xFF
            }
        })
        Method (SFSB, 1, NotSerialized)
        {
            If (LEqual (GNVS (0x32D0), Zero))
            {
                Store (Zero, Local5)
            }
            Else
            {
                Store (One, Local5)
            }

            WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x05
                )), DerefOf (Index (DerefOf (Index (PSLV, Local5)), Zero)))
            WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x06
                )), DerefOf (Index (DerefOf (Index (PSLV, Local5)), One)))
            WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x07
                )), DerefOf (Index (DerefOf (Index (PSLV, Local5)), 0x02)))
            Sleep (0x03E8)
        }

        Method (ITAT, 0, NotSerialized)
        {
            If (LEqual (GNVS (0x32D0), Zero))
            {
                Store (Zero, Local0)
            }
            Else
            {
                Store (One, Local0)
            }

            WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x05
                )), DerefOf (Index (DerefOf (Index (PSLV, Local0)), Zero)))
            WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x06
                )), DerefOf (Index (DerefOf (Index (PSLV, Local0)), One)))
            WBYT (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x07
                )), DerefOf (Index (DerefOf (Index (PSLV, Local0)), 0x02)))
            Sleep (0x03E8)
        }

        Method (RCAS, 0, NotSerialized)
        {
            SRBY (DerefOf (Index (ADP3, Zero)), DerefOf (Index (ADP3, 0x0A
                )))
        }
    }

    Scope (_SB)
    {
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        CreateWordField (BUFA, One, ICRS)
        Method (LSTA, 1, NotSerialized)
        {
            If (Arg0)
            {
                Return (0x0B)
            }
            Else
            {
                Return (0x09)
            }
        }

        Method (LPRS, 2, NotSerialized)
        {
            If (PICM)
            {
                Return (Arg1)
            }
            Else
            {
                Return (Arg0)
            }
        }

        Method (LCRS, 1, NotSerialized)
        {
            If (PICM)
            {
                Name (BUFB, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y1C)
                    {
                        0x00000011,
                    }
                })
                CreateByteField (BUFB, \_SB.LCRS._Y1C._INT, AIRQ)
                Store (Arg0, AIRQ)
                If (LEqual (Arg0, One))
                {
                    Store (0x17, AIRQ)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (0x16, AIRQ)
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Store (0x15, AIRQ)
                }

                If (LEqual (Arg0, 0x08))
                {
                    Store (0x14, AIRQ)
                }

                If (LEqual (Arg0, 0x0C))
                {
                    Store (0x13, AIRQ)
                }

                If (LEqual (Arg0, 0x06))
                {
                    Store (0x12, AIRQ)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Store (0x11, AIRQ)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Store (0x10, AIRQ)
                }

                If (LEqual (Arg0, 0x0F))
                {
                    Store (0x0F, AIRQ)
                }

                If (LEqual (Arg0, 0x0E))
                {
                    Store (0x0E, AIRQ)
                }

                If (LEqual (Arg0, 0x0B))
                {
                    Store (0x0B, AIRQ)
                }

                If (LEqual (Arg0, 0x0A))
                {
                    Store (0x0A, AIRQ)
                }

                If (LEqual (Arg0, 0x09))
                {
                    Store (0x09, AIRQ)
                }

                If (LEqual (Arg0, 0x07))
                {
                    Store (0x07, AIRQ)
                }

                If (LEqual (Arg0, 0x05))
                {
                    Store (0x05, AIRQ)
                }

                Return (BUFB)
            }
            Else
            {
                ShiftLeft (One, Arg0, ICRS)
                Return (BUFA)
            }
        }

        Method (LCRO, 1, NotSerialized)
        {
            If (PICM)
            {
                Name (BUFB, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y1D)
                    {
                        0x00000014,
                    }
                })
                CreateByteField (BUFB, \_SB.LCRO._Y1D._INT, AIRQ)
                Store (Arg0, AIRQ)
                If (LEqual (Arg0, One))
                {
                    Store (0x17, AIRQ)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (0x16, AIRQ)
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Store (0x15, AIRQ)
                }

                If (LEqual (Arg0, 0x08))
                {
                    Store (0x14, AIRQ)
                }

                If (LEqual (Arg0, 0x0C))
                {
                    Store (0x13, AIRQ)
                }

                If (LEqual (Arg0, 0x06))
                {
                    Store (0x12, AIRQ)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Store (0x11, AIRQ)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Store (0x10, AIRQ)
                }

                If (LEqual (Arg0, 0x0F))
                {
                    Store (0x0F, AIRQ)
                }

                If (LEqual (Arg0, 0x0E))
                {
                    Store (0x0E, AIRQ)
                }

                If (LEqual (Arg0, 0x0B))
                {
                    Store (0x0B, AIRQ)
                }

                If (LEqual (Arg0, 0x0A))
                {
                    Store (0x0A, AIRQ)
                }

                If (LEqual (Arg0, 0x09))
                {
                    Store (0x09, AIRQ)
                }

                If (LEqual (Arg0, 0x07))
                {
                    Store (0x07, AIRQ)
                }

                If (LEqual (Arg0, 0x05))
                {
                    Store (0x05, AIRQ)
                }

                Return (BUFB)
            }
            Else
            {
                ShiftLeft (One, Arg0, ICRS)
                Return (BUFA)
            }
        }

        Method (LSRS, 1, NotSerialized)
        {
            If (PICM)
            {
                CreateByteField (Arg0, 0x05, SAIR)
                Store (SAIR, Local0)
                If (LEqual (Local0, 0x17))
                {
                    Store (One, Local0)
                }

                If (LEqual (Local0, 0x16))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (Local0, 0x15))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (Local0, 0x14))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (Local0, 0x13))
                {
                    Store (0x0C, Local0)
                }

                If (LEqual (Local0, 0x12))
                {
                    Store (0x06, Local0)
                }

                If (LEqual (Local0, 0x11))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (Local0, 0x10))
                {
                    Store (0x03, Local0)
                }

                If (LEqual (Local0, 0x0F))
                {
                    Store (0x0F, Local0)
                }

                If (LEqual (Local0, 0x0E))
                {
                    Store (0x0E, Local0)
                }

                If (LEqual (Local0, 0x0B))
                {
                    Store (0x0B, Local0)
                }

                If (LEqual (Local0, 0x0A))
                {
                    Store (0x0A, Local0)
                }

                If (LEqual (Local0, 0x09))
                {
                    Store (0x09, Local0)
                }

                If (LEqual (Local0, 0x07))
                {
                    Store (0x07, Local0)
                }

                If (LEqual (Local0, 0x05))
                {
                    Store (0x05, Local0)
                }

                Return (Local0)
            }
            Else
            {
                CreateWordField (Arg0, One, ISRS)
                FindSetRightBit (ISRS, Local0)
                Return (Decrement (Local0))
            }
        }

        Method (LSRO, 1, NotSerialized)
        {
            If (PICM)
            {
                CreateByteField (Arg0, 0x05, SAIR)
                Store (SAIR, Local0)
                If (LEqual (Local0, 0x17))
                {
                    Store (One, Local0)
                }

                If (LEqual (Local0, 0x16))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (Local0, 0x15))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (Local0, 0x14))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (Local0, 0x13))
                {
                    Store (0x0C, Local0)
                }

                If (LEqual (Local0, 0x12))
                {
                    Store (0x06, Local0)
                }

                If (LEqual (Local0, 0x11))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (Local0, 0x10))
                {
                    Store (0x03, Local0)
                }

                If (LEqual (Local0, 0x0F))
                {
                    Store (0x0F, Local0)
                }

                If (LEqual (Local0, 0x0E))
                {
                    Store (0x0E, Local0)
                }

                If (LEqual (Local0, 0x0B))
                {
                    Store (0x0B, Local0)
                }

                If (LEqual (Local0, 0x0A))
                {
                    Store (0x0A, Local0)
                }

                If (LEqual (Local0, 0x09))
                {
                    Store (0x09, Local0)
                }

                If (LEqual (Local0, 0x07))
                {
                    Store (0x07, Local0)
                }

                If (LEqual (Local0, 0x05))
                {
                    Store (0x05, Local0)
                }

                Return (Local0)
            }
            Else
            {
                CreateWordField (Arg0, One, ISRS)
                FindSetRightBit (ISRS, Local0)
                Return (Decrement (Local0))
            }
        }

        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, One)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PIRA))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PIRA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.PIRA))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.PIRA)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x02)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PIRB))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PIRB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.PIRB))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.PIRB)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x03)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PIRC))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PIRC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.PIRC))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.PIRC)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x04)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PIRD))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PIRD)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.PIRD))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.PIRD)
            }
        }

        Device (LN0A)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x05)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P0EA))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P0EA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P0EA))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P0EA)
            }
        }

        Device (LN0B)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x06)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P0EB))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P0EB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P0EB))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P0EB)
            }
        }

        Device (LN0C)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x07)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P0EC))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P0EC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P0EC))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P0EC)
            }
        }

        Device (LN0D)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x08)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P0ED))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P0ED)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P0ED))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P0ED)
            }
        }

        Device (LN1A)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x09)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P1EA))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P1EA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P1EA))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P1EA)
            }
        }

        Device (LN1B)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x0A)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P1EB))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P1EB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P1EB))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P1EB)
            }
        }

        Device (LN1C)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x0B)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P1EC))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P1EC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P1EC))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P1EC)
            }
        }

        Device (LN1D)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x0C)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P1ED))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P1ED)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P1ED))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P1ED)
            }
        }

        Device (LN2A)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x0D)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P2EA))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P2EA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P2EA))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P2EA)
            }
        }

        Device (LN2B)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x0E)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P2EB))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P2EB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P2EB))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P2EB)
            }
        }

        Device (LN2C)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x0F)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P2EC))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P2EC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P2EC))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P2EC)
            }
        }

        Device (LN2D)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x10)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P2ED))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P2ED)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P2ED))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P2ED)
            }
        }

        Device (LN3A)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x11)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P3EA))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P3EA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P3EA))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P3EA)
            }
        }

        Device (LN3B)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x12)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P3EB))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P3EB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P3EB))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P3EB)
            }
        }

        Device (LN3C)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x13)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P3EC))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P3EC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P3EC))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P3EC)
            }
        }

        Device (LN3D)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x14)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P3ED))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P3ED)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P3ED))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P3ED)
            }
        }

        Device (LN4A)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x15)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P4EA))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P4EA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P4EA))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P4EA)
            }
        }

        Device (LN4B)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x16)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P4EB))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P4EB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P4EB))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P4EB)
            }
        }

        Device (LN4C)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x17)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P4EC))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P4EC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P4EC))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P4EC)
            }
        }

        Device (LN4D)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x18)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P4ED))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P4ED)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P4ED))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P4ED)
            }
        }

        Device (LN5A)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x19)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P5EA))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P5EA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P5EA))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P5EA)
            }
        }

        Device (LN5B)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x1A)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P5EB))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P5EB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P5EB))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P5EB)
            }
        }

        Device (LN5C)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x1B)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P5EC))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P5EC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P5EC))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P5EC)
            }
        }

        Device (LN5D)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x1B)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P5ED))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P5ED)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P5ED))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P5ED)
            }
        }

        Device (LN6A)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x1C)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P6EA))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P6EA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P6EA))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P6EA)
            }
        }

        Device (LN6B)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x1D)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P6EB))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P6EB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P6EB))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P6EB)
            }
        }

        Device (LN6C)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x1E)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P6EC))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P6EC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P6EC))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P6EC)
            }
        }

        Device (LN6D)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x1F)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.P6ED))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.P6ED)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.P6ED))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P6ED)
            }
        }

        Device (LUB0)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x24)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PIU0))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSB0, RSU1))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PIU0)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRO (^^PCI0.IMAP.PIU0))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PIU0)
            }
        }

        Device (LUB2)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x25)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PIU2))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSB2, RSI1))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PIU2)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRO (^^PCI0.IMAP.PIU2))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PIU2)
            }
        }

        Device (LMAC)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x26)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PILN))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSAC, RSMA))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PILN)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRO (^^PCI0.IMAP.PILN))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PILN)
            }
        }

        Device (LAZA)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x27)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PAZA))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSZA, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PAZA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRO (^^PCI0.IMAP.PAZA))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PAZA)
            }
        }

        Device (SGRU)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x28)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.GPUR))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSRU, RSIG))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.GPUR)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRO (^^PCI0.IMAP.GPUR))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.GPUR)
            }
        }

        Device (LSMB)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x29)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PIRM))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSMB, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PIRM)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRO (^^PCI0.IMAP.PIRM))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PIRM)
            }
        }

        Device (LPMU)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x2A)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PMUD))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSMU, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PMUD)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRO (^^PCI0.IMAP.PMUD))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PMUD)
            }
        }

        Device (LSA0)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x2B)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PIID))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSA0, RSSA))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PIID)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRO (^^PCI0.IMAP.PIID))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PIID)
            }
        }

        Device (LATA)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x2C)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.PR0E))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSTA, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.PR0E)
            }

            Method (_CRS, 0, NotSerialized)
            {
                If (OSFL ())
                {
                    Return (Zero)
                }
                Else
                {
                    Return (LCRO (^^PCI0.IMAP.PR0E))
                }
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PR0E)
            }
        }

        Device (UB11)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x2D)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.UBR1))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RS11, RSU2))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.UBR1)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRO (^^PCI0.IMAP.UBR1))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.UBR1)
            }
        }

        Device (UB12)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x2E)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.UBR2))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RS12, RSI2))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.UBR2)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRO (^^PCI0.IMAP.UBR2))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.UBR2)
            }
        }

        Device (LRP0)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x2B)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.XVE0))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSP0, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.XVE0)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.XVE0))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE0)
            }
        }

        Device (LRP1)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x2C)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.XVE1))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSP1, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.XVE1)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.XVE1))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE1)
            }
        }

        Device (LRP2)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x2D)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.XVE2))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSP2, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.XVE2)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.XVE2))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE2)
            }
        }

        Device (LRP3)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x2E)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.XVE3))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSP3, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.XVE3)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.XVE3))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE3)
            }
        }

        Device (LRP4)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x2F)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.XVE4))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSP4, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.XVE4)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.XVE4))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE4)
            }
        }

        Device (LRP5)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x30)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.XVE5))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSP5, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.XVE5)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.XVE5))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE5)
            }
        }

        Device (LRP6)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x31)
            Method (_STA, 0, NotSerialized)
            {
                Return (LSTA (^^PCI0.IMAP.XVE6))
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (LPRS (RSP6, RSII))
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, ^^PCI0.IMAP.XVE6)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Return (LCRS (^^PCI0.IMAP.XVE6))
            }

            Method (_SRS, 1, NotSerialized)
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE6)
            }
        }
    }

    Scope (_SB.PCI0)
    {
        OperationRegion (HDCP, SystemMemory, 0xCFF9E0E4, 0x0260)
        Field (HDCP, AnyAcc, NoLock, Preserve)
        {
            SIGN,   48, 
            CHKS,   8, 
            RESR,   8, 
            GLOB,   4800
        }

        Alias (GLOB, HDCB)
    }

    Scope (_SB.PCI0)
    {
        Name (CRCE, 0x88)
        OperationRegion (P88R, PCI_Config, CRCE, 0x04)
        Field (P88R, ByteAcc, NoLock, Preserve)
        {
            CCEC,   11
        }

        Method (GPXX, 0, NotSerialized)
        {
            Multiply (CCEC, 0x02000000, Local0)
            Return (Local0)
        }

        Method (CMPB, 2, NotSerialized)
        {
            Store (SizeOf (Arg0), Local1)
            If (LNotEqual (Local1, SizeOf (Arg1)))
            {
                Return (Zero)
            }

            Store (Zero, Local0)
            While (LLess (Local0, Local1))
            {
                If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (
                    Arg1, Local0))))
                {
                    Return (Zero)
                }

                Increment (Local0)
            }

            Return (One)
        }
    }

    Scope (_SB.PCI0)
    {
        Method (GPC0, 0, NotSerialized)
        {
            Add (GPXX (), 0x0001B000, Local0)
            Return (Local0)
        }

        Method (GPC1, 0, NotSerialized)
        {
            Add (GPXX (), 0xB000, Local0)
            Return (Local0)
        }

        Method (GPC2, 0, NotSerialized)
        {
            Add (GPXX (), 0xC000, Local0)
            Return (Local0)
        }

        Method (GPC3, 0, NotSerialized)
        {
            Add (GPXX (), 0xE100, Local0)
            Return (Local0)
        }

        OperationRegion (P4MR, SystemMemory, GPC0 (), 0xFF)
        Field (P4MR, ByteAcc, NoLock, Preserve)
        {
                    Offset (0x44), 
            BPLM,   8, 
                ,   1, 
            BPLN,   8, 
                ,   9, 
            BPLP,   2, 
                    Offset (0x74), 
                ,   18, 
            VCO2,   1, 
                ,   8, 
            ASYC,   1, 
                    Offset (0x78), 
            CPLM,   8, 
            CPLN,   8, 
                    Offset (0xC8), 
            MPLM,   4, 
            MPLN,   4
        }

        OperationRegion (OA8D, SystemMemory, GPC1 (), 0xFF)
        Field (OA8D, ByteAcc, NoLock, Preserve)
        {
                    Offset (0x50), 
            NIST,   10, 
                ,   2, 
            NSB1,   4, 
            NSB2,   4, 
                    Offset (0x8C), 
            TRFC,   10, 
                    Offset (0x8F), 
            TRCD,   4, 
            WRRC,   4, 
                    Offset (0x91), 
            TR2P,   4, 
                    Offset (0x9C), 
                    Offset (0x9D), 
            TRP,    4, 
                    Offset (0xA0), 
                    Offset (0xA2), 
            TRC,    6, 
                    Offset (0xA8), 
            TROE,   1, 
                ,   3, 
            TROI,   3, 
                    Offset (0xF4), 
            BWCP,   7, 
                    Offset (0xF5), 
            BWIS,   7, 
                    Offset (0xF6), 
            BWWB,   7, 
                    Offset (0xF7), 
            BWHP,   7, 
            HPCR,   1
        }

        OperationRegion (O8ER, SystemMemory, GPC2 (), 0xFF)
        Field (O8ER, ByteAcc, NoLock, Preserve)
        {
                    Offset (0x70), 
            CDP0,   1, 
                    Offset (0x71), 
            CDS0,   8, 
                ,   4, 
            CDC0,   4, 
                ,   5, 
            CDB0,   2, 
                    Offset (0x74), 
            CDP1,   1, 
                    Offset (0x75), 
            CDS1,   8, 
                ,   4, 
            CDC1,   4, 
                ,   5, 
            CDB1,   2, 
                    Offset (0x78), 
            CDP2,   1, 
                    Offset (0x79), 
            CDS2,   8, 
                ,   4, 
            CDC2,   4, 
                ,   5, 
            CDB2,   2, 
                    Offset (0x7C), 
            CDP3,   1, 
                    Offset (0x7D), 
            CDS3,   8, 
                ,   4, 
            CDC3,   4, 
                ,   5, 
            CDB3,   2, 
                    Offset (0x80), 
            INTL,   2, 
            RCBD,   2, 
                    Offset (0x81), 
            PCIH,   5, 
                    Offset (0x88), 
            TOM1,   8, 
            TOM2,   9, 
                    Offset (0x90), 
            P0P0,   1, 
            P1P0,   1, 
            P0N0,   1, 
            P1N0,   1, 
            PCR0,   1, 
                    Offset (0x91), 
            PCB0,   9, 
                    Offset (0x93), 
            PCS0,   8, 
            P0P1,   1, 
            P1P1,   1, 
            P0N1,   1, 
            P1N1,   1, 
            PCR1,   1, 
                    Offset (0x95), 
            PCB1,   9, 
                    Offset (0x97), 
            PCS1,   8, 
            P0P2,   1, 
            P1P2,   1, 
            P0N2,   1, 
            P1N2,   1, 
            PCR2,   1, 
                    Offset (0x99), 
            PCB2,   9, 
                    Offset (0x9B), 
            PCS2,   8, 
            P0P3,   1, 
            P1P3,   1, 
            P0N3,   1, 
            P1N3,   1, 
            PCR3,   1, 
                    Offset (0x9D), 
            PCB3,   9, 
                    Offset (0x9F), 
            PCS3,   8, 
            P0P4,   1, 
            P1P4,   1, 
            P0N4,   1, 
            P1N4,   1, 
            PCR4,   1, 
                    Offset (0xA1), 
            PCB4,   9, 
                    Offset (0xA3), 
            PCS4,   8, 
                    Offset (0xC4), 
            REFP,   16, 
            REFB,   4
        }

        OperationRegion (OEER, SystemMemory, GPC3 (), 0xFF)
        Field (OEER, ByteAcc, NoLock, Preserve)
        {
                    Offset (0xAA), 
            CKDY,   16
        }

        Name (CCT0, Zero)
        Name (CCT2, 0x02)
        Name (M4GI, 0x20)
        Name (PMPV, 0x0F)
        Name (MCPL, 0x64)
        Name (LIBV, 0x0FFF)
        Name (DBV0, 0x3E)
        Name (DBV1, 0xFFFF)
        Name (DBEN, 0x02)
        Method (CIMP, 0, NotSerialized)
        {
            Name (BU2A, Buffer (0x04)
            {
                0x00
            })
            CreateField (BU2A, 0x10, 0x04, BF03)
            CreateField (BU2A, 0x14, 0x04, BF04)
            Name (BU2B, Buffer (0x04)
            {
                0x00
            })
            CreateField (BU2B, Zero, 0x0B, BF07)
            CreateField (BU2B, 0x0B, 0x0E, BF08)
            Name (BU2C, Buffer (0x0A)
            {
                0x00
            })
            CreateField (BU2C, Zero, 0x03, BF0A)
            CreateField (BU2C, 0x03, 0x04, BF0B)
            CreateField (BU2C, 0x07, 0x04, BF0C)
            CreateField (BU2C, 0x0B, 0x04, BF0D)
            CreateField (BU2C, 0x0F, 0x04, BF0E)
            CreateField (BU2C, 0x13, 0x26, BF0F)
            Name (BU2D, Buffer (0x0A)
            {
                0x00
            })
            CreateField (BU2D, Zero, 0x10, BF1A)
            CreateField (BU2D, 0x10, 0x0B, TAVN)
            CreateField (BU2D, 0x1B, 0x0A, BASL)
            CreateField (BU2D, 0x25, 0x0B, LBWF)
            CreateField (BU2D, 0x30, 0x0C, ATBW)
            CreateField (BU2D, 0x3C, 0x0A, CLTF)
            CreateField (BU2D, 0x46, 0x0A, PMPF)
            Name (BNKN, Zero)
            Name (BNKX, Zero)
            Name (COLN, Zero)
            Name (COLX, Zero)
            Store (0x10, Index (BU2A, Zero))
            Store (0x08, Index (BU2A, One))
            Store (0x12, Index (BU2A, 0x02))
            Store (0xAA, Index (BU2A, 0x03))
            Store (DBEN, BF04)
            Name (M2CL, Zero)
            Store (GM2C (), M2CL)
            Multiply (M2CL, 0x02, BF08)
            Store (BASM (M2CL), BF07)
            Store (BU2B, Local2)
            If (LEqual (RCBD, CCT0))
            {
                Store (One, BF03)
                Multiply (0x08000000, TOM1, BF0F)
                Store (One, BF0A)
                If (INTL)
                {
                    Store (0x02, BF0A)
                }

                If (CDP0)
                {
                    Store (CDC0, BF0D)
                    Store (CDB0, BF0B)
                }
                Else
                {
                    If (CDP1)
                    {
                        Store (CDC1, BF0D)
                        Store (CDB1, BF0B)
                    }
                    Else
                    {
                        If (CDP2)
                        {
                            Store (CDC2, BF0D)
                            Store (CDB2, BF0B)
                        }
                        Else
                        {
                            If (CDP3)
                            {
                                Store (CDC3, BF0D)
                                Store (CDB3, BF0B)
                            }
                        }
                    }
                }

                Store (BF0D, BF0E)
                Store (BF0B, BF0C)
                Store (Local2, Local1)
                Concatenate (Local1, BU2C, Local2)
                If (PCIH)
                {
                    Store (0x02, BF03)
                    Subtract (TOM2, M4GI, Local1)
                    Multiply (0x08000000, Local1, BF0F)
                    Store (Local2, Local1)
                    Concatenate (Local1, BU2C, Local2)
                }
            }
            Else
            {
                If (LEqual (RCBD, CCT2))
                {
                    Name (NDRE, Zero)
                    Store (Zero, BF03)
                    Store (Zero, Local6)
                    While (One)
                    {
                        If (LEqual (Local6, 0x05))
                        {
                            Break
                        }

                        If (LOr (MP0P (Local6), MP1P (Local6)))
                        {
                            Multiply (MCRS (Local6), 0x08000000, BF0F)
                            Store (One, BF0A)
                            If (MPCR (Local6))
                            {
                                If (MP0P (Local6))
                                {
                                    If (MP1P (Local6))
                                    {
                                        Store (0x02, BF0A)
                                    }
                                }
                            }

                            Store (0x03, BNKN)
                            Store (0x02, BNKX)
                            Store (0x0C, COLN)
                            Store (0x08, COLX)
                            If (MP0P (Local6))
                            {
                                Store (MP0N (Local6), Local5)
                            }
                            Else
                            {
                                If (MP1P (Local6))
                                {
                                    Store (MP1N (Local6), Local5)
                                }
                            }

                            If (LGreater (BNKN, MCDB (Local5)))
                            {
                                Store (MCDB (Local5), BNKN)
                            }

                            If (LLess (BNKX, MCDB (Local5)))
                            {
                                Store (MCDB (Local5), BNKX)
                            }

                            If (LGreater (COLN, MCDC (Local5)))
                            {
                                Store (MCDC (Local5), COLN)
                            }

                            If (LLess (COLX, MCDC (Local5)))
                            {
                                Store (MCDC (Local5), COLX)
                            }

                            Store (BNKN, BF0B)
                            Store (BNKX, BF0C)
                            Store (COLN, BF0D)
                            Store (COLX, BF0E)
                            Increment (NDRE)
                            Store (Local2, Local1)
                            Concatenate (Local1, BU2C, Local2)
                        }

                        Increment (Local6)
                    }

                    Store (NDRE, BF03)
                }
                Else
                {
                    Store (Zero, Local5)
                }
            }

            Store (BASM (M2CL), BASL)
            Store (BASL, TAVN)
            Store (PMPM (M2CL), PMPF)
            Store (CLTM (M2CL), CLTF)
            Store (ATBM (M2CL), ATBW)
            Store (LIBV, LBWF)
            Store (DBV0, BF1A)
            Store (Local2, Local1)
            Concatenate (Local1, BU2D, Local2)
            Store (DBV1, BF1A)
            Store (ATBM (M2CL), ATBW)
            Store (LIBV, LBWF)
            Store (Local2, Local1)
            Concatenate (Local1, BU2D, Local2)
            Concatenate (BU2A, Local2, Local0)
            Return (Local0)
        }

        Method (MP0P, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (P0P0)
            }

            If (LEqual (Arg0, One))
            {
                Return (P0P1)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (P0P2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (P0P3)
            }

            If (LEqual (Arg0, 0x04))
            {
                Return (P0P4)
            }
        }

        Method (MP1P, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (P1P0)
            }

            If (LEqual (Arg0, One))
            {
                Return (P1P1)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (P1P2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (P1P3)
            }

            If (LEqual (Arg0, 0x04))
            {
                Return (P1P4)
            }
        }

        Method (MPCR, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (PCR0)
            }

            If (LEqual (Arg0, One))
            {
                Return (PCR1)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (PCR2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (PCR3)
            }

            If (LEqual (Arg0, 0x04))
            {
                Return (PCR4)
            }
        }

        Method (MP0N, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (P0N0)
            }

            If (LEqual (Arg0, One))
            {
                Return (P0N1)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (P0N2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (P0N3)
            }

            If (LEqual (Arg0, 0x04))
            {
                Return (P0N4)
            }
        }

        Method (MP1N, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (P1N0)
            }

            If (LEqual (Arg0, One))
            {
                Return (P1N1)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (P1N2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (P1N3)
            }

            If (LEqual (Arg0, 0x04))
            {
                Return (P1N4)
            }
        }

        Method (MCRB, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (PCB0)
            }

            If (LEqual (Arg0, One))
            {
                Return (PCB1)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (PCB2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (PCB3)
            }

            If (LEqual (Arg0, 0x04))
            {
                Return (PCB4)
            }
        }

        Method (MCRS, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (PCS0)
            }

            If (LEqual (Arg0, One))
            {
                Return (PCS1)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (PCS2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (PCS3)
            }

            If (LEqual (Arg0, 0x04))
            {
                Return (PCS4)
            }
        }

        Method (MCDB, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (CDB0)
            }

            If (LEqual (Arg0, One))
            {
                Return (CDB1)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (CDB2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (CDB3)
            }
        }

        Method (MCDC, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (CDC0)
            }

            If (LEqual (Arg0, One))
            {
                Return (CDC1)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (CDC2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (CDC3)
            }
        }

        Method (NOCH, 0, NotSerialized)
        {
            If (LEqual (INTL, 0x03))
            {
                Store (0x02, Local6)
            }
            Else
            {
                If (LEqual (INTL, Zero))
                {
                    Store (One, Local6)
                }
                Else
                {
                    If (LEqual (INTL, 0x02))
                    {
                        Multiply (CDP0, CDS0, Local0)
                        Multiply (CDP1, CDS1, Local1)
                        Multiply (CDP2, CDS2, Local2)
                        Multiply (CDP3, CDS3, Local3)
                        Add (Local0, Local1, Local0)
                        Add (Local2, Local3, Local2)
                        If (LEqual (Local0, Local2))
                        {
                            Store (0x02, Local6)
                        }
                        Else
                        {
                            Store (One, Local6)
                        }
                    }
                }
            }

            Return (Local6)
        }

        Method (ATBM, 1, NotSerialized)
        {
            Multiply (Arg0, 0x02, Local0)
            Multiply (Local0, NOCH (), Local0)
            Multiply (0x08, Local0, Local0)
            Multiply (Local0, BWHP, Local0)
            Add (BWCP, BWIS, Local1)
            Add (Local1, BWWB, Local1)
            Add (Local1, BWHP, Local1)
            Divide (Local0, Local1, Local1, Local0)
            Multiply (Local0, 0x03, Local0)
            Divide (Local0, 0x28, Local1, Local0)
            Return (Local0)
        }

        Method (GM2C, 0, NotSerialized)
        {
            Multiply (CPLN, 0x19, Local1)
            Multiply (BPLN, Local1, Local1)
            Add (BPLP, One, Local2)
            Multiply (Local2, CPLM, Local2)
            Multiply (Local2, BPLM, Local2)
            Store (Local1, Local3)
            Multiply (Local3, MPLN, Local1)
            Multiply (Local2, MPLM, Local2)
            Divide (Local1, Local2, , Local3)
            If (LEqual (VCO2, Zero))
            {
                Multiply (Local3, 0x02, Local3)
            }

            Return (Local3)
        }

        Method (PMPM, 1, NotSerialized)
        {
            Multiply (PMPV, 0x03E8, Local0)
            Divide (Local0, Arg0, Local0, Local1)
            Return (Local1)
        }

        Method (CLTM, 1, NotSerialized)
        {
            Divide (0x04, NOCH (), Local0, Local1)
            Multiply (0x03E8, Local1, Local0)
            Divide (Local0, Arg0, Local0, Local1)
            Return (Local1)
        }

        Method (BASM, 1, NotSerialized)
        {
            Name (M2CK, Zero)
            Name (NPAR, Zero)
            Store (NOCH (), NPAR)
            Store (Arg0, M2CK)
            Name (TPAR, 0x04)
            Divide (TPAR, NPAR, , TPAR)
            Subtract (TPAR, 0x02, TPAR)
            Name (BUCO, Zero)
            Add (TPAR, TRCD, BUCO)
            Add (BUCO, TR2P, BUCO)
            Add (BUCO, TRP, BUCO)
            Name (B2CO, Zero)
            Store (MAX (TRC, BUCO), B2CO)
            Store (CEIL (B2CO, 0x02), B2CO)
            Name (TBM2, Zero)
            If (LEqual (TROE, One))
            {
                Store (TROI, TBM2)
            }

            Name (TMAX, Zero)
            Add (TMAX, TBM2, TMAX)
            Add (TMAX, BUCO, TMAX)
            Add (TMAX, TPAR, TMAX)
            Store (MAX (TMAX, B2CO), TMAX)
            Name (SWBC, Zero)
            Multiply (TMAX, BWWB, SWBC)
            Multiply (SWBC, NPAR, SWBC)
            Divide (SWBC, 0x02, , SWBC)
            Name (SCPU, Zero)
            Multiply (TMAX, BWCP, SCPU)
            Multiply (SCPU, NPAR, SCPU)
            Divide (SCPU, 0x02, , SCPU)
            Name (SISO, Zero)
            Add (TBM2, BUCO, Local1)
            Add (Local1, NPAR, Local1)
            Subtract (Local1, 0x02, Local1)
            Store (MAX (Local1, B2CO), Local1)
            Multiply (Local1, BWIS, SISO)
            Name (RCBZ, 0x10)
            Name (CBHP, 0x02)
            Name (SHIS, Zero)
            Multiply (RCBZ, 0x04, SHIS)
            Divide (SHIS, NPAR, , SHIS)
            Subtract (SHIS, 0x02, SHIS)
            Add (SHIS, BUCO, SHIS)
            Add (SHIS, TBM2, SHIS)
            Store (MAX (SHIS, B2CO), SHIS)
            Multiply (SHIS, CBHP, SHIS)
            Name (BIDH, One)
            Name (BWCO, Zero)
            Add (SWBC, SCPU, BWCO)
            Add (BWCO, SISO, BWCO)
            Add (BWCO, SHIS, BWCO)
            Multiply (BWCO, BIDH, BWCO)
            Name (NISB, Zero)
            Store (NSB1, NISB)
            ShiftLeft (NSB2, 0x04, Local1)
            Or (Local1, NISB, NISB)
            Name (NICO, Zero)
            Divide (BWCO, NIST, Local2, Local1)
            If (LNotEqual (Local2, Zero))
            {
                Add (Local1, One, Local1)
            }

            Multiply (NISB, NPAR, Local2)
            Add (TBM2, NPAR, Local3)
            If (LGreater (Local3, 0x02))
            {
                Subtract (Local3, 0x02, Local3)
            }
            Else
            {
                Store (Zero, Local3)
            }

            Store (MAX (Local3, B2CO), Local3)
            Multiply (Local2, Local3, NICO)
            Multiply (NICO, Local1, NICO)
            Divide (NICO, 0x02, , NICO)
            Name (RECO, Zero)
            Add (BWCO, NICO, RECO)
            Divide (RECO, REFP, Local2, RECO)
            If (LNotEqual (Local2, Zero))
            {
                Add (RECO, One, RECO)
            }

            Multiply (RECO, TRFC, RECO)
            Multiply (RECO, REFB, RECO)
            Name (MELA, Zero)
            Add (BWCO, RECO, MELA)
            Add (MELA, NICO, MELA)
            Multiply (MELA, 0x03E8, MELA)
            Divide (MELA, M2CK, , MELA)
            Name (WALA, Zero)
            Divide (0x00030D40, M2CK, , WALA)
            Add (WALA, CKDY, WALA)
            Name (SWLA, Zero)
            Name (M73L, 0x64)
            Name (PADD, Zero)
            Add (MELA, WALA, Local1)
            Add (Local1, SWLA, Local1)
            Add (Local1, M73L, Local1)
            Add (Local1, PADD, Local1)
            Divide (Local1, 0x64, , Local0)
            Return (Local0)
        }

        Method (MAX, 2, NotSerialized)
        {
            Store (Arg0, Local0)
            If (LGreater (Arg1, Arg0))
            {
                Store (Arg1, Local0)
            }

            Return (Local0)
        }

        Method (CEIL, 2, NotSerialized)
        {
            Store (Arg0, Local0)
            Divide (Local0, Arg1, Local1, Local3)
            If (LNotEqual (Local1, Zero))
            {
                Subtract (Local0, Local1, Local0)
                Add (Local0, Arg1, Local0)
            }

            Return (Local0)
        }
    }

    Scope (_SB.PCI0)
    {
    }

    Scope (_SB.PCI0)
    {
        Device (WMI0)
        {
            Name (_HID, "pnp0c14")
            Name (_UID, "NVIF")
            Name (_WDG, Buffer (0xC8)
            {
                /* 0000 */    0xF2, 0x9A, 0x79, 0xA1, 0x29, 0x94, 0x29, 0x45, 
                /* 0008 */    0x92, 0x7E, 0xDF, 0xE1, 0x37, 0x36, 0xEE, 0xBA, 
                /* 0010 */    0x4E, 0x56, 0x01, 0x02, 0x85, 0x9A, 0x79, 0xA1, 
                /* 0018 */    0x29, 0x94, 0x29, 0x45, 0x92, 0x7E, 0xDF, 0xE1, 
                /* 0020 */    0x37, 0x36, 0xEE, 0xBA, 0x85, 0x00, 0x00, 0x08, 
                /* 0028 */    0x86, 0x9A, 0x79, 0xA1, 0x29, 0x94, 0x29, 0x45, 
                /* 0030 */    0x92, 0x7E, 0xDF, 0xE1, 0x37, 0x36, 0xEE, 0xBA, 
                /* 0038 */    0x86, 0x00, 0x00, 0x08, 0x87, 0x9A, 0x79, 0xA1, 
                /* 0040 */    0x29, 0x94, 0x29, 0x45, 0x92, 0x7E, 0xDF, 0xE1, 
                /* 0048 */    0x37, 0x36, 0xEE, 0xBA, 0x87, 0x00, 0x00, 0x08, 
                /* 0050 */    0x88, 0x9A, 0x79, 0xA1, 0x29, 0x94, 0x29, 0x45, 
                /* 0058 */    0x92, 0x7E, 0xDF, 0xE1, 0x37, 0x36, 0xEE, 0xBA, 
                /* 0060 */    0x88, 0x00, 0x00, 0x08, 0xC3, 0x9A, 0x79, 0xA1, 
                /* 0068 */    0x29, 0x94, 0x29, 0x45, 0x92, 0x7E, 0xDF, 0xE1, 
                /* 0070 */    0x37, 0x36, 0xEE, 0xBA, 0xC3, 0x00, 0x00, 0x08, 
                /* 0078 */    0xC5, 0x9A, 0x79, 0xA1, 0x29, 0x94, 0x29, 0x45, 
                /* 0080 */    0x92, 0x7E, 0xDF, 0xE1, 0x37, 0x36, 0xEE, 0xBA, 
                /* 0088 */    0xC5, 0x00, 0x00, 0x08, 0xCA, 0x9A, 0x79, 0xA1, 
                /* 0090 */    0x29, 0x94, 0x29, 0x45, 0x92, 0x7E, 0xDF, 0xE1, 
                /* 0098 */    0x37, 0x36, 0xEE, 0xBA, 0xCA, 0x00, 0x00, 0x08, 
                /* 00A0 */    0xCB, 0x9A, 0x79, 0xA1, 0x29, 0x94, 0x29, 0x45, 
                /* 00A8 */    0x92, 0x7E, 0xDF, 0xE1, 0x37, 0x36, 0xEE, 0xBA, 
                /* 00B0 */    0xCB, 0x00, 0x00, 0x08, 0x21, 0x12, 0x90, 0x05, 
                /* 00B8 */    0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0, 
                /* 00C0 */    0xC9, 0x06, 0x29, 0x10, 0x42, 0x41, 0x01, 0x00
            })
            Method (WMNV, 3, NotSerialized)
            {
                Store ("WMNV: ", Debug)
                If (LGreaterEqual (SizeOf (Arg2), 0x08))
                {
                    CreateDWordField (Arg2, Zero, FUNC)
                    CreateDWordField (Arg2, 0x04, SUBF)
                    If (LGreater (SizeOf (Arg2), 0x08))
                    {
                        Subtract (SizeOf (Arg2), 0x08, Local2)
                        ShiftLeft (Local2, 0x03, Local2)
                    }

                    CreateField (Arg2, 0x40, Local2, ARGS)
                    Store (FUNC, Debug)
                    Store (SUBF, Debug)
                    Store (ARGS, Debug)
                    Return (^^IXVE.IGPU.NVIF (FUNC, SUBF, ARGS))
                }
            }

            Name (WQBA, Buffer (0x038C)
            {
                /* 0000 */    0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                /* 0008 */    0x7C, 0x03, 0x00, 0x00, 0x54, 0x24, 0x00, 0x00, 
                /* 0010 */    0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                /* 0018 */    0x28, 0xDA, 0x91, 0x00, 0x01, 0x06, 0x18, 0x42, 
                /* 0020 */    0x10, 0x13, 0x10, 0x8A, 0xE6, 0x80, 0x42, 0x04, 
                /* 0028 */    0x92, 0x43, 0xA4, 0x30, 0x30, 0x28, 0x0B, 0x20, 
                /* 0030 */    0x86, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x04, 0x84, 
                /* 0038 */    0xBC, 0x0A, 0xB0, 0x29, 0xC0, 0x24, 0x88, 0xFA, 
                /* 0040 */    0xF7, 0x87, 0x28, 0x09, 0x0E, 0x25, 0x04, 0x42, 
                /* 0048 */    0x12, 0x05, 0x98, 0x17, 0xA0, 0x5B, 0x80, 0x61, 
                /* 0050 */    0x01, 0xB6, 0x05, 0x98, 0x16, 0xE0, 0x18, 0x92, 
                /* 0058 */    0x4A, 0x03, 0xA7, 0x04, 0x96, 0x02, 0x21, 0xA1, 
                /* 0060 */    0x02, 0x94, 0x0B, 0xF0, 0x2D, 0x40, 0x3B, 0xA2, 
                /* 0068 */    0x24, 0x0B, 0xB0, 0x0C, 0x23, 0x02, 0x8F, 0x82, 
                /* 0070 */    0xA1, 0x71, 0x68, 0xEC, 0x30, 0x2C, 0x13, 0x4C, 
                /* 0078 */    0x83, 0x38, 0x8C, 0xB2, 0x91, 0x45, 0x60, 0xDC, 
                /* 0080 */    0x4E, 0x05, 0xC8, 0x15, 0x20, 0x4C, 0x80, 0x78, 
                /* 0088 */    0x54, 0x61, 0x34, 0x07, 0x45, 0xE0, 0x42, 0x63, 
                /* 0090 */    0x64, 0x40, 0xC8, 0xA3, 0x00, 0xAB, 0xA3, 0xD0, 
                /* 0098 */    0xA4, 0x12, 0xD8, 0xBD, 0x00, 0x83, 0x02, 0x8C, 
                /* 00A0 */    0x09, 0xF0, 0x86, 0x2A, 0x84, 0x28, 0x35, 0x0A, 
                /* 00A8 */    0x50, 0x26, 0xC0, 0x16, 0x8A, 0xE0, 0x83, 0xC4, 
                /* 00B0 */    0x88, 0x12, 0xA4, 0x35, 0x14, 0x0A, 0x11, 0x24, 
                /* 00B8 */    0x66, 0x8B, 0x28, 0x02, 0x8F, 0x19, 0x24, 0x74, 
                /* 00C0 */    0x67, 0x40, 0x82, 0xA8, 0x0D, 0x46, 0x08, 0x15, 
                /* 00C8 */    0xC2, 0xCB, 0xFE, 0x20, 0x88, 0x7C, 0x05, 0xE3, 
                /* 00D0 */    0x66, 0x91, 0x46, 0x83, 0x1A, 0x6B, 0x82, 0x63, 
                /* 00D8 */    0xF7, 0x68, 0x4E, 0xB8, 0x73, 0x01, 0xD2, 0xE7, 
                /* 00E0 */    0x26, 0x90, 0xA3, 0x3B, 0xB8, 0x3A, 0x07, 0x4D, 
                /* 00E8 */    0x86, 0xC7, 0xB0, 0x12, 0xFC, 0x07, 0xF8, 0x14, 
                /* 00F0 */    0x80, 0x77, 0x0D, 0xA8, 0xE9, 0x1F, 0x3C, 0x13, 
                /* 00F8 */    0x04, 0x87, 0x1A, 0xA2, 0x47, 0x1D, 0xEE, 0x04, 
                /* 0100 */    0x8E, 0xFD, 0x48, 0x18, 0xC4, 0xC1, 0x1E, 0x37, 
                /* 0108 */    0xD6, 0xE1, 0x64, 0x34, 0xE8, 0x52, 0x05, 0x98, 
                /* 0110 */    0x3D, 0x00, 0x68, 0x64, 0x09, 0x4E, 0xFB, 0x4C, 
                /* 0118 */    0x42, 0xBF, 0x07, 0x9C, 0x4F, 0xCF, 0x63, 0x63, 
                /* 0120 */    0x83, 0x40, 0x8D, 0xCC, 0xFF, 0x7F, 0x68, 0x0F, 
                /* 0128 */    0xF1, 0xB4, 0x62, 0x86, 0x7C, 0x16, 0x38, 0x2C, 
                /* 0130 */    0x26, 0x16, 0x42, 0x9B, 0xD4, 0x78, 0x80, 0xC0, 
                /* 0138 */    0xC4, 0x1F, 0x0D, 0x22, 0xBC, 0x19, 0x78, 0xBE, 
                /* 0140 */    0x26, 0x18, 0x14, 0x42, 0x4E, 0xC6, 0x83, 0x12, 
                /* 0148 */    0x03, 0xA2, 0x41, 0xD7, 0x8A, 0xAD, 0x7B, 0x40, 
                /* 0150 */    0xF0, 0x98, 0x47, 0x54, 0x34, 0xB0, 0x06, 0xC2, 
                /* 0158 */    0xCE, 0x00, 0x1E, 0xB7, 0x65, 0x81, 0x50, 0x02, 
                /* 0160 */    0x03, 0xFB, 0xDC, 0xF0, 0x0E, 0x61, 0x5C, 0x1C, 
                /* 0168 */    0x7E, 0x64, 0x9F, 0x2F, 0x2C, 0x70, 0x50, 0x28, 
                /* 0170 */    0x58, 0xDF, 0x0E, 0x62, 0x3E, 0x0F, 0x1C, 0xE7, 
                /* 0178 */    0x01, 0x5B, 0xF8, 0x44, 0x09, 0xF0, 0x21, 0x79, 
                /* 0180 */    0x34, 0xF0, 0x06, 0x09, 0xDF, 0xFA, 0x11, 0x80, 
                /* 0188 */    0x20, 0xBF, 0x30, 0x3C, 0x36, 0x24, 0xB0, 0x3C, 
                /* 0190 */    0x60, 0xF4, 0x28, 0xED, 0x57, 0x00, 0x42, 0xF0, 
                /* 0198 */    0x17, 0x8B, 0xA7, 0x80, 0xD7, 0x81, 0x08, 0xC7, 
                /* 01A0 */    0x02, 0x53, 0xE4, 0xD8, 0xD0, 0xF0, 0x1C, 0x38, 
                /* 01A8 */    0x7A, 0xD8, 0x73, 0x09, 0x7F, 0x34, 0x51, 0x4E, 
                /* 01B0 */    0xE1, 0x70, 0x7C, 0xE4, 0x30, 0x42, 0xFC, 0x27, 
                /* 01B8 */    0x8D, 0x27, 0x0F, 0x6B, 0xBE, 0x03, 0x68, 0x4A, 
                /* 01C0 */    0x6F, 0x01, 0xEF, 0x0F, 0x1E, 0x01, 0x26, 0xFA, 
                /* 01C8 */    0xD1, 0x04, 0x15, 0xF6, 0x74, 0x02, 0xAA, 0xFF, 
                /* 01D0 */    0xFF, 0xE9, 0x04, 0xB0, 0x26, 0xEE, 0x64, 0xA2, 
                /* 01D8 */    0xD3, 0x09, 0xD8, 0xE3, 0x3D, 0x34, 0xA4, 0xE1, 
                /* 01E0 */    0x74, 0x02, 0x50, 0xE0, 0xFF, 0x7F, 0x3A, 0x81, 
                /* 01E8 */    0x1F, 0xF3, 0x74, 0x02, 0x15, 0xF8, 0x7C, 0x7C, 
                /* 01F0 */    0xE9, 0xF0, 0xA1, 0xC0, 0x04, 0x03, 0x8D, 0x9B, 
                /* 01F8 */    0x8A, 0x3A, 0x9D, 0xA0, 0x0E, 0x0F, 0x3E, 0x9D, 
                /* 0200 */    0xB0, 0x43, 0xC1, 0x49, 0x3C, 0x05, 0xF8, 0x70, 
                /* 0208 */    0x02, 0xE6, 0xC1, 0xE0, 0x0F, 0x27, 0xC0, 0x6D, 
                /* 0210 */    0x2C, 0xF8, 0xC3, 0x09, 0xF0, 0xB8, 0x63, 0x78, 
                /* 0218 */    0x08, 0xFC, 0x04, 0xE1, 0x21, 0xF0, 0x01, 0x3C, 
                /* 0220 */    0x6B, 0x9C, 0x9D, 0x95, 0xCE, 0x09, 0x79, 0x0C, 
                /* 0228 */    0xE1, 0x73, 0xC2, 0x9C, 0x56, 0x80, 0xCF, 0xFF, 
                /* 0230 */    0xFF, 0xB4, 0x02, 0xB8, 0x3A, 0xA1, 0x3C, 0xAD, 
                /* 0238 */    0x00, 0x8C, 0xFA, 0xFF, 0x9F, 0x56, 0xC0, 0x7D, 
                /* 0240 */    0x10, 0x78, 0x5A, 0x01, 0xB6, 0x83, 0xF1, 0x69, 
                /* 0248 */    0x05, 0x78, 0x8E, 0xC5, 0xA7, 0x15, 0xC0, 0xF1, 
                /* 0250 */    0xFF, 0xFF, 0xB4, 0x02, 0xF8, 0x41, 0x79, 0x5A, 
                /* 0258 */    0x01, 0xD8, 0xF5, 0xFF, 0x3F, 0xAD, 0x80, 0xEF, 
                /* 0260 */    0x24, 0xF0, 0xB4, 0x02, 0x6C, 0x07, 0xE3, 0xD3, 
                /* 0268 */    0x0A, 0xF0, 0x1C, 0x8B, 0x4F, 0x2B, 0x80, 0xEF, 
                /* 0270 */    0xFF, 0xFF, 0x69, 0x05, 0x70, 0x82, 0xF0, 0xB4, 
                /* 0278 */    0x02, 0x30, 0xED, 0xFF, 0x7F, 0x5A, 0x01, 0x07, 
                /* 0280 */    0xC2, 0xD3, 0x0A, 0xB0, 0x1D, 0x8C, 0x4F, 0x2B, 
                /* 0288 */    0xC0, 0x73, 0x2C, 0x3E, 0xAD, 0x00, 0xEE, 0xFF, 
                /* 0290 */    0xFF, 0xA7, 0x15, 0xC0, 0xC2, 0xB0, 0x1F, 0x11, 
                /* 0298 */    0x9E, 0x56, 0x00, 0xD6, 0xFD, 0xFF, 0x4F, 0x2B, 
                /* 02A0 */    0xB0, 0x0E, 0x05, 0x3E, 0xAD, 0x00, 0xD7, 0xC1, 
                /* 02A8 */    0xB0, 0xD3, 0x0A, 0xB0, 0x1C, 0x0B, 0x3B, 0xAD, 
                /* 02B0 */    0x00, 0x3C, 0xF8, 0xFF, 0x9F, 0x56, 0x80, 0xFB, 
                /* 02B8 */    0x49, 0xE5, 0x69, 0x05, 0x60, 0xE0, 0xFF, 0xFF, 
                /* 02C0 */    0xD8, 0x81, 0x3B, 0x10, 0x3C, 0xAD, 0x00, 0xDB, 
                /* 02C8 */    0xC1, 0xF8, 0xB4, 0x02, 0x3C, 0xC7, 0xE2, 0xD3, 
                /* 02D0 */    0x0A, 0xC0, 0x89, 0xFF, 0xFF, 0x69, 0x05, 0xF8, 
                /* 02D8 */    0x42, 0x3C, 0xAD, 0x00, 0x6C, 0xFC, 0xFF, 0x0F, 
                /* 02E0 */    0xEA, 0x69, 0x05, 0xD8, 0x0E, 0xC6, 0xA7, 0x15, 
                /* 02E8 */    0xE0, 0x39, 0x16, 0x9F, 0x56, 0x00, 0x7E, 0xFC, 
                /* 02F0 */    0xFF, 0x4F, 0x2B, 0xC0, 0xF1, 0x5C, 0xF1, 0xB4, 
                /* 02F8 */    0x02, 0xB0, 0x11, 0xFC, 0x69, 0x05, 0xF3, 0xFF, 
                /* 0300 */    0x3F, 0xAD, 0x00, 0xC7, 0xC1, 0xF8, 0xB4, 0x02, 
                /* 0308 */    0x3C, 0xC7, 0xE2, 0xD3, 0x0A, 0xE0, 0x44, 0xA1, 
                /* 0310 */    0x4D, 0x9F, 0x1A, 0x8D, 0x5A, 0x35, 0x28, 0x53, 
                /* 0318 */    0xA3, 0x4C, 0x83, 0x5A, 0x7D, 0x2A, 0x35, 0x66, 
                /* 0320 */    0xCC, 0x0D, 0x94, 0x02, 0x3E, 0x03, 0x74, 0x1E, 
                /* 0328 */    0xB0, 0xBC, 0x37, 0x83, 0x40, 0x2C, 0x83, 0x42, 
                /* 0330 */    0x20, 0x96, 0xFE, 0x64, 0x11, 0x88, 0x83, 0x83, 
                /* 0338 */    0xD0, 0x78, 0xEF, 0x0D, 0x81, 0x58, 0xB4, 0x09, 
                /* 0340 */    0x10, 0x16, 0x19, 0x84, 0x06, 0x53, 0x01, 0xC2, 
                /* 0348 */    0xE4, 0xDA, 0x00, 0x61, 0x61, 0x41, 0x68, 0x24, 
                /* 0350 */    0x1D, 0x20, 0x4C, 0xA8, 0x11, 0x10, 0x16, 0x13, 
                /* 0358 */    0x84, 0x86, 0x51, 0x02, 0xC2, 0x24, 0x5A, 0x01, 
                /* 0360 */    0x61, 0x01, 0x41, 0xF4, 0xFF, 0x07, 0x71, 0x0C, 
                /* 0368 */    0x2D, 0x20, 0x4C, 0x9C, 0x19, 0x10, 0x16, 0x0D, 
                /* 0370 */    0x84, 0x06, 0x50, 0x03, 0xC2, 0x64, 0xD9, 0x01, 
                /* 0378 */    0x61, 0xA1, 0x40, 0xA8, 0x74, 0x3D, 0x20, 0x4C, 
                /* 0380 */    0x90, 0x21, 0x10, 0x16, 0x07, 0x84, 0x8A, 0x56, 
                /* 0388 */    0x04, 0xC2, 0xFE, 0xFF
            })
        }
    }

    Scope (_SB.PCI0.IXVE.IGPU)
    {
        Name (ERR0, Buffer (0x04)
        {
            0x00, 0x00, 0x00, 0x00
        })
        Name (ERR1, Buffer (0x04)
        {
            0x01, 0x00, 0x00, 0x80
        })
        Name (ERR2, Buffer (0x04)
        {
            0x02, 0x00, 0x00, 0x80
        })
        Name (VER1, Buffer (0x04)
        {
            0x01, 0x00, 0x00, 0x00
        })
        Method (NVIF, 3, NotSerialized)
        {
            Store (ERR1, Local0)
            If (LEqual (Arg0, One))
            {
                Concatenate (ERR0, VER1, Local0)
            }
            Else
            {
                If (LEqual (Arg0, 0x0D))
                {
                    If (LEqual (Arg1, Zero))
                    {
                        Store (ERR0, Local0)
                    }
                    Else
                    {
                        If (LEqual (Arg1, 0x02))
                        {
                            If (LEqual (NIMP, One))
                            {
                                Concatenate (ERR0, CIMP (), Local0)
                            }
                        }
                        Else
                        {
                            If (LEqual (Arg1, 0x03))
                            {
                                If (LEqual (SVEN, One))
                                {
                                    Name (BFD1, Buffer (0x06)
                                    {
                                        0x10, 0x06, 0x01, 0x06, 0x00, 0x00
                                    })
                                    CreateField (BFD1, 0x20, 0x10, SVMS)
                                    Store (SVSS, SVMS)
                                    Concatenate (ERR0, BFD1, Local0)
                                }
                            }
                        }
                    }
                }
                Else
                {
                    If (LEqual (Arg0, 0x0C))
                    {
                        If (LEqual (Arg1, Zero))
                        {
                            Store (ERR0, Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg1, One))
                            {
                                If (CondRefOf (HDCB, Local6))
                                {
                                    Store (HDCB, Local1)
                                    Concatenate (ERR0, Local1, Local0)
                                }
                                Else
                                {
                                    Store (ERR1, Local0)
                                }
                            }
                        }
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x09)) {}
                        Else
                        {
                            If (LEqual (Arg0, 0x0B)) {}
                        }
                    }
                }
            }

            Return (Local0)
        }
    }

    Scope (_SB.PCI0.IXVE)
    {
        OperationRegion (PE19, PCI_Config, 0x19, One)
        Field (PE19, ByteAcc, NoLock, Preserve)
        {
            PSBN,   8
        }
    }

    Scope (_SB.PCI0.IXVE.IGPU)
    {
        Method (GBUS, 0, NotSerialized)
        {
            Return (PSBN)
        }

        Name (HCBF, Buffer (One)
        {
            0x00
        })
        Name (HCTG, Buffer (One)
        {
            0x00
        })
        Name (DDCA, Buffer (0x80)
        {
            0x00
        })
        Name (DDCB, Buffer (0x80)
        {
            0x00
        })
        Name (DGHC, Buffer (0x04)
        {
            0x00, 0x00, 0x00, 0x00
        })
        Method (DGON, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0xFF))
            {
                Store (Zero, Local0)
                While (One)
                {
                    Store (DerefOf (Index (DGHC, Local0)), Local1)
                    If (Local1)
                    {
                        WBYT (Local1, 0xF0, 0xF2)
                    }

                    Sleep (0x0A)
                    Increment (Local0)
                    If (LEqual (Local0, 0x04))
                    {
                        Break
                    }
                }
            }
            Else
            {
                Store (DerefOf (Index (DGHC, Arg0)), Local0)
                If (Local0)
                {
                    WBYT (Local0, 0xF0, 0xF2)
                }
            }

            Sleep (0x0190)
        }

        Method (DGOF, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0xFF))
            {
                Store (Zero, Local0)
                While (One)
                {
                    Store (DerefOf (Index (DGHC, Local0)), Local1)
                    If (Local1)
                    {
                        WBYT (Local1, 0xF0, 0xF0)
                    }

                    Increment (Local0)
                    If (LEqual (Local0, 0x04))
                    {
                        Break
                    }
                }
            }
            Else
            {
                Store (DerefOf (Index (DGHC, Arg0)), Local0)
                If (Local0)
                {
                    WBYT (Local0, 0xF0, 0xF0)
                }
            }
        }

        Method (HSTA, 1, NotSerialized)
        {
            Store (DerefOf (Index (DGHC, Arg0)), Local0)
            If (Local0)
            {
                Store (RBYT (Local0, 0x10), Local1)
                If (LEqual (And (Local1, 0x12), 0x02))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Else
            {
                Return (One)
            }
        }

			        Method (_DSM, 4, NotSerialized)
			        {

			    			If (CMPB (Arg0, Buffer (0x10)
			                    {
			                        /* 0000 */    0xA0, 0xA0, 0x95, 0x9D, 0x60, 0x00, 0x48, 0x4D, 
			                        /* 0008 */    0xB3, 0x4D, 0x7E, 0x5F, 0xEA, 0x12, 0x9F, 0xD4
			                    }))
			            {
			                If (LNotEqual (Arg1, 0x0102))
			                {
			                    Return (0x80000002)
			                }

			                If (LEqual (Arg2, Zero))
			                {
			                    Return (0xFF8B)
			                }

			                If (LEqual (Arg2, One))
			                {
			                    If (HYCM)
			                    {
			                        Return (Buffer (0x04)
			                        {
			                            0x01, 0x00, 0x00, 0x00
			                        })
			                    }
			                    Else
			                    {
			                        Return (Buffer (0x04)
			                        {
			                            0x00
			                        })
			                    }
			                }

			                If (LEqual (Arg2, 0x02))
			                {
			                    Return (Buffer (0x04)
			                    {
			                        0x00
			                    })
			                }

			                If (LEqual (Arg2, 0x03))
			                {
			                    Store (DerefOf (Index (Arg3, One)), Local0)
			                    CreateByteField (Arg3, Zero, PWFC)
			                    If (LEqual (PWFC, One))
			                    {
			                        DGON (Local0)
			                    }
			                    Else
			                    {
			                        If (LEqual (PWFC, 0x02))
			                        {
			                            DGOF (Local0)
			                        }
			                        Else
			                        {
			                            Return (HSTA (Local0))
			                        }
			                    }
			                }

			                If (LEqual (Arg2, 0x04))
			                {
			                    Return (Buffer (0x04)
			                    {
			                        0x00
			                    })
			                }

			                If (LEqual (Arg2, 0x05))
			                {
			                    Return (Buffer (0x04)
			                    {
			                        0x00
			                    })
			                }

			                If (LEqual (Arg2, 0x07))
			                {
			                    If (LEqual (SLOW, One))
			                    {
			                        Store (0x966A, ^^^SBUS.SMT2)
			                    }

			                    Return (Package (0x05)
			                    {
			                        0xC6, 
			                        0xC8, 
			                        0xCA, 
			                        0xCC, 
			                        0xCE
			                    })
			                }

			                If (LEqual (Arg2, 0x08))
			                {
			                    CreateByteField (Arg3, Zero, SIND)
			                    CreateByteField (Arg3, One, SADR)
			                    Store (SADR, Index (DGHC, SIND))
			                }

			                If (LEqual (Arg2, 0x09))
			                {
			                    CreateByteField (Arg3, Zero, SLAV)
			                    CreateByteField (Arg3, One, CMND)
			                    Return (RBYT (SLAV, CMND))
			                }

			                If (LEqual (Arg2, 0x0A))
			                {
			                    CreateByteField (Arg3, Zero, SLAW)
			                    CreateByteField (Arg3, One, CMNW)
			                    SRBY (SLAW, CMNW)
			                }

			                If (LEqual (Arg2, 0x0B))
			                {
			                    If (Not (Arg3))
			                    {
			                        Return (HCBF)
			                    }
			                }

			                If (LEqual (Arg2, 0x0C))
			                {
			                    CreateByteField (Arg3, Zero, SLAX)
			                    CreateByteField (Arg3, One, NDDC)
			                    If (LEqual (NDDC, One))
			                    {
			                        WBYT (SLAX, 0xF0, 0xF4)
			                    }
			                    Else
			                    {
			                        WBYT (SLAX, 0xF0, 0xF3)
			                    }

			                    Store (SMRB (SLAX, 0xF5), Local0)
			                    Store (SMRB (SLAX, 0xF6), Local1)
			                    Concatenate (Local0, Local1, Local2)
			                    Store (SMRB (SLAX, 0xF7), Local0)
			                    Concatenate (Local2, Local0, Local1)
			                    Store (SMRB (SLAX, 0xF8), Local0)
			                    Concatenate (Local1, Local0, Local2)
			                    If (LEqual (NDDC, One))
			                    {
			                        Store (Local2, DDCB)
			                    }
			                    Else
			                    {
			                        Store (Local2, DDCA)
			                    }

			                    Store (SLAX, HCTG)
			                    Return (0x03)
			                }

			                If (LEqual (Arg2, 0x0D))
			                {
			                    CreateByteField (Arg3, Zero, SLAY)
			                    CreateByteField (Arg3, One, NDDY)
			                    If (LEqual (HCTG, SLAY))
			                    {
			                        If (LEqual (NDDY, One))
			                        {
			                            Return (DDCB)
			                        }
			                        Else
			                        {
			                            Return (DDCA)
			                        }
			                    }
			                }

			                If (LEqual (Arg2, 0x0E))
			                {
			                    Return (CIMP ())
			                }

			                If (LEqual (Arg2, 0x0F))
			                {
			                    If (LEqual (SVEN, One))
			                    {
			                        Name (BFD1, Buffer (0x06)
			                        {
			                            0x10, 0x06, 0x01, 0x06, 0x00, 0x00
			                        })
			                        CreateField (BFD1, 0x20, 0x10, SVMS)
			                        Store (SVSS, SVMS)
			                        Return (BFD1)
			                    }
			                }

			                If (LEqual (Arg2, 0x10))
			                {
			                    CreateWordField (Arg3, 0x02, USRG)
			                    If (LEqual (USRG, 0x484B))
			                    {
			                        If (CondRefOf (HDCB, Local7))
			                        {
			                            Return (HDCB)
			                        }
			                    }
			                }

			                Return (Zero)
			            }

							 		Store (Package (0x24)
									{
										"@0,NVMT",
										Buffer (0x42)
										{
										/* 0000 */	0x0a, 0x03, 0x7f, 0x20, 0x4c, 0x2d, 0x1c, 0x02,
										/* 0008 */	0x78, 0x05, 0x1a, 0x04, 0x48, 0x07, 0xd0, 0x05, 
										/* 0010 */	0x60, 0x06, 0x00, 0x00, 0x41, 0x04, 0x1d, 0x04, 
										/* 0018 */	0x21, 0x04, 0x00, 0x00, 0xf0, 0xc1, 0x41, 0x07, 
										/* 0020 */	0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0xff, 
										/* 0028 */	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
										/* 0030 */	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
										/* 0038	*/	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
										/* 0040 */	0x00, 0x00
										},

										"@0,compatible",
										Buffer (0x0B)
										{
											"NVDA,NVMac"
										},

										"@0,device_type",
										Buffer (0x08)
										{
											"display"
										},

										"@0,fboffset",
										Buffer (0x04)
										{
											0x00, 0x00, 0x02, 0x00
										},

										"@0,name",
										Buffer (0x0E)
										{
											"NVDA,Display-A"
										},

										"@1,compatible",
										Buffer (0x0B)
										{
											"NVDA,NVMac"
										},

										"@1,device_type",
										Buffer (0x08)
										{
											"display"
										},

										"@1,name",
										Buffer (0x0E)
										{
											"NVDA,Display-B"
										},

										"@2,compatible",
										Buffer (0x13)
										{
											"NVDA,sensor-parent"
										},

										"@2,device_type",
										Buffer (0x0f)
										{
											"NVDA,gpu-diode"
										},

										"@2,hwctrl-params-version",
										Buffer (0x04)
										{
										0x00, 0x00, 0x00, 0x02
										},

										"@2,hwsensor-params-version",
										Buffer (0x04)
										{
										0x00, 0x00, 0x00, 0x02
										},

										"@2,name",
										Buffer (0x0E)
										{
											"sensor-parent"
										},

										"@2,reg",
										Buffer (0x04)
										{
										0x00, 0x00, 0x00, 0x02
										},

										"NVCAP",
										Buffer (0x14)
										{
										/* 0000 */  0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00,
										/* 0008 */  0x0c, 0x00,	0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
										/* 0010 */  0x00, 0x00,	0x00, 0x00
										},

										"NVPM",
										Buffer (0x14)
										{
										/* 0000 */  0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00,
										/* 0008 */  0x0e, 0x00,	0x00, 0x00, 0x00, 0x00, 0x00, 0x07,
										/* 0010 */  0x00, 0x00,	0x00, 0x00
										},

										"device_type",
										Buffer (0x0D)
										{
											"NVDA,GeForce"
										},

										"model",
										Buffer (0x14)
										{
											"NVIDIA GeForce 9300"
										}

									}, Local0)
									DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
									Return (Local0)
							        }

		        Method (_DOD, 0, NotSerialized)
		        {
		            Return (Package (0x06)
		            {
		                0x0110, 
		                0x80000100, 
		                0x80000200, 
		                0x80007330, 
		                0x80046340, 
		                0x80040320
		            })
		        }

		 //       Device (CRT0)
		 //       {
		 //           Method (_ADR, 0, NotSerialized)
		 //           {
		 //               Return (0x80000100)
		 //           }
		 //       }

		 //       Device (LCD0)
		 //       {
		 //           Method (_ADR, 0, NotSerialized)
		 //           {
		 //               Return (0x0110)
		 //           }
		 //       }

		 //       Device (DDVI)
		 //       {
		 //           Method (_ADR, 0, NotSerialized)
		 //           {
		 //               Return (0x80040320)
		 //           }
		 //       }

		    }

    Scope (_SB)
    {
        Name (XCPD, Zero)
        Name (XNPT, One)
        Name (XCAP, 0x02)
        Name (XDCP, 0x04)
        Name (XDCT, 0x08)
        Name (XDST, 0x0A)
        Name (XLCP, 0x0C)
        Name (XLCT, 0x10)
        Name (XLST, 0x12)
        Name (XSCP, 0x14)
        Name (XSCT, 0x18)
        Name (XSST, 0x1A)
        Name (XRCT, 0x1C)
        Mutex (MUTE, 0x00)
        Method (RBPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, One)
            Field (PCFG, ByteAcc, NoLock, Preserve)
            {
                XCFG,   8
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (RWPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFE, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x02)
            Field (PCFG, WordAcc, NoLock, Preserve)
            {
                XCFG,   16
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (RDPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (WBPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, One)
            Field (PCFG, ByteAcc, NoLock, Preserve)
            {
                XCFG,   8
            }

            Store (Arg1, XCFG)
            Release (MUTE)
        }

        Method (WWPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFE, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x02)
            Field (PCFG, WordAcc, NoLock, Preserve)
            {
                XCFG,   16
            }

            Store (Arg1, XCFG)
            Release (MUTE)
        }

        Method (WDPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            Store (Arg1, XCFG)
            Release (MUTE)
        }

        Method (RWDP, 3, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            And (XCFG, Arg2, Local1)
            Or (Local1, Arg1, XCFG)
            Release (MUTE)
        }

        Method (RPME, 1, NotSerialized)
        {
            Add (Arg0, 0x84, Local0)
            Store (RDPE (Local0), Local1)
            If (LEqual (Local1, Ones))
            {
                Return (Zero)
            }
            Else
            {
                If (LAnd (Local1, 0x00010000))
                {
                    WDPE (Local0, And (Local1, 0x00010000))
                    Return (One)
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Name (SUPP, Zero)
        Name (CTRL, Zero)
        Method (_OSC, 4, NotSerialized)
        {
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */    0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40, 
                        /* 0008 */    0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                    }))
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                Store (CDW2, SUPP)
                Store (CDW3, CTRL)
                If (LNotEqual (And (SUPP, 0x16), 0x16))
                {
                    And (CTRL, 0x0C, CTRL)
                }

                And (CTRL, 0x0C, CTRL)
                If (Not (And (CDW1, One)))
                {
                    If (And (CTRL, One)) {}
                    If (And (CTRL, 0x04))
                    {
                        ^SBUS.GPMD (One)
                        Store (One, ^SBUS.XPME)
                    }

                    If (And (CTRL, 0x10)) {}
                }

                If (LNotEqual (Arg1, One))
                {
                    Or (CDW1, 0x08, CDW1)
                }

                If (LNotEqual (CDW3, CTRL))
                {
                    Or (CDW1, 0x10, CDW1)
                }

                Store (CTRL, CDW3)
                Return (Arg3)
            }
            Else
            {
                Or (CDW1, 0x04, CDW1)
                Return (Arg3)
            }
        }
    }

    Method (SBYT, 2, NotSerialized)
    {
    }

    Method (WBYT, 3, NotSerialized)
    {
    }

    Method (WWRD, 3, NotSerialized)
    {
    }

    Method (RSBT, 2, NotSerialized)
    {
        Store (Zero, Local0)
        Return (Local0)
    }

    Method (RBYT, 2, NotSerialized)
    {
        Store (Zero, Local0)
        Return (Local0)
    }

    Method (RWRD, 2, NotSerialized)
    {
        Store (Zero, Local0)
        Return (Local0)
    }

    Method (WBLK, 4, NotSerialized)
    {
    }

    Method (RBLK, 3, NotSerialized)
    {
        Store (Zero, Local0)
        Return (Local0)
    }

    Name (FZTF, Buffer (0x07)
    {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF5
    })
    Scope (_SB.PCI0.LPCB.SIOR)
    {
        Method (HWV0, 0, NotSerialized)
        {
            Return (Multiply (VCOR, 0x08))
        }

        Method (HWV1, 0, NotSerialized)
        {
            Multiply (V12V, 0x08, Local0)
            Return (Local0)
        }

        Method (HWV3, 0, NotSerialized)
        {
            Multiply (V33V, 0x08, Local0)
            Return (Local0)
        }

        Method (HWV5, 0, NotSerialized)
        {
            Multiply (V50V, 0x08, Local0)
            Return (Local0)
        }

        Method (HWT0, 0, NotSerialized)
        {
            Store (MBTE, Local1)
            Multiply (Local1, 0x0A, Local1)
            Return (Local1)
        }

        Method (HWT1, 0, NotSerialized)
        {
            Store (One, BSEL)
            Store (TSR1, Local1)
            Multiply (Local1, 0x0A, Local1)
            Store (TSR2, Local2)
            Multiply (Local2, 0x05, Local2)
            Add (Local1, Local2, Local1)
            Return (Local1)
        }

        Method (HWT2, 0, NotSerialized)
        {
            Store (0x02, BSEL)
            Store (TSR1, Local1)
            Multiply (Local1, 0x0A, Local1)
            Store (TSR2, Local2)
            Multiply (Local2, 0x05, Local2)
            Add (Local1, Local2, Local1)
            Return (Local1)
        }

        Method (HWF0, 0, NotSerialized)
        {
            Store (FAN1, Local0)
            Store (Zero, BSEL)
            And (FD21, 0x20, Local1)
            ShiftRight (Local1, 0x05, Local1)
            Multiply (Local1, 0x04, Local1)
            Add (Local1, FD11, Local1)
            While (LOr (LAnd (LGreater (Local0, 0xE6), LLess (Local1, 0x07)), LAnd (
                LLess (Local0, 0x64), LGreater (Local1, Zero))))
            {
                If (LAnd (LGreater (Local0, 0xE6), LLess (Local1, 0x07)))
                {
                    Add (Local1, One, Local1)
                    Divide (Local1, 0x04, Local2, Local3)
                    Store (Zero, BSEL)
                    ShiftLeft (Local3, 0x05, Local3)
                    Store (FD21, Local4)
                    And (Local4, 0xDF, Local4)
                    Or (Local3, Local4, FD21)
                    Store (Local2, FD11)
                    Sleep (0x012C)
                    Store (FAN1, Local0)
                }
                Else
                {
                    Subtract (Local1, One, Local1)
                    Divide (Local1, 0x04, Local2, Local3)
                    Store (Zero, BSEL)
                    ShiftLeft (Local3, 0x05, Local3)
                    Store (FD21, Local4)
                    And (Local4, 0xDF, Local4)
                    Or (Local3, Local4, FD21)
                    Store (Local2, FD11)
                    Sleep (0x012C)
                    Store (FAN1, Local0)
                }
            }

            If (LAnd (LEqual (Local0, 0xFF), LEqual (Local1, 0x07)))
            {
                Return (Zero)
            }

            If (LAnd (LEqual (Local0, Zero), LEqual (Local1, Zero)))
            {
                Return (0xFFFF)
            }

            Store (One, Local2)
            While (Local1)
            {
                Multiply (Local2, 0x02, Local2)
                Decrement (Local1)
            }

            Multiply (Local0, Local2, Local0)
            Divide (0x00149970, Local0, Local1, Local0)
            Return (Local0)
        }

        Method (HWF1, 0, NotSerialized)
        {
            Store (FAN2, Local0)
            Store (Zero, BSEL)
            And (FD21, 0x40, Local1)
            ShiftRight (Local1, 0x06, Local1)
            Multiply (Local1, 0x04, Local1)
            Add (Local1, FD12, Local1)
            While (LOr (LAnd (LGreater (Local0, 0xE6), LLess (Local1, 0x07)), LAnd (
                LLess (Local0, 0x64), LGreater (Local1, Zero))))
            {
                If (LAnd (LGreater (Local0, 0xE6), LLess (Local1, 0x07)))
                {
                    Add (Local1, One, Local1)
                    Divide (Local1, 0x04, Local2, Local3)
                    Store (Zero, BSEL)
                    ShiftLeft (Local3, 0x06, Local3)
                    Store (FD21, Local4)
                    And (Local4, 0xBF, Local4)
                    Or (Local3, Local4, FD21)
                    Store (Local2, FD12)
                    Sleep (0x07D0)
                    Store (FAN2, Local0)
                }
                Else
                {
                    Subtract (Local1, One, Local1)
                    Divide (Local1, 0x04, Local2, Local3)
                    Store (Zero, BSEL)
                    ShiftLeft (Local3, 0x06, Local3)
                    Store (FD21, Local4)
                    And (Local4, 0xBF, Local4)
                    Or (Local3, Local4, FD21)
                    Store (Local2, FD12)
                    Sleep (0x07D0)
                    Store (FAN2, Local0)
                }
            }

            If (LAnd (LEqual (Local0, 0xFF), LEqual (Local1, 0x07)))
            {
                Return (Zero)
            }

            If (LAnd (LEqual (Local0, Zero), LEqual (Local1, Zero)))
            {
                Return (0xFFFF)
            }

            Store (One, Local2)
            While (Local1)
            {
                Multiply (Local2, 0x02, Local2)
                Decrement (Local1)
            }

            Multiply (Local0, Local2, Local0)
            Divide (0x00149970, Local0, Local1, Local0)
            Return (Local0)
        }

        Method (HWF2, 0, NotSerialized)
        {
            Store (FAN3, Local0)
            Store (Zero, BSEL)
            Store (FD4C, Local1)
            And (Local1, 0x80, Local1)
            ShiftRight (Local1, 0x07, Local1)
            Multiply (Local1, 0x04, Local1)
            Store (FD59, Local3)
            And (Local3, 0x03, Local3)
            Add (Local1, Local3, Local1)
            While (LOr (LAnd (LGreater (Local0, 0xE6), LLess (Local1, 0x07)), LAnd (
                LLess (Local0, 0x64), LGreater (Local1, Zero))))
            {
                If (LAnd (LGreater (Local0, 0xE6), LLess (Local1, 0x07)))
                {
                    Add (Local1, One, Local1)
                    Divide (Local1, 0x04, Local2, Local3)
                    Store (Zero, BSEL)
                    ShiftLeft (Local3, 0x07, Local3)
                    Store (FD4C, Local4)
                    And (Local4, 0x7F, Local4)
                    Or (Local3, Local4, FD4C)
                    Store (FD59, Local3)
                    And (Local3, 0xFC, Local3)
                    Add (Local3, Local2, Local2)
                    Store (Local2, FD59)
                    Sleep (0x012C)
                    Store (FAN3, Local0)
                }
                Else
                {
                    Subtract (Local1, One, Local1)
                    Divide (Local1, 0x04, Local2, Local3)
                    Store (Zero, BSEL)
                    ShiftLeft (Local3, 0x07, Local3)
                    Store (FD4C, Local4)
                    And (Local4, 0x7F, Local4)
                    Or (Local3, Local4, FD4C)
                    Store (FD59, Local3)
                    And (Local3, 0xFC, Local3)
                    Add (Local3, Local2, Local2)
                    Store (Local2, FD59)
                    Sleep (0x012C)
                    Store (FAN3, Local0)
                }
            }

            If (LAnd (LEqual (Local0, 0xFF), LEqual (Local1, 0x07)))
            {
                Return (Zero)
            }

            If (LAnd (LEqual (Local0, Zero), LEqual (Local1, Zero)))
            {
                Return (0xFFFF)
            }

            Store (One, Local2)
            While (Local1)
            {
                Multiply (Local2, 0x02, Local2)
                Decrement (Local1)
            }

            Multiply (Local0, Local2, Local0)
            Divide (0x00149970, Local0, Local1, Local0)
            Return (Local0)
        }

        OperationRegion (HWRE, SystemIO, IOHW, 0x0A)
        Field (HWRE, ByteAcc, NoLock, Preserve)
        {
                    Offset (0x05), 
            HIDX,   8, 
            HDAT,   8
        }

        IndexField (HIDX, HDAT, ByteAcc, NoLock, Preserve)
        {
                    Offset (0x04), 
            CHNM,   1, 
            CFNM,   1, 
            CHNS,   2, 
            CFNS,   2, 
                    Offset (0x05), 
            SYST,   8, 
            TRGT,   8, 
                    Offset (0x08), 
            SSDN,   8, 
            CSDN,   8, 
            SSUP,   8, 
            CSUP,   8, 
                    Offset (0x20), 
            VCOR,   8, 
            V12V,   8, 
                    Offset (0x23), 
            V33V,   8, 
                    Offset (0x25), 
            V50V,   8, 
                    Offset (0x27), 
            MBTE,   8, 
            FAN1,   8, 
            FAN2,   8, 
                    Offset (0x3F), 
            FAN3,   8, 
            HWST,   1, 
                    Offset (0x41), 
                    Offset (0x47), 
                ,   4, 
            FD11,   2, 
            FD12,   2, 
                    Offset (0x4B), 
            FD13,   8, 
            FD4C,   8, 
                    Offset (0x4E), 
            BSEL,   3, 
                    Offset (0x4F), 
                    Offset (0x50), 
            TSR1,   8, 
            TSR2,   1, 
                    Offset (0x52), 
                    Offset (0x59), 
            FD59,   8, 
                    Offset (0x5D), 
            FD21,   8
        }
    }

    Scope (\)
    {
        Field (RAMW, ByteAcc, NoLock, Preserve)
        {
                    Offset (0x20), 
            CPUQ,   8, 
            CPVL,   16, 
            CPVH,   16, 
            CPVC,   1
        }
    }

    Scope (_SB.PCI0.LPCB.ASOC)
    {
        Mutex (AMTX, 0x00)
        Name (CORV, Package (0x05)
        {
            0x06020000, 
            "Vcore Voltage", 
            0x0352, 
            0x0640, 
            One
        })
        Name (V3VV, Package (0x05)
        {
            0x06020001, 
            " +3.3 Voltage", 
            0x0B9A, 
            0x0E2E, 
            One
        })
        Name (V5VV, Package (0x05)
        {
            0x06020002, 
            " +5 Voltage", 
            0x1194, 
            0x157C, 
            One
        })
        Name (VV12, Package (0x05)
        {
            0x06020003, 
            " +12 Voltage", 
            0x27D8, 
            0x35E8, 
            One
        })
        Name (VPAR, Package (0x04)
        {
            Package (0x03)
            {
                Zero, 
                One, 
                Zero
            }, 

            Package (0x03)
            {
                0x22, 
                0x22, 
                Zero
            }, 

            Package (0x03)
            {
                0x16, 
                0x0A, 
                Zero
            }, 

            Package (0x03)
            {
                0x38, 
                0x0A, 
                Zero
            }
        })
        Name (VBUF, Package (0x05)
        {
            0x04, 
            CORV, 
            V3VV, 
            V5VV, 
            VV12
        })
        Method (VGET, 1, NotSerialized)
        {
            Store (Zero, Local0)
            If (LEqual (Arg0, Zero))
            {
                Store (^^SIOR.HWV0 (), Local0)
            }

            If (LEqual (Arg0, One))
            {
                Store (^^SIOR.HWV3 (), Local0)
            }

            If (LEqual (Arg0, 0x02))
            {
                Store (^^SIOR.HWV5 (), Local0)
            }

            If (LEqual (Arg0, 0x03))
            {
                Store (^^SIOR.HWV1 (), Local0)
            }

            Return (Local0)
        }

        Name (CPUT, Package (0x05)
        {
            0x06030000, 
            "CPU Temperature", 
            0x0258, 
            0x03B6, 
            0x00010001
        })
        Name (MBTP, Package (0x05)
        {
            0x06030001, 
            "MB Temperature", 
            0x01C2, 
            0x03B6, 
            0x00010001
        })
        Name (TBUF, Package (0x03)
        {
            0x02, 
            CPUT, 
            MBTP
        })
        Method (TGET, 1, NotSerialized)
        {
            Store (Zero, Local0)
            If (LEqual (Arg0, Zero))
            {
                Store (^^SIOR.HWT2 (), Local0)
            }

            If (LEqual (Arg0, One))
            {
                Store (^^SIOR.HWT0 (), Local0)
            }

            Return (Local0)
        }

        Name (CPUF, Package (0x05)
        {
            0x06040000, 
            "CPU FAN Speed", 
            0x0258, 
            0x1C20, 
            0x00010001
        })
        Name (CHAF, Package (0x05)
        {
            0x06040001, 
            "CHASSIS FAN Speed", 
            0x0258, 
            0x1C20, 
            0x00010001
        })
        Name (PWRF, Package (0x05)
        {
            0x06040002, 
            "POWER FAN Speed", 
            0x0258, 
            0x1C20, 
            0x00010001
        })
        Name (FBUF, Package (0x04)
        {
            0x03, 
            CPUF, 
            CHAF, 
            PWRF
        })
        Method (FGET, 1, NotSerialized)
        {
            Store (Zero, Local0)
            If (LEqual (Arg0, Zero))
            {
                Store (^^SIOR.HWF1 (), Local0)
            }

            If (LEqual (Arg0, One))
            {
                Store (^^SIOR.HWF0 (), Local0)
            }

            If (LEqual (Arg0, 0x02))
            {
                Store (^^SIOR.HWF2 (), Local0)
            }

            Return (Local0)
        }

        Name (QCFN, Package (0x06)
        {
            0x04060003, 
            "CPU Q-Fan Control", 
            Zero, 
            One, 
            0x02, 
            0x00010001
        })
        Name (QBUF, Package (0x02)
        {
            One, 
            QCFN
        })
        Method (VSIF, 0, Serialized)
        {
            Return (VBUF)
        }

        Method (RVLT, 1, Serialized)
        {
            Acquire (AMTX, 0xFFFF)
            And (Arg0, 0xFFFF, Local0)
            Store (VGET (Local0), Local1)
            Store (DerefOf (Index (DerefOf (Index (VPAR, Local0)), Zero)), 
                Local2)
            Store (DerefOf (Index (DerefOf (Index (VPAR, Local0)), One)), 
                Local3)
            Store (DerefOf (Index (DerefOf (Index (VPAR, Local0)), 0x02)), 
                Local4)
            Multiply (Local1, Add (Local2, Local3), Local5)
            Divide (Local5, Local3, , Local5)
            Add (Local5, Local4, Local5)
            Release (AMTX)
            Return (Local5)
        }

        Method (SVLT, 1, Serialized)
        {
            Acquire (AMTX, 0xFFFF)
            And (DerefOf (Index (Arg0, Zero)), 0xFFFF, Local0)
            Store (DerefOf (Index (VBUF, Zero)), Local1)
            If (LGreaterEqual (Local0, Local1))
            {
                Release (AMTX)
                Return (Zero)
            }

            Increment (Local0)
            Store (DerefOf (Index (Arg0, One)), Index (DerefOf (Index (VBUF, 
                Local0)), One))
            Store (DerefOf (Index (Arg0, 0x02)), Index (DerefOf (Index (VBUF, 
                Local0)), 0x02))
            Store (DerefOf (Index (Arg0, 0x03)), Index (DerefOf (Index (VBUF, 
                Local0)), 0x03))
            Store (DerefOf (Index (Arg0, 0x04)), Index (DerefOf (Index (VBUF, 
                Local0)), 0x04))
            Release (AMTX)
            Return (One)
        }

        Method (TSIF, 0, Serialized)
        {
            Return (TBUF)
        }

        Method (RTMP, 1, NotSerialized)
        {
            Acquire (AMTX, 0xFFFF)
            And (Arg0, 0xFFFF, Local0)
            Store (TGET (Local0), Local1)
            Release (AMTX)
            Return (Local1)
        }

        Method (STMP, 1, Serialized)
        {
            Acquire (AMTX, 0xFFFF)
            Store (And (DerefOf (Index (Arg0, Zero)), 0xFFFF), Local0)
            Store (DerefOf (Index (TBUF, Zero)), Local1)
            If (LGreaterEqual (Local0, Local1))
            {
                Release (AMTX)
                Return (Zero)
            }

            Increment (Local0)
            Store (DerefOf (Index (Arg0, One)), Index (DerefOf (Index (TBUF, 
                Local0)), One))
            Store (DerefOf (Index (Arg0, 0x02)), Index (DerefOf (Index (TBUF, 
                Local0)), 0x02))
            Store (DerefOf (Index (Arg0, 0x03)), Index (DerefOf (Index (TBUF, 
                Local0)), 0x03))
            Store (DerefOf (Index (Arg0, 0x04)), Index (DerefOf (Index (TBUF, 
                Local0)), 0x04))
            Release (AMTX)
            Return (One)
        }

        Method (FSIF, 0, Serialized)
        {
            Return (FBUF)
        }

        Method (RFAN, 1, Serialized)
        {
            Acquire (AMTX, 0xFFFF)
            And (Arg0, 0xFFFF, Local0)
            Store (FGET (Local0), Local1)
            Release (AMTX)
            Return (Local1)
        }

        Method (SFAN, 1, Serialized)
        {
            Acquire (AMTX, 0xFFFF)
            And (DerefOf (Index (Arg0, Zero)), 0xFFFF, Local0)
            Store (DerefOf (Index (FBUF, Zero)), Local1)
            If (LGreaterEqual (Local0, Local1))
            {
                Release (AMTX)
                Return (Zero)
            }

            Increment (Local0)
            Store (DerefOf (Index (Arg0, One)), Index (DerefOf (Index (FBUF, 
                Local0)), One))
            Store (DerefOf (Index (Arg0, 0x02)), Index (DerefOf (Index (FBUF, 
                Local0)), 0x02))
            Store (DerefOf (Index (Arg0, 0x03)), Index (DerefOf (Index (FBUF, 
                Local0)), 0x03))
            Store (DerefOf (Index (Arg0, 0x04)), Index (DerefOf (Index (FBUF, 
                Local0)), 0x04))
            Release (AMTX)
            Return (One)
        }

        Method (QFIF, 0, NotSerialized)
        {
            If (LEqual (CPUQ, Zero))
            {
                And (DerefOf (Index (QCFN, 0x05)), 0xFFFDFFFF, Local0)
                Store (Local0, Index (QCFN, 0x05))
            }
            Else
            {
                Or (DerefOf (Index (QCFN, 0x05)), 0x00020000, Local0)
                Store (Local0, Index (QCFN, 0x05))
            }

            Return (QBUF)
        }

        Method (GCQV, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (CPVL)
            }

            If (LEqual (Arg0, One))
            {
                Return (CPVH)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (CPVC)
            }

            Return (Zero)
        }

        Method (QFST, 1, NotSerialized)
        {
            If (LEqual (Arg0, DerefOf (Index (QCFN, Zero))))
            {
                Return (CQST)
            }

            Return (Zero)
        }
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Name (CRS, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, _Y1E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y1F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y20, AddressRangeMemory, TypeStatic)
            })
            CreateDWordField (CRS, \_SB.PCI0._Y1E._MIN, MIN5)
            CreateDWordField (CRS, \_SB.PCI0._Y1E._MAX, MAX5)
            CreateDWordField (CRS, \_SB.PCI0._Y1E._LEN, LEN5)
            CreateDWordField (CRS, \_SB.PCI0._Y1F._MIN, MIN6)
            CreateDWordField (CRS, \_SB.PCI0._Y1F._MAX, MAX6)
            CreateDWordField (CRS, \_SB.PCI0._Y1F._LEN, LEN6)
            CreateDWordField (CRS, \_SB.PCI0._Y20._MIN, MIN7)
            CreateDWordField (CRS, \_SB.PCI0._Y20._MAX, MAX7)
            CreateDWordField (CRS, \_SB.PCI0._Y20._LEN, LEN7)
            Method (_CRS, 0, NotSerialized)
            {
                Store (MG1L, Local0)
                If (Local0)
                {
                    Store (MG1B, MIN5)
                    Store (MG1L, LEN5)
                    Add (MIN5, Decrement (Local0), MAX5)
                }

                Store (MG2B, MIN6)
                Store (MG2L, LEN6)
                Store (MG2L, Local0)
                Add (MIN6, Decrement (Local0), MAX6)
                Store (MG3B, MIN7)
                Store (MG3L, LEN7)
                Store (MG3L, Local0)
                Add (MIN7, Decrement (Local0), MAX7)
                Return (CRS)
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, DBG8)
        PTS (Arg0)
        Store (Zero, Index (WAKP, Zero))
        Store (Zero, Index (WAKP, One))
        If (LAnd (LEqual (Arg0, 0x04), LEqual (OSFL (), 0x02)))
        {
            Sleep (0x0BB8)
        }

        Store (ASSB, WSSB)
        Store (AOTB, WOTB)
        Store (AAXB, WAXB)
        Store (Arg0, ASSB)
        Store (OSFL (), AOTB)
        Store (OSYS (), OSTP)
        Store (Zero, AAXB)
    }

    Method (_WAK, 1, NotSerialized)
    {
        ShiftLeft (Arg0, 0x04, DBG8)
        Store (0x84, DBGA)
        WAK (Arg0)
        If (ASSB)
        {
            Store (WSSB, ASSB)
            Store (WOTB, AOTB)
            Store (WAXB, AAXB)
        }

        If (DerefOf (Index (WAKP, Zero)))
        {
            Store (Zero, Index (WAKP, One))
        }
        Else
        {
            Store (Arg0, Index (WAKP, One))
        }

        Return (WAKP)
    }

    Name (_S0, Package (0x04)
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS1)
    {
        Name (_S1, Package (0x04)
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)
        {
            0x06, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            \_SB.PCI0.LPCB.SIOS (Arg0)
            \_SB.PCI0.NPTS (Arg0)
            \_SB.PCI0.LPCB.SPTS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        \_SB.PCI0.LPCB.SIOW (Arg0)
        \_SB.PCI0.NWAK (Arg0)
        \_SB.PCI0.LPCB.SWAK (Arg0)
    }
}

