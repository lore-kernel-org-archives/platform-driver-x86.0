From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 1/2] Fix to return a negative error code in the sonypi_compat_init()
Date: Wed, 29 May 2013 06:55:32 +0900
Message-ID: <1369778133-24015-2-git-send-email-malattia@linux.it>
References: <1369778133-24015-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:46674 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758018Ab3E1WCi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 May 2013 18:02:38 -0400
In-Reply-To: <1369778133-24015-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Mattia Dongili <malattia@linux.it>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Return -1 in the error handling case instead of 0, as done elsewhere in
this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 2ac045f..b162733 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -4320,7 +4320,8 @@ static int sony_pic_add(struct acpi_device *device)
 		goto err_free_resources;
 	}
 
-	if (sonypi_compat_init())
+	result = sonypi_compat_init();
+	if (result)
 		goto err_remove_input;
 
 	/* request io port */
-- 
1.7.10.4
