From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [RESEND][PATCH 4/5] acer-wmi: change to emit touchpad on off key
Date: Fri, 14 Dec 2012 16:10:08 +0800
Message-ID: <1355472609-9957-4-git-send-email-jlee@suse.com>
References: <1355472609-9957-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:44008 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752643Ab2LNILj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 14 Dec 2012 03:11:39 -0500
Received: by mail-ie0-f174.google.com with SMTP id c11so5409202ieb.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Dec 2012 00:11:39 -0800 (PST)
In-Reply-To: <1355472609-9957-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

KEY_TOUCHPAD_TOOGLE key is for notice userland change touchpad state
via xf86-input-synaptics on the machine that don't toggle touchpad in
hardware. But, acer laptop actually toggle touchpad in hardware.
So, this patch change to emit KEY_TOUCHPAD_ON/OFF key when acer-wmi grab
device state of touchpad.

Reference: brc#848270
        https://bugzilla.redhat.com/show_bug.cgi?id=848270

Tested-by: Nathanael Noblet <nathanael@gnat.ca>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 11fe00b..83abfaa 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -125,7 +125,9 @@ static const struct key_entry acer_wmi_keymap[] = {
 	{KE_IGNORE, 0x63, {KEY_BRIGHTNESSDOWN} },
 	{KE_KEY, 0x64, {KEY_SWITCHVIDEOMODE} },	/* Display Switch */
 	{KE_IGNORE, 0x81, {KEY_SLEEP} },
-	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad On/Off */
+	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad Toggle */
+	{KE_KEY, KEY_TOUCHPAD_ON, {KEY_TOUCHPAD_ON} },
+	{KE_KEY, KEY_TOUCHPAD_OFF, {KEY_TOUCHPAD_OFF} },
 	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
 	{KE_END, 0}
 };
@@ -147,6 +149,7 @@ struct event_return_value {
 #define ACER_WMID3_GDS_THREEG		(1<<6)	/* 3G */
 #define ACER_WMID3_GDS_WIMAX		(1<<7)	/* WiMAX */
 #define ACER_WMID3_GDS_BLUETOOTH	(1<<11)	/* BT */
+#define ACER_WMID3_GDS_TOUCHPAD		(1<<1)	/* Touchpad */
 
 struct lm_input_params {
 	u8 function_num;        /* Function Number */
@@ -1687,6 +1690,7 @@ static void acer_wmi_notify(u32 value, void *context)
 	acpi_status status;
 	u16 device_state;
 	const struct key_entry *key;
+	u32 scancode;
 
 	status = wmi_get_event_data(value, &response);
 	if (status != AE_OK) {
@@ -1723,6 +1727,7 @@ static void acer_wmi_notify(u32 value, void *context)
 			pr_warn("Unknown key number - 0x%x\n",
 				return_value.key_num);
 		} else {
+			scancode = return_value.key_num;
 			switch (key->keycode) {
 			case KEY_WLAN:
 			case KEY_BLUETOOTH:
@@ -1736,9 +1741,11 @@ static void acer_wmi_notify(u32 value, void *context)
 					rfkill_set_sw_state(bluetooth_rfkill,
 						!(device_state & ACER_WMID3_GDS_BLUETOOTH));
 				break;
+			case KEY_TOUCHPAD_TOGGLE:
+				scancode = (device_state & ACER_WMID3_GDS_TOUCHPAD) ?
+						KEY_TOUCHPAD_ON : KEY_TOUCHPAD_OFF;
 			}
-			sparse_keymap_report_entry(acer_wmi_input_dev, key,
-						   1, true);
+			sparse_keymap_report_event(acer_wmi_input_dev, scancode, 1, true);
 		}
 		break;
 	case WMID_ACCEL_EVENT:
-- 
1.6.0.2
