From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [RFC v1 6/6] platform/x86: intel_pmc_ipc: Use generic Intel IPC device calls
Date: Tue,  1 Aug 2017 11:13:54 -0700
Message-ID: <483abaadb24392e39e3e2d61af0b77bb9f330419.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, mingo@redhat.com, qipeng.zha@intel.com, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Removed redundant IPC helper functions and refactored the
intel_pmc_ipc_simple_command() and intel_pmc_ipc_command() functions
to use generic IPC device driver APIs.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 302 ++++++++++++-----------------------
 1 file changed, 103 insertions(+), 199 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 43533ec..675f8d9 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -36,6 +36,7 @@
 #include <linux/mfd/core.h>
 
 #include <asm/intel_pmc_ipc.h>
+#include <asm/intel_ipc_dev.h>
 
 #include <linux/platform_data/itco_wdt.h>
 
@@ -45,18 +46,8 @@
  * The ARC handles the interrupt and services it, writing optional data to
  * the IPC1 registers, updates the IPC_STS response register with the status.
  */
-#define IPC_CMD			0x0
-#define		IPC_CMD_MSI		0x100
 #define		IPC_CMD_SIZE		16
 #define		IPC_CMD_SUBCMD		12
-#define IPC_STATUS		0x04
-#define		IPC_STATUS_IRQ		0x4
-#define		IPC_STATUS_ERR		0x2
-#define		IPC_STATUS_BUSY		0x1
-#define IPC_SPTR		0x08
-#define IPC_DPTR		0x0C
-#define IPC_WRITE_BUFFER	0x80
-#define IPC_READ_BUFFER		0x90
 
 /* Residency with clock rate at 19.2MHz to usecs */
 #define S0IX_RESIDENCY_IN_USECS(d, s)		\
@@ -71,11 +62,6 @@
  */
 #define IPC_DATA_BUFFER_SIZE	16
 
-#define IPC_LOOP_CNT		3000000
-#define IPC_MAX_SEC		3
-
-#define IPC_TRIGGER_MODE_IRQ		true
-
 /* exported resources from IFWI */
 #define PLAT_RESOURCE_IPC_INDEX		0
 #define PLAT_RESOURCE_IPC_SIZE		0x1000
@@ -121,8 +107,28 @@ enum {
 	PMC_IPC_MAX_MFD_BLOCK
 };
 
