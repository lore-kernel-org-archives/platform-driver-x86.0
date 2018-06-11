From: Chris Chiu <chiu@endlessm.com>
Subject: [PATCH v2 1/2] platform/x86: asus-wmi: Call led hw_changed API on kbd brightness change
Date: Mon, 11 Jun 2018 15:18:37 +0800
Message-ID: <20180611071838.47945-1-chiu@endlessm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: corentin.chary@gmail.com, dvhart@infradead.org, andy.shevchenko@gmail.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, hdegoede@redhat.com, linux@endlessm.com, Chris Chiu <chiu@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Make asus-wmi notify on hotkey kbd brightness changes, listen for
brightness events and update the brightness directly in the driver.
For this purpose, bound check on brightness in kbd_led_set must be
based on the same data type to prevent illegal value been set.

Update the brightness by led_classdev_notify_brightness_hw_changed.
This will allow userspace to monitor (poll) for brightness changes
on the LED without reporting via input keymapping.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 1f6e68f0b646..a18484f4bae3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -460,6 +460,7 @@ static void kbd_led_update(struct work_struct *work)
 		ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
 
 	asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
+	led_classdev_notify_brightness_hw_changed(&asus->kbd_led, asus->kbd_led_wk);
 }
 
 static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
@@ -497,9 +498,9 @@ static void kbd_led_set(struct led_classdev *led_cdev,
 
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
-	if (value > asus->kbd_led.max_brightness)
+	if ((int)value > (int)asus->kbd_led.max_brightness)
 		value = asus->kbd_led.max_brightness;
-	else if (value < 0)
+	else if ((int)value < 0)
 		value = 0;
 
 	asus->kbd_led_wk = value;
@@ -656,6 +657,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 
 		asus->kbd_led_wk = led_val;
 		asus->kbd_led.name = "asus::kbd_backlight";
+		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
 		asus->kbd_led.brightness_set = kbd_led_set;
 		asus->kbd_led.brightness_get = kbd_led_get;
 		asus->kbd_led.max_brightness = 3;
@@ -1745,6 +1747,15 @@ static void asus_wmi_notify(u32 value, void *context)
 		}
 	}
 
+	if (code == NOTIFY_KBD_BRTUP) {
+		kbd_led_set(&asus->kbd_led, asus->kbd_led_wk + 1);
+		goto exit;
+	}
+	if (code == NOTIFY_KBD_BRTDWN) {
+		kbd_led_set(&asus->kbd_led, asus->kbd_led_wk - 1);
+		goto exit;
+	}
+
 	if (is_display_toggle(code) &&
 	    asus->driver->quirks->no_display_toggle)
 		goto exit;
-- 
2.11.0
