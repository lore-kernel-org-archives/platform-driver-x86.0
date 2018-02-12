From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: intel_turbo_max_3: Remove restriction for HWP platforms
Date: Mon, 12 Feb 2018 11:50:47 -0800
Message-ID: <20180212195047.23671-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, arjan@linux.intel.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On systems supporting HWP (Hardware P-States) mode, we expected to
enumerate core priority via ACPI-CPPC tables. Unfortunately deployment of
TURBO 3.0 didn't use this method to show core priority. So users are not
able to utilize this feature in HWP mode.

So remove the loading restriction of this driver for HWP enabled systems.
Even if there are some systems, which are providing the core priority via
ACPI CPPC, this shouldn't cause any conflict as the source of priority
definition is same.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reported-and-tested-and-reviewed-by: Arjan van de Ven <arjan@linux.intel.com>
---
 drivers/platform/x86/intel_turbo_max_3.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/intel_turbo_max_3.c b/drivers/platform/x86/intel_turbo_max_3.c
index d4ea01805879..a6d5aa0c3c47 100644
--- a/drivers/platform/x86/intel_turbo_max_3.c
+++ b/drivers/platform/x86/intel_turbo_max_3.c
@@ -138,9 +138,6 @@ static int __init itmt_legacy_init(void)
 	if (!id)
 		return -ENODEV;
 
-	if (boot_cpu_has(X86_FEATURE_HWP))
-		return -ENODEV;
-
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"platform/x86/turbo_max_3:online",
 				itmt_legacy_cpu_online,	NULL);
-- 
2.13.6
