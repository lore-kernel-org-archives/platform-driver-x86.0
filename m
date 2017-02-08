From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 04/10] platform/x86: fujitsu-laptop: rename FUNC_RFKILL to FUNC_FLAGS
Date: Wed,  8 Feb 2017 14:46:27 +0100
Message-ID: <20170208134633.5152-5-kernel@kempniu.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35855 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754152AbdBHOS1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2017 09:18:27 -0500
Received: by mail-lf0-f67.google.com with SMTP id h65so9453012lfi.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Feb 2017 06:18:21 -0800 (PST)
In-Reply-To: <20170208134633.5152-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>

FUNC subfunction 0x1000 is currently referred to as FUNC_RFKILL, which
is misleading, because it handles more than just radio devices (also
lid, dock, LEDs).  Rename the FUNC_RFKILL constant to FUNC_FLAGS.
Replace "rfkill" with "flags" in the names of its associated fields
inside struct fujitsu_laptop.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
[kempniu: rebase patch, rewrite commit message]
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 50 +++++++++++++++++------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 6cdd1b334e8a..55d696262301 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -89,7 +89,7 @@
 #define ACPI_FUJITSU_NOTIFY_CODE1     0x80
 
 /* FUNC interface - command values */
-#define FUNC_RFKILL	0x1000
+#define FUNC_FLAGS	0x1000
 #define FUNC_LEDS	0x1001
 #define FUNC_BUTTONS	0x1002
 #define FUNC_BACKLIGHT  0x1004
@@ -163,8 +163,8 @@ struct fujitsu_laptop {
 	struct platform_device *pf_device;
 	struct kfifo fifo;
 	spinlock_t fifo_lock;
-	int rfkill_supported;
-	int rfkill_state;
+	int flags_supported;
+	int flags_state;
 	int logolamp_registered;
 	int kblamps_registered;
 	int radio_led_registered;
@@ -300,9 +300,9 @@ static int radio_led_set(struct led_classdev *cdev,
 				enum led_brightness brightness)
 {
 	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, RADIO_LED_ON);
+		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON, RADIO_LED_ON);
 	else
-		return call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
+		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON, 0x0);
 }
 
 static int eco_led_set(struct led_classdev *cdev,
@@ -346,7 +346,7 @@ static enum led_brightness radio_led_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0) & RADIO_LED_ON)
+	if (call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0) & RADIO_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -567,9 +567,9 @@ static ssize_t
 show_lid_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_laptop->rfkill_supported & 0x100))
+	if (!(fujitsu_laptop->flags_supported & 0x100))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_laptop->rfkill_state & 0x100)
+	if (fujitsu_laptop->flags_state & 0x100)
 		return sprintf(buf, "open\n");
 	else
 		return sprintf(buf, "closed\n");
@@ -579,9 +579,9 @@ static ssize_t
 show_dock_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_laptop->rfkill_supported & 0x200))
+	if (!(fujitsu_laptop->flags_supported & 0x200))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_laptop->rfkill_state & 0x200)
+	if (fujitsu_laptop->flags_state & 0x200)
 		return sprintf(buf, "docked\n");
 	else
 		return sprintf(buf, "undocked\n");
@@ -591,9 +591,9 @@ static ssize_t
 show_radios_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_laptop->rfkill_supported & 0x20))
+	if (!(fujitsu_laptop->flags_supported & 0x20))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_laptop->rfkill_state & 0x20)
+	if (fujitsu_laptop->flags_state & 0x20)
 		return sprintf(buf, "on\n");
 	else
 		return sprintf(buf, "killed\n");
@@ -920,17 +920,17 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 		; /* No action, result is discarded */
 	vdbg_printk(FUJLAPTOP_DBG_INFO, "Discarded %i ringbuffer entries\n", i);
 
-	fujitsu_laptop->rfkill_supported =
-		call_fext_func(FUNC_RFKILL, 0x0, 0x0, 0x0);
+	fujitsu_laptop->flags_supported =
+		call_fext_func(FUNC_FLAGS, 0x0, 0x0, 0x0);
 
 	/* Make sure our bitmask of supported functions is cleared if the
 	   RFKILL function block is not implemented, like on the S7020. */
-	if (fujitsu_laptop->rfkill_supported == UNSUPPORTED_CMD)
-		fujitsu_laptop->rfkill_supported = 0;
+	if (fujitsu_laptop->flags_supported == UNSUPPORTED_CMD)
+		fujitsu_laptop->flags_supported = 0;
 
-	if (fujitsu_laptop->rfkill_supported)
-		fujitsu_laptop->rfkill_state =
-			call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0);
+	if (fujitsu_laptop->flags_supported)
+		fujitsu_laptop->flags_state =
+			call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0);
 
 	/* Suspect this is a keymap of the application panel, print it */
 	pr_info("BTNI: [0x%x]\n", call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0));
@@ -1093,9 +1093,9 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 		return;
 	}
 
-	if (fujitsu_laptop->rfkill_supported)
-		fujitsu_laptop->rfkill_state =
-			call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0);
+	if (fujitsu_laptop->flags_supported)
+		fujitsu_laptop->flags_state =
+			call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0);
 
 	i = 0;
 	while ((irb =
@@ -1135,10 +1135,10 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 
 	/* On some models (first seen on the Skylake-based Lifebook
 	 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
-	 * handled in software; its state is queried using FUNC_RFKILL
+	 * handled in software; its state is queried using FUNC_FLAGS
 	 */
-	if ((fujitsu_laptop->rfkill_supported & BIT(26)) &&
-	    (call_fext_func(FUNC_RFKILL, 0x1, 0x0, 0x0) & BIT(26))) {
+	if ((fujitsu_laptop->flags_supported & BIT(26)) &&
+	    (call_fext_func(FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26))) {
 		keycode = KEY_TOUCHPAD_TOGGLE;
 		input_report_key(input, keycode, 1);
 		input_sync(input);
-- 
2.11.1
