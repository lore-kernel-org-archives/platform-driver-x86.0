From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] platform/x86: wmi: Fix missing unlock on error in wmi_ioctl()
Date: Tue, 14 Nov 2017 06:57:56 +0000
Message-ID: <1510642676-123654-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:10533 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751925AbdKNG4D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 01:56:03 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, platform-driver-x86@vger.kernel.org

Add the missing unlock before return from function wmi_ioctl()
in the error handling case.

Fixes: 44b6b7661132 ("platform/x86: wmi: create userspace interface for drivers")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/platform/x86/wmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 8c31ed4..791449a 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -868,8 +868,10 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	/* let the driver do any filtering and do the call */
 	wdriver = container_of(wblock->dev.dev.driver,
 			       struct wmi_driver, driver);
-	if (!try_module_get(wdriver->driver.owner))
-		return -EBUSY;
+	if (!try_module_get(wdriver->driver.owner)) {
+		ret = -EBUSY;
+		goto out_ioctl;
+	}
 	ret = wdriver->filter_callback(&wblock->dev, cmd, buf);
 	module_put(wdriver->driver.owner);
 	if (ret)
