From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [RFC v6-1 1/1] platform/x86: intel_pmc_ipc: Use spin_lock to protect GCR updates
Date: Wed, 18 Oct 2017 17:37:14 -0700
Message-ID: <1508373434-115903-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <0c13dfd2626df7b91b64dcc393e1d31e1a2c933f.1508368279.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:48966 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750829AbdJSAhl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2017 20:37:41 -0400
In-Reply-To: <0c13dfd2626df7b91b64dcc393e1d31e1a2c933f.1508368279.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, qipeng.zha@intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Currently, update_no_reboot_bit() function implemented in this driver
uses mutex_lock() to protect its register updates. But this function is
called with in atomic context in iTCO_wdt_start() and iTCO_wdt_stop()
functions in iTCO_wdt.c driver, which in turn causes "sleeping into
atomic context" issue. This patch fixes this issue by replacing the
mutex_lock() with spin_lock() to protect the GCR read/write/update APIs.

Fixes: 9d855d468dc6 ("platform/x86: intel_pmc_ipc: Fix iTCO_wdt GCS memory mapping failure")
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

Change since v6:
 * Fixed spelling error in signed-off-by email address.

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index bb792a5..af88221 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -33,6 +33,7 @@
 #include <linux/suspend.h>
 #include <linux/acpi.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/spinlock.h>
 
 #include <asm/intel_pmc_ipc.h>
 
@@ -131,6 +132,7 @@ static struct intel_pmc_ipc_dev {
 	/* gcr */
 	void __iomem *gcr_mem_base;
 	bool has_gcr_regs;
+	spinlock_t gcr_lock;
 
 	/* punit */
 	struct platform_device *punit_dev;
@@ -225,17 +227,17 @@ int intel_pmc_gcr_read(u32 offset, u32 *data)
 {
 	int ret;
 
-	mutex_lock(&ipclock);
+	spin_lock(&ipcdev.gcr_lock);
 
 	ret = is_gcr_valid(offset);
 	if (ret < 0) {
-		mutex_unlock(&ipclock);
+		spin_unlock(&ipcdev.gcr_lock);
 		return ret;
 	}
 
 	*data = readl(ipcdev.gcr_mem_base + offset);
 
-	mutex_unlock(&ipclock);
+	spin_unlock(&ipcdev.gcr_lock);
 
 	return 0;
 }
@@ -255,17 +257,17 @@ int intel_pmc_gcr_write(u32 offset, u32 data)
 {
 	int ret;
 
-	mutex_lock(&ipclock);
+	spin_lock(&ipcdev.gcr_lock);
 
 	ret = is_gcr_valid(offset);
 	if (ret < 0) {
-		mutex_unlock(&ipclock);
+		spin_unlock(&ipcdev.gcr_lock);
 		return ret;
 	}
 
 	writel(data, ipcdev.gcr_mem_base + offset);
 
-	mutex_unlock(&ipclock);
+	spin_unlock(&ipcdev.gcr_lock);
 
 	return 0;
 }
@@ -287,7 +289,7 @@ int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val)
 	u32 new_val;
 	int ret = 0;
 
-	mutex_lock(&ipclock);
+	spin_lock(&ipcdev.gcr_lock);
 
 	ret = is_gcr_valid(offset);
 	if (ret < 0)
@@ -309,7 +311,7 @@ int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val)
 	}
 
 gcr_ipc_unlock:
-	mutex_unlock(&ipclock);
+	spin_unlock(&ipcdev.gcr_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(intel_pmc_gcr_update);
@@ -487,6 +489,8 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	ipcdev.dev = &pci_dev_get(pdev)->dev;
 	ipcdev.irq_mode = IPC_TRIGGER_MODE_IRQ;
 
+	spin_lock_init(&ipcdev.gcr_lock);
+
 	ret = pci_enable_device(pdev);
 	if (ret)
 		return ret;
@@ -924,6 +928,8 @@ static int ipc_plat_probe(struct platform_device *pdev)
 	ipcdev.irq_mode = IPC_TRIGGER_MODE_IRQ;
 	init_completion(&ipcdev.cmd_complete);
 
+	spin_lock_init(&ipcdev.gcr_lock);
+
 	ipcdev.irq = platform_get_irq(pdev, 0);
 	if (ipcdev.irq < 0) {
 		dev_err(&pdev->dev, "Failed to get irq\n");
-- 
2.7.4
