From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-nb-wmi: add some video toggle keys
Date: Wed,  4 Jul 2012 15:20:14 +0800
Message-ID: <1341386414-20398-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:40968 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755765Ab2GDHUS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Jul 2012 03:20:18 -0400
Received: by pbbrp8 with SMTP id rp8so10604629pbb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Jul 2012 00:20:18 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

There are some new video switch keys that used by newer machines.
0xA0 - SDSP HDMI only
0xA1 - SDSP LCD + HDMI
0xA2 - SDSP CRT + HDMI
0xA3 - SDSP TV + HDMI
But in Linux, there is no suitable userspace application to handle this,
so, mapping them all to KEY_SWITCHVIDEOMODE.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-nb-wmi.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 99a30b5..6de14fd 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -94,6 +94,10 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x8A, { KEY_PROG1 } },
 	{ KE_KEY, 0x95, { KEY_MEDIA } },
 	{ KE_KEY, 0x99, { KEY_PHONE } },
+	{ KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
+	{ KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
+	{ KE_KEY, 0xA2, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + HDMI */
+	{ KE_KEY, 0xA3, { KEY_SWITCHVIDEOMODE } }, /* SDSP TV + HDMI */
 	{ KE_KEY, 0xb5, { KEY_CALC } },
 	{ KE_KEY, 0xc4, { KEY_KBDILLUMUP } },
 	{ KE_KEY, 0xc5, { KEY_KBDILLUMDOWN } },
-- 
1.7.9.5
