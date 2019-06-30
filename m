From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [RFC 8/9] platform/x86: huawei-wmi: Add sysfs interface support
Date: Sun, 30 Jun 2019 01:41:07 -0400
Message-ID: <20190630054108.19205-9-ayman.bagabas@gmail.com>
References: <20190630054108.19205-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190630054108.19205-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ayman.bagabas@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Add sysfs interface to enable the use of battery charging thresholds and
fn-lock support introduced in this series.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 4159e10bda26..f7041fb71026 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/sysfs.h>
 #include <linux/wmi.h>
 
 /*
@@ -381,6 +382,80 @@ static int huawei_wmi_fn_lock_set(struct device *dev, int on)
 	return huawei_wmi_cmd(dev, *(u64 *)arg, NULL, NULL);
 }
 
+/* sysfs */
+
+static ssize_t charge_thresholds_show(struct device *dev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	int err, low, high;
+
+	err = huawei_wmi_battery_get(dev, &low, &high);
+	if (err)
+		return err;
+
+	return sprintf(buf, "%d %d\n", low, high);
+}
+
+static ssize_t charge_thresholds_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t size)
+{
+	int low, high, err;
+
+	if (sscanf(buf, "%d %d", &low, &high) != 2 ||
+			low < 0 || high > 100 ||
+			low > high)
+		return -EINVAL;
+
+	err = huawei_wmi_battery_set(dev, low, high);
+	if (err)
+		return err;
+
+	return size;
+}
+
+static ssize_t fn_lock_state_show(struct device *dev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	int err, on;
+
+	err = huawei_wmi_fn_lock_get(dev, &on);
+	if (err)
+		return err;
+
+	return sprintf(buf, "%d\n", on);
+}
+
+static ssize_t fn_lock_state_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t size)
+{
+	int on, err;
+
+	if (kstrtoint(buf, 10, &on) ||
+			on < 0 || on > 1)
+		return -EINVAL;
+
+	err = huawei_wmi_fn_lock_set(dev, on);
+	if (err)
+		return err;
+
+	return size;
+}
+
+static DEVICE_ATTR_RW(charge_thresholds);
+static DEVICE_ATTR_RW(fn_lock_state);
+
+static struct attribute *huawei_wmi_attrs[] = {
+	&dev_attr_charge_thresholds.attr,
+	&dev_attr_fn_lock_state.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(huawei_wmi);
+
 /* Input */
 
 static void huawei_wmi_process_key(struct input_dev *idev, int code)
@@ -508,6 +583,12 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to setup leds\n");
 			return err;
 		}
+
+		err = sysfs_create_groups(&pdev->dev.kobj, huawei_wmi_groups);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to create sysfs interface\n");
+			return err;
+		}
 	}
 
 	return 0;
@@ -522,6 +603,7 @@ static int huawei_wmi_remove(struct platform_device *pdev)
 		wmi_remove_notify_handler(HWMI_EVENT_GUID);
 
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+		sysfs_remove_groups(&pdev->dev.kobj, huawei_wmi_groups);
 	}
 
 	return 0;
-- 
2.20.1
