From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH 2/2] acer-wmi: Only update rfkill status for associated hotkey events
Date: Tue, 21 Jun 2011 12:00:33 -0500
Message-ID: <1308675633-10384-2-git-send-email-seth.forshee@canonical.com>
References: <20110621165859.GB25609@thinkpad-t410>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:41276 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756842Ab1FURAi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jun 2011 13:00:38 -0400
In-Reply-To: <20110621165859.GB25609@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: platform-driver-x86@vger.kernel.org

acer-wmi is indiscriminately using the device state from hotkey
events to update the various rfkill states. On the Aspire 1830 this
can result in a soft block on the wlan when the touchpad hotkey is
pressed, as it is reporting a non-zero device state that does not
reflect the wireless status. To fix this, only update rfkill states
when a wlan or bluetooth hotkey is pressed.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/acer-wmi.c |   41 ++++++++++++++++++++++++--------------
 1 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 0dd6986..591eb7a 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1446,6 +1446,8 @@ static void acer_wmi_notify(u32 value, void *context)
 	union acpi_object *obj;
 	struct event_return_value return_value;
 	acpi_status status;
+	u16 device_state;
+	const struct key_entry *key;
 
 	status = wmi_get_event_data(value, &response);
 	if (status != AE_OK) {
@@ -1473,23 +1475,32 @@ static void acer_wmi_notify(u32 value, void *context)
 
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
+			case KEY_BLUETOOTH:
+				if (has_cap(ACER_CAP_WIRELESS))
+					rfkill_set_sw_state(wireless_rfkill,
+						!(device_state & ACER_WMID3_GDS_WIRELESS));
+				if (has_cap(ACER_CAP_THREEG))
+					rfkill_set_sw_state(threeg_rfkill,
+						!(device_state & ACER_WMID3_GDS_THREEG));
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
-- 
1.7.4.1
