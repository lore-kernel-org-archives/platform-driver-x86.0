From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_acpi: Fix keyboard backight sysfs entries not being updated
Date: Mon, 16 Nov 2015 12:59:31 -0700
Message-ID: <1447703971-8079-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34911 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751782AbbKPT7k (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Nov 2015 14:59:40 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Certain Toshiba models with the second generation keyboard backlight
(type 2) do not generate the keyboard backlight changed event (0x92),
and thus, the sysfs entries are never being updated.

This patch adds a workquee and a global boolean variable to address
the issue.

For those models that do generate the event, the sysfs entries are
being updated via the *notify function and the boolean is set to
true to avoid a second call to update the entries.

For those models that do not generate the event, the workquee is
used to update the sysfs entries and also to emulate the event via
netlink, to make userspace aware of such change.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 45 +++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index c013029..3e2702b 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -200,6 +200,7 @@ struct toshiba_acpi_dev {
 	unsigned int sysfs_created:1;
 	unsigned int special_functions;
 
+	bool kbd_event_generated;
 	bool kbd_led_registered;
 	bool illumination_led_registered;
 	bool eco_led_registered;
@@ -516,6 +517,7 @@ static void toshiba_kbd_illum_available(struct toshiba_acpi_dev *dev)
 
 	dev->kbd_illum_supported = 0;
 	dev->kbd_led_registered = false;
+	dev->kbd_event_generated = false;
 
 	if (!sci_open(dev))
 		return;
@@ -1535,6 +1537,24 @@ static const struct backlight_ops toshiba_backlight_data = {
 	.update_status  = set_lcd_status,
 };
 
+/* Keyboard backlight work */
+static void toshiba_acpi_kbd_bl_work(struct work_struct *work)
+{
+	struct acpi_device *acpi_dev = toshiba_acpi->acpi_dev;
+
+	/* Update the sysfs entries */
+	if (sysfs_update_group(&acpi_dev->dev.kobj,
+			       &toshiba_attr_group))
+		pr_err("Unable to update sysfs entries\n");
+
+	/* Emulate the keyboard backlight event */
+	acpi_bus_generate_netlink_event(acpi_dev->pnp.device_class,
+					dev_name(&acpi_dev->dev),
+					0x92, 0);
+}
+
+static DECLARE_WORK(kbd_bl_work, toshiba_acpi_kbd_bl_work);
+
 /*
  * Sysfs files
  */
@@ -1634,6 +1654,24 @@ static ssize_t kbd_backlight_mode_store(struct device *dev,
 			return ret;
 
 		toshiba->kbd_mode = mode;
+
+		/*
+		 * Some laptop models with the second generation backlit
+		 * keyboard (type 2) do not generate the keyboard backlight
+		 * changed event (0x92), and thus, the driver will never update
+		 * the sysfs entries.
+		 *
+		 * The event is generated right when changing the keyboard
+		 * backlight mode and the *notify function will set the
+		 * kbd_event_generated to true.
+		 *
+		 * In case the event is not generated, schedule the keyboard
+		 * backlight work to update the sysfs entries and emulate the
+		 * event via genetlink.
+		 */
+		if (toshiba->kbd_type == 2 &&
+		    !toshiba_acpi->kbd_event_generated)
+			schedule_work(&kbd_bl_work);
 	}
 
 	return count;
@@ -2760,7 +2798,6 @@ error:
 static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
 {
 	struct toshiba_acpi_dev *dev = acpi_driver_data(acpi_dev);
-	int ret;
 
 	switch (event) {
 	case 0x80: /* Hotkeys and some system events */
@@ -2790,10 +2827,10 @@ static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
 		pr_info("SATA power event received %x\n", event);
 		break;
 	case 0x92: /* Keyboard backlight mode changed */
+		toshiba_acpi->kbd_event_generated = true;
 		/* Update sysfs entries */
-		ret = sysfs_update_group(&acpi_dev->dev.kobj,
-					 &toshiba_attr_group);
-		if (ret)
+		if (sysfs_update_group(&acpi_dev->dev.kobj,
+				       &toshiba_attr_group))
 			pr_err("Unable to update sysfs entries\n");
 		break;
 	case 0x85: /* Unknown */
-- 
2.6.3
