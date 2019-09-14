From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 1/5] tools/power/x86/intel-speed-select: Fix high priority core mask over count
Date: Sat, 14 Sep 2019 12:45:43 -0700
Message-ID: <20190914194547.24271-2-srinivas.pandruvada@linux.intel.com>
References: <20190914194547.24271-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190914194547.24271-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.shevchenko@gmail.com, andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, darcari@redhat.com, Youquan Song <youquan.song@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Youquan Song <youquan.song@intel.com>

If the CPU package has the less logical CPU than topo_max_cpus, but un-present
CPU's punit_cpu_core will be initiated to 0 and they will be count to core 0

Like below, there are only 10 high priority cores (20 logical CPUs) in the CPU
package, but it count to 27 logic CPUs.

./intel-speed-select base-freq info -l 0 | grep mask
        high-priority-cpu-mask:7f000179,f000179f

With the fix patch:
./intel-speed-select base-freq info -l 0
        high-priority-cpu-mask:00000179,f000179f

Signed-off-by: Youquan Song <youquan.song@intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 59753b3917bb..83ac72902b36 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -402,6 +402,9 @@ void set_cpu_mask_from_punit_coremask(int cpu, unsigned long long core_mask,
 			int j;
 
 			for (j = 0; j < topo_max_cpus; ++j) {
+				if (!CPU_ISSET_S(j, present_cpumask_size, present_cpumask))
+					continue;
+
 				if (cpu_map[j].pkg_id == pkg_id &&
 				    cpu_map[j].die_id == die_id &&
 				    cpu_map[j].punit_cpu_core == i) {
-- 
2.17.2