+/* IPC PMC commands */
+#define	IPC_DEV_PMC_CMD_MSI			BIT(8)
+#define	IPC_DEV_PMC_CMD_SIZE			16
+#define	IPC_DEV_PMC_CMD_SUBCMD			12
+#define	IPC_DEV_PMC_CMD_STATUS			BIT(2)
+#define	IPC_DEV_PMC_CMD_STATUS_IRQ		BIT(2)
+#define	IPC_DEV_PMC_CMD_STATUS_ERR		BIT(1)
+#define	IPC_DEV_PMC_CMD_STATUS_ERR_MASK		GENMASK(7, 0)
+#define	IPC_DEV_PMC_CMD_STATUS_BUSY		BIT(0)
+
+/*IPC PMC reg offsets */
+#define IPC_DEV_PMC_STATUS_OFFSET		0x04
+#define IPC_DEV_PMC_SPTR_OFFSET			0x08
+#define IPC_DEV_PMC_DPTR_OFFSET			0x0C
+#define IPC_DEV_PMC_WRBUF_OFFSET		0x80
+#define IPC_DEV_PMC_RBUF_OFFSET			0x90
+
 static struct intel_pmc_ipc_dev {
 	struct device *dev;
+	struct intel_ipc_dev *pmc_ipc_dev;
+	struct intel_ipc_dev_ops ops;
+	struct intel_ipc_dev_cfg cfg;
 	void __iomem *ipc_base;
 	bool irq_mode;
 	int irq;
@@ -137,58 +143,9 @@ static struct intel_pmc_ipc_dev {
 	u8 telem_res_inval;
 } ipcdev;
 
-static char *ipc_err_sources[] = {
-	[IPC_ERR_NONE] =
-		"no error",
-	[IPC_ERR_CMD_NOT_SUPPORTED] =
-		"command not supported",
-	[IPC_ERR_CMD_NOT_SERVICED] =
-		"command not serviced",
-	[IPC_ERR_UNABLE_TO_SERVICE] =
-		"unable to service",
-	[IPC_ERR_CMD_INVALID] =
-		"command invalid",
-	[IPC_ERR_CMD_FAILED] =
-		"command failed",
-	[IPC_ERR_EMSECURITY] =
-		"Invalid Battery",
-	[IPC_ERR_UNSIGNEDKERNEL] =
-		"Unsigned kernel",
-};
-
 /* Prevent concurrent calls to the PMC */
 static DEFINE_MUTEX(ipclock);
 
-static inline void ipc_send_command(u32 cmd)
-{
-	ipcdev.cmd = cmd;
-	if (ipcdev.irq_mode) {
-		reinit_completion(&ipcdev.cmd_complete);
-		cmd |= IPC_CMD_MSI;
-	}
-	writel(cmd, ipcdev.ipc_base + IPC_CMD);
-}
-
-static inline u32 ipc_read_status(void)
-{
-	return readl(ipcdev.ipc_base + IPC_STATUS);
-}
-
-static inline void ipc_data_writel(u32 data, u32 offset)
-{
-	writel(data, ipcdev.ipc_base + IPC_WRITE_BUFFER + offset);
-}
-
-static inline u8 __maybe_unused ipc_data_readb(u32 offset)
-{
-	return readb(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
-}
-
-static inline u32 ipc_data_readl(u32 offset)
-{
-	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
-}
-
 static inline u64 gcr_data_readq(u32 offset)
 {
 	return readq(ipcdev.gcr_mem_base + offset);
@@ -315,52 +272,6 @@ static int update_no_reboot_bit(void *priv, bool set)
 				    PMC_CFG_NO_REBOOT_MASK, value);
 }
 
-static int intel_pmc_ipc_check_status(void)
-{
-	int status;
-	int ret = 0;
-
-	if (ipcdev.irq_mode) {
-		if (0 == wait_for_completion_timeout(
-				&ipcdev.cmd_complete, IPC_MAX_SEC * HZ))
-			ret = -ETIMEDOUT;
-	} else {
-		int loop_count = IPC_LOOP_CNT;
-
-		while ((ipc_read_status() & IPC_STATUS_BUSY) && --loop_count)
-			udelay(1);
-		if (loop_count == 0)
-			ret = -ETIMEDOUT;
-	}
-
-	status = ipc_read_status();
-	if (ret == -ETIMEDOUT) {
-		dev_err(ipcdev.dev,
-			"IPC timed out, TS=0x%x, CMD=0x%x\n",
-			status, ipcdev.cmd);
-		return ret;
-	}
-
-	if (status & IPC_STATUS_ERR) {
-		int i;
-
-		ret = -EIO;
-		i = (status >> IPC_CMD_SIZE) & 0xFF;
-		if (i < ARRAY_SIZE(ipc_err_sources))
-			dev_err(ipcdev.dev,
-				"IPC failed: %s, STS=0x%x, CMD=0x%x\n",
-				ipc_err_sources[i], status, ipcdev.cmd);
-		else
-			dev_err(ipcdev.dev,
-				"IPC failed: unknown, STS=0x%x, CMD=0x%x\n",
-				status, ipcdev.cmd);
-		if ((i == IPC_ERR_UNSIGNEDKERNEL) || (i == IPC_ERR_EMSECURITY))
-			ret = -EACCES;
-	}
-
-	return ret;
-}
-
 /**
  * intel_pmc_ipc_simple_command() - Simple IPC command
  * @cmd:	IPC command code.
@@ -373,102 +284,95 @@ static int intel_pmc_ipc_check_status(void)
  */
 int intel_pmc_ipc_simple_command(int cmd, int sub)
 {
-	int ret;
-
-	mutex_lock(&ipclock);
-	if (ipcdev.dev == NULL) {
-		mutex_unlock(&ipclock);
-		return -ENODEV;
-	}
-	ipc_send_command(sub << IPC_CMD_SUBCMD | cmd);
-	ret = intel_pmc_ipc_check_status();
-	mutex_unlock(&ipclock);
-
-	return ret;
+	return ipc_dev_simple_cmd(ipcdev.pmc_ipc_dev,
+			sub << IPC_CMD_SUBCMD | cmd);
 }
 EXPORT_SYMBOL_GPL(intel_pmc_ipc_simple_command);
 
+
 /**
- * intel_pmc_ipc_raw_cmd() - IPC command with data and pointers
+ * intel_pmc_ipc_command() -  IPC command with input/output data
  * @cmd:	IPC command code.
  * @sub:	IPC command sub type.
  * @in:		input data of this IPC command.
  * @inlen:	input data length in bytes.
  * @out:	output data of this IPC command.
  * @outlen:	output data length in dwords.
- * @sptr:	data writing to SPTR register.
- * @dptr:	data writing to DPTR register.
  *
- * Send an IPC command to PMC with input/output data and source/dest pointers.
+ * Send an IPC command to PMC with input/output data.
  *
  * Return:	an IPC error code or 0 on success.
  */
-int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen, u32 *out,
-			  u32 outlen, u32 dptr, u32 sptr)
+int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
+			  u32 *out, u32 outlen)
 {
-	u32 wbuf[4] = { 0 };
-	int ret;
-	int i;
+	cmd = (inlen << IPC_CMD_SIZE) | (sub << IPC_CMD_SUBCMD) | cmd;
 
 	if (inlen > IPC_DATA_BUFFER_SIZE || outlen > IPC_DATA_BUFFER_SIZE / 4)
 		return -EINVAL;
 
-	mutex_lock(&ipclock);
-	if (ipcdev.dev == NULL) {
-		mutex_unlock(&ipclock);
-		return -ENODEV;
-	}
-	memcpy(wbuf, in, inlen);
-	writel(dptr, ipcdev.ipc_base + IPC_DPTR);
-	writel(sptr, ipcdev.ipc_base + IPC_SPTR);
-	/* The input data register is 32bit register and inlen is in Byte */
-	for (i = 0; i < ((inlen + 3) / 4); i++)
-		ipc_data_writel(wbuf[i], 4 * i);
-	ipc_send_command((inlen << IPC_CMD_SIZE) |
-			(sub << IPC_CMD_SUBCMD) | cmd);
-	ret = intel_pmc_ipc_check_status();
-	if (!ret) {
-		/* out is read from 32bit register and outlen is in 32bit */
-		for (i = 0; i < outlen; i++)
-			*out++ = ipc_data_readl(4 * i);
-	}
-	mutex_unlock(&ipclock);
+	return ipc_dev_raw_cmd(ipcdev.pmc_ipc_dev, cmd, in, inlen, out,
+			outlen, 0, 0);
 
-	return ret;
 }
