From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 07/10] tools/power/x86/intel-speed-select: Use Frequency weight for CLOS
Date: Mon,  4 Nov 2019 03:02:43 -0800
Message-ID: <20191104110246.70465-8-srinivas.pandruvada@linux.intel.com>
References: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Use different frequency weights for CLOS 0 and and CLOS1-3, to define
relative priority for power budgeting. This will be used for --auto
mode to enable base-freq and turbo-freq feature.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index a8ada9a4f020..2d7ed27af7e0 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1260,15 +1260,15 @@ static int set_core_priority_and_min(int cpu, int mask_size,
 	if (ret)
 		return ret;
 
-	ret = set_clos_param(cpu, 1, 15, 0, min_low, 0xff);
+	ret = set_clos_param(cpu, 1, 15, 15, min_low, 0xff);
 	if (ret)
 		return ret;
 
-	ret = set_clos_param(cpu, 2, 15, 0, min_low, 0xff);
+	ret = set_clos_param(cpu, 2, 15, 15, min_low, 0xff);
 	if (ret)
 		return ret;
 
-	ret = set_clos_param(cpu, 3, 15, 0, min_low, 0xff);
+	ret = set_clos_param(cpu, 3, 15, 15, min_low, 0xff);
 	if (ret)
 		return ret;
 
@@ -1589,15 +1589,15 @@ static void set_fact_enable(int arg)
 			if (ret)
 				goto error_disp;
 
-			ret = set_clos_param(i, 1, 15, 0, 0, 0xff);
+			ret = set_clos_param(i, 1, 15, 15, 0, 0xff);
 			if (ret)
 				goto error_disp;
 
-			ret = set_clos_param(i, 2, 15, 0, 0, 0xff);
+			ret = set_clos_param(i, 2, 15, 15, 0, 0xff);
 			if (ret)
 				goto error_disp;
 
-			ret = set_clos_param(i, 3, 15, 0, 0, 0xff);
+			ret = set_clos_param(i, 3, 15, 15, 0, 0xff);
 			if (ret)
 				goto error_disp;
 
-- 
2.17.2
