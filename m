From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [RFC 6/9] platform/x86: huawei-wmi: Add battery charging thresholds
Date: Wed, 31 Jul 2019 13:52:52 -0400
Message-ID: <20190731175255.25676-7-ayman.bagabas@gmail.com>
References: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Implement battery charging thresholds functionality to be used with
sysfs interface support that is implemented in this series.

Setting battery charging thresholds can introduce a race condition where
two are trying to read/write values from/to EC memory. Even though a
mutex is used, this doesn't guarantee that these values will make it to
EC so a blocking sleep is necessary.

This sleep is enforced on the MACH-WX9 model since turning off battery
protection using (0,100) doesn't change the values in the EC memory,
instead it only disables the protection. So a workaround is to set the
thresholds to (0,0) before setting it to (0,100). This will ensure
that we update these values in EC memory and then turning it off with
(0,100). Thus, the msleep(1000).

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
In huawei_wmi_battery_get and later in huawei_wmi_fn_lock_get, 256 bytes
buffer is allocated dynamically on the stack. Now I know this is
discouraged, should it be changed to use kmalloc?

 drivers/platform/x86/huawei-wmi.c | 54 +++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 9013a05d2832..da3986cd0428 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -46,6 +47,7 @@ static struct quirk_entry *quirks;
 struct huawei_wmi_priv {
 	struct input_dev *idev[2];
 	struct led_classdev cdev;
+	struct mutex battery_lock;
 	struct mutex wmi_lock;
 	struct platform_device *pdev;
 };
@@ -298,6 +300,57 @@ static int huawei_wmi_leds_setup(struct device *dev)
 	return devm_led_classdev_register(dev, &priv->cdev);
 }
 
+/* Battery protection */
+
+static int huawei_wmi_battery_get(struct device *dev, int *low, int *high)
+{
+	struct huawei_wmi_priv *priv = dev_get_drvdata(dev);
+	u8 ret[0x100];
+	int err, i;
+
+	mutex_lock(&priv->battery_lock);
+	err = huawei_wmi_cmd(dev, BATTERY_THRESH_GET, ret, 0x100);
+	mutex_unlock(&priv->battery_lock);
+	if (err)
+		return err;
+
+	/* Find the last two non-zero values. Return status is ignored. */
+	i = 0x100;
+	do {
+		*low = ret[i-1];
+		*high = ret[i];
+	} while (i > 2 && !ret[i--]);
+
+	return 0;
+}
+
+static int huawei_wmi_battery_set(struct device *dev, int low, int high)
+{
+	struct huawei_wmi_priv *priv = dev_get_drvdata(dev);
+	u8 arg[8];
+	int err;
+
+	*(u64 *)arg = BATTERY_THRESH_SET;
+	arg[2] = low;
+	arg[3] = high;
+
+	/* This is an edge case were some models turn battery protection
+	 * off without changing their thresholds values. We clear the
+	 * values before turning off protection. Sometimes we need a sleep delay to
+	 * make sure these values make their way to EC memory.
+	 */
+	if (low == 0 && high == 100)
+		huawei_wmi_battery_set(dev, 0, 0);
+
+	mutex_lock(&priv->battery_lock);
+	err = huawei_wmi_cmd(dev, *(u64 *)arg, NULL, NULL);
+	if (quirks && quirks->battery_sleep)
+		msleep(1000);
+	mutex_unlock(&priv->battery_lock);
+
+	return err;
+}
+
 /* Input */
 
 static void huawei_wmi_process_key(struct input_dev *idev, int code)
@@ -418,6 +471,7 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
 		mutex_init(&priv->wmi_lock);
+		mutex_init(&priv->battery_lock);
 
 		err = huawei_wmi_leds_setup(&pdev->dev);
 		if (err) {
-- 
2.20.1
