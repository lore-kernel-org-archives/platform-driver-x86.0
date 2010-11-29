From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 01/10] eeepc-wmi: rework eeepc_wmi_init and eeepc_wmi_exit
Date: Mon, 29 Nov 2010 08:14:05 +0100
Message-ID: <1291014854-17961-2-git-send-email-corentincj@iksaif.net>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:51321 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754936Ab0K2HPD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:03 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 3EDB6862B0
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:02 +0100 (CET)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

The old code was using platform_driver.probe to initialize
eeepc_wmi context. That's a mistake because if probe fail,
eeepc_platform_register() won't tell anyone, and chaos will happen.

Wrap add and remove code inside eeepc_wmi_add() / eeepc_wmi_remove(),
and try to use the static platform_device only in eeepc_wmi_init()
and eeepc_wmi_exit()

The code is now very similar to eeepc-laptop, except eeepc_laptop_add
and eeepc_laptop_remove are called from acpi_driver, not module
init/exit functions, but WMI doesn't provide such functionalities (yet ?).

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-wmi.c |  135 ++++++++++++++++++++++----------------
 1 files changed, 79 insertions(+), 56 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 0d50fbb..dfbb295 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -86,8 +86,10 @@ struct bios_args {
 struct eeepc_wmi {
 	struct input_dev *inputdev;
 	struct backlight_device *backlight_device;
+	struct platform_device *platform_device;
 };
 
+/* Only used in eeepc_wmi_init() and eeepc_wmi_exit() */
 static struct platform_device *platform_device;
 
 static int eeepc_wmi_input_init(struct eeepc_wmi *eeepc)
@@ -101,7 +103,7 @@ static int eeepc_wmi_input_init(struct eeepc_wmi *eeepc)
 	eeepc->inputdev->name = "Eee PC WMI hotkeys";
 	eeepc->inputdev->phys = EEEPC_WMI_FILE "/input0";
 	eeepc->inputdev->id.bustype = BUS_HOST;
-	eeepc->inputdev->dev.parent = &platform_device->dev;
+	eeepc->inputdev->dev.parent = &eeepc->platform_device->dev;
 
 	err = sparse_keymap_setup(eeepc->inputdev, eeepc_wmi_keymap, NULL);
 	if (err)
@@ -234,7 +236,7 @@ static int eeepc_wmi_backlight_init(struct eeepc_wmi *eeepc)
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.max_brightness = 15;
 	bd = backlight_device_register(EEEPC_WMI_FILE,
-				       &platform_device->dev, eeepc,
+				       &eeepc->platform_device->dev, eeepc,
 				       &eeepc_wmi_bl_ops, &props);
 	if (IS_ERR(bd)) {
 		pr_err("Could not register backlight device\n");
@@ -337,49 +339,99 @@ static int eeepc_wmi_sysfs_init(struct platform_device *device)
 	return 0;
 
 error_sysfs:
-	eeepc_wmi_sysfs_exit(platform_device);
+	eeepc_wmi_sysfs_exit(device);
 	return retval;
 }
 
-static int __devinit eeepc_wmi_platform_probe(struct platform_device *device)
+/*
+ * Platform device
+ */
+static int __init eeepc_wmi_platform_init(struct eeepc_wmi *eeepc)
 {
-	struct eeepc_wmi *eeepc;
 	int err;
+
+	eeepc->platform_device = platform_device_alloc(EEEPC_WMI_FILE, -1);
+	if (!eeepc->platform_device)
+		return -ENOMEM;
+	platform_set_drvdata(eeepc->platform_device, eeepc);
+
+	err = platform_device_add(eeepc->platform_device);
+	if (err)
+		goto fail_platform_device;
+
+	err = eeepc_wmi_sysfs_init(eeepc->platform_device);
+	if (err)
+		goto fail_sysfs;
+	return 0;
+
+fail_sysfs:
+	platform_device_del(eeepc->platform_device);
+fail_platform_device:
+	platform_device_put(eeepc->platform_device);
+	return err;
+}
+
+static void eeepc_wmi_platform_exit(struct eeepc_wmi *eeepc)
+{
+	eeepc_wmi_sysfs_exit(eeepc->platform_device);
+	platform_device_unregister(eeepc->platform_device);
+}
+
+/*
+ * WMI Driver
+ */
+static struct platform_device * __init eeepc_wmi_add(void)
+{
+	struct eeepc_wmi *eeepc;
 	acpi_status status;
+	int err;
 
-	eeepc = platform_get_drvdata(device);
+	eeepc = kzalloc(sizeof(struct eeepc_wmi), GFP_KERNEL);
+	if (!eeepc)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * Register the platform device first.  It is used as a parent for the
+	 * sub-devices below.
+	 */
+	err = eeepc_wmi_platform_init(eeepc);
+	if (err)
+		goto fail_platform;
 
 	err = eeepc_wmi_input_init(eeepc);
 	if (err)
-		goto error_input;
+		goto fail_input;
 
 	if (!acpi_video_backlight_support()) {
 		err = eeepc_wmi_backlight_init(eeepc);
 		if (err)
-			goto error_backlight;
+			goto fail_backlight;
 	} else
 		pr_info("Backlight controlled by ACPI video driver\n");
 
 	status = wmi_install_notify_handler(EEEPC_WMI_EVENT_GUID,
-					eeepc_wmi_notify, eeepc);
+					    eeepc_wmi_notify, eeepc);
 	if (ACPI_FAILURE(status)) {
 		pr_err("Unable to register notify handler - %d\n",
 			status);
 		err = -ENODEV;
-		goto error_wmi;
+		goto fail_wmi_handler;
 	}
 
-	return 0;
+	return eeepc->platform_device;
 
-error_wmi:
+fail_wmi_handler:
 	eeepc_wmi_backlight_exit(eeepc);
-error_backlight:
+fail_backlight:
 	eeepc_wmi_input_exit(eeepc);
-error_input:
-	return err;
+fail_input:
+	eeepc_wmi_platform_exit(eeepc);
+fail_platform:
+	kfree(eeepc);
+	return ERR_PTR(err);
 }
 
