From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 2/2] toshiba_acpi: Add WWAN RFKill support
Date: Thu, 19 Nov 2015 08:49:25 -0700
Message-ID: <1447948165-2343-3-git-send-email-coproscefalo@gmail.com>
References: <1447948165-2343-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447948165-2343-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Fabian Koester <fabian.koester@bringnow.com>, Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

A previuos patch added WWAN support to the driver, allowing to query
and set the device status.

This patch adds RFKill support for the recently introduced WWAN device,
making use of the WWAN and *wireless_status functions to query the
killswitch and (de)activate the device accordingly to its status.

Signed-off-by: Fabian Koester <fabian.koester@bringnow.com>
Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 79 +++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 60d1ad9..d1315c5 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -51,6 +51,7 @@
 #include <linux/dmi.h>
 #include <linux/uaccess.h>
 #include <linux/miscdevice.h>
+#include <linux/rfkill.h>
 #include <linux/toshiba.h>
 #include <acpi/video.h>
 
@@ -174,6 +175,7 @@ struct toshiba_acpi_dev {
 	struct led_classdev kbd_led;
 	struct led_classdev eco_led;
 	struct miscdevice miscdev;
+	struct rfkill *wwan_rfk;
 
 	int force_fan;
 	int last_key_event;
@@ -2330,6 +2332,67 @@ static const struct file_operations toshiba_acpi_fops = {
 };
 
 /*
+ * WWAN RFKill handlers
+ */
+static int toshiba_acpi_wwan_set_block(void *data, bool blocked)
+{
+	struct toshiba_acpi_dev *dev = data;
+	int ret;
+
+	ret = toshiba_wireless_status(dev);
+	if (ret)
+		return ret;
+
+	if (!dev->killswitch)
+		return 0;
+
+	return toshiba_wwan_set(dev, blocked ? 0 : 1);
+}
+
+static void toshiba_acpi_wwan_poll(struct rfkill *rfkill, void *data)
+{
+	struct toshiba_acpi_dev *dev = data;
+
+	if (toshiba_wireless_status(dev))
+		return;
+
+	rfkill_set_hw_state(dev->wwan_rfk, !dev->killswitch);
+}
+
+static const struct rfkill_ops wwan_rfk_ops = {
+	.set_block = toshiba_acpi_wwan_set_block,
+	.poll = toshiba_acpi_wwan_poll,
+};
+
+static int toshiba_acpi_setup_wwan_rfkill(struct toshiba_acpi_dev *dev)
+{
+	int ret = toshiba_wireless_status(dev);
+
+	if (ret)
+		return ret;
+
+	dev->wwan_rfk = rfkill_alloc("Toshiba WWAN",
+				     &dev->acpi_dev->dev,
+				     RFKILL_TYPE_WWAN,
+				     &wwan_rfk_ops,
+				     dev);
+	if (!dev->wwan_rfk) {
+		pr_err("Unable to allocate WWAN rfkill device\n");
+		return -ENOMEM;
+	}
+
+	rfkill_set_hw_state(dev->wwan_rfk, !dev->killswitch);
+
+	ret = rfkill_register(dev->wwan_rfk);
+	if (ret) {
+		pr_err("Unable to register WWAN rfkill device\n");
+		rfkill_destroy(dev->wwan_rfk);
+	}
+
+	return ret;
+}
+
+/*
  * Hotkeys
  */
 static int toshiba_acpi_enable_hotkeys(struct toshiba_acpi_dev *dev)
@@ -2688,6 +2751,11 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 	if (dev->eco_led_registered)
 		led_classdev_unregister(&dev->eco_led);
 
+	if (dev->wwan_rfk) {
+		rfkill_unregister(dev->wwan_rfk);
+		rfkill_destroy(dev->wwan_rfk);
+	}
+
 	if (toshiba_acpi)
 		toshiba_acpi = NULL;
 
@@ -2827,6 +2895,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	dev->fan_supported = !ret;
 
 	toshiba_wwan_available(dev);
+	if (dev->wwan_supported)
+		toshiba_acpi_setup_wwan_rfkill(dev);
 
 	print_supported_features(dev);
 
@@ -2930,6 +3000,15 @@ static int toshiba_acpi_resume(struct device *device)
 			pr_info("Unable to re-enable hotkeys\n");
 	}
 
+	if (dev->wwan_rfk) {
+		int error = toshiba_wireless_status(dev);
+
+		if (error)
+			return error;
+
+		rfkill_set_hw_state(dev->wwan_rfk, !dev->killswitch);
+	}
+
 	return 0;
 }
 #endif
-- 
2.6.2
