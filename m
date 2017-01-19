From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 08/10] platform/x86: intel_mid_powerbtn: Join string literals
Date: Thu, 19 Jan 2017 18:39:47 +0200
Message-ID: <20170119163949.147183-9-andriy.shevchenko@linux.intel.com>
References: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:22487 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754251AbdASTYG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2017 14:24:06 -0500
In-Reply-To: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There is no need and bad practice for debugging to split string
literals. Join them back.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 12fbf400f228..9b718cf237ee 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -130,8 +130,8 @@ static irqreturn_t mid_pb_isr(int irq, void *dev_id)
 
 	ret = ddata->pbstat(ddata, &value);
 	if (ret < 0) {
-		dev_err(input->dev.parent, "Read error %d while reading"
-			       " MSIC_PB_STATUS\n", ret);
+		dev_err(input->dev.parent,
+			"Read error %d while reading MSIC_PB_STATUS\n", ret);
 	} else {
 		input_event(input, EV_KEY, KEY_POWER, value);
 		input_sync(input);
@@ -204,15 +204,15 @@ static int mid_pb_probe(struct platform_device *pdev)
 	error = devm_request_threaded_irq(&pdev->dev, irq, NULL, mid_pb_isr,
 					  IRQF_ONESHOT, DRIVER_NAME, ddata);
 	if (error) {
-		dev_err(&pdev->dev, "Unable to request irq %d for MID power"
-				"button\n", irq);
+		dev_err(&pdev->dev,
+			"Unable to request irq %d for MID power button\n", irq);
 		return error;
 	}
 
 	error = input_register_device(input);
 	if (error) {
-		dev_err(&pdev->dev, "Unable to register input dev, error "
-				"%d\n", error);
+		dev_err(&pdev->dev,
+			"Unable to register input dev, error %d\n", error);
 		return error;
 	}
 
@@ -220,8 +220,9 @@ static int mid_pb_probe(struct platform_device *pdev)
 
 	error = ddata->ack(ddata);
 	if (error) {
-		dev_err(&pdev->dev, "Unable to clear power button interrupt, "
-				"error: %d\n", error);
+		dev_err(&pdev->dev,
+			"Unable to clear power button interrupt, error: %d\n",
+			error);
 		return error;
 	}
 
-- 
2.11.0
