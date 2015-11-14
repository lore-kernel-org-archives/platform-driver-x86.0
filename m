From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH 2/3] dell_wmi: Use a C99-style array for bios_to_linux_keycode
Date: Fri, 13 Nov 2015 21:49:31 -0800
Message-ID: <c97f6a3b8c48eef0312db51e06a266e3ffeca620.1447479930.git.luto@kernel.org>
References: <cover.1447479930.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59693 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750877AbbKNFts (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Nov 2015 00:49:48 -0500
In-Reply-To: <cover.1447479930.git.luto@kernel.org>
In-Reply-To: <cover.1447479930.git.luto@kernel.org>
References: <cover.1447479930.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Lutomirski <luto@kernel.org>

It's currently hard to follow what maps to what, and it's hard to edit
the array.  Redo it as a C99-style array.

I generated this using emacs regexes and a python one-liner.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 drivers/platform/x86/dell-wmi.c | 61 +++++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 5be1abec4f64..92b0149fa4a7 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -119,27 +119,46 @@ struct dell_bios_hotkey_table {
 static const struct dell_bios_hotkey_table *dell_bios_hotkey_table;
 
 static const u16 bios_to_linux_keycode[256] __initconst = {
-
-	KEY_MEDIA,	KEY_NEXTSONG,	KEY_PLAYPAUSE, KEY_PREVIOUSSONG,
-	KEY_STOPCD,	KEY_UNKNOWN,	KEY_UNKNOWN,	KEY_UNKNOWN,
-	KEY_WWW,	KEY_UNKNOWN,	KEY_VOLUMEDOWN, KEY_MUTE,
-	KEY_VOLUMEUP,	KEY_UNKNOWN,	KEY_BATTERY,	KEY_EJECTCD,
-	KEY_UNKNOWN,	KEY_SLEEP,	KEY_PROG1, KEY_BRIGHTNESSDOWN,
-	KEY_BRIGHTNESSUP,	KEY_UNKNOWN,	KEY_KBDILLUMTOGGLE,
-	KEY_UNKNOWN,	KEY_SWITCHVIDEOMODE,	KEY_UNKNOWN, KEY_UNKNOWN,
-	KEY_SWITCHVIDEOMODE,	KEY_UNKNOWN,	KEY_UNKNOWN, KEY_PROG2,
-	KEY_UNKNOWN,	KEY_UNKNOWN,	KEY_UNKNOWN,	KEY_UNKNOWN,
-	KEY_UNKNOWN,	KEY_UNKNOWN,	KEY_UNKNOWN,	KEY_MICMUTE,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_PROG3
+	[0]	= KEY_MEDIA,
+	[1]	= KEY_NEXTSONG,
+	[2]	= KEY_PLAYPAUSE,
+	[3]	= KEY_PREVIOUSSONG,
+	[4]	= KEY_STOPCD,
+	[5]	= KEY_UNKNOWN,
+	[6]	= KEY_UNKNOWN,
+	[7]	= KEY_UNKNOWN,
+	[8]	= KEY_WWW,
+	[9]	= KEY_UNKNOWN,
+	[10]	= KEY_VOLUMEDOWN,
+	[11]	= KEY_MUTE,
+	[12]	= KEY_VOLUMEUP,
+	[13]	= KEY_UNKNOWN,
+	[14]	= KEY_BATTERY,
+	[15]	= KEY_EJECTCD,
+	[16]	= KEY_UNKNOWN,
+	[17]	= KEY_SLEEP,
+	[18]	= KEY_PROG1,
+	[19]	= KEY_BRIGHTNESSDOWN,
+	[20]	= KEY_BRIGHTNESSUP,
+	[21]	= KEY_UNKNOWN,
+	[22]	= KEY_KBDILLUMTOGGLE,
+	[23]	= KEY_UNKNOWN,
+	[24]	= KEY_SWITCHVIDEOMODE,
+	[25]	= KEY_UNKNOWN,
+	[26]	= KEY_UNKNOWN,
+	[27]	= KEY_SWITCHVIDEOMODE,
+	[28]	= KEY_UNKNOWN,
+	[29]	= KEY_UNKNOWN,
+	[30]	= KEY_PROG2,
+	[31]	= KEY_UNKNOWN,
+	[32]	= KEY_UNKNOWN,
+	[33]	= KEY_UNKNOWN,
+	[34]	= KEY_UNKNOWN,
+	[35]	= KEY_UNKNOWN,
+	[36]	= KEY_UNKNOWN,
+	[37]	= KEY_UNKNOWN,
+	[38]	= KEY_MICMUTE,
+	[255]	= KEY_PROG3,
 };
 
 /* These are applied if the hk table is present and doesn't override them. */
-- 
2.5.0
