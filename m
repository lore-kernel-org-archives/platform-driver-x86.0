From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] sony-laptop: fix error return code in sony_pic_add()
Date: Tue, 7 May 2013 20:05:44 +0800
Message-ID: <CAPgLHd8HFBFUrwVP3xYGAz1LNhBHkARU7AUqDDb8U5RLOfQGPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f48.google.com ([209.85.214.48]:42826 "EHLO
	mail-bk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756490Ab3EGMFp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 May 2013 08:05:45 -0400
Received: by mail-bk0-f48.google.com with SMTP id jf3so248324bkc.35
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 May 2013 05:05:44 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: malattia@linux.it, matthew.garrett@nebula.com
Cc: yongjun_wei@trendmicro.com.cn, platform-driver-x86@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code in the sonypi_compat_init() error
handling case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/platform/x86/sony-laptop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index d544e3a..4e93565 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -4302,7 +4302,8 @@ static int sony_pic_add(struct acpi_device *device)
 		goto err_free_resources;
 	}
 
-	if (sonypi_compat_init())
+	result = sonypi_compat_init();
+	if (result)
 		goto err_remove_input;
 
 	/* request io port */
