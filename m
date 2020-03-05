From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 22/27] tools/power/x86/intel-speed-select: Improve CLX commands
Date: Thu,  5 Mar 2020 14:45:33 -0800
Message-ID: <20200305224538.490864-23-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

CLX doesn't have capability to change the feature in the hardware, but
this acts as "--auto | -a" option. So even if user didn't specify the
option, use this as --auto | -a to set cpufreq scaling frequency limits.

Also remove perror with debug_printf as they don't bring any value.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 386791aaeca1..a44ec2f76f52 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1162,7 +1162,7 @@ static void dump_clx_n_config_for_cpu(int cpu, void *arg1, void *arg2,
 
 	ret = clx_n_config(cpu);
 	if (ret) {
-		perror("isst_get_process_ctdp");
+		debug_printf("clx_n_config failed");
 	} else {
 		struct isst_pkg_ctdp_level_info *ctdp_level;
 		struct isst_pbf_info *pbf_info;
@@ -1419,7 +1419,7 @@ static int set_clx_pbf_cpufreq_scaling_min_max(int cpu)
 
 	ret = clx_n_config(cpu);
 	if (ret) {
-		perror("set_clx_pbf_cpufreq_scaling_min_max");
+		debug_printf("cpufreq_scaling_min_max failed for CLX");
 		return ret;
 	}
 
@@ -1635,17 +1635,13 @@ static void set_pbf_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 	int status = *(int *)arg4;
 
 	if (is_clx_n_platform()) {
+		ret = 0;
 		if (status) {
-			ret = 0;
-			if (auto_mode)
-				set_clx_pbf_cpufreq_scaling_min_max(cpu);
+			set_clx_pbf_cpufreq_scaling_min_max(cpu);
 
 		} else {
-			ret = -1;
-			if (auto_mode) {
-				set_scaling_max_to_cpuinfo_max(cpu);
-				set_scaling_min_to_cpuinfo_min(cpu);
-			}
+			set_scaling_max_to_cpuinfo_max(cpu);
+			set_scaling_min_to_cpuinfo_min(cpu);
 		}
 		goto disp_result;
 	}
-- 
2.24.1
