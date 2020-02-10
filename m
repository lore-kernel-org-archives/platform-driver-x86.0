From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1] platform/x86: intel_pmc_core: Bug: Fix the order of the parameters passed to pmc_core_lpm_display()
Date: Mon, 10 Feb 2020 11:40:38 -0800
Message-ID: <e0564ff97744f4bf916cd59ecb0d8fdb63806229.1581361984.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, "David E . Box" <david.e.box@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The parameters passed to pmc_core_lpm_display() which is called by
pmc_core_resume() are not in the right order and hence will not dump the
low power status registers on an S0ix.y failure even if it is compiled
(with warnings).

Fix the bug by passing the parameters in right order.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: David E. Box <david.e.box@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---

Hi Andy,
The reason for not catching this bug earlier was not passing the "-Werror"
flag while compiling. I apologize for overlooking the warnings. I wanted to
send v3 of the series, but I have noticed the patch series has been merged in
to for-next branch. I have made sure, no warnings or errors are seen before
sending this fix.

 drivers/platform/x86/intel_pmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 753d51087838..f4a36fbabf4c 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -1326,7 +1326,7 @@ static int pmc_core_resume(struct device *dev)
 	if (pmcdev->map->slps0_dbg_maps)
 		pmc_core_slps0_display(pmcdev, dev, NULL);
 	if (pmcdev->map->lpm_sts)
-		pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
+		pmc_core_lpm_display(pmcdev, dev, NULL, offset, "STATUS", maps);
 
 	return 0;
 }
-- 
2.17.1
