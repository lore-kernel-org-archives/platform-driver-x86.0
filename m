From: Laszlo Toth <laszlth@gmail.com>
Subject: [PATCH v3] platform/x86: dell-laptop: fix kbd_get_state's request
 value
Date: Tue, 13 Feb 2018 21:43:43 +0100
Message-ID: <20180213204343.GA6586@laszlth>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:55041 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752344AbeBMUnq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Feb 2018 15:43:46 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org
Cc: stable@vger.kernel.org

Commit 9862b43624a5 ("platform/x86: dell-laptop: Allocate buffer on heap
rather than globally")
broke one request, changed it back to the original value.

Tested on a Dell E6540, backlight came back.

Fixes: 9862b43624a5 ("platform/x86: dell-laptop: Allocate buffer on heap rather than globally")
Signed-off-by: Laszlo Toth <laszlth@gmail.com>
---
Changes in v2:
 - split the fix and the function merge part
Changes in v3:
 - added fixes tag

 drivers/platform/x86/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 2a68f59..a37cff9 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1279,7 +1279,7 @@ static int kbd_get_state(struct kbd_state *state)
 	struct calling_interface_buffer buffer;
 	int ret;
 
-	dell_fill_request(&buffer, 0, 0, 0, 0);
+	dell_fill_request(&buffer, 0x1, 0, 0, 0);
 	ret = dell_send_request(&buffer,
 				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT);
 	if (ret)
-- 
2.7.4
