From: Li Dongyang <jerry87905@gmail.com>
Subject: [PATCH 3/3] thinkpad_acpi: Free hotkey_keycode_map after unregistering tpacpi_inputdev
Date: Wed, 25 Jul 2012 10:45:09 +1000
Message-ID: <1343177109-1664-3-git-send-email-Jerry87905@gmail.com>
References: <1343177109-1664-1-git-send-email-Jerry87905@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:36685 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756102Ab2GYAnS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Jul 2012 20:43:18 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so459929pbb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jul 2012 17:43:18 -0700 (PDT)
In-Reply-To: <1343177109-1664-1-git-send-email-Jerry87905@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: ibm-acpi@hmh.eng.br, mjg@redhat.com

We should free hotkey_keycode_map after unregistering tpacpi_inputdev, to aviod
use after free like this:

[   99.408388] =============================================================================
[   99.408393] BUG kmalloc-64 (Not tainted): Poison overwritten
[   99.408394] -----------------------------------------------------------------------------
[   99.408394] 
[   99.408398] INFO: 0xf2751962-0xf2751995. First byte 0x98 instead of 0x6b
[   99.408402] INFO: Allocated in 0xfdc88c28 age=79 cpu=0 pid=1329
[   99.408407]  __slab_alloc.isra.50.constprop.56+0x49f/0x533
[   99.408410]  kmem_cache_alloc_trace+0x10d/0x140
[   99.408412]  0xfdc88c28
[   99.408414]  0xfdc898cc
[   99.408417]  do_one_initcall+0x112/0x160
[   99.408420]  sys_init_module+0xe6d/0x1bc0
[   99.408422]  sysenter_do_call+0x12/0x28
[   99.408427] INFO: Freed in hotkey_exit+0x50/0xb0 [thinkpad_acpi] age=14 cpu=1 pid=1333
[   99.408429]  __slab_free+0x3d/0x30b
[   99.408431]  kfree+0x129/0x140
[   99.408435]  hotkey_exit+0x50/0xb0 [thinkpad_acpi]
[   99.408438]  ibm_exit+0xe3/0x1a0 [thinkpad_acpi]
[   99.408441]  thinkpad_acpi_module_exit+0x35/0x208 [thinkpad_acpi]
[   99.408443]  sys_delete_module+0x11f/0x280
[   99.408445]  sysenter_do_call+0x12/0x28
[   99.408447] INFO: Slab 0xf4d5ea20 objects=17 used=17 fp=0x  (null) flags=0x40000080
[   99.408449] INFO: Object 0xf2751960 @offset=2400 fp=0xf2751780
[   99.408449] 
[   99.408452] Bytes b4 f2751950: 64 02 00 00 ae ce fe ff 5a 5a 5a 5a 5a 5a 5a 5a  d.......ZZZZZZZZ
[   99.408454] Object f2751960: 6b 6b 98 00 ec 00 8e 00 ee 00 6b 6b e3 00 bf 00 kk........kk....
[   99.408456] Object f2751970: c2 00 6b 6b 6b 6b cd 00 6b 6b 6b 6b 6b 6b e1 00 ..kkkk..kkkkkk..
[   99.408458] Object f2751980: e0 00 e4 00 6b 6b 74 01 73 00 72 00 71 00 94 00 ....kkt.s.r.q...
[   99.408460] Object f2751990: 6b 6b 6b 6b f8 00 6b 6b 6b 6b 6b 6b 6b 6b 6b a5 kkkk..kkkkkkkkk.
[   99.408462] Redzone f27519a0: bb bb bb bb ....

Signed-off-by: Li Dongyang <Jerry87905@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ae20355..e7f7328 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3015,8 +3015,6 @@ static void hotkey_exit(void)
 	if (hotkey_dev_attributes)
 		delete_attr_set(hotkey_dev_attributes, &tpacpi_pdev->dev.kobj);
 
-	kfree(hotkey_keycode_map);
-
 	dbg_printk(TPACPI_DBG_EXIT | TPACPI_DBG_HKEY,
 		   "restoring original HKEY status and mask\n");
 	/* yes, there is a bitwise or below, we want the
@@ -8937,6 +8935,7 @@ static void thinkpad_acpi_module_exit(void)
 			input_unregister_device(tpacpi_inputdev);
 		else
 			input_free_device(tpacpi_inputdev);
+		kfree(hotkey_keycode_map);
 	}
 
 	if (tpacpi_hwmon)
-- 
1.7.11.3
