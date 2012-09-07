From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 2/2] asus-laptop: add all video switch keys
Date: Fri,  7 Sep 2012 10:56:59 +0800
Message-ID: <1346986619-5199-2-git-send-email-acelan.kao@canonical.com>
References: <1346986619-5199-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:47623 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932110Ab2IGC5K (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Sep 2012 22:57:10 -0400
Received: by mail-iy0-f174.google.com with SMTP id k25so2773257iah.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Sep 2012 19:57:10 -0700 (PDT)
In-Reply-To: <1346986619-5199-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

Fill up all the video switch keys in the map.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-laptop.c |   26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 34a1530..c251c1d 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -319,9 +319,13 @@ static const struct key_entry asus_keymap[] = {
 	{KE_KEY, 0x5E, { KEY_WLAN } },
 	{KE_KEY, 0x5F, { KEY_WLAN } },
 	{KE_KEY, 0x60, { KEY_TOUCHPAD_ON } },
-	{KE_KEY, 0x61, { KEY_SWITCHVIDEOMODE } },
-	{KE_KEY, 0x62, { KEY_SWITCHVIDEOMODE } },
-	{KE_KEY, 0x63, { KEY_SWITCHVIDEOMODE } },
+	{KE_KEY, 0x61, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD only */
+	{KE_KEY, 0x62, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT only */
+	{KE_KEY, 0x63, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT */
+	{KE_KEY, 0x64, { KEY_SWITCHVIDEOMODE } }, /* SDSP TV */
+	{KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
+	{KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
+	{KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
 	{KE_KEY, 0x6B, { KEY_F13 } }, /* Lock Touchpad */
 	{KE_KEY, 0x6C, { KEY_SLEEP } }, /* Suspend */
 	{KE_KEY, 0x6D, { KEY_SLEEP } }, /* Hibernate */
@@ -330,8 +334,24 @@ static const struct key_entry asus_keymap[] = {
 	{KE_KEY, 0x82, { KEY_CAMERA } },
 	{KE_KEY, 0x88, { KEY_WLAN  } },
 	{KE_KEY, 0x8A, { KEY_PROG1 } },
+	{KE_KEY, 0x8C, { KEY_SWITCHVIDEOMODE } }, /* SDSP DVI only */
+	{KE_KEY, 0x8D, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + DVI */
+	{KE_KEY, 0x8E, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + DVI */
+	{KE_KEY, 0x8F, { KEY_SWITCHVIDEOMODE } }, /* SDSP TV + DVI */
+	{KE_KEY, 0x90, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + DVI */
+	{KE_KEY, 0x91, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV + DVI */
+	{KE_KEY, 0x92, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV + DVI */
+	{KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + DVI */
 	{KE_KEY, 0x95, { KEY_MEDIA } },
 	{KE_KEY, 0x99, { KEY_PHONE } },
+	{KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
+	{KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
+	{KE_KEY, 0xA2, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + HDMI */
+	{KE_KEY, 0xA3, { KEY_SWITCHVIDEOMODE } }, /* SDSP TV + HDMI */
+	{KE_KEY, 0xA4, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + HDMI */
+	{KE_KEY, 0xA5, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV + HDMI */
+	{KE_KEY, 0xA6, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV + HDMI */
+	{KE_KEY, 0xA7, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + HDMI */
 	{KE_KEY, 0xc4, { KEY_KBDILLUMUP } },
 	{KE_KEY, 0xc5, { KEY_KBDILLUMDOWN } },
 	{KE_KEY, 0xb5, { KEY_CALC } },
-- 
1.7.9.5
