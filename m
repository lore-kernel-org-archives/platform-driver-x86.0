From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 1/2] asus-nb-wmi: correct a touchpad hotkey mapping
Date: Tue, 28 Aug 2012 13:58:51 +0800
Message-ID: <1346133532-16686-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:37685 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751009Ab2H1F66 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Aug 2012 01:58:58 -0400
Received: by ialo24 with SMTP id o24so9937846ial.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Aug 2012 22:58:58 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

0x60 is touchpad enable key, but is misdefined in the keymap.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-nb-wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 6b0ebde..ab44fee 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -180,7 +180,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x5D, { KEY_WLAN } }, /* Wireless console Toggle */
 	{ KE_KEY, 0x5E, { KEY_WLAN } }, /* Wireless console Enable */
 	{ KE_KEY, 0x5F, { KEY_WLAN } }, /* Wireless console Disable */
-	{ KE_KEY, 0x60, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x60, { KEY_TOUCHPAD_ON } },
 	{ KE_KEY, 0x61, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0x62, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0x63, { KEY_SWITCHVIDEOMODE } },
-- 
1.7.9.5
