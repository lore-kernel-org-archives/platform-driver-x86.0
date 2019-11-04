From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 06/10] tools/power/x86/intel-speed-select: Make CLOS frequency in MHz
Date: Mon,  4 Nov 2019 03:02:42 -0800
Message-ID: <20191104110246.70465-7-srinivas.pandruvada@linux.intel.com>
References: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

To be consistant with the other frequency units, change the CLOS
unit to MHz instead of ratios.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c  | 11 +++++++----
 tools/power/x86/intel-speed-select/isst-display.c |  6 +++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 2a3650f025b9..a8ada9a4f020 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1775,9 +1775,9 @@ static void set_clos_config(int arg)
 		fprintf(stderr, "\tSpecify clos EPP with [--epp|-e]\n");
 		fprintf(stderr,
 			"\tSpecify clos Proportional Priority [--weight|-w]\n");
-		fprintf(stderr, "\tSpecify clos min with [--min|-n]\n");
-		fprintf(stderr, "\tSpecify clos max with [--max|-m]\n");
-		fprintf(stderr, "\tSpecify clos desired with [--desired|-d]\n");
+		fprintf(stderr, "\tSpecify clos min in MHz with [--min|-n]\n");
+		fprintf(stderr, "\tSpecify clos max in MHz with [--max|-m]\n");
+		fprintf(stderr, "\tSpecify clos desired in MHz with [--desired|-d]\n");
 		exit(0);
 	}
 
@@ -1799,7 +1799,7 @@ static void set_clos_config(int arg)
 		clos_min = 0;
 	}
 	if (clos_max < 0) {
-		fprintf(stderr, "clos max is not specified, default: 0xff\n");
+		fprintf(stderr, "clos max is not specified, default: 25500 MHz\n");
 		clos_max = 0xff;
 	}
 	if (clos_desired < 0) {
@@ -2049,15 +2049,18 @@ static void parse_cmd_args(int argc, int start, char **argv)
 			break;
 		case 'd':
 			clos_desired = atoi(optarg);
+			clos_desired /= DISP_FREQ_MULTIPLIER;
 			break;
 		case 'e':
 			clos_epp = atoi(optarg);
 			break;
 		case 'n':
 			clos_min = atoi(optarg);
+			clos_min /= DISP_FREQ_MULTIPLIER;
 			break;
 		case 'm':
 			clos_max = atoi(optarg);
+			clos_max /= DISP_FREQ_MULTIPLIER;
 			break;
 		case 'p':
 			clos_priority_type = atoi(optarg);
diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index b7d58f7c5b3e..b8f04347ad3f 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -556,15 +556,15 @@ void isst_clos_display_information(int cpu, FILE *outf, int clos,
 	format_and_print(outf, 5, header, value);
 
 	snprintf(header, sizeof(header), "clos-min");
-	snprintf(value, sizeof(value), "%d", clos_config->clos_min);
+	snprintf(value, sizeof(value), "%d MHz", clos_config->clos_min * DISP_FREQ_MULTIPLIER);
 	format_and_print(outf, 5, header, value);
 
 	snprintf(header, sizeof(header), "clos-max");
-	snprintf(value, sizeof(value), "%d", clos_config->clos_max);
+	snprintf(value, sizeof(value), "%d MHz", clos_config->clos_max * DISP_FREQ_MULTIPLIER);
 	format_and_print(outf, 5, header, value);
 
 	snprintf(header, sizeof(header), "clos-desired");
-	snprintf(value, sizeof(value), "%d", clos_config->clos_desired);
+	snprintf(value, sizeof(value), "%d MHz", clos_config->clos_desired * DISP_FREQ_MULTIPLIER);
 	format_and_print(outf, 5, header, value);
 
 	format_and_print(outf, 1, NULL, NULL);
-- 
2.17.2
