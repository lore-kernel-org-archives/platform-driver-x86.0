Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64672C636C8
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 02:56:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4864561029
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 02:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbhGUCPr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Jul 2021 22:15:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231357AbhGUCPA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Jul 2021 22:15:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6D28B61178
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 02:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626836137;
        bh=mOhDWFp6sgoRtaDOnP+STzRN+W/8fa7S3fwSU+za5g0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RFxLs5uAWl9R3sQ+KK8Tju2BbKCCB9r41nipw7G+Duz+APXypBwVx/v3hzH7wlKUZ
         FLSE15qTOYeWRhL2uj5zNgySkh+YJ4F0mKMVhsyuGfPcFGRCxLSwm7gz3mPnbKpiQA
         vlLF9Wl3hnY127rO+EM0TmtlL7whDjG8r33hhy4FJQEhsrdle5U5jVesNaEdBB2SmT
         6db3g2P9ImeikAlrPEdY5hPQeyNZUIhfJHTkgYHGdFHFqTU01kPcYAo/GC4x4W5Dj+
         3yLTyzqlf/HE8RpTIjslgApMgLDUtnr11jo9bSp3RrB7e1cvEXRowovSK/33GXidc9
         UtOZX94PBJw/A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 02:55:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: james.a.munsch@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-213579-215701-9NA2KJjIBu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

