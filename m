From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] platform/x86: dell-smbios-wmi: Disable userspace interface if missing hotfix
Date: Thu, 16 Nov 2017 14:48:30 -0600
Message-ID: <1510865310-19893-1-git-send-email-mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:63060 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S934239AbdKPUuJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2017 15:50:09 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>

The Dell SMBIOS WMI interface will fail for some more complex calls unless
a WMI hotfix has been included.  Most platforms have this fix available in
a maintenance BIOS release.  In the case the driver is loaded on a
platform without this fix, disable the userspace interface.

A hotfix indicator is present in the dell-wmi-descriptor that represents
whether or not more complex calls will work properly.

"Simple" calls such as those used by dell-laptop and dell-wmi will continue
to work properly so dell-smbios-wmi should not be blocked from binding and
being used as the dell-smbios dispatcher.

Suggested-by: Girish Prakash <girish.prakash@dell.com>
Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios-wmi.c     | 14 ++++++++++++++
 drivers/platform/x86/dell-wmi-descriptor.c | 26 ++++++++++++++++++++++++--
 drivers/platform/x86/dell-wmi-descriptor.h |  1 +
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index 8ad11ef..a296551 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -147,9 +147,12 @@ static long dell_smbios_wmi_filter(struct wmi_device *wdev, unsigned int cmd,
 
 static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 {
+	struct wmi_driver *wdriver =
+		container_of(wdev->dev.driver, struct wmi_driver, driver);
 	struct wmi_smbios_priv *priv;
 	int count;
 	int ret;
+	u32 hotfix;
 
 	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
 		return -ENODEV;
@@ -167,6 +170,16 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	if (!dell_wmi_get_size(&priv->req_buf_size))
 		return -EPROBE_DEFER;
 
+	/* some SMBIOS calls fail unless BIOS contains hotfix */
+	if (!dell_wmi_get_hotfix(&hotfix))
+		return -EPROBE_DEFER;
+	if (!hotfix) {
+		dev_warn(&wdev->dev,
+			"WMI SMBIOS userspace interface not supported (%u)\n",
+			hotfix);
+		wdriver->filter_callback = NULL;
+	}
+
 	/* add in the length object we will use internally with ioctl */
 	priv->req_buf_size += sizeof(u64);
 	ret = set_required_buffer_size(wdev, priv->req_buf_size);
@@ -184,6 +197,7 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	if (ret)
 		goto fail_register;
 
+
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 	mutex_lock(&list_mutex);
diff --git a/drivers/platform/x86/dell-wmi-descriptor.c b/drivers/platform/x86/dell-wmi-descriptor.c
index e7f4c3a..5083ce0 100644
--- a/drivers/platform/x86/dell-wmi-descriptor.c
+++ b/drivers/platform/x86/dell-wmi-descriptor.c
@@ -25,6 +25,7 @@ struct descriptor_priv {
 	struct list_head list;
 	u32 interface_version;
 	u32 size;
+	u32 hotfix;
 };
 static int descriptor_valid = -EPROBE_DEFER;
 static LIST_HEAD(wmi_list);
@@ -72,6 +73,24 @@ bool dell_wmi_get_size(u32 *size)
 }
 EXPORT_SYMBOL_GPL(dell_wmi_get_size);
 
+bool dell_wmi_get_hotfix(u32 *hotfix)
+{
+	struct descriptor_priv *priv;
+	bool ret = false;
+
+	mutex_lock(&list_mutex);
+	priv = list_first_entry_or_null(&wmi_list,
+					struct descriptor_priv,
+					list);
+	if (priv) {
+		*hotfix = priv->hotfix;
+		ret = true;
+	}
+	mutex_unlock(&list_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dell_wmi_get_hotfix);
+
 /*
  * Descriptor buffer is 128 byte long and contains:
  *
@@ -80,6 +99,7 @@ EXPORT_SYMBOL_GPL(dell_wmi_get_size);
  * Object Signature          4       4    " WMI"
  * WMI Interface Version     8       4    <version>
  * WMI buffer length        12       4    <length>
+ * WMI hotfix number        16       4    <hotfix>
  */
 static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
 {
@@ -139,15 +159,17 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
 
 	priv->interface_version = buffer[2];
 	priv->size = buffer[3];
+	priv->hotfix = buffer[4];
 	ret = 0;
 	dev_set_drvdata(&wdev->dev, priv);
 	mutex_lock(&list_mutex);
 	list_add_tail(&priv->list, &wmi_list);
 	mutex_unlock(&list_mutex);
 
-	dev_dbg(&wdev->dev, "Detected Dell WMI interface version %lu and buffer size %lu\n",
+	dev_dbg(&wdev->dev, "Detected Dell WMI interface version %lu, buffer size %lu, hotfix %lu\n",
 		(unsigned long) priv->interface_version,
-		(unsigned long) priv->size);
+		(unsigned long) priv->size,
+		(unsigned long) priv->hotfix);
 
 out:
 	kfree(obj);
diff --git a/drivers/platform/x86/dell-wmi-descriptor.h b/drivers/platform/x86/dell-wmi-descriptor.h
index 776cddd..217b833 100644
--- a/drivers/platform/x86/dell-wmi-descriptor.h
+++ b/drivers/platform/x86/dell-wmi-descriptor.h
@@ -24,5 +24,6 @@ int dell_wmi_get_descriptor_valid(void);
 
 bool dell_wmi_get_interface_version(u32 *version);
 bool dell_wmi_get_size(u32 *size);
+bool dell_wmi_get_hotfix(u32 *hotfix);
 
 #endif
-- 
2.7.4
