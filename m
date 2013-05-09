From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] dell-laptop: fix error return code in dell_init()
Date: Thu, 9 May 2013 10:03:02 +0800
Message-ID: <CAPgLHd8SVKos7e9ZUCAw7sb4AUHyh0AyA1umrVVuaPMShDjJJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:64264 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755495Ab3EICDE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 May 2013 22:03:04 -0400
Received: by mail-bk0-f51.google.com with SMTP id ji2so1231976bkc.38
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 May 2013 19:03:02 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: yongjun_wei@trendmicro.com.cn, platform-driver-x86@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return -ENOMEM in the alloc_page() error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/platform/x86/dell-laptop.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 1134119..bb77e18 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -551,9 +551,10 @@ static int __init dell_init(void)
 	 * is passed to SMI handler.
 	 */
 	bufferpage = alloc_page(GFP_KERNEL | GFP_DMA32);
-
-	if (!bufferpage)
+	if (!bufferpage) {
+		ret = -ENOMEM;
 		goto fail_buffer;
+	}
 	buffer = page_address(bufferpage);
 
 	if (quirks && quirks->touchpad_led)