-EXPORT_SYMBOL_GPL(intel_pmc_ipc_raw_cmd);
+EXPORT_SYMBOL_GPL(intel_pmc_ipc_command);
 
-/**
- * intel_pmc_ipc_command() -  IPC command with input/output data
- * @cmd:	IPC command code.
- * @sub:	IPC command sub type.
- * @in:		input data of this IPC command.
- * @inlen:	input data length in bytes.
- * @out:	output data of this IPC command.
- * @outlen:	output data length in dwords.
- *
- * Send an IPC command to PMC with input/output data.
- *
- * Return:	an IPC error code or 0 on success.
- */
-int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
-			  u32 *out, u32 outlen)
+static int pmc_ipc_err_code(int status)
 {
-	return intel_pmc_ipc_raw_cmd(cmd, sub, in, inlen, out, outlen, 0, 0);
+	return ((status >> IPC_DEV_PMC_CMD_SIZE) &
+			IPC_DEV_PMC_CMD_STATUS_ERR_MASK);
 }
-EXPORT_SYMBOL_GPL(intel_pmc_ipc_command);
 
-static irqreturn_t ioc(int irq, void *dev_id)
+static int pmc_ipc_busy_check(int status)
 {
-	int status;
+	return status | IPC_DEV_PMC_CMD_STATUS_BUSY;
+}
 
