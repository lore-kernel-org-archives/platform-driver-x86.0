From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 13/27] tools/power/x86/intel-speed-select: Check feature status first
Date: Thu,  5 Mar 2020 14:45:24 -0800
Message-ID: <20200305224538.490864-14-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Before looking for information about the base-freq or turbo-freq details,
first check if the feature is supported at that level. If not print error
and return.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../power/x86/intel-speed-select/isst-core.c  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-core.c b/tools/power/x86/intel-speed-select/isst-core.c
index 2f3921cd87f3..732d9a5eacf1 100644
--- a/tools/power/x86/intel-speed-select/isst-core.c
+++ b/tools/power/x86/intel-speed-select/isst-core.c
@@ -394,9 +394,19 @@ int isst_set_tdp_level(int cpu, int tdp_level)
 
 int isst_get_pbf_info(int cpu, int level, struct isst_pbf_info *pbf_info)
 {
+	struct isst_pkg_ctdp_level_info ctdp_level;
 	int i, ret, core_cnt, max;
 	unsigned int req, resp;
 
+	ret = isst_get_ctdp_control(cpu, level, &ctdp_level);
+	if (ret)
+		return ret;
+
+	if (!ctdp_level.pbf_support) {
+		fprintf(stderr, "base-freq feature is not present at this level:%d\n", level);
+		return -1;
+	}
+
 	pbf_info->core_cpumask_size = alloc_cpu_set(&pbf_info->core_cpumask);
 
 	core_cnt = get_core_count(get_physical_package_id(cpu), get_physical_die_id(cpu));
@@ -492,6 +502,10 @@ int isst_set_pbf_fact_status(int cpu, int pbf, int enable)
 		else
 			req &= ~BIT(17);
 	} else {
+
+		if (enable && !ctdp_level.sst_cp_enabled)
+			fprintf(stderr, "Make sure to execute before: core-power enable\n");
+
 		if (ctdp_level.pbf_enabled)
 			req = BIT(17);
 
@@ -579,9 +593,19 @@ int isst_get_fact_bucket_info(int cpu, int level,
 
 int isst_get_fact_info(int cpu, int level, struct isst_fact_info *fact_info)
 {
+	struct isst_pkg_ctdp_level_info ctdp_level;
 	unsigned int resp;
 	int ret;
 
+	ret = isst_get_ctdp_control(cpu, level, &ctdp_level);
+	if (ret)
+		return ret;
+
+	if (!ctdp_level.fact_support) {
+		fprintf(stderr, "turbo-freq feature is not present at this level:%d\n", level);
+		return -1;
+	}
+
 	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
 				     CONFIG_TDP_GET_FACT_LP_CLIPPING_RATIO, 0,
 				     level, &resp);
-- 
2.24.1
