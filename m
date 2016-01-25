From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_acpi: Add a module parameter to disable hotkeys registration
Date: Mon, 25 Jan 2016 12:52:18 -0700
Message-ID: <1453751538-18993-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34572 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934319AbcAYTwY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Jan 2016 14:52:24 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Some laptop models have working hotkeys without the need of the driver
to activate them.

This patch adds a module parameter to tell the driver not to register
the hotkeys.

The new parameter is useful in DE less installations or where the DE
does not handle the hotkeys (see bug 99501).

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 5ace1e0..df1f1a7 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -36,6 +36,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/proc_fs.h>
@@ -220,6 +221,10 @@ struct toshiba_acpi_dev {
 
 static struct toshiba_acpi_dev *toshiba_acpi;
 
+static bool disable_hotkeys;
+module_param(disable_hotkeys, bool, 0444);
+MODULE_PARM_DESC(disable_hotkeys, "Disables the hotkeys activation");
+
 static const struct acpi_device_id toshiba_device_ids[] = {
 	{"TOS6200", 0},
 	{"TOS6207", 0},
@@ -2692,6 +2697,11 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	acpi_handle ec_handle;
 	int error;
 
+	if (disable_hotkeys) {
+		pr_info("Hotkeys disabled by module parameter\n");
+		return 0;
+	}
+
 	if (wmi_has_guid(TOSHIBA_WMI_EVENT_GUID)) {
 		pr_info("WMI event detected, hotkeys will not be monitored\n");
 		return 0;
-- 
2.7.0
