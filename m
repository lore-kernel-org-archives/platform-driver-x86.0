From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 3/5] thinkpad-acpi: lock down size of hotkey keymap
Date: Mon,  9 Aug 2010 23:48:20 -0300
Message-ID: <1281408502-7757-4-git-send-email-hmh@hmh.eng.br>
References: <1281408502-7757-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:35006 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755253Ab0HJCs3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Aug 2010 22:48:29 -0400
In-Reply-To: <1281408502-7757-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Use a safer coding style for the hotkey keymap.  This does not fix any
problems, as the current code is correct.  But it might help avoid
mistakes in the future.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |   19 +++++++++++++++----
 1 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 376a053..17da5c9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1911,6 +1911,17 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
 	TP_ACPI_HOTKEYSCAN_VOLUMEDOWN,
 	TP_ACPI_HOTKEYSCAN_MUTE,
 	TP_ACPI_HOTKEYSCAN_THINKPAD,
+	TP_ACPI_HOTKEYSCAN_UNK1,
+	TP_ACPI_HOTKEYSCAN_UNK2,
+	TP_ACPI_HOTKEYSCAN_UNK3,
+	TP_ACPI_HOTKEYSCAN_UNK4,
+	TP_ACPI_HOTKEYSCAN_UNK5,
+	TP_ACPI_HOTKEYSCAN_UNK6,
+	TP_ACPI_HOTKEYSCAN_UNK7,
+	TP_ACPI_HOTKEYSCAN_UNK8,
+
+	/* Hotkey keymap size */
+	TPACPI_HOTKEY_MAP_LEN
 };
 
 enum {	/* Keys/events available through NVRAM polling */
@@ -3113,7 +3124,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	 * If the above is too much to ask, don't change the keymap.
 	 * Ask the thinkpad-acpi maintainer to do it, instead.
 	 */
-	static u16 ibm_keycode_map[] __initdata = {
+	static u16 ibm_keycode_map[TPACPI_HOTKEY_MAP_LEN] __initdata = {
 		/* Scan Codes 0x00 to 0x0B: ACPI HKEY FN+F1..F12 */
 		KEY_FN_F1,	KEY_FN_F2,	KEY_COFFEE,	KEY_SLEEP,
 		KEY_WLAN,	KEY_FN_F6, KEY_SWITCHVIDEOMODE, KEY_FN_F8,
@@ -3147,7 +3158,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 	};
-	static u16 lenovo_keycode_map[] __initdata = {
+	static u16 lenovo_keycode_map[TPACPI_HOTKEY_MAP_LEN] __initdata = {
 		/* Scan Codes 0x00 to 0x0B: ACPI HKEY FN+F1..F12 */
 		KEY_FN_F1,	KEY_COFFEE,	KEY_BATTERY,	KEY_SLEEP,
 		KEY_WLAN,	KEY_FN_F6, KEY_SWITCHVIDEOMODE, KEY_FN_F8,
@@ -3191,7 +3202,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 	};
 
-#define TPACPI_HOTKEY_MAP_LEN		ARRAY_SIZE(ibm_keycode_map)
 #define TPACPI_HOTKEY_MAP_SIZE		sizeof(ibm_keycode_map)
 #define TPACPI_HOTKEY_MAP_TYPESIZE	sizeof(ibm_keycode_map[0])
 
@@ -3469,7 +3479,8 @@ static bool hotkey_notify_hotkey(const u32 hkey,
 	*send_acpi_ev = true;
 	*ignore_acpi_ev = false;
 
-	if (scancode > 0 && scancode < 0x21) {
+	/* HKEY event 0x1001 is scancode 0x00 */
+	if (scancode > 0 && scancode <= TPACPI_HOTKEY_MAP_LEN) {
 		scancode--;
 		if (!(hotkey_source_mask & (1 << scancode))) {
 			tpacpi_input_send_key_masked(scancode);
-- 
1.7.1
