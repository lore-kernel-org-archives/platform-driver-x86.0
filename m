From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH v7] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Mon, 26 Oct 2015 08:51:00 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD0381485F@SHSMSX104.ccr.corp.intel.com>
References: <1444380548-17366-1-git-send-email-qipeng.zha@intel.com>
 <1444397622.8361.544.camel@intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD01981358@SHSMSX104.ccr.corp.intel.com>
 <20151015051606.GD2592@malice.jf.intel.com> <20151021125143.GA29166@vmdeb7>
 <C6287702A945AC47BE5DB5DFD4B5C6DD02CE122D@SHSMSX104.ccr.corp.intel.com>
 <20151022080430.GB2581@malice.jf.intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD03813AD0@SHSMSX104.ccr.corp.intel.com>
 <20151022154307.GB4289@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:14706 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753170AbbJZIvR convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Oct 2015 04:51:17 -0400
In-Reply-To: <20151022154307.GB4289@malice.jf.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Xue, Gavin" <gavin.xue@intel.com>


>So the ASL you provided was not what the Linux kernel is seeing, correct?

>Can you please provide a DSDT disassembly from the running Linux system please, such as:

># cp /sys/firmware/acpi/tables/DSDT DSDT.dat # iasl -d DSDT.dat

>Then find this device in DSDT.dsl and paste it here please.

Sorry for late feedback,  got dsdt from lab machine since my board got broken,
Please check.

Scope (\_SB)
        {
            Device (IPC1)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_HID, "INT34D2")  // _HID: Hardware ID
                Name (_CID, "INT34D2")  // _CID: Compatible ID
                Name (_DDN, "Intel(R) IPCI controller ")  // _DDN: DOS Device Name
                Name (_UID, One)  // _UID: Unique ID
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00002000,         // Address Length
                        _Y08)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000004,         // Address Length
                        _Y09)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000040,         // Address Length
                        _Y0A)
                    IO (Decode16,
                        0x0400,             // Range Minimum
                        0x0480,             // Range Maximum
                        0x04,               // Alignment
                        0x80,               // Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00002000,         // Address Length
                        _Y0B)
                    Interrupt (ResourceConsumer, Level, ActiveLow, Exclusive, ,, )
                    {
                        0x00000028,
                    }
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (RBUF, \_SB.IPC1._Y08._BAS, B0BA)  // _BAS: Base Address
                    CreateDWordField (RBUF, \_SB.IPC1._Y08._LEN, B0LN)  // _LEN: Length
                    Store (DD1A, B0BA)
                    Store (DD1L, B0LN)
                    CreateDWordField (RBUF, \_SB.IPC1._Y09._BAS, BM01)  // _BAS: Base Address
                    CreateDWordField (RBUF, \_SB.IPC1._Y09._LEN, BML1)  // _LEN: Length
                    CreateDWordField (RBUF, \_SB.IPC1._Y0A._BAS, BM02)  // _BAS: Base Address
                    CreateDWordField (RBUF, \_SB.IPC1._Y0A._LEN, BML2)  // _LEN: Length
                    Store (BMDA, BM01)
                    Store (0x04, BML1)
                    Store (BMIA, BM02)
                    Store (0x40, BML2)
                    CreateDWordField (RBUF, \_SB.IPC1._Y0B._BAS, B1BA)  // _BAS: Base Address
                    CreateDWordField (RBUF, \_SB.IPC1._Y0B._LEN, B1LN)  // _LEN: Length
                    Store (DD3A, B1BA)
                    Store (DD3L, B1LN)
                    Return (RBUF)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
