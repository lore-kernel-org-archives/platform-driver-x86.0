From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v2] dell-wmi: Improve unknown hotkey handling
Date: Fri, 20 Nov 2015 17:27:00 -0800
Message-ID: <a19a018252f8352a5d22934c98fba2954e9b1c6c.1448069061.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37147 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760389AbbKUB1F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 20:27:05 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Andy Lutomirski <luto@kernel.org>

If DMI lists a hotkey that we don't recognize, log and ignore it
instead of trying to map it to keycode 0.  I haven't seen this happen,
but it will help maintain the key map in the future and it will help
avoid sending bogus events.

This also improves the message that we log when we get an unknown key
event.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---

Changes from v1:
 - Use KEY_RESERVED instead of zero and document why that's okay
 - Fix scancode vs keycode confusion in the log message (whoops!)
 - Switch from hardcoded 256 to ARRAY_SIZE

 drivers/platform/x86/dell-wmi.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index d2daf5417cd7..cb96ef03fa79 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -118,6 +118,7 @@ struct dell_bios_hotkey_table {
 
 static const struct dell_bios_hotkey_table *dell_bios_hotkey_table;
 
+/* Uninitialized entries here are KEY_RESERVED == 0. */
 static const u16 bios_to_linux_keycode[256] __initconst = {
 	[0]	= KEY_MEDIA,
 	[1]	= KEY_NEXTSONG,
@@ -180,7 +181,8 @@ static void dell_wmi_process_key(int reported_key)
 	key = sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
 						reported_key);
 	if (!key) {
-		pr_info("Unknown key %x pressed\n", reported_key);
+		pr_info("Unknown key with scancode 0x%x pressed\n",
+			reported_key);
 		return;
 	}
 
@@ -339,9 +341,24 @@ static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
 	for (i = 0; i < hotkey_num; i++) {
 		const struct dell_bios_keymap_entry *bios_entry =
 					&dell_bios_hotkey_table->keymap[i];
-		u16 keycode = bios_entry->keycode < 256 ?
-				    bios_to_linux_keycode[bios_entry->keycode] :
-				    KEY_RESERVED;
+
+		/* Uninitialized entries are 0 aka KEY_RESERVED. */
+		BUILD_BUG_ON(KEY_RESERVED != 0);
+		u16 keycode = (bios_entry->keycode <
+			       ARRAY_SIZE(bios_to_linux_keycode)) ?
+			bios_to_linux_keycode[bios_entry->keycode] :
+			KEY_RESERVED;
+
+		/*
+		 * Log if we find an entry in the DMI table that we don't
+		 * understand.  If this happens, we should figure out what
+		 * the entry means and add it to bios_to_linux_keycode.
+		 */
+		if (keycode == KEY_RESERVED) {
+			pr_info("firmware scancode %d maps to unrecognized keycode %d\n",
+				bios_entry->scancode, bios_entry->keycode);
+			continue;
+		}
 
 		if (keycode == KEY_KBDILLUMTOGGLE)
 			keymap[pos].type = KE_IGNORE;
-- 
2.4.3
