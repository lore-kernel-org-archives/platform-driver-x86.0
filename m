From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [RFC v1 5/6] platform/x86: intel_punit_ipc: Use generic intel ipc device calls
Date: Tue,  1 Aug 2017 11:13:53 -0700
Message-ID: <07b50490c4bc2b0c2c322c076a3631540a025aa6.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, mingo@redhat.com, qipeng.zha@intel.com, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Removed redundant IPC helper functions and refactored the
intel_punit_ipc_simple_command() and intel_punit_ipc_command()
functions to use eneric IPC device driver APIs.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel_punit_ipc.c | 234 ++++++++++++---------------------
 1 file changed, 84 insertions(+), 150 deletions(-)

diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
index a47a41f..d113987 100644
--- a/drivers/platform/x86/intel_punit_ipc.c
+++ b/drivers/platform/x86/intel_punit_ipc.c
@@ -19,18 +19,22 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <asm/intel_punit_ipc.h>
+#include <asm/intel_ipc_dev.h>
 
 /* IPC Mailbox registers */
 #define OFFSET_DATA_LOW		0x0
 #define OFFSET_DATA_HIGH	0x4
 /* bit field of interface register */
 #define	CMD_RUN			BIT(31)
-#define	CMD_ERRCODE_MASK	GENMASK(7, 0)
 #define	CMD_PARA1_SHIFT		8
 #define	CMD_PARA2_SHIFT		16
 
 #define CMD_TIMEOUT_SECONDS	1
 
