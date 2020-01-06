From: Harry Pan <harry.pan@intel.com>
Subject: [PATCH] platform/x86: intel_pmc_core: update Comet Lake platform driver
Date: Mon,  6 Jan 2020 17:57:00 +0800
Message-ID: <20200106175643.1.Iaff1da2791b9a00377e8d93aa81b5394ffc5b1b8@changeid>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: rajatja@google.com, gs0622@gmail.com, Harry Pan <harry.pan@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Adding new CML CPU model ID into platform driver support list.

Signed-off-by: Harry Pan <harry.pan@intel.com>

---

 drivers/platform/x86/intel_pmc_core_pltdrv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_core_pltdrv.c b/drivers/platform/x86/intel_pmc_core_pltdrv.c
index 6fe829f30997..e1266f5c6359 100644
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
2.24.1
