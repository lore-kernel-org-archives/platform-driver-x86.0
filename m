From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: wmi: Replace kmalloc + sprintf() with kasprintf()
Date: Fri, 16 Feb 2018 17:40:24 +0200
Message-ID: <20180216154024.389-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:33268 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756412AbeBPPk1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Feb 2018 10:40:27 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

kasprintf() does the job of two: kmalloc() and sprintf().
Replace two calls with one.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/wmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index c0c8945603cb..4e76ffcb5394 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -933,12 +933,11 @@ static int wmi_dev_probe(struct device *dev)
 			goto probe_failure;
 		}
 
-		buf = kmalloc(strlen(wdriver->driver.name) + 5, GFP_KERNEL);
+		buf = kasprintf(GFP_KERNEL, "wmi/%s", wdriver->driver.name);
 		if (!buf) {
 			ret = -ENOMEM;
 			goto probe_string_failure;
 		}
-		sprintf(buf, "wmi/%s", wdriver->driver.name);
 		wblock->char_dev.minor = MISC_DYNAMIC_MINOR;
 		wblock->char_dev.name = buf;
 		wblock->char_dev.fops = &wmi_fops;
-- 
2.16.1
