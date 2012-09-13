From: Grant Likely <grant.likely@secretlab.ca>
Subject: [PATCH] gmux: Fix backlight set function
Date: Thu, 13 Sep 2012 21:02:35 +0100
Message-ID: <1347566555-9388-1-git-send-email-grant.likely@secretlab.ca>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:55131 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753496Ab2IMUCp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Sep 2012 16:02:45 -0400
Received: by wibhq12 with SMTP id hq12so1311893wib.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Sep 2012 13:02:44 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Matthew Garrett <mjg@redhat.com>

In commit 7e30ed6b, "gmux: Add generic write32 function", the new
gmux_write32() function didn't include the io offset when writing
registers. This means that backlight update writes never go to the right
place. This patch fixes it.

Tested on Apple Macbook 8,3

Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
Cc: Matthew Garrett <mjg@redhat.com>
---
 drivers/platform/x86/apple-gmux.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index dfb1a92..ee21056 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -101,7 +101,7 @@ static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int port,
 
 	for (i = 0; i < 4; i++) {
 		tmpval = (val >> (i * 8)) & 0xff;
-		outb(tmpval, port + i);
+		outb(tmpval, gmux_data->iostart + port + i);
 	}
 }
 
-- 
1.7.9.5
