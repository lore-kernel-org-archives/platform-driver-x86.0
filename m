Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E680DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 Jan 2022 17:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351657AbiAUR1B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 Jan 2022 12:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239235AbiAUR1A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Jan 2022 12:27:00 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33170C06173B
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Jan 2022 09:26:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 3C9D9CE242D
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Jan 2022 17:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87462C340EE
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Jan 2022 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642786015;
        bh=LMuDBi78782wGdtozMWvAyeypJMVreVHtqESOZXka3o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=l8iz4UNpFZSXU5/vsKiklEbXYOgYZ5IgqaxjKnCD38yZBxP0VvqiJcQ3BgvntxwCQ
         809wz9NRzB/cKHxYDdtB34qrTsBiseWrDcRWD454mS+UmggVkxHCQRgs2dG6N/ffs9
         IztyFI/8xyQz8hl7ZWtvH/XL8w6cfFribJuYjyEPWadaak3kT/7nFsJzd24edRO0VF
         BUSr1Hnv7g5By+ZtB5oP/wyxQayWxkbJLdpxvcinfvCXQFolg5ZL4ysi1BPqwH7Kc/
         LtS9PN13wayxZH6JLoJkuRWLNbv25shVxOfOy2RUupDNmnlsZt30AgH8fsHVs2MT/N
         ttm/mzBT41p7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 75653CC13B1; Fri, 21 Jan 2022 17:26:55 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 201885] acpi PNP0C14:02: duplicate WMI GUID
 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
Date:   Fri, 21 Jan 2022 17:26:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: klimenkomaximsergievich@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201885-215701-Ah2gN2QMnb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201885-215701@https.bugzilla.kernel.org/>
References: <bug-201885-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D201885