-static int __devexit eeepc_wmi_platform_remove(struct platform_device *device)
+static int eeepc_wmi_remove(struct platform_device *device)
 {
 	struct eeepc_wmi *eeepc;
 
@@ -387,7 +439,9 @@ static int __devexit eeepc_wmi_platform_remove(struct platform_device *device)
 	wmi_remove_notify_handler(EEEPC_WMI_EVENT_GUID);
 	eeepc_wmi_backlight_exit(eeepc);
 	eeepc_wmi_input_exit(eeepc);
+	eeepc_wmi_platform_exit(eeepc);
 
+	kfree(eeepc);
 	return 0;
 }
 
@@ -396,13 +450,10 @@ static struct platform_driver platform_driver = {
 		.name = EEEPC_WMI_FILE,
 		.owner = THIS_MODULE,
 	},
-	.probe = eeepc_wmi_platform_probe,
-	.remove = __devexit_p(eeepc_wmi_platform_remove),
 };
 
 static int __init eeepc_wmi_init(void)
 {
-	struct eeepc_wmi *eeepc;
 	int err;
 
 	if (!wmi_has_guid(EEEPC_WMI_EVENT_GUID) ||
@@ -411,58 +462,30 @@ static int __init eeepc_wmi_init(void)
 		return -ENODEV;
 	}
 
-	eeepc = kzalloc(sizeof(struct eeepc_wmi), GFP_KERNEL);
-	if (!eeepc)
-		return -ENOMEM;
-
-	platform_device = platform_device_alloc(EEEPC_WMI_FILE, -1);
-	if (!platform_device) {
-		pr_warning("Unable to allocate platform device\n");
-		err = -ENOMEM;
-		goto fail_platform;
+	platform_device = eeepc_wmi_add();
+	if (IS_ERR(platform_device)) {
+		err = PTR_ERR(platform_device);
+		goto fail_eeepc_wmi;
 	}
 
-	err = platform_device_add(platform_device);
-	if (err) {
-		pr_warning("Unable to add platform device\n");
-		goto put_dev;
-	}
-
-	platform_set_drvdata(platform_device, eeepc);
-
 	err = platform_driver_register(&platform_driver);
 	if (err) {
 		pr_warning("Unable to register platform driver\n");
-		goto del_dev;
+		goto fail_platform_driver;
 	}
 
-	err = eeepc_wmi_sysfs_init(platform_device);
-	if (err)
-		goto del_sysfs;
-
 	return 0;
 
-del_sysfs:
-	eeepc_wmi_sysfs_exit(platform_device);
-del_dev:
-	platform_device_del(platform_device);
-put_dev:
-	platform_device_put(platform_device);
-fail_platform:
-	kfree(eeepc);
-
+fail_platform_driver:
+	eeepc_wmi_remove(platform_device);
+fail_eeepc_wmi:
 	return err;
 }
 
 static void __exit eeepc_wmi_exit(void)
 {
-	struct eeepc_wmi *eeepc;
-
-	eeepc_wmi_sysfs_exit(platform_device);
-	eeepc = platform_get_drvdata(platform_device);
+	eeepc_wmi_remove(platform_device);
 	platform_driver_unregister(&platform_driver);
-	platform_device_unregister(platform_device);
-	kfree(eeepc);
 }
 
 module_init(eeepc_wmi_init);
-- 
1.7.3.2
