From: Marco Martin <notmart@gmail.com>
Subject: [PATCH v6] Support intel-vbtn based tablet mode switch
Date: Sat, 27 Jan 2018 11:15:38 +0100
Message-ID: <1517048138-2335-1-git-send-email-notmart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:39555 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751957AbeA0KPt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 Jan 2018 05:15:49 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: mario_limonciello@dell.com, andy@infradead.org, pali.rohar@gmail.com, dvhart@infradead.org, mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, bhush94@gmail.com, notmart@gmail.com

Some laptops such as Dell Inspiron 7000 series have the
tablet mode switch implemented in Intel ACPI,
the events to enter and exit the tablet mode are 0xCC and 0xCD

CC: platform-driver-x86@vger.kernel.org
CC: Matthew Garrett <mjg59@srcf.ucam.org>
CC: "Pali Rohár" <pali.rohar@gmail.com>
CC: Darren Hart <dvhart@infradead.org>
CC: Mario Limonciello <mario_limonciello@dell.com>
CC: Andy Shevchenko <andy@infradead.org>

Signed-off-by: Marco Martin <notmart@gmail.com>

Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/intel-vbtn.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 58c5ff3..0979811 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -26,6 +26,9 @@
 #include <linux/suspend.h>
 #include <acpi/acpi_bus.h>
 
+/* When NOT in tablet mode, VGBS returns with the flag 0x40 */
+#define TABLET_MODE_FLAG 0x40
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("AceLan Kao");
 
@@ -42,6 +45,8 @@ static const struct key_entry intel_vbtn_keymap[] = {
 	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },		/* volume-up key release */
 	{ KE_KEY, 0xC6, { KEY_VOLUMEDOWN } },		/* volume-down key press */
 	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },	/* volume-down key release */
+	{ KE_SW,  0xCC, { .sw = { SW_TABLET_MODE, 1 } } }, /* Tablet mode in */
+	{ KE_SW,  0xCD, { .sw = { SW_TABLET_MODE, 0 } } }, /* Tablet mode out */
 	{ KE_END },
 };
 
@@ -88,6 +93,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 
 static int intel_vbtn_probe(struct platform_device *device)
 {
+	struct acpi_buffer vgbs_output = { ACPI_ALLOCATE_BUFFER, NULL };
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
 	struct intel_vbtn_priv *priv;
 	acpi_status status;
@@ -110,6 +116,22 @@ static int intel_vbtn_probe(struct platform_device *device)
 		return err;
 	}
 
+	status = acpi_evaluate_object(handle, "VGBS", NULL, &vgbs_output);
+	/* VGBS being present and returning something means
+	 * we have a tablet mode switch
+	 */
+	if (ACPI_SUCCESS(status)) {
+		union acpi_object *obj = vgbs_output.pointer;
+
+		if (obj && obj->type == ACPI_TYPE_INTEGER) {
+			input_report_switch(priv->input_dev,
+								SW_TABLET_MODE,
+								!(obj->integer.value & TABLET_MODE_FLAG));
+		}
+	}
+
+	kfree(vgbs_output.pointer);
+
 	status = acpi_install_notify_handler(handle,
 					     ACPI_DEVICE_NOTIFY,
 					     notify_handler,
-- 
2.7.4
