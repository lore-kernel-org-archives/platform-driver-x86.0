From: Rajat Jain <rajatja@google.com>
Subject: [PATCH] platform/x86: intel_pmc_core: Avoid a u32 overflow
Date: Fri, 15 Feb 2019 16:19:20 -0800
Message-ID: <20190216001920.178053-1-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rajatxjain@gmail.com, Rajat Jain <rajatja@google.com>
List-Id: platform-driver-x86.vger.kernel.org

The register (SLP_S0_RES) at offset slp_s0_offset is a 32 bit register.
The pmc_core_adjust_slp_s0_step() could overflow the u32 value while
returning it after adjusting the step. Thus change to u64, this is
already accounted for in debugfs attribute (that wants to output a
64 bit value).

Signed-off-by: Rajat Jain <rajatja@google.com>
---
 drivers/platform/x86/intel_pmc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 22dbf115782e..f90f4dd25151 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -328,9 +328,9 @@ static inline void pmc_core_reg_write(struct pmc_dev *pmcdev, int
 	writel(val, pmcdev->regbase + reg_offset);
 }
 
-static inline u32 pmc_core_adjust_slp_s0_step(u32 value)
+static inline u64 pmc_core_adjust_slp_s0_step(u32 value)
 {
-	return value * SPT_PMC_SLP_S0_RES_COUNTER_STEP;
+	return (u64)value * SPT_PMC_SLP_S0_RES_COUNTER_STEP;
 }
 
 static int pmc_core_dev_state_get(void *data, u64 *val)
-- 
2.21.0.rc0.258.g878e2cd30e-goog
