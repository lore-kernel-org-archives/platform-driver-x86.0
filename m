From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 04/10] platform/x86: intel_mid_powerbtn: Introduce driver data
Date: Thu, 19 Jan 2017 18:39:43 +0200
Message-ID: <20170119163949.147183-5-andriy.shevchenko@linux.intel.com>
References: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:41424 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753378AbdASQlC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2017 11:41:02 -0500
In-Reply-To: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is preparatory patch to extend the driver in order to support other
Intel MID platform.

Here the new driver data structure is introduced with split of
->pbstat() callback.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 62 ++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 3ab134ba832e..bce8653cc345 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -26,6 +26,9 @@
 #include <linux/mfd/intel_msic.h>
 #include <linux/pm_wakeirq.h>
 
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+
 #define DRIVER_NAME "msic_power_btn"
 
 #define MSIC_PB_LEVEL	(1 << 3) /* 1 - release, 0 - press */
@@ -36,33 +39,72 @@
  */
 #define MSIC_PWRBTNM    (1 << 0)
 
-static irqreturn_t mid_pb_isr(int irq, void *dev_id)
+struct mid_pb_ddata {
+	struct device *dev;
+	int irq;
+	struct input_dev *input;
+	int (*pbstat)(struct mid_pb_ddata *ddata, int *value);
+};
+
+static int mfld_pbstat(struct mid_pb_ddata *ddata, int *value)
 {
-	struct input_dev *input = dev_id;
+	struct input_dev *input = ddata->input;
 	int ret;
 	u8 pbstat;
 
 	ret = intel_msic_reg_read(INTEL_MSIC_PBSTATUS, &pbstat);
+	if (ret)
+		return ret;
+
 	dev_dbg(input->dev.parent, "PB_INT status= %d\n", pbstat);
 
+	*value = !(pbstat & MSIC_PB_LEVEL);
+	return 0;
+}
+
+static irqreturn_t mid_pb_isr(int irq, void *dev_id)
+{
+	struct mid_pb_ddata *ddata = dev_id;
+	struct input_dev *input = ddata->input;
+	int value;
+	int ret;
+
+	ret = ddata->pbstat(ddata, &value);
 	if (ret < 0) {
 		dev_err(input->dev.parent, "Read error %d while reading"
 			       " MSIC_PB_STATUS\n", ret);
 	} else {
-		input_event(input, EV_KEY, KEY_POWER,
-			       !(pbstat & MSIC_PB_LEVEL));
+		input_event(input, EV_KEY, KEY_POWER, value);
 		input_sync(input);
 	}
 
 	return IRQ_HANDLED;
 }
 
+static struct mid_pb_ddata mfld_ddata = {
+	.pbstat	= mfld_pbstat,
+};
+
+#define ICPU(model, ddata)	\
+	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (kernel_ulong_t)&ddata }
+
+static const struct x86_cpu_id mid_pb_cpu_ids[] = {
+	ICPU(INTEL_FAM6_ATOM_PENWELL,		mfld_ddata),
+	{}
+};
+
 static int mid_pb_probe(struct platform_device *pdev)
 {
+	const struct x86_cpu_id *id;
+	struct mid_pb_ddata *ddata;
 	struct input_dev *input;
 	int irq = platform_get_irq(pdev, 0);
 	int error;
 
+	id = x86_match_cpu(mid_pb_cpu_ids);
+	if (!id)
+		return -ENODEV;
+
 	if (irq < 0)
 		return -EINVAL;
 
@@ -77,8 +119,16 @@ static int mid_pb_probe(struct platform_device *pdev)
 
 	input_set_capability(input, EV_KEY, KEY_POWER);
 
+	ddata = (struct mid_pb_ddata *)id->driver_data;
+	if (!ddata)
+		return -ENODATA;
+
+	ddata->dev = &pdev->dev;
+	ddata->irq = irq;
+	ddata->input = input;
+
 	error = devm_request_threaded_irq(&pdev->dev, irq, NULL, mid_pb_isr,
-					  IRQF_ONESHOT, DRIVER_NAME, input);
+					  IRQF_ONESHOT, DRIVER_NAME, ddata);
 	if (error) {
 		dev_err(&pdev->dev, "Unable to request irq %d for MID power"
 				"button\n", irq);
@@ -92,7 +142,7 @@ static int mid_pb_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	platform_set_drvdata(pdev, input);
+	platform_set_drvdata(pdev, ddata);
 
 	/*
 	 * SCU firmware might send power button interrupts to IA core before
-- 
2.11.0
