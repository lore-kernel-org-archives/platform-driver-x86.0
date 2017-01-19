From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 03/10] platform/x86: intel_mid_powerbtn: Substitute mfld by mid
Date: Thu, 19 Jan 2017 18:39:42 +0200
Message-ID: <20170119163949.147183-4-andriy.shevchenko@linux.intel.com>
References: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Replace all occurrences of mfld by mid to emphasize that driver is used
for Intel MID platforms.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 05c52cc87852..3ab134ba832e 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -1,5 +1,5 @@
 /*
- * Power button driver for Medfield.
+ * Power button driver for Intel MID platforms.
  *
  * Copyright (C) 2010 Intel Corp
  *
@@ -36,7 +36,7 @@
  */
 #define MSIC_PWRBTNM    (1 << 0)
 
-static irqreturn_t mfld_pb_isr(int irq, void *dev_id)
+static irqreturn_t mid_pb_isr(int irq, void *dev_id)
 {
 	struct input_dev *input = dev_id;
 	int ret;
@@ -57,7 +57,7 @@ static irqreturn_t mfld_pb_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int mfld_pb_probe(struct platform_device *pdev)
+static int mid_pb_probe(struct platform_device *pdev)
 {
 	struct input_dev *input;
 	int irq = platform_get_irq(pdev, 0);
@@ -77,10 +77,10 @@ static int mfld_pb_probe(struct platform_device *pdev)
 
 	input_set_capability(input, EV_KEY, KEY_POWER);
 
-	error = devm_request_threaded_irq(&pdev->dev, irq, NULL, mfld_pb_isr,
+	error = devm_request_threaded_irq(&pdev->dev, irq, NULL, mid_pb_isr,
 					  IRQF_ONESHOT, DRIVER_NAME, input);
 	if (error) {
-		dev_err(&pdev->dev, "Unable to request irq %d for mfld power"
+		dev_err(&pdev->dev, "Unable to request irq %d for MID power"
 				"button\n", irq);
 		return error;
 	}
@@ -117,7 +117,7 @@ static int mfld_pb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mfld_pb_remove(struct platform_device *pdev)
+static int mid_pb_remove(struct platform_device *pdev)
 {
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
@@ -125,17 +125,17 @@ static int mfld_pb_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver mfld_pb_driver = {
+static struct platform_driver mid_pb_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 	},
-	.probe	= mfld_pb_probe,
-	.remove	= mfld_pb_remove,
+	.probe	= mid_pb_probe,
+	.remove	= mid_pb_remove,
 };
 
-module_platform_driver(mfld_pb_driver);
+module_platform_driver(mid_pb_driver);
 
 MODULE_AUTHOR("Hong Liu <hong.liu@intel.com>");
-MODULE_DESCRIPTION("Intel Medfield Power Button Driver");
+MODULE_DESCRIPTION("Intel MID Power Button Driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.11.0
