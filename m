From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 2/2] tools/power/x86/intel-speed-select: Avoid duplicate names for json parsing
Date: Thu, 30 Jan 2020 21:45:18 -0800
Message-ID: <20200131054518.1644519-2-srinivas.pandruvada@linux.intel.com>
References: <20200131054518.1644519-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200131054518.1644519-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

For the command
"intel-speed-select perf-profile info":

There are two instances of “speed-select-turbo-freq” underneath
“perf-profile-level-0” for each package. When we load the output into
python with json.load(), the second instance overwrites the first.

Result is that we can only access:
"speed-select-turbo-freq": {
            "bucket-0": {
              "high-priority-cores-count": "2",
              "high-priority-max-frequency(MHz)": "3000",
              "high-priority-max-avx2-frequency(MHz)": "2800",
              "high-priority-max-avx512-frequency(MHz)": "2600"
            },
Because it is a duplicate of "speed-select-turbo-freq": "disabled"
Same is true for "speed-select-base-freq".

To avoid this add "-properties" suffix for the second instance to
differentiate.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index 4fb0c1d49d64..3d70be2a9f61 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -178,7 +178,7 @@ static void _isst_pbf_display_information(int cpu, FILE *outf, int level,
 	char header[256];
 	char value[256];
 
-	snprintf(header, sizeof(header), "speed-select-base-freq");
+	snprintf(header, sizeof(header), "speed-select-base-freq-properties");
 	format_and_print(outf, disp_level, header, NULL);
 
 	snprintf(header, sizeof(header), "high-priority-base-frequency(MHz)");
@@ -224,7 +224,7 @@ static void _isst_fact_display_information(int cpu, FILE *outf, int level,
 	char value[256];
 	int j;
 
-	snprintf(header, sizeof(header), "speed-select-turbo-freq");
+	snprintf(header, sizeof(header), "speed-select-turbo-freq-properties");
 	format_and_print(outf, base_level, header, NULL);
 	for (j = 0; j < ISST_FACT_MAX_BUCKETS; ++j) {
 		if (fact_bucket != 0xff && fact_bucket != j)
-- 
2.24.1
