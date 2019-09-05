From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 1/2] platform/x86: ISST: Allow additional TRL MSRs
Date: Thu,  5 Sep 2019 16:37:47 -0700
Message-ID: <20190905233748.6822-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: prarit@redhat.com, darcari@redhat.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Additional Turbo Ratio Limit (TRL) MSRs are required to get bucket vs core
count relationship. So add them to the list of allowed MSRs.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel_speed_select_if/isst_if_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
index 68d75391db57..3de5a3c66529 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
@@ -29,6 +29,8 @@ static struct isst_if_cmd_cb punit_callbacks[ISST_IF_DEV_MAX];
 static int punit_msr_white_list[] = {
 	MSR_TURBO_RATIO_LIMIT,
 	MSR_CONFIG_TDP_CONTROL,
+	MSR_TURBO_RATIO_LIMIT1,
+	MSR_TURBO_RATIO_LIMIT2,
 };
 
 struct isst_valid_cmd_ranges {
-- 
2.17.2