Maxim Klimenko (klimenkomaximsergievich@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |klimenkomaximsergievich@gma
                   |                            |il.com

--- Comment #16 from Maxim Klimenko (klimenkomaximsergievich@gmail.com) ---
[    0.000000] Linux version 5.16.2-arch1-1 (linux@archlinux) (gcc (GCC)
11.1.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP PREEMPT Thu, 20 Jan 2022 16:18=
:29
+0000
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-linux
root=3DUUID=3Da1e2e1f9-dbcb-484e-a242-73d5754f8d98 rw quiet
resume=3DUUID=3D36238c5a-d1ff-4e5f-986a-4d302098cfd7 loglevel=3D3 audit=3D0
lsm=3Dlandlock,lockdown,yama,apparmor,bpf l1tf=3Dfull,force mds=3Dfull,nosmt
mitigations=3Dauto,nosmt nosmt=3Dforce pcie_aspm=3Dforce init_on_alloc=3D1
init_on_free=3D1 randomize_kstack_offset=3Don slab_nomerge pti=3Don slub_de=
bug=3DZF
slub_debug=3DP page_poison=3D1 mem_encrypt=3Don vsyscall=3Dnonei
amd_iommu=3Dforce_isolation radeon.dpm=3D1
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point
registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes,
using 'compacted' format.
[    0.000000] signal: max sigframe size: 1776
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000bffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009afffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009b00000-0x0000000009dfffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000009e00000-0x0000000009efffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009f00000-0x0000000009f0ffff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000009f10000-0x00000000bab68fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000bab69000-0x00000000bbd68fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000bbd69000-0x00000000c9f7efff] usable
[    0.000000] BIOS-e820: [mem 0x00000000c9f7f000-0x00000000caf7efff] type =
20
[    0.000000] BIOS-e820: [mem 0x00000000caf7f000-0x00000000ccf7efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ccf7f000-0x00000000cdf7efff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000cdf7f000-0x00000000cdffefff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000cdfff000-0x00000000cdffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000ce000000-0x00000000ceffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fde00000-0x00000000fdefffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec20000-0x00000000fec20fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed80fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000fff2ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000040f33ffff] usable
[    0.000000] BIOS-e820: [mem 0x000000040f340000-0x000000042fffffff] reser=
ved
[    0.000000] SMT: Force disabled
[    0.000000] Malformed early option 'vsyscall'
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] efi: EFI v2.70 by INSYDE Corp.
[    0.000000] efi: ACPI=3D0xcdffe000 ACPI 2.0=3D0xcdffe014 TPMFinalLog=3D0=
xcdf2c000
SMBIOS=3D0xcb70c000 SMBIOS 3.0=3D0xcb70a000 ESRT=3D0xcb70d418=20
[    0.000000] SMBIOS 3.2.0 present.
[    0.000000] DMI: TIMI RedmiBook 14 II/TM1951, BIOS RMARN4B0P0909 08/19/2=
020
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2370.553 MHz processor
[    0.000544] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000547] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000552] last_pfn =3D 0x40f340 max_arch_pfn =3D 0x400000000
[    0.000730] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
=20=20
[    0.000953] last_pfn =3D 0xce000 max_arch_pfn =3D 0x400000000
[    0.010388] esrt: Reserving ESRT space from 0x00000000cb70d418 to
0x00000000cb70d450.
[    0.010397] Kernel/User page tables isolation: force enabled on command
line.
[    0.010398] Using GB pages for direct mapping
[    0.010761] Secure boot disabled
[    0.010762] RAMDISK: [mem 0x372fd000-0x37975fff]
[    0.010766] ACPI: Early table checksum verification disabled
[    0.010769] ACPI: RSDP 0x00000000CDFFE014 000024 (v02 XMCC  )
[    0.010773] ACPI: XSDT 0x00000000CDFCE188 000134 (v01 XMCC   XMCC1951
00000002      01000013)
[    0.010777] ACPI: FACP 0x00000000CDFEC000 00010C (v05 XMCC   XMCC1951
00000002      01000013)
[    0.010782] ACPI: DSDT 0x00000000CDFDF000 006545 (v01 XMCC   XMCC1951
00000002      01000013)
[    0.010784] ACPI: FACS 0x00000000CDF29000 000040
[    0.010786] ACPI: UEFI 0x00000000CDF7E000 000236 (v01 INSYDE H2O BIOS
00000001 ACPI 00040000)
[    0.010788] ACPI: SSDT 0x00000000CDFF5000 007216 (v02 AMD    AmdTable
00000002 MSFT 04000000)
[    0.010791] ACPI: IVRS 0x00000000CDFF4000 0001A4 (v02 AMD    AmdTable
00000001 AMD  00000000)
[    0.010793] ACPI: SSDT 0x00000000CDFF3000 000228 (v01 AMD    STD3=20=20=
=20=20
00000001 INTL 20130117)
[    0.010795] ACPI: SSDT 0x00000000CDFF2000 000D61 (v01 XMCC   XMCC1806
00003000 INTL 20130117)
[    0.010798] ACPI: SSDT 0x00000000CDFF1000 00046D (v01 Insyde TPMACPI=20
00001000 INTL 20130117)
[    0.010800] ACPI: TPM2 0x00000000CDFF0000 000034 (v04 XMCC   XMCC1951
00000002      01000013)
[    0.010802] ACPI: MSDM 0x00000000CDFEF000 000055 (v03 INSYDE H2O BIOS
00000001 ACPI 00040000)
[    0.010804] ACPI: ASF! 0x00000000CDFEE000 0000A5 (v32 XMCC   XMCC1951
00000002      01000013)
[    0.010807] ACPI: BOOT 0x00000000CDFED000 000028 (v01 XMCC   XMCC1951
00000002      01000013)
[    0.010809] ACPI: HPET 0x00000000CDFEB000 000038 (v01 XMCC   XMCC1951
00000002      01000013)
[    0.010811] ACPI: APIC 0x00000000CDFEA000 000138 (v03 XMCC   XMCC1951
00000002      01000013)
[    0.010813] ACPI: MCFG 0x00000000CDFE9000 00003C (v01 XMCC   XMCC1951
00000002      01000013)
[    0.010815] ACPI: SLIC 0x00000000CDFE8000 000176 (v01 XMCC   XMCC1951
00000002      01000013)
[    0.010818] ACPI: SSDT 0x00000000CDFDE000 000080 (v01 XMCC   XMCC1951
00000002      01000013)
[    0.010820] ACPI: VFCT 0x00000000CDFD0000 00D484 (v01 XMCC   XMCC1951
00000001 AMD  31504F47)
[    0.010822] ACPI: SSDT 0x00000000CDFCF000 0000F8 (v01 XMCC   PcdTabl=20
00001000 INTL 20130117)
[    0.010824] ACPI: SSDT 0x00000000CDFCC000 001500 (v01 AMD    AmdTable
00000001 AMD  00000001)
[    0.010826] ACPI: CRAT 0x00000000CDFFD000 000BA8 (v01 AMD    AmdTable
00000001 AMD  00000001)
[    0.010829] ACPI: CDIT 0x00000000CDFCB000 000029 (v01 AMD    AmdTable
00000001 AMD  00000001)
[    0.010831] ACPI: SSDT 0x00000000CDFCA000 00028D (v01 AMD    AmdTable
00000001 INTL 20130117)
[    0.010833] ACPI: SSDT 0x00000000CDFC9000 000C78 (v01 AMD    AmdTable
00000001 INTL 20130117)
[    0.010835] ACPI: SSDT 0x00000000CDFC7000 0010A5 (v01 AMD    AmdTable
00000001 INTL 20130117)
[    0.010837] ACPI: SSDT 0x00000000CDFC3000 0030C8 (v01 AMD    AmdTable
00000001 INTL 20130117)
[    0.010839] ACPI: FPDT 0x00000000CDFC2000 000044 (v01 XMCC   XMCC1951
00000002      01000013)
[    0.010842] ACPI: WSMT 0x00000000CDFC0000 000028 (v01 INSYDE H2O BIOS
00000001 ACPI 00040000)
[    0.010844] ACPI: SSDT 0x00000000CDFE7000 00020A (v01 AMD    AmdTable
00000001 INTL 20130117)
[    0.010846] ACPI: SSDT 0x00000000CDFE6000 0005A1 (v01 AMD    AmdTable
00000001 INTL 20130117)
[    0.010848] ACPI: SSDT 0x00000000CDFBF000 000343 (v01 AMD    AmdTable
00000001 INTL 20130117)
[    0.010850] ACPI: SSDT 0x00000000CDFBE000 00007D (v01 AMD    AmdTable
00000001 INTL 20130117)
[    0.010852] ACPI: SSDT 0x00000000CDFBD000 000822 (v01 AMD    AmdTable
00000001 INTL 20130117)
[    0.010855] ACPI: SSDT 0x00000000CDFBC000 000517 (v01 AMD    AmdTable
00000001 INTL 20130117)
[    0.010857] ACPI: BGRT 0x00000000CDFC1000 000038 (v01 INSYDE H2O BIOS
00000001 ACPI 00040000)
[    0.010858] ACPI: Reserving FACP table memory at [mem 0xcdfec000-0xcdfec=
10b]
[    0.010860] ACPI: Reserving DSDT table memory at [mem 0xcdfdf000-0xcdfe5=
544]
[    0.010860] ACPI: Reserving FACS table memory at [mem 0xcdf29000-0xcdf29=
03f]
[    0.010861] ACPI: Reserving UEFI table memory at [mem 0xcdf7e000-0xcdf7e=
235]
[    0.010862] ACPI: Reserving SSDT table memory at [mem 0xcdff5000-0xcdffc=
215]
[    0.010862] ACPI: Reserving IVRS table memory at [mem 0xcdff4000-0xcdff4=
1a3]
[    0.010863] ACPI: Reserving SSDT table memory at [mem 0xcdff3000-0xcdff3=
227]
[    0.010864] ACPI: Reserving SSDT table memory at [mem 0xcdff2000-0xcdff2=
d60]
[    0.010864] ACPI: Reserving SSDT table memory at [mem 0xcdff1000-0xcdff1=
46c]
[    0.010865] ACPI: Reserving TPM2 table memory at [mem 0xcdff0000-0xcdff0=
033]
[    0.010866] ACPI: Reserving MSDM table memory at [mem 0xcdfef000-0xcdfef=
054]
[    0.010866] ACPI: Reserving ASF! table memory at [mem 0xcdfee000-0xcdfee=
0a4]
[    0.010867] ACPI: Reserving BOOT table memory at [mem 0xcdfed000-0xcdfed=
027]
[    0.010868] ACPI: Reserving HPET table memory at [mem 0xcdfeb000-0xcdfeb=
037]
[    0.010868] ACPI: Reserving APIC table memory at [mem 0xcdfea000-0xcdfea=
137]
[    0.010869] ACPI: Reserving MCFG table memory at [mem 0xcdfe9000-0xcdfe9=
03b]
[    0.010870] ACPI: Reserving SLIC table memory at [mem 0xcdfe8000-0xcdfe8=
175]
[    0.010870] ACPI: Reserving SSDT table memory at [mem 0xcdfde000-0xcdfde=
07f]
[    0.010871] ACPI: Reserving VFCT table memory at [mem 0xcdfd0000-0xcdfdd=
483]
[    0.010872] ACPI: Reserving SSDT table memory at [mem 0xcdfcf000-0xcdfcf=
0f7]
[    0.010873] ACPI: Reserving SSDT table memory at [mem 0xcdfcc000-0xcdfcd=
4ff]
[    0.010873] ACPI: Reserving CRAT table memory at [mem 0xcdffd000-0xcdffd=
ba7]
[    0.010874] ACPI: Reserving CDIT table memory at [mem 0xcdfcb000-0xcdfcb=
028]
[    0.010875] ACPI: Reserving SSDT table memory at [mem 0xcdfca000-0xcdfca=
28c]
[    0.010875] ACPI: Reserving SSDT table memory at [mem 0xcdfc9000-0xcdfc9=
c77]
[    0.010876] ACPI: Reserving SSDT table memory at [mem 0xcdfc7000-0xcdfc8=
0a4]
[    0.010877] ACPI: Reserving SSDT table memory at [mem 0xcdfc3000-0xcdfc6=
0c7]
[    0.010878] ACPI: Reserving FPDT table memory at [mem 0xcdfc2000-0xcdfc2=
043]
[    0.010878] ACPI: Reserving WSMT table memory at [mem 0xcdfc0000-0xcdfc0=
027]
[    0.010879] ACPI: Reserving SSDT table memory at [mem 0xcdfe7000-0xcdfe7=
209]
[    0.010880] ACPI: Reserving SSDT table memory at [mem 0xcdfe6000-0xcdfe6=
5a0]
[    0.010881] ACPI: Reserving SSDT table memory at [mem 0xcdfbf000-0xcdfbf=
342]
[    0.010881] ACPI: Reserving SSDT table memory at [mem 0xcdfbe000-0xcdfbe=
07c]
[    0.010882] ACPI: Reserving SSDT table memory at [mem 0xcdfbd000-0xcdfbd=
821]
[    0.010883] ACPI: Reserving SSDT table memory at [mem 0xcdfbc000-0xcdfbc=
516]
[    0.010884] ACPI: Reserving BGRT table memory at [mem 0xcdfc1000-0xcdfc1=
037]
[    0.010935] No NUMA configuration found
[    0.010936] Faking a node at [mem 0x0000000000000000-0x000000040f33ffff]
[    0.010939] NODE_DATA(0) allocated [mem 0x40f33c000-0x40f33ffff]
[    0.010968] Zone ranges:
[    0.010969]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.010970]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.010971]   Normal   [mem 0x0000000100000000-0x000000040f33ffff]
[    0.010972]   Device   empty
[    0.010973] Movable zone start for each node
[    0.010974] Early memory node ranges
[    0.010974]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.010975]   node   0: [mem 0x0000000000100000-0x0000000009afffff]
[    0.010976]   node   0: [mem 0x0000000009e00000-0x0000000009efffff]
[    0.010977]   node   0: [mem 0x0000000009f10000-0x00000000bab68fff]
[    0.010978]   node   0: [mem 0x00000000bbd69000-0x00000000c9f7efff]
[    0.010978]   node   0: [mem 0x00000000cdfff000-0x00000000cdffffff]
[    0.010979]   node   0: [mem 0x0000000100000000-0x000000040f33ffff]
[    0.010981] Initmem setup node 0 [mem 0x0000000000001000-0x000000040f33f=
fff]
[    0.010984] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.011001] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.011144] On node 0, zone DMA32: 768 pages in unavailable ranges
[    0.016273] On node 0, zone DMA32: 16 pages in unavailable ranges
[    0.016739] On node 0, zone DMA32: 4608 pages in unavailable ranges
[    0.016883] On node 0, zone DMA32: 16512 pages in unavailable ranges
[    0.040208] On node 0, zone Normal: 8192 pages in unavailable ranges
[    0.040240] On node 0, zone Normal: 3264 pages in unavailable ranges
[    0.040391] ACPI: PM-Timer IO Port: 0x408
[    0.040397] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.040399] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.040399] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.040400] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.040401] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.040401] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.040402] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.040403] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.040403] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.040404] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.040404] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.040405] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.040405] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.040406] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.040407] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.040407] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.040420] IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0=
-23
[    0.040425] IOAPIC[1]: apic_id 34, version 33, address 0xfec01000, GSI 2=
4-55
[    0.040427] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.040428] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.040431] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.040432] ACPI: HPET id: 0x10228210 base: 0xfed00000
[    0.040440] e820: update [mem 0xb327b000-0xb3280fff] usable =3D=3D> rese=
rved
[    0.040449] smpboot: Allowing 16 CPUs, 10 hotplug CPUs
[    0.040474] PM: hibernation: Registered nosave memory: [mem
0x00000000-0x00000fff]
[    0.040475] PM: hibernation: Registered nosave memory: [mem
0x0009f000-0x000bffff]
[    0.040476] PM: hibernation: Registered nosave memory: [mem
0x000c0000-0x000fffff]
[    0.040478] PM: hibernation: Registered nosave memory: [mem
0x09b00000-0x09dfffff]
[    0.040479] PM: hibernation: Registered nosave memory: [mem
0x09f00000-0x09f0ffff]
[    0.040481] PM: hibernation: Registered nosave memory: [mem
0xb327b000-0xb3280fff]
[    0.040482] PM: hibernation: Registered nosave memory: [mem
0xbab69000-0xbbd68fff]
[    0.040484] PM: hibernation: Registered nosave memory: [mem
0xc9f7f000-0xcaf7efff]
[    0.040484] PM: hibernation: Registered nosave memory: [mem
0xcaf7f000-0xccf7efff]
[    0.040485] PM: hibernation: Registered nosave memory: [mem
0xccf7f000-0xcdf7efff]
[    0.040485] PM: hibernation: Registered nosave memory: [mem
0xcdf7f000-0xcdffefff]
[    0.040487] PM: hibernation: Registered nosave memory: [mem
0xce000000-0xceffffff]
[    0.040487] PM: hibernation: Registered nosave memory: [mem
0xcf000000-0xf7ffffff]
[    0.040488] PM: hibernation: Registered nosave memory: [mem
0xf8000000-0xfbffffff]
[    0.040488] PM: hibernation: Registered nosave memory: [mem
0xfc000000-0xfddfffff]
[    0.040489] PM: hibernation: Registered nosave memory: [mem
0xfde00000-0xfdefffff]
[    0.040489] PM: hibernation: Registered nosave memory: [mem
0xfdf00000-0xfebfffff]
[    0.040490] PM: hibernation: Registered nosave memory: [mem
0xfec00000-0xfec00fff]
[    0.040490] PM: hibernation: Registered nosave memory: [mem
0xfec01000-0xfec0ffff]
[    0.040491] PM: hibernation: Registered nosave memory: [mem
0xfec10000-0xfec10fff]
[    0.040491] PM: hibernation: Registered nosave memory: [mem
0xfec11000-0xfec1ffff]
[    0.040492] PM: hibernation: Registered nosave memory: [mem
0xfec20000-0xfec20fff]
[    0.040492] PM: hibernation: Registered nosave memory: [mem
0xfec21000-0xfed7ffff]
[    0.040493] PM: hibernation: Registered nosave memory: [mem
0xfed80000-0xfed80fff]
[    0.040494] PM: hibernation: Registered nosave memory: [mem
0xfed81000-0xfedfffff]
[    0.040494] PM: hibernation: Registered nosave memory: [mem
0xfee00000-0xfee00fff]
[    0.040495] PM: hibernation: Registered nosave memory: [mem
0xfee01000-0xfeffffff]
[    0.040495] PM: hibernation: Registered nosave memory: [mem
0xff000000-0xfff2ffff]
[    0.040496] PM: hibernation: Registered nosave memory: [mem
0xfff30000-0xffffffff]
[    0.040497] [mem 0xcf000000-0xf7ffffff] available for PCI devices
[    0.040498] Booting paravirtualized kernel on bare hardware
[    0.040501] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.044262] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:16
nr_node_ids:1
[    0.044920] percpu: Embedded 61 pages/cpu s212992 r8192 d28672 u262144
[    0.044929] pcpu-alloc: s212992 r8192 d28672 u262144 alloc=3D1*2097152
[    0.044931] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 1=
3 14
15=20
[    0.044957] Fallback order for Node 0: 0=20
[    0.044961] Built 1 zonelists, mobility grouping on.  Total pages: 39666=
49
[    0.044962] Policy zone: Normal
[    0.044963] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-linux
root=3DUUID=3Da1e2e1f9-dbcb-484e-a242-73d5754f8d98 rw quiet
resume=3DUUID=3D36238c5a-d1ff-4e5f-986a-4d302098cfd7 loglevel=3D3 audit=3D0
lsm=3Dlandlock,lockdown,yama,apparmor,bpf l1tf=3Dfull,force mds=3Dfull,nosmt
mitigations=3Dauto,nosmt nosmt=3Dforce pcie_aspm=3Dforce init_on_alloc=3D1
init_on_free=3D1 randomize_kstack_offset=3Don slab_nomerge pti=3Don slub_de=
bug=3DZF
slub_debug=3DP page_poison=3D1 mem_encrypt=3Don vsyscall=3Dnonei
amd_iommu=3Dforce_isolation radeon.dpm=3D1
[    0.045016] audit: disabled (until reboot)
[    0.045057] PCIe ASPM is forcibly enabled
[    0.045115] mem auto-init: SLAB_POISON will take precedence over
init_on_alloc/init_on_free
[    0.045154] Unknown kernel command line parameters
"BOOT_IMAGE=3D/boot/vmlinuz-linux pti=3Don mem_encrypt=3Don", will be passe=
d to user
space.
[    0.046995] Dentry cache hash table entries: 2097152 (order: 12, 16777216
bytes, linear)
[    0.047913] Inode-cache hash table entries: 1048576 (order: 11, 8388608
bytes, linear)
[    0.047971] mem auto-init: CONFIG_PAGE_POISONING is on, will take preced=
ence
over init_on_alloc and init_on_free
[    0.048205] mem auto-init: stack:byref_all(zero), heap alloc:off, heap
free:off
[    1.655813] Memory: 15526236K/16119096K available (14344K kernel code, 2=
078K
rwdata, 10920K rodata, 1800K init, 3856K bss, 592600K reserved, 0K
cma-reserved)
[    1.655818] **********************************************************
[    1.655819] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    1.655820] **                                                      **
[    1.655820] ** This system shows unhashed kernel memory addresses   **
[    1.655821] ** via the console, logs, and other interfaces. This    **
[    1.655821] ** might reduce the security of your system.            **
[    1.655821] **                                                      **
[    1.655822] ** If you see this message and you are not debugging    **
[    1.655822] ** the kernel, report this immediately to your system   **
[    1.655822] ** administrator!                                       **
[    1.655823] **                                                      **
[    1.655823] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    1.655823] **********************************************************
[    1.655826] random: get_random_u64 called from
__kmem_cache_create+0x2a/0x560 with crng_init=3D0
[    1.655983] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16, =
Nodes=3D1
[    1.655998] Kernel/User page tables isolation: enabled
[    1.656021] ftrace: allocating 44999 entries in 176 pages
[    1.667858] ftrace: allocated 176 pages with 3 groups
[    1.667958] Dynamic Preempt: full
[    1.668004] rcu: Preemptible hierarchical RCU implementation.
[    1.668005] rcu:     RCU dyntick-idle grace-period acceleration is enabl=
ed.
[    1.668005] rcu:     RCU restricting CPUs from NR_CPUS=3D320 to nr_cpu_i=
ds=3D16.
[    1.668006] rcu:     RCU priority boosting: priority 1 delay 500 ms.
[    1.668007]  Trampoline variant of Tasks RCU enabled.
[    1.668007]  Rude variant of Tasks RCU enabled.
[    1.668008]  Tracing variant of Tasks RCU enabled.
[    1.668008] rcu: RCU calculated value of scheduler-enlistment delay is 30
jiffies.
[    1.668009] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D16
[    1.671521] NR_IRQS: 20736, nr_irqs: 1096, preallocated irqs: 16
[    1.671774] kfence: initialized - using 2097152 bytes for 255 objects at
0xffff966d7dc00000-0xffff966d7de00000
[    1.671943] Console: colour dummy device 80x25
[    1.671955] printk: console [tty0] enabled
[    1.671976] ACPI: Core revision 20210930
[    1.672195] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 133484873504 ns
[    1.672213] APIC: Switch to symmetric I/O mode setup
[    1.673015] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
[    1.673017] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
[    1.673018] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
[    1.673019] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
[    1.673327] Switched APIC routing to physical flat.
[    1.674078] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    1.688887] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:
0x222b8df9b1e, max_idle_ns: 440795294172 ns
[    1.688894] Calibrating delay loop (skipped), value calculated using tim=
er
frequency.. 4743.65 BogoMIPS (lpj=3D7901843)
[    1.688897] pid_max: default: 32768 minimum: 301
[    1.715278] LSM: Security Framework initializing
[    1.715296] landlock: Up and running.
[    1.715298] Yama: becoming mindful.
[    1.715331] AppArmor: AppArmor initialized
[    1.715334] LSM support for eBPF active
[    1.715388] Mount-cache hash table entries: 32768 (order: 6, 262144 byte=
s,
linear)
[    1.715424] Mountpoint-cache hash table entries: 32768 (order: 6, 262144
bytes, linear)
[    1.715688] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    1.715723] LVT offset 1 assigned for vector 0xf9
[    1.715783] LVT offset 2 assigned for vector 0xf4
[    1.715800] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    1.715801] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
[    1.715805] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user
pointer sanitization
[    1.715807] Spectre V2 : Mitigation: Full AMD retpoline
[    1.715808] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on
context switch
[    1.715809] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    1.715811] Spectre V2 : mitigation: Enabling conditional Indirect Branch
Prediction Barrier
[    1.715812] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss
disabled via prctl
[    1.719674] Freeing SMP alternatives memory: 36K
[    1.829712] smpboot: CPU0: AMD Ryzen 5 4500U with Radeon Graphics (famil=
y:
0x17, model: 0x60, stepping: 0x1)
[    1.829885] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    1.829890] ... version:                0
[    1.829890] ... bit width:              48
[    1.829891] ... generic registers:      6
[    1.829891] ... value mask:             0000ffffffffffff
[    1.829892] ... max period:             00007fffffffffff
[    1.829892] ... fixed-purpose events:   0
[    1.829893] ... event mask:             000000000000003f
[    1.829958] rcu: Hierarchical SRCU implementation.
[    1.830463] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    1.830655] smp: Bringing up secondary CPUs ...
[    1.830769] x86: Booting SMP configuration:
[    1.830770] .... node  #0, CPUs:        #1  #2  #3
[    1.834632] TSC synchronization [CPU#0 -> CPU#3]:
[    1.834633] Measured 3563 cycles TSC warp between CPUs, turning off TSC
clock.
[    1.834635] tsc: Marking TSC unstable due to check_tsc_sync_source failed
[    1.835693]   #4  #5
[    1.835948] smp: Brought up 1 node, 6 CPUs
[    1.835948] smpboot: Max logical packages: 3
[    1.835948] smpboot: Total of 6 processors activated (28458.91 BogoMIPS)
[    1.839409] devtmpfs: initialized
[    1.839409] x86/mm: Memory block size: 128MB
[    1.840055] ACPI: PM: Registering ACPI NVS region [mem
0x09f00000-0x09f0ffff] (65536 bytes)
[    1.840055] ACPI: PM: Registering ACPI NVS region [mem
0xccf7f000-0xcdf7efff] (16777216 bytes)
[    1.840055] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f,
max_idle_ns: 6370867519511994 ns
[    1.840055] futex hash table entries: 4096 (order: 6, 262144 bytes, line=
ar)
[    1.840055] pinctrl core: initialized pinctrl subsystem
[    1.840055] PM: RTC time: 16:58:46, date: 2022-01-21
[    1.842303] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    1.842676] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic
allocations
[    1.842928] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for atomic
allocations
[    1.843146] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic
allocations
[    1.843293] thermal_sys: Registered thermal governor 'fair_share'
[    1.843294] thermal_sys: Registered thermal governor 'bang_bang'
[    1.843295] thermal_sys: Registered thermal governor 'step_wise'
[    1.843295] thermal_sys: Registered thermal governor 'user_space'
[    1.843296] thermal_sys: Registered thermal governor 'power_allocator'
[    1.843315] cpuidle: using governor ladder
[    1.843317] cpuidle: using governor menu
[    1.843347] Simple Boot Flag at 0x44 set to 0x1
[    1.843347] HugeTLB: can free 4094 vmemmap pages for hugepages-1048576kB
[    1.843347] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    1.843347] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
0xf8000000-0xfbffffff] (base 0xf8000000)
[    1.843347] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
[    1.843347] PCI: Using configuration type 1 for base access
[    1.844126] kprobes: kprobe jump-optimization is enabled. All kprobes are
optimized if possible.
[    1.845615] HugeTLB: can free 6 vmemmap pages for hugepages-2048kB
[    1.845615] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    1.845615] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    1.845670] ACPI: Added _OSI(Module Device)
[    1.845671] ACPI: Added _OSI(Processor Device)
[    1.845672] ACPI: Added _OSI(3.0 _SCP Extensions)
[    1.845672] ACPI: Added _OSI(Processor Aggregator Device)
[    1.845674] ACPI: Added _OSI(Linux-Dell-Video)
[    1.845674] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    1.845675] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    1.863837] ACPI: 18 ACPI AML tables successfully acquired and loaded
[    1.865456] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    1.868622] ACPI: EC: EC started
[    1.868624] ACPI: EC: interrupt blocked
[    1.870738] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    1.870740] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC used to handle
transactions
[    1.870741] ACPI: Interpreter enabled
[    1.870756] ACPI: PM: (supports S0 S4 S5)
[    1.870757] ACPI: Using IOAPIC for interrupt routing
[    1.870974] PCI: Using host bridge windows from ACPI; if necessary, use
"pci=3Dnocrs" and report a bug
[    1.874165] ACPI: PM: Power Resource [P0U0]
[    1.874295] ACPI: PM: Power Resource [P3U0]
[    1.875052] ACPI: PM: Power Resource [P0U1]
[    1.875185] ACPI: PM: Power Resource [P3U1]
[    1.875844] ACPI: PM: Power Resource [P0S0]
[    1.875884] ACPI: PM: Power Resource [P3S0]
[    1.876047] ACPI: PM: Power Resource [P0S1]
[    1.876083] ACPI: PM: Power Resource [P3S1]
[    1.881981] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    1.881987] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM
Segments MSI EDR HPX-Type3]
[    1.882110] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug
LTR DPC]
[    1.882344] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER
PCIeCapability]
[    1.882356] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [=
bus
00-3f] only partially covers this bridge
[    1.882705] PCI host bridge to bus 0000:00
[    1.882707] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    1.882709] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    1.882710] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff
window]
[    1.882711] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000cffff
window]
[    1.882712] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000effff
window]
[    1.882713] pci_bus 0000:00: root bus resource [mem 0xd0000000-0xf7ffffff
window]
[    1.882714] pci_bus 0000:00: root bus resource [mem 0xfc000000-0xfed3ffff
window]
[    1.882715] pci_bus 0000:00: root bus resource [mem 0x450200000-0xfcffff=
ffff
window]
[    1.882716] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.882728] pci 0000:00:00.0: [1022:1630] type 00 class 0x060000
[    1.882791] pci 0000:00:00.2: [1022:1631] type 00 class 0x080600
[    1.882865] pci 0000:00:01.0: [1022:1632] type 00 class 0x060000
[    1.882917] pci 0000:00:02.0: [1022:1632] type 00 class 0x060000
[    1.882972] pci 0000:00:08.0: [1022:1632] type 00 class 0x060000
[    1.883019] pci 0000:00:08.1: [1022:1635] type 01 class 0x060400
[    1.883038] pci 0000:00:08.1: enabling Extended Tags
[    1.883067] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    1.883168] pci 0000:00:08.2: [1022:1635] type 01 class 0x060400
[    1.883188] pci 0000:00:08.2: enabling Extended Tags
[    1.883216] pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    1.883316] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    1.883439] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    1.883570] pci 0000:00:18.0: [1022:1448] type 00 class 0x060000
[    1.883603] pci 0000:00:18.1: [1022:1449] type 00 class 0x060000
[    1.883631] pci 0000:00:18.2: [1022:144a] type 00 class 0x060000
[    1.883658] pci 0000:00:18.3: [1022:144b] type 00 class 0x060000
[    1.883687] pci 0000:00:18.4: [1022:144c] type 00 class 0x060000
[    1.883719] pci 0000:00:18.5: [1022:144d] type 00 class 0x060000
[    1.883746] pci 0000:00:18.6: [1022:144e] type 00 class 0x060000
[    1.883775] pci 0000:00:18.7: [1022:144f] type 00 class 0x060000
[    1.883897] pci 0000:01:00.0: [1002:1636] type 00 class 0x030000
[    1.883908] pci 0000:01:00.0: reg 0x10: [mem 0xfce0000000-0xfcefffffff 6=
4bit
pref]
[    1.883915] pci 0000:01:00.0: reg 0x18: [mem 0xfcf0000000-0xfcf01fffff 6=
4bit
pref]
[    1.883920] pci 0000:01:00.0: reg 0x20: [io  0x1000-0x10ff]
[    1.883925] pci 0000:01:00.0: reg 0x24: [mem 0xd0400000-0xd047ffff]
[    1.883933] pci 0000:01:00.0: enabling Extended Tags
[    1.883944] pci 0000:01:00.0: BAR 0: assigned to efifb
[    1.883979] pci 0000:01:00.0: PME# supported from D1 D2 D3hot D3cold
[    1.884076] pci 0000:01:00.1: [1002:1637] type 00 class 0x040300
[    1.884083] pci 0000:01:00.1: reg 0x10: [mem 0xd04c8000-0xd04cbfff]
[    1.884102] pci 0000:01:00.1: enabling Extended Tags
[    1.884129] pci 0000:01:00.1: PME# supported from D1 D2 D3hot D3cold
[    1.884195] pci 0000:01:00.2: [1022:15df] type 00 class 0x108000
[    1.884207] pci 0000:01:00.2: reg 0x18: [mem 0xd0300000-0xd03fffff]
[    1.884216] pci 0000:01:00.2: reg 0x24: [mem 0xd04cc000-0xd04cdfff]
[    1.884222] pci 0000:01:00.2: enabling Extended Tags
[    1.884314] pci 0000:01:00.3: [1022:1639] type 00 class 0x0c0330
[    1.884324] pci 0000:01:00.3: reg 0x10: [mem 0xd0100000-0xd01fffff 64bit]
[    1.884346] pci 0000:01:00.3: enabling Extended Tags
[    1.884375] pci 0000:01:00.3: PME# supported from D0 D3hot D3cold
[    1.884445] pci 0000:01:00.4: [1022:1639] type 00 class 0x0c0330
[    1.884454] pci 0000:01:00.4: reg 0x10: [mem 0xd0200000-0xd02fffff 64bit]
[    1.884476] pci 0000:01:00.4: enabling Extended Tags
[    1.884505] pci 0000:01:00.4: PME# supported from D0 D3hot D3cold
[    1.884579] pci 0000:01:00.5: [1022:15e2] type 00 class 0x048000
[    1.884586] pci 0000:01:00.5: reg 0x10: [mem 0xd0480000-0xd04bffff]
[    1.884605] pci 0000:01:00.5: enabling Extended Tags
[    1.884632] pci 0000:01:00.5: PME# supported from D0 D3hot D3cold
[    1.884699] pci 0000:01:00.6: [1022:15e3] type 00 class 0x040300
[    1.884705] pci 0000:01:00.6: reg 0x10: [mem 0xd04c0000-0xd04c7fff]
[    1.884725] pci 0000:01:00.6: enabling Extended Tags
[    1.884752] pci 0000:01:00.6: PME# supported from D0 D3hot D3cold
[    1.884842] pci 0000:00:08.1: PCI bridge to [bus 01]
[    1.884845] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    1.884847] pci 0000:00:08.1:   bridge window [mem 0xd0100000-0xd04fffff]
[    1.884849] pci 0000:00:08.1:   bridge window [mem 0xfce0000000-0xfcf01f=
ffff
64bit pref]
[    1.884895] pci 0000:02:00.0: [1022:7901] type 00 class 0x010601
[    1.884921] pci 0000:02:00.0: reg 0x24: [mem 0xd0001000-0xd00017ff]
[    1.884928] pci 0000:02:00.0: enabling Extended Tags
[    1.885043] pci 0000:02:00.1: [1022:7901] type 00 class 0x010601
[    1.885068] pci 0000:02:00.1: reg 0x24: [mem 0xd0000000-0xd00007ff]
[    1.885076] pci 0000:02:00.1: enabling Extended Tags
[    1.885176] pci 0000:00:08.2: PCI bridge to [bus 02]
[    1.885179] pci 0000:00:08.2:   bridge window [mem 0xd0000000-0xd00fffff]
[    1.887154] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    1.887156] ACPI: PCI: Interrupt link LNKA disabled
[    1.887248] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    1.887249] ACPI: PCI: Interrupt link LNKB disabled
[    1.887322] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    1.887323] ACPI: PCI: Interrupt link LNKC disabled
[    1.887413] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    1.887414] ACPI: PCI: Interrupt link LNKD disabled
[    1.887499] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    1.887499] ACPI: PCI: Interrupt link LNKE disabled
[    1.887567] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    1.887567] ACPI: PCI: Interrupt link LNKF disabled
[    1.887634] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    1.887635] ACPI: PCI: Interrupt link LNKG disabled
[    1.887702] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    1.887703] ACPI: PCI: Interrupt link LNKH disabled
[    1.889759] ACPI: EC: interrupt unblocked
[    1.889760] ACPI: EC: event unblocked
[    1.889765] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    1.889766] ACPI: EC: GPE=3D0x3
[    1.889767] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC initialization comp=
lete
[    1.889768] ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used to handle transactions =
and
events
[    1.889797] iommu: Default domain type: Translated=20
[    1.889797] iommu: DMA domain TLB invalidation policy: lazy mode=20
[    1.889797] pci 0000:01:00.0: vgaarb: VGA device added:
decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
[    1.889797] pci 0000:01:00.0: vgaarb: bridge control possible
[    1.889797] pci 0000:01:00.0: vgaarb: setting as boot device
[    1.889797] vgaarb: loaded
[    1.889797] SCSI subsystem initialized
[    1.889797] libata version 3.00 loaded.
[    1.889797] ACPI: bus type USB registered
[    1.889797] usbcore: registered new interface driver usbfs
[    1.889797] usbcore: registered new interface driver hub
[    1.889797] usbcore: registered new device driver usb
[    1.893276] pps_core: LinuxPPS API ver. 1 registered
[    1.893277] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    1.893280] PTP clock support registered
[    1.893288] EDAC MC: Ver: 3.0.0
[    1.893336] Registered efivars operations
[    1.893336] NetLabel: Initializing
[    1.893336] NetLabel:  domain hash size =3D 128
[    1.893336] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    1.893336] NetLabel:  unlabeled traffic allowed by default
[    1.893336] mctp: management component transport protocol core
[    1.893336] NET: Registered PF_MCTP protocol family
[    1.893336] PCI: Using ACPI for IRQ routing
[    1.895864] PCI: pci_cache_line_size set to 64 bytes
[    1.895897] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    1.895898] e820: reserve RAM buffer [mem 0x09b00000-0x0bffffff]
[    1.895899] e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
[    1.895900] e820: reserve RAM buffer [mem 0xb327b000-0xb3ffffff]
[    1.895901] e820: reserve RAM buffer [mem 0xbab69000-0xbbffffff]
[    1.895902] e820: reserve RAM buffer [mem 0xc9f7f000-0xcbffffff]
[    1.895903] e820: reserve RAM buffer [mem 0xce000000-0xcfffffff]
[    1.895904] e820: reserve RAM buffer [mem 0x40f340000-0x40fffffff]
[    1.895908] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    1.895908] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    1.897999] clocksource: Switched to clocksource hpet
[    1.905838] VFS: Disk quotas dquot_6.6.0
[    1.905859] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    1.905989] AppArmor: AppArmor Filesystem Enabled
[    1.906048] pnp: PnP ACPI init
[    1.906329] system 00:00: [mem 0xfec00000-0xfec01fff] could not be reser=
ved
[    1.906333] system 00:00: [mem 0xfee00000-0xfee00fff] has been reserved
[    1.906335] system 00:00: [mem 0xfde00000-0xfdefffff] has been reserved
[    1.906573] system 00:03: [io  0x0400-0x04cf] has been reserved
[    1.906575] system 00:03: [io  0x04d0-0x04d1] has been reserved
[    1.906576] system 00:03: [io  0x04d6] has been reserved
[    1.906577] system 00:03: [io  0x0c00-0x0c01] has been reserved
[    1.906578] system 00:03: [io  0x0c14] has been reserved
[    1.906579] system 00:03: [io  0x0c50-0x0c52] has been reserved
[    1.906580] system 00:03: [io  0x0c6c] has been reserved
[    1.906582] system 00:03: [io  0x0c6f] has been reserved
[    1.906583] system 00:03: [io  0x0cd0-0x0cdb] has been reserved
[    1.906655] system 00:04: [mem 0x000e0000-0x000fffff] could not be reser=
ved
[    1.906657] system 00:04: [mem 0xff000000-0xffffffff] could not be reser=
ved
[    1.908282] pnp: PnP ACPI: found 5 devices
[    1.916708] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,
max_idle_ns: 2085701024 ns
[    1.916860] NET: Registered PF_INET protocol family
[    1.917573] IP idents hash table entries: 262144 (order: 9, 2097152 byte=
s,
linear)
[    1.918962] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5,
131072 bytes, linear)
[    1.919099] TCP established hash table entries: 131072 (order: 8, 1048576
bytes, linear)
[    1.919495] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes,
linear)
[    1.919563] TCP: Hash tables configured (established 131072 bind 65536)
[    1.919721] MPTCP token hash table entries: 16384 (order: 6, 393216 byte=
s,
linear)
[    1.919782] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    1.919834] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes,
linear)
[    1.919914] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.919920] NET: Registered PF_XDP protocol family
[    1.919933] pci 0000:00:08.1: PCI bridge to [bus 01]
[    1.919937] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    1.919941] pci 0000:00:08.1:   bridge window [mem 0xd0100000-0xd04fffff]
[    1.919943] pci 0000:00:08.1:   bridge window [mem 0xfce0000000-0xfcf01f=
ffff
64bit pref]
[    1.919946] pci 0000:00:08.2: PCI bridge to [bus 02]
[    1.919948] pci 0000:00:08.2:   bridge window [mem 0xd0000000-0xd00fffff]
[    1.919954] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    1.919955] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    1.919956] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    1.919957] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000cffff windo=
w]
[    1.919958] pci_bus 0000:00: resource 8 [mem 0x000d0000-0x000effff windo=
w]
[    1.919959] pci_bus 0000:00: resource 9 [mem 0xd0000000-0xf7ffffff windo=
w]
[    1.919960] pci_bus 0000:00: resource 10 [mem 0xfc000000-0xfed3ffff wind=
ow]
[    1.919961] pci_bus 0000:00: resource 11 [mem 0x450200000-0xfcffffffff
window]
[    1.919962] pci_bus 0000:01: resource 0 [io  0x1000-0x1fff]
[    1.919963] pci_bus 0000:01: resource 1 [mem 0xd0100000-0xd04fffff]
[    1.919964] pci_bus 0000:01: resource 2 [mem 0xfce0000000-0xfcf01fffff 6=
4bit
pref]
[    1.919965] pci_bus 0000:02: resource 1 [mem 0xd0000000-0xd00fffff]
[    1.920108] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
[    1.920143] pci 0000:01:00.3: extending delay after power-on from D3hot =
to
20 msec
[    1.921514] pci 0000:01:00.4: extending delay after power-on from D3hot =
to
20 msec
[    2.040923] pci 0000:01:00.4: quirk_usb_early_handoff+0x0/0x750 took 116=
605
usecs
[    2.040937] PCI: CLS 64 bytes, default 64
[    2.040952] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters support=
ed
[    2.041008] Trying to unpack rootfs image as initramfs...
[    2.041021] pci 0000:00:00.2: can't derive routing for PCI INT A
[    2.041022] pci 0000:00:00.2: PCI INT A: not connected
[    2.041041] pci 0000:00:01.0: Adding to iommu group 0
[    2.041059] pci 0000:00:02.0: Adding to iommu group 1
[    2.041074] pci 0000:00:08.0: Adding to iommu group 2
[    2.041081] pci 0000:00:08.1: Adding to iommu group 2
[    2.041088] pci 0000:00:08.2: Adding to iommu group 2
[    2.041101] pci 0000:00:14.0: Adding to iommu group 3
[    2.041110] pci 0000:00:14.3: Adding to iommu group 3
[    2.041135] pci 0000:00:18.0: Adding to iommu group 4
[    2.041143] pci 0000:00:18.1: Adding to iommu group 4
[    2.041151] pci 0000:00:18.2: Adding to iommu group 4
[    2.041158] pci 0000:00:18.3: Adding to iommu group 4
[    2.041166] pci 0000:00:18.4: Adding to iommu group 4
[    2.041175] pci 0000:00:18.5: Adding to iommu group 4
[    2.041182] pci 0000:00:18.6: Adding to iommu group 4
[    2.041190] pci 0000:00:18.7: Adding to iommu group 4
[    2.041195] pci 0000:01:00.0: Adding to iommu group 2
[    2.041201] pci 0000:01:00.1: Adding to iommu group 2
[    2.041206] pci 0000:01:00.2: Adding to iommu group 2
[    2.041210] pci 0000:01:00.3: Adding to iommu group 2
[    2.041215] pci 0000:01:00.4: Adding to iommu group 2
[    2.041222] pci 0000:01:00.5: Adding to iommu group 2
[    2.041227] pci 0000:01:00.6: Adding to iommu group 2
[    2.041233] pci 0000:02:00.0: Adding to iommu group 2
[    2.041238] pci 0000:02:00.1: Adding to iommu group 2
[    2.042856] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    2.042859] AMD-Vi: Extended features (0x206d73ef22254ade): PPR X2APIC N=
X GT
IA GA PC GA_vAPIC
[    2.042864] AMD-Vi: Interrupt remapping enabled
[    2.042864] AMD-Vi: Virtual APIC enabled
[    2.042864] AMD-Vi: X2APIC enabled
[    2.043034] software IO TLB: tearing down default memory pool
[    2.050863] LVT offset 0 assigned for vector 0x400
[    2.051243] perf: AMD IBS detected (0x000003ff)
[    2.051250] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4
counters/bank).
[    2.053130] Initialise system trusted keyrings
[    2.053146] Key type blacklist registered
[    2.053269] workingset: timestamp_bits=3D41 max_order=3D22 bucket_order=
=3D0
[    2.054755] zbud: loaded
[    2.057626] Key type asymmetric registered
[    2.057628] Asymmetric key parser 'x509' registered
[    2.057658] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor
242)
[    2.057855] io scheduler mq-deadline registered
[    2.057857] io scheduler kyber registered
[    2.057886] io scheduler bfq registered
[    2.058480] pcieport 0000:00:08.1: PME: Signaling with IRQ 26
[    2.058694] pcieport 0000:00:08.2: PME: Signaling with IRQ 27
[    2.058776] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    2.060715] ACPI: AC: AC Adapter [ACAD] (on-line)
[    2.060755] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    2.060778] ACPI: button: Power Button [PWRB]
[    2.060806] input: Lid Switch as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:2a/PNP0C09:00/PNP0C0D:00=
/input/input1
[    2.060821] ACPI: button: Lid Switch [LID0]
[    2.060875] Monitor-Mwait will be used to enter C-1 state
[    2.060896] ACPI: \_SB_.PLTF.C000: Found 3 idle states
[    2.060902] ACPI: FW issue: working around C-state latencies out of order
[    2.061104] ACPI: \_SB_.PLTF.C001: Found 3 idle states
[    2.061111] ACPI: FW issue: working around C-state latencies out of order
[    2.061206] ACPI: \_SB_.PLTF.C002: Found 3 idle states
[    2.061211] ACPI: FW issue: working around C-state latencies out of order
[    2.061351] ACPI: \_SB_.PLTF.C003: Found 3 idle states
[    2.061356] ACPI: FW issue: working around C-state latencies out of order
[    2.061528] ACPI: \_SB_.PLTF.C004: Found 3 idle states
[    2.061533] ACPI: FW issue: working around C-state latencies out of order
[    2.061719] ACPI: \_SB_.PLTF.C005: Found 3 idle states
[    2.061723] ACPI: FW issue: working around C-state latencies out of order
[    2.063909] thermal LNXTHERM:00: registered as thermal_zone0
[    2.063913] ACPI: thermal: Thermal Zone [TZ0] (50 C)
[    2.064213] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    2.065955] Non-volatile memory driver v1.3
[    2.065956] Linux agpgart interface v0.103
[    2.066020] AMD-Vi: AMD IOMMUv2 loaded and initialized
[    2.066094] ACPI: bus type drm_connector registered
[    2.066882] ahci 0000:02:00.0: version 3.0
[    2.067021] ahci 0000:02:00.0: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1
impl SATA mode
[    2.067023] ahci 0000:02:00.0: flags: 64bit ncq sntf ilck pm led clo only
pmp fbs pio slum part=20
[    2.067202] scsi host0: ahci
[    2.067260] ata1: SATA max UDMA/133 abar m2048@0xd0001000 port 0xd0001100
irq 29
[    2.067379] ahci 0000:02:00.1: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1
impl SATA mode
[    2.067381] ahci 0000:02:00.1: flags: 64bit ncq sntf ilck pm led clo only
pmp fbs pio slum part deso sadm sds=20
[    2.067599] scsi host1: ahci
[    2.067639] ata2: SATA max UDMA/133 abar m2048@0xd0000000 port 0xd0000100
irq 31
[    2.067662] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.067665] ehci-pci: EHCI PCI platform driver
[    2.067674] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.067676] ohci-pci: OHCI PCI platform driver
[    2.067681] uhci_hcd: USB Universal Host Controller Interface driver
[    2.067726] usbcore: registered new interface driver usbserial_generic
[    2.067730] usbserial: USB Serial support registered for generic
[    2.067823] rtc_cmos 00:01: RTC can wake from S4
[    2.068025] rtc_cmos 00:01: registered as rtc0
[    2.068070] rtc_cmos 00:01: setting system clock to 2022-01-21T16:58:46 =
UTC
(1642784326)
[    2.068083] rtc_cmos 00:01: alarms up to one month, 114 bytes nvram, hpet
irqs
[    2.068199] ledtrig-cpu: registered to indicate activity on CPUs
[    2.068398] efifb: probing for efifb
[    2.068406] efifb: framebuffer at 0xfce0000000, using 8128k, total 8128k
[    2.068407] efifb: mode is 1920x1080x32, linelength=3D7680, pages=3D1
[    2.068408] efifb: scrolling: redraw
[    2.068408] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    2.068458] fbcon: Deferring console take-over
[    2.068458] fb0: EFI VGA frame buffer device
[    2.068482] hid: raw HID events driver (C) Jiri Kosina
[    2.068544] drop_monitor: Initializing network drop monitor service
[    2.068590] Initializing XFRM netlink socket
[    2.068696] NET: Registered PF_INET6 protocol family
[    2.082578] ACPI: battery: Slot [BATT] (battery present)
[    2.379171] ata1: SATA link down (SStatus 0 SControl 300)
[    2.460312] Freeing initrd memory: 6628K
[    2.465677] Segment Routing with IPv6
[    2.465679] RPL Segment Routing with IPv6
[    2.465691] In-situ OAM (IOAM) with IPv6
[    2.465712] NET: Registered PF_PACKET protocol family
[    2.466851] microcode: CPU0: patch_level=3D0x08600106
[    2.466870] microcode: CPU1: patch_level=3D0x08600106
[    2.466873] microcode: CPU2: patch_level=3D0x08600106
[    2.466896] microcode: CPU3: patch_level=3D0x08600106
[    2.466921] microcode: CPU4: patch_level=3D0x08600106
[    2.466941] microcode: CPU5: patch_level=3D0x08600106
[    2.466945] microcode: Microcode Update Driver: v2.2.
[    2.467200] resctrl: L3 allocation detected
[    2.467202] resctrl: MB allocation detected
[    2.467203] resctrl: L3 monitoring detected
[    2.467206] IPI shorthand broadcast: enabled
[    2.467420] registered taskstats version 1
[    2.467746] Loading compiled-in X.509 certificates
[    2.470333] Loaded X.509 cert 'Build time autogenerated kernel key:
933d842aff12891f80fce03e52aba4ef2da7203b'
[    2.471289] zswap: loaded using pool lz4/z3fold
[    2.471670] Key type ._fscrypt registered
[    2.471671] Key type .fscrypt registered
[    2.471672] Key type fscrypt-provisioning registered
[    2.471730] AppArmor: AppArmor sha1 policy hashing enabled
[    2.473713] PM:   Magic number: 6:686:995
[    2.473773] memory memory38: hash matches
[    2.473915] RAS: Correctable Errors collector initialized.
[    2.535843] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    2.538607] ata2.00: ATA-11: SAMSUNG MZNLH512HALU-00000, RVT2200Q, max
UDMA/133
[    2.539644] ata2.00: 1000215216 sectors, multi 16: LBA48 NCQ (depth 32),=
 AA
