From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/6] platform/x86: intel_ips: Simplify error handling via devres API
Date: Thu,  5 Oct 2017 14:54:15 +0300
Message-ID: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Use devm_ and pcim_ functions to make error handling
simpler and code smaller and tidier.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_ips.c | 62 ++++++++++------------------------------
 1 file changed, 15 insertions(+), 47 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 58dcee562d64..063d9a1624b4 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -296,7 +296,7 @@ static struct ips_mcp_limits ips_ulv_limits = {
 
 struct ips_driver {
 	struct pci_dev *dev;
-	void *regmap;
+	void __iomem *regmap;
 	struct task_struct *monitor;
 	struct task_struct *adjust;
 	struct dentry *debug_root;
@@ -1517,62 +1517,45 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (dmi_check_system(ips_blacklist))
 		return -ENODEV;
 
-	ips = kzalloc(sizeof(struct ips_driver), GFP_KERNEL);
+	ips = devm_kzalloc(&dev->dev, sizeof(*ips), GFP_KERNEL);
 	if (!ips)
 		return -ENOMEM;
 
-	pci_set_drvdata(dev, ips);
+	spin_lock_init(&ips->turbo_status_lock);
 	ips->dev = dev;
 
 	ips->limits = ips_detect_cpu(ips);
 	if (!ips->limits) {
 		dev_info(&dev->dev, "IPS not supported on this CPU\n");
-		ret = -ENXIO;
-		goto error_free;
+		return -ENXIO;
 	}
 
-	spin_lock_init(&ips->turbo_status_lock);
-
-	ret = pci_enable_device(dev);
+	ret = pcim_enable_device(dev);
 	if (ret) {
 		dev_err(&dev->dev, "can't enable PCI device, aborting\n");
-		goto error_free;
+		return ret;
 	}
 
-	if (!pci_resource_start(dev, 0)) {
-		dev_err(&dev->dev, "TBAR not assigned, aborting\n");
-		ret = -ENXIO;
-		goto error_free;
-	}
-
-	ret = pci_request_regions(dev, "ips thermal sensor");
+	ret = pcim_iomap_regions(dev, 1 << 0, pci_name(dev));
 	if (ret) {
-		dev_err(&dev->dev, "thermal resource busy, aborting\n");
-		goto error_free;
-	}
-
-
-	ips->regmap = ioremap(pci_resource_start(dev, 0),
-			      pci_resource_len(dev, 0));
-	if (!ips->regmap) {
 		dev_err(&dev->dev, "failed to map thermal regs, aborting\n");
-		ret = -EBUSY;
-		goto error_release;
+		return ret;
 	}
+	ips->regmap = pcim_iomap_table(dev)[0];
+
+	pci_set_drvdata(dev, ips);
 
 	tse = thm_readb(THM_TSE);
 	if (tse != TSE_EN) {
 		dev_err(&dev->dev, "thermal device not enabled (0x%02x), aborting\n", tse);
-		ret = -ENXIO;
-		goto error_unmap;
+		return -ENXIO;
 	}
 
 	trc = thm_readw(THM_TRC);
 	trc_required_mask = TRC_CORE1_EN | TRC_CORE_PWR | TRC_MCH_EN;
 	if ((trc & trc_required_mask) != trc_required_mask) {
 		dev_err(&dev->dev, "thermal reporting for required devices not enabled, aborting\n");
-		ret = -ENXIO;
-		goto error_unmap;
+		return -ENXIO;
 	}
 
 	if (trc & TRC_CORE2_EN)
@@ -1602,8 +1585,7 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	rdmsrl(PLATFORM_INFO, platform_info);
 	if (!(platform_info & PLATFORM_TDP)) {
 		dev_err(&dev->dev, "platform indicates TDP override unavailable, aborting\n");
-		ret = -ENODEV;
-		goto error_unmap;
+		return -ENODEV;
 	}
 
 	/*
@@ -1615,7 +1597,7 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 			  ips);
 	if (ret) {
 		dev_err(&dev->dev, "request irq failed, aborting\n");
-		goto error_unmap;
+		return ret;
 	}
 
 	/* Enable aux, hot & critical interrupts */
@@ -1673,12 +1655,6 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	kthread_stop(ips->adjust);
 error_free_irq:
 	free_irq(ips->dev->irq, ips);
-error_unmap:
-	iounmap(ips->regmap);
-error_release:
-	pci_release_regions(dev);
-error_free:
-	kfree(ips);
 	return ret;
 }
 
@@ -1714,22 +1690,14 @@ static void ips_remove(struct pci_dev *dev)
 		kthread_stop(ips->adjust);
 	if (ips->monitor)
 		kthread_stop(ips->monitor);
-	iounmap(ips->regmap);
-	pci_release_regions(dev);
-	kfree(ips);
 	dev_dbg(&dev->dev, "IPS driver removed\n");
 }
 
-static void ips_shutdown(struct pci_dev *dev)
-{
-}
-
 static struct pci_driver ips_pci_driver = {
 	.name = "intel ips",
 	.id_table = ips_id_table,
 	.probe = ips_probe,
 	.remove = ips_remove,
-	.shutdown = ips_shutdown,
 };
 
 module_pci_driver(ips_pci_driver);
-- 
2.14.2
