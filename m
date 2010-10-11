From: chris@cnpbagwell.com
Subject: [PATCH v2 1/2] eeepc-wmi: add additional hotkeys
Date: Mon, 11 Oct 2010 18:47:17 -0500
Message-ID: <1286840838-16844-1-git-send-email-chris@cnpbagwell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:52210 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753561Ab0JKXre (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Oct 2010 19:47:34 -0400
Received: by ywi6 with SMTP id 6so850636ywi.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2010 16:47:34 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, corentin.chary@gmail.com, yong.y.wang@intel.com
Cc: Chris Bagwell <chris@cnpbagwell.com>

From: Chris Bagwell <chris@cnpbagwell.com>

Added 4 hotkeys using same keymap values as eeepc-latop.
These are mousepad toggle, resolution change, screen off,
and task manager.  These were tested on 1005PE and are the
Fn-F3, F4, F7, and F9, respectively.

Also, added a new hot key for power toggles (Fn-Space on 1005PE)
and is meant to drive cpufv interface from userspace.

Signed-off-by: Chris Bagwell <chris@cnpbagwell.com>
---
 drivers/platform/x86/eeepc-wmi.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 9dc50fb..21df266 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -69,6 +69,11 @@ static const struct key_entry eeepc_wmi_keymap[] = {
 	{ KE_IGNORE, NOTIFY_BRNDOWN_MIN, { KEY_BRIGHTNESSDOWN } },
 	{ KE_IGNORE, NOTIFY_BRNUP_MIN, { KEY_BRIGHTNESSUP } },
 	{ KE_KEY, 0xcc, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x6b, { KEY_F13 } }, /* Disable Touchpad */
+	{ KE_KEY, 0xe1, { KEY_F14 } },
+	{ KE_KEY, 0xe9, { KEY_DISPLAY_OFF } },
+	{ KE_KEY, 0xe0, { KEY_PROG1 } },
+	{ KE_KEY, 0x5c, { KEY_F15 } },
 	{ KE_END, 0},
 };
 
-- 
1.7.3.1
