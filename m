Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3C51422A5
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716392773; cv=none; b=caet+RrYnjhkebogMmRS6RV1mON7pwLUjgeZzeKcJDqrCxT54EAn/1x7nb+hn7gQp3l5xnICZWNTd4voCht6S3PxU29aOvz8UgRIAEtDZUG6gPbFzqNFYkrW+XulgU6Y+nUkVt736gyox5Cshv8Sq9nwY0GI1OjfJn2p9EF/bvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716392773; c=relaxed/simple;
	bh=UDkJEk9xmYYDrcw1srIua4AmdevYgqFk0k6JDVwyS+k=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=lrHBwMiGxbTOAe0TWgqi8IAaaNBTAke0VWqXFghWtAjWc+HXsZTSr/rRVDkDhy64SgNvp66gWPTzW6AXXb0dxUqCVgceV7Hv521Pa3Z08ep0kZRUbQk3aDxP9eQlU60HwO4VOKLhrbs0UyAqxc98xtNj50UmIlm7MuFsU5v8Qs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.3] (ip5f5af1e5.dynamic.kabel-deutschland.de [95.90.241.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B03A161E5FE05;
	Wed, 22 May 2024 17:44:45 +0200 (CEST)
Message-ID: <38fc334a-7c8c-4e43-bf63-6ac9aa882a2f@molgen.mpg.de>
Date: Wed, 22 May 2024 17:44:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Dell XPS 13 9360: `slp_s0_residency_usec` stays 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


On the Intel Kaby Lake laptop Dell XPS 13 9360, 
`/sys/kernel/debug/pmc_core/slp_s0_residency_usec` does stay 0 even 
after a s2idle suspend/resume cycle.

     $ sudo dmesg
     […]
     [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 
06/02/2022
     […]
     [10176.745124] PM: suspend entry (s2idle)
     [10176.757275] Filesystems sync: 0.012 seconds
     [10176.769118] Freezing user space processes
     [10176.771693] Freezing user space processes completed (elapsed 
0.002 seconds)
     [10176.771710] OOM killer disabled.
     [10176.771714] Freezing remaining freezable tasks
     [10176.773487] Freezing remaining freezable tasks completed 
(elapsed 0.001 seconds)
     [10176.773504] printk: Suspending console(s) (use 
no_console_suspend to debug)
     [10176.948337] ACPI: EC: interrupt blocked
     [10176.951016] intel_pch_thermal 0000:00:14.2: CPU-PCH is cool [48C]
     [10181.281827] ACPI: EC: interrupt unblocked
     $ sudo more /sys/kernel/debug/pmc_core/slp_s0_residency_usec
     0

Is that expected?


Kind regards,

Paul


PS: Some system details:

```
$ LANG= lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen 
Core Processor Host Bridge/DRAM Registers [8086:5904] (rev 02)
00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 
620 [8086:5916] (rev 02)
00:04.0 Signal processing controller [1180]: Intel Corporation Xeon 
E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem 
[8086:1903] (rev 02)
00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 
3.0 xHCI Controller [8086:9d2f] (rev 21)
00:14.2 Signal processing controller [1180]: Intel Corporation Sunrise 
Point-LP Thermal subsystem [8086:9d31] (rev 21)
00:15.0 Signal processing controller [1180]: Intel Corporation Sunrise 
Point-LP Serial IO I2C Controller #0 [8086:9d60] (rev 21)
00:15.1 Signal processing controller [1180]: Intel Corporation Sunrise 
Point-LP Serial IO I2C Controller #1 [8086:9d61] (rev 21)
00:16.0 Communication controller [0780]: Intel Corporation Sunrise 
Point-LP CSME HECI #1 [8086:9d3a] (rev 21)
00:1c.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #1 [8086:9d10] (rev f1)
00:1c.4 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #5 [8086:9d14] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #9 [8086:9d18] (rev f1)
00:1f.0 ISA bridge [0601]: Intel Corporation Sunrise Point-LP LPC 
Controller [8086:9d58] (rev 21)
00:1f.2 Memory controller [0580]: Intel Corporation Sunrise Point-LP PMC 
[8086:9d21] (rev 21)
00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD Audio 
[8086:9d71] (rev 21)
00:1f.4 SMBus [0c05]: Intel Corporation Sunrise Point-LP SMBus 
[8086:9d23] (rev 21)
01:00.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
02:00.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
02:01.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
02:02.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
39:00.0 USB controller [0c03]: Intel Corporation DSL6340 USB 3.1 
Controller [Alpine Ridge] [8086:15b5]
3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac 
Wireless Network Adapter [168c:003e] (rev 32)
3b:00.0 Non-Volatile memory controller [0108]: SK hynix PC300 NVMe Solid 
State Drive 512GB [1c5c:1284]
$ LANG= lscpu
Architecture:             x86_64
   CPU op-mode(s):         32-bit, 64-bit
   Address sizes:          39 bits physical, 48 bits virtual
   Byte Order:             Little Endian
CPU(s):                   4
   On-line CPU(s) list:    0-3
Vendor ID:                GenuineIntel
   Model name:             Intel(R) Core(TM) i7-7500U CPU @ 2.70GHz
     CPU family:           6
     Model:                142
     Thread(s) per core:   2
     Core(s) per socket:   2
     Socket(s):            1
     Stepping:             9
     CPU(s) scaling MHz:   14%
     CPU max MHz:          3500.0000
     CPU min MHz:          400.0000
     BogoMIPS:             5799.77
     Flags:                fpu vme de pse tsc msr pae mce cx8 apic sep 
mtrr pge mca cmov
                            pat pse36 clflush dts acpi mmx fxsr sse sse2 
ss ht tm pbe sy
                           scall nx pdpe1gb rdtscp lm constant_tsc art 
arch_perfmon pebs
                            bts rep_good nopl xtopology nonstop_tsc 
cpuid aperfmperf pni
                            pclmulqdq dtes64 monitor ds_cpl vmx est tm2 
ssse3 sdbg fma c
                           x16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe 
popcnt tsc_dead
                           line_timer aes xsave avx f16c rdrand lahf_lm 
abm 3dnowprefetc
                           h cpuid_fault epb ssbd ibrs ibpb stibp 
tpr_shadow flexpriorit
                           y ept vpid ept_ad fsgsbase tsc_adjust sgx 
bmi1 avx2 smep bmi2
                            erms invpcid mpx rdseed adx smap clflushopt 
intel_pt xsaveop
                           t xsavec xgetbv1 xsaves dtherm ida arat pln 
pts hwp hwp_notif
                           y hwp_act_window hwp_epp vnmi md_clear 
flush_l1d arch_capabil
                           ities
Virtualization features:
   Virtualization:         VT-x
Caches (sum of all):
   L1d:                    64 KiB (2 instances)
   L1i:                    64 KiB (2 instances)
   L2:                     512 KiB (2 instances)
   L3:                     4 MiB (1 instance)
NUMA:
   NUMA node(s):           1
   NUMA node0 CPU(s):      0-3
Vulnerabilities:
   Gather data sampling:   Vulnerable
   Itlb multihit:          KVM: Mitigation: VMX disabled
   L1tf:                   Mitigation; PTE Inversion; VMX vulnerable
   Mds:                    Vulnerable; SMT vulnerable
   Meltdown:               Vulnerable
   Mmio stale data:        Vulnerable
   Reg file data sampling: Not affected
   Retbleed:               Vulnerable
   Spec rstack overflow:   Not affected
   Spec store bypass:      Vulnerable
   Spectre v1:             Vulnerable: __user pointer sanitization and 
usercopy barriers
                            only; no swapgs barriers
   Spectre v2:             Vulnerable; IBPB: disabled; STIBP: disabled; 
PBRSB-eIBRS: Not
                            affected; BHI: Not affected
   Srbds:                  Vulnerable
   Tsx async abort:        Not affected
```
