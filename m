From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] intel_mid_powerbtn: add power button driver for Medfield
 platform (#3)
Date: Sun, 30 Jan 2011 12:39:50 -0800
Message-ID: <20110130203950.GA20142@core.coreip.homeip.net>
References: <20110127134812.6753.22203.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:55603 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752075Ab1A3Uj5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 30 Jan 2011 15:39:57 -0500
Received: by pva4 with SMTP id 4so736785pva.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Jan 2011 12:39:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20110127134812.6753.22203.stgit@bob.linux.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org

On Thu, Jan 27, 2011 at 01:52:13PM +0000, Alan Cox wrote:
> From: Hong Liu <hong.liu@intel.com>
> 
> The power button is connected to MSIC on Medfield, we will get two
> interrupts from IOAPIC when pressing or releasing the power button.
> 
> Signed-off-by: Hong Liu <hong.liu@intel.com>
> [Minor fixes as noted by Dmitry]
> Signed-off-by: Alan Cox <alan@linux.intel.com>

Acked-by: Dmitry Torokhov <dtor@mail.ru>

Input parts look good to me but you might want to fold in the following
patch.

Thanks.

-- 
Dmitry


intel_mid_powerbtn: add MODULE_ALIAS to facilitate autoloading

Also rework error handling path to be more in line with other drivers.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/intel_mid_powerbtn.c |   46 ++++++++++++++++-------------
 1 files changed, 25 insertions(+), 21 deletions(-)


diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index d503d29..213e79b 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -35,7 +35,7 @@
 
 struct mfld_pb_priv {
 	struct input_dev *input;
-	int irq;
+	unsigned int irq;
 };
 
 static irqreturn_t mfld_pb_isr(int irq, void *dev_id)
@@ -58,8 +58,8 @@ static int __devinit mfld_pb_probe(struct platform_device *pdev)
 {
 	struct mfld_pb_priv *priv;
 	struct input_dev *input;
-	int ret;
 	int irq;
+	int error;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -68,42 +68,45 @@ static int __devinit mfld_pb_probe(struct platform_device *pdev)
 	priv = kzalloc(sizeof(struct mfld_pb_priv), GFP_KERNEL);
 	input = input_allocate_device();
 	if (!priv || !input) {
-		ret = -ENOMEM;
-		goto fail;
+		error = -ENOMEM;
+		goto err_free_mem;
 	}
 
 	priv->input = input;
 	priv->irq = irq;
-	platform_set_drvdata(pdev, priv);
 
 	input->name = pdev->name;
 	input->phys = "power-button/input0";
+	input->id.bustype = BUS_HOST;
 	input->dev.parent = &pdev->dev;
 
 	input_set_capability(input, EV_KEY, KEY_POWER);
 
-	ret = request_threaded_irq(priv->irq, NULL, mfld_pb_isr,
-				   0, DRIVER_NAME, priv);
-	if (ret) {
+	error = request_threaded_irq(priv->irq, NULL, mfld_pb_isr,
+				     0, DRIVER_NAME, priv);
+	if (error) {
 		dev_err(&pdev->dev,
 			"unable to request irq %d for mfld power button\n",
-									irq);
-		goto fail;
+			irq);
+		goto err_free_mem;
 	}
 
-	ret = input_register_device(input);
-	if (ret == 0)
-		goto ok;
+	error = input_register_device(input);
+	if (error) {
+		dev_err(&pdev->dev,
+			"unable to register input dev, error %d\n", error);
+		goto err_free_irq;
+	}
 
-	dev_err(&pdev->dev, "unable to register input dev, error %d\n", ret);
-	free_irq(priv->irq, priv);
+	platform_set_drvdata(pdev, priv);
+	return 0;
 
-fail:
-	platform_set_drvdata(pdev, NULL);
+err_free_irq:
+	free_irq(priv->irq, priv);
+err_free_mem:
 	input_free_device(input);
 	kfree(priv);
-ok:
-	return ret;
+	return error;
 }
 
 static int __devexit mfld_pb_remove(struct platform_device *pdev)
@@ -114,6 +117,7 @@ static int __devexit mfld_pb_remove(struct platform_device *pdev)
 	input_unregister_device(priv->input);
 	kfree(priv);
 
+	platform_set_drvdata(pdev, NULL);
 	return 0;
 }
 
@@ -130,15 +134,15 @@ static int __init mfld_pb_init(void)
 {
 	return platform_driver_register(&mfld_pb_driver);
 }
+module_init(mfld_pb_init);
 
 static void __exit mfld_pb_exit(void)
 {
 	platform_driver_unregister(&mfld_pb_driver);
 }
-
-module_init(mfld_pb_init);
 module_exit(mfld_pb_exit);
 
 MODULE_AUTHOR("Hong Liu <hong.liu@intel.com>");
 MODULE_DESCRIPTION("Intel Medfield Power Button Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
