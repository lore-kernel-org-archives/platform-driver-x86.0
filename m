From: vic <victorenator@gmail.com>
Subject: [PATCH 1/1] asus-wmi: append newline to messages
Date: Wed, 22 May 2013 21:32:10 +0300
Message-ID: <3262754.AntDd6n61S@vs>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f52.google.com ([209.85.214.52]:61281 "EHLO
	mail-bk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752319Ab3EVScH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 May 2013 14:32:07 -0400
Received: by mail-bk0-f52.google.com with SMTP id mz10so1314781bkb.39
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2013 11:32:06 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Append newline to messages.

Signed-off-by: Viktar Vauchkevich <victorenator@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index c11b242..0e58d74 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1045,7 +1045,7 @@ static ssize_t asus_hwmon_pwm1(struct device *dev,
 	else if (value == 3)
 		value = 255;
 	else if (value != 0) {
-		pr_err("Unknown fan speed %#x", value);
+		pr_err("Unknown fan speed %#x\n", value);
 		value = -1;
 	}
 
@@ -1557,11 +1557,11 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 
 	/* INIT enable hotkeys on some models */
 	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_INIT, 0, 0, &rv))
-		pr_info("Initialization: %#x", rv);
+		pr_info("Initialization: %#x\n", rv);
 
 	/* We don't know yet what to do with this version... */
 	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_SPEC, 0, 0x9, &rv)) {
-		pr_info("BIOS WMI version: %d.%d", rv >> 16, rv & 0xFF);
+		pr_info("BIOS WMI version: %d.%d\n", rv >> 16, rv & 0xFF);
 		asus->spec = rv;
 	}
 
@@ -1572,7 +1572,7 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 	 * The significance of others is yet to be found.
 	 */
 	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_SFUN, 0, 0, &rv)) {
-		pr_info("SFUN value: %#x", rv);
+		pr_info("SFUN value: %#x\n", rv);
 		asus->sfun = rv;
 	}
 
@@ -1712,7 +1712,7 @@ static int asus_wmi_debugfs_init(struct asus_wmi *asus)
 
 	asus->debug.root = debugfs_create_dir(asus->driver->name, NULL);
 	if (!asus->debug.root) {
-		pr_err("failed to create debugfs directory");
+		pr_err("failed to create debugfs directory\n");
 		goto error_debugfs;
 	}
 
@@ -1985,17 +1985,17 @@ EXPORT_SYMBOL_GPL(asus_wmi_unregister_driver);
 static int __init asus_wmi_init(void)
 {
 	if (!wmi_has_guid(ASUS_WMI_MGMT_GUID)) {
-		pr_info("Asus Management GUID not found");
+		pr_info("Asus Management GUID not found\n");
 		return -ENODEV;
 	}
 
-	pr_info("ASUS WMI generic driver loaded");
+	pr_info("ASUS WMI generic driver loaded\n");
 	return 0;
 }
 
 static void __exit asus_wmi_exit(void)
 {
-	pr_info("ASUS WMI generic driver unloaded");
+	pr_info("ASUS WMI generic driver unloaded\n");
 }
 
 module_init(asus_wmi_init);
-- 
1.8.2.1
