From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 01/14] eeepc-wmi: reorder keymap
Date: Mon, 24 Jan 2011 17:23:45 +0100
Message-ID: <1295886238-15961-2-git-send-email-corentincj@iksaif.net>
References: <1295886238-15961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp3.tech.numericable.fr ([82.216.111.39]:49840 "EHLO
	smtp3.tech.numericable.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752949Ab1AXQYa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 24 Jan 2011 11:24:30 -0500
In-Reply-To: <1295886238-15961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Chris Bagwell <chris@cnpbagwell.com>, Corentin Chary <corentincj@iksaif.net>

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-wmi.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 4d38f98..350b7bc 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -74,18 +74,18 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
 
 static const struct key_entry eeepc_wmi_keymap[] = {
 	/* Sleep already handled via generic ACPI code */
-	{ KE_KEY, 0x5d, { KEY_WLAN } },
-	{ KE_KEY, 0x32, { KEY_MUTE } },
-	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
-	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
 	{ KE_IGNORE, NOTIFY_BRNDOWN_MIN, { KEY_BRIGHTNESSDOWN } },
 	{ KE_IGNORE, NOTIFY_BRNUP_MIN, { KEY_BRIGHTNESSUP } },
-	{ KE_KEY, 0xcc, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
+	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
+	{ KE_KEY, 0x32, { KEY_MUTE } },
+	{ KE_KEY, 0x5c, { KEY_F15 } },
+	{ KE_KEY, 0x5d, { KEY_WLAN } },
 	{ KE_KEY, 0x6b, { KEY_F13 } }, /* Disable Touchpad */
+	{ KE_KEY, 0xcc, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0xe0, { KEY_PROG1 } },
 	{ KE_KEY, 0xe1, { KEY_F14 } },
 	{ KE_KEY, 0xe9, { KEY_DISPLAY_OFF } },
-	{ KE_KEY, 0xe0, { KEY_PROG1 } },
-	{ KE_KEY, 0x5c, { KEY_F15 } },
 	{ KE_END, 0},
 };
 
-- 
1.7.3.4
