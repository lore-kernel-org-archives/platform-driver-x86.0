From: Chris Chiu <chiu@endlessm.com>
Subject: [PATCH v2 2/2] platform/x86: asus-wmi: Add keyboard backlight toggle support
Date: Mon, 11 Jun 2018 15:18:38 +0800
Message-ID: <20180611071838.47945-2-chiu@endlessm.com>
References: <20180611071838.47945-1-chiu@endlessm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611071838.47945-1-chiu@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: corentin.chary@gmail.com, dvhart@infradead.org, andy.shevchenko@gmail.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, hdegoede@redhat.com, linux@endlessm.com, Chris Chiu <chiu@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Some ASUS laptops like UX550GE has hotkey (Fn+F7) for keyboard
backlight toggle which would emit the scan code 0xc7 each keypress.
On the UX550GE, the max keyboard brightness level is 3 so the
toggle would not be simply on/off the led but need to be cyclic.
Per ASUS spec, it should increment the brightness for each keypress,
then toggle(off) the LED when it already reached the max level.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a18484f4bae3..bfcafca54a7a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -67,6 +67,7 @@ MODULE_LICENSE("GPL");
 #define NOTIFY_BRNDOWN_MAX		0x2e
 #define NOTIFY_KBD_BRTUP		0xc4
 #define NOTIFY_KBD_BRTDWN		0xc5
+#define NOTIFY_KBD_BRTTOGGLE		0xc7
 
 /* WMI Methods */
 #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECification */
@@ -1755,6 +1756,13 @@ static void asus_wmi_notify(u32 value, void *context)
 		kbd_led_set(&asus->kbd_led, asus->kbd_led_wk - 1);
 		goto exit;
 	}
+	if (code == NOTIFY_KBD_BRTTOGGLE) {
+		if (asus->kbd_led_wk == asus->kbd_led.max_brightness)
+			kbd_led_set(&asus->kbd_led, 0);
+		else
+			kbd_led_set(&asus->kbd_led, asus->kbd_led_wk + 1);
+		goto exit;
+	}
 
 	if (is_display_toggle(code) &&
 	    asus->driver->quirks->no_display_toggle)
-- 
2.11.0