James Munsch (james.a.munsch@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |james.a.munsch@gmail.com

--- Comment #10 from James Munsch (james.a.munsch@gmail.com) ---
Created attachment 297981
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297981&action=3Dedit
clevo.nh58hp.dmesg.log

Also seeing this on

5.11.0-7260-generic
Clevo NH58HP


```
[    3.291272] tigerlake-pinctrl INT34C6:00: pin 57 cannot be used as IRQ
[    3.291273] genirq: Setting trigger mode 8 for irq 150 failed
(intel_gpio_irq_type+0x0/0x130)
[    3.291539] i2c_hid i2c-ELAN0412:01: supply vdd not found, using dummy
regulator
[    3.291553] i2c_hid i2c-ELAN0412:01: supply vddl not found, using dummy
regulator
[    3.295833] gpio gpiochip0: (INT34C6:00): gpiochip_lock_as_irq: cannot g=
et
GPIO direction
[    3.295835] gpio gpiochip0: (INT34C6:00): unable to lock HW IRQ 44 for I=
RQ
[    3.295836] genirq: Failed to request resources for ELAN0412:01 (irq 150=
) on
irqchip INT34C6:00
[    3.295844] i2c_hid i2c-ELAN0412:01: Could not register for ELAN0412:01
interrupt, irq =3D 150, ret =3D -22
[    3.295893] i2c_hid: probe of i2c-ELAN0412:01 failed with error -22
[    3.296170] nvme nvme0: 16/0/0 default/read/poll queues
[    3.297349] checking generic (4000000000 7e9000) vs hw (6204000000 10000=
00)
[    3.297351] checking generic (4000000000 7e9000) vs hw (4000000000 10000=
000)
[    3.297352] fb0: switching to inteldrmfb from EFI VGA
[    3.297392] i915 0000:00:02.0: vgaarb: deactivate vga console
[    3.298228] ------------[ cut here ]------------
[    3.298228] Missing case (val =3D=3D 65535)
[    3.298237] WARNING: CPU: 15 PID: 259 at
drivers/gpu/drm/i915/intel_dram.c:96 skl_dram_get_dimm_info+0x79/0x1b0 [i91=
5]
[    3.298282] Modules linked in: i915(+) nvme ahci nvme_core libahci
i2c_algo_bit drm_kms_helper crct10dif_pclmul crc32_pclmul syscopyarea
ghash_clmulni_intel sysfillrect aesni_intel sysimgblt fb_sys_fops crypto_si=
md
cec cryptd rc_core glue_helper psmouse intel_lpss_pci(+) sdhci_pci i2c_i801
intel_lpss r8169 i2c_hid drm cqhci xhci_pci idma64 i2c_smbus sdhci realtek
virt_dma vmd xhci_pci_renesas intel_pmt hid wmi video fjes(-) pinctrl_tiger=
lake
[    3.298298] CPU: 15 PID: 259 Comm: systemd-udevd Tainted: G        W=20=
=20=20=20=20=20=20=20
5.11.0-7620-generic #21~1624379747~21.04~3abeff8-Ubuntu
[    3.298300] Hardware name: Notebook NH5x_NH7xHP/NH5x_NH7xHP, BIOS 1.07.0=
3LS1
06/15/2021
[    3.298301] RIP: 0010:skl_dram_get_dimm_info+0x79/0x1b0 [i915]
[    3.298336] Code: 0f 84 34 01 00 00 41 f7 c0 00 01 00 00 0f 84 27 01 00 =
00
41 0f b7 d0 48 c7 c6 51 33 9d c0 48 c7 c7 55 33 9d c0 e8 84 0d 1c d4 <0f> 0=
b 44
0f b7 0b b9 01 00 00 00 31 c0 31 f6 88 43 02 41 c1 ff 09
[    3.298337] RSP: 0018:ffffa8aa01617980 EFLAGS: 00010282
[    3.298339] RAX: 0000000000000000 RBX: ffffa8aa016179ec RCX:
ffffffff95b23528
[    3.298340] RDX: c0000000ffffdfff RSI: 0000000000000000 RDI:
0000000000000247
[    3.298341] RBP: ffffa8aa016179a8 R08: 0000000000000000 R09:
ffffa8aa01617760
[    3.298342] R10: ffffa8aa01617758 R11: ffffffff95b53568 R12:
0000000000000000
[    3.298342] R13: 000000000000004c R14: ffff967616520000 R15:
000000000000ffff
[    3.298343] FS:  00007f94404d78c0(0000) GS:ffff96853f7c0000(0000)
knlGS:0000000000000000
[    3.298344] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.298345] CR2: 00007f9440b34000 CR3: 0000000116e4a002 CR4:
0000000000770ee0
[    3.298346] PKRU: 55555554
[    3.298346] Call Trace:
[    3.298348]  skl_dram_get_channel_info+0x2e/0x150 [i915]
[    3.298379]  skl_dram_get_channels_info+0x6e/0x190 [i915]
[    3.298407]  skl_get_dram_info+0x6e/0x100 [i915]
[    3.298434]  intel_dram_detect+0x3e/0xd0 [i915]
[    3.298459]  i915_driver_hw_probe+0x1cc/0x210 [i915]
[    3.298491]  i915_driver_probe+0xe5/0x2f0 [i915]
[    3.298521]  ? mutex_lock+0x13/0x40
[    3.298524]  ? acpi_dev_found+0x66/0x70
[    3.298528]  i915_pci_probe+0x58/0x140 [i915]
[    3.298557]  local_pci_probe+0x48/0x80
[    3.298559]  pci_call_probe+0x53/0xf0
[    3.298560]  pci_device_probe+0xad/0xf0
[    3.298561]  really_probe+0xff/0x460
[    3.298564]  driver_probe_device+0xe9/0x160
[    3.298565]  device_driver_attach+0xab/0xb0
[    3.298567]  __driver_attach+0x8f/0x150
[    3.298568]  ? device_driver_attach+0xb0/0xb0
[    3.298569]  bus_for_each_dev+0x7e/0xc0
[    3.298570]  driver_attach+0x1e/0x20
[    3.298572]  bus_add_driver+0x135/0x1f0
[    3.298573]  driver_register+0x95/0xf0
[    3.298574]  __pci_register_driver+0x54/0x60
[    3.298575]  i915_init+0x66/0x81 [i915]
[    3.298617]  ? 0xffffffffc0a53000
[    3.298619]  do_one_initcall+0x48/0x1d0
[    3.298622]  ? kmem_cache_alloc_trace+0xf6/0x200
[    3.298626]  ? do_init_module+0x28/0x290
[    3.298629]  do_init_module+0x62/0x290
[    3.298630]  load_module+0x6fd/0x780
[    3.298631]  __do_sys_finit_module+0xc2/0x120
[    3.298633]  __x64_sys_finit_module+0x1a/0x20
[    3.298634]  do_syscall_64+0x38/0x90
[    3.298636]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    3.298637] RIP: 0033:0x7f944098ff6d
[    3.298638] Code: 28 0d 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d cb de 0c 00 f7 d8 64 89 01 48
[    3.298639] RSP: 002b:00007ffd39f865e8 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    3.298641] RAX: ffffffffffffffda RBX: 000055bb4ec1ed10 RCX:
00007f944098ff6d
[    3.298641] RDX: 0000000000000000 RSI: 00007f9440b35e2d RDI:
0000000000000014
[    3.298643] RBP: 0000000000020000 R08: 0000000000000000 R09:
000055bb4dd7e8dd
[    3.298643] R10: 0000000000000014 R11: 0000000000000246 R12:
00007f9440b35e2d
[    3.298644] R13: 0000000000000000 R14: 000055bb4ec09450 R15:
000055bb4ec1ed10
[    3.298645] ---[ end trace 21d2b392d3814981 ]---
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
