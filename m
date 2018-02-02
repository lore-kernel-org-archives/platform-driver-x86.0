From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [Patch v2 2/5] platform/x86: intel_pmc_core: Read base address from LPIT
Date: Fri,  2 Feb 2018 19:13:34 +0530
Message-ID: <1517579017-19935-3-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1517579017-19935-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:38331 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751931AbeBBNtC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Feb 2018 08:49:02 -0500
In-Reply-To: <1517579017-19935-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Read SLP_S0 address from ACPI LPIT table when present and use PMC
specific SLP_S0 offset to get the base address of PMC MMIO.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 5c401e17cfb6..bb80aed4c3c1 100644
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
 	struct pmc_dev *pmcdev = &pmc;
 	const struct x86_cpu_id *cpu_id;
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
