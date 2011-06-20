From: Seth Forshee <seth.forshee@canonical.com>
Subject: acer-wmi problem handling device states from WMI events
Date: Mon, 20 Jun 2011 14:06:49 -0500
Message-ID: <20110620190649.GA6414@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:55340 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755730Ab1FTTGx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Jun 2011 15:06:53 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Joey,

acer-wmi is indiscriminately using the device state from hotkey events
to update the various rfkill states. On the Aspire 1830 this can result
in a soft block on the wlan when the touchpad hotkey is pressed, as it
is reporting a non-zero device state that does not reflect the wireless
status.

I beleive the following (untested) patch is a roughly correct fix for
this issue.  It changes acer-wmi to only update the rfkill states when
the appropriate hotkeys are pressed, but I'm a little unsure about the
way I've split out the rfkill updates acording to the hotkeys. I don't
see any support in the driver for a 3G hotkey, so I've grouped it with
the wlan key, and I have split out bluetooth to be handled separately
from these. Does this patch look correct?

Thanks,
Seth


diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 005417b..592328d 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1445,6 +1445,8 @@ static void acer_wmi_notify(u32 value, void *context)
 	union acpi_object *obj;
 	struct event_return_value return_value;
 	acpi_status status;
+	u16 device_state;
+	const struct key_entry *key;
 
 	status = wmi_get_event_data(value, &response);
 	if (status != AE_OK) {
@@ -1472,23 +1474,33 @@ static void acer_wmi_notify(u32 value, void *context)
 
 	switch (return_value.function) {
 	case WMID_HOTKEY_EVENT:
-		if (return_value.device_state) {
-			u16 device_state = return_value.device_state;
-			pr_debug("device state: 0x%x\n", device_state);
-			if (has_cap(ACER_CAP_WIRELESS))
-				rfkill_set_sw_state(wireless_rfkill,
-				!(device_state & ACER_WMID3_GDS_WIRELESS));
-			if (has_cap(ACER_CAP_BLUETOOTH))
-				rfkill_set_sw_state(bluetooth_rfkill,
-				!(device_state & ACER_WMID3_GDS_BLUETOOTH));
-			if (has_cap(ACER_CAP_THREEG))
-				rfkill_set_sw_state(threeg_rfkill,
-				!(device_state & ACER_WMID3_GDS_THREEG));
-		}
-		if (!sparse_keymap_report_event(acer_wmi_input_dev,
-				return_value.key_num, 1, true))
+		device_state = return_value.device_state;
+		pr_debug("device state: 0x%x\n", device_state);
+
+		key = sparse_keymap_entry_from_scancode(acer_wmi_input_dev,
+							return_value.key_num);
+		if (!key) {
 			pr_warn("Unknown key number - 0x%x\n",
 				return_value.key_num);
+		} else {
+			switch (key->keycode) {
+			case KEY_WLAN:
+				if (has_cap(ACER_CAP_WIRELESS))
+					rfkill_set_sw_state(wireless_rfkill,
+						!(device_state & ACER_WMID3_GDS_WIRELESS));
+				if (has_cap(ACER_CAP_THREEG))
+					rfkill_set_sw_state(threeg_rfkill,
+						!(device_state & ACER_WMID3_GDS_THREEG));
+				break;
+			case KEY_BLUETOOTH:
+				if (has_cap(ACER_CAP_BLUETOOTH))
+					rfkill_set_sw_state(bluetooth_rfkill,
+						!(device_state & ACER_WMID3_GDS_BLUETOOTH));
+				break;
+			}
+			sparse_keymap_report_entry(acer_wmi_input_dev, key,
+						   1, true);
+		}
 		break;
 	default:
 		pr_warn("Unknown function number - %d - %d\n",
