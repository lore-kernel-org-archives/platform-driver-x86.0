From: Alessandro Guido <ag@alessandroguido.name>
Subject: NULL pointer dereference in sony-laptop
Date: Thu, 31 Mar 2011 19:28:14 +0200
Message-ID: <4D94B9AE.6090004@alessandroguido.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:64938 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753403Ab1CaR13 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 Mar 2011 13:27:29 -0400
Received: by wwa36 with SMTP id 36so3091271wwa.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 31 Mar 2011 10:27:28 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: malattia@linux.it
Cc: platform-driver-x86@vger.kernel.org

With 2.6.39-rc1-00103-g6aba74f, trying to load the sony-laptop module leads to:

Mar 31 19:18:16 [kernel] BUG: unable to handle kernel NULL pointer dereference at   (null)
Mar 31 19:18:16 [kernel] IP: [<f8021060>] sony_find_snc_handle+0x10/0x70 [sony_laptop]
Mar 31 19:18:16 [kernel] *pde = 00000000 
Mar 31 19:18:16 [kernel] Modules linked in: sony_laptop(+)
Mar 31 19:18:16 [kernel] Pid: 1464, comm: modprobe Not tainted 2.6.39-rc1-00103-g6aba74f #1 Sony Corporation VGN-FS215S
Mar 31 19:18:16 [kernel] EIP: 0060:[<f8021060>] EFLAGS: 00010282 CPU: 0
Mar 31 19:18:16 [kernel] EIP is at sony_find_snc_handle+0x10/0x70 [sony_laptop]
Mar 31 19:18:16 [kernel] EAX: 0000012f EBX: 00000000 ECX: 00000000 EDX: 00000000
Mar 31 19:18:16 [kernel] ESI: f480fe04 EDI: f65d7400 EBP: 00000000 ESP: f480fdb0
Mar 31 19:18:16 [kernel]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
Mar 31 19:18:16 [kernel]  f80255cc f480fe04 f65d7400 f80255cc f8023126 f80255ed f80255d0 f80255cc
Mar 31 19:18:16 [kernel]  f5c2ef60 f645e300 00000000 c10f35b5 f480fe18 f5c2ef00 f480fe18 c10f2dcc
Mar 31 19:18:16 [kernel]  c10f2ad3 000041ed f6747e60 f5f671e0 f645e300 00000000 f65d7400 f8025840
Mar 31 19:18:16 [kernel]  [<f8023126>] ? sony_nc_add+0x286/0x8b0 [sony_laptop]
Mar 31 19:18:16 [kernel]  [<c10f35b5>] ? sysfs_do_create_link+0xc5/0x1f0
Mar 31 19:18:16 [kernel]  [<c10f2dcc>] ? sysfs_add_one+0x1c/0xc0
Mar 31 19:18:16 [kernel]  [<c10f2ad3>] ? sysfs_addrm_finish+0x13/0xa0
Mar 31 19:18:16 [kernel]  [<c11820a2>] ? acpi_device_probe+0x37/0xee
Mar 31 19:18:16 [kernel]  [<c11c6e15>] ? driver_probe_device+0x85/0x190
Mar 31 19:18:16 [kernel]  [<c11824a1>] ? acpi_match_device_ids+0x27/0x4d
Mar 31 19:18:16 [kernel]  [<c11c6f99>] ? __driver_attach+0x79/0x80
Mar 31 19:18:16 [kernel]  [<c11c6f20>] ? driver_probe_device+0x190/0x190
Mar 31 19:18:16 [kernel]  [<c11c608b>] ? bus_for_each_dev+0x4b/0x70
Mar 31 19:18:16 [kernel]  [<c11c6b36>] ? driver_attach+0x16/0x20
Mar 31 19:18:16 [kernel]  [<c11c6f20>] ? driver_probe_device+0x190/0x190
Mar 31 19:18:16 [kernel]  [<c11c6827>] ? bus_add_driver+0x197/0x270
Mar 31 19:18:16 [kernel]  [<c1181fdf>] ? acpi_device_hid+0x13/0x13
Mar 31 19:18:16 [kernel]  [<c11c7497>] ? driver_register+0x57/0xf0
Mar 31 19:18:16 [kernel]  [<f808104d>] ? sony_laptop_init+0x4d/0x79 [sony_laptop]
Mar 31 19:18:16 [kernel]  [<c10011f3>] ? do_one_initcall+0x33/0x170
Mar 31 19:18:16 [kernel]  [<c1042c3d>] ? __blocking_notifier_call_chain+0x4d/0x60
Mar 31 19:18:16 [kernel]  [<f8081000>] ? 0xf8080fff
Mar 31 19:18:16 [kernel]  [<c10523f1>] ? sys_init_module+0x151/0x1a50
Mar 31 19:18:16 [kernel]  [<c10a38c9>] ? sys_close+0x69/0xe0
Mar 31 19:18:16 [kernel]  [<c131d30c>] ? sysenter_do_call+0x12/0x22
Mar 31 19:18:16 [kernel] ---[ end trace aac6d83f93fcda93 ]---
