From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 1/6] intel_pmc_core: Fix PWRMBASE mask and mmio reg len
Date: Fri,  7 Oct 2016 16:01:12 +0530
Message-ID: <1475836277-4788-2-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:63784 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753292AbcJGKbW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Oct 2016 06:31:22 -0400
In-Reply-To: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

On Sunrise Point PCH, the Power Management Controller provides 4K bytes of
memory space for various power management and debug registers. This fix is
needed to access power management & debug registers that are mapped at a
higher offset.

Also, this provides a fix for correctly masking the PWRMBASE as the initial
bits (0-11) are reserved.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 1 +
 drivers/platform/x86/intel_pmc_core.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 520b58a..fcb0643 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -149,6 +149,7 @@ static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		dev_dbg(&dev->dev, "PMC Core: failed to read PCI config space.\n");
 		return err;
 	}
+	pmcdev->base_addr &= PMC_BASE_ADDR_MASK;
 	dev_dbg(&dev->dev, "PMC Core: PWRMBASE is %#x\n", pmcdev->base_addr);
 
 	pmcdev->regbase = devm_ioremap_nocache(ptr_dev,
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index e3f671f..cde31ec 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -26,8 +26,9 @@
 
 #define SPT_PMC_BASE_ADDR_OFFSET		0x48
 #define SPT_PMC_SLP_S0_RES_COUNTER_OFFSET	0x13c
-#define SPT_PMC_MMIO_REG_LEN			0x100
+#define SPT_PMC_MMIO_REG_LEN			0x1000
 #define SPT_PMC_SLP_S0_RES_COUNTER_STEP		0x64
+#define PMC_BASE_ADDR_MASK			~(SPT_PMC_MMIO_REG_LEN - 1)
 
 /**
  * struct pmc_dev - pmc device structure
-- 
1.9.1
