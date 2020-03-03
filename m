From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 2/2] tools/power/x86/intel-speed-select: Fix last cpu number
Date: Tue,  3 Mar 2020 14:50:44 -0800
Message-ID: <20200303225044.362525-3-srinivas.pandruvada@linux.intel.com>
References: <20200303225044.362525-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200303225044.362525-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Here topology_max_cpus is used for total CPU count, not the last CPU
number. So remove "-1".

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 50db0cd23d8c..c922cfd7ba50 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -313,7 +313,6 @@ static void set_max_cpu_num(void)
 	while (fscanf(filep, "%lx,", &dummy) == 1)
 		topo_max_cpus += BITMASK_SIZE;
 	fclose(filep);
-	topo_max_cpus--; /* 0 based */
 
 	debug_printf("max cpus %d\n", topo_max_cpus);
 }
-- 
2.24.1
