From: Geliang Tang <geliangtang@gmail.com>
Subject: [PATCH] platform/x86: toshiba_acpi: use memdup_user_nul
Date: Sat,  6 May 2017 23:40:19 +0800
Message-ID: <fac5b29b1e0ced6836e41c58f86da08ec523cc42.1493779654.git.geliangtang@gmail.com>
References: <6baf3aa45d0b5e0fd016b508bac905ebf8443aac.1493779294.git.geliangtang@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34923 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753350AbdEFPkk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 6 May 2017 11:40:40 -0400
In-Reply-To: <6baf3aa45d0b5e0fd016b508bac905ebf8443aac.1493779294.git.geliangtang@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Geliang Tang <geliangtang@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Use memdup_user_nul() helper instead of open-coding to simplify the
code.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index d0daf75..88f9f79 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1502,14 +1502,9 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 	int ret;
 	u32 video_out;
 
-	cmd = kmalloc(count + 1, GFP_KERNEL);
-	if (!cmd)
-		return -ENOMEM;
-	if (copy_from_user(cmd, buf, count)) {
-		kfree(cmd);
-		return -EFAULT;
-	}
-	cmd[count] = '\0';
+	cmd = memdup_user_nul(buf, count);
+	if (IS_ERR(cmd))
+		return PTR_ERR(cmd);
 
 	buffer = cmd;
 
-- 
2.9.3
