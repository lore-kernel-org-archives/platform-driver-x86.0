From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 1/2] asus-laptop: correct a touchpad hotkey mapping
Date: Fri,  7 Sep 2012 10:56:58 +0800
Message-ID: <1346986619-5199-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:47623 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932133Ab2IGC5H (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Sep 2012 22:57:07 -0400
Received: by iahk25 with SMTP id k25so2773257iah.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Sep 2012 19:57:05 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

0x60 is touchpad enable key, but is misdefined in the keymap.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-laptop.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index e38f91b..34a1530 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -318,7 +318,7 @@ static const struct key_entry asus_keymap[] = {
 	{KE_KEY, 0x5D, { KEY_WLAN } },
 	{KE_KEY, 0x5E, { KEY_WLAN } },
 	{KE_KEY, 0x5F, { KEY_WLAN } },
-	{KE_KEY, 0x60, { KEY_SWITCHVIDEOMODE } },
+	{KE_KEY, 0x60, { KEY_TOUCHPAD_ON } },
 	{KE_KEY, 0x61, { KEY_SWITCHVIDEOMODE } },
 	{KE_KEY, 0x62, { KEY_SWITCHVIDEOMODE } },
 	{KE_KEY, 0x63, { KEY_SWITCHVIDEOMODE } },
-- 
1.7.9.5
