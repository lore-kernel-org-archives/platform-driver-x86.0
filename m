From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH 3/3] dell_wmi: Improve unknown hotkey handling
Date: Fri, 13 Nov 2015 21:49:32 -0800
Message-ID: <b7fd494ac6d51c13a66fec20ec336080479b0f5f.1447479930.git.luto@kernel.org>
References: <cover.1447479930.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59725 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750948AbbKNFtw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Nov 2015 00:49:52 -0500
In-Reply-To: <cover.1447479930.git.luto@kernel.org>
In-Reply-To: <cover.1447479930.git.luto@kernel.org>
References: <cover.1447479930.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Lutomirski <luto@kernel.org>

If DMI lists a hotkey that we don't recognize, log and ignore it
instead of trying to map it to keycode 0.  I haven't seen this happen,
but it will help maintain the key map in the future and it will help
avoid sending bogus events.

This also improves the message that we log when we get an unknown key
event.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 drivers/platform/x86/dell-wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 92b0149fa4a7..e43228a35f6b 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -180,7 +180,7 @@ static void dell_wmi_process_key(int reported_key)
 	key = sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
 						reported_key);
 	if (!key) {
-		pr_info("Unknown key %x pressed\n", reported_key);
+		pr_info("Unknown key with scancode 0x%x pressed\n", reported_key);
 		return;
 	}
 
@@ -343,6 +343,11 @@ static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
 				    bios_to_linux_keycode[bios_entry->keycode] :
 				    KEY_RESERVED;
 
+		if (keycode == 0) {
+			pr_info("firmware scancode %d maps to unrecognized keycode %d\n", bios_entry->keycode, bios_entry->scancode);
+			continue;
+		}
+
 		if (keycode == KEY_KBDILLUMTOGGLE)
 			keymap[pos].type = KE_IGNORE;
 		else
-- 
2.5.0
