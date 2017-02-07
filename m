From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCHv2] platform/x86: asus-wireless: Use per-HID HSWC parameters
Date: Tue,  7 Feb 2017 16:45:10 -0500
Message-ID: <20170207214510.23367-1-jprvita@endlessm.com>
References: <CA+A7VXXM+n-=FCYXiL-nn_CgeRRr5XOC66f8+e4MFYpcO345AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+A7VXXM+n-=FCYXiL-nn_CgeRRr5XOC66f8+e4MFYpcO345AA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Some Asus machines use 0x4/0x5 as their LED on/off values, while others
use 0x0/0x1, as shown in the DSDT excerpts below. Luckily it seems this
behavior is tied to different HIDs, after looking at 44 DSDTs from
different Asus models.

Another small difference is that a few of them call GWBL instead of
OWGS, and SWBL instead of OWGD. That does not seem to make a difference
for asus-wireless, and is additional reasoning to not try to call these
methods directly.

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
 drivers/platform/x86/asus-wireless.c | 57 ++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
index a7ee18383146..f3796164329e 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -17,19 +17,41 @@
 #include <linux/pci_ids.h>
 #include <linux/leds.h>
 
-#define ASUS_WIRELESS_LED_STATUS 0x2
-#define ASUS_WIRELESS_LED_OFF 0x4
-#define ASUS_WIRELESS_LED_ON 0x5
+struct hswc_params {
+	u8 on;
+	u8 off;
+	u8 status;
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
 
+static const struct hswc_params atk4001_id_params = {
+	.on = 0x0,
+	.off = 0x1,
+	.status = 0x2,
+};
+
+static const struct hswc_params atk4002_id_params = {
+	.on = 0x5,
+	.off = 0x4,
+	.status = 0x2,
+};
+
+static const struct acpi_device_id device_ids[] = {
+	{"ATK4001", (kernel_ulong_t)&atk4001_id_params},
+	{"ATK4002", (kernel_ulong_t)&atk4002_id_params},
+	{"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, device_ids);
+
 static u64 asus_wireless_method(acpi_handle handle, const char *method,
 				int param)
 {
@@ -61,8 +83,8 @@ static enum led_brightness led_state_get(struct led_classdev *led)
 
 	data = container_of(led, struct asus_wireless_data, led);
 	s = asus_wireless_method(acpi_device_handle(data->adev), "HSWC",
-				 ASUS_WIRELESS_LED_STATUS);
-	if (s == ASUS_WIRELESS_LED_ON)
+				 data->hswc_params->status);
+	if (s == data->hswc_params->on)
 		return LED_FULL;
 	return LED_OFF;
 }
@@ -81,8 +103,8 @@ static void led_state_set(struct led_classdev *led, enum led_brightness value)
 	struct asus_wireless_data *data;
 
 	data = container_of(led, struct asus_wireless_data, led);
-	data->led_state = value == LED_OFF ? ASUS_WIRELESS_LED_OFF :
-					     ASUS_WIRELESS_LED_ON;
+	data->led_state = value == LED_OFF ? data->hswc_params->off :
+					     data->hswc_params->on;
 	queue_work(data->wq, &data->led_work);
 }
 
@@ -103,12 +125,14 @@ static void asus_wireless_notify(struct acpi_device *adev, u32 event)
 static int asus_wireless_add(struct acpi_device *adev)
 {
 	struct asus_wireless_data *data;
+	const struct acpi_device_id *id;
 	int err;
 
 	data = devm_kzalloc(&adev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 	adev->driver_data = data;
+	data->adev = adev;
 
 	data->idev = devm_input_allocate_device(&adev->dev);
 	if (!data->idev)
@@ -123,7 +147,16 @@ static int asus_wireless_add(struct acpi_device *adev)
 	if (err)
 		return err;
 
-	data->adev = adev;
+	for (id = device_ids; id->id[0]; id++) {
+		if (!strcmp((char *) id->id, acpi_device_hid(adev))) {
+			data->hswc_params =
+				(const struct hswc_params *)id->driver_data;
+			break;
+		}
+	}
+	if (!data->hswc_params)
+		return 0;
+
 	data->wq = create_singlethread_workqueue("asus_wireless_workqueue");
 	if (!data->wq)
 		return -ENOMEM;
@@ -136,6 +169,7 @@ static int asus_wireless_add(struct acpi_device *adev)
 	err = devm_led_classdev_register(&adev->dev, &data->led);
 	if (err)
 		destroy_workqueue(data->wq);
+
 	return err;
 }
 
@@ -148,13 +182,6 @@ static int asus_wireless_remove(struct acpi_device *adev)
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
