From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.3 40/49] tools/power/x86/intel-speed-select: Fix high priority core mask over count
Date: Sun, 29 Sep 2019 13:30:40 -0400
Message-ID: <20190929173053.8400-40-sashal@kernel.org>
References: <20190929173053.8400-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190929173053.8400-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Youquan Song <youquan.song@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Youquan Song <youquan.song@intel.com>

[ Upstream commit 44460efe44e05eae2f21e57d06d542bbbb792e65 ]

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
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/power/x86/intel-speed-select/isst-config.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 91c5ad1685a15..a6b1487b5f0f6 100644
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
2.20.1