+/* IPC PUNIT commands */
+#define	IPC_DEV_PUNIT_CMD_STATUS_ERR_MASK	GENMASK(7, 0)
+#define	IPC_DEV_PUNIT_CMD_STATUS_BUSY		BIT(31)
+
 enum {
 	BASE_DATA = 0,
 	BASE_IFACE,
@@ -39,97 +43,19 @@ enum {
 
 typedef struct {
 	struct device *dev;
-	struct mutex lock;
-	int irq;
-	struct completion cmd_complete;
 	/* base of interface and data registers */
 	void __iomem *base[RESERVED_IPC][BASE_MAX];
+	struct intel_ipc_dev *ipc_dev[RESERVED_IPC];
 	IPC_TYPE type;
 } IPC_DEV;
 
 static IPC_DEV *punit_ipcdev;
 
-static inline u32 ipc_read_status(IPC_DEV *ipcdev, IPC_TYPE type)
-{
-	return readl(ipcdev->base[type][BASE_IFACE]);
-}
-
-static inline void ipc_write_cmd(IPC_DEV *ipcdev, IPC_TYPE type, u32 cmd)
-{
-	writel(cmd, ipcdev->base[type][BASE_IFACE]);
-}
-
-static inline u32 ipc_read_data_low(IPC_DEV *ipcdev, IPC_TYPE type)
-{
-	return readl(ipcdev->base[type][BASE_DATA] + OFFSET_DATA_LOW);
-}
-
-static inline u32 ipc_read_data_high(IPC_DEV *ipcdev, IPC_TYPE type)
-{
-	return readl(ipcdev->base[type][BASE_DATA] + OFFSET_DATA_HIGH);
-}
-
-static inline void ipc_write_data_low(IPC_DEV *ipcdev, IPC_TYPE type, u32 data)
-{
-	writel(data, ipcdev->base[type][BASE_DATA] + OFFSET_DATA_LOW);
-}
-
-static inline void ipc_write_data_high(IPC_DEV *ipcdev, IPC_TYPE type, u32 data)
-{
-	writel(data, ipcdev->base[type][BASE_DATA] + OFFSET_DATA_HIGH);
-}
-
-static const char *ipc_err_string(int error)
-{
-	if (error == IPC_PUNIT_ERR_SUCCESS)
-		return "no error";
-	else if (error == IPC_PUNIT_ERR_INVALID_CMD)
-		return "invalid command";
-	else if (error == IPC_PUNIT_ERR_INVALID_PARAMETER)
-		return "invalid parameter";
-	else if (error == IPC_PUNIT_ERR_CMD_TIMEOUT)
-		return "command timeout";
-	else if (error == IPC_PUNIT_ERR_CMD_LOCKED)
-		return "command locked";
-	else if (error == IPC_PUNIT_ERR_INVALID_VR_ID)
-		return "invalid vr id";
-	else if (error == IPC_PUNIT_ERR_VR_ERR)
-		return "vr error";
-	else
-		return "unknown error";
-}
-
-static int intel_punit_ipc_check_status(IPC_DEV *ipcdev, IPC_TYPE type)
-{
-	int loops = CMD_TIMEOUT_SECONDS * USEC_PER_SEC;
-	int errcode;
-	int status;
-
-	if (ipcdev->irq) {
-		if (!wait_for_completion_timeout(&ipcdev->cmd_complete,
-						 CMD_TIMEOUT_SECONDS * HZ)) {
-			dev_err(ipcdev->dev, "IPC timed out\n");
-			return -ETIMEDOUT;
-		}
-	} else {
-		while ((ipc_read_status(ipcdev, type) & CMD_RUN) && --loops)
-			udelay(1);
-		if (!loops) {
-			dev_err(ipcdev->dev, "IPC timed out\n");
-			return -ETIMEDOUT;
-		}
-	}
-
-	status = ipc_read_status(ipcdev, type);
-	errcode = status & CMD_ERRCODE_MASK;
-	if (errcode) {
-		dev_err(ipcdev->dev, "IPC failed: %s, IPC_STS=0x%x\n",
-			ipc_err_string(errcode), status);
-		return -EIO;
-	}
-
-	return 0;
-}
+const char *ipc_dev_name[RESERVED_IPC] = {
+	"punit_bios_ipc",
+	"punit_gtd_ipc",
+	"punit_isp_ipc"
+};
 
 /**
  * intel_punit_ipc_simple_command() - Simple IPC command
@@ -146,21 +72,13 @@ int intel_punit_ipc_simple_command(int cmd, int para1, int para2)
 	IPC_DEV *ipcdev = punit_ipcdev;
 	IPC_TYPE type;
 	u32 val;
-	int ret;
-
-	mutex_lock(&ipcdev->lock);
 
-	reinit_completion(&ipcdev->cmd_complete);
 	type = (cmd & IPC_PUNIT_CMD_TYPE_MASK) >> IPC_TYPE_OFFSET;
 
 	val = cmd & ~IPC_PUNIT_CMD_TYPE_MASK;
 	val |= CMD_RUN | para2 << CMD_PARA2_SHIFT | para1 << CMD_PARA1_SHIFT;
-	ipc_write_cmd(ipcdev, type, val);
-	ret = intel_punit_ipc_check_status(ipcdev, type);
 
-	mutex_unlock(&ipcdev->lock);
-
-	return ret;
+	return ipc_dev_simple_cmd(ipcdev->ipc_dev[type], val);
 }
 EXPORT_SYMBOL(intel_punit_ipc_simple_command);
 
@@ -180,48 +98,22 @@ int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2, u32 *in, u32 *out)
 {
 	IPC_DEV *ipcdev = punit_ipcdev;
 	IPC_TYPE type;
-	u32 val;
-	int ret;
-
-	mutex_lock(&ipcdev->lock);
+	u32 val, len;
 
-	reinit_completion(&ipcdev->cmd_complete);
 	type = (cmd & IPC_PUNIT_CMD_TYPE_MASK) >> IPC_TYPE_OFFSET;
-
-	if (in) {
-		ipc_write_data_low(ipcdev, type, *in);
-		if (type == GTDRIVER_IPC || type == ISPDRIVER_IPC)
-			ipc_write_data_high(ipcdev, type, *++in);
-	}
+	if (type == GTDRIVER_IPC || type == ISPDRIVER_IPC)
+		len = 2;
+	else
+		len = 1;
 
 	val = cmd & ~IPC_PUNIT_CMD_TYPE_MASK;
 	val |= CMD_RUN | para2 << CMD_PARA2_SHIFT | para1 << CMD_PARA1_SHIFT;
-	ipc_write_cmd(ipcdev, type, val);
-
-	ret = intel_punit_ipc_check_status(ipcdev, type);
-	if (ret)
-		goto out;
-
-	if (out) {
-		*out = ipc_read_data_low(ipcdev, type);
-		if (type == GTDRIVER_IPC || type == ISPDRIVER_IPC)
-			*++out = ipc_read_data_high(ipcdev, type);
-	}
 
-out:
-	mutex_unlock(&ipcdev->lock);
-	return ret;
+	return ipc_dev_raw_cmd(ipcdev->ipc_dev[type], val, (u8*)in, len * 4,
+			out, len, 0, 0);
 }
 EXPORT_SYMBOL_GPL(intel_punit_ipc_command);
 
-static irqreturn_t intel_punit_ioc(int irq, void *dev_id)
-{
-	IPC_DEV *ipcdev = dev_id;
-
-	complete(&ipcdev->cmd_complete);
-	return IRQ_HANDLED;
-}
-
 static int intel_punit_get_bars(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -282,9 +174,57 @@ static int intel_punit_get_bars(struct platform_device *pdev)
 	return 0;
 }
 
+static int punit_ipc_err_code(int status)
+{
+	return (status & IPC_DEV_PUNIT_CMD_STATUS_ERR_MASK);
+}
+
+static int punit_ipc_busy_check(int status)
+{
+	return status | IPC_DEV_PUNIT_CMD_STATUS_BUSY;
+}
+
+static struct intel_ipc_dev *intel_punit_ipc_dev_create(struct device *dev,
+		const char *devname,
+		int irq,
+		void __iomem *base,
+		void __iomem *data)
+{
+	struct intel_ipc_dev_ops *ops;
+	struct intel_ipc_dev_cfg *cfg;
+
+        cfg = devm_kzalloc(dev, sizeof(*cfg), GFP_KERNEL);
+        if (!cfg)
+                return ERR_PTR(-ENOMEM);
+
+	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
+	if (!ops)
+		return ERR_PTR(-ENOMEM);
+
+	/* set IPC dev ops */
+	ops->to_err_code = punit_ipc_err_code;
+	ops->busy_check = punit_ipc_busy_check;
+
+	if (irq > 0)
+	        cfg->mode = IPC_DEV_MODE_IRQ;
+	else
+	        cfg->mode = IPC_DEV_MODE_POLLING;
+
+	cfg->chan_type = IPC_CHANNEL_IA_PUNIT;
+	cfg->irq = irq;
+	cfg->irqflags = IRQF_NO_SUSPEND | IRQF_SHARED;
+	cfg->base = base;
+	cfg->wrbuf_reg = data;
+	cfg->rbuf_reg = data;
+	cfg->status_reg = base;
+	cfg->cmd_reg = base;
+
+	return devm_intel_ipc_dev_create(dev, devname, cfg, ops);
+}
+
 static int intel_punit_ipc_probe(struct platform_device *pdev)
 {
-	int irq, ret;
+	int irq, ret, i;
 
 	punit_ipcdev = devm_kzalloc(&pdev->dev,
 				    sizeof(*punit_ipcdev), GFP_KERNEL);
@@ -294,35 +234,30 @@ static int intel_punit_ipc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, punit_ipcdev);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		punit_ipcdev->irq = 0;
-		dev_warn(&pdev->dev, "Invalid IRQ, using polling mode\n");
-	} else {
-		ret = devm_request_irq(&pdev->dev, irq, intel_punit_ioc,
-				       IRQF_NO_SUSPEND, "intel_punit_ipc",
-				       &punit_ipcdev);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to request irq: %d\n", irq);
-			return ret;
-		}
-		punit_ipcdev->irq = irq;
-	}
 
 	ret = intel_punit_get_bars(pdev);
 	if (ret)
