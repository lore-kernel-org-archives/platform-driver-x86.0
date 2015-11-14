From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Fri, 13 Nov 2015 21:49:30 -0800
Message-ID: <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
References: <cover.1447479930.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59681 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750854AbbKNFtp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Nov 2015 00:49:45 -0500
In-Reply-To: <cover.1447479930.git.luto@kernel.org>
In-Reply-To: <cover.1447479930.git.luto@kernel.org>
References: <cover.1447479930.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Lutomirski <luto@kernel.org>

The XPS 13 Skylake has an rfkill button and a switchvideomode button
that aren't enumerated in the DMI table AFAICT.  Add a table listing
extra un-enumerated hotkeys.  To avoid breaking things that worked
before, these un-enumerated hotkeys won't be used if the DMI table
maps them to something else.

This also adds the Fn-lock key as a KE_IGNORE entry.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 drivers/platform/x86/dell-wmi.c | 48 +++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index f2d77fe696ac..5be1abec4f64 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -142,6 +142,16 @@ static const u16 bios_to_linux_keycode[256] __initconst = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_PROG3
 };
 
+/* These are applied if the hk table is present and doesn't override them. */
+static const struct key_entry dell_wmi_extra_keymap[] __initconst = {
+	/* Fn-lock -- no action is required by the kernel. */
+	{ KE_IGNORE, 0x151, { KEY_RESERVED } },
+
+	/* Keys that need our help (on XPS 13 Skylake and maybe others. */
+	{ KE_KEY, 0x152, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x153, { KEY_RFKILL } },
+};
+
 static struct input_dev *dell_wmi_input_dev;
 
 static void dell_wmi_process_key(int reported_key)
@@ -300,9 +310,10 @@ static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
 	int hotkey_num = (dell_bios_hotkey_table->header.length - 4) /
 				sizeof(struct dell_bios_keymap_entry);
 	struct key_entry *keymap;
-	int i;
+	int i, pos = 0, num_bios_keys;
 
-	keymap = kcalloc(hotkey_num + 1, sizeof(struct key_entry), GFP_KERNEL);
+	keymap = kcalloc(hotkey_num + ARRAY_SIZE(dell_wmi_extra_keymap),
+			 sizeof(struct key_entry), GFP_KERNEL);
 	if (!keymap)
 		return NULL;
 
@@ -314,14 +325,37 @@ static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
 				    KEY_RESERVED;
 
 		if (keycode == KEY_KBDILLUMTOGGLE)
-			keymap[i].type = KE_IGNORE;
+			keymap[pos].type = KE_IGNORE;
 		else
-			keymap[i].type = KE_KEY;
-		keymap[i].code = bios_entry->scancode;
-		keymap[i].keycode = keycode;
+			keymap[pos].type = KE_KEY;
+		keymap[pos].code = bios_entry->scancode;
+		keymap[pos].keycode = keycode;
+
+		pos++;
+	}
+
+	num_bios_keys = pos;
+
+	for (i = 0; i < ARRAY_SIZE(dell_wmi_extra_keymap); i++) {
+		int j;
+
+		/*
+		 * Check if we've already found this scancode.  This takes
+		 * quadratic time, but it doesn't matter unless the list
+		 * of extra keys gets very long.
+		 */
+		for (j = 0; j < num_bios_keys; j++)
+			if (keymap[j].code == dell_wmi_extra_keymap[i].code)
+				goto skip;
+
+		keymap[pos] = dell_wmi_extra_keymap[i];
+		pos++;
+
+skip:
+		;
 	}
 
-	keymap[hotkey_num].type = KE_END;
+	keymap[pos].type = KE_END;
 
 	return keymap;
 }
-- 
2.5.0
