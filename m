From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] platform/x86: intel_mid_powerbtn: Unify IRQ acknowledegment
Date: Thu,  2 Feb 2017 19:54:28 +0200
Message-ID: <20170202175428.183482-4-andriy.shevchenko@linux.intel.com>
References: <20170202175428.183482-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170202175428.183482-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The IRQ on Intel Merrifield can be acknowledged in the similar way it's
done for previous MID platforms. Unify acknowledgement via SCU IPC.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index de40c71883f8..38844f765345 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -52,9 +52,9 @@ struct mid_pb_ddata {
 	struct device *dev;
 	int irq;
 	struct input_dev *input;
+	unsigned short mirqlvl1_addr;
 	unsigned short pbstat_addr;
 	u8 pbstat_mask;
-	int (*ack)(struct mid_pb_ddata *ddata);
 	int (*setup)(struct mid_pb_ddata *ddata);
 };
 
@@ -74,14 +74,9 @@ static int mid_pbstat(struct mid_pb_ddata *ddata, int *value)
 	return 0;
 }
 
-static int mfld_ack(struct mid_pb_ddata *ddata)
+static int mid_irq_ack(struct mid_pb_ddata *ddata)
 {
-	return intel_msic_reg_update(INTEL_MSIC_IRQLVL1MSK, 0, MSIC_PWRBTNM);
-}
-
-static int mrfld_ack(struct mid_pb_ddata *ddata)
-{
-	return intel_scu_ipc_update_register(BCOVE_IRQLVL1MSK, 0, MSIC_PWRBTNM);
+	return intel_msic_reg_update(ddata->mirqlvl1_addr, 0, MSIC_PWRBTNM);
 }
 
 static int mrfld_setup(struct mid_pb_ddata *ddata)
@@ -109,20 +104,20 @@ static irqreturn_t mid_pb_isr(int irq, void *dev_id)
 		input_sync(input);
 	}
 
-	ddata->ack(ddata);
+	mid_irq_ack(ddata);
 	return IRQ_HANDLED;
 }
 
 static struct mid_pb_ddata mfld_ddata = {
+	.mirqlvl1_addr	= INTEL_MSIC_IRQLVL1MSK,
 	.pbstat_addr	= INTEL_MSIC_PBSTATUS,
 	.pbstat_mask	= MSIC_PB_LEVEL,
-	.ack	= mfld_ack,
 };
 
 static struct mid_pb_ddata mrfld_ddata = {
+	.mirqlvl1_addr	= BCOVE_IRQLVL1MSK,
 	.pbstat_addr	= BCOVE_PBSTATUS,
 	.pbstat_mask	= BCOVE_PB_LEVEL,
-	.ack	= mrfld_ack,
 	.setup	= mrfld_setup,
 };
 
@@ -202,7 +197,7 @@ static int mid_pb_probe(struct platform_device *pdev)
 	 * initialization. The race happens rarely. So we needn't worry
 	 * about it.
 	 */
-	error = ddata->ack(ddata);
+	error = mid_irq_ack(ddata);
 	if (error) {
 		dev_err(&pdev->dev,
 			"Unable to clear power button interrupt, error: %d\n",
-- 
2.11.0
