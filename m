From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 07/12] platform/x86: dell-wmi-smbios: Use Dell WMI descriptor check
Date: Thu, 21 Sep 2017 08:57:12 -0500
Message-ID: <1001812b63d73bf3ccd5ea6c76604cae0fa1525a.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The Dell WMI descriptor check is used as an indication that WMI
calls are safe to run both when used with the notification
ASL/GUID pair as well as the SMBIOS calling ASL/GUID pair.

As some code in dell-wmi-smbios is already a prerequisite for
dell-wmi, move the code for performing the descriptor check into
dell-wmi-smbios and let both drivers use it from there.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi-smbios.c | 78 ++++++++++++++++++++++++++++++++++
 drivers/platform/x86/dell-wmi-smbios.h |  3 ++
 drivers/platform/x86/dell-wmi.c        | 75 +-------------------------------
 3 files changed, 82 insertions(+), 74 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi-smbios.c b/drivers/platform/x86/dell-wmi-smbios.c
index c3701fdadf7b..9deb851ff517 100644
--- a/drivers/platform/x86/dell-wmi-smbios.c
+++ b/drivers/platform/x86/dell-wmi-smbios.c
@@ -24,6 +24,7 @@
 #include "dell-wmi-smbios.h"
 
 #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
+#define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
 
 struct calling_interface_structure {
 	struct dmi_header header;
@@ -217,8 +218,81 @@ static const struct attribute_group smbios_attribute_group = {
 	.attrs = smbios_attrs,
 };
 
+/*
+ * Descriptor buffer is 128 byte long and contains:
+ *
+ *       Name             Offset  Length  Value
+ * Vendor Signature          0       4    "DELL"
+ * Object Signature          4       4    " WMI"
+ * WMI Interface Version     8       4    <version>
+ * WMI buffer length        12       4    4096
+ */
+int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev, u32 *version)
+{
+	union acpi_object *obj = NULL;
+	struct wmi_device *desc_dev;
+	u32 *desc_buffer;
+	int ret;
+
+	desc_dev = wmidev_get_other_guid(wdev, DELL_DESCRIPTOR_GUID);
+	if (!desc_dev) {
+		dev_err(&wdev->dev, "Dell WMI descriptor does not exist\n");
+		return -ENODEV;
+	}
+
+	obj = wmidev_block_query(desc_dev, 0);
+	if (!obj) {
+		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
+		ret = -EIO;
+		goto out;
+	}
+
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (obj->buffer.length != 128) {
+		dev_err(&wdev->dev,
+			"Dell descriptor buffer has invalid length (%d)\n",
+			obj->buffer.length);
+		if (obj->buffer.length < 16) {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+	desc_buffer = (u32 *)obj->buffer.pointer;
+
+	if (desc_buffer[0] != 0x4C4C4544 && desc_buffer[1] != 0x494D5720)
+		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
+			8, desc_buffer);
+
+	if (desc_buffer[2] != 0 && desc_buffer[2] != 1)
+		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%d)\n",
+			desc_buffer[2]);
+
+	if (desc_buffer[3] != 4096)
+		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%d)\n",
+			desc_buffer[3]);
+
+	*version = desc_buffer[2];
+	ret = 0;
+
+	dev_info(&wdev->dev, "Detected Dell WMI interface version %u\n",
+		*version);
+
+out:
+	kfree(obj);
+	put_device(&desc_dev->dev);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dell_wmi_check_descriptor_buffer);
+
 static int dell_wmi_smbios_probe(struct wmi_device *wdev)
 {
+	u32 interface_version;
 	int ret;
 
 	dmi_walk(find_tokens, NULL);
@@ -228,6 +302,10 @@ static int dell_wmi_smbios_probe(struct wmi_device *wdev)
 		return -ENODEV;
 	}
 
