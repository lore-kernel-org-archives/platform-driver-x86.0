From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 07/10] platform/x86: intel_mid_powerbtn: Enable driver for Merrifield
Date: Thu, 19 Jan 2017 18:39:46 +0200
Message-ID: <20170119163949.147183-8-andriy.shevchenko@linux.intel.com>
References: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Enable this driver to handle events from Basin Cove PMIC, which is
installed on Intel Merrifield platform.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 56 +++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index ac02a0b8bef3..12fbf400f228 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -28,6 +28,7 @@
 
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
+#include <asm/intel_scu_ipc.h>
 
 #define DRIVER_NAME "msic_power_btn"
 
@@ -39,12 +40,23 @@
  */
 #define MSIC_PWRBTNM    (1 << 0)
 
+/* Intel Tangier */
+#define MRFLD_PBSTAT_ADDR	0xfffff61a
+#define MRFLD_PB_LEVEL		(1 << 4)	/* 1 - release, 0 - press */
+
+/* Basin Cove PMIC */
+#define BCOVE_PBIRQ		0x02
+#define BCOVE_IRQLVL1MSK	0x0c
+#define BCOVE_PBIRQMASK		0x0d
+
 struct mid_pb_ddata {
 	struct device *dev;
+	void __iomem *reg;
 	int irq;
 	struct input_dev *input;
 	int (*pbstat)(struct mid_pb_ddata *ddata, int *value);
 	int (*ack)(struct mid_pb_ddata *ddata);
+	int (*setup)(struct mid_pb_ddata *ddata);
 };
 
 static int mfld_pbstat(struct mid_pb_ddata *ddata, int *value)
@@ -78,6 +90,37 @@ static int mfld_ack(struct mid_pb_ddata *ddata)
 	return intel_msic_reg_update(INTEL_MSIC_IRQLVL1MSK, 0, MSIC_PWRBTNM);
 }
 
+static int mrfld_pbstat(struct mid_pb_ddata *ddata, int *value)
+{
+	struct input_dev *input = ddata->input;
+	u8 pbstat;
+
+	pbstat = readb(ddata->reg);
+
+	dev_dbg(input->dev.parent, "PB_INT status= %d\n", pbstat);
+
+	*value = !(pbstat & MRFLD_PB_LEVEL);
+	return 0;
+}
+
+static int mrfld_ack(struct mid_pb_ddata *ddata)
+{
+	return intel_scu_ipc_update_register(BCOVE_IRQLVL1MSK, 0, MSIC_PWRBTNM);
+}
+
+static int mrfld_setup(struct mid_pb_ddata *ddata)
+{
+	ddata->reg = devm_ioremap_nocache(ddata->dev, MRFLD_PBSTAT_ADDR, 1);
+	if (!ddata->reg)
+		return -ENOMEM;
+
+	/* Unmask the PBIRQ and MPBIRQ on Tangier */
+	intel_scu_ipc_update_register(BCOVE_PBIRQ, 0, MSIC_PWRBTNM);
+	intel_scu_ipc_update_register(BCOVE_PBIRQMASK, 0, MSIC_PWRBTNM);
+
+	return 0;
+}
+
 static irqreturn_t mid_pb_isr(int irq, void *dev_id)
 {
 	struct mid_pb_ddata *ddata = dev_id;
@@ -103,11 +146,18 @@ static struct mid_pb_ddata mfld_ddata = {
 	.ack	= mfld_ack,
 };
 
+static struct mid_pb_ddata mrfld_ddata = {
+	.pbstat	= mrfld_pbstat,
+	.ack	= mrfld_ack,
+	.setup	= mrfld_setup,
+};
+
 #define ICPU(model, ddata)	\
 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (kernel_ulong_t)&ddata }
 
 static const struct x86_cpu_id mid_pb_cpu_ids[] = {
 	ICPU(INTEL_FAM6_ATOM_PENWELL,		mfld_ddata),
+	ICPU(INTEL_FAM6_ATOM_MERRIFIELD,	mrfld_ddata),
 	{}
 };
 
@@ -145,6 +195,12 @@ static int mid_pb_probe(struct platform_device *pdev)
 	ddata->irq = irq;
 	ddata->input = input;
 
+	if (ddata->setup) {
+		error = ddata->setup(ddata);
+		if (error)
+			return error;
+	}
+
 	error = devm_request_threaded_irq(&pdev->dev, irq, NULL, mid_pb_isr,
 					  IRQF_ONESHOT, DRIVER_NAME, ddata);
 	if (error) {
-- 
2.11.0
