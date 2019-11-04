From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 03/10] tools/power/x86/intel-speed-select: Correct CLX-N frequency units
Date: Mon,  4 Nov 2019 03:02:39 -0800
Message-ID: <20191104110246.70465-4-srinivas.pandruvada@linux.intel.com>
References: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

In CLX_N base_frequency is read from cpufreq sysfs, where units are in
KHz. The internal units in the code matches the real ratios which are
in 100MHz scale. So when storing units for CLX-N frequencies, convert
to 100MHz scale.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 1c20048b42e7..bfa42fc6c4d2 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -840,8 +840,8 @@ static int clx_n_config(int cpu)
 	}
 
 	/* convert frequencies back to ratios */
-	pbf_info->p1_high = pbf_info->p1_high / DISP_FREQ_MULTIPLIER;
-	pbf_info->p1_low = pbf_info->p1_low / DISP_FREQ_MULTIPLIER;
+	pbf_info->p1_high = pbf_info->p1_high / 100000;
+	pbf_info->p1_low = pbf_info->p1_low / 100000;
 
 	/* create high priority cpu mask */
 	pbf_info->core_cpumask_size = alloc_cpu_set(&pbf_info->core_cpumask);
@@ -856,7 +856,7 @@ static int clx_n_config(int cpu)
 		cpu_bf = parse_int_file(1,
 			"/sys/devices/system/cpu/cpu%d/cpufreq/base_frequency",
 					i);
-		cpu_bf = cpu_bf / DISP_FREQ_MULTIPLIER;
+		cpu_bf = cpu_bf / 100000;
 		if (cpu_bf == pbf_info->p1_high)
 			CPU_SET_S(i, pbf_info->core_cpumask_size,
 				  pbf_info->core_cpumask);
-- 
2.17.2
