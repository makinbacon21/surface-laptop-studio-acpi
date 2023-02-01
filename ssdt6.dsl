/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20220331 (64-bit version)
 * Copyright (c) 2000 - 2022 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt6.dat, Wed Feb  1 10:16:46 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000010A5 (4261)
 *     Revision         0x02
 *     Checksum         0xB7
 *     OEM ID           "MSFT  "
 *     OEM Table ID     "SsdtSurf"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20201113 (538972435)
 */
DefinitionBlock ("", "SSDT", 2, "MSFT  ", "SsdtSurf", 0x00001000)
{
    External (_SB_.GPI0, DeviceObj)
    External (_SB_.PC00.UA00, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS02, DeviceObj)
    External (_SB_.SSH_, DeviceObj)
    External (_SB_.SSH_.PDSM, MethodObj)    // 4 Arguments
    External (_SB_.SSH_.PFUN, MethodObj)    // 0 Arguments
    External (BCLE, IntObj)
    External (UDB0, MethodObj)    // 1 Arguments
    External (UDB1, MethodObj)    // 2 Arguments

    OperationRegion (MNVS, SystemMemory, 0x7DB91000, 0x0043)
    Field (MNVS, AnyAcc, Lock, Preserve)
    {
        SBFF,   32, 
        STDH,   72, 
        SHSD,   72, 
        SIDH,   72, 
        SEDH,   72, 
        OMPR,   16, 
        OMBR,   8, 
        PTSM,   16, 
        PACS,   8, 
        RSMP,   32, 
        SAMS,   72, 
        SSHP,   32, 
        SACS,   8, 
        CANS,   8, 
        TZSM,   16
    }

    OperationRegion (RSRS, SystemMemory, RSMP, 0x1000)
    Field (RSRS, ByteAcc, NoLock, Preserve)
    {
        REVI,   8, 
        Offset (0x0C), 
        GUI0,   32, 
        GUI1,   32, 
        GUI2,   32, 
        GUI3,   32, 
        Offset (0x430), 
        CSZE,   32, 
        GWAS,   32, 
        GWSI,   8, 
        GWDS,   32, 
        GWRE,   32, 
        SCAP,   64
    }

    Scope (_SB)
    {
        Device (SRTC)
        {
            Name (SGCP, 0x000001F7)
            Name (_SUB, "MSHW0214")  // _SUB: Subsystem ID
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return ("ACPI000E")
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_GCP, 0, NotSerialized)  // _GCP: Get Capabilities
            {
                Return (SGCP) /* \_SB_.SRTC.SGCP */
            }

            Method (_GWS, 1, Serialized)  // _GWS: Get Wake Status
            {
                If ((Arg0 == Zero))
                {
                    Return (GWAS) /* \GWAS */
                }

                If ((Arg0 == One))
                {
                    Return (GWDS) /* \GWDS */
                }

                Return (Zero)
            }
        }
    }

    Scope (\_SB)
    {
        Device (MSBT)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.GPI0
            })
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return ("MSHW0040")
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x0000,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0003
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionInputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0003
                        }
                    GpioInt (Edge, ActiveBoth, Shared, PullNone, 0x0000,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0116
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionInputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0116
                        }
                    GpioInt (Edge, ActiveBoth, Shared, PullNone, 0x0000,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0117
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionInputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0117
                        }
                })
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("6fd05c69-cde3-49f4-95ed-ab1665498035") /* Unknown UUID */))
                {
                    If ((Arg1 == One))
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x0F                                             // .
                            })
                        }

                        If ((Arg2 == One)) {}
                        If ((Arg2 == 0x02))
                        {
                            Return (OMPR) /* \OMPR */
                        }

                        If ((Arg2 == 0x03))
                        {
                            Return (SBFF) /* \SBFF */
                        }

                        If ((Arg2 != One))
                        {
                            Return (Buffer (One)
                            {
                                 0x00                                             // .
                            })
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Name (BCLE, Zero)
    Method (OBCL, 3, Serialized)
    {
        CreateDWordField (Arg2, Zero, STS0)
        If ((Arg1 != 0x02))
        {
            STS0 &= 0xFFFFFFE0
            STS0 |= 0x02
            Return (Arg2)
        }

        CreateDWordField (Arg2, 0x04, CAP0)
        Local0 = (STS0 & 0x1F)
        If ((Local0 & One))
        {
            If ((CAP0 & 0x00080000))
            {
                If ((SCAP & 0x0400)) {}
                Else
                {
                    CAP0 &= 0xFFFFFFFFFFF7FFFF
                    STS0 |= 0x10
                }
            }
            Else
            {
            }
        }
        ElseIf ((CAP0 & 0x00080000))
        {
            If ((SCAP & 0x0400))
            {
                BCLE = One
            }
            Else
            {
                CAP0 &= 0xFFFFFFFFFFF7FFFF
                STS0 |= 0x10
            }
        }

        Return (Arg2)
    }

    Scope (\_SB)
    {
        Device (SSH)
        {
            Name (_HID, "MSHW0084")  // _HID: Hardware ID
            Name (SULS, Zero)
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Name (PSBR, 0x003D0900)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Name (SBUF, ResourceTemplate ()
            {
                UartSerialBusV2 (0x00000000, DataBitsEight, StopBitsOne,
                    0xC0, LittleEndian, ParityTypeNone, FlowControlHardware,
                    0x0040, 0x0040, "\\_SB.PC00.UA00",
                    0x00, ResourceConsumer, _Y3B, Exclusive,
                    )
                GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                    "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x012A
                    }
                GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionInputOnly,
                    "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x012A
                    }
            })
            CreateDWordField (SBUF, \_SB.SSH._Y3B._SPE, BAUD)  // _SPE: Speed
            CreateWordField (SBUF, 0x3C, PIN1)
            CreateWordField (SBUF, 0x5F, PIN2)
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If ((SULS == Zero))
                {
                    UDB1 ("SSH._INI: SAM UART baudrate = %0\n", PSBR)
                    BAUD = PSBR /* \_SB_.SSH_.PSBR */
                }
                Else
                {
                    UDB1 ("SSH._INI: SAM UART baudrate = %0\n", 0x003D0900)
                    BAUD = 0x003D0900
                }

                If (CondRefOf (\_SB.SSH.PINI))
                {
                    \_SB.SSH.PINI ()
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SBUF) /* \_SB_.SSH_.SBUF */
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("d5e383e1-d892-4a76-89fc-f6aaae7ed5b5") /* Unknown UUID */))
                {
                    If ((Arg2 == Zero))
                    {
                        If ((Arg1 == Zero))
                        {
                            UDB0 ("SSH._DSM: Query supported functions\n")
                            If (CondRefOf (\_SB.SSH.PFUN))
                            {
                                Return (\_SB.SSH.PFUN ())
                            }
                            Else
                            {
                                Return (Buffer (0x02)
                                {
                                     0xE1, 0x07                                       // ..
                                })
                            }
                        }
                    }

                    If ((Arg1 == Zero))
                    {
                        If ((Arg2 == 0x05))
                        {
                            UDB0 ("SSH._DSM: SSH Power Profile\n")
                            Return (SSHP) /* \SSHP */
                        }

                        If ((Arg2 == 0x06))
                        {
                            UDB0 ("SSH._DSM: SAM UART sleep screen-on idle timeout\n")
                            Return (0xC8)
                        }

                        If ((Arg2 == 0x07))
                        {
                            UDB0 ("SSH._DSM: SAM UART screen-off sleep idle timeout\n")
                            Return (0x96)
                        }

                        If ((Arg2 == 0x08))
                        {
                            UDB0 ("SSH._DSM: SAM closes UART handle in D3\n")
                            Return (Zero)
                        }

                        If ((Arg2 == 0x09))
                        {
                            UDB0 ("SSH._DSM: SSH driver UART buffer size\n")
                            Return (0x30)
                        }

                        If ((Arg2 == 0x0A))
                        {
                            UDB0 ("SSH._DSM: SSH driver Interface\n")
                            Return (0x02)
                        }
                    }
                }

                If (CondRefOf (\_SB.SSH.PDSM))
                {
                    Return (\_SB.SSH.PDSM (Arg0, Arg1, Arg2, Arg3))
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }

    Scope (\_SB.SSH)
    {
        Name (_DEP, Package (0x01)  // _DEP: Dependencies
        {
            \_SB.PC00.UA00
        })
        Method (PINI, 0, NotSerialized)
        {
            Return (Zero)
        }
    }

    Scope (\_SB)
    {
        Device (WSID)
        {
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (ToString (SIDH, 0x09))
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("a653cdf4-476c-44fb-b366-a73cedf6e14c") /* Unknown UUID */))
                {
                    If ((Arg1 == Zero))
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x49                                             // I
                            })
                        }

                        If ((Arg2 == 0x03))
                        {
                            Return (OMPR) /* \OMPR */
                        }

                        If ((Arg2 == 0x06))
                        {
                            If (CondRefOf (BCLE))
                            {
                                Return (BCLE) /* \BCLE */
                            }

                            Return (Zero)
                        }

                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (\_SB.WSID)
    {
        Name (_DEP, Package (0x01)  // _DEP: Dependencies
        {
            \_SB.SSH
        })
    }

    Scope (\_SB.PC00.XHCI.RHUB.HS02)
    {
        Device (CAMF)
        {
            Name (_ADR, 0x02)  // _ADR: Address
            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
            {
                0xFF, 
                0xFF, 
                Zero, 
                Zero
            })
        }
    }

    Scope (\_SB.PC00.XHCI.RHUB.HS02)
    {
        Device (CAM3)
        {
            Name (_ADR, 0x04)  // _ADR: Address
            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
            {
                0xFF, 
                0xFF, 
                Zero, 
                Zero
            })
        }
    }

    ThermalZone (TPOL)
    {
        Name (_HID, "MSHW0187")  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (OPTS, 0, NotSerialized)
        {
            Return (Package (0x01)
            {
                "\\_SB.PAGD"
            })
        }
    }

    Scope (\_SB)
    {
        If ((TZSM & One))
        {
            ThermalZone (TZ01)
            {
                Name (_STR, Unicode ("RTS1"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        If ((TZSM & 0x02))
        {
            ThermalZone (TZ02)
            {
                Name (_STR, Unicode ("RTS2"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x02                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        If ((TZSM & 0x04))
        {
            ThermalZone (TZ03)
            {
                Name (_STR, Unicode ("RTS3"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        If ((TZSM & 0x08))
        {
            ThermalZone (TZ04)
            {
                Name (_STR, Unicode ("RTS4"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x04                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        If ((TZSM & 0x10))
        {
            ThermalZone (TZ05)
            {
                Name (_STR, Unicode ("RTS5"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x05                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        If ((TZSM & 0x20))
        {
            ThermalZone (TZ06)
            {
                Name (_STR, Unicode ("RTS6"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x06                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        If ((TZSM & 0x40))
        {
            ThermalZone (TZ07)
            {
                Name (_STR, Unicode ("RTS7"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        If ((TZSM & 0x80))
        {
            ThermalZone (TZ08)
            {
                Name (_STR, Unicode ("RTS8"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, 0x08)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x08                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        If ((TZSM & 0x0100))
        {
            ThermalZone (TZ09)
            {
                Name (_STR, Unicode ("VTS1"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, 0x09)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x09                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        If ((TZSM & 0x0200))
        {
            ThermalZone (TZ0A)
            {
                Name (_STR, Unicode ("VTS2"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x0A                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        If ((TZSM & 0x0400))
        {
            ThermalZone (TZ0B)
            {
                Name (_STR, Unicode ("VTS3"))  // _STR: Description String
                Name (_HID, "MSHW0188")  // _HID: Hardware ID
                Name (_UID, 0x0B)  // _UID: Unique ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e484ea9d-cc7c-4055-a94d-9e95f1f33b84") /* Unknown UUID */))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            If ((ToInteger (Arg1) == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x07                                             // .
                                })
                            }
                        }

                        If ((ToInteger (Arg1) == Zero))
                        {
                            If ((ToInteger (Arg2) == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x0B                                             // .
                                })
                            }

                            If ((ToInteger (Arg2) == 0x02))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             // .
                                })
                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (\_SB)
    {
        Device (SLT)
        {
            Name (_HID, "MSHW0005")  // _HID: Hardware ID
            Name (_CID, "PNP0C60" /* Display Sensor Device */)  // _CID: Compatible ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }

    Scope (\_SB.WSID)
    {
        Device (SHPS)
        {
            Name (_ADR, 0x9086E8DA)  // _ADR: Address
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.SSH
            })
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("5515a847-ed55-4b27-8352-cd320e10360a") /* Unknown UUID */))
                {
                    If ((ToInteger (Arg1) == One))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x41                                             // A
                            })
                        }

                        If ((ToInteger (Arg2) == 0x06))
                        {
                            Return (0x060C)
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }

    Scope (\_SB)
    {
        Device (SAPD)
        {
            Name (_HID, "MSHW0299")  // _HID: Hardware ID
        }

        Device (FAN0)
        {
            Name (_HID, EisaId ("PNP0C0B") /* Fan (Thermal Solution) */)  // _HID: Hardware ID
            Name (_STR, Unicode ("SAM FAN"))  // _STR: Description String
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.SSH
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }
}

