Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D72C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 May 2022 19:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238754AbiE3TDS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 May 2022 15:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238294AbiE3TDS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 May 2022 15:03:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2A1674FF
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 May 2022 12:03:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4756CB80ED9
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 May 2022 19:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7298C3411D
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 May 2022 19:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653937393;
        bh=RTmuqiqlGQQyCDCTaojhkx7LtJm9SwmaktI8fz/zDFo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Q50ak4zDSoCoLKe3S8mRdidejyWGswvhuUH2HHbC2L+UE9MmRnEvscxJ5gIAgPTxE
         mKsFEDNL7uhQzags0T2hbEyu7HBN1ni/s3tnuf18iBUKuJIMV+FkBYK3n3hfqufulY
         rEl/2D72Jp+kuXKWS5Z6QirXLzfW4LTHDSaRf6p9QvYyiabdBtojFjP1IEtjuEXU3n
         cb3DfdLrmtONguXIO0581kgAMe+Xd4eD954CAuZRdd1KfXoTMy+9Gy27t2wYugsxEC
         d0evpCmkd1PWx+G5l9V2Y64EkpoWmPVt/+wrmWZCS96SxKFVvvZV7RmWjnnzVMaW72
         qdpnoo4aW/DkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C7DFFCC13AD; Mon, 30 May 2022 19:03:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 30 May 2022 19:03:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rob@janerob.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-OuxAbvUmFe@https.bugzilla.kernel.org/>
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

--- Comment #250 from Rob Miller (rob@janerob.com) ---
(In reply to Denis Pauk from comment #248)

> (In reply to Rob Miller from comment #246)
> > > > Asus Z170-DELUXE dump

> Welcome! I have added little more debug information and additional check =
for
> different name of mutex. could you please try?
>=20
> Other possible issue can be different naming of vendor: "ASUSTeK COMPUTER
> INC." vs "ASUSTeK Computer INC.".

1) Using second patch, again sensors doesn't work without the 'lax' boot
parameter, and there is a new error:

[    3.469698] nct6775: No such ASUS mutex: \_SB.PCI0.SBRG.SIO1.MUT0
[    3.470614] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290
[    3.471418] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\_GPE.HWM) (20211217/utaddress-204)
[    3.473062] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?


2) Aplogies, I did find an error booting with the first patch:

