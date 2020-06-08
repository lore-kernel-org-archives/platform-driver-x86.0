From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.7 042/274] tools/power/x86/intel-speed-select: Fix CLX-N package information output
Date: Mon,  8 Jun 2020 19:02:15 -0400
Message-ID: <20200608230607.3361041-42-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, andriy.shevchenko@linux.intel.com, platform-driver-x86@vger.kernel.org, Sasha Levin <sashal@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Prarit Bhargava <prarit@redhat.com>

[ Upstream commit 28c59ae6965ca0626e3150e2f2863e0f0c810ed7 ]

On CLX-N the perf-profile output is missing the package, die, and cpu
output.  On CLX-N the pkg_dev struct will never be evaluated by the core
code so pkg_dev.processed is always 0 and the package, die, and cpu
information is never output.

Set the pkg_dev.processed flag to 1 for CLX-N processors.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: andriy.shevchenko@linux.intel.com
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/power/x86/intel-speed-select/isst-config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index b73763489410..3688f1101ec4 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1169,6 +1169,7 @@ static void dump_clx_n_config_for_cpu(int cpu, void *arg1, void *arg2,
 
 		ctdp_level = &clx_n_pkg_dev.ctdp_level[0];
 		pbf_info = &ctdp_level->pbf_info;
+		clx_n_pkg_dev.processed = 1;
 		isst_ctdp_display_information(cpu, outf, tdp_level, &clx_n_pkg_dev);
 		free_cpu_set(ctdp_level->core_cpumask);
 		free_cpu_set(pbf_info->core_cpumask);
-- 
2.25.1
