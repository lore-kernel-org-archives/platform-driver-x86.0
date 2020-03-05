From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 06/27] tools/power/x86/intel-speed-select: Max CPU count calculation when CPU0 is offline
Date: Thu,  5 Mar 2020 14:45:17 -0800
Message-ID: <20200305224538.490864-7-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently /sys/devices/system/cpu/cpu0/topology/thread_siblings is used to
get the max CPU count. But when CPU0 is offline, then this file will be
absent.

So add processing so that we can get count from any first CPU in the
system. which is online.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../power/x86/intel-speed-select/isst-config.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index b8f4846d7c78..c773c6cc02a5 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -316,10 +316,24 @@ static void set_max_cpu_num(void)
 {
 	FILE *filep;
 	unsigned long dummy;
+	int i;
 
 	topo_max_cpus = 0;
-	filep = fopen_or_exit(
-		"/sys/devices/system/cpu/cpu0/topology/thread_siblings", "r");
+	for (i = 0; i < 256; ++i) {
+		char path[256];
+
+		snprintf(path, sizeof(path),
+			 "/sys/devices/system/cpu/cpu%d/topology/thread_siblings", i);
+		filep = fopen(path, "r");
+		if (filep)
+			break;
+	}
+
+	if (!filep) {
+		fprintf(stderr, "Can't get max cpu number\n");
+		exit(0);
+	}
+
 	while (fscanf(filep, "%lx,", &dummy) == 1)
 		topo_max_cpus += BITMASK_SIZE;
 	fclose(filep);
-- 
2.24.1
