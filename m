From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] asus-laptop: remove no longer used keycode_map field
Date: Wed, 25 Aug 2010 07:45:45 -0700
Message-ID: <20100825144545.GA5752@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:63524 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751527Ab0HYOpv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Aug 2010 10:45:51 -0400
Received: by pwi7 with SMTP id 7so302276pwi.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2010 07:45:51 -0700 (PDT)
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Corentin Chary <corentincj@iksaif.net>, platform-driver-x86@vger.kernel.org

The driver uses sparse keymap library and does not use this field
anymore.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/asus-laptop.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)


diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index b756e07..56e162b 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -236,7 +236,6 @@ struct asus_laptop {
 	u8 light_level;		/* light sensor level */
 	u8 light_switch;	/* light sensor switch value */
 	u16 event_count[128];	/* count for each event TODO make this better */
-	u16 *keycode_map;
 };
 
 static const struct key_entry asus_keymap[] = {
