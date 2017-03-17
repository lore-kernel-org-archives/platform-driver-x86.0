From: Kuppuswamy Sathyanarayanan
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v2 3/4] watchdog: iTCO_wdt: Fix PMC GCR memory mapping failure
Date: Thu, 16 Mar 2017 17:41:35 -0700
Message-ID: <2c41b3b6344f9cb455ac57e1e41aa229adb2867d.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20170316192003.GA19344@rajaneesh-OptiPlex-9010>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170316192003.GA19344@rajaneesh-OptiPlex-9010>
In-Reply-To: <b89221c652d06c3c07fdf2ec32fd4fc8930c64df.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <b89221c652d06c3c07fdf2ec32fd4fc8930c64df.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, qipeng.zha@intel.com, dvhart@infradead.org, david.e.box@linux.intel.com
Cc: rajneesh.bhardwaj@intel.com, sathyanarayanan.kuppuswamy@linux.intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Currently, iTCO watchdog driver uses memory map to access
PMC_CFG GCR register. But the entire GCR address space is
already mapped in intel_scu_ipc driver. So remapping the
GCR register in this driver causes the mem request failure in
iTCO_wdt probe function. This patch fixes this issue by
using PMC GCR read/write API's to access PMC_CFG register.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/watchdog/iTCO_wdt.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 3d0abc0..31abfc5 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -68,6 +68,8 @@
 #include <linux/io.h>			/* For inb/outb/... */
 #include <linux/platform_data/itco_wdt.h>
 
+#include <asm/intel_pmc_ipc.h>
+
 #include "iTCO_vendor.h"
 
 /* Address definitions for the TCO */
@@ -94,12 +96,6 @@ struct iTCO_wdt_private {
 	unsigned int iTCO_version;
 	struct resource *tco_res;
 	struct resource *smi_res;
-	/*
-	 * NO_REBOOT flag is Memory-Mapped GCS register bit 5 (TCO version 2),
-	 * or memory-mapped PMC register bit 4 (TCO version 3).
-	 */
-	struct resource *gcs_pmc_res;
-	unsigned long __iomem *gcs_pmc;
 	/* the lock for io operations */
 	spinlock_t io_lock;
 	/* the PCI-device */
@@ -176,9 +172,9 @@ static void iTCO_wdt_set_NO_REBOOT_bit(struct iTCO_wdt_private *p)
 
 	/* Set the NO_REBOOT bit: this disables reboots */
 	if (p->iTCO_version >= 2) {
-		val32 = readl(p->gcs_pmc);
+		val32 = intel_pmc_gcr_read(PMC_GCR_PMC_CFG_REG);
 		val32 |= no_reboot_bit(p);
-		writel(val32, p->gcs_pmc);
+		intel_pmc_gcr_write(PMC_GCR_PMC_CFG_REG, val32);
 	} else if (p->iTCO_version == 1) {
 		pci_read_config_dword(p->pci_dev, 0xd4, &val32);
 		val32 |= no_reboot_bit(p);
@@ -193,11 +189,11 @@ static int iTCO_wdt_unset_NO_REBOOT_bit(struct iTCO_wdt_private *p)
 
 	/* Unset the NO_REBOOT bit: this enables reboots */
 	if (p->iTCO_version >= 2) {
-		val32 = readl(p->gcs_pmc);
+		val32 = intel_pmc_gcr_read(PMC_GCR_PMC_CFG_REG);
 		val32 &= ~enable_bit;
-		writel(val32, p->gcs_pmc);
+		intel_pmc_gcr_write(PMC_GCR_PMC_CFG_REG, val32);
 
-		val32 = readl(p->gcs_pmc);
+		val32 = intel_pmc_gcr_read(PMC_GCR_PMC_CFG_REG);
 	} else if (p->iTCO_version == 1) {
 		pci_read_config_dword(p->pci_dev, 0xd4, &val32);
 		val32 &= ~enable_bit;
@@ -428,19 +424,6 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	p->iTCO_version = pdata->version;
 	p->pci_dev = to_pci_dev(dev->parent);
 
-	/*
-	 * Get the Memory-Mapped GCS or PMC register, we need it for the
-	 * NO_REBOOT flag (TCO v2 and v3).
-	 */
-	if (p->iTCO_version >= 2) {
-		p->gcs_pmc_res = platform_get_resource(pdev,
-						       IORESOURCE_MEM,
-						       ICH_RES_MEM_GCS_PMC);
-		p->gcs_pmc = devm_ioremap_resource(dev, p->gcs_pmc_res);
-		if (IS_ERR(p->gcs_pmc))
-			return PTR_ERR(p->gcs_pmc);
-	}
-
 	/* Check chipset's NO_REBOOT bit */
 	if (iTCO_wdt_unset_NO_REBOOT_bit(p) &&
 	    iTCO_vendor_check_noreboot_on()) {
-- 
2.7.4
