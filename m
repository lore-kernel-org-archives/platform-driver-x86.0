From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 3/3] tools/power/x86/intel-speed-select: Refuse to disable core-power when getting used
Date: Mon,  7 Oct 2019 10:29:59 -0700
Message-ID: <20191007172959.25912-4-srinivas.pandruvada@linux.intel.com>
References: <20191007172959.25912-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007172959.25912-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The turbo-freq feature is dependent on the core-power feature. If the
core-power feature is disabled while the turbo-freq feature is enabled,
this will break the turbo-freq feature. This is a firmware limitation,
where they can't return error under this scenario.

So when trying to disable core-power, make sure that the turbo-freq
feature is not enabled. If it enabled, return error if user is trying to
disable the core-power feature.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../power/x86/intel-speed-select/isst-core.c  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-core.c b/tools/power/x86/intel-speed-select/isst-core.c
index 6dee5332c9d3..67d32f2b9bea 100644
--- a/tools/power/x86/intel-speed-select/isst-core.c
+++ b/tools/power/x86/intel-speed-select/isst-core.c
@@ -649,6 +649,27 @@ int isst_pm_qos_config(int cpu, int enable_clos, int priority_type)
 	unsigned int req, resp;
 	int ret;
 
+	if (!enable_clos) {
+		struct isst_pkg_ctdp pkg_dev;
+		struct isst_pkg_ctdp_level_info ctdp_level;
+
+		ret = isst_get_ctdp_levels(cpu, &pkg_dev);
+		if (ret) {
+			debug_printf("isst_get_ctdp_levels\n");
+			return ret;
+		}
+
+		ret = isst_get_ctdp_control(cpu, pkg_dev.current_level,
+					    &ctdp_level);
+		if (ret)
+			return ret;
+
+		if (ctdp_level.fact_enabled) {
+			debug_printf("Turbo-freq feature must be disabled first\n");
+			return -EINVAL;
+		}
+	}
+
 	ret = isst_send_mbox_command(cpu, CONFIG_CLOS, CLOS_PM_QOS_CONFIG, 0, 0,
 				     &resp);
 	if (ret)
-- 
2.17.2
