From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH 5/8] tools/power/x86/intel-speed-select: Switch output to MHz
Date: Tue,  3 Sep 2019 11:37:31 -0400
Message-ID: <20190903153734.11904-6-prarit@redhat.com>
References: <20190903153734.11904-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903153734.11904-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

These features are introduced on new processors that will never operate
in the KHz range.

Save some zeros and switch the output to MHz.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: David Arcari <darcari@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 .../x86/intel-speed-select/isst-display.c     | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index 3ae693efceaa..4ec1924ff7a9 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -6,7 +6,7 @@
 
 #include "isst.h"
 
-#define DISP_FREQ_MULTIPLIER 100000
+#define DISP_FREQ_MULTIPLIER 100
 
 static void printcpumask(int str_len, char *str, int mask_size,
 			 cpu_set_t *cpu_mask)
@@ -156,7 +156,7 @@ static void _isst_pbf_display_information(int cpu, FILE *outf, int level,
 	snprintf(header, sizeof(header), "speed-select-base-freq");
 	format_and_print(outf, disp_level, header, NULL);
 
-	snprintf(header, sizeof(header), "high-priority-base-frequency(KHz)");
+	snprintf(header, sizeof(header), "high-priority-base-frequency(MHz)");
 	snprintf(value, sizeof(value), "%d",
 		 pbf_info->p1_high * DISP_FREQ_MULTIPLIER);
 	format_and_print(outf, disp_level + 1, header, value);
@@ -166,7 +166,7 @@ static void _isst_pbf_display_information(int cpu, FILE *outf, int level,
 		     pbf_info->core_cpumask);
 	format_and_print(outf, disp_level + 1, header, value);
 
-	snprintf(header, sizeof(header), "low-priority-base-frequency(KHz)");
+	snprintf(header, sizeof(header), "low-priority-base-frequency(MHz)");
 	snprintf(value, sizeof(value), "%d",
 		 pbf_info->p1_low * DISP_FREQ_MULTIPLIER);
 	format_and_print(outf, disp_level + 1, header, value);
@@ -209,7 +209,7 @@ static void _isst_fact_display_information(int cpu, FILE *outf, int level,
 
 		if (fact_avx & 0x01) {
 			snprintf(header, sizeof(header),
-				 "high-priority-max-frequency(KHz)");
+				 "high-priority-max-frequency(MHz)");
 			snprintf(value, sizeof(value), "%d",
 				 bucket_info[j].sse_trl * DISP_FREQ_MULTIPLIER);
 			format_and_print(outf, base_level + 2, header, value);
@@ -217,7 +217,7 @@ static void _isst_fact_display_information(int cpu, FILE *outf, int level,
 
 		if (fact_avx & 0x02) {
 			snprintf(header, sizeof(header),
-				 "high-priority-max-avx2-frequency(KHz)");
+				 "high-priority-max-avx2-frequency(MHz)");
 			snprintf(value, sizeof(value), "%d",
 				 bucket_info[j].avx_trl * DISP_FREQ_MULTIPLIER);
 			format_and_print(outf, base_level + 2, header, value);
@@ -225,7 +225,7 @@ static void _isst_fact_display_information(int cpu, FILE *outf, int level,
 
 		if (fact_avx & 0x04) {
 			snprintf(header, sizeof(header),
-				 "high-priority-max-avx512-frequency(KHz)");
+				 "high-priority-max-avx512-frequency(MHz)");
 			snprintf(value, sizeof(value), "%d",
 				 bucket_info[j].avx512_trl *
 					 DISP_FREQ_MULTIPLIER);
@@ -235,19 +235,19 @@ static void _isst_fact_display_information(int cpu, FILE *outf, int level,
 	snprintf(header, sizeof(header),
 		 "speed-select-turbo-freq-clip-frequencies");
 	format_and_print(outf, base_level + 1, header, NULL);
-	snprintf(header, sizeof(header), "low-priority-max-frequency(KHz)");
+	snprintf(header, sizeof(header), "low-priority-max-frequency(MHz)");
 	snprintf(value, sizeof(value), "%d",
 		 fact_info->lp_clipping_ratio_license_sse *
 			 DISP_FREQ_MULTIPLIER);
 	format_and_print(outf, base_level + 2, header, value);
 	snprintf(header, sizeof(header),
-		 "low-priority-max-avx2-frequency(KHz)");
+		 "low-priority-max-avx2-frequency(MHz)");
 	snprintf(value, sizeof(value), "%d",
 		 fact_info->lp_clipping_ratio_license_avx2 *
 			 DISP_FREQ_MULTIPLIER);
 	format_and_print(outf, base_level + 2, header, value);
 	snprintf(header, sizeof(header),
-		 "low-priority-max-avx512-frequency(KHz)");
+		 "low-priority-max-avx512-frequency(MHz)");
 	snprintf(value, sizeof(value), "%d",
 		 fact_info->lp_clipping_ratio_license_avx512 *
 			 DISP_FREQ_MULTIPLIER);
@@ -291,7 +291,7 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 		snprintf(value, sizeof(value), "%d", ctdp_level->tdp_ratio);
 		format_and_print(outf, base_level + 4, header, value);
 
-		snprintf(header, sizeof(header), "base-frequency(KHz)");
+		snprintf(header, sizeof(header), "base-frequency(MHz)");
 		snprintf(value, sizeof(value), "%d",
 			 ctdp_level->tdp_ratio * DISP_FREQ_MULTIPLIER);
 		format_and_print(outf, base_level + 4, header, value);
-- 
2.21.0
