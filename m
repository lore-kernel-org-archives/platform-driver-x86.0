From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 1/2] platform/x86: wmi: release mutex on module acquistion failure
Date: Sun,  5 Nov 2017 21:34:33 -0600
Message-ID: <1509939274-2813-2-git-send-email-mario.limonciello@dell.com>
References: <1509939274-2813-1-git-send-email-mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa3.dell-outbound.iphmx.com ([68.232.153.94]:47905 "EHLO
        esa3.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750914AbdKFDep (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Nov 2017 22:34:45 -0500
In-Reply-To: <1509939274-2813-1-git-send-email-mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>

This failure mode should have also released the mutex.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
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
-- 
2.7.4