[    2.542982] ata2.00: Features: Dev-Sleep NCQ-sndrcv
[    2.548098] ata2.00: configured for UDMA/133
[    2.548242] ata2.00: failed to enable DEVSLP
[    2.548249] ata2.00: failed to enable DIPM, Emask 0x40
[    8.169244] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    8.181646] ata2.00: configured for UDMA/133
[    8.182084] scsi 1:0:0:0: Direct-Access     ATA      SAMSUNG MZNLH512 20=
0Q
PQ: 0 ANSI: 5
[    8.182396] sd 1:0:0:0: [sda] 1000215216 512-byte logical blocks: (512
GB/477 GiB)
[    8.182405] sd 1:0:0:0: [sda] Write Protect is off
[    8.182406] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    8.182418] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    8.223971]  sda: sda1 sda2 sda3
[    8.259408] sd 1:0:0:0: [sda] Attached SCSI disk
[    8.259579] Unstable clock detected, switching default tracing clock to
"global"
               If you want to keep using the local clock, then add:
                 "trace_clock=3Dlocal"
               on the kernel command line
[    8.262384] Freeing unused decrypted memory: 2036K
[    8.262715] Freeing unused kernel image (initmem) memory: 1800K
[    8.272519] Write protecting the kernel read-only data: 28672k
[    8.273453] Freeing unused kernel image (text/rodata gap) memory: 2036K
[    8.273756] Freeing unused kernel image (rodata/data gap) memory: 1368K
[    8.298919] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    8.298926] rodata_test: all tests were successful
[    8.298928] x86/mm: Checking user space page tables
[    8.323067] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    8.323077] Run /init as init process
[    8.323079]   with arguments:
[    8.323081]     /init
[    8.323081]   with environment:
[    8.323082]     HOME=3D/
[    8.323082]     TERM=3Dlinux
[    8.323083]     BOOT_IMAGE=3D/boot/vmlinuz-linux
[    8.323083]     pti=3Don
[    8.323084]     mem_encrypt=3Don
[    8.345146] fbcon: Taking over console
[    8.345226] Console: switching to colour frame buffer device 240x67
[    8.443791] xhci_hcd 0000:01:00.3: xHCI Host Controller
[    8.443800] xhci_hcd 0000:01:00.3: new USB bus registered, assigned bus
number 1
[    8.443913] xhci_hcd 0000:01:00.3: hcc params 0x0268ffe5 hci version 0x1=
10
quirks 0x0000020000000410
[    8.444111] i8042: PNP: PS/2 Controller [PNP0303:KBC0] at 0x60,0x64 irq 1
[    8.444114] i8042: PNP: PS/2 appears to have AUX port disabled, if this =
is
incorrect please boot with i8042.nopnp
[    8.444333] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002,
bcdDevice=3D 5.16
...
[    9.120868] systemd-journald[265]: Received client request to flush runt=
ime
journal.
[    9.173700] acpi PNP0C14:01: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    9.173870] acpi_cpufreq: overriding BIOS provided _PSD data
[    9.195592] usb 3-1.1: new full-speed USB device number 3 using xhci_hcd
[    9.222933] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  p=
ost:
no)
[    9.223301] acpi device:0e: registered as cooling_device6
[    9.223357] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:0d/LNXVIDEO:00/input/inp=
ut3
[    9.233622] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00,
revision 0
[    9.233627] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port
selection
[    9.233748] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at
0xb20
[    9.259639] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    9.259772] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO
address
[    9.260408] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec
(nowayout=3D0)
[    9.336005] usb 3-1.1: not running at top speed; connect to a high speed=
 hub
