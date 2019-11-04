From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 02/10] tools/power/x86/intel-speed-select: Change display of "avx" to "avx2"
Date: Mon,  4 Nov 2019 03:02:38 -0800
Message-ID: <20191104110246.70465-3-srinivas.pandruvada@linux.intel.com>
References: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Make the avx level display consistent. Except for "turbo-ratio-limits-avx",
everywhere else it is avx2. So change "turbo-ratio-limits-avx"
to "turbo-ratio-limits-avx2".

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index d330f7a90c76..b7d58f7c5b3e 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -449,7 +449,7 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 				  DISP_FREQ_MULTIPLIER);
 			format_and_print(outf, base_level + 6, header, value);
 		}
-		snprintf(header, sizeof(header), "turbo-ratio-limits-avx");
+		snprintf(header, sizeof(header), "turbo-ratio-limits-avx2");
 		format_and_print(outf, base_level + 4, header, NULL);
 		for (j = 0; j < 8; ++j) {
 			snprintf(header, sizeof(header), "bucket-%d", j);
-- 
2.17.2
