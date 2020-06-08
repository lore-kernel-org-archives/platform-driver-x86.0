From: Y Paritcher <y.linux@paritcher.com>
Subject: [PATCH v2 3/3] platform/x86: dell-wmi: add new dmi keys to bios_to_linux_keycode
Date: Mon,  8 Jun 2020 19:05:30 -0400
Message-ID: <d585d2a0f01a6b9480352530b571dec2d1afd79f.1591656154.git.y.linux@paritcher.com>
References: <cover.1591584631.git.y.linux@paritcher.com> <cover.1591656154.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1591656154.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

Increase length of bios_to_linux_keycode to 2 bytes (the true size of a
keycode) to allow for a new keycode 0xffff, this silences the following
messages being logged at startup on a Dell Inspiron 5593:

    dell_wmi: firmware scancode 0x48 maps to unrecognized keycode 0xffff
    dell_wmi: firmware scancode 0x50 maps to unrecognized keycode 0xffff

as per this code comment:

   Log if we find an entry in the DMI table that we don't
   understand.  If this happens, we should figure out what
   the entry means and add it to bios_to_linux_keycode.

These are keycodes included in the 0xB2 DMI table, for which the
corosponding keys are not known.

Now when a user will encounter this key, a proper message wil be printed:

    dell_wmi: Unknown key with type 0xXXXX and code 0xXXXX pressed

This will then allow the key to be identified properly.

Signed-off-by: Y Paritcher <y.linux@paritcher.com>
---
 drivers/platform/x86/dell-wmi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 6b510f8431a3..dae1db96b5a0 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -196,7 +196,7 @@ struct dell_dmi_results {
 };
 
 /* Uninitialized entries here are KEY_RESERVED == 0. */
-static const u16 bios_to_linux_keycode[256] = {
+static const u16 bios_to_linux_keycode[65536] = {
 	[0]	= KEY_MEDIA,
 	[1]	= KEY_NEXTSONG,
 	[2]	= KEY_PLAYPAUSE,
@@ -237,6 +237,7 @@ static const u16 bios_to_linux_keycode[256] = {
 	[37]	= KEY_UNKNOWN,
 	[38]	= KEY_MICMUTE,
 	[255]	= KEY_PROG3,
+	[65535]	= KEY_UNKNOWN,
 };
 
 /*
@@ -503,10 +504,7 @@ static void handle_dmi_entry(const struct dmi_header *dm, void *opaque)
 					&table->keymap[i];
 
 		/* Uninitialized entries are 0 aka KEY_RESERVED. */
-		u16 keycode = (bios_entry->keycode <
-			       ARRAY_SIZE(bios_to_linux_keycode)) ?
-			bios_to_linux_keycode[bios_entry->keycode] :
-			KEY_RESERVED;
+		u16 keycode = bios_to_linux_keycode[bios_entry->keycode];
 
 		/*
 		 * Log if we find an entry in the DMI table that we don't
-- 
2.27.0
