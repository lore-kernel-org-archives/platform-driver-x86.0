From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH v2 8/8] platform/x86: huawei-wmi: add debugfs files support
Date: Wed, 12 Jun 2019 23:04:15 -0400
Message-ID: <20190613030416.25807-10-ayman.bagabas@gmail.com>
References: <20190613030416.25807-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613030416.25807-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ayman.bagabas@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

A debugfs interface that creates two attributes `arg` and `call` to set
an argument to be called by the WMI device and show the results
returned. This argument is a 64 bit long which complies the properties
of the HWMI interface.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 117 ++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index cc6745ff1bad..a74ddd9adb47 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/input.h>
@@ -46,8 +47,14 @@ struct quirk_entry {
 
 static struct quirk_entry *quirks;
 
+struct huawei_wmi_debug {
+	struct dentry *root;
+	u64 arg;
+};
+
 struct huawei_wmi {
 	struct led_classdev cdev;
+	struct huawei_wmi_debug debug;
 	struct input_dev *idev[2];
 	struct mutex wmi_lock;
 	struct mutex battery_lock;
@@ -463,6 +470,110 @@ static struct attribute *huawei_wmi_attrs[] = {
 
 ATTRIBUTE_GROUPS(huawei_wmi);
 
+/* debugfs */
+
+static void huawei_wmi_debugfs_call_dump(struct seq_file *m, void *data,
+		union acpi_object *obj)
+{
+	struct huawei_wmi *huawei = m->private;
+	int i;
+
+	switch (obj->type) {
+	case ACPI_TYPE_INTEGER:
+		seq_printf(m, "0x%llx", obj->integer.value);
+		break;
+	case ACPI_TYPE_STRING:
+		seq_printf(m, "\"%*s\"", obj->string.length, obj->string.pointer);
+		break;
+	case ACPI_TYPE_BUFFER:
+		seq_printf(m, "{");
+		for (i = 0; i < obj->buffer.length; i++) {
+			seq_printf(m, "0x%02x", obj->buffer.pointer[i]);
+			if (i < obj->buffer.length - 1)
+				seq_printf(m, ",");
+		}
+		seq_printf(m, "}");
+		break;
+	case ACPI_TYPE_PACKAGE:
+		seq_printf(m, "[");
+		for (i = 0; i < obj->package.count; i++) {
+			huawei_wmi_debugfs_call_dump(m, huawei, &obj->package.elements[i]);
+			if (i < obj->package.count - 1)
+				seq_printf(m, ",");
+		}
+		seq_printf(m, "]");
+		break;
+	default:
+		dev_err(&huawei->pdev->dev, "Unexpected obj type, got %d\n", obj->type);
+		return;
+	}
+}
+
+static int huawei_wmi_debugfs_call_show(struct seq_file *m, void *data)
+{
+	struct huawei_wmi *huawei = m->private;
+	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer in;
+	union acpi_object *obj;
+	int err;
+
+	in.length = sizeof(u64);
+	in.pointer = &huawei->debug.arg;
+
+	err = huawei_wmi_call(&huawei->pdev->dev, &in, &out);
+	if (err)
+		return err;
+
+	obj = out.pointer;
+	if (!obj) {
+		err = -EIO;
+		goto fail_debugfs_call;
+	}
+
+	huawei_wmi_debugfs_call_dump(m, huawei, obj);
+
+fail_debugfs_call:
+	kfree(out.pointer);
+	return err;
+}
+
+DEFINE_SHOW_ATTRIBUTE(huawei_wmi_debugfs_call);
+
+static void huawei_wmi_debugfs_exit(struct device *dev)
+{
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
+
+	debugfs_remove_recursive(huawei->debug.root);
+}
+
+static int huawei_wmi_debugfs_init(struct device *dev)
+{
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
+	struct dentry *dent;
+
+	huawei->debug.root = debugfs_create_dir("huawei-wmi", NULL);
+	if (!huawei->debug.root) {
+		dev_err(dev, "Failed to create debugfs directory\n");
+		goto fail_debugfs;
+	}
+
+	dent = debugfs_create_x64("arg", S_IRUGO | S_IWUSR, huawei->debug.root,
+			&huawei->debug.arg);
+	if (!dent)
+		goto fail_debugfs;
+
+	dent = debugfs_create_file("call", S_IFREG | S_IRUSR,
+			huawei->debug.root, huawei, &huawei_wmi_debugfs_call_fops);
+	if (!dent)
+		goto fail_debugfs;
+
+	return 0;
+
+fail_debugfs:
+	huawei_wmi_debugfs_exit(dev);
+	return -ENOMEM;
+}
+
 /* Input */
 
 static void huawei_wmi_process_key(struct input_dev *idev, int code)
@@ -597,7 +708,12 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 		err = huawei_wmi_leds_setup(&pdev->dev);
 		if (err)
 			dev_err(&pdev->dev, "Failed to setup leds\n");
+
+		err = huawei_wmi_debugfs_init(&pdev->dev);
+		if (err)
+			dev_err(&pdev->dev, "Failed to setup debugfs\n");
 	}
+
 	return 0;
 }
 
@@ -610,6 +726,7 @@ static int huawei_wmi_remove(struct platform_device *pdev)
 		wmi_remove_notify_handler(HWMI_EVENT_GUID);
 
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+		huawei_wmi_debugfs_exit(&pdev->dev);
 		sysfs_remove_group(&pdev->dev.kobj, &huawei_wmi_group);
 	}
 
-- 
2.20.1
