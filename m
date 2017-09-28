From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v3 3/8] platform/x86: dell-wmi-smbios: Use Dell WMI descriptor check
Date: Wed, 27 Sep 2017 23:02:15 -0500
Message-ID: <bea602b33e27facc77ee850ef14dfa37f6894275.1506571188.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The Dell WMI descriptor check is used as an indication that WMI
calls are safe to run both when used with the notification
ASL/GUID pair as well as the SMBIOS calling ASL/GUID pair.

As some code in dell-wmi-smbios is already a prerequisite for
dell-wmi, move the code for performing the descriptor check into
dell-wmi-smbios and let both drivers use it from there.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios.c | 81 ++++++++++++++++++++++++++++++++++++++
 drivers/platform/x86/dell-smbios.h |  3 ++
 drivers/platform/x86/dell-wmi.c    | 75 +----------------------------------
 3 files changed, 85 insertions(+), 74 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 4472817ee045..5d793b012e5e 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -31,6 +31,7 @@
 #endif
 
 #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
+#define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
 
 struct calling_interface_structure {
 	struct dmi_header header;
@@ -226,8 +227,87 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
 	}
 }
 
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
+
 static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 {
+	int ret;
+	u32 interface_version;
+
+	ret = dell_wmi_check_descriptor_buffer(wdev, &interface_version);
+	if (ret)
+		return -ENODEV;
+
 	/* no longer need the SMI page */
 	free_page((unsigned long)buffer);
 
@@ -236,6 +316,7 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	if (!buffer)
 		return -ENOMEM;
 	bufferlen = sizeof(struct wmi_calling_interface_buffer);
+
 	wmi_dev = wdev;
 	return 0;
 }
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index 2f6fce81ee69..be9ec1ccf8bf 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -17,6 +17,8 @@
 #ifndef _DELL_SMBIOS_H_
 #define _DELL_SMBIOS_H_
 
+#include <linux/wmi.h>
+
 struct notifier_block;
 
 /* If called through fallback SMI rather than WMI this structure will be
@@ -62,5 +64,6 @@ enum dell_laptop_notifier_actions {
 int dell_laptop_register_notifier(struct notifier_block *nb);
 int dell_laptop_unregister_notifier(struct notifier_block *nb);
 void dell_laptop_call_notifier(unsigned long action, void *data);
+int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev, u32 *version);
 
 #endif
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 1fbef560ca67..b3bb8cdd27bf 100644
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
