From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 2/2] toshiba_acpi: Add WWAN RFKill support
Date: Mon, 23 Nov 2015 10:49:11 -0700
Message-ID: <1448300951-5492-3-git-send-email-coproscefalo@gmail.com>
References: <1448300951-5492-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448300951-5492-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>, Fabian Koester <fabian.koester@bringnow.com>
List-Id: platform-driver-x86.vger.kernel.org

A previuos patch added WWAN support to the driver, allowing to query
and set the device status.

This patch adds RFKill support for the recently introduced WWAN device,
making use of the WWAN and *wireless_status functions to query the
killswitch and (de)activate the device accordingly to its status.

Signed-off-by: Fabian Koester <fabian.koester@bringnow.com>
Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 79 +++++++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index dfa760d..f65e003 100644
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
@@ -2347,6 +2349,67 @@ static const struct file_operations toshiba_acpi_fops = {
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
+	return toshiba_wwan_set(dev, !blocked);
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
@@ -2705,6 +2768,11 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 	if (dev->eco_led_registered)
 		led_classdev_unregister(&dev->eco_led);
 
+	if (dev->wwan_rfk) {
+		rfkill_unregister(dev->wwan_rfk);
+		rfkill_destroy(dev->wwan_rfk);
+	}
+
 	if (toshiba_acpi)
 		toshiba_acpi = NULL;
 
@@ -2844,6 +2912,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	dev->fan_supported = !ret;
 
 	toshiba_wwan_available(dev);
+	if (dev->wwan_supported)
+		toshiba_acpi_setup_wwan_rfkill(dev);
 
 	print_supported_features(dev);
 
@@ -2941,12 +3011,15 @@ static int toshiba_acpi_resume(struct device *device)
 	struct toshiba_acpi_dev *dev = acpi_driver_data(to_acpi_device(device));
 
 	if (dev->hotkey_dev) {
-		int error = toshiba_acpi_enable_hotkeys(dev);
-
-		if (error)
+		if (toshiba_acpi_enable_hotkeys(dev))
 			pr_info("Unable to re-enable hotkeys\n");
 	}
 
+	if (dev->wwan_rfk) {
+		if (!toshiba_wireless_status(dev))
+			rfkill_set_hw_state(dev->wwan_rfk, !dev->killswitch);
+	}
+
 	return 0;
 }
 #endif
-- 
2.6.3
