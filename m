From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 1/2] tools/power/x86/intel-speed-select: Fix display for turbo-freq auto mode
Date: Thu, 30 Jan 2020 21:45:17 -0800
Message-ID: <20200131054518.1644519-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

When mailbox command for the turbo-freq enable fails, then don't display
result for auto-mode. When turbo-freq enable fails, there is no point
to set CPU priorities.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index c74b776adc61..7893ad2c34ab 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -43,6 +43,7 @@ static int out_format_json;
 static int cmd_help;
 static int force_online_offline;
 static int auto_mode;
+static int fact_enable_fail;
 
 /* clos related */
 static int current_clos = -1;
@@ -1581,6 +1582,8 @@ static void set_fact_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 disp_results:
 	if (status) {
 		isst_display_result(cpu, outf, "turbo-freq", "enable", ret);
+		if (ret)
+			fact_enable_fail = ret;
 	} else {
 		/* Since we modified TRL during Fact enable, restore it */
 		isst_set_trl_from_current_tdp(cpu, fact_trl);
@@ -1622,7 +1625,7 @@ static void set_fact_enable(int arg)
 					       NULL, &enable);
 	isst_ctdp_display_information_end(outf);
 
-	if (enable && auto_mode) {
+	if (!fact_enable_fail && enable && auto_mode) {
 		/*
 		 * When we adjust CLOS param, we have to set for siblings also.
 		 * So for the each user specified CPU, also add the sibling
-- 
2.24.1
