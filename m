From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 01/10] platform/x86: intel_mid_powerbtn: Set IRQ_ONESHOT
Date: Thu, 19 Jan 2017 18:39:40 +0200
Message-ID: <20170119163949.147183-2-andriy.shevchenko@linux.intel.com>
References: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:31130 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753328AbdASRUs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2017 12:20:48 -0500
In-Reply-To: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The commit 1c6c69525b40 ("genirq: Reject bogus threaded irq requests")
starts refusing misconfigured interrupt handlers. This makes
intel_mid_powerbtn not working anymore.

Add a mandatory flag to a threaded IRQ request in the driver.

Fixes: 1c6c69525b40 ("genirq: Reject bogus threaded irq requests")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 1fc0de870ff8..361770568ad0 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -77,7 +77,7 @@ static int mfld_pb_probe(struct platform_device *pdev)
 
 	input_set_capability(input, EV_KEY, KEY_POWER);
 
-	error = request_threaded_irq(irq, NULL, mfld_pb_isr, 0,
+	error = request_threaded_irq(irq, NULL, mfld_pb_isr, IRQF_ONESHOT,
 				     DRIVER_NAME, input);
 	if (error) {
 		dev_err(&pdev->dev, "Unable to request irq %d for mfld power"
-- 
2.11.0
