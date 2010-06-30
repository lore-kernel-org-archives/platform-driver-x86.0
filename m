From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] dell-wmi: fix a memory leak
Date: Wed, 30 Jun 2010 17:25:46 +0800
Message-ID: <1277889946.30827.2.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:60837 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805Ab0F3JXY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Jun 2010 05:23:24 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Dmitry Torokhov <dtor@mail.ru>, =?ISO-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, platform-driver-x86@vger.kernel.org

If dell_new_hk_type is true, dell_legacy_wmi_keymap will point to a memory
allocated in setup_new_hk_map().
In this case, the memory is not freed in current implementation.
This patch fixes the leak by kfree(dell_wmi_keymap) if dell_new_hk_type is true.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/dell-wmi.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 66f53c3..ee6452e 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -339,13 +339,18 @@ static int __init dell_wmi_init(void)
 	acpi_video = acpi_video_backlight_support();
 
 	err = dell_wmi_input_setup();
-	if (err)
+	if (err) {
+		if (dell_new_hk_type)
+			kfree(dell_wmi_keymap);
 		return err;
+	}
 
 	status = wmi_install_notify_handler(DELL_EVENT_GUID,
 					 dell_wmi_notify, NULL);
 	if (ACPI_FAILURE(status)) {
 		input_unregister_device(dell_wmi_input_dev);
+		if (dell_new_hk_type)
+			kfree(dell_wmi_keymap);
 		printk(KERN_ERR
 			"dell-wmi: Unable to register notify handler - %d\n",
 			status);
@@ -359,6 +364,8 @@ static void __exit dell_wmi_exit(void)
 {
 	wmi_remove_notify_handler(DELL_EVENT_GUID);
 	input_unregister_device(dell_wmi_input_dev);
+	if (dell_new_hk_type)
+		kfree(dell_wmi_keymap);
 }
 
 module_init(dell_wmi_init);
-- 
1.5.4.3