[    3.501711] nct6775: Using Asus WMI mutex: \_SB_.PCI0.LPCB.SIO1.MUT0
[    3.501864] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290
[    3.502050] BUG: kernel NULL pointer dereference, address: 0000000000000=
270
[    3.502060] #PF: supervisor write access in kernel mode
[    3.502068] #PF: error_code(0x0002) - not-present page
[    3.502076] PGD 0 P4D 0=20
[    3.502087] Oops: 0002 [#1] PREEMPT SMP PTI
[    3.502102] CPU: 3 PID: 344 Comm: systemd-modules Not tainted 5.18.0 #2
[    3.502116] Hardware name: System manufacturer System Product
Name/Z170-DELUXE, BIOS 3801 03/14/2018
[    3.502121] RIP: 0010:nct6775_platform_probe+0x71/0x1b0 [nct6775]
[    3.502139] Code: 48 c7 c6 00 19 c8 8f 49 89 c7 e8 ca 26 0d ce 48 85 c0 =
0f
84 3b 01 00 00 49 8b 44 24 10 ba c0 0d 00 00 be 18 05 00 00 4c 89 f7 <48> 8=
9 04
25 70 02 00 00 e8 72 9f 88 ce 48 89 c3 48 85 c0 0f 84 18
[    3.502144] RSP: 0018:ffffb5ab0093b828 EFLAGS: 00010286
[    3.502151] RAX: ffff8a17c1278720 RBX: ffffffffc03f6528 RCX:
0000000000000000
[    3.502156] RDX: 0000000000000dc0 RSI: 0000000000000518 RDI:
ffff8a17c4451810
[    3.502159] RBP: ffffb5ab0093b850 R08: ffff8a17c378bab8 R09:
0000000000000000
[    3.502162] R10: ffff8a17c378bf00 R11: 0000000000000000 R12:
ffff8a17c378b200
[    3.502166] R13: ffff8a17c4451800 R14: ffff8a17c4451810 R15:
ffff8a17c378ba80
[    3.502171] FS:  00007fe3c6f44900(0000) GS:ffff8a270ecc0000(0000)
knlGS:0000000000000000
[    3.502171] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.502175] CR2: 0000000000000270 CR3: 00000001109b2005 CR4:
00000000003706e0
[    3.502176] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[    3.502177] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[    3.502177] Call Trace:
[    3.502178]  <TASK>
[    3.508488] loop4: detected capacity change from 0 to 113736
[    3.510084]  platform_probe+0x49/0xc0
[    3.525183]  really_probe+0x1b5/0x390
[    3.525185]  __driver_probe_device+0x115/0x190
[    3.525186]  driver_probe_device+0x23/0xc0
[    3.525187]  __device_attach_driver+0xae/0x110
[    3.525188]  ? driver_allows_async_probing+0x60/0x60
[    3.525189]  bus_for_each_drv+0x85/0xd0
[    3.525192]  __device_attach+0xde/0x1f0
[    3.525193]  device_initial_probe+0x13/0x20
[    3.525194]  bus_probe_device+0x8f/0xa0
[    3.525195]  device_add+0x407/0x920
[    3.525196]  ? dev_set_name+0x53/0x70
[    3.525198]  ? preempt_count_add+0x7a/0xc0
[    3.525200]  platform_device_add+0x111/0x250
[    3.525201]  sensors_nct6775_platform_init+0x4c3/0x1000 [nct6775]
[    3.525204]  ? superio_wmi_exit+0x10/0x10 [nct6775]
[    3.525206]  ? superio_outb+0x20/0x20 [nct6775]
[    3.525207]  ? superio_inb+0x20/0x20 [nct6775]
[    3.525208]  ? superio_exit+0x40/0x40 [nct6775]
[    3.525210]  ? superio_wmi_outb+0x30/0x30 [nct6775]
[    3.525211]  ? 0xffffffffc037f000
[    3.525212]  do_one_initcall+0x49/0x210
[    3.525214]  ? kmem_cache_alloc_trace+0x1a6/0x300
[    3.538973]  do_init_module+0x52/0x250
[    3.538975]  load_module+0x27e5/0x2bd0
[    3.538978]  __do_sys_finit_module+0xc5/0x130
[    3.538980]  ? __do_sys_finit_module+0xc5/0x130
[    3.538982]  __x64_sys_finit_module+0x18/0x20
[    3.538983]  do_syscall_64+0x5c/0x80
[    3.538985]  ? exit_to_user_mode_prepare+0x49/0x190
[    3.538987]  ? syscall_exit_to_user_mode+0x26/0x40
[    3.538988]  ? __x64_sys_lseek+0x18/0x20
[    3.538990]  ? do_syscall_64+0x69/0x80
[    3.538992]  ? exit_to_user_mode_prepare+0x166/0x190
[    3.538993]  ? syscall_exit_to_user_mode+0x26/0x40
[    3.538994]  ? do_syscall_64+0x69/0x80
[    3.538995]  ? syscall_exit_to_user_mode+0x26/0x40
[    3.538996]  ? __x64_sys_finit_module+0x18/0x20
[    3.538998]  ? do_syscall_64+0x69/0x80
[    3.538999]  ? do_syscall_64+0x69/0x80
[    3.539001]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[    3.539002] RIP: 0033:0x7fe3c731ea3d
[    3.539004] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d c3 a3 0f 00 f7 d8 64 89 01 48
[    3.549209] RSP: 002b:00007ffd20e10708 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    3.549210] RAX: ffffffffffffffda RBX: 0000562f4cf2ee70 RCX:
00007fe3c731ea3d
[    3.549211] RDX: 0000000000000000 RSI: 00007fe3c75f9441 RDI:
0000000000000007
[    3.549212] RBP: 0000000000020000 R08: 0000000000000000 R09:
0000000000000002
[    3.549212] R10: 0000000000000007 R11: 0000000000000246 R12:
00007fe3c75f9441
[    3.549213] R13: 0000562f4cf27160 R14: 00007fe3c781ccd0 R15:
0000562f4cf32360
[    3.549214]  </TASK>
[    3.549215] Modules linked in: nct6775(+) nct6775_core hwmon_vid lm92 jc=
42
coretemp ipmi_devintf ipmi_msghandler msr parport_pc ppdev lp parport drm
ip_tables x_tables autofs4 crc32_pclmul igb psmouse e1000e nvme i2c_i801
i2c_algo_bit i2
c_smbus nvme_core dca ahci libahci xhci_pci xhci_pci_renesas wmi video
[    3.549226] CR2: 0000000000000270
[    3.549227] ---[ end trace 0000000000000000 ]---
[    3.549227] RIP: 0010:nct6775_platform_probe+0x71/0x1b0 [nct6775]
[    3.549229] Code: 48 c7 c6 00 19 c8 8f 49 89 c7 e8 ca 26 0d ce 48 85 c0 =
0f
84 3b 01 00 00 49 8b 44 24 10 ba c0 0d 00 00 be 18 05 00 00 4c 89 f7 <48> 8=
9 04
25 70 02 00 00 e8 72 9f 88 ce 48 89 c3 48 85 c0 0f 84 18
[    3.549230] RSP: 0018:ffffb5ab0093b828 EFLAGS: 00010286
[    3.549231] RAX: ffff8a17c1278720 RBX: ffffffffc03f6528 RCX:
0000000000000000
[    3.549232] RDX: 0000000000000dc0 RSI: 0000000000000518 RDI:
ffff8a17c4451810
[    3.549232] RBP: ffffb5ab0093b850 R08: ffff8a17c378bab8 R09:
0000000000000000
[    3.549233] R10: ffff8a17c378bf00 R11: 0000000000000000 R12:
ffff8a17c378b200
[    3.549233] R13: ffff8a17c4451800 R14: ffff8a17c4451810 R15:
ffff8a17c378ba80
[    3.549234] FS:  00007fe3c6f44900(0000) GS:ffff8a270ecc0000(0000)
knlGS:0000000000000000
[    3.549235] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.549235] CR2: 0000000000000270 CR3: 00000001109b2005 CR4:
00000000003706e0
[    3.549236] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[    3.549237] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[    3.568106] systemd[1]: Mounting Mount unit for core20, revision 1434...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
