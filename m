From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 02/10] platform/x86: intel_mid_powerbtn: Convert to use devm_*()
Date: Thu, 19 Jan 2017 18:39:41 +0200
Message-ID: <20170119163949.147183-3-andriy.shevchenko@linux.intel.com>
References: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Convert driver to use managed resources.
This eliminates error path boilerplate and makes code neat.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 361770568ad0..05c52cc87852 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -66,7 +66,7 @@ static int mfld_pb_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return -EINVAL;
 
-	input = input_allocate_device();
+	input = devm_input_allocate_device(&pdev->dev);
 	if (!input)
 		return -ENOMEM;
 
@@ -77,22 +77,19 @@ static int mfld_pb_probe(struct platform_device *pdev)
 
 	input_set_capability(input, EV_KEY, KEY_POWER);
 
-	error = request_threaded_irq(irq, NULL, mfld_pb_isr, IRQF_ONESHOT,
-				     DRIVER_NAME, input);
+	error = devm_request_threaded_irq(&pdev->dev, irq, NULL, mfld_pb_isr,
+					  IRQF_ONESHOT, DRIVER_NAME, input);
 	if (error) {
 		dev_err(&pdev->dev, "Unable to request irq %d for mfld power"
 				"button\n", irq);
-		goto err_free_input;
+		return error;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
-	dev_pm_set_wake_irq(&pdev->dev, irq);
-
 	error = input_register_device(input);
 	if (error) {
 		dev_err(&pdev->dev, "Unable to register input dev, error "
 				"%d\n", error);
-		goto err_free_irq;
+		return error;
 	}
 
 	platform_set_drvdata(pdev, input);
@@ -111,27 +108,19 @@ static int mfld_pb_probe(struct platform_device *pdev)
 	if (error) {
 		dev_err(&pdev->dev, "Unable to clear power button interrupt, "
 				"error: %d\n", error);
-		goto err_free_irq;
+		return error;
 	}
 
-	return 0;
+	device_init_wakeup(&pdev->dev, true);
+	dev_pm_set_wake_irq(&pdev->dev, irq);
 
-err_free_irq:
-	free_irq(irq, input);
-err_free_input:
-	input_free_device(input);
-	return error;
+	return 0;
 }
 
 static int mfld_pb_remove(struct platform_device *pdev)
 {
-	struct input_dev *input = platform_get_drvdata(pdev);
-	int irq = platform_get_irq(pdev, 0);
-
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-	free_irq(irq, input);
-	input_unregister_device(input);
 
 	return 0;
 }
-- 
2.11.0
