From: chris@cnpbagwell.com
Subject: [PATCH 1/2] eeepc-wmi: add additional hotkeys
Date: Sun, 10 Oct 2010 20:48:21 -0500
Message-ID: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:39136 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751749Ab0JKBtw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 10 Oct 2010 21:49:52 -0400
Received: by yxm8 with SMTP id 8so40444yxm.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Oct 2010 18:49:52 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com
Cc: Chris Bagwell <chris@cnpbagwell.com>

From: Chris Bagwell <chris@cnpbagwell.com>

Added 4 hotkeys using same keymap values as eeepc-latop.
These are mousepad toggle, resolution change, screen off,
and task manager.  These were tested on 1005PE and are the
Fn-F3, F4, F7, and F9, respectively.

Also, added a new hot key for power toggles (Fn-Space on 1005PE)
and is meant to drive cpufv interface from userspace.

Finally, added several keys to be ignored that are being emitted
but do not mapped to any useful or documented hotkeys.  This is
purely cosmetic to prevent uknown key reports on console/log files.
These keys are reported on 1005PE's.

Signed-off-by: Chris Bagwell <chris@cnpbagwell.com>
---
 drivers/platform/x86/eeepc-wmi.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 9dc50fb..441b000 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -60,6 +60,10 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
 
 #define EEEPC_WMI_DEVID_BACKLIGHT	0x00050012
 
+/* Keys marked with KE_IGNORE and KEY_RESERVE are keys known to
+ * not be useful to userspace and prevents printing to console
+ * about unknown key received.
+ */
 static const struct key_entry eeepc_wmi_keymap[] = {
 	/* Sleep already handled via generic ACPI code */
 	{ KE_KEY, 0x5d, { KEY_WLAN } },
@@ -69,6 +73,17 @@ static const struct key_entry eeepc_wmi_keymap[] = {
 	{ KE_IGNORE, NOTIFY_BRNDOWN_MIN, { KEY_BRIGHTNESSDOWN } },
 	{ KE_IGNORE, NOTIFY_BRNUP_MIN, { KEY_BRIGHTNESSUP } },
 	{ KE_KEY, 0xcc, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x6b, { KEY_F13 } }, /* Disable Touchpad */
+	{ KE_KEY, 0xe1, { KEY_F14 } },
+	{ KE_KEY, 0xe9, { KEY_DISPLAY_OFF } },
+	{ KE_KEY, 0xe0, { KEY_PROG1 } },
+	{ KE_KEY, 0x5c, { KEY_F15 } },
+	{ KE_IGNORE, 0x83, { KEY_RESERVED } },
+	{ KE_IGNORE, 0xeb, { KEY_RESERVED } },
+	{ KE_IGNORE, 0xec, { KEY_RESERVED } },
+	{ KE_IGNORE, 0xed, { KEY_RESERVED } },
+	{ KE_IGNORE, 0xee, { KEY_RESERVED } },
+	{ KE_IGNORE, 0xef, { KEY_RESERVED } },
 	{ KE_END, 0},
 };
 
-- 
1.7.3.1
