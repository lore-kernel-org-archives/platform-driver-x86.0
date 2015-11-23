From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 1/2] toshiba_acpi: Add support for WWAN devices
Date: Mon, 23 Nov 2015 10:49:10 -0700
Message-ID: <1448300951-5492-2-git-send-email-coproscefalo@gmail.com>
References: <1448300951-5492-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448300951-5492-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>, Fabian Koester <fabian.koester@bringnow.com>, Azael Avalos <coproscefalo@gmail.comZZ>
List-Id: platform-driver-x86.vger.kernel.org

Toshiba laptops with WWAN devices installed cannot use the device unless
it is attached and powered, similar to how Toshiba Bluetooth devices
work.

This patch adds support to WWAN devices, introducing three functions,
one to query the overall status of the wireless devices (RFKill, WLAN,
BT, WWAN), the second queries WWAN support, and finally the third
(de)activates the device.

Signed-off-by: Fabian Koester <fabian.koester@bringnow.com>
Signed-off-by: Azael Avalos <coproscefalo@gmail.com>ZZ
---
 drivers/platform/x86/toshiba_acpi.c | 109 ++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index c013029..dfa760d 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -114,6 +114,7 @@ MODULE_LICENSE("GPL");
 #define HCI_VIDEO_OUT			0x001c
 #define HCI_HOTKEY_EVENT		0x001e
 #define HCI_LCD_BRIGHTNESS		0x002a
+#define HCI_WIRELESS			0x0056
 #define HCI_ACCELEROMETER		0x006d
 #define HCI_KBD_ILLUMINATION		0x0095
 #define HCI_ECO_MODE			0x0097
@@ -148,6 +149,10 @@ MODULE_LICENSE("GPL");
 #define SCI_KBD_MODE_ON			0x8
 #define SCI_KBD_MODE_OFF		0x10
 #define SCI_KBD_TIME_MAX		0x3c001a
+#define HCI_WIRELESS_STATUS		0x1
+#define HCI_WIRELESS_WWAN		0x3
+#define HCI_WIRELESS_WWAN_STATUS	0x2000
+#define HCI_WIRELESS_WWAN_POWER		0x4000
 #define SCI_USB_CHARGE_MODE_MASK	0xff
 #define SCI_USB_CHARGE_DISABLED		0x00
 #define SCI_USB_CHARGE_ALTERNATE	0x09
@@ -197,12 +202,14 @@ struct toshiba_acpi_dev {
 	unsigned int kbd_function_keys_supported:1;
 	unsigned int panel_power_on_supported:1;
 	unsigned int usb_three_supported:1;
+	unsigned int wwan_supported:1;
 	unsigned int sysfs_created:1;
 	unsigned int special_functions;
 
 	bool kbd_led_registered;
 	bool illumination_led_registered;
 	bool eco_led_registered;
+	bool killswitch;
 };
 
 static struct toshiba_acpi_dev *toshiba_acpi;
@@ -1085,6 +1092,104 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
 	return -EIO;
 }
 
+/* Wireless status (RFKill, WLAN, BT, WWAN) */
+static int toshiba_wireless_status(struct toshiba_acpi_dev *dev)
+{
+	u32 in[TCI_WORDS] = { HCI_GET, HCI_WIRELESS, 0, 0, 0, 0 };
+	u32 out[TCI_WORDS];
+	acpi_status status;
+
+	in[3] = HCI_WIRELESS_STATUS;
+	status = tci_raw(dev, in, out);
+
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI call to get Wireless status failed\n");
+		return -EIO;
+	}
+
+	if (out[0] == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	if (out[0] != TOS_SUCCESS)
+		return -EIO;
+
+	dev->killswitch = !!(out[2] & HCI_WIRELESS_STATUS);
+
+	return 0;
+}
+
+/* WWAN */
+static void toshiba_wwan_available(struct toshiba_acpi_dev *dev)
+{
+	u32 in[TCI_WORDS] = { HCI_GET, HCI_WIRELESS, 0, 0, 0, 0 };
+	u32 out[TCI_WORDS];
+	acpi_status status;
+
+	dev->wwan_supported = 0;
+
+	/*
+	 * WWAN support can be queried by setting the in[3] value to
+	 * HCI_WIRELESS_WWAN (0x03).
+	 *
+	 * If supported, out[0] contains TOS_SUCCESS and out[2] contains
+	 * HCI_WIRELESS_WWAN_STATUS (0x2000).
+	 *
+	 * If not supported, out[0] contains TOS_INPUT_DATA_ERROR (0x8300)
+	 * or TOS_NOT_SUPPORTED (0x8000).
+	 */
+	in[3] = HCI_WIRELESS_WWAN;
+	status = tci_raw(dev, in, out);
+
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI call to get WWAN status failed\n");
+		return;
+	}
+
+	if (out[0] != TOS_SUCCESS)
+		return;
+
+	dev->wwan_supported = (out[2] == HCI_WIRELESS_WWAN_STATUS);
+}
+
+static int toshiba_wwan_set(struct toshiba_acpi_dev *dev, u32 state)
+{
+	u32 in[TCI_WORDS] = { HCI_SET, HCI_WIRELESS, state, 0, 0, 0 };
+	u32 out[TCI_WORDS];
+	acpi_status status;
+
+	in[3] = HCI_WIRELESS_WWAN_STATUS;
+	status = tci_raw(dev, in, out);
+
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI call to set WWAN status failed\n");
+		return -EIO;
+	}
+
+	if (out[0] == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	if (out[0] != TOS_SUCCESS)
+		return -EIO;
+
+	/*
+	 * Some devices only need to call HCI_WIRELESS_WWAN_STATUS to
+	 * (de)activate the device, but some others need the
+	 * HCI_WIRELESS_WWAN_POWER call as well.
+	 */
+	in[3] = HCI_WIRELESS_WWAN_POWER;
+	status = tci_raw(dev, in, out);
+
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI call to set WWAN power failed\n");
+		return -EIO;
+	}
+
+	if (out[0] == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	return out[0] == TOS_SUCCESS ? 0 : -EIO;
+}
+
 /* Transflective Backlight */
 static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, u32 *status)
 {
@@ -2561,6 +2666,8 @@ static void print_supported_features(struct toshiba_acpi_dev *dev)
 		pr_cont(" panel-power-on");
 	if (dev->usb_three_supported)
 		pr_cont(" usb3");
+	if (dev->wwan_supported)
+		pr_cont(" wwan");
 
 	pr_cont("\n");
 }
@@ -2736,6 +2843,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = get_fan_status(dev, &dummy);
 	dev->fan_supported = !ret;
 
+	toshiba_wwan_available(dev);
+
 	print_supported_features(dev);
 
 	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
-- 
2.6.3
