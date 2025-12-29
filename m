Received: from torino.frehi.be (torino.frehi.be [51.178.16.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2271EEA31;
	Mon, 29 Dec 2025 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.178.16.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767027784; cv=none; b=PiuUo7olrWtYzhyWLTUfpM5DaMmaOwHzdZASL2rTWcuyKyd+bFzgTFC0f+kZM5m3NLz6aaqv+Ws4jrLwmENH/+62Zitl/hqdwNCCy/5sG3q8ScY7CLWLesQO4R+x1qGm5JBomBSfOuUnVlo/ohsMWxePaxnYaATXfncHTHwKuEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767027784; c=relaxed/simple;
	bh=m0EQBAMUFM+18loxuxTrjd8Yq++BZJasB5nCdZy5Vw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QXTqTcP1e6+1HcohoSjgTv+wFx0IEMSicwpoJ7l94iiK1Z7lNeLKUefcw+bESnksXkNmshMq9UY8cMeaodMTSbqJ2oz9Yo5+u3aqDa/fdE3hRsu0ZQfbHKvfjt5BoGwPCJIEwn7fbaLzEcmIFNXl0WMn8B5VSLnt7YG+xdLtkEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frehi.be; spf=pass smtp.mailfrom=frehi.be; dkim=pass (2048-bit key) header.d=frehi.be header.i=@frehi.be header.b=z2BRB3qa; arc=none smtp.client-ip=51.178.16.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frehi.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frehi.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frehi.be header.i=@frehi.be header.b="z2BRB3qa"
Received: from localhost (localhost [127.0.0.1])
	by torino.frehi.be (Postfix) with ESMTP id E6D21D70213;
	Mon, 29 Dec 2025 18:02:57 +0100 (CET)
Received: from torino.frehi.be ([127.0.0.1])
 by localhost (torino.frehi.be [127.0.0.1]) (amavis, port 10026) with LMTP
 id 8xXzeUKXmtln; Mon, 29 Dec 2025 18:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=frehi.be;
	s=torino-201912; t=1767027776;
	bh=m0EQBAMUFM+18loxuxTrjd8Yq++BZJasB5nCdZy5Vw0=;
	h=Date:From:To:Cc:Subject:From;
	b=z2BRB3qamdOmrEHC2XolvgVJgWwlmQne9jXSHOds+SJ32XWnJJF1pFtS1wDhNJuqm
	 tEwULnARH10ceSjp0bi67RI5+Mjb8ULhhv3JETsbzgZ4aTe8rLS6KzoG5LzVMNrO/i
	 un+7ayFT1kPpk1WP2P1thxvXKL6x4wQyWsvmOhukY93l/YuR3cbIvgVfYSzJmUVi0n
	 LcP31F5HZJmtE5Yv50drQzgRYJmYnaQKfCtqEKBgkjdhDqApeoF69SOFUedD0oUsGU
	 BPg7Mgwf0au/U+fbCTGtmirw2bvKJsJsuYLdXU1hXhiHTYYrelkt6aMnQhlj/EqZM4
	 rfWU3a1yOORaw==
Received: by torino.frehi.be (Postfix, from userid 1000)
	id 0E8D1D70210; Mon, 29 Dec 2025 18:02:56 +0100 (CET)
Date: Mon, 29 Dec 2025 18:02:56 +0100
From: Frederik Himpe <frederik@frehi.be>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: After s2idle: amd-pmf AMDI0107:00: TEE enact cmd failed. err:
 ffff000e, ret:0
Message-ID: <aVK0QPrtjyASafJm@frehi.be>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="gFPYcNs9edbTnklI"
Content-Disposition: inline


--gFPYcNs9edbTnklI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I have an HP EliteBook 8 G1a 14 laptop. Often when resuming the system
from s2idle, I get an endless loop of this kernel error message,
repeated every second:

amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0

I understand this is similar to a problem reported earlier:
https://lore.kernel.org/platform-driver-x86/CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com/

however that problem happens after hibernation, while I'm using s2idle.

I attach a full dmesg log. i'm using Linux 6.18.2 (package from Debian
Experimental).

-- 
Frederik Himpe

--gFPYcNs9edbTnklI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="kernel.log"

[    0.738341] kernel: Linux version 6.18-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc-15 (Debian 15.2.0-11) 15.2.0, GNU ld (GNU Binutils for Debian) 2.45.50.20251209) #1 SMP PREEMPT_DYNAMIC Debian 6.18.2-1~exp1 (2025-12-18)
[    0.738365] kernel: Command line: initrd=\efc892db302843fb9ae1201a4a541dcb\6.18-amd64\initrd.img-6.18-amd64 root=UUID=158e40e5-7a47-422d-9742-681072369fa3 rootflags=subvol=@rootfs quiet splash pcie_aspm=force systemd.machine_id=efc892db302843fb9ae1201a4a541dcb
[    0.738372] kernel: x86/split lock detection: #DB: warning on user-space bus_locks
[    0.738374] kernel: BIOS-provided physical RAM map:
[    0.738378] kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.738381] kernel: BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] reserved
[    0.738385] kernel: BIOS-e820: [mem 0x0000000000100000-0x0000000009efffff] usable
[    0.738388] kernel: BIOS-e820: [mem 0x0000000009f00000-0x0000000009f3bfff] ACPI NVS
[    0.738391] kernel: BIOS-e820: [mem 0x0000000009f3c000-0x0000000044ad3fff] usable
[    0.738395] kernel: BIOS-e820: [mem 0x0000000044ad4000-0x0000000048851fff] reserved
[    0.738398] kernel: BIOS-e820: [mem 0x0000000048852000-0x0000000048f51fff] ACPI NVS
[    0.738401] kernel: BIOS-e820: [mem 0x0000000048f52000-0x0000000048ff6fff] ACPI data
[    0.738404] kernel: BIOS-e820: [mem 0x0000000048ff7000-0x0000000052bcefff] usable
[    0.738407] kernel: BIOS-e820: [mem 0x0000000052bcf000-0x0000000052bcffff] reserved
[    0.738411] kernel: BIOS-e820: [mem 0x0000000052bd0000-0x0000000052bdbfff] usable
[    0.738413] kernel: BIOS-e820: [mem 0x0000000052bdc000-0x0000000052bdcfff] reserved
[    0.738416] kernel: BIOS-e820: [mem 0x0000000052bdd000-0x000000005cfecfff] usable
[    0.738419] kernel: BIOS-e820: [mem 0x000000005cfed000-0x000000005cff1fff] reserved
[    0.738422] kernel: BIOS-e820: [mem 0x000000005cff2000-0x0000000077ffffff] usable
[    0.738426] kernel: BIOS-e820: [mem 0x0000000078000000-0x000000007bffffff] reserved
[    0.738429] kernel: BIOS-e820: [mem 0x000000007d675000-0x000000007d6fffff] reserved
[    0.738432] kernel: BIOS-e820: [mem 0x000000007d800000-0x000000007fffffff] reserved
[    0.738435] kernel: BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.738438] kernel: BIOS-e820: [mem 0x00000000fd300000-0x00000000fd3fffff] reserved
[    0.738441] kernel: BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.738444] kernel: BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
[    0.738447] kernel: BIOS-e820: [mem 0x00000000fed80000-0x00000000fed80fff] reserved
[    0.738450] kernel: BIOS-e820: [mem 0x00000000fedf1000-0x00000000fedf1fff] reserved
[    0.738453] kernel: BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.738456] kernel: BIOS-e820: [mem 0x0000000100000000-0x000000085e27ffff] usable
[    0.738458] kernel: BIOS-e820: [mem 0x000000085e280000-0x00000008a01fffff] reserved
[    0.738461] kernel: BIOS-e820: [mem 0x000000fd00000000-0x000000fd01ffffff] reserved
[    0.738464] kernel: NX (Execute Disable) protection: active
[    0.738467] kernel: APIC: Static calls initialized
[    0.738470] kernel: efi: EFI v2.9 by HP
[    0.738473] kernel: efi: ACPI=0x48ff6000 ACPI 2.0=0x48ff6014 SMBIOS=0x45da4000 SMBIOS 3.0=0x45da2000 TPMFinalLog=0x48e9f000 ESRT=0x45d39118 RTPROP=0x45d39898 MEMATTR=0x38488418 MOKvar=0x45dcd000 RNG=0x48f71f18 INITRD=0x2deecf98 TPMEventLog=0x48f66018 
[    0.738477] kernel: random: crng init done
[    0.738479] kernel: efi: Remove mem74: MMIO range=[0xe0000000-0xefffffff] (256MB) from e820 map
[    0.738482] kernel: e820: remove [mem 0xe0000000-0xefffffff] reserved
[    0.738486] kernel: efi: Remove mem75: MMIO range=[0xfd300000-0xfd3fffff] (1MB) from e820 map
[    0.738490] kernel: e820: remove [mem 0xfd300000-0xfd3fffff] reserved
[    0.738494] kernel: efi: Not removing mem76: MMIO range=[0xfec00000-0xfec00fff] (4KB) from e820 map
[    0.738497] kernel: efi: Not removing mem77: MMIO range=[0xfec10000-0xfec10fff] (4KB) from e820 map
[    0.738499] kernel: efi: Not removing mem78: MMIO range=[0xfed80000-0xfed80fff] (4KB) from e820 map
[    0.738502] kernel: efi: Not removing mem79: MMIO range=[0xfedf1000-0xfedf1fff] (4KB) from e820 map
[    0.738504] kernel: efi: Not removing mem80: MMIO range=[0xfee00000-0xfee00fff] (4KB) from e820 map
[    0.738506] kernel: efi: Remove mem82: MMIO range=[0x880000000-0x8a01fffff] (514MB) from e820 map
[    0.738509] kernel: e820: remove [mem 0x880000000-0x8a01fffff] reserved
[    0.738511] kernel: efi: Remove mem83: MMIO range=[0xfd00000000-0xfd01ffffff] (32MB) from e820 map
[    0.738514] kernel: e820: remove [mem 0xfd00000000-0xfd01ffffff] reserved
[    0.738517] kernel: Kernel is locked down from EFI Secure Boot; see man kernel_lockdown.7
[    0.738520] kernel: secureboot: Secure boot enabled
[    0.738523] kernel: SMBIOS 3.4.0 present.
[    0.738526] kernel: DMI: HP HP EliteBook 8 G1a 14 inch Notebook Next Gen AI PC/8E17, BIOS X84 Ver. 01.03.03 10/14/2025
[    0.738529] kernel: DMI: Memory slots populated: 2/2
[    0.738532] kernel: tsc: Fast TSC calibration using PIT
[    0.738535] kernel: tsc: Detected 1996.186 MHz processor
[    0.738539] kernel: e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.738543] kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.738547] kernel: last_pfn = 0x85e280 max_arch_pfn = 0x400000000
[    0.738551] kernel: MTRR map: 8 entries (3 fixed + 5 variable; max 20), built from 9 variable MTRRs
[    0.738555] kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.738558] kernel: last_pfn = 0x78000 max_arch_pfn = 0x400000000
[    0.738564] kernel: esrt: Reserving ESRT space from 0x0000000045d39118 to 0x0000000045d391c8.
[    0.738568] kernel: Using GB pages for direct mapping
[    0.738572] kernel: RAMDISK: [mem 0x26c97000-0x29ed5fff]
[    0.738576] kernel: ACPI: Early table checksum verification disabled
[    0.738581] kernel: ACPI: RSDP 0x0000000048FF6014 000024 (v02 HPQOEM)
[    0.738585] kernel: ACPI: XSDT 0x0000000048F80228 0001C4 (v01 HPQOEM SLIC-BPC 00000001      01000013)
[    0.738589] kernel: ACPI: FACP 0x0000000048FE2000 00010C (v05 HPQOEM SLIC-BPC 00000001 HP   00000001)
[    0.738594] kernel: ACPI: DSDT 0x0000000048FC1000 01B4D6 (v02 HPQOEM 8E17     00000000 INTL 20200717)
[    0.738598] kernel: ACPI: FACS 0x0000000048C73000 000040
[    0.738603] kernel: ACPI: SSDT 0x0000000048FF4000 000353 (v02 HP     NVTEC    00000001 INTL 20200717)
[    0.738607] kernel: ACPI: SSDT 0x0000000048FF3000 00013E (v02 HP     ShmTable 00000001 INTL 20200717)
[    0.738610] kernel: ACPI: SSDT 0x0000000048FEB000 007F18 (v02 AMD    AmdTable 00000002 MSFT 05000000)
[    0.738614] kernel: ACPI: RTMA 0x0000000048FEA000 00009E (v01 HP     _HBMART_ 00001000 HP   00000001)
[    0.738619] kernel: ACPI: SSDT 0x0000000048FE8000 001A39 (v02 HP     UcsiAcpi 00000001 INTL 20200717)
[    0.738624] kernel: ACPI: SSDT 0x0000000048FE7000 0000FB (v02 HP     UcsiCntr 00000001 INTL 20200717)
[    0.738627] kernel: ACPI: SSDT 0x0000000048FE6000 0000C2 (v01 HP     OPALPWD  00000001 INTL 20200717)
[    0.738630] kernel: ACPI: OEML 0x0000000048FE5000 000028 (v03 HPQOEM EDK2     00000002      01000013)
[    0.738635] kernel: ACPI: SSDT 0x0000000048FE4000 0005FB (v02 HPQOEM Tpm2Tabl 00001000 INTL 20200717)
[    0.738639] kernel: ACPI: TPM2 0x0000000048FE3000 000034 (v03 HPQOEM EDK2     00000002      01000013)
[    0.738643] kernel: ACPI: WSMT 0x0000000048FE1000 000028 (v01 HPQOEM 8E17     00000001 HP   00000001)
[    0.738646] kernel: ACPI: ASF! 0x0000000048FE0000 00006E (v32 HPQOEM 8E17     00000001 HP   00000001)
[    0.738649] kernel: ACPI: HPET 0x0000000048FDF000 000038 (v01 HPQOEM 8E17     00000001 HP   00000001)
[    0.738652] kernel: ACPI: APIC 0x0000000048FDE000 0001B2 (v02 HPQOEM 8E17     00000001 HP   00000001)
[    0.738657] kernel: ACPI: MCFG 0x0000000048FDD000 00003C (v01 HPQOEM 8E17     00000001 HP   00000001)
[    0.738660] kernel: ACPI: SSDT 0x0000000048FC0000 000167 (v01 HPQOEM AMDNFCI2 00000001 INTL 20200717)
[    0.738665] kernel: ACPI: SSDT 0x0000000048FBF000 00021A (v02 AMD    Hetero   00000001 INTL 20200717)
[    0.738669] kernel: ACPI: PCCT 0x0000000048FBE000 0000D4 (v02 AMD    AmdTable 00000001 AMD  00000001)
[    0.738673] kernel: ACPI: SSDT 0x0000000048FB8000 00547E (v02 AMD    AMD CPU  00000001 AMD  00000001)
[    0.738677] kernel: ACPI: FPDT 0x0000000048FB7000 000044 (v01 HPQOEM EDK2     00000002      01000013)
[    0.738682] kernel: ACPI: ABLT 0x0000000048FF5000 0002C2 (v00                 00000000      00000000)
[    0.738687] kernel: ACPI: SSDT 0x0000000048FB5000 000045 (v02 HP     HPNBCONV 00001000 INTL 20200717)
[    0.738690] kernel: ACPI: SSDT 0x0000000048FB4000 000783 (v01 HP     AMDTPL   00001000 INTL 20200717)
[    0.738695] kernel: ACPI: SSDT 0x0000000048FAF000 004DA8 (v02 HP     HPAMD_WL 00001000 INTL 20200717)
[    0.738699] kernel: ACPI: SSDT 0x0000000048FAE000 000032 (v02 HP     HPCONDEV 00001000 INTL 20200717)
[    0.738702] kernel: ACPI: SSDT 0x0000000048FAD000 000E9F (v02 HPQOEM HPPATT   00001000 INTL 20200717)
[    0.738706] kernel: ACPI: VFCT 0x0000000048FA7000 005484 (v01 HPQOEM SLIC-BPC 00000001 AMD  33504F47)
[    0.738709] kernel: ACPI: SSDT 0x0000000048FA6000 000EA4 (v02 AMD    OEMACP   00000001 INTL 20200717)
[    0.738713] kernel: ACPI: SSDT 0x0000000048FA3000 002A8E (v02 AMD    OEMPMF   00000001 INTL 20200717)
[    0.738717] kernel: ACPI: SSDT 0x0000000048FA1000 001DB7 (v02 AMD    CPMPMF   00000001 INTL 20200717)
[    0.738721] kernel: ACPI: SSDT 0x0000000048FA0000 000490 (v02 AMD    CPMWBH   00000001 INTL 20200717)
[    0.738725] kernel: ACPI: SSDT 0x0000000048F9F000 0007C4 (v02 AMD    CPMDFIG4 00000001 INTL 20200717)
[    0.738730] kernel: ACPI: SSDT 0x0000000048F9C000 002B4E (v02 AMD    CDFAAIG2 00000001 INTL 20200717)
[    0.738734] kernel: ACPI: SSDT 0x0000000048F92000 009A47 (v02 AMD    CPMCMN   00000001 INTL 20200717)
[    0.738739] kernel: ACPI: BGRT 0x0000000048F91000 000038 (v01 HPQOEM EDK2     00000002      01000013)
[    0.738743] kernel: ACPI: SSDT 0x0000000048F90000 000B04 (v02 AMD    WLAN     00000001 INTL 20200717)
[    0.738747] kernel: ACPI: SSDT 0x0000000048F8F000 000E5E (v02 AMD    NVME     00000001 INTL 20200717)
[    0.738751] kernel: ACPI: SSDT 0x0000000048F8D000 001497 (v02 AMD    UPEP     00000001 INTL 20200717)
[    0.738756] kernel: ACPI: SSDT 0x0000000048F8B000 00101C (v02 AMD    GPP_PME_ 00000001 INTL 20200717)
[    0.738760] kernel: ACPI: SSDT 0x0000000048F81000 0097D1 (v02 AMD    INTBUSC_ 00000001 INTL 20200717)
[    0.738763] kernel: ACPI: SSDT 0x0000000048F7B000 004608 (v02 AMD    INTGPPA_ 00000001 INTL 20200717)
[    0.738766] kernel: ACPI: SSDT 0x0000000048FB6000 000B21 (v02 AMD    CPMGPIO0 00000001 INTL 20200717)
[    0.738771] kernel: ACPI: SSDT 0x0000000048F7A000 00010D (v02 MSFT   MHSP     00000004 INTL 20200717)
[    0.738774] kernel: ACPI: SSDT 0x0000000048F79000 000051 (v02 AMD    DRTM     00000001 INTL 20200717)
[    0.738778] kernel: ACPI: IVRS 0x0000000048F78000 0001F6 (v02 AMD    AmdTable 00000001 AMD  00000001)
[    0.738781] kernel: ACPI: SSDT 0x0000000048F77000 000500 (v02 AMD    MEMTOOL0 00000002 INTL 20200717)
[    0.738786] kernel: ACPI: SSDT 0x0000000048F76000 00096A (v02 AMD    CPMMSOSC 00000001 INTL 20200717)
[    0.738790] kernel: ACPI: SSDT 0x0000000048F75000 00008D (v02 AMD    CPMMSLPI 00000001 INTL 20200717)
[    0.738794] kernel: ACPI: SSDT 0x0000000048F74000 000509 (v02 AMD    CPMSFAML 00000001 INTL 20200717)
[    0.738798] kernel: ACPI: SSDT 0x0000000048F73000 000F5C (v02 AMD    CPMACPV8 00000001 INTL 20200717)
[    0.738802] kernel: ACPI: SDEV 0x0000000048F72000 00014E (v01                 00000000      00000000)
[    0.738806] kernel: ACPI: Reserving FACP table memory at [mem 0x48fe2000-0x48fe210b]
[    0.738811] kernel: ACPI: Reserving DSDT table memory at [mem 0x48fc1000-0x48fdc4d5]
[    0.738814] kernel: ACPI: Reserving FACS table memory at [mem 0x48c73000-0x48c7303f]
[    0.738817] kernel: ACPI: Reserving SSDT table memory at [mem 0x48ff4000-0x48ff4352]
[    0.738820] kernel: ACPI: Reserving SSDT table memory at [mem 0x48ff3000-0x48ff313d]
[    0.738824] kernel: ACPI: Reserving SSDT table memory at [mem 0x48feb000-0x48ff2f17]
[    0.738827] kernel: ACPI: Reserving RTMA table memory at [mem 0x48fea000-0x48fea09d]
[    0.738830] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fe8000-0x48fe9a38]
[    0.738833] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fe7000-0x48fe70fa]
[    0.738836] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fe6000-0x48fe60c1]
[    0.738839] kernel: ACPI: Reserving OEML table memory at [mem 0x48fe5000-0x48fe5027]
[    0.738842] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fe4000-0x48fe45fa]
[    0.738845] kernel: ACPI: Reserving TPM2 table memory at [mem 0x48fe3000-0x48fe3033]
[    0.738850] kernel: ACPI: Reserving WSMT table memory at [mem 0x48fe1000-0x48fe1027]
[    0.738853] kernel: ACPI: Reserving ASF! table memory at [mem 0x48fe0000-0x48fe006d]
[    0.738856] kernel: ACPI: Reserving HPET table memory at [mem 0x48fdf000-0x48fdf037]
[    0.738859] kernel: ACPI: Reserving APIC table memory at [mem 0x48fde000-0x48fde1b1]
[    0.738863] kernel: ACPI: Reserving MCFG table memory at [mem 0x48fdd000-0x48fdd03b]
[    0.738866] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fc0000-0x48fc0166]
[    0.738869] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fbf000-0x48fbf219]
[    0.738872] kernel: ACPI: Reserving PCCT table memory at [mem 0x48fbe000-0x48fbe0d3]
[    0.738876] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fb8000-0x48fbd47d]
[    0.738879] kernel: ACPI: Reserving FPDT table memory at [mem 0x48fb7000-0x48fb7043]
[    0.738882] kernel: ACPI: Reserving ABLT table memory at [mem 0x48ff5000-0x48ff52c1]
[    0.738885] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fb5000-0x48fb5044]
[    0.738889] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fb4000-0x48fb4782]
[    0.738892] kernel: ACPI: Reserving SSDT table memory at [mem 0x48faf000-0x48fb3da7]
[    0.738895] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fae000-0x48fae031]
[    0.738898] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fad000-0x48fade9e]
[    0.738902] kernel: ACPI: Reserving VFCT table memory at [mem 0x48fa7000-0x48fac483]
[    0.738904] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fa6000-0x48fa6ea3]
[    0.738907] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fa3000-0x48fa5a8d]
[    0.738909] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fa1000-0x48fa2db6]
[    0.738914] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fa0000-0x48fa048f]
[    0.738917] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f9f000-0x48f9f7c3]
[    0.738921] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f9c000-0x48f9eb4d]
[    0.738924] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f92000-0x48f9ba46]
[    0.738928] kernel: ACPI: Reserving BGRT table memory at [mem 0x48f91000-0x48f91037]
[    0.738930] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f90000-0x48f90b03]
[    0.738934] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f8f000-0x48f8fe5d]
[    0.738936] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f8d000-0x48f8e496]
[    0.738940] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f8b000-0x48f8c01b]
[    0.738943] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f81000-0x48f8a7d0]
[    0.738945] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f7b000-0x48f7f607]
[    0.738948] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fb6000-0x48fb6b20]
[    0.738952] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f7a000-0x48f7a10c]
[    0.738955] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f79000-0x48f79050]
[    0.738957] kernel: ACPI: Reserving IVRS table memory at [mem 0x48f78000-0x48f781f5]
[    0.738961] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f77000-0x48f774ff]
[    0.738964] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f76000-0x48f76969]
[    0.738966] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f75000-0x48f7508c]
[    0.738969] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f74000-0x48f74508]
[    0.738973] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f73000-0x48f73f5b]
[    0.738976] kernel: ACPI: Reserving SDEV table memory at [mem 0x48f72000-0x48f7214d]
[    0.738979] kernel: No NUMA configuration found
[    0.738982] kernel: Faking a node at [mem 0x0000000000000000-0x000000085e27ffff]
[    0.738985] kernel: NODE_DATA(0) allocated [mem 0x85e255500-0x85e27ffff]
[    0.738989] kernel: Zone ranges:
[    0.738993] kernel:   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.738997] kernel:   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.739000] kernel:   Normal   [mem 0x0000000100000000-0x000000085e27ffff]
[    0.739002] kernel:   Device   empty
[    0.739006] kernel: Movable zone start for each node
[    0.739009] kernel: Early memory node ranges
[    0.739013] kernel:   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.739016] kernel:   node   0: [mem 0x0000000000100000-0x0000000009efffff]
[    0.739018] kernel:   node   0: [mem 0x0000000009f3c000-0x0000000044ad3fff]
[    0.739021] kernel:   node   0: [mem 0x0000000048ff7000-0x0000000052bcefff]
[    0.739025] kernel:   node   0: [mem 0x0000000052bd0000-0x0000000052bdbfff]
[    0.739027] kernel:   node   0: [mem 0x0000000052bdd000-0x000000005cfecfff]
[    0.739031] kernel:   node   0: [mem 0x000000005cff2000-0x0000000077ffffff]
[    0.739034] kernel:   node   0: [mem 0x0000000100000000-0x000000085e27ffff]
[    0.739036] kernel: Initmem setup node 0 [mem 0x0000000000001000-0x000000085e27ffff]
[    0.739039] kernel: On node 0, zone DMA: 1 pages in unavailable ranges
[    0.739042] kernel: On node 0, zone DMA: 97 pages in unavailable ranges
[    0.739046] kernel: On node 0, zone DMA32: 60 pages in unavailable ranges
[    0.739050] kernel: On node 0, zone DMA32: 17699 pages in unavailable ranges
[    0.739054] kernel: On node 0, zone DMA32: 1 pages in unavailable ranges
[    0.739058] kernel: On node 0, zone DMA32: 1 pages in unavailable ranges
[    0.739062] kernel: On node 0, zone DMA32: 5 pages in unavailable ranges
[    0.739067] kernel: On node 0, zone Normal: 7552 pages in unavailable ranges
[    0.739070] kernel: ACPI: PM-Timer IO Port: 0x408
[    0.739073] kernel: CPU topo: Ignoring hot-pluggable APIC ID 0 in present package.
[    0.739077] kernel: ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.739080] kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.739083] kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.739086] kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.739088] kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.739091] kernel: ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.739095] kernel: ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.739098] kernel: ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.739100] kernel: ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.739104] kernel: ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.739106] kernel: ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.739109] kernel: ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.739111] kernel: ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.739114] kernel: ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.739116] kernel: ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.739119] kernel: ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.739122] kernel: ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    0.739124] kernel: ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
[    0.739129] kernel: ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
[    0.739132] kernel: ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
[    0.739134] kernel: ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
[    0.739137] kernel: ACPI: LAPIC_NMI (acpi_id[0x15] high edge lint[0x1])
[    0.739139] kernel: ACPI: LAPIC_NMI (acpi_id[0x16] high edge lint[0x1])
[    0.739142] kernel: ACPI: LAPIC_NMI (acpi_id[0x17] high edge lint[0x1])
[    0.739144] kernel: IOAPIC[0]: apic_id 4, version 33, address 0xfec00000, GSI 0-23
[    0.739147] kernel: IOAPIC[1]: apic_id 5, version 33, address 0xfec01000, GSI 24-55
[    0.739151] kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
[    0.739155] kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.739159] kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.739161] kernel: ACPI: Using ACPI (MADT) for SMP configuration information
[    0.739165] kernel: ACPI: HPET id: 0x10228210 base: 0xfed00000
[    0.739169] kernel: e820: update [mem 0x38253000-0x383f4fff] usable ==> reserved
[    0.739173] kernel: CPU topo: Max. logical packages:   1
[    0.739177] kernel: CPU topo: Max. logical dies:       1
[    0.739179] kernel: CPU topo: Max. dies per package:   1
[    0.739182] kernel: CPU topo: Max. threads per core:   2
[    0.739186] kernel: CPU topo: Num. cores per package:     8
[    0.739190] kernel: CPU topo: Num. threads per package:  16
[    0.739192] kernel: CPU topo: Allowing 16 present CPUs plus 0 hotplug CPUs
[    0.739194] kernel: CPU topo: Rejected CPUs 8
[    0.739199] kernel: PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.739202] kernel: PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.739207] kernel: PM: hibernation: Registered nosave memory: [mem 0x09f00000-0x09f3bfff]
[    0.739211] kernel: PM: hibernation: Registered nosave memory: [mem 0x38253000-0x383f4fff]
[    0.739214] kernel: PM: hibernation: Registered nosave memory: [mem 0x44ad4000-0x48ff6fff]
[    0.739216] kernel: PM: hibernation: Registered nosave memory: [mem 0x52bcf000-0x52bcffff]
[    0.739219] kernel: PM: hibernation: Registered nosave memory: [mem 0x52bdc000-0x52bdcfff]
[    0.739221] kernel: PM: hibernation: Registered nosave memory: [mem 0x5cfed000-0x5cff1fff]
[    0.739224] kernel: PM: hibernation: Registered nosave memory: [mem 0x78000000-0xffffffff]
[    0.739227] kernel: [mem 0x80000000-0xfebfffff] available for PCI devices
[    0.739231] kernel: Booting paravirtualized kernel on bare hardware
[    0.739233] kernel: clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.739237] kernel: setup_percpu: NR_CPUS:8192 nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
[    0.739240] kernel: percpu: Embedded 62 pages/cpu s217088 r8192 d28672 u262144
[    0.739243] kernel: pcpu-alloc: s217088 r8192 d28672 u262144 alloc=1*2097152
[    0.739246] kernel: pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
[    0.739250] kernel: Kernel command line: initrd=\efc892db302843fb9ae1201a4a541dcb\6.18-amd64\initrd.img-6.18-amd64 root=UUID=158e40e5-7a47-422d-9742-681072369fa3 rootflags=subvol=@rootfs quiet splash pcie_aspm=force systemd.machine_id=efc892db302843fb9ae1201a4a541dcb
[    0.739255] kernel: PCIe ASPM is forcibly enabled
[    0.739259] kernel: Unknown kernel command line parameters "splash", will be passed to user space.
[    0.739263] kernel: printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
[    0.739267] kernel: Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.739270] kernel: Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.739273] kernel: software IO TLB: area num 16.
[    0.739276] kernel: Fallback order for Node 0: 0 
[    0.739279] kernel: Built 1 zonelists, mobility grouping on.  Total pages: 8199352
[    0.739282] kernel: Policy zone: Normal
[    0.739284] kernel: mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.739288] kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
[    0.739292] kernel: ftrace: allocating 48083 entries in 188 pages
[    0.739294] kernel: ftrace: allocated 188 pages with 5 groups
[    0.739297] kernel: Dynamic Preempt: lazy
[    0.739300] kernel: rcu: Preemptible hierarchical RCU implementation.
[    0.739303] kernel: rcu:         RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=16.
[    0.739307] kernel:         Trampoline variant of Tasks RCU enabled.
[    0.739309] kernel:         Rude variant of Tasks RCU enabled.
[    0.739312] kernel:         Tracing variant of Tasks RCU enabled.
[    0.739314] kernel: rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.739317] kernel: rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=16
[    0.739320] kernel: RCU Tasks: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.739323] kernel: RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.739327] kernel: RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.739331] kernel: NR_IRQS: 524544, nr_irqs: 1096, preallocated irqs: 16
[    0.739336] kernel: rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.739341] kernel: Console: colour dummy device 80x25
[    0.739344] kernel: printk: legacy console [tty0] enabled
[    0.739348] kernel: ACPI: Core revision 20250807
[    0.739353] kernel: clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
[    0.739355] kernel: APIC: Switch to symmetric I/O mode setup
[    0.739359] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID00, rdevid:0xa0
[    0.739362] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID01, rdevid:0xa0
[    0.739365] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID02, rdevid:0xa0
[    0.739370] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID03, rdevid:0x98
[    0.739372] kernel: AMD-Vi: ivrs, add hid:MSFT0201, uid:1, rdevid:0x60
[    0.739376] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID04, rdevid:0x98
[    0.739380] kernel: AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x10
[    0.739383] kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.739385] kernel: clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x398c36fe48b, max_idle_ns: 881590820471 ns
[    0.739388] kernel: Calibrating delay loop (skipped), value calculated using timer frequency.. 3992.37 BogoMIPS (lpj=7984744)
[    0.739391] kernel: x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.739394] kernel: LVT offset 1 assigned for vector 0xf9
[    0.739397] kernel: LVT offset 2 assigned for vector 0xf4
[    0.739401] kernel: Last level iTLB entries: 4KB 64, 2MB 64, 4MB 32
[    0.739403] kernel: Last level dTLB entries: 4KB 128, 2MB 128, 4MB 64, 1GB 0
[    0.739406] kernel: process: using mwait in idle threads
[    0.739409] kernel: mitigations: Enabled attack vectors: user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
[    0.739413] kernel: Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.739417] kernel: Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.739421] kernel: Spectre V2 : User space: Mitigation: STIBP always-on protection
[    0.739423] kernel: Speculative Return Stack Overflow: Mitigation: IBPB on VMEXIT only
[    0.739426] kernel: VMSCAPE: Mitigation: IBPB on VMEXIT
[    0.739429] kernel: Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.739432] kernel: Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.739434] kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.739437] kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.739441] kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.739443] kernel: x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.739447] kernel: x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.739449] kernel: x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.739452] kernel: x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.739456] kernel: x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User registers'
[    0.739459] kernel: x86/fpu: Supporting XSAVE feature 0x1000: 'Control-flow Kernel registers (KVM only)'
[    0.739463] kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.739465] kernel: x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.739469] kernel: x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.739472] kernel: x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.739476] kernel: x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.739479] kernel: x86/fpu: xstate_offset[11]: 2440, xstate_sizes[11]:   16
[    0.739482] kernel: x86/fpu: xstate_offset[12]: 2456, xstate_sizes[12]:   24
[    0.739484] kernel: x86/fpu: Enabled xstate features 0x1ae7, context size is 2480 bytes, using 'compacted' format.
[    0.739488] kernel: Freeing SMP alternatives memory: 44K
[    0.739490] kernel: pid_max: default: 32768 minimum: 301
[    0.739495] kernel: LSM: initializing lsm=lockdown,capability,landlock,yama,apparmor,tomoyo,bpf,ipe,ima,evm
[    0.739498] kernel: landlock: Up and running.
[    0.739500] kernel: Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.739503] kernel: AppArmor: AppArmor initialized
[    0.739506] kernel: TOMOYO Linux initialized
[    0.739509] kernel: LSM support for eBPF active
[    0.739512] kernel: Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.739532] kernel: Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.739534] kernel: smpboot: CPU0: AMD Ryzen AI 7 PRO 350 w/ Radeon 860M (family: 0x1a, model: 0x60, stepping: 0x0)
[    0.739537] kernel: Performance Events: Fam17h+ 16-deep LBR, core perfctr, AMD PMU driver.
[    0.739542] kernel: ... version:                   2
[    0.739545] kernel: ... bit width:                 48
[    0.739548] kernel: ... generic counters:          6
[    0.739551] kernel: ... generic bitmap:            000000000000003f
[    0.739553] kernel: ... fixed-purpose counters:    0
[    0.739559] kernel: ... fixed-purpose bitmap:      0000000000000000
[    0.739562] kernel: ... value mask:                0000ffffffffffff
[    0.739564] kernel: ... max period:                00007fffffffffff
[    0.739567] kernel: ... global_ctrl mask:          000000000000003f
[    0.739570] kernel: signal: max sigframe size: 3376
[    0.739574] kernel: rcu: Hierarchical SRCU implementation.
[    0.739577] kernel: rcu:         Max phase no-delay instances is 1000.
[    0.739579] kernel: Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.739583] kernel: NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.739585] kernel: smp: Bringing up secondary CPUs ...
[    0.739590] kernel: smpboot: x86: Booting SMP configuration:
[    0.739594] kernel: .... node  #0, CPUs:        #2  #4  #6  #8 #10 #12 #14  #1  #3  #5  #7  #9 #11 #13 #15
[    0.739597] kernel: Spectre V2 : Update user space SMT mitigation: STIBP always-on
[    0.739601] kernel: smp: Brought up 1 node, 16 CPUs
[    0.739604] kernel: smpboot: Total of 16 processors activated (63877.95 BogoMIPS)
[    0.739607] kernel: node 0 deferred pages initialised in 16ms
[    0.739610] kernel: Memory: 32042176K/32797408K available (17663K kernel code, 3332K rwdata, 13448K rodata, 4448K init, 3616K bss, 736832K reserved, 0K cma-reserved)
[    0.739612] kernel: devtmpfs: initialized
[    0.739615] kernel: x86/mm: Memory block size: 128MB
[    0.739618] kernel: ACPI: PM: Registering ACPI NVS region [mem 0x09f00000-0x09f3bfff] (245760 bytes)
[    0.739620] kernel: ACPI: PM: Registering ACPI NVS region [mem 0x48852000-0x48f51fff] (7340032 bytes)
[    0.739623] kernel: clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.739625] kernel: posixtimers hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.739628] kernel: futex hash table entries: 4096 (262144 bytes on 1 NUMA nodes, total 256 KiB, linear).
[    0.739630] kernel: pinctrl core: initialized pinctrl subsystem
[    0.739634] kernel: NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.739637] kernel: DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.739640] kernel: DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.739643] kernel: DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.739646] kernel: audit: initializing netlink subsys (disabled)
[    0.739649] kernel: audit: type=2000 audit(1767002682.000:1): state=initialized audit_enabled=0 res=1
[    0.739653] kernel: thermal_sys: Registered thermal governor 'fair_share'
[    0.739655] kernel: thermal_sys: Registered thermal governor 'bang_bang'
[    0.739658] kernel: thermal_sys: Registered thermal governor 'step_wise'
[    0.739661] kernel: thermal_sys: Registered thermal governor 'user_space'
[    0.739664] kernel: thermal_sys: Registered thermal governor 'power_allocator'
[    0.739666] kernel: cpuidle: using governor ladder
[    0.739668] kernel: cpuidle: using governor menu
[    0.739671] kernel: Detected 1 PCC Subspaces
[    0.739673] kernel: Registering PCC driver as Mailbox controller
[    0.739675] kernel: ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.739678] kernel: acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.739681] kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe0000000) for domain 0000 [bus 00-ff]
[    0.739683] kernel: PCI: Using configuration type 1 for base access
[    0.739686] kernel: kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.739688] kernel: HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.739690] kernel: HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.739692] kernel: HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.739695] kernel: HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.739698] kernel: ACPI: Added _OSI(Module Device)
[    0.739700] kernel: ACPI: Added _OSI(Processor Device)
[    0.739702] kernel: ACPI: Added _OSI(Processor Aggregator Device)
[    0.739704] kernel: ACPI: 37 ACPI AML tables successfully acquired and loaded
[    0.739707] kernel: ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.739710] kernel: ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomain+
[    0.739714] kernel: ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomain+
[    0.739717] kernel: ACPI: EC: EC started
[    0.739720] kernel: ACPI: EC: interrupt blocked
[    0.739724] kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.739728] kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle transactions
[    0.739731] kernel: ACPI: Interpreter enabled
[    0.739734] kernel: ACPI: PM: (supports S0 S4 S5)
[    0.739737] kernel: ACPI: Using IOAPIC for interrupt routing
[    0.739740] kernel: PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.739743] kernel: PCI: Ignoring E820 reservations for host bridge windows
[    0.739745] kernel: ACPI: Enabled 6 GPEs in block 00 to 1F
[    0.739749] kernel: ACPI: \_SB_.PCI0.GP11.PWRS: New power resource
[    0.739751] kernel: ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New power resource
[    0.739755] kernel: ACPI: \_SB_.PCI0.GP12.PWRS: New power resource
[    0.739758] kernel: ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New power resource
[    0.739762] kernel: ACPI: \_SB_.PCI0.GP21.P0NV: New power resource
[    0.739765] kernel: ACPI: \_SB_.PCI0.GP23.PWSR: New power resource
[    0.739768] kernel: ACPI: \_SB_.PCI0.GP23.NCRD.WRST: New power resource
[    0.739771] kernel: ACPI: \_SB_.PCI0.GP25.PXP_: New power resource
[    0.739775] kernel: ACPI: \_SB_.PCI0.GP25.PWAN.MRST: New power resource
[    0.739779] kernel: ACPI: \_SB_.PCI0.GPPA.PWRS: New power resource
[    0.739782] kernel: ACPI: \_SB_.PCI0.GPPA.VGA_.PWRS: New power resource
[    0.739785] kernel: ACPI: \_SB_.PCI0.GPPA.HDAU.PWRS: New power resource
[    0.739788] kernel: ACPI: \_SB_.PCI0.GPPA.XHC1.PWRS: New power resource
[    0.739790] kernel: ACPI: \_SB_.PCI0.GPPA.ACP_.PWRS: New power resource
[    0.739795] kernel: ACPI: \_SB_.PCI0.GPPA.HDEF.PWRS: New power resource
[    0.739798] kernel: ACPI: \_SB_.PCI0.BUSC.XHC0.PWRS: New power resource
[    0.739801] kernel: ACPI: \_SB_.PCI0.BUSC.XHC0.RHUB.HS03.DBTR: New power resource
[    0.739805] kernel: ACPI: \_SB_.PCI0.BUSC.XHC3.PWRS: New power resource
[    0.739807] kernel: ACPI: \_SB_.PCI0.BUSC.XHC4.PWRS: New power resource
[    0.739811] kernel: ACPI: \_SB_.PCI0.BUSC.NHI0.PWRS: New power resource
[    0.739814] kernel: ACPI: \_SB_.PCI0.BUSC.NHI1.PWRS: New power resource
[    0.739819] kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.739914] kernel: acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.739952] kernel: acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER]
[    0.739987] kernel: acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability LTR]
[    0.740034] kernel: acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.740037] kernel: PCI host bridge to bus 0000:00
[    0.740079] kernel: pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.740112] kernel: pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.740143] kernel: pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.740172] kernel: pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000cffff window]
[    0.740204] kernel: pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000effff window]
[    0.740233] kernel: pci_bus 0000:00: root bus resource [mem 0x80000000-0xefffffff window]
[    0.740263] kernel: pci_bus 0000:00: root bus resource [mem 0xfed45000-0xfed814ff window]
[    0.740291] kernel: pci_bus 0000:00: root bus resource [mem 0xfed81900-0xfed81fff window]
[    0.740320] kernel: pci_bus 0000:00: root bus resource [mem 0xfedc0000-0xfedc0fff window]
[    0.740349] kernel: pci_bus 0000:00: root bus resource [mem 0xfedc6000-0xfedc6fff window]
[    0.740379] kernel: pci_bus 0000:00: root bus resource [mem 0x85e280000-0x87fffffff window]
[    0.740407] kernel: pci_bus 0000:00: root bus resource [mem 0x8a0200000-0x813fffffff window]
[    0.740436] kernel: pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.740480] kernel: pci 0000:00:00.0: [1022:1122] type 00 class 0x060000 conventional PCI endpoint
[    0.740520] kernel: pci 0000:00:00.2: [1022:1123] type 00 class 0x080600 conventional PCI endpoint
[    0.740559] kernel: pci 0000:00:01.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.740599] kernel: pci 0000:00:01.1: [1022:1125] type 01 class 0x060400 PCIe Root Port
[    0.740634] kernel: pci 0000:00:01.1: PCI bridge to [bus 01-60]
[    0.740667] kernel: pci 0000:00:01.1:   bridge window [io  0x6000-0x9fff]
[    0.740700] kernel: pci 0000:00:01.1:   bridge window [mem 0x9c000000-0xb3ffffff]
[    0.740734] kernel: pci 0000:00:01.1:   bridge window [mem 0x3000000000-0x4fffffffff 64bit pref]
[    0.740767] kernel: pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.740807] kernel: pci 0000:00:01.2: [1022:1125] type 01 class 0x060400 PCIe Root Port
[    0.740841] kernel: pci 0000:00:01.2: PCI bridge to [bus 61-c0]
[    0.740874] kernel: pci 0000:00:01.2:   bridge window [io  0x2000-0x5fff]
[    0.740909] kernel: pci 0000:00:01.2:   bridge window [mem 0x84000000-0x9bffffff]
[    0.740945] kernel: pci 0000:00:01.2:   bridge window [mem 0x1000000000-0x2fffffffff 64bit pref]
[    0.740979] kernel: pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
[    0.741017] kernel: pci 0000:00:02.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.741055] kernel: pci 0000:00:02.1: [1022:1126] type 01 class 0x060400 PCIe Root Port
[    0.741089] kernel: pci 0000:00:02.1: PCI bridge to [bus c1]
[    0.741123] kernel: pci 0000:00:02.1:   bridge window [mem 0xb4f00000-0xb4ffffff]
[    0.741156] kernel: pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    0.741194] kernel: pci 0000:00:02.3: [1022:1126] type 01 class 0x060400 PCIe Root Port
[    0.741227] kernel: pci 0000:00:02.3: PCI bridge to [bus c2]
[    0.741260] kernel: pci 0000:00:02.3:   bridge window [mem 0xb4600000-0xb48fffff]
[    0.741294] kernel: pci 0000:00:02.3: PME# supported from D0 D3hot D3cold
[    0.741330] kernel: pci 0000:00:03.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.741367] kernel: pci 0000:00:08.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.741407] kernel: pci 0000:00:08.1: [1022:1110] type 01 class 0x060400 PCIe Root Port
[    0.741441] kernel: pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.741474] kernel: pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    0.741508] kernel: pci 0000:00:08.1:   bridge window [mem 0xb4000000-0xb45fffff]
[    0.741542] kernel: pci 0000:00:08.1:   bridge window [mem 0x5000000000-0x50207fffff 64bit pref]
[    0.741577] kernel: pci 0000:00:08.1: enabling Extended Tags
[    0.741610] kernel: pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.741649] kernel: pci 0000:00:08.2: [1022:1111] type 01 class 0x060400 PCIe Root Port
[    0.741682] kernel: pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.741716] kernel: pci 0000:00:08.2:   bridge window [mem 0xb4d00000-0xb4efffff]
[    0.741749] kernel: pci 0000:00:08.2:   bridge window [mem 0x5020800000-0x50208fffff 64bit pref]
[    0.741783] kernel: pci 0000:00:08.2: enabling Extended Tags
[    0.741815] kernel: pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    0.741855] kernel: pci 0000:00:08.3: [1022:1112] type 01 class 0x060400 PCIe Root Port
[    0.741889] kernel: pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.741923] kernel: pci 0000:00:08.3:   bridge window [mem 0xb4900000-0xb4cfffff]
[    0.741955] kernel: pci 0000:00:08.3: enabling Extended Tags
[    0.741988] kernel: pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
[    0.742025] kernel: pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 conventional PCI endpoint
[    0.742064] kernel: pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 conventional PCI endpoint
[    0.742103] kernel: pci 0000:00:18.0: [1022:1248] type 00 class 0x060000 conventional PCI endpoint
[    0.742141] kernel: pci 0000:00:18.1: [1022:1249] type 00 class 0x060000 conventional PCI endpoint
[    0.742181] kernel: pci 0000:00:18.2: [1022:124a] type 00 class 0x060000 conventional PCI endpoint
[    0.742219] kernel: pci 0000:00:18.3: [1022:124b] type 00 class 0x060000 conventional PCI endpoint
[    0.742257] kernel: pci 0000:00:18.4: [1022:124c] type 00 class 0x060000 conventional PCI endpoint
[    0.742294] kernel: pci 0000:00:18.5: [1022:124d] type 00 class 0x060000 conventional PCI endpoint
[    0.742331] kernel: pci 0000:00:18.6: [1022:124e] type 00 class 0x060000 conventional PCI endpoint
[    0.742367] kernel: pci 0000:00:18.7: [1022:124f] type 00 class 0x060000 conventional PCI endpoint
[    0.742401] kernel: pci 0000:00:01.1: PCI bridge to [bus 01-60]
[    0.742434] kernel: pci 0000:00:01.2: PCI bridge to [bus 61-c0]
[    0.742475] kernel: pci 0000:c1:00.0: [15b7:5049] type 00 class 0x010802 PCIe Endpoint
[    0.742510] kernel: pci 0000:c1:00.0: BAR 0 [mem 0xb4f00000-0xb4f03fff 64bit]
[    0.742543] kernel: pci 0000:00:02.1: PCI bridge to [bus c1]
[    0.742583] kernel: pci 0000:c2:00.0: [14c3:7925] type 00 class 0x028000 PCIe Endpoint
[    0.742618] kernel: pci 0000:c2:00.0: BAR 0 [mem 0xb4600000-0xb47fffff 64bit]
[    0.742652] kernel: pci 0000:c2:00.0: BAR 2 [mem 0xb4800000-0xb4807fff 64bit]
[    0.742686] kernel: pci 0000:c2:00.0: PME# supported from D0 D3hot D3cold
[    0.742719] kernel: pci 0000:00:02.3: PCI bridge to [bus c2]
[    0.742758] kernel: pci 0000:c3:00.0: [1002:1114] type 00 class 0x038000 PCIe Legacy Endpoint
[    0.742794] kernel: pci 0000:c3:00.0: BAR 0 [mem 0x5000000000-0x501fffffff 64bit pref]
[    0.742829] kernel: pci 0000:c3:00.0: BAR 2 [mem 0xb4000000-0xb41fffff 64bit pref]
[    0.742864] kernel: pci 0000:c3:00.0: BAR 4 [io  0x1000-0x10ff]
[    0.742898] kernel: pci 0000:c3:00.0: BAR 5 [mem 0xb4500000-0xb457ffff]
[    0.742932] kernel: pci 0000:c3:00.0: enabling Extended Tags
[    0.742966] kernel: pci 0000:c3:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.743004] kernel: pci 0000:c3:00.1: [1002:1640] type 00 class 0x040300 PCIe Legacy Endpoint
[    0.743038] kernel: pci 0000:c3:00.1: BAR 0 [mem 0xb45c8000-0xb45cbfff]
[    0.743073] kernel: pci 0000:c3:00.1: enabling Extended Tags
[    0.743106] kernel: pci 0000:c3:00.1: PME# supported from D1 D2 D3hot D3cold
[    0.743144] kernel: pci 0000:c3:00.2: [1022:17e0] type 00 class 0x108000 PCIe Endpoint
[    0.743178] kernel: pci 0000:c3:00.2: BAR 2 [mem 0xb4400000-0xb44fffff]
[    0.743214] kernel: pci 0000:c3:00.2: BAR 5 [mem 0xb45ce000-0xb45cffff]
[    0.743248] kernel: pci 0000:c3:00.2: enabling Extended Tags
[    0.743286] kernel: pci 0000:c3:00.4: [1022:1128] type 00 class 0x0c0330 PCIe Endpoint
[    0.743320] kernel: pci 0000:c3:00.4: BAR 0 [mem 0xb4200000-0xb42fffff 64bit]
[    0.743355] kernel: pci 0000:c3:00.4: enabling Extended Tags
[    0.743390] kernel: pci 0000:c3:00.4: PME# supported from D0 D3hot D3cold
[    0.743435] kernel: pci 0000:c3:00.5: [1022:15e2] type 00 class 0x048000 PCIe Endpoint
[    0.743469] kernel: pci 0000:c3:00.5: BAR 0 [mem 0xb4580000-0xb45bffff]
[    0.743503] kernel: pci 0000:c3:00.5: BAR 2 [mem 0x5020000000-0x50207fffff 64bit pref]
[    0.743537] kernel: pci 0000:c3:00.5: enabling Extended Tags
[    0.743571] kernel: pci 0000:c3:00.5: PME# supported from D0 D3hot D3cold
[    0.743611] kernel: pci 0000:c3:00.6: [1022:15e3] type 00 class 0x040300 PCIe Endpoint
[    0.743646] kernel: pci 0000:c3:00.6: BAR 0 [mem 0xb45c0000-0xb45c7fff]
[    0.743681] kernel: pci 0000:c3:00.6: enabling Extended Tags
[    0.743714] kernel: pci 0000:c3:00.6: PME# supported from D0 D3hot D3cold
[    0.743751] kernel: pci 0000:c3:00.7: [1022:164a] type 00 class 0x118000 PCIe Endpoint
[    0.743787] kernel: pci 0000:c3:00.7: BAR 2 [mem 0xb4300000-0xb43fffff]
[    0.743821] kernel: pci 0000:c3:00.7: BAR 5 [mem 0xb45cc000-0xb45cdfff]
[    0.743856] kernel: pci 0000:c3:00.7: enabling Extended Tags
[    0.743890] kernel: pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.743929] kernel: pci 0000:c4:00.0: [1022:1116] type 00 class 0x130000 PCIe Endpoint
[    0.743964] kernel: pci 0000:c4:00.0: enabling Extended Tags
[    0.744002] kernel: pci 0000:c4:00.1: [1022:17f0] type 00 class 0x118000 PCIe Endpoint
[    0.744045] kernel: pci 0000:c4:00.1: BAR 0 [mem 0xb4d00000-0xb4dfffff]
[    0.744081] kernel: pci 0000:c4:00.1: BAR 1 [mem 0xb4e00000-0xb4e01fff]
[    0.744115] kernel: pci 0000:c4:00.1: BAR 2 [mem 0x5020800000-0x502087ffff 64bit pref]
[    0.744149] kernel: pci 0000:c4:00.1: BAR 4 [mem 0xb4e03000-0xb4e03fff]
[    0.744182] kernel: pci 0000:c4:00.1: BAR 5 [mem 0xb4e02000-0xb4e02fff]
[    0.744217] kernel: pci 0000:c4:00.1: enabling Extended Tags
[    0.744250] kernel: pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.744289] kernel: pci 0000:c5:00.0: [1022:1118] type 00 class 0x0c0330 PCIe Endpoint
[    0.744323] kernel: pci 0000:c5:00.0: BAR 0 [mem 0xb4900000-0xb49fffff 64bit]
[    0.744358] kernel: pci 0000:c5:00.0: enabling Extended Tags
[    0.744392] kernel: pci 0000:c5:00.0: PME# supported from D0 D3hot D3cold
[    0.744430] kernel: pci 0000:c5:00.3: [1022:111c] type 00 class 0x0c0330 PCIe Endpoint
[    0.744465] kernel: pci 0000:c5:00.3: BAR 0 [mem 0xb4a00000-0xb4afffff 64bit]
[    0.744500] kernel: pci 0000:c5:00.3: enabling Extended Tags
[    0.744534] kernel: pci 0000:c5:00.3: PME# supported from D0 D3hot D3cold
[    0.744574] kernel: pci 0000:c5:00.4: [1022:111e] type 00 class 0x0c0330 PCIe Endpoint
[    0.744608] kernel: pci 0000:c5:00.4: BAR 0 [mem 0xb4b00000-0xb4bfffff 64bit]
[    0.744643] kernel: pci 0000:c5:00.4: enabling Extended Tags
[    0.744677] kernel: pci 0000:c5:00.4: PME# supported from D0 D3hot D3cold
[    0.744715] kernel: pci 0000:c5:00.5: [1022:1120] type 00 class 0x0c0340 PCIe Endpoint
[    0.744750] kernel: pci 0000:c5:00.5: BAR 0 [mem 0xb4c00000-0xb4c7ffff 64bit]
[    0.744784] kernel: pci 0000:c5:00.5: Max Payload Size set to 128 (was 256, max 256)
[    0.744817] kernel: pci 0000:c5:00.5: enabling Extended Tags
[    0.744851] kernel: pci 0000:c5:00.5: PME# supported from D0 D3hot D3cold
[    0.744891] kernel: pci 0000:c5:00.6: [1022:1121] type 00 class 0x0c0340 PCIe Endpoint
[    0.744925] kernel: pci 0000:c5:00.6: BAR 0 [mem 0xb4c80000-0xb4cfffff 64bit]
[    0.744959] kernel: pci 0000:c5:00.6: Max Payload Size set to 128 (was 256, max 256)
[    0.744994] kernel: pci 0000:c5:00.6: enabling Extended Tags
[    0.745028] kernel: pci 0000:c5:00.6: PME# supported from D0 D3hot D3cold
[    0.745064] kernel: pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.745068] kernel: Low-power S0 idle used by default for system suspend
[    0.745071] kernel: ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.745075] kernel: ACPI: PCI: Interrupt link LNKA disabled
[    0.745078] kernel: ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    0.745081] kernel: ACPI: PCI: Interrupt link LNKB disabled
[    0.745083] kernel: ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.745086] kernel: ACPI: PCI: Interrupt link LNKC disabled
[    0.745089] kernel: ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.745092] kernel: ACPI: PCI: Interrupt link LNKD disabled
[    0.745094] kernel: ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.745097] kernel: ACPI: PCI: Interrupt link LNKE disabled
[    0.745101] kernel: ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.745104] kernel: ACPI: PCI: Interrupt link LNKF disabled
[    0.745107] kernel: ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.745110] kernel: ACPI: PCI: Interrupt link LNKG disabled
[    0.745112] kernel: ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.745116] kernel: ACPI: PCI: Interrupt link LNKH disabled
[    0.745118] kernel: ACPI: EC: interrupt unblocked
[    0.745121] kernel: ACPI: EC: event unblocked
[    0.745125] kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.745127] kernel: ACPI: EC: GPE=0x3
[    0.745131] kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization complete
[    0.745134] kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions and events
[    0.745137] kernel: iommu: Default domain type: Translated
[    0.745139] kernel: iommu: DMA domain TLB invalidation policy: lazy mode
[    0.745143] kernel: pps_core: LinuxPPS API ver. 1 registered
[    0.745145] kernel: pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.745148] kernel: PTP clock support registered
[    0.745150] kernel: EDAC MC: Ver: 3.0.0
[    0.745153] kernel: efivars: Registered efivars operations
[    0.745156] kernel: NetLabel: Initializing
[    0.745158] kernel: NetLabel:  domain hash size = 128
[    0.745161] kernel: NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.745164] kernel: NetLabel:  unlabeled traffic allowed by default
[    0.745166] kernel: PCI: Using ACPI for IRQ routing
[    0.745169] kernel: PCI: pci_cache_line_size set to 64 bytes
[    0.745171] kernel: e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.745174] kernel: e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
[    0.745177] kernel: e820: reserve RAM buffer [mem 0x38253000-0x3bffffff]
[    0.745179] kernel: e820: reserve RAM buffer [mem 0x44ad4000-0x47ffffff]
[    0.745182] kernel: e820: reserve RAM buffer [mem 0x52bcf000-0x53ffffff]
[    0.745184] kernel: e820: reserve RAM buffer [mem 0x52bdc000-0x53ffffff]
[    0.745187] kernel: e820: reserve RAM buffer [mem 0x5cfed000-0x5fffffff]
[    0.745190] kernel: e820: reserve RAM buffer [mem 0x85e280000-0x85fffffff]
[    0.745192] kernel: vgaarb: loaded
[    0.745195] kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.745198] kernel: hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.745200] kernel: clocksource: Switched to clocksource tsc-early
[    0.745203] kernel: VFS: Disk quotas dquot_6.6.0
[    0.745206] kernel: VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.745208] kernel: AppArmor: AppArmor Filesystem Enabled
[    0.745211] kernel: pnp: PnP ACPI init
[    0.745250] kernel: system 00:01: [io  0x0400-0x04cf] has been reserved
[    0.745281] kernel: system 00:01: [io  0x04d0-0x04d1] has been reserved
[    0.745311] kernel: system 00:01: [io  0x04d6] has been reserved
[    0.745340] kernel: system 00:01: [io  0x0680-0x06ff] has been reserved
[    0.745369] kernel: system 00:01: [io  0x077a] has been reserved
[    0.745399] kernel: system 00:01: [io  0x0c00-0x0c01] has been reserved
[    0.745427] kernel: system 00:01: [io  0x0c14] has been reserved
[    0.745456] kernel: system 00:01: [io  0x0c50-0x0c52] has been reserved
[    0.745485] kernel: system 00:01: [io  0x0c6c] has been reserved
[    0.745515] kernel: system 00:01: [io  0x0c6f] has been reserved
[    0.745545] kernel: system 00:01: [io  0x0cd0-0x0cdb] has been reserved
[    0.745575] kernel: system 00:01: [io  0x0840-0x0847] has been reserved
[    0.745607] kernel: system 00:02: [mem 0x000e0000-0x000fffff] could not be reserved
[    0.745640] kernel: system 00:04: [io  0x0600-0x067f] has been reserved
[    0.745672] kernel: system 00:04: [mem 0xfedf1000-0xfedf1fff] has been reserved
[    0.745707] kernel: system 00:05: [mem 0xfec00000-0xfec00fff] could not be reserved
[    0.745736] kernel: system 00:05: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.745766] kernel: system 00:05: [mem 0xfec20000-0xfec20fff] has been reserved
[    0.745769] kernel: pnp: PnP ACPI: found 6 devices
[    0.745772] kernel: clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.745775] kernel: NET: Registered PF_INET protocol family
[    0.745778] kernel: IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.745781] kernel: tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.745785] kernel: Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.745788] kernel: TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.745791] kernel: TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.745794] kernel: TCP: Hash tables configured (established 262144 bind 65536)
[    0.745797] kernel: MPTCP token hash table entries: 32768 (order: 8, 786432 bytes, linear)
[    0.745799] kernel: UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.745802] kernel: UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.745805] kernel: NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.745808] kernel: NET: Registered PF_XDP protocol family
[    0.745842] kernel: pci 0000:00:01.1: PCI bridge to [bus 01-60]
[    0.745875] kernel: pci 0000:00:01.1:   bridge window [io  0x6000-0x9fff]
[    0.745909] kernel: pci 0000:00:01.1:   bridge window [mem 0x9c000000-0xb3ffffff]
[    0.745944] kernel: pci 0000:00:01.1:   bridge window [mem 0x3000000000-0x4fffffffff 64bit pref]
[    0.745980] kernel: pci 0000:00:01.2: PCI bridge to [bus 61-c0]
[    0.746014] kernel: pci 0000:00:01.2:   bridge window [io  0x2000-0x5fff]
[    0.746048] kernel: pci 0000:00:01.2:   bridge window [mem 0x84000000-0x9bffffff]
[    0.746080] kernel: pci 0000:00:01.2:   bridge window [mem 0x1000000000-0x2fffffffff 64bit pref]
[    0.746114] kernel: pci 0000:00:02.1: PCI bridge to [bus c1]
[    0.746147] kernel: pci 0000:00:02.1:   bridge window [mem 0xb4f00000-0xb4ffffff]
[    0.746180] kernel: pci 0000:00:02.3: PCI bridge to [bus c2]
[    0.746213] kernel: pci 0000:00:02.3:   bridge window [mem 0xb4600000-0xb48fffff]
[    0.746246] kernel: pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.746280] kernel: pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    0.746313] kernel: pci 0000:00:08.1:   bridge window [mem 0xb4000000-0xb45fffff]
[    0.746345] kernel: pci 0000:00:08.1:   bridge window [mem 0x5000000000-0x50207fffff 64bit pref]
[    0.746378] kernel: pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.746412] kernel: pci 0000:00:08.2:   bridge window [mem 0xb4d00000-0xb4efffff]
[    0.746444] kernel: pci 0000:00:08.2:   bridge window [mem 0x5020800000-0x50208fffff 64bit pref]
[    0.746478] kernel: pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.746510] kernel: pci 0000:00:08.3:   bridge window [mem 0xb4900000-0xb4cfffff]
[    0.746544] kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.746574] kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.746603] kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.746633] kernel: pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000cffff window]
[    0.746662] kernel: pci_bus 0000:00: resource 8 [mem 0x000d0000-0x000effff window]
[    0.746691] kernel: pci_bus 0000:00: resource 9 [mem 0x80000000-0xefffffff window]
[    0.746720] kernel: pci_bus 0000:00: resource 10 [mem 0xfed45000-0xfed814ff window]
[    0.746749] kernel: pci_bus 0000:00: resource 11 [mem 0xfed81900-0xfed81fff window]
[    0.746778] kernel: pci_bus 0000:00: resource 12 [mem 0xfedc0000-0xfedc0fff window]
[    0.746806] kernel: pci_bus 0000:00: resource 13 [mem 0xfedc6000-0xfedc6fff window]
[    0.746836] kernel: pci_bus 0000:00: resource 14 [mem 0x85e280000-0x87fffffff window]
[    0.746865] kernel: pci_bus 0000:00: resource 15 [mem 0x8a0200000-0x813fffffff window]
[    0.746902] kernel: pci_bus 0000:01: resource 0 [io  0x6000-0x9fff]
[    0.746932] kernel: pci_bus 0000:01: resource 1 [mem 0x9c000000-0xb3ffffff]
[    0.746963] kernel: pci_bus 0000:01: resource 2 [mem 0x3000000000-0x4fffffffff 64bit pref]
[    0.746998] kernel: pci_bus 0000:61: resource 0 [io  0x2000-0x5fff]
[    0.747029] kernel: pci_bus 0000:61: resource 1 [mem 0x84000000-0x9bffffff]
[    0.747059] kernel: pci_bus 0000:61: resource 2 [mem 0x1000000000-0x2fffffffff 64bit pref]
[    0.747095] kernel: pci_bus 0000:c1: resource 1 [mem 0xb4f00000-0xb4ffffff]
[    0.747132] kernel: pci_bus 0000:c2: resource 1 [mem 0xb4600000-0xb48fffff]
[    0.747170] kernel: pci_bus 0000:c3: resource 0 [io  0x1000-0x1fff]
[    0.747200] kernel: pci_bus 0000:c3: resource 1 [mem 0xb4000000-0xb45fffff]
[    0.747235] kernel: pci_bus 0000:c3: resource 2 [mem 0x5000000000-0x50207fffff 64bit pref]
[    0.747269] kernel: pci_bus 0000:c4: resource 1 [mem 0xb4d00000-0xb4efffff]
[    0.747300] kernel: pci_bus 0000:c4: resource 2 [mem 0x5020800000-0x50208fffff 64bit pref]
[    0.747336] kernel: pci_bus 0000:c5: resource 1 [mem 0xb4900000-0xb4cfffff]
[    0.747372] kernel: pci 0000:c3:00.1: D0 power state depends on 0000:c3:00.0
[    0.747409] kernel: pci 0000:c3:00.4: enabling device (0000 -> 0002)
[    0.747445] kernel: pci 0000:c5:00.0: enabling device (0000 -> 0002)
[    0.747479] kernel: pci 0000:c5:00.3: enabling device (0000 -> 0002)
[    0.747513] kernel: pci 0000:c5:00.4: enabling device (0000 -> 0002)
[    0.747517] kernel: PCI: CLS 0 bytes, default 64
[    0.747551] kernel: pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
[    0.747590] kernel: platform MSFT0201:00: Adding to iommu group 0
[    0.747595] kernel: Trying to unpack rootfs image as initramfs...
[    0.747630] kernel: pci 0000:00:01.0: Adding to iommu group 1
[    0.747664] kernel: pci 0000:00:01.1: Adding to iommu group 2
[    0.747698] kernel: pci 0000:00:01.2: Adding to iommu group 3
[    0.747733] kernel: pci 0000:00:02.0: Adding to iommu group 4
[    0.747766] kernel: pci 0000:00:02.1: Adding to iommu group 5
[    0.747799] kernel: pci 0000:00:02.3: Adding to iommu group 6
[    0.747834] kernel: pci 0000:00:03.0: Adding to iommu group 7
[    0.747869] kernel: pci 0000:00:08.0: Adding to iommu group 8
[    0.747903] kernel: pci 0000:00:08.1: Adding to iommu group 9
[    0.747936] kernel: pci 0000:00:08.2: Adding to iommu group 10
[    0.747970] kernel: pci 0000:00:08.3: Adding to iommu group 11
[    0.748005] kernel: pci 0000:00:14.0: Adding to iommu group 12
[    0.748044] kernel: pci 0000:00:14.3: Adding to iommu group 12
[    0.748080] kernel: pci 0000:00:18.0: Adding to iommu group 13
[    0.748115] kernel: pci 0000:00:18.1: Adding to iommu group 13
[    0.748150] kernel: pci 0000:00:18.2: Adding to iommu group 13
[    0.748186] kernel: pci 0000:00:18.3: Adding to iommu group 13
[    0.748220] kernel: pci 0000:00:18.4: Adding to iommu group 13
[    0.748256] kernel: pci 0000:00:18.5: Adding to iommu group 13
[    0.748290] kernel: pci 0000:00:18.6: Adding to iommu group 13
[    0.748327] kernel: pci 0000:00:18.7: Adding to iommu group 13
[    0.748370] kernel: pci 0000:c1:00.0: Adding to iommu group 14
[    0.748414] kernel: pci 0000:c2:00.0: Adding to iommu group 15
[    0.748456] kernel: pci 0000:c3:00.0: Adding to iommu group 16
[    0.748491] kernel: pci 0000:c3:00.1: Adding to iommu group 17
[    0.748527] kernel: pci 0000:c3:00.2: Adding to iommu group 18
[    0.748561] kernel: pci 0000:c3:00.4: Adding to iommu group 19
[    0.748596] kernel: pci 0000:c3:00.5: Adding to iommu group 20
[    0.748632] kernel: pci 0000:c3:00.6: Adding to iommu group 21
[    0.748667] kernel: pci 0000:c3:00.7: Adding to iommu group 22
[    0.748703] kernel: pci 0000:c4:00.0: Adding to iommu group 23
[    0.748740] kernel: pci 0000:c4:00.1: Adding to iommu group 24
[    0.748774] kernel: pci 0000:c5:00.0: Adding to iommu group 25
[    0.748807] kernel: pci 0000:c5:00.3: Adding to iommu group 26
[    0.748841] kernel: pci 0000:c5:00.4: Adding to iommu group 27
[    0.748883] kernel: pci 0000:c5:00.5: Adding to iommu group 28
[    0.748927] kernel: pci 0000:c5:00.6: Adding to iommu group 29
[    0.748932] kernel: AMD-Vi: Extended features (0x246577efa2254afa, 0x10): PPR NX GT [5] IA GA PC GA_vAPIC
[    0.748935] kernel: AMD-Vi: Interrupt remapping enabled
[    0.748938] kernel: AMD-Vi: Virtual APIC enabled
[    0.748941] kernel: PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.748944] kernel: software IO TLB: mapped [mem 0x0000000074000000-0x0000000078000000] (64MB)
[    0.748947] kernel: LVT offset 0 assigned for vector 0x400
[    0.748950] kernel: perf: AMD IBS detected (0x00081bff)
[    0.748954] kernel: amd_uncore: 16 amd_df counters detected
[    0.748958] kernel: amd_uncore: 6 amd_l3 counters detected
[    0.748960] kernel: amd_uncore: 4 amd_umc_0 counters detected
[    0.748963] kernel: amd_uncore: 4 amd_umc_1 counters detected
[    0.748966] kernel: amd_uncore: 4 amd_umc_2 counters detected
[    0.748969] kernel: amd_uncore: 4 amd_umc_3 counters detected
[    0.748972] kernel: perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
[    0.748975] kernel: Initialise system trusted keyrings
[    0.748978] kernel: Key type blacklist registered
[    0.748981] kernel: workingset: timestamp_bits=36 max_order=23 bucket_order=0
[    0.748983] kernel: fuse: init (API version 7.45)
[    0.748986] kernel: integrity: Platform Keyring initialized
[    0.748990] kernel: integrity: Machine keyring initialized
[    0.748993] kernel: Key type asymmetric registered
[    0.748996] kernel: Asymmetric key parser 'x509' registered
[    0.748998] kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.749001] kernel: io scheduler mq-deadline registered
[    0.749005] kernel: ledtrig-cpu: registered to indicate activity on CPUs
[    0.749044] kernel: pcieport 0000:00:01.1: PME: Signaling with IRQ 34
[    0.749082] kernel: pcieport 0000:00:01.1: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.749122] kernel: pcieport 0000:00:01.2: PME: Signaling with IRQ 35
[    0.749158] kernel: pcieport 0000:00:01.2: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.749197] kernel: pcieport 0000:00:02.1: PME: Signaling with IRQ 36
[    0.749236] kernel: pcieport 0000:00:02.3: PME: Signaling with IRQ 37
[    0.749269] kernel: pcieport 0000:00:08.1: PME: Signaling with IRQ 38
[    0.749302] kernel: pcieport 0000:00:08.2: PME: Signaling with IRQ 39
[    0.749335] kernel: pcieport 0000:00:08.3: PME: Signaling with IRQ 40
[    0.749338] kernel: Monitor-Mwait will be used to enter C-1 state
[    0.749342] kernel: Estimated ratio of average max frequency by base frequency (times 1024): 1815
[    0.749386] kernel: thermal LNXTHERM:00: registered as thermal_zone0
[    0.749391] kernel: ACPI: thermal: Thermal Zone [CPUZ] (29 C)
[    0.749430] kernel: thermal LNXTHERM:01: registered as thermal_zone1
[    0.749434] kernel: ACPI: thermal: Thermal Zone [GFXZ] (25 C)
[    0.749471] kernel: thermal LNXTHERM:02: registered as thermal_zone2
[    0.749475] kernel: ACPI: thermal: Thermal Zone [EXTZ] (22 C)
[    0.749514] kernel: thermal LNXTHERM:03: registered as thermal_zone3
[    0.749518] kernel: ACPI: thermal: Thermal Zone [LOCZ] (27 C)
[    0.749555] kernel: thermal LNXTHERM:04: registered as thermal_zone4
[    0.749558] kernel: ACPI: thermal: Thermal Zone [BATZ] (20 C)
[    0.749595] kernel: thermal LNXTHERM:05: registered as thermal_zone5
[    0.749599] kernel: ACPI: thermal: Thermal Zone [CHGZ] (27 C)
[    0.749635] kernel: thermal LNXTHERM:06: registered as thermal_zone6
[    0.749639] kernel: ACPI: thermal: Thermal Zone [BAGZ] (30 C)
[    0.749676] kernel: thermal LNXTHERM:07: registered as thermal_zone7
[    0.749680] kernel: ACPI: thermal: Thermal Zone [MSHZ] (30 C)
[    0.749717] kernel: thermal LNXTHERM:08: registered as thermal_zone8
[    0.749721] kernel: ACPI: thermal: Thermal Zone [PGTZ] (30 C)
[    0.749724] kernel: Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.749726] kernel: Linux agpgart interface v0.103
[    0.749761] kernel: tpm_tis NTC0702:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    0.749766] kernel: i8042: PNP: PS/2 Controller [PNP0303:KBC0] at 0x60,0x64 irq 1
[    0.749769] kernel: i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    0.749773] kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.749776] kernel: mousedev: PS/2 mouse device common for all mice
[    0.749811] kernel: rtc_cmos 00:00: RTC can wake from S4
[    0.749843] kernel: rtc_cmos 00:00: registered as rtc0
[    0.749873] kernel: rtc_cmos 00:00: setting system clock to 2025-12-29T10:04:43 UTC (1767002683)
[    0.749903] kernel: rtc_cmos 00:00: alarms up to one month, y3k, 114 bytes nvram
[    0.749906] kernel: efifb: probing for efifb
[    0.749909] kernel: efifb: framebuffer at 0x5000000000, using 16000k, total 16000k
[    0.749913] kernel: efifb: mode is 2560x1600x32, linelength=10240, pages=1
[    0.749915] kernel: efifb: scrolling: redraw
[    0.749918] kernel: efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.749921] kernel: Console: switching to colour frame buffer device 160x50
[    0.749924] kernel: fb0: EFI VGA frame buffer device
[    0.749926] kernel: NET: Registered PF_INET6 protocol family
[    0.749929] kernel: Segment Routing with IPv6
[    0.749933] kernel: RPL Segment Routing with IPv6
[    0.749936] kernel: In-situ OAM (IOAM) with IPv6
[    0.749939] kernel: mip6: Mobile IPv6
[    0.749942] kernel: NET: Registered PF_PACKET protocol family
[    0.749945] kernel: mpls_gso: MPLS GSO support
[    0.749948] kernel: x86/amd: Previous system reset reason [0x00080800]: software wrote 0x6 to reset control register 0xCF9
[    0.749950] kernel: microcode: Current revision: 0x0b600037
[    0.749953] kernel: microcode: Updated early from: 0x0b600032
[    0.749956] kernel: resctrl: L3 allocation detected
[    0.749959] kernel: resctrl: MB allocation detected
[    0.749962] kernel: resctrl: SMBA allocation detected
[    0.749965] kernel: resctrl: L3 monitoring detected
[    0.749967] kernel: IPI shorthand broadcast: enabled
[    0.749970] kernel: sched_clock: Marking stable (444055568, 290114)->(467168380, -22822698)
[    0.749973] kernel: registered taskstats version 1
[    0.749976] kernel: Loading compiled-in X.509 certificates
[    0.749979] kernel: input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    0.749982] kernel: Freeing initrd memory: 51452K
[    0.749985] kernel: Loaded X.509 cert 'Build time autogenerated kernel key: bc01c88f87f7c2e2c1e29bbb029099fb94b31874'
[    0.749988] kernel: Demotion targets for Node 0: null
[    0.749991] kernel: Key type .fscrypt registered
[    0.749994] kernel: Key type fscrypt-provisioning registered
[    0.749996] kernel: Key type encrypted registered
[    0.749999] kernel: AppArmor: AppArmor sha256 policy hashing enabled
[    0.750002] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.750005] kernel: integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot DB 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
[    0.750008] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.750011] kernel: integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot DB 2024: 9031be8bd10636d7ed703b1ec5807354b05cd8ee'
[    0.750014] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.750016] kernel: integrity: Loaded X.509 cert 'Microsoft Corporation: Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    0.750019] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.750022] kernel: integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.750025] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.750027] kernel: integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
[    0.750030] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.750032] kernel: integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    0.750035] kernel: integrity: Loading X.509 certificate: UEFI:MokListRT (MOKvar table)
[    0.750038] kernel: integrity: Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
[    0.750042] kernel: ima: Allocated hash algorithm: sha256
[    0.750044] kernel: audit: type=1807 audit(1767002683.636:2): action=measure func=KEXEC_KERNEL_CHECK res=1
[    0.750048] kernel: evm: Initialising EVM extended attributes:
[    0.750051] kernel: evm: security.selinux
[    0.750053] kernel: evm: security.SMACK64 (disabled)
[    0.750056] kernel: audit: type=1807 audit(1767002683.636:3): action=measure func=MODULE_CHECK res=1
[    0.750059] kernel: evm: security.SMACK64EXEC (disabled)
[    0.750062] kernel: evm: security.SMACK64TRANSMUTE (disabled)
[    0.750064] kernel: evm: security.SMACK64MMAP (disabled)
[    0.750068] kernel: evm: security.apparmor
[    0.750070] kernel: evm: security.ima
[    0.750073] kernel: evm: security.capability
[    0.750076] kernel: evm: HMAC attrs: 0x1
[    0.750078] kernel: RAS: Correctable Errors collector initialized.
[    0.750081] kernel: Lockdown: swapper/0: hibernation is restricted; see man kernel_lockdown.7
[    0.750084] kernel: clk: Disabling unused clocks
[    0.750087] kernel: PM: genpd: Disabling unused power domains
[    0.750090] kernel: Freeing unused decrypted memory: 2028K
[    0.750093] kernel: Freeing unused kernel image (initmem) memory: 4448K
[    0.750096] kernel: Write protecting the kernel read-only data: 32768k
[    0.750099] kernel: Freeing unused kernel image (text/rodata gap) memory: 768K
[    0.750102] kernel: Freeing unused kernel image (rodata/data gap) memory: 888K
[    0.750104] kernel: x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.750107] kernel: Run /init as init process
[    0.750110] kernel:   with arguments:
[    0.750113] kernel:     /init
[    0.750116] kernel:     splash
[    0.750119] kernel:   with environment:
[    0.750121] kernel:     HOME=/
[    0.750124] kernel:     TERM=linux
[    0.750149] kernel: Lockdown: systemd: /dev/mem,kmem,port is restricted; see man kernel_lockdown.7
[    0.750192] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    0.750252] kernel: io scheduler bfq registered
[    0.756013] kernel: i2c_dev: i2c /dev entries driver
[    0.760007] kernel: lp: driver loaded but no devices found
[    0.764022] kernel: ppdev: user-space parallel port driver
[    0.776009] kernel: device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    0.776077] kernel: device-mapper: uevent: version 1.0.3
[    0.776090] kernel: device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised: dm-devel@lists.linux.dev
[    0.904022] kernel: wmi_bus wmi_bus-PNP0C14:00: [Firmware Info]: DF4E63B6-3BBC-4858-9737-C74F82F821F3 has zero instances
[    0.904154] kernel: wmi_bus wmi_bus-PNP0C14:00: [Firmware Info]: 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    0.908009] kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    0.908034] kernel: sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
[    0.908117] kernel: sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
[    0.908157] kernel: ACPI: battery: Slot [BAT0] (battery present)
[    0.920008] kernel: hid: raw HID events driver (C) Jiri Kosina
[    0.924041] kernel: ACPI: bus type drm_connector registered
[    0.928093] kernel: ccp 0000:c3:00.2: tee enabled
[    0.928198] kernel: ccp 0000:c3:00.2: psp: TSME enabled
[    0.928246] kernel: ccp 0000:c3:00.2: psp enabled
[    0.928290] kernel: ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  post: no)
[    0.928294] kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:17/LNXVIDEO:00/input/input1
[    0.936004] kernel: ACPI: bus type thunderbolt registered
[    0.936015] kernel: pcie_mp2_amd 0000:c3:00.7: enabling device (0000 -> 0002)
[    0.944030] kernel: ACPI: bus type USB registered
[    0.944049] kernel: usbcore: registered new interface driver usbfs
[    0.944054] kernel: usbcore: registered new interface driver hub
[    0.944059] kernel: usbcore: registered new device driver usb
[    0.948031] kernel: Key type psk registered
[    1.116032] kernel: xhci_hcd 0000:c3:00.4: xHCI Host Controller
[    1.116293] kernel: xhci_hcd 0000:c3:00.4: new USB bus registered, assigned bus number 1
[    1.116349] kernel: xhci_hcd 0000:c3:00.4: hcc params 0x0118ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.120006] kernel: xhci_hcd 0000:c3:00.4: xHCI Host Controller
[    1.120121] kernel: xhci_hcd 0000:c3:00.4: new USB bus registered, assigned bus number 2
[    1.120174] kernel: xhci_hcd 0000:c3:00.4: Host supports USB 3.1 Enhanced SuperSpeed
[    1.120226] kernel: usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.120274] kernel: nvme 0000:c1:00.0: platform quirk: setting simple suspend
[    1.120324] kernel: usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.120358] kernel: usb usb1: Product: xHCI Host Controller
[    1.120393] kernel: usb usb1: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.120436] kernel: usb usb1: SerialNumber: 0000:c3:00.4
[    1.120468] kernel: nvme nvme0: pci function 0000:c1:00.0
[    1.120505] kernel: hub 1-0:1.0: USB hub found
[    1.120554] kernel: hub 1-0:1.0: 1 port detected
[    1.120595] kernel: usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.120639] kernel: usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.120673] kernel: usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.120705] kernel: usb usb2: Product: xHCI Host Controller
[    1.120737] kernel: usb usb2: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.120768] kernel: usb usb2: SerialNumber: 0000:c3:00.4
[    1.120799] kernel: hub 2-0:1.0: USB hub found
[    1.120841] kernel: hub 2-0:1.0: 1 port detected
[    1.120880] kernel: xhci_hcd 0000:c5:00.0: xHCI Host Controller
[    1.120925] kernel: xhci_hcd 0000:c5:00.0: new USB bus registered, assigned bus number 3
[    1.120966] kernel: xhci_hcd 0000:c5:00.0: hcc params 0x0128ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.121008] kernel: xhci_hcd 0000:c5:00.0: xHCI Host Controller
[    1.121047] kernel: xhci_hcd 0000:c5:00.0: new USB bus registered, assigned bus number 4
[    1.121085] kernel: xhci_hcd 0000:c5:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    1.121125] kernel: usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.121161] kernel: usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.121192] kernel: usb usb3: Product: xHCI Host Controller
[    1.121224] kernel: usb usb3: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.121256] kernel: usb usb3: SerialNumber: 0000:c5:00.0
[    1.121287] kernel: hub 3-0:1.0: USB hub found
[    1.121328] kernel: hub 3-0:1.0: 5 ports detected
[    1.121369] kernel: usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.121442] kernel: usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.121493] kernel: usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.121547] kernel: usb usb4: Product: xHCI Host Controller
[    1.121590] kernel: usb usb4: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.121636] kernel: usb usb4: SerialNumber: 0000:c5:00.0
[    1.121671] kernel: hub 4-0:1.0: USB hub found
[    1.121712] kernel: hub 4-0:1.0: 2 ports detected
[    1.121756] kernel: xhci_hcd 0000:c5:00.3: xHCI Host Controller
[    1.121801] kernel: xhci_hcd 0000:c5:00.3: new USB bus registered, assigned bus number 5
[    1.121841] kernel: xhci_hcd 0000:c5:00.3: hcc params 0x0118ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.121881] kernel: xhci_hcd 0000:c5:00.3: xHCI Host Controller
[    1.121919] kernel: xhci_hcd 0000:c5:00.3: new USB bus registered, assigned bus number 6
[    1.121959] kernel: xhci_hcd 0000:c5:00.3: Host supports USB 3.1 Enhanced SuperSpeed
[    1.121998] kernel: usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.122032] kernel: usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.122063] kernel: usb usb5: Product: xHCI Host Controller
[    1.122094] kernel: usb usb5: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.122125] kernel: usb usb5: SerialNumber: 0000:c5:00.3
[    1.122157] kernel: hub 5-0:1.0: USB hub found
[    1.122199] kernel: hub 5-0:1.0: 1 port detected
[    1.124004] kernel: usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.124078] kernel: usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.124114] kernel: usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.124150] kernel: usb usb6: Product: xHCI Host Controller
[    1.124182] kernel: usb usb6: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.124215] kernel: usb usb6: SerialNumber: 0000:c5:00.3
[    1.124247] kernel: hub 6-0:1.0: USB hub found
[    1.124289] kernel: hub 6-0:1.0: 1 port detected
[    1.124328] kernel: xhci_hcd 0000:c5:00.4: xHCI Host Controller
[    1.124379] kernel: xhci_hcd 0000:c5:00.4: new USB bus registered, assigned bus number 7
[    1.124421] kernel: xhci_hcd 0000:c5:00.4: hcc params 0x0118ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.124464] kernel: xhci_hcd 0000:c5:00.4: xHCI Host Controller
[    1.124503] kernel: xhci_hcd 0000:c5:00.4: new USB bus registered, assigned bus number 8
[    1.124541] kernel: xhci_hcd 0000:c5:00.4: Host supports USB 3.1 Enhanced SuperSpeed
[    1.124579] kernel: usb usb7: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.124615] kernel: usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.124646] kernel: usb usb7: Product: xHCI Host Controller
[    1.124677] kernel: usb usb7: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.124711] kernel: usb usb7: SerialNumber: 0000:c5:00.4
[    1.124742] kernel: hub 7-0:1.0: USB hub found
[    1.124783] kernel: hub 7-0:1.0: 1 port detected
[    1.124821] kernel: usb usb8: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.124867] kernel: usb usb8: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.124900] kernel: usb usb8: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.124931] kernel: usb usb8: Product: xHCI Host Controller
[    1.124963] kernel: usb usb8: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.125001] kernel: usb usb8: SerialNumber: 0000:c5:00.4
[    1.125048] kernel: hub 8-0:1.0: USB hub found
[    1.125095] kernel: hub 8-0:1.0: 1 port detected
[    1.132015] kernel: input: SYNA312B:00 06CB:CFE2 Mouse as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA312B:00/0018:06CB:CFE2.0001/input/input2
[    1.132025] kernel: input: SYNA312B:00 06CB:CFE2 Touchpad as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA312B:00/0018:06CB:CFE2.0001/input/input3
[    1.132030] kernel: hid-generic 0018:06CB:CFE2.0001: input,hidraw0: I2C HID v1.00 Mouse [SYNA312B:00 06CB:CFE2] on i2c-SYNA312B:00
[    1.152009] kernel: nvme nvme0: 16/0/0 default/read/poll queues
[    1.152087] kernel:  nvme0n1: p1 p2 p3
[    1.180140] kernel: amdxdna 0000:c4:00.1: enabling device (0000 -> 0002)
[    1.244020] kernel: input: SYNA312B:00 06CB:CFE2 Mouse as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA312B:00/0018:06CB:CFE2.0001/input/input5
[    1.244035] kernel: input: SYNA312B:00 06CB:CFE2 Touchpad as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA312B:00/0018:06CB:CFE2.0001/input/input6
[    1.244041] kernel: hid-multitouch 0018:06CB:CFE2.0001: input,hidraw0: I2C HID v1.00 Mouse [SYNA312B:00 06CB:CFE2] on i2c-SYNA312B:00
[    1.280005] kernel: [drm] Initialized amdxdna_accel_driver 0.1.0 for 0000:c4:00.1 on minor 0
[    1.376034] kernel: usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    1.376195] kernel: usb 3-3: new high-speed USB device number 2 using xhci_hcd
[    1.408016] kernel: tsc: Refined TSC clocksource calibration: 1996.250 MHz
[    1.408078] kernel: clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x398caf77d7a, max_idle_ns: 881590459467 ns
[    1.408092] kernel: clocksource: Switched to clocksource tsc
[    1.512034] kernel: usb 3-3: New USB device found, idVendor=0e8d, idProduct=8c37, bcdDevice= 1.00
[    1.512342] kernel: usb 3-3: New USB device strings: Mfr=5, Product=6, SerialNumber=7
[    1.512469] kernel: usb 3-3: Product: Wireless_Device
[    1.512570] kernel: usb 3-3: Manufacturer: MediaTek Inc.
[    1.512668] kernel: usb 3-3: SerialNumber: 000000000
[    1.520005] kernel: usb 1-1: New USB device found, idVendor=30c9, idProduct=00e6, bcdDevice= 0.10
[    1.520083] kernel: usb 1-1: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    1.520124] kernel: usb 1-1: Product: HP 5MP Camera
[    1.520160] kernel: usb 1-1: Manufacturer: DTSUD0A8PLL4S7
[    1.520195] kernel: usb 1-1: SerialNumber: 200901010001
[    1.640062] kernel: usb 3-4: new full-speed USB device number 3 using xhci_hcd
[    1.804023] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[    1.804237] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    1.804353] kernel: usb 3-4: Product: ELAN:ARM-M4
[    1.804454] kernel: usb 3-4: Manufacturer: ELAN
[    1.932058] kernel: usb 3-5: new high-speed USB device number 4 using xhci_hcd
[    2.068031] kernel: usb 3-5: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=60.60
[    2.068300] kernel: usb 3-5: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    2.068450] kernel: usb 3-5: Product: USB2.0 Hub
[    2.112011] kernel: hub 3-5:1.0: USB hub found
[    2.116025] kernel: hub 3-5:1.0: 3 ports detected
[    2.164007] kernel: hid-generic 0003:30C9:00E6.0002: hiddev0,hidraw1: USB HID v1.11 Device [DTSUD0A8PLL4S7 HP 5MP Camera] on usb-0000:c3:00.4-1/input4
[    2.164168] kernel: usbcore: registered new interface driver usbhid
[    2.164177] kernel: usbhid: USB HID core driver
[    2.164185] kernel: [drm] amdgpu kernel modesetting enabled.
[    2.164191] kernel: amdgpu: Virtual CRAT table created for CPU
[    2.164199] kernel: amdgpu: Topology: Add CPU node
[    2.164206] kernel: amdgpu 0000:c3:00.0: amdgpu: initializing kernel modesetting (IP DISCOVERY 0x1002:0x1114 0x103C:0x8E17 0xD2).
[    2.164318] kernel: amdgpu 0000:c3:00.0: amdgpu: register mmio base: 0xB4500000
[    2.164409] kernel: amdgpu 0000:c3:00.0: amdgpu: register mmio size: 524288
[    2.164562] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 0 <common_v1_0_0> (soc21_common)
[    2.164703] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 1 <gmc_v11_0_0> (gmc_v11_0)
[    2.164846] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 2 <ih_v6_0_0> (ih_v6_1)
[    2.164988] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 3 <psp_v13_0_0> (psp)
[    2.165128] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 4 <smu_v14_0_0> (smu)
[    2.165268] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 5 <dce_v1_0_0> (dm)
[    2.165411] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 6 <gfx_v11_0_0> (gfx_v11_0)
[    2.165536] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 7 <sdma_v6_0_0> (sdma_v6_0)
[    2.165616] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 8 <vcn_v4_0_5> (vcn_v4_0_5)
[    2.165695] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 9 <jpeg_v4_0_5> (jpeg_v4_0_5)
[    2.165773] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 10 <mes_v11_0_0> (mes_v11_0)
[    2.165852] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 11 <vpe_v6_1_0> (vpe_v6_1)
[    2.165930] kernel: amdgpu 0000:c3:00.0: amdgpu: Fetched VBIOS from VFCT
[    2.166028] kernel: amdgpu: ATOM BIOS: 113-STRIXEMU-001
[    2.166035] kernel: amdgpu 0000:c3:00.0: amdgpu: VPE: collaborate mode false
[    2.166116] kernel: Console: switching to colour dummy device 80x25
[    2.166124] kernel: amdgpu 0000:c3:00.0: amdgpu: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
[    2.166204] kernel: amdgpu 0000:c3:00.0: amdgpu: vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
[    2.166284] kernel: amdgpu 0000:c3:00.0: amdgpu: VRAM: 512M 0x0000008000000000 - 0x000000801FFFFFFF (512M used)
[    2.166362] kernel: amdgpu 0000:c3:00.0: amdgpu: GART: 512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
[    2.166445] kernel: [drm] Detected VRAM RAM=512M, BAR=512M
[    2.166451] kernel: [drm] RAM width 128bits DDR5
[    2.166457] kernel: amdgpu 0000:c3:00.0: amdgpu: amdgpu: 512M of VRAM memory ready
[    2.166535] kernel: amdgpu 0000:c3:00.0: amdgpu: amdgpu: 15683M of GTT memory ready.
[    2.166615] kernel: [drm] GART: num cpu pages 131072, num gpu pages 131072
[    2.166623] kernel: [drm] PCIE GART of 512M enabled (table at 0x000000801FB00000).
[    2.166629] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Loading DMUB firmware via PSP: version=0x09003400
[    2.166719] kernel: amdgpu 0000:c3:00.0: amdgpu: [VCN instance 0] Found VCN firmware Version ENC: 1.24 DEC: 9 VEP: 0 Revision: 22
[    2.176022] kernel: hid-sensor-hub 0003:30C9:00E6.0002: hiddev0,hidraw1: USB HID v1.11 Device [DTSUD0A8PLL4S7 HP 5MP Camera] on usb-0000:c3:00.4-1/input4
[    2.192060] kernel: amdgpu 0000:c3:00.0: amdgpu: reserve 0x1100000 from 0x801c000000 for PSP TMR
[    2.304006] kernel: amdgpu 0000:c3:00.0: amdgpu: RAS: optional ras ta ucode is not available
[    2.308018] kernel: amdgpu 0000:c3:00.0: amdgpu: RAP: optional rap ta ucode is not available
[    2.308300] kernel: amdgpu 0000:c3:00.0: amdgpu: SECUREDISPLAY: optional securedisplay ta ucode is not available
[    2.336032] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU is initialized successfully!
[    2.336194] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Display Core v3.2.351 initialized on DCN 3.5
[    2.336319] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DP-HDMI FRL PCON supported
[    2.340039] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB hardware initialized: version=0x09003400
[    2.432047] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Using ACPI provided EDID for eDP-1
[    2.440021] kernel: kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    2.440179] kernel: kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[    2.440268] kernel: amdgpu: Virtual CRAT table created for GPU
[    2.444047] kernel: amdgpu: Topology: Add dGPU node [0x1114:0x1002]
[    2.444070] kernel: kfd kfd: amdgpu: added device 1002:1114
[    2.444185] kernel: amdgpu 0000:c3:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 4, active_cu_number 8
[    2.444328] kernel: amdgpu 0000:c3:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[    2.444458] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[    2.444578] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[    2.444695] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
[    2.444813] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
[    2.444928] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
[    2.445049] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
[    2.445164] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
[    2.445277] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
[    2.445389] kernel: amdgpu 0000:c3:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
[    2.445505] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_0 uses VM inv eng 0 on hub 8
[    2.445582] kernel: amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_0 uses VM inv eng 1 on hub 8
[    2.445619] kernel: amdgpu 0000:c3:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
[    2.445659] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vpe uses VM inv eng 4 on hub 8
[    2.445696] kernel: amdgpu 0000:c3:00.0: amdgpu: Runtime PM not available
[    2.445735] kernel: amdgpu 0000:c3:00.0: [drm] Registered 4 planes with drm panic
[    2.445774] kernel: [drm] Initialized amdgpu 3.64.0 for 0000:c3:00.0 on minor 0
[    2.445778] kernel: fbcon: amdgpudrmfb (fb0) is primary device
[    2.445781] kernel: Console: switching to colour frame buffer device 160x50
[    2.445786] kernel: amdgpu 0000:c3:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[    2.604044] kernel: [drm] pre_validate_dsc:1666 MST_DSC dsc precompute is not needed
[    6.316034] kernel: hid-sensor-hub 0020:1022:0001.0003: hidraw2: SENSOR HUB HID v0.00 Device [hid-amdsfh 1022:0001] on pcie_mp2_amd
[   11.444031] kernel: raid6: avx512x4 gen() 61062 MB/s
[   11.512055] kernel: raid6: avx512x2 gen() 76655 MB/s
[   11.580050] kernel: raid6: avx512x1 gen() 67791 MB/s
[   11.648053] kernel: raid6: avx2x4   gen() 79570 MB/s
[   11.716032] kernel: raid6: avx2x2   gen() 80991 MB/s
[   11.784040] kernel: raid6: avx2x1   gen() 75023 MB/s
[   11.784062] kernel: raid6: using algorithm avx2x2 gen() 80991 MB/s
[   11.852113] kernel: raid6: .... xor() 50149 MB/s, rmw enabled
[   11.852286] kernel: raid6: using avx512x2 recovery algorithm
[   11.864024] kernel: xor: automatically using best checksumming function   avx       
[   11.952020] kernel: Btrfs loaded, zoned=yes, fsverity=yes
[   12.160029] kernel: BTRFS: device fsid 158e40e5-7a47-422d-9742-681072369fa3 devid 1 transid 4009 /dev/mapper/ssd-root (254:2) scanned by mount (1309)
[   12.160115] kernel: BTRFS info (device dm-2): first mount of filesystem 158e40e5-7a47-422d-9742-681072369fa3
[   12.172009] kernel: BTRFS info (device dm-2): using crc32c (crc32c-lib) checksum algorithm
[   12.180037] kernel: BTRFS info (device dm-2): enabling ssd optimizations
[   12.180080] kernel: BTRFS info (device dm-2): turning on async discard
[   12.180092] kernel: BTRFS info (device dm-2): enabling free space tree
[   13.199966] kernel: Lockdown: systemd: /dev/mem,kmem,port is restricted; see man kernel_lockdown.7
[   13.200461] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[   13.200468] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[   13.200671] kernel: Adding 32796668k swap on /dev/mapper/ssd-swap_1.  Priority:-2 extents:1 across:32796668k SS
[   13.200702] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug File System.
[   13.200709] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[   13.200838] kernel: BTRFS info (device dm-2 state M): turning on sync discard
[   13.200860] kernel: pstore: Using crash dump compression: deflate
[   13.204107] kernel: pstore: Registered efi_pstore as persistent store backend
[   13.336042] kernel: ACPI: AC: AC Adapter [AC] (on-line)
[   13.336150] kernel: input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
[   13.336185] kernel: ACPI: button: Power Button [PWRB]
[   13.336255] kernel: input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input9
[   13.336270] kernel: ACPI: button: Sleep Button [SLPB]
[   13.336277] kernel: input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input10
[   13.336289] kernel: ACPI: button: Lid Switch [LID]
[   13.336298] kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input11
[   13.336308] kernel: ACPI: button: Power Button [PWRF]
[   13.396020] kernel: Serial bus multi instantiate pseudo device driver CSC3554:00: Instantiated 3 I2C devices.
[   13.420016] kernel: input: PC Speaker as /devices/platform/pcspkr/input/input12
[   13.424017] kernel: mc: Linux media interface: v0.10
[   13.428054] kernel: RAPL PMU: API unit is 2^-32 Joules, 2 fixed counters, 163840 ms ovfl timer
[   13.428084] kernel: RAPL PMU: hw unit of domain package 2^-16 Joules
[   13.428100] kernel: RAPL PMU: hw unit of domain core 2^-16 Joules
[   13.444033] kernel: piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[   13.444267] kernel: piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
[   13.444399] kernel: piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
[   13.444521] kernel: i2c i2c-22: Successfully instantiated SPD at 0x50
[   13.444631] kernel: i2c i2c-22: Successfully instantiated SPD at 0x51
[   13.504026] kernel: videodev: Linux video capture interface: v2.00
[   13.508037] kernel: hp_wmi: query 0x4 returned error 0x5
[   13.516014] kernel: input: HP WMI hotkeys as /devices/virtual/input/input13
[   13.552024] kernel: Bluetooth: Core ver 2.22
[   13.552132] kernel: NET: Registered PF_BLUETOOTH protocol family
[   13.552142] kernel: Bluetooth: HCI device and connection manager initialized
[   13.552158] kernel: Bluetooth: HCI socket layer initialized
[   13.552169] kernel: Bluetooth: L2CAP socket layer initialized
[   13.552177] kernel: Bluetooth: SCO socket layer initialized
[   13.552186] kernel: cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   13.552202] kernel: Loaded X.509 cert 'benh@debian.org: 577e021cb980e0e820821ba7b54b4961b8b4fadf'
[   13.552211] kernel: Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
[   13.552230] kernel: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   13.552241] kernel: Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[   13.568015] kernel: input: PMF-TA output events as /devices/platform/AMDI0107:00/input/input14
[   13.568101] kernel: amd-pmf AMDI0107:00: registered PMF device successfully
[   13.584017] kernel: kvm_amd: TSC scaling supported
[   13.584068] kernel: kvm_amd: Nested Virtualization enabled
[   13.584080] kernel: kvm_amd: Nested Paging enabled
[   13.584091] kernel: kvm_amd: LBR virtualization supported
[   13.584105] kernel: kvm_amd: AVIC enabled
[   13.584120] kernel: kvm_amd: x2AVIC enabled
[   13.584128] kernel: kvm_amd: Virtual VMLOAD VMSAVE supported
[   13.584141] kernel: kvm_amd: Virtual GIF supported
[   13.584145] kernel: kvm_amd: Virtual NMI enabled
[   13.612035] kernel: MCE: In-kernel MCE decoding enabled.
[   13.636015] kernel: uvcvideo 1-1:1.0: Found UVC 1.50 device HP 5MP Camera (30c9:00e6)
[   13.636331] kernel: snd_acp_pci 0000:c3:00.5: enabling device (0000 -> 0002)
[   13.636487] kernel: platform acp_asoc_acp70.0: warning: No matching ASoC machine driver found
[   13.640009] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Cirrus Logic CS35L54 Rev B0 OTP4 fw:3.4.4 (patched=0)
[   13.648008] kernel: uvcvideo 1-1:1.2: Found UVC 1.50 device HP 5MP Camera (30c9:00e6)
[   13.652012] kernel: usbcore: registered new interface driver uvcvideo
[   13.652054] kernel: usbcore: registered new interface driver btusb
[   13.656014] kernel: Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20251015213201
[   13.660006] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP system name: '103C8E17', amp name: 'AMP1'
[   13.660236] kernel: snd_hda_intel 0000:c3:00.1: enabling device (0000 -> 0002)
[   13.660447] kernel: snd_hda_intel 0000:c3:00.1: Handle vga_switcheroo audio client
[   13.660627] kernel: snd_hda_intel 0000:c3:00.6: enabling device (0000 -> 0002)
[   13.664009] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Reset GPIO busy, assume shared reset
[   13.672101] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Cirrus Logic CS35L54 Rev B0 OTP4 fw:3.4.4 (patched=0)
[   13.692023] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP system name: '103C8E17', amp name: 'AMP2'
[   13.716035] kernel: snd_hda_intel 0000:c3:00.1: bound 0000:c3:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[   13.716430] kernel: input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input15
[   13.716444] kernel: input: HD-Audio Generic HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input16
[   13.716457] kernel: input: HD-Audio Generic HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input17
[   13.716469] kernel: input: HD-Audio Generic HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input18
[   13.732013] kernel: mt7925e 0000:c2:00.0: enabling device (0000 -> 0002)
[   13.736051] kernel: mt7925e 0000:c2:00.0: ASIC revision: 79250000
[   13.744006] kernel: amd_atl: AMD Address Translation Library initialized
[   13.744036] kernel: intel_rapl_common: Found RAPL domain package
[   13.744048] kernel: intel_rapl_common: Found RAPL domain core
[   13.748005] kernel: snd_hda_codec_alc269 hdaudioC1D0: ALC245: picked fixup  for PCI SSID 103c:8e17
[   13.748127] kernel: snd_hda_codec_alc269 hdaudioC1D0: Found 2 CSC3554 on i2c (-%s:00-cs35l54-hda.%d)
[   13.748181] kernel: snd_hda_codec_alc269 hdaudioC1D0: bound i2c-CSC3554:00-cs35l54-hda.0 (ops cs35l56_hda_comp_ops [snd_hda_scodec_cs35l56])
[   13.748237] kernel: snd_hda_codec_alc269 hdaudioC1D0: bound i2c-CSC3554:00-cs35l54-hda.1 (ops cs35l56_hda_comp_ops [snd_hda_scodec_cs35l56])
[   13.748288] kernel: snd_hda_codec_alc269 hdaudioC1D0: Component binding already created (SSID: 103c8e17)
[   13.752017] kernel: snd_hda_codec_alc269 hdaudioC1D0: autoconfig for ALC245: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[   13.752241] kernel: snd_hda_codec_alc269 hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   13.752391] kernel: snd_hda_codec_alc269 hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[   13.752534] kernel: snd_hda_codec_alc269 hdaudioC1D0:    mono: mono_out=0x0
[   13.752669] kernel: snd_hda_codec_alc269 hdaudioC1D0:    inputs:
[   13.752799] kernel: snd_hda_codec_alc269 hdaudioC1D0:      Internal Mic=0x12
[   13.752889] kernel: snd_hda_codec_alc269 hdaudioC1D0:      Mic=0x19
[   13.752933] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[   13.752990] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[   13.753036] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[   13.753085] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[   13.753137] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[   13.753185] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[   13.753232] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: format 3 timestamp 0x66ad5cf1
[   13.753279] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: Fri 02 Aug 2024 17:25:52 Central Daylight Time
[   13.753324] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: format 3 timestamp 0x66ad5cf1
[   13.753372] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: Fri 02 Aug 2024 17:25:52 Central Daylight Time
[   13.816023] kernel: mt7925e 0000:c2:00.0: HW/SW Version: 0x8a108a10, Build Time: 20251015212927a
[   13.860020] kernel: input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:c3:00.6/sound/card1/input19
[   13.860113] kernel: input: HD-Audio Generic Headphone as /devices/pci0000:00/0000:00:08.1/0000:c3:00.6/sound/card1/input20
[   14.020117] kernel: Bluetooth: hci0: Device setup in 356617 usecs
[   14.020204] kernel: Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
[   14.156034] kernel: mt7925e 0000:c2:00.0: WM Firmware Version: ____000000, Build Time: 20251015213023
[   14.224028] kernel: BTRFS: device fsid 65fd0daf-5008-472e-b82b-21497144d89a devid 1 transid 4910 /dev/mapper/ssd-home (254:3) scanned by mount (1746)
[   14.228030] kernel: BTRFS info (device dm-3): first mount of filesystem 65fd0daf-5008-472e-b82b-21497144d89a
[   14.228084] kernel: BTRFS info (device dm-3): using crc32c (crc32c-lib) checksum algorithm
[   14.248010] kernel: BTRFS info (device dm-3): enabling ssd optimizations
[   14.248039] kernel: BTRFS info (device dm-3): turning on sync discard
[   14.248059] kernel: BTRFS info (device dm-3): enabling free space tree
[   14.248070] kernel: BTRFS info (device dm-3): use zstd compression, level 1
[   14.480105] kernel: SGI XFS with ACLs, security attributes, realtime, scrub, repair, quota, no debug enabled
[   14.492034] kernel: XFS (nvme0n1p2): Mounting V5 Filesystem 044cfc8e-c077-4745-8f60-0d733b2221af
[   14.496031] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: Firmware: 1a00d6 vendor: 0x2 v19.11.11, 41 algorithms
[   14.496612] kernel: XFS (nvme0n1p2): Ending clean mount
[   14.496645] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: Firmware: 1a00d6 vendor: 0x2 v19.11.11, 41 algorithms
[   14.520017] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.bin: v19.11.11
[   14.520353] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: misc: C:\tuning_bin\init\103C8E15_241108_V01_A0-init.bin
[   14.548005] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.bin: v19.11.11
[   14.548098] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: misc: C:\tuning_bin\init\103C8E15_241108_V01_A1-init.bin
[   14.624016] kernel: audit: type=1400 audit(1767002697.682:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="crun" pid=1814 comm="apparmor_parser"
[   14.624063] kernel: audit: type=1400 audit(1767002697.682:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="1password" pid=1799 comm="apparmor_parser"
[   14.624074] kernel: audit: type=1400 audit(1767002697.682:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name=4D6F6E676F444220436F6D70617373 pid=1801 comm="apparmor_parser"
[   14.624081] kernel: audit: type=1400 audit(1767002697.682:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="buildah" pid=1806 comm="apparmor_parser"
[   14.624089] kernel: audit: type=1400 audit(1767002697.682:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="balena-etcher" pid=1804 comm="apparmor_parser"
[   14.624098] kernel: audit: type=1400 audit(1767002697.682:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="cam" pid=1808 comm="apparmor_parser"
[   14.624104] kernel: audit: type=1400 audit(1767002697.682:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="Discord" pid=1800 comm="apparmor_parser"
[   14.624114] kernel: audit: type=1400 audit(1767002697.682:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="chromium" pid=1812 comm="apparmor_parser"
[   14.624119] kernel: audit: type=1400 audit(1767002697.682:12): apparmor="STATUS" operation="profile_load" profile="unconfined" name="vscode" pid=1813 comm="apparmor_parser"
[   14.624123] kernel: audit: type=1400 audit(1767002697.682:13): apparmor="STATUS" operation="profile_load" profile="unconfined" name="brave" pid=1805 comm="apparmor_parser"
[   14.780132] kernel: mt7925e 0000:c2:00.0 wlp194s0: renamed from wlan0
[   14.916026] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Calibration applied
[   14.916428] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Calibration applied
[   14.916609] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Tuning PID: 0x0, SID: 0x0, TID: 0x0
[   14.916757] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Tuning PID: 0x0, SID: 0x0, TID: 0x0
[   15.352135] kernel: nvme nvme0: using unchecked data buffer
[   15.368004] kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   15.368046] kernel: Bluetooth: BNEP filters: protocol multicast
[   15.368055] kernel: Bluetooth: BNEP socket layer initialized
[   15.368062] kernel: Bluetooth: MGMT ver 1.23
[   15.376083] kernel: NET: Registered PF_ALG protocol family
[   15.408016] kernel: block nvme0n1: No UUID available providing old NGUID
[   15.436045] kernel: Bluetooth: RFCOMM TTY layer initialized
[   15.436089] kernel: Bluetooth: RFCOMM socket layer initialized
[   15.436102] kernel: Bluetooth: RFCOMM ver 1.11
[   15.452008] kernel: NET: Registered PF_QIPCRTR protocol family
[   18.120066] kernel: wlp194s0: authenticate with 20:b8:2b:5b:01:de (local address=f0:68:e3:58:84:a6)
[   18.472063] kernel: wlp194s0: send auth to 20:b8:2b:5b:01:de (try 1/3)
[   18.480029] kernel: wlp194s0: authenticated
[   18.480081] kernel: wlp194s0: associate with 20:b8:2b:5b:01:de (try 1/3)
[   18.500009] kernel: wlp194s0: RX AssocResp from 20:b8:2b:5b:01:de (capab=0x1011 status=0 aid=16)
[   18.536060] kernel: wlp194s0: associated
[   18.768217] kernel: wlp194s0: Limiting TX power to 30 (30 - 0) dBm as advertised by 20:b8:2b:5b:01:de
[   27.056018] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[   27.092018] kernel: rfkill: input handler disabled
[   30.292019] kernel: usb 3-4: reset full-speed USB device number 3 using xhci_hcd
[   32.944014] kernel: rfkill: input handler enabled
[   33.580099] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[   33.668024] kernel: rfkill: input handler disabled
[   34.688019] kernel: SCSI subsystem initialized
[  333.076018] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 1164.176038] kernel: kauditd_printk_skb: 124 callbacks suppressed
[ 1164.176148] kernel: audit: type=1400 audit(1767003846.485:138): apparmor="DENIED" operation="open" class="file" profile="/usr/sbin/cupsd" name="/etc/paperspecs" pid=7811 comm="cupsd" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
[ 1164.176179] kernel: audit: type=1400 audit(1767003846.485:139): apparmor="DENIED" operation="capable" class="cap" profile="/usr/sbin/cupsd" pid=7811 comm="cupsd" capability=12  capname="net_admin"
[ 2215.996048] kernel: usb 3-4: reset full-speed USB device number 3 using xhci_hcd
[ 4293.720020] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 4296.916047] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 4296.920041] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 4296.972032] kernel: wlp194s0: deauthenticating from 20:b8:2b:5b:01:de by local choice (Reason: 3=DEAUTH_LEAVING)
[ 4297.875124] kernel: PM: suspend entry (s2idle)
[ 4297.940014] kernel: Filesystems sync: 0.074 seconds
[ 4315.228718] kernel: Freezing user space processes
[ 4315.229355] kernel: Freezing user space processes completed (elapsed 0.002 seconds)
[ 4315.229373] kernel: OOM killer disabled.
[ 4315.229393] kernel: Freezing remaining freezable tasks
[ 4315.229411] kernel: Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[ 4315.229429] kernel: printk: Suspending console(s) (use no_console_suspend to debug)
[ 4315.229443] kernel: queueing ieee80211 work while going to suspend
[ 4315.229471] kernel: amdgpu 0000:c3:00.0: amdgpu: Register(0) [regVPEC_QUEUE_RESET_REQ] failed to reach value 0x00000000 != 0x00000001n
[ 4315.229711] kernel: amdgpu 0000:c3:00.0: amdgpu: VPE queue reset failed
[ 4315.229836] kernel: ACPI: EC: interrupt blocked
[ 4315.229850] kernel: Reading current time from RTC took around 166 ms
[ 4315.229862] kernel: Reading current time from RTC took around 173 ms
[ 4315.229875] kernel: Reading current time from RTC took around 181 ms
[ 4315.229891] kernel: Reading current time from RTC took around 189 ms
[ 4315.229910] kernel: Reading current time from RTC took around 197 ms
[ 4315.229923] kernel: Reading current time from RTC took around 204 ms
[ 4315.229938] kernel: Reading current time from RTC took around 212 ms
[ 4315.229954] kernel: amd-pmf AMDI0107:00: SMU cmd failed. err: 0xff
[ 4315.230073] kernel: ccp 0000:c3:00.2: tee: command 0x5 timed out, disabling PSP
[ 4315.230194] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4315.230288] kernel: Reading current time from RTC took around 124 ms
[ 4315.230304] kernel: ACPI: EC: interrupt unblocked
[ 4315.230320] kernel: [drm] PCIE GART of 512M enabled (table at 0x000000801FB00000).
[ 4315.230334] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU is resuming...
[ 4315.230442] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU is resumed successfully!
[ 4315.230545] kernel: nvme nvme0: 16/0/0 default/read/poll queues
[ 4315.230876] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[ 4315.231029] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[ 4315.231117] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[ 4315.231204] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[ 4315.231315] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[ 4315.231412] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[ 4315.231502] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: format 3 timestamp 0x66ad5cf1
[ 4315.231596] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: Fri 02 Aug 2024 17:25:52 Central Daylight Time
[ 4315.231691] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: format 3 timestamp 0x66ad5cf1
[ 4315.231776] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: Fri 02 Aug 2024 17:25:52 Central Daylight Time
[ 4315.231865] kernel: amdgpu 0000:c3:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[ 4315.232075] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[ 4315.232324] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[ 4315.232456] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
[ 4315.232550] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
[ 4315.232635] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
[ 4315.232716] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
[ 4315.232795] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
[ 4315.232870] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
[ 4315.233228] kernel: amdgpu 0000:c3:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
[ 4315.233329] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_0 uses VM inv eng 0 on hub 8
[ 4315.233411] kernel: amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_0 uses VM inv eng 1 on hub 8
[ 4315.234643] kernel: amdgpu 0000:c3:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
[ 4315.235832] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vpe uses VM inv eng 4 on hub 8
[ 4315.235909] kernel: OOM killer enabled.
[ 4315.235923] kernel: Restarting tasks: Starting
[ 4315.235937] kernel: Restarting tasks: Done
[ 4315.235946] kernel: efivarfs: resyncing variable state
[ 4315.235955] kernel: efivarfs: finished resyncing variable state
[ 4315.235971] kernel: random: crng reseeded on system resumption
[ 4315.235989] kernel: PM: suspend exit
[ 4315.724053] kernel: usb 3-4: reset full-speed USB device number 3 using xhci_hcd
[ 4315.828102] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: Firmware: 1a00d6 vendor: 0x2 v19.11.11, 41 algorithms
[ 4315.828484] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: Firmware: 1a00d6 vendor: 0x2 v19.11.11, 41 algorithms
[ 4315.856040] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.bin: v19.11.11
[ 4315.856342] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: misc: C:\tuning_bin\init\103C8E15_241108_V01_A1-init.bin
[ 4315.880025] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.bin: v19.11.11
[ 4315.880236] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: misc: C:\tuning_bin\init\103C8E15_241108_V01_A0-init.bin
[ 4316.260028] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Calibration applied
[ 4316.260639] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Calibration applied
[ 4316.260842] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Tuning PID: 0x0, SID: 0x0, TID: 0x0
[ 4316.261013] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Tuning PID: 0x0, SID: 0x0, TID: 0x0
[ 4317.084092] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4317.964103] kernel: wlp194s0: authenticate with 20:b8:2b:5b:01:de (local address=f0:68:e3:58:84:a6)
[ 4317.980031] kernel: wlp194s0: send auth to 20:b8:2b:5b:01:de (try 1/3)
[ 4317.984036] kernel: wlp194s0: authenticated
[ 4317.984092] kernel: wlp194s0: associate with 20:b8:2b:5b:01:de (try 1/3)
[ 4318.004247] kernel: wlp194s0: RX AssocResp from 20:b8:2b:5b:01:de (capab=0x1011 status=0 aid=23)
[ 4318.044073] kernel: wlp194s0: associated
[ 4318.096481] kernel: wlp194s0: Limiting TX power to 30 (30 - 0) dBm as advertised by 20:b8:2b:5b:01:de
[ 4318.108100] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4319.136069] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4320.156048] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4321.180107] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4322.204103] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4323.228144] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4324.252054] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4325.280244] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4326.300101] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4327.324102] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4328.352055] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4329.372085] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4330.396072] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4331.420468] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4332.444037] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4333.468567] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4334.492083] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4335.516570] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4336.540050] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4337.564635] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
[ 4338.588682] kernel: amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0

--gFPYcNs9edbTnklI--
