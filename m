From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 21/27] tools/power/x86/intel-speed-select: Show error for invalid CPUs in the options
Date: Thu,  5 Mar 2020 14:45:32 -0800
Message-ID: <20200305224538.490864-22-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

When --cpu or -c is used to specify target CPUs and non of them are valid,
display error.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 7a8a315ac8d1..386791aaeca1 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -425,7 +425,7 @@ static void for_each_online_target_cpu_in_set(
 	void (*callback)(int, void *, void *, void *, void *), void *arg1,
 	void *arg2, void *arg3, void *arg4)
 {
-	int i;
+	int i, found = 0;
 
 	for (i = 0; i < topo_max_cpus; ++i) {
 		int online;
@@ -439,9 +439,14 @@ static void for_each_online_target_cpu_in_set(
 			online =
 				1; /* online entry for CPU 0 needs some special configs */
 
-		if (online && callback)
+		if (online && callback) {
 			callback(i, arg1, arg2, arg3, arg4);
+			found = 1;
+		}
 	}
+
+	if (!found)
+		fprintf(stderr, "No valid CPU in the list\n");
 }
 
 #define BITMASK_SIZE 32
-- 
2.24.1