-	if (ipcdev.irq_mode) {
-		status = ipc_read_status();
-		writel(status | IPC_STATUS_IRQ, ipcdev.ipc_base + IPC_STATUS);
-	}
-	complete(&ipcdev.cmd_complete);
+static u32 pmc_ipc_enable_msi(u32 cmd)
+{
+	return cmd | IPC_DEV_PMC_CMD_MSI;
+}
+
+static struct intel_ipc_dev *intel_pmc_ipc_dev_create(
+		struct device *pmc_dev,
+		void __iomem *base,
+		int irq)
+{
+	struct intel_ipc_dev_ops *ops;
+	struct intel_ipc_dev_cfg *cfg;
+
+	cfg = devm_kzalloc(pmc_dev, sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
+		return ERR_PTR(-ENOMEM);
 
-	return IRQ_HANDLED;
+	ops = devm_kzalloc(pmc_dev, sizeof(*ops), GFP_KERNEL);
+	if (!ops)
+		return ERR_PTR(-ENOMEM);
+
+	/* set IPC dev ops */
+	ops->to_err_code = pmc_ipc_err_code;
+	ops->busy_check = pmc_ipc_busy_check;
+	ops->enable_msi = pmc_ipc_enable_msi;
+
+	/* set cfg options */
+	if (irq > 0)
+		cfg->mode = IPC_DEV_MODE_IRQ;
+	else
+		cfg->mode = IPC_DEV_MODE_POLLING;
+
+	cfg->chan_type = IPC_CHANNEL_IA_PMC;
+	cfg->irq = irq;
+	cfg->use_msi = true;
+	cfg->base = base;
+	cfg->wrbuf_reg = cfg->base + IPC_DEV_PMC_WRBUF_OFFSET;
+	cfg->rbuf_reg = cfg->base + IPC_DEV_PMC_RBUF_OFFSET;
+	cfg->sptr_reg = cfg->base + IPC_DEV_PMC_SPTR_OFFSET;
+	cfg->dptr_reg = cfg->base + IPC_DEV_PMC_DPTR_OFFSET;
+	cfg->status_reg = cfg->base + IPC_DEV_PMC_STATUS_OFFSET;
+	cfg->cmd_reg = cfg->base;
+
+	return devm_intel_ipc_dev_create(pmc_dev, "intel_pmc_ipc",
+			cfg, ops);
 }
 
 static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
@@ -478,7 +382,8 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	int len;
 
 	ipcdev.dev = &pci_dev_get(pdev)->dev;
-	ipcdev.irq_mode = IPC_TRIGGER_MODE_IRQ;
+
+	ipcdev.dev = &pdev->dev;
 
 	ret = pci_enable_device(pdev);
 	if (ret)
@@ -496,15 +401,6 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto free_pci_resources;
 	}
 
-	init_completion(&ipcdev.cmd_complete);
-
-	if (devm_request_irq(&pdev->dev, pdev->irq, ioc, 0, "intel_pmc_ipc",
-				&ipcdev)) {
-		dev_err(&pdev->dev, "Failed to request irq\n");
-		ret = -EBUSY;
-		goto free_pci_resources;
-	}
-
 	ipcdev.ipc_base = devm_ioremap_nocache(&pdev->dev, pci_resource, len);
 	if (!ipcdev.ipc_base) {
 		dev_err(&pdev->dev, "Failed to ioremap ipc base\n");
@@ -512,6 +408,15 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto free_pci_resources;
 	}
 
+	ipcdev.pmc_ipc_dev = intel_pmc_ipc_dev_create(&pdev->dev,
+			ipcdev.ipc_base, pdev->irq);
+	if (IS_ERR(ipcdev.pmc_ipc_dev)) {
+		dev_err(ipcdev.dev,
+				"Failed to create PMC IPC device\n");
+		ret = PTR_ERR(ipcdev.pmc_ipc_dev);
+		goto free_pci_resources;
+	}
+
 	return 0;
 
 free_pci_resources:
@@ -841,14 +746,12 @@ MODULE_DEVICE_TABLE(acpi, ipc_acpi_ids);
 
 static int ipc_plat_probe(struct platform_device *pdev)
 {
-	int ret;
+	int ret, irq;
 
 	ipcdev.dev = &pdev->dev;
-	ipcdev.irq_mode = IPC_TRIGGER_MODE_IRQ;
-	init_completion(&ipcdev.cmd_complete);
 
-	ipcdev.irq = platform_get_irq(pdev, 0);
-	if (ipcdev.irq < 0) {
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
 		dev_err(&pdev->dev, "Failed to get irq\n");
 		return -EINVAL;
 	}
@@ -865,12 +768,6 @@ static int ipc_plat_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (devm_request_irq(&pdev->dev, ipcdev.irq, ioc, IRQF_NO_SUSPEND,
-			     "intel_pmc_ipc", &ipcdev)) {
-		dev_err(&pdev->dev, "Failed to request irq\n");
-		return -EBUSY;
-	}
-
 	ret = sysfs_create_group(&pdev->dev.kobj, &intel_ipc_group);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to create sysfs group %d\n",
@@ -878,6 +775,13 @@ static int ipc_plat_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ipcdev.pmc_ipc_dev = intel_pmc_ipc_dev_create(&pdev->dev,
+			ipcdev.ipc_base, irq);
+	if (IS_ERR(ipcdev.pmc_ipc_dev)) {
+		dev_err(&pdev->dev, "Failed to create PMC IPC device\n");
+		return PTR_ERR(ipcdev.pmc_ipc_dev);
+	}
+
 	ipcdev.has_gcr_regs = true;
 
 	return 0;
-- 
2.7.4
