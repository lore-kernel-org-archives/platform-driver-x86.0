From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [Patch v1 4/8] platform/x86: intel_pmc_core: Read base address from LPIT
Date: Fri, 19 Jan 2018 14:28:23 +0530
Message-ID: <1516352307-20123-5-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1516352307-20123-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516352307-20123-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Read SLP_S0 address from ACPI LPIT table when present and use PMC
specific SLP_S0 offset to get the base address of PMC MMIO.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index f7616600e8ab..549ee5852d4f 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -20,6 +20,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/acpi.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -455,6 +456,7 @@ static int __init pmc_core_probe(void)
 {
 	const struct x86_cpu_id *cpu_id;
 	struct pmc_dev *pmcdev = &pmc;
+	u64 slp_s0_addr;
 	int err;
 
 	cpu_id = x86_match_cpu(intel_pmc_core_ids);
@@ -462,7 +464,12 @@ static int __init pmc_core_probe(void)
 		return -ENODEV;
 
 	pmcdev->map = (struct pmc_reg_map *)cpu_id->driver_data;
-	pmcdev->base_addr = PMC_BASE_ADDR_DEFAULT;
+
+	if (lpit_read_residency_count_address(&slp_s0_addr))
+		pmcdev->base_addr = PMC_BASE_ADDR_DEFAULT;
+	else
+		pmcdev->base_addr = slp_s0_addr - pmcdev->map->slp_s0_offset;
+
 	pmcdev->regbase = ioremap(pmcdev->base_addr,
 				  pmcdev->map->regmap_length);
 	if (!pmcdev->regbase)
-- 
2.7.4
