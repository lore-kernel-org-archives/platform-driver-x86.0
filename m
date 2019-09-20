From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH v3 6/6] platform/x86: huawei-wmi: Add debugfs support
Date: Thu, 19 Sep 2019 20:39:11 -0400
Message-ID: <20190920003938.21617-7-ayman.bagabas@gmail.com>
References: <20190920003938.21617-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920003938.21617-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sinan Kaya <okaya@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Takashi Iwai <tiwai@suse.de>, Ayman Bagabas <ayman.bagabas@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>, Matan Ziv-Av <matan@svgalib.org>, Hans de Goede <hdegoede@redhat.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Peng Hao <peng.hao2@zte.com.cn>, Krzysztof Kozlowski <krzk@kernel.org>, Mattias Jacobsson <2pi@mok.nu>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add a debugfs interface that can be used to call the WMI management
interface function if available.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 8fc11a296357..c8f41121160c 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/input.h>
@@ -598,6 +599,94 @@ static void huawei_wmi_fn_lock_exit(struct device *dev)
 		device_remove_file(dev, &dev_attr_fn_lock_state);
 }
 
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
+			huawei_wmi_debugfs_call_dump(m, huawei, &obj->package.elements[i]);
+			if (i < obj->package.count - 1)
+				seq_puts(m, ",");
+		}
+		seq_puts(m, "]");
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
+	err = huawei_wmi_call(&in, &out);
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
+static void huawei_wmi_debugfs_setup(struct device *dev)
+{
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
+
+	huawei->debug.root = debugfs_create_dir("huawei-wmi", NULL);
+
+	debugfs_create_x64("arg", 0644, huawei->debug.root,
+		&huawei->debug.arg);
+	debugfs_create_file("call", 0400,
+		huawei->debug.root, huawei, &huawei_wmi_debugfs_call_fops);
+}
+
+static void huawei_wmi_debugfs_exit(struct device *dev)
+{
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
+
+	debugfs_remove_recursive(huawei->debug.root);
+}
+
 /* Input */
 
 static void huawei_wmi_process_key(struct input_dev *idev, int code)
@@ -723,6 +812,7 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 		huawei_wmi_leds_setup(&pdev->dev);
 		huawei_wmi_fn_lock_setup(&pdev->dev);
 		huawei_wmi_battery_setup(&pdev->dev);
+		huawei_wmi_debugfs_setup(&pdev->dev);
 	}
 
 	return 0;
@@ -740,6 +830,7 @@ static int huawei_wmi_remove(struct platform_device *pdev)
 	}
 
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+		huawei_wmi_debugfs_exit(&pdev->dev);
 		huawei_wmi_battery_exit(&pdev->dev);
 		huawei_wmi_fn_lock_exit(&pdev->dev);
 	}
-- 
2.21.0
