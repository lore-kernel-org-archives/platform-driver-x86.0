From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2] platform/x86: dell-laptop: Filter out spurious keyboard backlight change events
Date: Thu, 11 Jan 2018 15:14:39 +0100
Message-ID: <20180111141439.19915-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33040 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932314AbeAKOOl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Jan 2018 09:14:41 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On some Dell XPS models WMI events of type 0x0000 reporting a keycode of
0xe00c get reported when the brightness of the LCD panel changes.

This leads to us reporting false-positive kbd_led change events to
userspace which in turn leads to the kbd backlight OSD showing when it
should not.

We already read the current keyboard backlight brightness value when
reporting events because the led_classdev_notify_brightness_hw_changed
API requires this. Compare this value to the last known value and filter
out duplicate events, fixing this.

Note the fixed issue is esp. a problem on XPS models with an ambient light
sensor and automatic brightness adjustments turned on, this causes the kbd
backlight OSD to show all the time there.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1514969
Fixes: 9c656b0799 ("platform/x86: dell-*: Call new led hw_changed API ...")
Acked-by: Pali Rohár <pali.rohar@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Add Fixes tag
-Add Pali's Acked-by
---
 drivers/platform/x86/dell-laptop.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index cd4725e7e0b5..2ef3297a9efc 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1133,6 +1133,7 @@ static u8 kbd_previous_mode_bit;
 
 static bool kbd_led_present;
 static DEFINE_MUTEX(kbd_led_mutex);
+static enum led_brightness kbd_led_level;
 
 /*
  * NOTE: there are three ways to set the keyboard backlight level.
@@ -1947,6 +1948,7 @@ static enum led_brightness kbd_led_level_get(struct led_classdev *led_cdev)
 static int kbd_led_level_set(struct led_classdev *led_cdev,
 			     enum led_brightness value)
 {
+	enum led_brightness new_value = value;
 	struct kbd_state state;
 	struct kbd_state new_state;
 	u16 num;
@@ -1976,6 +1978,9 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
 	}
 
 out:
+	if (ret == 0)
+		kbd_led_level = new_value;
+
 	mutex_unlock(&kbd_led_mutex);
 	return ret;
 }
@@ -2003,6 +2008,9 @@ static int __init kbd_led_init(struct device *dev)
 		if (kbd_led.max_brightness)
 			kbd_led.max_brightness--;
 	}
+
+	kbd_led_level = kbd_led_level_get(NULL);
+
 	ret = led_classdev_register(dev, &kbd_led);
 	if (ret)
 		kbd_led_present = false;
@@ -2027,13 +2035,25 @@ static void kbd_led_exit(void)
 static int dell_laptop_notifier_call(struct notifier_block *nb,
 				     unsigned long action, void *data)
 {
+	bool changed = false;
+	enum led_brightness new_kbd_led_level;
+
 	switch (action) {
 	case DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED:
 		if (!kbd_led_present)
 			break;
 
-		led_classdev_notify_brightness_hw_changed(&kbd_led,
-						kbd_led_level_get(&kbd_led));
+		mutex_lock(&kbd_led_mutex);
+		new_kbd_led_level = kbd_led_level_get(&kbd_led);
+		if (kbd_led_level != new_kbd_led_level) {
+			kbd_led_level = new_kbd_led_level;
+			changed = true;
+		}
+		mutex_unlock(&kbd_led_mutex);
+
+		if (changed)
+			led_classdev_notify_brightness_hw_changed(&kbd_led,
+								kbd_led_level);
 		break;
 	}
 
-- 
2.14.3
