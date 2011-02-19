From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 8/8] sony-laptop: implement new backlight control method
Date: Sat, 19 Feb 2011 11:52:32 +0900
Message-ID: <1298083952-22493-9-git-send-email-malattia@linux.it>
References: <1298083952-22493-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:60586
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753504Ab1BSDAR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Feb 2011 22:00:17 -0500
In-Reply-To: <1298083952-22493-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Reasonably recent Vaios have a 0x12f or 0x137 handler that exposes a
fine lid backlight regulation with values ranging from 0 to 255.
The patch is based on findings and code from Javier Achirica
<achirica@gmail.com> and Marco Chiappero <marco@absence.it>

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  108 ++++++++++++++++++++++++++----------
 1 files changed, 78 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index cff1b85..a097a27 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -938,11 +938,39 @@ static int sony_backlight_get_brightness(struct backlight_device *bd)
 	return value - 1;
 }
 
-static struct backlight_device *sony_backlight_device;
+static int sony_nc_get_brightness_ng(struct backlight_device *bd)
+{
+	int result;
+	int *handle = (int *)bl_get_data(bd);
+
+	sony_call_snc_handle(*handle, 0x0200, &result);
+
+	return result & 0xff;
+}
+
+static int sony_nc_update_status_ng(struct backlight_device *bd)
+{
+	int value, result;
+	int *handle = (int *)bl_get_data(bd);
+
+	value = bd->props.brightness;
+	sony_call_snc_handle(*handle, 0x0100 | (value << 16), &result);
+
+	return sony_nc_get_brightness_ng(bd);
+}
+
 static const struct backlight_ops sony_backlight_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
 	.update_status = sony_backlight_update_status,
 	.get_brightness = sony_backlight_get_brightness,
 };
+static const struct backlight_ops sony_backlight_ng_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = sony_nc_update_status_ng,
+	.get_brightness = sony_nc_get_brightness_ng,
+};
+static int backlight_ng_handle;
+static struct backlight_device *sony_backlight_device;
 
 /*
  * New SNC-only Vaios event mapping to driver known keys
@@ -1135,11 +1163,6 @@ static int sony_nc_resume(struct acpi_device *device)
 		sony_nc_function_setup(device);
 	}
 
-	/* set the last requested brightness level */
-	if (sony_backlight_device &&
-			sony_backlight_update_status(sony_backlight_device) < 0)
-		pr_warn(DRV_PFX "unable to restore brightness level\n");
-
 	/* re-read rfkill state */
 	sony_nc_rfkill_update();
 
@@ -1477,6 +1500,51 @@ static int sony_nc_kbd_backlight_cleanup(struct platform_device *pd)
 	return 0;
 }
 
+static void sony_nc_backlight_setup(void)
+{
+	acpi_handle unused;
+	int max_brightness = 0;
+	const struct backlight_ops *ops = NULL;
+	struct backlight_properties props;
+
+	if (sony_find_snc_handle(0x12f) != -1) {
+		backlight_ng_handle = 0x12f;
+		ops = &sony_backlight_ng_ops;
+		max_brightness = 0xff;
+
+	} else if (sony_find_snc_handle(0x137) != -1) {
+		backlight_ng_handle = 0x137;
+		ops = &sony_backlight_ng_ops;
+		max_brightness = 0xff;
+
+	} else if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "GBRT",
+						&unused))) {
+		ops = &sony_backlight_ops;
+		max_brightness = SONY_MAX_BRIGHTNESS - 1;
+
+	} else
+		return;
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.max_brightness = max_brightness;
+	sony_backlight_device = backlight_device_register("sony", NULL,
+							  &backlight_ng_handle,
+							  ops, &props);
+
+	if (IS_ERR(sony_backlight_device)) {
+		pr_warning(DRV_PFX "unable to register backlight device\n");
+		sony_backlight_device = NULL;
+	} else
+		sony_backlight_device->props.brightness =
+		    ops->get_brightness(sony_backlight_device);
+}
+
+static void sony_nc_backlight_cleanup(void)
+{
+	if (sony_backlight_device)
+		backlight_device_unregister(sony_backlight_device);
+}
+
 static int sony_nc_add(struct acpi_device *device)
 {
 	acpi_status status;
@@ -1543,26 +1611,8 @@ static int sony_nc_add(struct acpi_device *device)
 	if (acpi_video_backlight_support()) {
 		pr_info(DRV_PFX "brightness ignored, must be "
 		       "controlled by ACPI video driver\n");
-	} else if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "GBRT",
-						&handle))) {
-		struct backlight_properties props;
-		memset(&props, 0, sizeof(struct backlight_properties));
-		props.max_brightness = SONY_MAX_BRIGHTNESS - 1;
-		sony_backlight_device = backlight_device_register("sony", NULL,
-								  NULL,
-								  &sony_backlight_ops,
-								  &props);
-
-		if (IS_ERR(sony_backlight_device)) {
-			pr_warning(DRV_PFX "unable to register backlight device\n");
-			sony_backlight_device = NULL;
-		} else {
-			sony_backlight_device->props.brightness =
-			    sony_backlight_get_brightness
-			    (sony_backlight_device);
-		}
-
-	}
+	} else
+		sony_nc_backlight_setup();
 
 	/* create sony_pf sysfs attributes related to the SNC device */
 	for (item = sony_nc_values; item->name; ++item) {
@@ -1609,8 +1659,7 @@ static int sony_nc_add(struct acpi_device *device)
 	for (item = sony_nc_values; item->name; ++item) {
 		device_remove_file(&sony_pf_device->dev, &item->devattr);
 	}
-	if (sony_backlight_device)
-		backlight_device_unregister(sony_backlight_device);
+	sony_nc_backlight_cleanup();
 
 	sony_laptop_remove_input();
 
@@ -1632,8 +1681,7 @@ static int sony_nc_remove(struct acpi_device *device, int type)
 {
 	struct sony_nc_value *item;
 
-	if (sony_backlight_device)
-		backlight_device_unregister(sony_backlight_device);
+	sony_nc_backlight_cleanup();
 
 	sony_nc_acpi_device = NULL;
 
-- 
1.7.2.3
