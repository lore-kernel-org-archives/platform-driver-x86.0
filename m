Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6272C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Dec 2021 13:42:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhLNNmC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Dec 2021 08:42:02 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:60784 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234506AbhLNNmB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Dec 2021 08:42:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6DEBA614DE
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Dec 2021 13:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4EAFC34625
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Dec 2021 13:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639489320;
        bh=BVzyTS4v6A9v3s0aWjpGGFcNOmjUtwNAz6ja7u2DGJQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=K+D4Dks0Ahl5doMt5H40/pBb9Z5/R9olhLPCbCEwSv8wyRf7nG1PvRVuN157OS5OL
         jreCstAVTakBCZOpOo/pf01Kw223WmpEh2XNNXDouF2gbhxM+Xlza+OJOVrRyF3d0C
         w3rxhGar+Iceo9tmQBZ91hKRV4iXhLNseXPq0l/BT01VWYwxy9+ErBm/2N+4dXEFXi
         QepsdZY7imi59mS7g+05pafOEzPtk01l8Wdo3/Or3AH5/EYM9KUXGg0HyvZfu+j3VT
         QvJfUK/XjAM623BWqutAjSkFljBbTE7jXmPOlP97zDkMXv2RNSJHRCUMTYuGce/GGz
         SYYXi66O9T97Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C620B61177; Tue, 14 Dec 2021 13:42:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 14 Dec 2021 13:41:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vladdrako007@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-9z6PNOAzmh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #198 from Vladdrako (vladdrako007@gmail.com) ---
@Denis Pauk
Fixed by replacing DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC.=
"),=20
\ -> "ASUSTeK Computer INC."
sudo dmidecode -t 2
# dmidecode 3.3
Getting SMBIOS data from sysfs.
SMBIOS 2.6 present.

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
        Manufacturer: ASUSTeK Computer INC.
        Product Name: P8Z68-V LX
        Version: Rev X.0x
        Serial Number: MB-1234567890
        Asset Tag: To be filled by O.E.M.
        Features:
                Board is a hosting board
                Board is replaceable
        Location In Chassis: To be filled by O.E.M.
        Chassis Handle: 0x0003
        Type: Motherboard
        Contained Object Handles: 0

