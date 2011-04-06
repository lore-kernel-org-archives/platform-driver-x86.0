From: Ameya Palande <2ameya@gmail.com>
Subject: [PATCH] platform/x86: Simplify intel_mid_powerbtn
Date: Wed,  6 Apr 2011 17:44:37 +0300
Message-ID: <1302101077-16865-1-git-send-email-2ameya@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nokia.com ([147.243.128.24]:24657 "EHLO mgw-da01.nokia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756159Ab1DFOom (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Apr 2011 10:44:42 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: hong.liu@intel.com

This patch:
1. Removes unnecessay #defines
2. Removes 'mfld_pb_priv' data structure which results in simpler error
   handling and less memory allocations.

Signed-off-by: Ameya Palande <2ameya@gmail.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c |   72 ++++++++++++-----------------
 1 files changed, 30 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 213e79b..f1ae507 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -23,58 +23,48 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/input.h>
+
 #include <asm/intel_scu_ipc.h>
 
 #define DRIVER_NAME "msic_power_btn"
 
-#define MSIC_IRQ_STAT	0x02
-  #define MSIC_IRQ_PB	(1 << 0)
-#define MSIC_PB_CONFIG	0x3e
 #define MSIC_PB_STATUS	0x3f
-  #define MSIC_PB_LEVEL (1 << 3) /* 1 - release, 0 - press */
-
-struct mfld_pb_priv {
-	struct input_dev *input;
-	unsigned int irq;
-};
+#define MSIC_PB_LEVEL	(1 << 3) /* 1 - release, 0 - press */
 
 static irqreturn_t mfld_pb_isr(int irq, void *dev_id)
 {
-	struct mfld_pb_priv *priv = dev_id;
+	struct input_dev *input = dev_id;
 	int ret;
 	u8 pbstat;
 
 	ret = intel_scu_ipc_ioread8(MSIC_PB_STATUS, &pbstat);
-	if (ret < 0)
-		return IRQ_HANDLED;
-
-	input_event(priv->input, EV_KEY, KEY_POWER, !(pbstat & MSIC_PB_LEVEL));
-	input_sync(priv->input);
+	if (ret < 0) {
+		dev_err(input->dev.parent, "Read error %d while reading"
+			       " MSIC_PB_STATUS\n", ret);
+	} else {
+		input_event(input, EV_KEY, KEY_POWER,
+			       !(pbstat & MSIC_PB_LEVEL));
+		input_sync(input);
+	}
 
 	return IRQ_HANDLED;
 }
 
 static int __devinit mfld_pb_probe(struct platform_device *pdev)
 {
-	struct mfld_pb_priv *priv;
 	struct input_dev *input;
-	int irq;
+	int irq = platform_get_irq(pdev, 0);
 	int error;
 
-	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return -EINVAL;
 
-	priv = kzalloc(sizeof(struct mfld_pb_priv), GFP_KERNEL);
 	input = input_allocate_device();
-	if (!priv || !input) {
-		error = -ENOMEM;
-		goto err_free_mem;
+	if (!input) {
+		dev_err(&pdev->dev, "Input device allocation error\n");
+		return -ENOMEM;
 	}
 
-	priv->input = input;
-	priv->irq = irq;
-
 	input->name = pdev->name;
 	input->phys = "power-button/input0";
 	input->id.bustype = BUS_HOST;
@@ -82,42 +72,40 @@ static int __devinit mfld_pb_probe(struct platform_device *pdev)
 
 	input_set_capability(input, EV_KEY, KEY_POWER);
 
-	error = request_threaded_irq(priv->irq, NULL, mfld_pb_isr,
-				     0, DRIVER_NAME, priv);
+	error = request_threaded_irq(irq, NULL, mfld_pb_isr, 0,
+			DRIVER_NAME, input);
 	if (error) {
-		dev_err(&pdev->dev,
-			"unable to request irq %d for mfld power button\n",
-			irq);
-		goto err_free_mem;
+		dev_err(&pdev->dev, "Unable to request irq %d for mfld power"
+				"button\n", irq);
+		goto err_free_input;
 	}
 
 	error = input_register_device(input);
 	if (error) {
-		dev_err(&pdev->dev,
-			"unable to register input dev, error %d\n", error);
+		dev_err(&pdev->dev, "Unable to register input dev, error "
+				"%d\n", error);
 		goto err_free_irq;
 	}
 
-	platform_set_drvdata(pdev, priv);
+	platform_set_drvdata(pdev, input);
 	return 0;
 
 err_free_irq:
-	free_irq(priv->irq, priv);
-err_free_mem:
+	free_irq(irq, input);
+err_free_input:
 	input_free_device(input);
-	kfree(priv);
 	return error;
 }
 
 static int __devexit mfld_pb_remove(struct platform_device *pdev)
 {
-	struct mfld_pb_priv *priv = platform_get_drvdata(pdev);
-
-	free_irq(priv->irq, priv);
-	input_unregister_device(priv->input);
-	kfree(priv);
+	struct input_dev *input = platform_get_drvdata(pdev);
+	int irq = platform_get_irq(pdev, 0);
 
+	free_irq(irq, input);
+	input_unregister_device(input);
 	platform_set_drvdata(pdev, NULL);
+
 	return 0;
 }
 
-- 
1.7.1
