From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 25/27] tools/power/x86/intel-speed-select: Add display for enabled cpus count
Date: Thu,  5 Mar 2020 14:45:36 -0800
Message-ID: <20200305224538.490864-26-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

In addition to total CPU count also display "enabled-cpu-count" for
perf-profile info command. This will show number of CPUs in the
"enable-cpu-mask".

For example:

 perf-profile-level-4
        cpu-count:32
        enable-cpu-count:16
        enable-cpu-mask:e42d0000,e42d0000

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-display.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index ed51d8b79c41..4f4c42147a90 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -354,6 +354,14 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 		snprintf(value, sizeof(value), "%d", j);
 		format_and_print(outf, base_level + 4, header, value);
 
+		j = CPU_COUNT_S(ctdp_level->core_cpumask_size,
+				ctdp_level->core_cpumask);
+		if (j) {
+			snprintf(header, sizeof(header), "enable-cpu-count");
+			snprintf(value, sizeof(value), "%d", j);
+			format_and_print(outf, base_level + 4, header, value);
+		}
+
 		if (ctdp_level->core_cpumask_size) {
 			snprintf(header, sizeof(header), "enable-cpu-mask");
 			printcpumask(sizeof(value), value,
-- 
2.24.1
