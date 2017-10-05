From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/6] platform/x86: intel_ips: Switch to new PCI IRQ allocation API
Date: Thu,  5 Oct 2017 14:54:16 +0300
Message-ID: <20171005115420.2786-2-andriy.shevchenko@linux.intel.com>
References: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This makes code cleaner.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_ips.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 063d9a1624b4..6f6900065bc2 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -297,6 +297,8 @@ static struct ips_mcp_limits ips_ulv_limits = {
 struct ips_driver {
 	struct pci_dev *dev;
 	void __iomem *regmap;
+	int irq;
+
 	struct task_struct *monitor;
 	struct task_struct *adjust;
 	struct dentry *debug_root;
@@ -1592,9 +1594,13 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	 * IRQ handler for ME interaction
 	 * Note: don't use MSI here as the PCH has bugs.
 	 */
-	pci_disable_msi(dev);
-	ret = request_irq(dev->irq, ips_irq_handler, IRQF_SHARED, "ips",
-			  ips);
+	ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_LEGACY);
+	if (ret < 0)
+		return ret;
+
+	ips->irq = pci_irq_vector(dev, 0);
+
+	ret = request_irq(ips->irq, ips_irq_handler, IRQF_SHARED, "ips", ips);
 	if (ret) {
 		dev_err(&dev->dev, "request irq failed, aborting\n");
 		return ret;
@@ -1654,7 +1660,8 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 error_thread_cleanup:
 	kthread_stop(ips->adjust);
 error_free_irq:
-	free_irq(ips->dev->irq, ips);
+	free_irq(ips->irq, ips);
+	pci_free_irq_vectors(dev);
 	return ret;
 }
 
@@ -1685,7 +1692,8 @@ static void ips_remove(struct pci_dev *dev)
 	wrmsrl(TURBO_POWER_CURRENT_LIMIT, turbo_override);
 	wrmsrl(TURBO_POWER_CURRENT_LIMIT, ips->orig_turbo_limit);
 
-	free_irq(ips->dev->irq, ips);
+	free_irq(ips->irq, ips);
+	pci_free_irq_vectors(dev);
 	if (ips->adjust)
 		kthread_stop(ips->adjust);
 	if (ips->monitor)
-- 
2.14.2
