From: Manuel Lauss <manuel.lauss@googlemail.com>
Subject: [PATCH] topstar-latop: ignore 0x82 event
Date: Mon, 26 Sep 2011 15:04:54 +0200
Message-ID: <1317042294-18251-1-git-send-email-manuel.lauss@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:51894 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750949Ab1IZNFC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Sep 2011 09:05:02 -0400
Received: by eya28 with SMTP id 28so3560504eya.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Sep 2011 06:05:01 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Herton Ronaldo Krzesinski <herton@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Manuel Lauss <manuel.lauss@googlemail.com>

Event 0x82 is emitted whenever a backlight event happens (brightness
change, backlight on/off).  For instance, when display is switched
off after a timeout, event 0x82 is emitted, and along with it a keypress
which switches the display back on again.

This patch adds 0x82 to the event ignore list so that the display stays
off when it is automatically switched off.

Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>
---
 drivers/platform/x86/topstar-laptop.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index 4c20447..d528daa 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -41,6 +41,7 @@ static const struct key_entry topstar_keymap[] = {
 	{ KE_KEY, 0x8c, { KEY_MEDIA } },
 
 	/* Known non hotkey events don't handled or that we don't care yet */
+	{ KE_IGNORE, 0x82, }, /* backlight event */
 	{ KE_IGNORE, 0x8e, },
 	{ KE_IGNORE, 0x8f, },
 	{ KE_IGNORE, 0x90, },
-- 
1.7.6.1
