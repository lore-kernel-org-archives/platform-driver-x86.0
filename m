From: Christian Kellner <ckellner@redhat.com>
Subject: [PATCH 2/2] platform/x86: thinkpad_acpi: add mapping for new hotkeys on T470
Date: Sat, 25 Feb 2017 19:20:30 +0100
Message-ID: <20170225182030.19232-3-ckellner@redhat.com>
References: <20170225182030.19232-1-ckellner@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:37126 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751549AbdBYSVJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Feb 2017 13:21:09 -0500
In-Reply-To: <20170225182030.19232-1-ckellner@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Christian Kellner <ckellner@redhat.com>

The T470 emits new hkey events in the 0x1311 - 0x1315 range. According
to the user manual they should launch a user selected favorite
application (star icon, 0x1311), snipping tool (0x1312, currently
ignored), enable/disable bluetooth (0x1314) and open they keyboard
settings (0x1315).

The third nibble (0xf00) is used to differentiate between the original
hotkeys, the adaptive keyboard codes and the new, additional ones.

Signed-off-by: Christian Kellner <ckellner@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 90 +++++++++++++++++++++++++++++++-----
 1 file changed, 78 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 83294b28933e..a9f95026be9f 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1945,6 +1945,15 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
 	TP_ACPI_HOTKEYSCAN_CAMERA_MODE,
 	TP_ACPI_HOTKEYSCAN_ROTATE_DISPLAY,
 
+	/* Lenovo extended keymap, starting at 0x1300 */
+	TP_ACPI_HOTKEYSCAN_EXTENDED_START = 52,
+	/* first new observed key (star, favorites) is 0x1311 */
+	TP_ACPI_HOTKEYSCAN_STAR = 69,
+	TP_ACPI_HOTKEYSCAN_CLIPPING_TOOL2,
+	TP_ACPI_HOTKEYSCAN_UNK25,
+	TP_ACPI_HOTKEYSCAN_BLUETOOTH,
+	TP_ACPI_HOTKEYSCAN_KEYBOARD,
+
 	/* Hotkey keymap size */
 	TPACPI_HOTKEY_MAP_LEN
 };
@@ -3252,6 +3261,15 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+
+		/* No assignment, used for newer Lenovo models */
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_UNKNOWN, KEY_UNKNOWN
+
 		},
 
 	/* Generic keymap for Lenovo ThinkPads */
@@ -3337,6 +3355,28 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_RESERVED,        /* Microphone cancellation */
 		KEY_RESERVED,        /* Camera mode */
 		KEY_RESERVED,        /* Rotate display, 0x116 */
+
+		/*
+		 * These are found in 2017 models (e.g. T470s). The lowest
+		 * known value is 0x311, which according to the manual should
+		 * launch a user defined favorite application.
+		 *
+		 * The offset for these is TP_ACPI_HOTKEYSCAN_EXTENDED_START,
+		 * corresponding to 0x34.
+		 */
+
+		/* (assignments unknown, please report if found) */
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_UNKNOWN,
+
+		KEY_FAVORITES,       /* Favorite app, 0x311 */
+		KEY_RESERVED,        /* Clipping tool */
+		KEY_RESERVED,
+		KEY_BLUETOOTH,       /* Bluetooth */
+		KEY_KEYBOARD         /* Keyboard, 0x315 */
 		},
 	};
 
@@ -3747,8 +3787,9 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
 
 	default:
 		if (scancode < FIRST_ADAPTIVE_KEY ||
-		    scancode >= FIRST_ADAPTIVE_KEY + TPACPI_HOTKEY_MAP_LEN -
-				TP_ACPI_HOTKEYSCAN_ADAPTIVE_START) {
+		    scancode >= FIRST_ADAPTIVE_KEY +
+		    TP_ACPI_HOTKEYSCAN_EXTENDED_START -
+		    TP_ACPI_HOTKEYSCAN_ADAPTIVE_START) {
 			pr_info("Unhandled adaptive keyboard key: 0x%x\n",
 					scancode);
 			return false;
@@ -3779,19 +3820,44 @@ static bool hotkey_notify_hotkey(const u32 hkey,
 	*send_acpi_ev = true;
 	*ignore_acpi_ev = false;
 
-	/* HKEY event 0x1001 is scancode 0x00 */
-	if (scancode > 0 && scancode <= TP_ACPI_HOTKEYSCAN_ADAPTIVE_START) {
-		scancode--;
-		if (!(hotkey_source_mask & (1 << scancode))) {
-			tpacpi_input_send_key_masked(scancode);
-			*send_acpi_ev = false;
-		} else {
-			*ignore_acpi_ev = true;
+	/*
+	 * Original events are in the 0x10XX range, the adaptive keyboard
+	 * found in 2014 X1 Carbon emits events are of 0x11XX. In 2017
+	 * models, additional keys are emitted through 0x13XX.
+	 */
+	switch ((hkey >> 8) & 0xf) {
+	case 0:
+		if (scancode > 0 &&
+		    scancode <= TP_ACPI_HOTKEYSCAN_ADAPTIVE_START) {
+			/* HKEY event 0x1001 is scancode 0x00 */
+			scancode--;
+			if (!(hotkey_source_mask & (1 << scancode))) {
+				tpacpi_input_send_key_masked(scancode);
+				*send_acpi_ev = false;
+			} else {
+				*ignore_acpi_ev = true;
+			}
+			return true;
 		}
-		return true;
-	} else {
+		break;
+
+	case 1:
 		return adaptive_keyboard_hotkey_notify_hotkey(scancode);
+
+	case 3:
+		/* Extended keycodes start at 0x300 and our offset into the map
+		 * TP_ACPI_HOTKEYSCAN_EXTENDED_START. The calculated scancode
+		 * will be positive, but might not be in the correct range.
+		 */
+		scancode -= (0x300 - TP_ACPI_HOTKEYSCAN_EXTENDED_START);
+		if (scancode >= TP_ACPI_HOTKEYSCAN_EXTENDED_START &&
+		    scancode < TPACPI_HOTKEY_MAP_LEN) {
+			tpacpi_input_send_key(scancode);
+			return true;
+		}
+		break;
 	}
+
 	return false;
 }
 
-- 
2.11.1
