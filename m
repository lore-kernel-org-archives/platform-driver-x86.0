From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] platform/x86: intel_mid_powerbtn: Unify PBSTATUS access
Date: Thu,  2 Feb 2017 19:54:26 +0200
Message-ID: <20170202175428.183482-2-andriy.shevchenko@linux.intel.com>
References: <20170202175428.183482-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170202175428.183482-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The status register on Intel Merrifield can be read in the similar way
it's done for previous MID platforms. Unify access to PBSTATUS register
via SCU IPC.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 41 ++++++++++---------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 1d30b3549748..594d503ca6fe 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -40,37 +40,37 @@
 #define MSIC_PWRBTNM    (1 << 0)
 
 /* Intel Tangier */
-#define MRFLD_PBSTAT_ADDR	0xfffff61a
-#define MRFLD_PB_LEVEL		(1 << 4)	/* 1 - release, 0 - press */
+#define BCOVE_PB_LEVEL		(1 << 4)	/* 1 - release, 0 - press */
 
 /* Basin Cove PMIC */
 #define BCOVE_PBIRQ		0x02
 #define BCOVE_IRQLVL1MSK	0x0c
 #define BCOVE_PBIRQMASK		0x0d
+#define BCOVE_PBSTATUS		0x27
 
 struct mid_pb_ddata {
 	struct device *dev;
-	void __iomem *reg;
 	int irq;
 	struct input_dev *input;
-	int (*pbstat)(struct mid_pb_ddata *ddata, int *value);
+	unsigned short pbstat_addr;
+	u8 pbstat_mask;
 	int (*ack)(struct mid_pb_ddata *ddata);
 	int (*setup)(struct mid_pb_ddata *ddata);
 };
 
-static int mfld_pbstat(struct mid_pb_ddata *ddata, int *value)
+static int mid_pbstat(struct mid_pb_ddata *ddata, int *value)
 {
 	struct input_dev *input = ddata->input;
 	int ret;
 	u8 pbstat;
 
-	ret = intel_msic_reg_read(INTEL_MSIC_PBSTATUS, &pbstat);
+	ret = intel_msic_reg_read(ddata->pbstat_addr, &pbstat);
 	if (ret)
 		return ret;
 
 	dev_dbg(input->dev.parent, "PB_INT status= %d\n", pbstat);
 
-	*value = !(pbstat & MSIC_PB_LEVEL);
+	*value = !(pbstat & ddata->pbstat_mask);
 	return 0;
 }
 
@@ -89,19 +89,6 @@ static int mfld_ack(struct mid_pb_ddata *ddata)
 	return intel_msic_reg_update(INTEL_MSIC_IRQLVL1MSK, 0, MSIC_PWRBTNM);
 }
 
-static int mrfld_pbstat(struct mid_pb_ddata *ddata, int *value)
-{
-	struct input_dev *input = ddata->input;
-	u8 pbstat;
-
-	pbstat = readb(ddata->reg);
-
-	dev_dbg(input->dev.parent, "PB_INT status= %d\n", pbstat);
-
-	*value = !(pbstat & MRFLD_PB_LEVEL);
-	return 0;
-}
-
 static int mrfld_ack(struct mid_pb_ddata *ddata)
 {
 	return intel_scu_ipc_update_register(BCOVE_IRQLVL1MSK, 0, MSIC_PWRBTNM);
@@ -109,10 +96,6 @@ static int mrfld_ack(struct mid_pb_ddata *ddata)
 
 static int mrfld_setup(struct mid_pb_ddata *ddata)
 {
-	ddata->reg = devm_ioremap_nocache(ddata->dev, MRFLD_PBSTAT_ADDR, 1);
-	if (!ddata->reg)
-		return -ENOMEM;
-
 	/* Unmask the PBIRQ and MPBIRQ on Tangier */
 	intel_scu_ipc_update_register(BCOVE_PBIRQ, 0, MSIC_PWRBTNM);
 	intel_scu_ipc_update_register(BCOVE_PBIRQMASK, 0, MSIC_PWRBTNM);
@@ -124,10 +107,10 @@ static irqreturn_t mid_pb_isr(int irq, void *dev_id)
 {
 	struct mid_pb_ddata *ddata = dev_id;
 	struct input_dev *input = ddata->input;
-	int value;
+	int value = 0;
 	int ret;
 
-	ret = ddata->pbstat(ddata, &value);
+	ret = mid_pbstat(ddata, &value);
 	if (ret < 0) {
 		dev_err(input->dev.parent,
 			"Read error %d while reading MSIC_PB_STATUS\n", ret);
@@ -141,12 +124,14 @@ static irqreturn_t mid_pb_isr(int irq, void *dev_id)
 }
 
 static struct mid_pb_ddata mfld_ddata = {
-	.pbstat	= mfld_pbstat,
+	.pbstat_addr	= INTEL_MSIC_PBSTATUS,
+	.pbstat_mask	= MSIC_PB_LEVEL,
 	.ack	= mfld_ack,
 };
 
 static struct mid_pb_ddata mrfld_ddata = {
-	.pbstat	= mrfld_pbstat,
+	.pbstat_addr	= BCOVE_PBSTATUS,
+	.pbstat_mask	= BCOVE_PB_LEVEL,
 	.ack	= mrfld_ack,
 	.setup	= mrfld_setup,
 };
-- 
2.11.0