sudo dmesg | grep ACPI
[sudo] =D0=BF=D0=B0=D1=80=D0=BE=D0=BB=D1=8C =D0=B4=D0=BB=D1=8F vladdrako:=20
[    0.000000] ACPI: OSL: Static SSDT installation disabled
[    0.000000] BIOS-e820: [mem 0x00000000ce941000-0x00000000ceb94fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000ceb95000-0x00000000ceba1fff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000ceba2000-0x00000000cebc0fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000cebc1000-0x00000000cebc5fff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000cebc6000-0x00000000cec08fff] ACPI =
NVS
[    0.000000] efi: ACPI=3D0xceb95000 ACPI 2.0=3D0xceb95000 SMBIOS=3D0xce42=
5f98=20
[    0.012426] ACPI: SSDT ACPI table found in initrd
[kernel/firmware/acpi/ssdt1.aml][0x414]
[    0.012430] ACPI: SSDT ACPI table found in initrd
[kernel/firmware/acpi/ssdt2.aml][0xb05]
[    0.012432] ACPI: SSDT ACPI table found in initrd
[kernel/firmware/acpi/ssdt3.aml][0x2f4]
[    0.012434] ACPI: SSDT ACPI table found in initrd
[kernel/firmware/acpi/ssdt4.aml][0x87b]
[    0.012436] ACPI: SSDT ACPI table found in initrd
[kernel/firmware/acpi/ssdt5.aml][0x3aa]
[    0.012438] ACPI: SSDT ACPI table found in initrd
[kernel/firmware/acpi/ssdt6.aml][0x18a]
[    0.012439] ACPI: SSDT ACPI table found in initrd
[kernel/firmware/acpi/ssdt7.aml][0x18a]
[    0.012460] modified: [mem 0x00000000ce14e000-0x00000000ce150145] ACPI d=
ata
[    0.012470] modified: [mem 0x00000000ce941000-0x00000000ceb94fff] ACPI N=
VS
[    0.012472] modified: [mem 0x00000000ceb95000-0x00000000ceba1fff] ACPI d=
ata
[    0.012473] modified: [mem 0x00000000ceba2000-0x00000000cebc0fff] ACPI N=
VS
[    0.012475] modified: [mem 0x00000000cebc1000-0x00000000cebc5fff] ACPI d=
ata
[    0.012476] modified: [mem 0x00000000cebc6000-0x00000000cec08fff] ACPI N=
VS
[    0.012497] ACPI: Early table checksum verification disabled
[    0.012500] ACPI: RSDP 0x00000000CEB95000 000024 (v02 ALASKA)
[    0.012503] ACPI: XSDT 0x00000000CEB95078 00006C (v01 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.012512] ACPI: FACP 0x00000000CEB9F930 0000F4 (v04 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.012520] ACPI: DSDT 0x00000000CEB95180 00A7B0 (v02 ALASKA A M I=20=20=
=20
00000015 INTL 20051117)
[    0.012525] ACPI: FACS 0x00000000CEBBFF80 000040
[    0.012530] ACPI: APIC 0x00000000CEB9FA28 000072 (v03 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.012536] ACPI: MCFG 0x00000000CEB9FAA0 00003C (v01 ALASKA A M I=20=20=
=20
01072009 MSFT 00000097)
[    0.012541] ACPI: HPET 0x00000000CEB9FAE0 000038 (v01 ALASKA A M I=20=20=
=20
01072009 AMI. 00000005)
[    0.012544] ACPI: Ignoring installation of SSDT at 00000000CEB9FB18
[    0.012546] ACPI: Ignoring installation of SSDT at 00000000CEB9FE88
[    0.012548] ACPI: Ignoring installation of SSDT at 00000000CEBA0838
[    0.012553] ACPI: DMAR 0x00000000CEBA12D0 0000A8 (v01 INTEL  SNB=20=20=
=20=20=20
00000001 INTL 00000001)
[    0.012558] ACPI: BGRT 0x00000000CEBA13D0 000038 (v00 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.012561] ACPI: Reserving FACP table memory at [mem 0xceb9f930-0xceb9f=
a23]
[    0.012562] ACPI: Reserving DSDT table memory at [mem 0xceb95180-0xceb9f=
92f]
[    0.012563] ACPI: Reserving FACS table memory at [mem 0xcebbff80-0xcebbf=
fbf]
[    0.012564] ACPI: Reserving APIC table memory at [mem 0xceb9fa28-0xceb9f=
a99]
[    0.012565] ACPI: Reserving MCFG table memory at [mem 0xceb9faa0-0xceb9f=
adb]
[    0.012566] ACPI: Reserving HPET table memory at [mem 0xceb9fae0-0xceb9f=
b17]
[    0.012567] ACPI: Reserving DMAR table memory at [mem 0xceba12d0-0xceba1=
377]
[    0.012568] ACPI: Reserving BGRT table memory at [mem 0xceba13d0-0xceba1=
407]
[    0.012572] ACPI: Table Upgrade: install [SSDT- PmRef- Cpu0Ist]
[    0.012574] ACPI: Ignoring installation of SSDT at 00000000CE14E000
[    0.012576] ACPI: Table Upgrade: install [SSDT- PmRef-   CpuPm]
[    0.012577] ACPI: Ignoring installation of SSDT at 00000000CE14E414
[    0.012579] ACPI: Table Upgrade: install [SSDT-SataRe-SataTabl]
[    0.012581] ACPI: Ignoring installation of SSDT at 00000000CE14EF19
[    0.012582] ACPI: Table Upgrade: install [SSDT- PmRef- Cpu0Cst]
[    0.012584] ACPI: Ignoring installation of SSDT at 00000000CE14F20D
[    0.012585] ACPI: Table Upgrade: install [SSDT- PmRef-   ApIst]
[    0.012587] ACPI: Ignoring installation of SSDT at 00000000CE14FA88
[    0.012589] ACPI: Table Upgrade: install [SSDT- PmRef-   ApCst]
[    0.012590] ACPI: Ignoring installation of SSDT at 00000000CE14FE32
[    0.012592] ACPI: Table Upgrade: install [SSDT- PmRef-   ApCst]
[    0.012593] ACPI: Ignoring installation of SSDT at 00000000CE14FFBC
[    0.042572] ACPI: PM-Timer IO Port: 0x408
[    0.042580] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.042594] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.042595] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.042599] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.042600] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.122119] ACPI: Core revision 20210730
[    0.166568] ACPI: PM: Registering ACPI NVS region [mem
0xce941000-0xceb94fff] (2441216 bytes)
[    0.166568] ACPI: PM: Registering ACPI NVS region [mem
0xceba2000-0xcebc0fff] (126976 bytes)
[    0.166568] ACPI: PM: Registering ACPI NVS region [mem
0xcebc6000-0xcec08fff] (274432 bytes)
[    0.166581] ACPI FADT declares the system doesn't support PCIe ASPM, so
disable it
[    0.166581] ACPI: bus type PCI registered
[    0.166581] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.169728] ACPI: Added _OSI(Module Device)
[    0.169728] ACPI: Added _OSI(Processor Device)
[    0.169728] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.169728] ACPI: Added _OSI(Processor Aggregator Device)
[    0.169728] ACPI: Added _OSI(Linux-Dell-Video)
[    0.169728] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.169728] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.177081] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.178274] ACPI: EC: EC started
[    0.178275] ACPI: EC: interrupt blocked
[    0.178279] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.178281] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle
transactions
[    0.178283] ACPI: Interpreter enabled
[    0.178298] ACPI: PM: (supports S0 S5)
[    0.178299] ACPI: Using IOAPIC for interrupt routing
[    0.178330] PCI: Using host bridge windows from ACPI; if necessary, use
"pci=3Dnocrs" and report a bug
[    0.178545] ACPI: Enabled 10 GPEs in block 00 to 3F
[    0.185721] ACPI: PM: Power Resource [FN00]
[    0.185797] ACPI: PM: Power Resource [FN01]
[    0.185874] ACPI: PM: Power Resource [FN02]
[    0.185948] ACPI: PM: Power Resource [FN03]
[    0.186023] ACPI: PM: Power Resource [FN04]
[    0.186715] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3e])
[    0.193940] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
[    0.194009] ACPI: PCI: Interrupt link LNKB configured for IRQ 3
[    0.194076] ACPI: PCI: Interrupt link LNKC configured for IRQ 4
[    0.194143] ACPI: PCI: Interrupt link LNKD configured for IRQ 5
[    0.194209] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.194210] ACPI: PCI: Interrupt link LNKE disabled
[    0.194276] ACPI: PCI: Interrupt link LNKF configured for IRQ 10
[    0.194342] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.194343] ACPI: PCI: Interrupt link LNKG disabled
[    0.194409] ACPI: PCI: Interrupt link LNKH configured for IRQ 11
[    0.194710] ACPI: EC: interrupt unblocked
[    0.194711] ACPI: EC: event unblocked
[    0.194716] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.194717] ACPI: EC: GPE=3D0x18
[    0.194719] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization comp=
lete
[    0.194720] ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions =
and
events
[    0.194782] ACPI: bus type USB registered
[    0.194782] PCI: Using ACPI for IRQ routing
[    0.207295] pnp: PnP ACPI init
[    0.208360] pnp: PnP ACPI: found 8 devices
[    0.378928] ACPI: button: Power Button [PWRB]
[    0.379132] ACPI: button: Power Button [PWRF]
[    0.379837] ACPI: thermal: Thermal Zone [TZ00] (28 C)
[    0.380112] ACPI: thermal: Thermal Zone [TZ01] (30 C)
[    5.069363] ACPI Warning: SystemIO range
0x0000000000000428-0x000000000000042F conflicts with OpRegion
0x0000000000000400-0x000000000000047F (\PMIO) (20210730/utaddress-204)
[    5.069371] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[    5.069374] ACPI Warning: SystemIO range
0x0000000000000540-0x000000000000054F conflicts with OpRegion
0x0000000000000500-0x0000000000000563 (\GPIO) (20210730/utaddress-204)
[    5.069377] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[    5.069378] ACPI Warning: SystemIO range
0x0000000000000530-0x000000000000053F conflicts with OpRegion
0x0000000000000500-0x0000000000000563 (\GPIO) (20210730/utaddress-204)
[    5.069381] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[    5.069382] ACPI Warning: SystemIO range
0x0000000000000500-0x000000000000052F conflicts with OpRegion
0x0000000000000500-0x000000000000050F (\_GPE.GPIO) (20210730/utaddress-204)
[    5.069384] ACPI Warning: SystemIO range
0x0000000000000500-0x000000000000052F conflicts with OpRegion
0x0000000000000500-0x0000000000000563 (\GPIO) (20210730/utaddress-204)
[    5.069386] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[   11.270149] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no=20
post: no)
sudo dmesg | grep nct6775
[    6.082896] nct6775: Can't read chip ID by Asus WMI.
[    6.083246] nct6775: Using Asus WMI mutex: \_SB_.PCI0.LPCB.SIO1.MUT0
[    6.083277] nct6775: Found NCT6776D/F or compatible chip at 0x2e:0x290
[    6.083315] nct6775: i2c have not found
sensors=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
  =EE=82=B2 =E2=9C=94=20
coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +38.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +99.0=C2=B0C)
Core 0:        +38.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +99.0=C2=B0C)
Core 1:        +37.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +99.0=C2=B0C)
Core 2:        +37.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +99.0=C2=B0C)
Core 3:        +31.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +99.0=C2=B0C)

nct6776-isa-0290
Adapter: ISA adapter
Vcore:         944.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:             1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
AVCC:            3.41 V  (min =3D  +2.98 V, max =3D  +3.63 V)
+3.3V:           3.41 V  (min =3D  +2.98 V, max =3D  +3.63 V)
in4:             1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in5:             2.04 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in6:           824.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
3VSB:            3.41 V  (min =3D  +2.98 V, max =3D  +3.63 V)
Vbat:            3.38 V  (min =3D  +2.70 V, max =3D  +3.63 V)
fan1:             0 RPM  (min =3D    0 RPM)
fan2:           853 RPM  (min =3D    0 RPM)
fan3:             0 RPM  (min =3D    0 RPM)
fan4:             0 RPM  (min =3D    0 RPM)
fan5:             0 RPM  (min =3D    0 RPM)
SYSTIN:         +26.0=C2=B0C  (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C=
)  ALARM  sensor =3D
thermistor
CPUTIN:         +91.0=C2=B0C  (high =3D +81.0=C2=B0C, hyst =3D +76.0=C2=B0C=
)  sensor =3D thermistor
AUXTIN:         +63.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.0=C2=B0C=
)  sensor =3D thermistor
PECI Agent 0:   +36.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.0=C2=B0C)
                         (crit =3D +99.0=C2=B0C)
PCH_CHIP_TEMP:   +0.0=C2=B0C=20=20
PCH_CPU_TEMP:    +0.0=C2=B0C=20=20
PCH_MCH_TEMP:    +0.0=C2=B0C=20=20
intrusion0:    ALARM
intrusion1:    ALARM
beep_enable:   disabled

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +27.8=C2=B0C  (crit =3D +105.0=C2=B0C)
temp2:        +29.8=C2=B0C  (crit =3D +105.0=C2=B0C)

nvme-pci-0200
Adapter: PCI adapter
Composite:    +25.9=C2=B0C  (low  =3D  -0.1=C2=B0C, high =3D +69.8=C2=B0C)
                       (crit =3D +84.8=C2=B0C)
ERROR: Can't get value of subfeature temp2_min: I/O error
ERROR: Can't get value of subfeature temp2_max: I/O error
Sensor 1:     +35.9=C2=B0C  (low  =3D  +0.0=C2=B0C, high =3D  +0.0=C2=B0C)

Now works as expected. Thanks for your work! Sadly, nobody wants to fix
conflicts with lpc_ich/gpio_ich drivers, so I will blacklist them :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
