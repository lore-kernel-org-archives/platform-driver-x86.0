From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 05/10] platform/x86: intel_mid_powerbtn: Factor out mfld_ack()
Date: Thu, 19 Jan 2017 18:39:44 +0200
Message-ID: <20170119163949.147183-6-andriy.shevchenko@linux.intel.com>
References: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Move Intel Medfield specific code to another callback, which will be
used later.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index bce8653cc345..596ac9f3e89d 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -44,6 +44,7 @@ struct mid_pb_ddata {
 	int irq;
 	struct input_dev *input;
 	int (*pbstat)(struct mid_pb_ddata *ddata, int *value);
+	int (*ack)(struct mid_pb_ddata *ddata);
 };
 
 static int mfld_pbstat(struct mid_pb_ddata *ddata, int *value)
@@ -62,6 +63,21 @@ static int mfld_pbstat(struct mid_pb_ddata *ddata, int *value)
 	return 0;
 }
 
+static int mfld_ack(struct mid_pb_ddata *ddata)
+{
+	/*
+	 * SCU firmware might send power button interrupts to IA core before
+	 * kernel boots and doesn't get EOI from IA core. The first bit of
+	 * MSIC reg 0x21 is kept masked, and SCU firmware doesn't send new
+	 * power interrupt to Android kernel. Unmask the bit when probing
+	 * power button in kernel.
+	 * There is a very narrow race between irq handler and power button
+	 * initialization. The race happens rarely. So we needn't worry
+	 * about it.
+	 */
+	return intel_msic_reg_update(INTEL_MSIC_IRQLVL1MSK, 0, MSIC_PWRBTNM);
+}
+
 static irqreturn_t mid_pb_isr(int irq, void *dev_id)
 {
 	struct mid_pb_ddata *ddata = dev_id;
@@ -83,6 +99,7 @@ static irqreturn_t mid_pb_isr(int irq, void *dev_id)
 
 static struct mid_pb_ddata mfld_ddata = {
 	.pbstat	= mfld_pbstat,
+	.ack	= mfld_ack,
 };
 
 #define ICPU(model, ddata)	\
@@ -144,17 +161,7 @@ static int mid_pb_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ddata);
 
-	/*
-	 * SCU firmware might send power button interrupts to IA core before
-	 * kernel boots and doesn't get EOI from IA core. The first bit of
-	 * MSIC reg 0x21 is kept masked, and SCU firmware doesn't send new
-	 * power interrupt to Android kernel. Unmask the bit when probing
-	 * power button in kernel.
-	 * There is a very narrow race between irq handler and power button
-	 * initialization. The race happens rarely. So we needn't worry
-	 * about it.
-	 */
-	error = intel_msic_reg_update(INTEL_MSIC_IRQLVL1MSK, 0, MSIC_PWRBTNM);
+	error = ddata->ack(ddata);
 	if (error) {
 		dev_err(&pdev->dev, "Unable to clear power button interrupt, "
 				"error: %d\n", error);
-- 
2.11.0