-		goto out;
+		return ret;
+
+	for (i = 0; i < RESERVED_IPC; i++) {
+		punit_ipcdev->ipc_dev[i] = intel_punit_ipc_dev_create(
+				&pdev->dev,
+				ipc_dev_name[i],
+				irq,
+				punit_ipcdev->base[i][BASE_IFACE],
+				punit_ipcdev->base[i][BASE_DATA]);
+
+		if (IS_ERR(punit_ipcdev->ipc_dev[i])) {
+			dev_err(&pdev->dev, "%s create failed\n",
+					ipc_dev_name[i]);
+			return PTR_ERR(punit_ipcdev->ipc_dev[i]);
+		}
+	}
 
 	punit_ipcdev->dev = &pdev->dev;
-	mutex_init(&punit_ipcdev->lock);
-	init_completion(&punit_ipcdev->cmd_complete);
 
-out:
 	return ret;
-}
 
-static int intel_punit_ipc_remove(struct platform_device *pdev)
-{
-	return 0;
 }
 
 static const struct acpi_device_id punit_ipc_acpi_ids[] = {
@@ -332,7 +267,6 @@ static const struct acpi_device_id punit_ipc_acpi_ids[] = {
 
 static struct platform_driver intel_punit_ipc_driver = {
 	.probe = intel_punit_ipc_probe,
-	.remove = intel_punit_ipc_remove,
 	.driver = {
 		.name = "intel_punit_ipc",
 		.acpi_match_table = ACPI_PTR(punit_ipc_acpi_ids),
-- 
2.7.4
