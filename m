From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v4 09/12] msi-wmi: Use enums for scancodes
Date: Sat, 15 Dec 2012 19:31:33 +0200
Message-ID: <1355592696-15454-10-git-send-email-maxtram95@gmail.com>
References: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:61181 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795Ab2LORdR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 15 Dec 2012 12:33:17 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so1774080eaa.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Dec 2012 09:33:16 -0800 (PST)
In-Reply-To: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Use enums for consecutive scancodes, rename key names from MSI_WMI_* to
MSI_KEY_* and use tabs for whitespace in msi_wmi_keymap.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Acked-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/msi-wmi.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 4db0c55..112ec14 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -42,19 +42,21 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("wmi:" MSIWMI_BIOS_GUID);
 MODULE_ALIAS("wmi:" MSIWMI_EVENT_GUID);
 
-#define SCANCODE_BASE 0xD0
-#define MSI_WMI_BRIGHTNESSUP   SCANCODE_BASE
-#define MSI_WMI_BRIGHTNESSDOWN (SCANCODE_BASE + 1)
-#define MSI_WMI_VOLUMEUP       (SCANCODE_BASE + 2)
-#define MSI_WMI_VOLUMEDOWN     (SCANCODE_BASE + 3)
-#define MSI_WMI_MUTE           (SCANCODE_BASE + 4)
+enum msi_scancodes {
+	MSI_SCANCODE_BASE	= 0xD0,
+	MSI_KEY_BRIGHTNESSUP	= MSI_SCANCODE_BASE,
+	MSI_KEY_BRIGHTNESSDOWN,
+	MSI_KEY_VOLUMEUP,
+	MSI_KEY_VOLUMEDOWN,
+	MSI_KEY_MUTE,
+};
 static struct key_entry msi_wmi_keymap[] = {
-	{ KE_KEY, MSI_WMI_BRIGHTNESSUP,   {KEY_BRIGHTNESSUP} },
-	{ KE_KEY, MSI_WMI_BRIGHTNESSDOWN, {KEY_BRIGHTNESSDOWN} },
-	{ KE_KEY, MSI_WMI_VOLUMEUP,       {KEY_VOLUMEUP} },
-	{ KE_KEY, MSI_WMI_VOLUMEDOWN,     {KEY_VOLUMEDOWN} },
-	{ KE_KEY, MSI_WMI_MUTE,           {KEY_MUTE} },
-	{ KE_END, 0}
+	{ KE_KEY, MSI_KEY_BRIGHTNESSUP,		{KEY_BRIGHTNESSUP} },
+	{ KE_KEY, MSI_KEY_BRIGHTNESSDOWN,	{KEY_BRIGHTNESSDOWN} },
+	{ KE_KEY, MSI_KEY_VOLUMEUP,		{KEY_VOLUMEUP} },
+	{ KE_KEY, MSI_KEY_VOLUMEDOWN,		{KEY_VOLUMEDOWN} },
+	{ KE_KEY, MSI_KEY_MUTE,			{KEY_MUTE} },
+	{ KE_END, 0 }
 };
 static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
 
@@ -169,7 +171,7 @@ static void msi_wmi_notify(u32 value, void *context)
 			ktime_t diff;
 			cur = ktime_get_real();
 			diff = ktime_sub(cur, last_pressed[key->code -
-					SCANCODE_BASE]);
+					MSI_SCANCODE_BASE]);
 			/* Ignore event if the same event happened in a 50 ms
 			   timeframe -> Key press may result in 10-20 GPEs */
 			if (ktime_to_us(diff) < 1000 * 50) {
@@ -178,13 +180,13 @@ static void msi_wmi_notify(u32 value, void *context)
 					 key->code, ktime_to_us(diff));
 				goto msi_wmi_notify_exit;
 			}
-			last_pressed[key->code - SCANCODE_BASE] = cur;
+			last_pressed[key->code - MSI_SCANCODE_BASE] = cur;
 
 			if (key->type == KE_KEY &&
 			/* Brightness is served via acpi video driver */
 			(!acpi_video_backlight_support() ||
-			(key->code != MSI_WMI_BRIGHTNESSUP &&
-			key->code != MSI_WMI_BRIGHTNESSDOWN))) {
+			(key->code != MSI_KEY_BRIGHTNESSUP &&
+			key->code != MSI_KEY_BRIGHTNESSDOWN))) {
 				pr_debug("Send key: 0x%X - "
 					 "Input layer keycode: %d\n",
 					 key->code, key->keycode);
-- 
1.8.0.1
