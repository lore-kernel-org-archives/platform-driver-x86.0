From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 04/27] tools/power/x86/intel-speed-select: Use more verbiage for clos information
Date: Thu,  5 Mar 2020 14:45:15 -0800
Message-ID: <20200305224538.490864-5-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Instead of displaying 0 and 1 for enable status, display "disabled"
and "enabled" respectively.

Similarly for priority type, display "ordered or proportional" instead
of 0 and 1.

An example display:

$intel-speed-select -c 1 core-power info
Intel(R) Speed Select Technology
..
 package-0
  die-0
    cpu-1
      core-power
        support-status:supported
        enable-status:enabled
        clos-enable-status:enabled
        priority-type:proportional

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-display.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index 30377acb909d..ec737e101e52 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -621,11 +621,17 @@ void isst_clos_display_clos_information(int cpu, FILE *outf,
 	format_and_print(outf, 5, header, value);
 
 	snprintf(header, sizeof(header), "clos-enable-status");
-	snprintf(value, sizeof(value), "%d", clos_enable);
+	if (clos_enable)
+		snprintf(value, sizeof(value), "enabled");
+	else
+		snprintf(value, sizeof(value), "disabled");
 	format_and_print(outf, 5, header, value);
 
 	snprintf(header, sizeof(header), "priority-type");
-	snprintf(value, sizeof(value), "%d", type);
+	if (type)
+		snprintf(value, sizeof(value), "ordered");
+	else
+		snprintf(value, sizeof(value), "proportional");
 	format_and_print(outf, 5, header, value);
 
 	format_and_print(outf, 1, NULL, NULL);
-- 
2.24.1
