From: Pau Espin Pedrol <pespin.shar@gmail.com>
Subject: [PATCH] eeepc-laptop: Skip unknown key messages 0x50 0x51
Date: Fri, 10 Feb 2017 18:48:37 +0100
Message-ID: <20170210174837.1078-1-pespin.shar@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33354 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753479AbdBJSBC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2017 13:01:02 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Pau Espin Pedrol <pespin.shar@gmail.com>

Otherwise those are printed several times when (un)plugging the AC
connector.

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 drivers/platform/x86/eeepc-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 8cdf315f9730..9fab3ee269bb 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -150,6 +150,8 @@ static const struct key_entry eeepc_keymap[] = {
 	{ KE_KEY, 0x32, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0x37, { KEY_F13 } }, /* Disable Touchpad */
 	{ KE_KEY, 0x38, { KEY_F14 } },
+	{ KE_IGNORE, 0x50, { KEY_RESERVED } }, /* AC plugged */
+	{ KE_IGNORE, 0x51, { KEY_RESERVED } }, /* AC unplugged */
 	{ KE_END, 0 },
 };
 
-- 
2.11.1
