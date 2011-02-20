From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: [PATCH 4/7] hp-wmi: split rfkill initialization out of hp_wmi_bios_setup
Date: Sun, 20 Feb 2011 19:01:44 +0200
Message-ID: <1298221307-29980-5-git-send-email-anssi.hannula@iki.fi>
References: <1298221307-29980-1-git-send-email-anssi.hannula@iki.fi>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from sypressi.dnainternet.net ([83.102.40.135]:49227 "EHLO
	sypressi.dnainternet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754155Ab1BTRCH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Feb 2011 12:02:07 -0500
In-Reply-To: <1298221307-29980-1-git-send-email-anssi.hannula@iki.fi>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

---
 drivers/platform/x86/hp-wmi.c |   46 +++++++++++++++++++++++++---------------
 1 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 5c8ae65..f6a1c37 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -532,7 +532,7 @@ static void cleanup_sysfs(struct platform_device *device)
 	device_remove_file(&device->dev, &dev_attr_tablet);
 }
 
-static int __devinit hp_wmi_bios_setup(struct platform_device *device)
+static int __devinit hp_wmi_rfkill_setup(struct platform_device *device)
 {
 	int err;
 	int wireless = 0;
@@ -542,22 +542,6 @@ static int __devinit hp_wmi_bios_setup(struct platform_device *device)
 	if (err)
 		return err;
 
-	err = device_create_file(&device->dev, &dev_attr_display);
-	if (err)
-		goto add_sysfs_error;
-	err = device_create_file(&device->dev, &dev_attr_hddtemp);
-	if (err)
-		goto add_sysfs_error;
-	err = device_create_file(&device->dev, &dev_attr_als);
-	if (err)
-		goto add_sysfs_error;
-	err = device_create_file(&device->dev, &dev_attr_dock);
-	if (err)
-		goto add_sysfs_error;
-	err = device_create_file(&device->dev, &dev_attr_tablet);
-	if (err)
-		goto add_sysfs_error;
-
 	if (wireless & 0x1) {
 		wifi_rfkill = rfkill_alloc("hp-wifi", &device->dev,
 					   RFKILL_TYPE_WLAN,
@@ -611,6 +595,34 @@ register_bluetooth_error:
 		rfkill_unregister(wifi_rfkill);
 register_wifi_error:
 	rfkill_destroy(wifi_rfkill);
+	return err;
+}
+
+static int __devinit hp_wmi_bios_setup(struct platform_device *device)
+{
+	int err;
+
+	err = hp_wmi_rfkill_setup(device);
+	if (err)
+		return err;
+
+	err = device_create_file(&device->dev, &dev_attr_display);
+	if (err)
+		goto add_sysfs_error;
+	err = device_create_file(&device->dev, &dev_attr_hddtemp);
+	if (err)
+		goto add_sysfs_error;
+	err = device_create_file(&device->dev, &dev_attr_als);
+	if (err)
+		goto add_sysfs_error;
+	err = device_create_file(&device->dev, &dev_attr_dock);
+	if (err)
+		goto add_sysfs_error;
+	err = device_create_file(&device->dev, &dev_attr_tablet);
+	if (err)
+		goto add_sysfs_error;
+	return 0;
+
 add_sysfs_error:
 	cleanup_sysfs(device);
 	return err;
-- 
1.7.3
