From: Chris Chiu <chiu@endlessm.com>
Subject: [PATCH 1/2] platform/x86: asus-wmi: Call new led hw_changed API on kbd brightness change
Date: Mon,  4 Jun 2018 20:32:37 +0800
Message-ID: <20180604123238.82200-1-chiu@endlessm.com>
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
 drivers/platform/x86/asus-nb-wmi.c |  2 --
 drivers/platform/x86/asus-wmi.c    | 21 +++++++++++++++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 136ff2b4cce5..7ce80e4bb5a3 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -493,8 +493,6 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0xA6, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV + HDMI */
 	{ KE_KEY, 0xA7, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + HDMI */
 	{ KE_KEY, 0xB5, { KEY_CALC } },
-	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
-	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
 	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
 	{ KE_END, 0},
 };
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 1f6e68f0b646..b4915b7718c1 100644
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
@@ -1700,6 +1702,13 @@ static int is_display_toggle(int code)
 	return 0;
 }
 
+static int is_kbd_led_event(int code)
+{
+	if (code == NOTIFY_KBD_BRTUP || code == NOTIFY_KBD_BRTDWN)
+		return 1;
+	return 0;
+}
+
 static void asus_wmi_notify(u32 value, void *context)
 {
 	struct asus_wmi *asus = context;
@@ -1745,6 +1754,14 @@ static void asus_wmi_notify(u32 value, void *context)
 		}
 	}
 
+	if (is_kbd_led_event(code)) {
+		if (code == NOTIFY_KBD_BRTDWN)
+			kbd_led_set(&asus->kbd_led, asus->kbd_led_wk - 1);
+		else
+			kbd_led_set(&asus->kbd_led, asus->kbd_led_wk + 1);
+		goto exit;
+	}
+
 	if (is_display_toggle(code) &&
 	    asus->driver->quirks->no_display_toggle)
 		goto exit;
-- 
2.11.0
