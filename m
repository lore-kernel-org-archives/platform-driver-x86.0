From: Arcadiy Ivanov <arcadiy@ivanov.biz>
Subject: [PATCH] Keyboard backlight on Dell E7470 not adjustable from /sys entry
Date: Sun, 23 Apr 2017 01:56:48 -0400
Message-ID: <20170423055648.25711-1-arcadiy@ivanov.biz>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.perfora.net ([74.208.4.194]:54700 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1427558AbdDWF5R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Apr 2017 01:57:17 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@dell.com>, Arcadiy Ivanov <arcadiy@ivanov.biz>

https://bugzilla.kernel.org/show_bug.cgi?id=191731
https://bugzilla.redhat.com/show_bug.cgi?id=1436686

Also fixes
dell_laptop: Setting old previous keyboard state failed
https://bugzilla.kernel.org/show_bug.cgi?id=194081

The issue is actually quite trivial. Byte 3 of kbd_state
on some machines contains "timeout_ac". If this byte is simply
set to 0 the result is failed state set. The "timeout_ac" is not
interpreted in any way, but it is now preserved in order to ensure
the LED state changes go through.
---
 drivers/platform/x86/dell-laptop.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f57dd28..f886141 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1036,6 +1036,15 @@ static void touchpad_led_exit(void)
  *  cbRES3, byte0  Current setting of ALS value that turns the light on or off.
  *  cbRES3, byte1  Current ALS reading
  *  cbRES3, byte2  Current keyboard light level.
+ *  cbRES3, byte3  Current timeout, on AC Power Bits
+ *     7:6 Timeout units indicator:
+ *     00b Seconds
+ *     01b Minutes
+ *     10b Hours
+ *     11b Days
+ *     Bits 5:0 Timeout value (0-63) in sec/min/hr/day
+ *     NOTE: A value of 0 means always on (no timeout) if any bits of RES3 byte2
+ *     are set upon return from the upon return from the [Get Feature information] call.
  *
  * cbArg1 0x2 = Set New State
  *  cbRES1         Standard return codes (0, -1, -2)
@@ -1067,6 +1076,13 @@ static void touchpad_led_exit(void)
  *     bits 5:0  Timeout value (0-63) in sec/min/hr/day
  *  cbArg3, byte0  Desired setting of ALS value that turns the light on or off.
  *  cbArg3, byte2  Desired keyboard light level.
+ *  cbArg3, byte3  Desired Timeout on AC power
+ *     bits 7:6  Timeout units indicator:
+ *     00b       Seconds
+ *     01b       Minutes
+ *     10b       Hours
+ *     11b       Days
+ *     bits 5:0  Timeout value (0-63) in sec/min/hr/day
  */
 
 
@@ -1115,6 +1131,7 @@ struct kbd_state {
 	u8 als_setting;
 	u8 als_value;
 	u8 level;
+	u8 timeout_ac;
 };
 
 static const int kbd_tokens[] = {
@@ -1140,6 +1157,25 @@ static u8 kbd_previous_mode_bit;
 
 static bool kbd_led_present;
 
+#define pr_kbd_smi(x) \
+    pr_debug("func %s\n\tinputs: %#010x %#010x %#010x %#010x, outputs: %#010x %#010x %#010x %#010x", \
+        __func__, \
+        x->input[0], x->input[1], x->input[2], x->input[3],\
+        x->output[0], x->output[1], x->output[2], x->output[3])
+
+#define pr_kbd_state(x) \
+    pr_debug("func %s\n\tmode_bit: %#04x, triggers: %#04x, timeout_value: %#04x, timeout_unit: %#04x, " \
+            "als_setting: %#04x, als_value: %#04x, level: %#04x, timeout_ac: %#04x", \
+        __func__, \
+        x->mode_bit, x->triggers, x->timeout_value, x->timeout_unit, x->als_setting, x->als_value, x->level, \
+        x->timeout_ac)
+
+#define pr_kbd_info(x) \
+    pr_debug("func %s\n\tmodes: %#06x, type: %#04x, triggers: %#04x, levels: %#04x, seconds: %#04x, " \
+            "minutes: %#04x, hours: %#04x, days: %#04x", \
+        __func__, \
+        x->modes, x->type, x->triggers, x->levels, x->seconds, x->minutes, x->hours, x->days)
+
 /*
  * NOTE: there are three ways to set the keyboard backlight level.
  * First, via kbd_state.mode_bit (assigning KBD_MODE_BIT_TRIGGER_* value).
@@ -1165,6 +1201,8 @@ static int kbd_get_info(struct kbd_info *info)
 	dell_smbios_send_request(4, 11);
 	ret = buffer->output[0];
 
+	pr_kbd_smi(buffer);
+
 	if (ret) {
 		ret = dell_smbios_error(ret);
 		goto out;
@@ -1185,6 +1223,8 @@ static int kbd_get_info(struct kbd_info *info)
 	if (units & BIT(3))
 		info->days = (buffer->output[3] >> 24) & 0xFF;
 
+	pr_kbd_info(info);
+
  out:
 	dell_smbios_release_buffer();
 	return ret;
@@ -1252,6 +1292,9 @@ static int kbd_get_state(struct kbd_state *state)
 
 	buffer->input[0] = 0x1;
 	dell_smbios_send_request(4, 11);
+
+	pr_kbd_smi(buffer);
+
 	ret = buffer->output[0];
 
 	if (ret) {
@@ -1269,6 +1312,9 @@ static int kbd_get_state(struct kbd_state *state)
 	state->als_setting = buffer->output[2] & 0xFF;
 	state->als_value = (buffer->output[2] >> 8) & 0xFF;
 	state->level = (buffer->output[2] >> 16) & 0xFF;
+	state->timeout_ac = (buffer->output[2] >> 24) & 0xFF;
+
+	pr_kbd_state(state);
 
  out:
 	dell_smbios_release_buffer();
@@ -1280,6 +1326,8 @@ static int kbd_set_state(struct kbd_state *state)
 	struct calling_interface_buffer *buffer;
 	int ret;
 
+	pr_kbd_state(state);
+
 	buffer = dell_smbios_get_buffer();
 	buffer->input[0] = 0x2;
 	buffer->input[1] = BIT(state->mode_bit) & 0xFFFF;
@@ -1288,6 +1336,10 @@ static int kbd_set_state(struct kbd_state *state)
 	buffer->input[1] |= (state->timeout_unit & 0x3) << 30;
 	buffer->input[2] = state->als_setting & 0xFF;
 	buffer->input[2] |= (state->level & 0xFF) << 16;
+	buffer->input[2] |= (state->timeout_ac & 0xFF) << 24;
+
+	pr_kbd_smi(buffer);
+
 	dell_smbios_send_request(4, 11);
 	ret = buffer->output[0];
 	dell_smbios_release_buffer();
@@ -1455,6 +1507,7 @@ static inline int kbd_init_info(void)
 		kbd_mode_levels_count++;
 	}
 
+	pr_kbd_info((&kbd_info));
 	return 0;
 
 }
-- 
2.9.3
