From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 01/27] tools/power/x86/intel-speed-select: Warn for invalid package id
Date: Thu,  5 Mar 2020 14:45:12 -0800
Message-ID: <20200305224538.490864-2-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

When CPU is offline, we can't get package id. So print error for this
and don't use output.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index c922cfd7ba50..3f019f4f90df 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -261,6 +261,10 @@ static void for_each_online_package_in_set(void (*callback)(int, void *, void *,
 		if (die_id < 0)
 			die_id = 0;
 		pkg_id = get_physical_package_id(i);
+		if (pkg_id < 0) {
+			fprintf(stderr, "Failed to get package id, CPU %d may be offline\n", i);
+			continue;
+		}
 		/* Create an unique id for package, die combination to store */
 		pkg_id = (MAX_PACKAGE_COUNT * pkg_id + die_id);
 
@@ -362,6 +366,10 @@ static void set_cpu_present_cpu_mask(void)
 				die_id = 0;
 
 			pkg_id = get_physical_package_id(i);
+			if (pkg_id < 0) {
+				fprintf(stderr, "Failed to get package id, CPU %d may be offline\n", i);
+				continue;
+			}
 			if (pkg_id < MAX_PACKAGE_COUNT &&
 			    die_id < MAX_DIE_PER_PACKAGE) {
 				int core_id = get_physical_core_id(i);
-- 
2.24.1
