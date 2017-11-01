From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] platform/x86: dell-*wmi*: Relay failed initial probe to dependent drivers
Date: Wed,  1 Nov 2017 14:28:21 -0500
Message-ID: <bdaec2635c4c38e869a5690db2426d7440222949.1509564191.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

dell-wmi and dell-smbios-wmi are dependent upon dell-wmi-descriptor
finishing probe successfully to probe themselves.

Currently if dell-wmi-descriptor fails probing in a non-recoverable way
(such as invalid header) dell-wmi and dell-smbios-wmi will continue to
try to redo probing due to deferred probing.

To solve this have the dependent drivers query the dell-wmi-descriptor
driver whether the descriptor has been determined valid. The possible
results are:
-EPROBE_DEFER: Descriptor not yet probed, dependent driver should wait
 and use deferred probing
< 0: Descriptor probed, invalid.  Dependent driver should return an
 error.
0: Successful descriptor probe, dependent driver can continue

Successful descriptor probe still doesn't mean that the descriptor driver
is necessarily bound at the time of initialization of dependent driver.
Userspace can unbind the driver, so all methods used from driver
should still be verified to return success values otherwise deferred
probing be used.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
Note: this patch is intendended on top of the 16 patch series that
introduces WMI support.  At the time of this submission, v12 is the
latest submission of that series.

 drivers/platform/x86/dell-smbios-wmi.c     |  4 ++++
 drivers/platform/x86/dell-wmi-descriptor.c | 33 ++++++++++++++++++++++--------
 drivers/platform/x86/dell-wmi-descriptor.h |  7 +++++++
 drivers/platform/x86/dell-wmi.c            |  5 +++++
 4 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index 35c13815b24c..3fa53fa174b2 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -151,6 +151,10 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
 		return -ENODEV;
 
+	ret = dell_wmi_get_descriptor_valid();
+	if (ret)
+		return ret;
+
 	priv = devm_kzalloc(&wdev->dev, sizeof(struct wmi_smbios_priv),
 			    GFP_KERNEL);
 	if (!priv)
diff --git a/drivers/platform/x86/dell-wmi-descriptor.c b/drivers/platform/x86/dell-wmi-descriptor.c
index 3204c408e261..33c6c7d66f8c 100644
--- a/drivers/platform/x86/dell-wmi-descriptor.c
+++ b/drivers/platform/x86/dell-wmi-descriptor.c
@@ -26,9 +26,16 @@ struct descriptor_priv {
 	u32 interface_version;
 	u32 size;
 };
+static int descriptor_valid;
 static LIST_HEAD(wmi_list);
 static DEFINE_MUTEX(list_mutex);
 
+int dell_wmi_get_descriptor_valid(void)
+{
+	return descriptor_valid;
+}
+EXPORT_SYMBOL_GPL(dell_wmi_get_descriptor_valid);
+
 bool dell_wmi_get_interface_version(u32 *version)
 {
 	struct descriptor_priv *priv;
@@ -79,18 +86,17 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
 	union acpi_object *obj = NULL;
 	struct descriptor_priv *priv;
 	u32 *buffer;
-	int ret;
 
 	obj = wmidev_block_query(wdev, 0);
 	if (!obj) {
 		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
-		ret = -EIO;
+		descriptor_valid = -EIO;
 		goto out;
 	}
 
 	if (obj->type != ACPI_TYPE_BUFFER) {
 		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
-		ret = -EINVAL;
+		descriptor_valid = -EINVAL;
 		goto out;
 	}
 
@@ -101,7 +107,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
 		dev_err(&wdev->dev,
 			"Dell descriptor buffer has unexpected length (%d)\n",
 			obj->buffer.length);
-		ret = -EINVAL;
+		descriptor_valid = -EINVAL;
 		goto out;
 	}
 
@@ -110,7 +116,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
 	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
 		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
 			buffer);
-		ret = -EINVAL;
+		descriptor_valid = -EINVAL;
 		goto out;
 	}
 
@@ -123,7 +129,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
 
 	priv->interface_version = buffer[2];
 	priv->size = buffer[3];
-	ret = 0;
+	descriptor_valid = 0;
 	dev_set_drvdata(&wdev->dev, priv);
 	mutex_lock(&list_mutex);
 	list_add_tail(&priv->list, &wmi_list);
@@ -135,7 +141,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
 
 out:
 	kfree(obj);
-	return ret;
+	return descriptor_valid;
 }
 
 static int dell_wmi_descriptor_remove(struct wmi_device *wdev)
@@ -162,7 +168,18 @@ static struct wmi_driver dell_wmi_descriptor_driver = {
 	.id_table = dell_wmi_descriptor_id_table,
 };
 
-module_wmi_driver(dell_wmi_descriptor_driver);
+static int __init dell_wmi_descriptor_init(void)
+{
+	descriptor_valid = -EPROBE_DEFER;
+	return wmi_driver_register(&dell_wmi_descriptor_driver);
+}
+module_init(dell_wmi_descriptor_init);
+
+static void __exit dell_wmi_descriptor_exit(void)
+{
+	wmi_driver_unregister(&dell_wmi_descriptor_driver);
+}
+module_exit(dell_wmi_descriptor_exit);
 
 MODULE_ALIAS("wmi:" DELL_WMI_DESCRIPTOR_GUID);
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
diff --git a/drivers/platform/x86/dell-wmi-descriptor.h b/drivers/platform/x86/dell-wmi-descriptor.h
index 5f7b69c2c83a..776cddd5e135 100644
--- a/drivers/platform/x86/dell-wmi-descriptor.h
+++ b/drivers/platform/x86/dell-wmi-descriptor.h
@@ -15,6 +15,13 @@
 
 #define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
 
+/* possible return values:
+ *  -EPROBE_DEFER: probing for dell-wmi-descriptor not yet run
+ *  0: valid descriptor, successfully probed
+ *  < 0: invalid descriptor, don't probe dependent devices
+ */
+int dell_wmi_get_descriptor_valid(void);
+
 bool dell_wmi_get_interface_version(u32 *version);
 bool dell_wmi_get_size(u32 *size);
 
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 54321080a30d..bb7c1e681792 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -655,10 +655,15 @@ static int dell_wmi_events_set_enabled(bool enable)
 static int dell_wmi_probe(struct wmi_device *wdev)
 {
 	struct dell_wmi_priv *priv;
+	int ret;
 
 	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
 		return -ENODEV;
 
+	ret = dell_wmi_get_descriptor_valid();
+	if (ret)
+		return ret;
+
 	priv = devm_kzalloc(
 		&wdev->dev, sizeof(struct dell_wmi_priv), GFP_KERNEL);
 	if (!priv)
-- 
2.14.1
