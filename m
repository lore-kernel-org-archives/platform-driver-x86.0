From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH v2 6/9] tools/power/x86/intel-speed-select: Change turbo ratio output to maximum turbo frequency
Date: Thu,  5 Sep 2019 08:03:08 -0400
Message-ID: <20190905120311.15286-7-prarit@redhat.com>
References: <20190905120311.15286-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905120311.15286-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: andriy.shevchenko@intel.com, Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The intel-speed-select tool currently outputs the turbo ratio for every
bucket.  Make the output more user-friendly by changing the output to the
maximum turbo frequency.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: David Arcari <darcari@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 .../x86/intel-speed-select/isst-display.c      | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index 4ec1924ff7a9..cfeee0beb78d 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -336,9 +336,11 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 			snprintf(value, sizeof(value), "%d", j);
 			format_and_print(outf, base_level + 6, header, value);
 
-			snprintf(header, sizeof(header), "turbo-ratio");
+			snprintf(header, sizeof(header),
+				"max-turbo-frequency(MHz)");
 			snprintf(value, sizeof(value), "%d",
-				 ctdp_level->trl_sse_active_cores[j]);
+				 ctdp_level->trl_sse_active_cores[j] *
+				  DISP_FREQ_MULTIPLIER);
 			format_and_print(outf, base_level + 6, header, value);
 		}
 		snprintf(header, sizeof(header), "turbo-ratio-limits-avx");
@@ -351,9 +353,11 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 			snprintf(value, sizeof(value), "%d", j);
 			format_and_print(outf, base_level + 6, header, value);
 
-			snprintf(header, sizeof(header), "turbo-ratio");
+			snprintf(header, sizeof(header),
+				"max-turbo-frequency(MHz)");
 			snprintf(value, sizeof(value), "%d",
-				 ctdp_level->trl_avx_active_cores[j]);
+				 ctdp_level->trl_avx_active_cores[j] *
+				  DISP_FREQ_MULTIPLIER);
 			format_and_print(outf, base_level + 6, header, value);
 		}
 
@@ -367,9 +371,11 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 			snprintf(value, sizeof(value), "%d", j);
 			format_and_print(outf, base_level + 6, header, value);
 
-			snprintf(header, sizeof(header), "turbo-ratio");
+			snprintf(header, sizeof(header),
+				"max-turbo-frequency(MHz)");
 			snprintf(value, sizeof(value), "%d",
-				 ctdp_level->trl_avx_512_active_cores[j]);
+				 ctdp_level->trl_avx_512_active_cores[j] *
+				  DISP_FREQ_MULTIPLIER);
 			format_and_print(outf, base_level + 6, header, value);
 		}
 		if (ctdp_level->pbf_support)
-- 
2.21.0
