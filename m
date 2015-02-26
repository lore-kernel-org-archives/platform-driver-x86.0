From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/3] toshiba_acpi: Add Hotkey Event Type function and definitions
Date: Thu, 26 Feb 2015 10:57:12 -0700
Message-ID: <1424973434-3032-2-git-send-email-coproscefalo@gmail.com>
References: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch adds support to query the "Hotkey Event Type" the system
supports.

There are two main event types (so far), 0x10 and 0x11, with the
first beign all those laptops that have the old keyboard layout, and
the latter all those new laptops with the new keyboard layout.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index dbcb7a8..e6aa8f9 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -116,6 +116,7 @@ MODULE_LICENSE("GPL");
 #define HCI_KBD_ILLUMINATION		0x0095
 #define HCI_ECO_MODE			0x0097
 #define HCI_ACCELEROMETER2		0x00a6
+#define HCI_HOTKEY_EVENT_TYPE		0xc000
 #define SCI_PANEL_POWER_ON		0x010d
 #define SCI_ILLUMINATION		0x014e
 #define SCI_USB_SLEEP_CHARGE		0x0150
@@ -127,8 +128,11 @@ MODULE_LICENSE("GPL");
 
 /* field definitions */
 #define HCI_ACCEL_MASK			0x7fff
+#define HCI_HOTKEY_EVENT_NORMAL		0x10
+#define HCI_HOTKEY_EVENT_SPECIAL	0x11
 #define HCI_HOTKEY_DISABLE		0x0b
 #define HCI_HOTKEY_ENABLE		0x09
+#define HCI_HOTKEY_ENABLE_SPECIAL	0x10
 #define HCI_LCD_BRIGHTNESS_BITS		3
 #define HCI_LCD_BRIGHTNESS_SHIFT	(16-HCI_LCD_BRIGHTNESS_BITS)
 #define HCI_LCD_BRIGHTNESS_LEVELS	(1 << HCI_LCD_BRIGHTNESS_BITS)
@@ -1149,6 +1153,28 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
 	return 0;
 }
 
+/* Hotkey event type */
+static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
+					 u32 *hotkey_event_type)
+{
+	u32 val1 = 0x03;
+	u32 val2 = 0;
+	u32 result;
+
+	result = hci_read2(dev, HCI_HOTKEY_EVENT_TYPE, &val1, &val2);
+	if (result == TOS_FAILURE) {
+		pr_err("ACPI callto get Hotkey Event type failed\n");
+		return -EIO;
+	} else if (result == TOS_NOT_SUPPORTED) {
+		pr_info("Hotkey Event type not supported\n");
+		return -ENODEV;
+	}
+
+	*hotkey_event_type = val2;
+
+	return 0;
+}
+
 /* Bluetooth rfkill handlers */
 
 static u32 hci_get_bt_present(struct toshiba_acpi_dev *dev, bool *present)
-- 
2.2.2
