From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v7 13/15] platform/x86: wmi: Add sysfs attribute for required_buffer_size
Date: Wed, 11 Oct 2017 11:27:39 -0500
Message-ID: <d2b85005e155e607cdfbe54d0cd4c9936aa6d831.1507733291.git.mario.limonciello@dell.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507733291.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507733291.git.mario.limonciello@dell.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Method type WMI objects need to be able to describe the size of
the interface that they will expect to use.

Export this information to sysfs and allow vendor drivers to
set it.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/wmi.c | 31 +++++++++++++++++++++++++++++++
 include/linux/wmi.h        |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index bcb41c1c7f52..63d01f98bf4c 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -72,6 +72,7 @@ struct wmi_block {
 	struct acpi_device *acpi_device;
 	wmi_notify_handler handler;
 	void *handler_data;
+	u64 req_buf_size;
 
 	bool read_takes_no_args;
 };
@@ -188,6 +189,26 @@ static acpi_status wmi_method_enable(struct wmi_block *wblock, int enable)
 /*
  * Exported WMI functions
  */
+
+/**
+ * set_required_buffer_size - Sets the buffer size needed for performing IOCTL
+ * @wdev: A wmi bus device from a driver
+ * @instance: Instance index
+ *
+ * Allocates memory needed for buffer, stores the buffer size in that memory
+ */
+int set_required_buffer_size(struct wmi_device *wdev, u8 instance, u64 length)
+{
+	struct wmi_block *wblock;
+
+	wblock = container_of(wdev, struct wmi_block, dev);
+	if (!wblock)
+		return -ENODEV;
+	wblock->req_buf_size = length;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(set_required_buffer_size);
+
 /**
  * wmi_evaluate_method - Evaluate a WMI method
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
@@ -718,8 +739,18 @@ static struct attribute *wmi_data_attrs[] = {
 };
 ATTRIBUTE_GROUPS(wmi_data);
 
+static ssize_t required_buffer_size_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct wmi_block *wblock = dev_to_wblock(dev);
+
+	return sprintf(buf, "%lld\n", wblock->req_buf_size);
+}
+static DEVICE_ATTR_RO(required_buffer_size);
+
 static struct attribute *wmi_method_attrs[] = {
 	&dev_attr_object_id.attr,
+	&dev_attr_required_buffer_size.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(wmi_method);
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index ddee427e0721..a9a72a4c5ed8 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -36,6 +36,9 @@ extern acpi_status wmidev_evaluate_method(struct wmi_device *wdev,
 extern union acpi_object *wmidev_block_query(struct wmi_device *wdev,
 					     u8 instance);
 
+extern int set_required_buffer_size(struct wmi_device *wdev, u8 instance,
+				    u64 length);
+
 struct wmi_device_id {
 	const char *guid_string;
 };
-- 
2.14.1