+	ret = dell_wmi_check_descriptor_buffer(wdev, &interface_version);
+	if (ret)
+		return ret;
+
 	buffer = (void *)__get_free_page(GFP_KERNEL);
 	if (!buffer) {
 		ret = -ENOMEM;
diff --git a/drivers/platform/x86/dell-wmi-smbios.h b/drivers/platform/x86/dell-wmi-smbios.h
index e6e9990bb2b7..0521ec5d437b 100644
--- a/drivers/platform/x86/dell-wmi-smbios.h
+++ b/drivers/platform/x86/dell-wmi-smbios.h
@@ -17,6 +17,8 @@
 #ifndef _DELL_WMI_SMBIOS_H_
 #define _DELL_WMI_SMBIOS_H_
 
+#include <linux/wmi.h>
+
 struct notifier_block;
 
 struct calling_interface_buffer {
@@ -54,5 +56,6 @@ enum dell_laptop_notifier_actions {
 int dell_laptop_register_notifier(struct notifier_block *nb);
 int dell_laptop_unregister_notifier(struct notifier_block *nb);
 void dell_laptop_call_notifier(unsigned long action, void *data);
+int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev, u32 *version);
 
 #endif
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index e8b4d412eabc..e7011792127f 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -46,7 +46,6 @@ MODULE_DESCRIPTION("Dell laptop WMI hotkeys driver");
 MODULE_LICENSE("GPL");
 
 #define DELL_EVENT_GUID "9DBB5994-A997-11DA-B012-B622A1EF5492"
-#define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
 
 static bool wmi_requires_smbios_request;
 
@@ -617,78 +616,6 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
 	input_unregister_device(priv->input_dev);
 }
 
-/*
- * Descriptor buffer is 128 byte long and contains:
- *
- *       Name             Offset  Length  Value
- * Vendor Signature          0       4    "DELL"
- * Object Signature          4       4    " WMI"
- * WMI Interface Version     8       4    <version>
- * WMI buffer length        12       4    4096
- */
-static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
-{
-	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
-	union acpi_object *obj = NULL;
-	struct wmi_device *desc_dev;
-	u32 *buffer;
-	int ret;
-
-	desc_dev = wmidev_get_other_guid(wdev, DELL_DESCRIPTOR_GUID);
-	if (!desc_dev) {
-		dev_err(&wdev->dev, "Dell WMI descriptor does not exist\n");
-		return -ENODEV;
-	}
-
-	obj = wmidev_block_query(desc_dev, 0);
-	if (!obj) {
-		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
-		ret = -EIO;
-		goto out;
-	}
-
-	if (obj->type != ACPI_TYPE_BUFFER) {
-		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (obj->buffer.length != 128) {
-		dev_err(&wdev->dev,
-			"Dell descriptor buffer has invalid length (%d)\n",
-			obj->buffer.length);
-		if (obj->buffer.length < 16) {
-			ret = -EINVAL;
-			goto out;
-		}
-	}
-
-	buffer = (u32 *)obj->buffer.pointer;
-
-	if (buffer[0] != 0x4C4C4544 && buffer[1] != 0x494D5720)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
-			8, buffer);
-
-	if (buffer[2] != 0 && buffer[2] != 1)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%d)\n",
-			buffer[2]);
-
-	if (buffer[3] != 4096)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%d)\n",
-			buffer[3]);
-
-	priv->interface_version = buffer[2];
-	ret = 0;
-
-	dev_info(&wdev->dev, "Detected Dell WMI interface version %u\n",
-		priv->interface_version);
-
-out:
-	kfree(obj);
-	put_device(&desc_dev->dev);
-	return ret;
-}
-
 /*
  * According to Dell SMBIOS documentation:
  *
@@ -732,7 +659,7 @@ static int dell_wmi_probe(struct wmi_device *wdev)
 		return -ENOMEM;
 	dev_set_drvdata(&wdev->dev, priv);
 
-	err = dell_wmi_check_descriptor_buffer(wdev);
+	err = dell_wmi_check_descriptor_buffer(wdev, &priv->interface_version);
 	if (err)
 		return err;
 
-- 
2.14.1
