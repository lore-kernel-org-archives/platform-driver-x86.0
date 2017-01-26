From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 1/1] asus-wireless: Use the correct HSWC parameter for each HID
Date: Thu, 26 Jan 2017 10:00:31 -0500
Message-ID: <20170126150031.11840-2-jprvita@endlessm.com>
References: <20170126150031.11840-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:34908 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752741AbdAZPAl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Jan 2017 10:00:41 -0500
In-Reply-To: <20170126150031.11840-1-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

Some Asus machines use 0x4/0x5 as their LED on/off values, while others use
0x0/0x1, as shown in the DSDT exerpts below (note "Arg0 == 0x02", used to get
the LED status). Luckly it seems this behavior is tied to different HIDs, after
looking at 44 DSDTs from different Asus models.

Another small difference (not shown here) is that a few machines call GWBL
instead of OWGS, and SWBL instead of OWGD. That does not seem to make a
difference for asus-wireless, and is a reason to not try to call these methods
directly.

Device (ASHS)                       | Device (ASHS)
{                                   | {
    Name (_HID, "ATK4002")          |     Name (_HID, "ATK4001")
    Method (HSWC, 1, Serialized)    |     Method (HSWC, 1, Serialized)
    {                               |     {
        If ((Arg0 < 0x02))          |         If ((Arg0 < 0x02))
        {                           |         {
            OWGD (Arg0)             |             OWGD (Arg0)
            Return (One)            |             Return (One)
        }                           |         }
        If ((Arg0 == 0x02))         |
        {                           |         If ((Arg0 == 0x02))
            Local0 = OWGS ()        |         {
            If (Local0)             |             Return (OWGS ())
            {                       |         }
                    Return (0x05)   |
            }                       |         If ((Arg0 == 0x03))
            Else                    |         {
            {                       |             Return (0xFF)
                    Return (0x04)   |         }
            }                       |
        }                           |         If ((Arg0 == 0x80))
        If ((Arg0 == 0x03))         |         {
        {                           |            Return (One)
            Return (0xFF)           |         }
        }                           |     }
        If ((Arg0 == 0x04))         |     Method (_STA, 0, NotSerialized)
        {                           |     {
            OWGD (Zero)             |         If ((MSOS () >= OSW8))
            Return (One)            |         {
        }                           |             Return (0x0F)
        If ((Arg0 == 0x05))         |         }
        {                           |         Else
            OWGD (One)              |         {
            Return (One)            |             Return (Zero)
        }                           |         }
        If ((Arg0 == 0x80))         |     }
        {                           | }
            Return (One)            |
        }                           |
    }                               |
    Method (_STA, 0, NotSerialized) |
    {                               |
        If ((MSOS () >= OSW8))      |
        {                           |
            Return (0x0F)           |
        }                           |
        Else                        |
        {                           |
            Return (Zero)           |
        }                           |
    }                               |
}                                   |

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-wireless.c | 46 ++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
index c9b5ac152cf1..5a238fad35fb 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -18,18 +18,35 @@
 #include <linux/leds.h>
 
 #define ASUS_WIRELESS_LED_STATUS 0x2
-#define ASUS_WIRELESS_LED_OFF 0x4
-#define ASUS_WIRELESS_LED_ON 0x5
+
+struct hswc_params {
+	u8 on;
+	u8 off;
+};
 
 struct asus_wireless_data {
 	struct input_dev *idev;
 	struct acpi_device *adev;
+	const struct hswc_params *hswc_params;
 	struct workqueue_struct *wq;
 	struct work_struct led_work;
 	struct led_classdev led;
 	int led_state;
 };
 
+/* LED ON/OFF values for different HIDs. Please update when adding new HIDs. */
+static const struct hswc_params id_params[] = {
+	{ 0x0, 0x1 },
+	{ 0x5, 0x4 },
+};
+
+static const struct acpi_device_id device_ids[] = {
+	{"ATK4001", 0},
+	{"ATK4002", 0},
+	{"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, device_ids);
+
 static u64 asus_wireless_method(acpi_handle handle, const char *method,
 				int param)
 {
@@ -62,7 +79,7 @@ static enum led_brightness led_state_get(struct led_classdev *led)
 	data = container_of(led, struct asus_wireless_data, led);
 	s = asus_wireless_method(acpi_device_handle(data->adev), "HSWC",
 				 ASUS_WIRELESS_LED_STATUS);
-	if (s == ASUS_WIRELESS_LED_ON)
+	if (s == data->hswc_params->on)
 		return LED_FULL;
 	return LED_OFF;
 }
@@ -82,8 +99,8 @@ static void led_state_set(struct led_classdev *led,
 	struct asus_wireless_data *data;
 
 	data = container_of(led, struct asus_wireless_data, led);
-	data->led_state = value == LED_OFF ? ASUS_WIRELESS_LED_OFF :
-					     ASUS_WIRELESS_LED_ON;
+	data->led_state = value == LED_OFF ? data->hswc_params->off :
+					     data->hswc_params->on;
 	queue_work(data->wq, &data->led_work);
 }
 
@@ -104,13 +121,22 @@ static void asus_wireless_notify(struct acpi_device *adev, u32 event)
 static int asus_wireless_add(struct acpi_device *adev)
 {
 	struct asus_wireless_data *data;
-	int err;
+	const char *hid;
+	int err, i;
 
 	data = devm_kzalloc(&adev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 	adev->driver_data = data;
 
+	hid = acpi_device_hid(adev);
+	for (i = 0; strcmp(device_ids[i].id, ""); i++) {
+		if (!strcmp(device_ids[i].id, hid)) {
+			data->hswc_params = &id_params[i];
+			break;
+		}
+	}
+
 	data->idev = devm_input_allocate_device(&adev->dev);
 	if (!data->idev)
 		return -ENOMEM;
@@ -137,6 +163,7 @@ static int asus_wireless_add(struct acpi_device *adev)
 	err = devm_led_classdev_register(&adev->dev, &data->led);
 	if (err)
 		destroy_workqueue(data->wq);
+
 	return err;
 }
 
@@ -149,13 +176,6 @@ static int asus_wireless_remove(struct acpi_device *adev)
 	return 0;
 }
 
-static const struct acpi_device_id device_ids[] = {
-	{"ATK4001", 0},
-	{"ATK4002", 0},
-	{"", 0},
-};
-MODULE_DEVICE_TABLE(acpi, device_ids);
-
 static struct acpi_driver asus_wireless_driver = {
 	.name = "Asus Wireless Radio Control Driver",
 	.class = "hotkey",
-- 
2.11.0
