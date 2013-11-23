From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] dell-laptop: fix to return error code in dell_send_intensity()
Date: Sat, 23 Nov 2013 21:02:51 +0800
Message-ID: <CAPgLHd_wtLWtpGjS1omFrdFyZjMzH7wT19b3X=q=ZTRd0vW=0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45]:42027 "EHLO
	mail-bk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753485Ab3KWNCw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 23 Nov 2013 08:02:52 -0500
Received: by mail-bk0-f45.google.com with SMTP id mx13so1173464bkb.18
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 Nov 2013 05:02:51 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: yongjun_wei@trendmicro.com.cn, platform-driver-x86@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return error code instead always return 0 from function
dell_send_intensity().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/platform/x86/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index c608b1d..9d7d6a0 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -684,7 +684,7 @@ static int dell_send_intensity(struct backlight_device *bd)
 
 out:
 	release_buffer();
-	return 0;
+	return ret;
 }
 
 static int dell_get_intensity(struct backlight_device *bd)