[    9.346373] input: GXT7863:00 27C6:01E0 Mouse as
/devices/platform/AMDI0010:03/i2c-0/i2c-GXT7863:00/0018:27C6:01E0.0001/inpu=
t/input4
[    9.346442] input: GXT7863:00 27C6:01E0 Touchpad as
/devices/platform/AMDI0010:03/i2c-0/i2c-GXT7863:00/0018:27C6:01E0.0001/inpu=
t/input5
[    9.346482] hid-generic 0018:27C6:01E0.0001: input,hidraw0: I2C HID v1.00
Mouse [GXT7863:00 27C6:01E0] on i2c-GXT7863:00
[    9.352055] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    9.388000] usb 3-1.1: New USB device found, idVendor=3D25a4, idProduct=
=3D9311,
bcdDevice=3D 2.01
...
[    9.440169] Adding 17309968k swap on /dev/sda3.  Priority:-2 extents:1
across:17309968k SSFS
[    9.492241] usb 3-1.2: new high-speed USB device number 4 using xhci_hcd
[    9.526775] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840=
 ms
ovfl timer
[    9.526781] RAPL PMU: hw unit of domain package 2^-16 Joules
[    9.554442] cryptd: max_cpu_qlen set to 1000
[    9.567653] AVX2 version of gcm_enc/dec engaged.
[    9.567737] AES CTR mode by8 optimization enabled
[    9.592371] random: dbus-daemon: uninitialized urandom read (12 bytes re=
ad)
[    9.594333] usb 3-1.2: New USB device found, idVendor=3D05e3, idProduct=
=3D0610,
bcdDevice=3D 6.63
...
[    9.789632] ccp 0000:01:00.2: enabling device (0000 -> 0002)
[    9.789869] ccp 0000:01:00.2: ccp: unable to access the device: you migh=
t be
running a broken BIOS.
[    9.800024] ccp 0000:01:00.2: tee enabled
[    9.800030] ccp 0000:01:00.2: psp enabled
[    9.806377] snd_rn_pci_acp3x 0000:01:00.5: enabling device (0000 -> 0002)
[    9.817616] input: GXT7863:00 27C6:01E0 Mouse as
/devices/platform/AMDI0010:03/i2c-0/i2c-GXT7863:00/0018:27C6:01E0.0001/inpu=
t/input7
[    9.817748] input: GXT7863:00 27C6:01E0 Touchpad as
/devices/platform/AMDI0010:03/i2c-0/i2c-GXT7863:00/0018:27C6:01E0.0001/inpu=
t/input8
[    9.818225] hid-multitouch 0018:27C6:01E0.0001: input,hidraw0: I2C HID v=
1.00
Mouse [GXT7863:00 27C6:01E0] on i2c-GXT7863:00
[    9.864856] SVM: TSC scaling supported
[    9.864860] kvm: Nested Virtualization enabled
[    9.864861] SVM: kvm: Nested Paging enabled
[    9.864881] SVM: Virtual VMLOAD VMSAVE supported
[    9.864881] SVM: Virtual GIF supported
[    9.864882] SVM: LBR virtualization supported
[    9.903880] MCE: In-kernel MCE decoding enabled.
[    9.904565] mousedev: PS/2 mouse device common for all mice
[    9.948939] usb 3-1.2.3: new low-speed USB device number 5 using xhci_hcd
[   10.083038] usb 3-1.2.3: New USB device found, idVendor=3D1bcf,
idProduct=3D0005, bcdDevice=3D 0.90
[   10.083044] usb 3-1.2.3: New USB device strings: Mfr=3D0, Product=3D2,
SerialNumber=3D0
[   10.083045] usb 3-1.2.3: Product: USB Optical Mouse
[   10.097050] snd_hda_intel 0000:01:00.1: enabling device (0000 -> 0002)
[   10.097172] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio clie=
nt
[   10.097761] intel_rapl_common: Found RAPL domain package
[   10.097766] intel_rapl_common: Found RAPL domain core
[   10.097824] snd_hda_intel 0000:01:00.6: enabling device (0000 -> 0002)
[   10.159874] [drm] amdgpu kernel modesetting enabled.
[   10.162377] input: HD-Audio Generic HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:08.1/0000:01:00.1/sound/card1/input10
[   10.162447] input: HD-Audio Generic HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:08.1/0000:01:00.1/sound/card1/input11
[   10.204624] amdgpu: Virtual CRAT table created for CPU
[   10.204652] amdgpu: Topology: Add CPU node
[   10.204761] checking generic (fce0000000 7f0000) vs hw (fce0000000 10000=
000)
[   10.204765] checking generic (fce0000000 7f0000) vs hw (fce0000000 10000=
000)
[   10.204766] fb0: switching to amdgpu from EFI VGA
[   10.204864] Console: switching to colour dummy device 80x25
[   10.204904] amdgpu 0000:01:00.0: vgaarb: deactivate vga console
[   10.205000] amdgpu 0000:01:00.0: enabling device (0006 -> 0007)
[   10.205104] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636
0x1D72:0x1951 0xC3).
[   10.205108] amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone (TMZ) featu=
re
enabled
[   10.209668] usb-storage 4-1.1:1.0: USB Mass Storage device detected
[   10.210361] [drm] register mmio base: 0xD0400000
[   10.210364] [drm] register mmio size: 524288
[   10.210371] [drm] virtual display string:NULL,
0000:01:00.0:virtual_display:0, num_crtc:0
[   10.211465] [drm] add ip block number 0 <soc15_common>
[   10.211466] [drm] add ip block number 1 <gmc_v9_0>
[   10.211468] [drm] add ip block number 2 <vega10_ih>
[   10.211469] [drm] add ip block number 3 <psp>
[   10.211470] [drm] add ip block number 4 <smu>
[   10.211470] [drm] add ip block number 5 <dm>
[   10.211471] [drm] add ip block number 6 <gfx_v9_0>
[   10.211472] [drm] add ip block number 7 <sdma_v4_0>
[   10.211473] [drm] add ip block number 8 <vcn_v2_0>
[   10.211474] [drm] add ip block number 9 <jpeg_v2_0>
[   10.211495] amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS from VFCT
[   10.211499] amdgpu: ATOM BIOS: 113-RENOIR-026
[   10.212385] scsi host2: usb-storage 4-1.1:1.0
[   10.212482] usbcore: registered new interface driver usb-storage
[   10.217382] snd_hda_codec_realtek hdaudioC2D0: autoconfig for ALC256:
line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[   10.217387] snd_hda_codec_realtek hdaudioC2D0:    speaker_outs=3D0
(0x0/0x0/0x0/0x0/0x0)
[   10.217388] snd_hda_codec_realtek hdaudioC2D0:    hp_outs=3D1
(0x21/0x0/0x0/0x0/0x0)
[   10.217390] snd_hda_codec_realtek hdaudioC2D0:    mono: mono_out=3D0x0
[   10.217391] snd_hda_codec_realtek hdaudioC2D0:    inputs:
[   10.217392] snd_hda_codec_realtek hdaudioC2D0:      Mic=3D0x19
[   10.217447] [drm] VCN decode is enabled in VM mode
[   10.217450] [drm] VCN encode is enabled in VM mode
[   10.217451] [drm] JPEG decode is enabled in VM mode
[   10.217455] amdgpu 0000:01:00.0: amdgpu: PCIE atomic ops is not supported
[   10.217517] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit,
fragment size is 9-bit
[   10.217525] amdgpu 0000:01:00.0: amdgpu: VRAM: 512M 0x000000F400000000 -
0x000000F41FFFFFFF (512M used)
[   10.217528] amdgpu 0000:01:00.0: amdgpu: GART: 1024M 0x0000000000000000 -
0x000000003FFFFFFF
[   10.217529] amdgpu 0000:01:00.0: amdgpu: AGP: 267419648M 0x000000F800000=
000
- 0x0000FFFFFFFFFFFF
[   10.217535] [drm] Detected VRAM RAM=3D512M, BAR=3D512M
[   10.217536] [drm] RAM width 128bits DDR4
[   10.217584] [drm] amdgpu: 512M of VRAM memory ready
[   10.217585] [drm] amdgpu: 3072M of GTT memory ready.
[   10.222301] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   10.222414] [drm] PCIE GART of 1024M enabled.
[   10.222415] [drm] PTB located at 0x000000F400900000
[   10.226104] amdgpu 0000:01:00.0: amdgpu: PSP runtime database doesn't ex=
ist
[   10.227664] [drm] Loading DMUB firmware via PSP: version=3D0x0101001C
[   10.231039] usbcore: registered new interface driver uas
[   10.245100] [drm] Found VCN firmware Version ENC: 1.16 DEC: 5 VEP: 0
Revision: 3
[   10.245124] amdgpu 0000:01:00.0: amdgpu: Will use PSP to load VCN firmwa=
re
[   10.285451] input: HD-Audio Generic Mic as
/devices/pci0000:00/0000:00:08.1/0000:01:00.6/sound/card2/input12
[   10.285833] input: HD-Audio Generic Headphone as
/devices/pci0000:00/0000:00:08.1/0000:01:00.6/sound/card2/input13
[   10.311031] usbcore: registered new interface driver cdc_ether
[   10.400166] usb 4-1.2: reset SuperSpeed USB device number 4 using xhci_h=
cd
[   10.418656] urandom_read: 1 callbacks suppressed
[   10.418661] random: NetworkManager: uninitialized urandom read (16 bytes
read)
[   10.434020] random: nm-online: uninitialized urandom read (16 bytes read)
[   10.499002] r8152 4-1.2:1.0 eth0: v2.15.0 (2021/04/15)
[   10.499006] r8152 4-1.2:1.0 eth0: This product is covered by one or more=
 of
