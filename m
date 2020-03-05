From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 02/27] tools/power/x86/intel-speed-select: Make target CPU optional for core-power info
Date: Thu,  5 Mar 2020 14:45:13 -0800
Message-ID: <20200305224538.490864-3-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently "-c" is a mandatory option for "core-power info" command. Make
this optional as this is a per package/die property. When not specified,
it will print info for every package/die.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 3f019f4f90df..c0de18e10cda 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1763,19 +1763,17 @@ static void dump_clos_info(int arg)
 	if (cmd_help) {
 		fprintf(stderr,
 			"Print Intel Speed Select Technology core power information\n");
-		fprintf(stderr, "\tSpecify targeted cpu id with [--cpu|-c]\n");
-		exit(0);
-	}
-
-	if (!max_target_cpus) {
-		fprintf(stderr,
-			"Invalid target cpu. Specify with [-c|--cpu]\n");
+		fprintf(stderr, "\t Optionally specify targeted cpu id with [--cpu|-c]\n");
 		exit(0);
 	}
 
 	isst_ctdp_display_information_start(outf);
-	for_each_online_target_cpu_in_set(get_clos_info_for_cpu, NULL,
-					  NULL, NULL, NULL);
+	if (max_target_cpus)
+		for_each_online_target_cpu_in_set(get_clos_info_for_cpu, NULL,
+						  NULL, NULL, NULL);
+	else
+		for_each_online_package_in_set(get_clos_info_for_cpu, NULL,
+					       NULL, NULL, NULL);
 	isst_ctdp_display_information_end(outf);
 
 }
-- 
2.24.1
