From: Marco Martin <notmart@gmail.com>
Subject: [PATCH] Support intel-vbtn based tablet mode switch
Date: Mon, 29 Jan 2018 21:27:43 +0100
Message-ID: <1517257663-2171-1-git-send-email-notmart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: mario_limonciello@dell.com, andy@infradead.org, pali.rohar@gmail.com, dvhart@infradead.org, mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, bhush94@gmail.com, notmart@gmail.com, =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
List-Id: platform-driver-x86.vger.kernel.org

On some laptop like the Dell Inspiron 7000 series
tablet mode switch implemented in Intel ACPI,
the events to enter and exit the tablet mode are 0xCC and 0xCD

This initializes the tablet/laptop mode at the correct value
if the system booted in tablet mode (or the vbtn module loaded
with the device in tablet mode)

CC: platform-driver-x86@vger.kernel.org
CC: Matthew Garrett <mjg59@srcf.ucam.org>
CC: "Pali Rohár" <pali.rohar@gmail.com>
CC: Darren Hart <dvhart@infradead.org>
CC: Mario Limonciello <mario_limonciello@dell.com>
CC: Andy Shevchenko <andy@infradead.org>
CC: Stefan Brüns<stefan.bruens@rwth-aachen.de>

Signed-off-by: Marco Martin <notmart@gmail.com>

Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
Acked-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/platform/x86/intel-vbtn.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 5fc4315..019ff21 100644
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
 
@@ -108,6 +111,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 
 static int intel_vbtn_probe(struct platform_device *device)
 {
+	struct acpi_buffer vgbs_output = { ACPI_ALLOCATE_BUFFER, NULL };
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
 	struct intel_vbtn_priv *priv;
 	acpi_status status;
@@ -130,6 +134,22 @@ static int intel_vbtn_probe(struct platform_device *device)
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