the following patents:
                        US6,570,884, US6,115,776, and US6,327,625.

[   10.499038] usbcore: registered new interface driver r8152
[   10.504897] usbcore: registered new interface driver r8153_ecm
[   10.555593] ucsi_acpi USBC000:00: PPM init failed (-110)
[   10.576049] random: nm-dispatcher: uninitialized urandom read (16 bytes
read)
[   10.630910] r8152 4-1.2:1.0 enp1s0f4u1u2: renamed from eth0
[   10.745587] random: crng init done
[   10.951048] [drm] reserve 0x400000 from 0xf41f800000 for PSP TMR
[   11.028615] amdgpu 0000:01:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[   11.036680] amdgpu 0000:01:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot
available
[   11.036684] amdgpu 0000:01:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[   11.036997] amdgpu 0000:01:00.0: amdgpu: SMU is initialized successfully!
[   11.037895] [drm] Display Core initialized with v3.2.160!
[   11.038458] [drm] DMUB hardware initialized: version=3D0x0101001C
[   11.153462] [drm] kiq ring mec 2 pipe 1 q 0
[   11.156943] [drm] VCN decode and encode initialized successfully(under D=
PG
Mode).
[   11.156965] [drm] JPEG decode initialized successfully.
[   11.159248] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[   11.182668] memmap_init_zone_device initialised 131072 pages in 4ms
[   11.182683] amdgpu: HMM registered 512MB device memory
[   11.182735] amdgpu: SRAT table not found
[   11.182737] amdgpu: Virtual CRAT table created for GPU
[   11.182978] amdgpu: Topology: Add dGPU node [0x1636:0x1002]
[   11.182986] kfd kfd: amdgpu: added device 1002:1636
[   11.183002] amdgpu 0000:01:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 8,
active_cu_number 6
[   11.186050] [drm] fb mappable at 0x410CD2000
[   11.186051] [drm] vram apper at 0x410000000
[   11.186052] [drm] size 8294400
[   11.186053] [drm] fb depth is 24
[   11.186053] [drm]    pitch is 7680
[   11.186139] fbcon: amdgpudrmfb (fb0) is primary device
[   11.224054] scsi 2:0:0:0: Direct-Access     TS-RDF5A Transcend        00=
04
PQ: 0 ANSI: 6
[   11.225548] sd 2:0:0:0: [sdb] Media removed, stopped polling
[   11.228132] sd 2:0:0:0: [sdb] Attached SCSI removable disk
[   11.246442] Console: switching to colour frame buffer device 240x67
[   11.265363] amdgpu 0000:01:00.0: [drm] fb0: amdgpudrmfb frame buffer dev=
ice
[   11.276046] amdgpu 0000:01:00.0: amdgpu: ring gfx uses VM inv eng 0 on h=
ub 0
[   11.276054] amdgpu 0000:01:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1
on hub 0
[   11.276057] amdgpu 0000:01:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4
on hub 0
[   11.276059] amdgpu 0000:01:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 5
on hub 0
[   11.276060] amdgpu 0000:01:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 6
on hub 0
[   11.276062] amdgpu 0000:01:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 7
on hub 0
[   11.276064] amdgpu 0000:01:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 8
on hub 0
[   11.276066] amdgpu 0000:01:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 9
on hub 0
[   11.276068] amdgpu 0000:01:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 10
on hub 0
[   11.276070] amdgpu 0000:01:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng =
11
on hub 0
[   11.276072] amdgpu 0000:01:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on=
 hub
1
[   11.276074] amdgpu 0000:01:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 =
on
hub 1
[   11.276076] amdgpu 0000:01:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4=
 on
hub 1
[   11.276078] amdgpu 0000:01:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5=
 on
hub 1
[   11.276080] amdgpu 0000:01:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6=
 on
hub 1
[   11.278697] [drm] Initialized amdgpu 3.44.0 20150101 for 0000:01:00.0 on
minor 0
[   11.781689] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[   13.200886] IPv6: ADDRCONF(NETDEV_CHANGE): enp1s0f4u1u2: link becomes re=
ady
[   13.201071] r8152 4-1.2:1.0 enp1s0f4u1u2: carrier on
[

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
