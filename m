From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH v2 5/6] platform/x86: huawei-wmi: Add fn-lock support
Date: Wed, 18 Sep 2019 20:54:57 -0400
Message-ID: <20190919005505.23822-6-ayman.bagabas@gmail.com>
References: <20190919005505.23822-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919005505.23822-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Takashi Iwai <tiwai@suse.de>, Mattias Jacobsson <2pi@mok.nu>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Huawei Matebook laptops uses Fn key and toggle to access F1-F12 keys.
Along with that, there is this feature called fn-lock that inverts the
behavior of this Fn key and the F1-F12 row.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 85 +++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 231b5cce00db..48be55c6027e 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -59,6 +59,7 @@ struct huawei_wmi_debug {
 
 struct huawei_wmi {
 	bool battery_available;
+	bool fn_lock_available;
 
 	struct huawei_wmi_debug debug;
 	struct input_dev *idev[2];
@@ -515,6 +516,88 @@ static void huawei_wmi_battery_exit(struct device *dev)
 	}
 }
 
+/* Fn lock */
+
+static int huawei_wmi_fn_lock_get(int *on)
+{
+	u8 ret[0x100] = { 0 };
+	int err, i;
+
+	err = huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
+	if (err)
+		return err;
+
+	/* Find the first non-zero value. Return status is ignored. */
+	i = 1;
+	do {
+		if (on)
+			*on = ret[i] - 1; // -1 undefined, 0 off, 1 on.
+	} while (i < 0x100 && !ret[i++]);
+
+	return 0;
+}
+
+static int huawei_wmi_fn_lock_set(int on)
+{
+	union hwmi_arg arg;
+
+	arg.cmd = FN_LOCK_SET;
+	arg.args[2] = on + 1; // 0 undefined, 1 off, 2 on.
+
+	return huawei_wmi_cmd(arg.cmd, NULL, NULL);
+}
+
+static ssize_t fn_lock_state_show(struct device *dev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	int err, on;
+
+	err = huawei_wmi_fn_lock_get(&on);
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
+	err = huawei_wmi_fn_lock_set(on);
+	if (err)
+		return err;
+
+	return size;
+}
+
+static DEVICE_ATTR_RW(fn_lock_state);
+
+static void huawei_wmi_fn_lock_setup(struct device *dev)
+{
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
+
+	huawei->fn_lock_available = true;
+	if (huawei_wmi_fn_lock_get(NULL)) {
+		huawei->fn_lock_available = false;
+		return;
+	}
+
+	device_create_file(dev, &dev_attr_fn_lock_state);
+}
+
+static void huawei_wmi_fn_lock_exit(struct device *dev)
+{
+	if (huawei_wmi->fn_lock_available)
+		device_remove_file(dev, &dev_attr_fn_lock_state);
+}
+
 /* Input */
 
 static void huawei_wmi_process_key(struct input_dev *idev, int code)
@@ -638,6 +721,7 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 		mutex_init(&huawei_wmi->battery_lock);
 
 		huawei_wmi_leds_setup(&pdev->dev);
+		huawei_wmi_fn_lock_setup(&pdev->dev);
 		huawei_wmi_battery_setup(&pdev->dev);
 	}
 
@@ -657,6 +741,7 @@ static int huawei_wmi_remove(struct platform_device *pdev)
 
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
 		huawei_wmi_battery_exit(&pdev->dev);
+		huawei_wmi_fn_lock_exit(&pdev->dev);
 	}
 
 	return 0;
-- 
2.21.0
