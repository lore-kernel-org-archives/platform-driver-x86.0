From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [RFC 9/9] platform/x86: huawei-wmi: Add debugfs support
Date: Wed, 31 Jul 2019 13:52:55 -0400
Message-ID: <20190731175255.25676-10-ayman.bagabas@gmail.com>
References: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Add a debugfs interface that can be used to call the WMI management
interface function.

The WMI interface takes a 64 bit integer and returns 256-260 bytes
buffer. This debugfs interface creates two files, one stores a 64 bit
int and the other calls the WMI interface and dumps out the returned
buffer.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 98 +++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index f7041fb71026..bdca8bd76c8c 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/input.h>
@@ -45,7 +46,13 @@ struct quirk_entry {
 
 static struct quirk_entry *quirks;
 
+struct huawei_wmi_debug {
+	struct dentry *root;
+	u64 arg;
+};
+
 struct huawei_wmi_priv {
+	struct huawei_wmi_debug debug;
 	struct input_dev *idev[2];
 	struct led_classdev cdev;
 	struct mutex battery_lock;
@@ -456,6 +463,94 @@ static struct attribute *huawei_wmi_attrs[] = {
 
 ATTRIBUTE_GROUPS(huawei_wmi);
 
+/* debugfs */
+
+static void huawei_wmi_debugfs_call_dump(struct seq_file *m, void *data,
+		union acpi_object *obj)
+{
+	struct huawei_wmi_priv *priv = m->private;
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
+		seq_puts(m, "{");
+		for (i = 0; i < obj->buffer.length; i++) {
+			seq_printf(m, "0x%02x", obj->buffer.pointer[i]);
+			if (i < obj->buffer.length - 1)
+				seq_puts(m, ",");
+		}
+		seq_puts(m, "}");
+		break;
+	case ACPI_TYPE_PACKAGE:
+		seq_puts(m, "[");
+		for (i = 0; i < obj->package.count; i++) {
+			huawei_wmi_debugfs_call_dump(m, priv, &obj->package.elements[i]);
+			if (i < obj->package.count - 1)
+				seq_puts(m, ",");
+		}
+		seq_puts(m, "]");
+		break;
+	default:
+		dev_err(&priv->pdev->dev, "Unexpected obj type, got %d\n", obj->type);
+		return;
+	}
+}
+
+static int huawei_wmi_debugfs_call_show(struct seq_file *m, void *data)
+{
+	struct huawei_wmi_priv *priv = m->private;
+	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer in;
+	union acpi_object *obj;
+	int err;
+
+	in.length = sizeof(u64);
+	in.pointer = &priv->debug.arg;
+
+	err = huawei_wmi_call(&priv->pdev->dev, &in, &out);
+	if (err)
+		return err;
+
+	obj = out.pointer;
+	if (!obj) {
+		err = -EIO;
+		goto fail_debugfs_call;
+	}
+
+	huawei_wmi_debugfs_call_dump(m, priv, obj);
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
+	struct huawei_wmi_priv *priv = dev_get_drvdata(dev);
+
+	debugfs_remove_recursive(priv->debug.root);
+}
+
+static void huawei_wmi_debugfs_setup(struct device *dev)
+{
+	struct huawei_wmi_priv *priv = dev_get_drvdata(dev);
+
+	priv->debug.root = debugfs_create_dir("huawei-wmi", NULL);
+
+	debugfs_create_x64("arg", 0644, priv->debug.root,
+		&priv->debug.arg);
+	debugfs_create_file("call", 0400,
+		priv->debug.root, priv, &huawei_wmi_debugfs_call_fops);
+}
+
 /* Input */
 
 static void huawei_wmi_process_key(struct input_dev *idev, int code)
@@ -589,6 +684,8 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to create sysfs interface\n");
 			return err;
 		}
+
+		huawei_wmi_debugfs_setup(&pdev->dev);
 	}
 
 	return 0;
@@ -603,6 +700,7 @@ static int huawei_wmi_remove(struct platform_device *pdev)
 		wmi_remove_notify_handler(HWMI_EVENT_GUID);
 
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+		huawei_wmi_debugfs_exit(&pdev->dev);
 		sysfs_remove_groups(&pdev->dev.kobj, huawei_wmi_groups);
 	}
 
-- 
2.20.1
