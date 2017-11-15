From: valdis.kletnieks@vt.edu
Subject: next-20171114 - kernel BUG in dell_set_arguments
Date: Wed, 15 Nov 2017 15:13:27 -0500
Message-ID: <86379.1510776807@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Darren Hart (VMware)" <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Seen at boot.  Dell Latitude E6530, A20 bios.

Only obvious commit in 'git log' is:

commit 549b4930f057658dc50d8010e66219233119a4d8
Author: Mario Limonciello <mario.limonciello@dell.com>
Date:   Wed Nov 1 14:25:31 2017 -0500

    platform/x86: dell-smbios: Introduce dispatcher for SMM calls

Looks like it managed to get to dell_set_arguments() before kzalloc for
static struct calling_interface_buffer *buffer;

[   26.074812] input: Dell WMI hotkeys as /devices/platform/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input16
[   26.229439] BUG: unable to handle kernel NULL pointer dereference at           (null)
[   26.231880] IP: dell_set_arguments+0x1c/0x80 [dell_laptop]
[   26.234348] PGD 0 P4D 0 
[   26.236658] Oops: 0002 [#1] PREEMPT SMP
[   26.238866] Modules linked in: dell_laptop(+) crct10dif_pclmul dell_smbios_smm crc32_pclmul cordic brcmutil crc32c_intel ghash_clmulni_intel dell_smbios_wmi dell_wmi dell_smbios cryptd dell_smm_hwmon dell_wmi_descriptor bcma mei_wdt dell_smo8800 dell_rbtn sch_fq tcp_bbr
[   26.243453] CPU: 1 PID: 794 Comm: systemd-udevd Not tainted 4.14.0-next-20171114-dirty #541
[   26.245685] Hardware name: Dell Inc. Latitude E6530/07Y85M, BIOS A20 05/08/2017
[   26.247955] task: ffff976914040cc0 task.stack: ffffb027c023c000
[   26.250047] RIP: 0010:dell_set_arguments+0x1c/0x80 [dell_laptop]
[   26.252190] RSP: 0018:ffffb027c023fc10 EFLAGS: 00010246
[   26.254318] RAX: 8373860b0f09d330 RBX: 0000000000000000 RCX: 0000000000000000
[   26.254320] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[   26.254321] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
[   26.254323] R10: ffffb027c023faf8 R11: 0000000000000000 R12: 0000000000000000
[   26.254326] R13: ffffffffbe063000 R14: 0000000000000001 R15: 0000000000000001
[   26.254328] FS:  00007fc78bf24940(0000) GS:ffff97691d000000(0000) knlGS:0000000000000000
[   26.254329] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   26.254331] CR2: 0000000000000000 CR3: 00000004171fc005 CR4: 00000000001606e0
[   26.254332] Call Trace:
[   26.254343]  dell_init+0x1fb/0x1f8c [dell_laptop]
[   26.254352]  ? dmi_matched+0x74/0x74 [dell_laptop]
[   26.254355]  do_one_initcall+0x5a/0x22d
[   26.254361]  ? kmem_cache_alloc_trace+0x34d/0x500
[   26.254369]  do_init_module+0xb4/0x2ec
[   26.254374]  load_module+0x1709/0x24e0
[   26.254385]  SYSC_init_module+0x170/0x1a0
[   26.254396]  do_syscall_64+0xa2/0xd84
[   26.254406]  entry_SYSCALL64_slow_path+0x25/0x25
[   26.254409] RIP: 0033:0x7fc78b85ad3a
[   26.254411] RSP: 002b:00007ffc20435d48 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
[   26.254413] RAX: ffffffffffffffda RBX: 0000559df485d2f0 RCX: 00007fc78b85ad3a
[   26.254415] RDX: 00007fc78b11bda5 RSI: 0000000000020138 RDI: 0000559df5116f40
[   26.254416] RBP: 00007fc78b11bda5 R08: 0000000000000000 R09: 00007ffc20433d18
[   26.254418] R10: 0000000000000005 R11: 0000000000000246 R12: 0000559df5116f40
[   26.254419] R13: 0000559df4820460 R14: 0000000000020000 R15: 0000559df2f8323c
[   26.254428] Code: ff 0f 1f 40 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 54 41 89 fc 55 89 f5 53 48 83 ec 08 48 8b 1d 07 70 00 00 48 85 db <48> c7 03 00 00 00 00 48 c7 43 08 00 00 00 00 48 c7 43 10 00 00 
[   26.254488] RIP: dell_set_arguments+0x1c/0x80 [dell_laptop] RSP: ffffb027c023fc10
[   26.254489] CR2: 0000000000000000
[   26.256149] ---[ end trace 241d71e836ee357e ]---
