From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH v2 01/10] platform/x86: intel_pmc_core: Handle CFL regmap properly
Date: Wed, 13 Feb 2019 20:38:01 +0530
Message-ID: <20190213150810.32750-2-rajneesh.bhardwaj@linux.intel.com>
References: <20190213150810.32750-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213150810.32750-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E. Box" <david.e.box@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Only Coffeelake should use Cannonlake regmap other than Cannonlake
platform. This allows Coffeelake special handling only when there is no
matching PCI device and default reg map selected as per CPUID is for
Sunrisepoint PCH. This change is needed to enable support for newer SoCs
such as Icelake.

Cc: "David E. Box" <david.e.box@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Fixes: 661405bd817b ("platform/x86: intel_pmc_core: Special case for Coffeelake")
Acked-by: "David E. Box" <david.e.box@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 22dbf115782e..37f605da9333 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -768,7 +768,7 @@ static int __init pmc_core_probe(void)
 	 * Sunrisepoint PCH regmap can't be used. Use Cannonlake PCH regmap
 	 * in this case.
 	 */
-	if (!pci_dev_present(pmc_pci_ids))
+	if (pmcdev->map == &spt_reg_map && !pci_dev_present(pmc_pci_ids))
 		pmcdev->map = &cnp_reg_map;
 
 	if (lpit_read_residency_count_address(&slp_s0_addr))
-- 
2.17.1
