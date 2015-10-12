From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/5] intel_scu_ipc: convert to use struct device *
Date: Mon, 12 Oct 2015 14:19:46 +0300
Message-ID: <1444648788-74265-4-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1444648788-74265-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444648788-74265-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Switch the code to use struct device * instead of struct pci_dev * since there
is no reason to access PCI related features in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 41 ++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 6c9367f..5087485 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -92,11 +92,8 @@ static struct intel_scu_ipc_pdata_t intel_scu_ipc_tangier_pdata = {
 	.irq_mode = 0,
 };
 
-static int ipc_probe(struct pci_dev *dev, const struct pci_device_id *id);
-static void ipc_remove(struct pci_dev *pdev);
-
 struct intel_scu_ipc_dev {
-	struct pci_dev *pdev;
+	struct device *dev;
 	void __iomem *ipc_base;
 	void __iomem *i2c_base;
 	struct completion cmd_complete;
@@ -181,7 +178,7 @@ static inline int busy_loop(struct intel_scu_ipc_dev *scu)
 	}
 
 	if (status & BIT(0)) {
-		dev_err(&scu->pdev->dev, "IPC timed out");
+		dev_err(scu->dev, "IPC timed out");
 		return -ETIMEDOUT;
 	}
 
@@ -197,8 +194,7 @@ static inline int ipc_wait_for_interrupt(struct intel_scu_ipc_dev *scu)
 	int status;
 
 	if (!wait_for_completion_timeout(&scu->cmd_complete, 3 * HZ)) {
-		struct device *dev = &scu->pdev->dev;
-		dev_err(dev, "IPC timed out\n");
+		dev_err(scu->dev, "IPC timed out\n");
 		return -ETIMEDOUT;
 	}
 
@@ -228,7 +224,7 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 
 	mutex_lock(&ipclock);
 
-	if (scu->pdev == NULL) {
+	if (scu->dev == NULL) {
 		mutex_unlock(&ipclock);
 		return -ENODEV;
 	}
@@ -445,7 +441,7 @@ int intel_scu_ipc_simple_command(int cmd, int sub)
 	int err;
 
 	mutex_lock(&ipclock);
-	if (scu->pdev == NULL) {
+	if (scu->dev == NULL) {
 		mutex_unlock(&ipclock);
 		return -ENODEV;
 	}
@@ -475,7 +471,7 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 	int i, err;
 
 	mutex_lock(&ipclock);
-	if (scu->pdev == NULL) {
+	if (scu->dev == NULL) {
 		mutex_unlock(&ipclock);
 		return -ENODEV;
 	}
@@ -518,7 +514,7 @@ int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data)
 	u32 cmd = 0;
 
 	mutex_lock(&ipclock);
-	if (scu->pdev == NULL) {
+	if (scu->dev == NULL) {
 		mutex_unlock(&ipclock);
 		return -ENODEV;
 	}
@@ -533,7 +529,7 @@ int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data)
 		mdelay(1);
 		writel(addr, scu->i2c_base + IPC_I2C_CNTRL_ADDR);
 	} else {
-		dev_err(&scu->pdev->dev,
+		dev_err(scu->dev,
 			"intel_scu_ipc: I2C INVALID_CMD = 0x%x\n", cmd);
 
 		mutex_unlock(&ipclock);
@@ -563,42 +559,42 @@ static irqreturn_t ioc(int irq, void *dev_id)
 
 /**
  *	ipc_probe	-	probe an Intel SCU IPC
- *	@dev: the PCI device matching
+ *	@pdev: the PCI device matching
  *	@id: entry in the match table
  *
  *	Enable and install an intel SCU IPC. This appears in the PCI space
  *	but uses some hard coded addresses as well.
  */
-static int ipc_probe(struct pci_dev *dev, const struct pci_device_id *id)
+static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	int err;
 	struct intel_scu_ipc_dev *scu = &ipcdev;
 	struct intel_scu_ipc_pdata_t *pdata;
 
-	if (scu->pdev)		/* We support only one SCU */
+	if (scu->dev)		/* We support only one SCU */
 		return -EBUSY;
 
 	pdata = (struct intel_scu_ipc_pdata_t *)id->driver_data;
 
-	scu->pdev = pci_dev_get(dev);
+	scu->dev = &pdev->dev;
 	scu->irq_mode = pdata->irq_mode;
 
-	err = pcim_enable_device(dev);
+	err = pcim_enable_device(pdev);
 	if (err)
 		return err;
 
-	err = pcim_iomap_regions(dev, 1 << 0, pci_name(dev));
+	err = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
 	if (err)
 		return err;
 
 	init_completion(&scu->cmd_complete);
 
-	err = devm_request_irq(&dev->dev, dev->irq, ioc, 0, "intel_scu_ipc",
+	err = devm_request_irq(&pdev->dev, pdev->irq, ioc, 0, "intel_scu_ipc",
 			       scu);
 	if (err)
 		return err;
 
-	scu->ipc_base = pcim_iomap_table(dev)[0];
+	scu->ipc_base = pcim_iomap_table(pdev)[0];
 
 	scu->i2c_base = ioremap_nocache(pdata->i2c_base, pdata->i2c_len);
 	if (!scu->i2c_base)
@@ -606,7 +602,7 @@ static int ipc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	intel_scu_devices_create();
 
-	pci_set_drvdata(dev, scu);
+	pci_set_drvdata(pdev, scu);
 	return 0;
 }
 
@@ -624,8 +620,7 @@ static void ipc_remove(struct pci_dev *pdev)
 {
 	struct intel_scu_ipc_dev *scu = pci_get_drvdata(pdev);
 
-	pci_dev_put(scu->pdev);
-	scu->pdev = NULL;
+	scu->dev = NULL;
 	iounmap(scu->i2c_base);
 	intel_scu_devices_destroy();
 }
-- 
2.5.3
