From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 052/107] platform/x86: intel_pmc_core: update Comet Lake platform driver
Date: Fri, 24 Jan 2020 09:17:22 -0500
Message-ID: <20200124141817.28793-52-sashal@kernel.org>
References: <20200124141817.28793-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200124141817.28793-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Harry Pan <harry.pan@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Harry Pan <harry.pan@intel.com>

[ Upstream commit 515ff674bb9bf06186052e352c4587dab8defaf0 ]

Adding new CML CPU model ID into platform driver support list.

Signed-off-by: Harry Pan <harry.pan@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel_pmc_core_pltdrv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_core_pltdrv.c b/drivers/platform/x86/intel_pmc_core_pltdrv.c
index 6fe829f30997d..e1266f5c63593 100644
--- a/drivers/platform/x86/intel_pmc_core_pltdrv.c
+++ b/drivers/platform/x86/intel_pmc_core_pltdrv.c
@@ -44,6 +44,8 @@ static const struct x86_cpu_id intel_pmc_core_platform_ids[] = {
 	INTEL_CPU_FAM6(KABYLAKE, pmc_core_device),
 	INTEL_CPU_FAM6(CANNONLAKE_L, pmc_core_device),
 	INTEL_CPU_FAM6(ICELAKE_L, pmc_core_device),
+	INTEL_CPU_FAM6(COMETLAKE, pmc_core_device),
+	INTEL_CPU_FAM6(COMETLAKE_L, pmc_core_device),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_platform_ids);
-- 
2.20.1
