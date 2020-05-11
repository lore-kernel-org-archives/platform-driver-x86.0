From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH] intel-speed-select: Fix json perf-profile output output
Date: Mon, 11 May 2020 15:06:28 -0400
Message-ID: <20200511190628.25661-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The 'intel-speed-select -f json perf-profile get-lock-status' command
outputs the package, die, and cpu data as separate fields.

ex)

  "package-0": {
    "die-0": {
      "cpu-0": {

Commit 74062363f855 ("tools/power/x86/intel-speed-select: Avoid duplicate Package strings for json") prettied this output so that it is a single line for
some json output commands and the same should be done for other commands.

Output package, die, and cpu info in a single line when using json output.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 .../x86/intel-speed-select/isst-display.c     | 26 +++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index f6e2ce181123..e105fece47b6 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -316,21 +316,31 @@ void isst_ctdp_display_core_info(int cpu, FILE *outf, char *prefix,
 {
 	char header[256];
 	char value[256];
+	int level = 1;
+
+	if (out_format_is_json()) {
+		snprintf(header, sizeof(header), "package-%d:die-%d:cpu-%d",
+			 get_physical_package_id(cpu), get_physical_die_id(cpu),
+			 cpu);
+		format_and_print(outf, level++, header, NULL);
+	} else {
+		snprintf(header, sizeof(header), "package-%d",
+			 get_physical_package_id(cpu));
+		format_and_print(outf, level++, header, NULL);
+		snprintf(header, sizeof(header), "die-%d",
+			 get_physical_die_id(cpu));
+		format_and_print(outf, level++, header, NULL);
+		snprintf(header, sizeof(header), "cpu-%d", cpu);
+		format_and_print(outf, level++, header, NULL);
+	}
 
-	snprintf(header, sizeof(header), "package-%d",
-		 get_physical_package_id(cpu));
-	format_and_print(outf, 1, header, NULL);
-	snprintf(header, sizeof(header), "die-%d", get_physical_die_id(cpu));
-	format_and_print(outf, 2, header, NULL);
-	snprintf(header, sizeof(header), "cpu-%d", cpu);
-	format_and_print(outf, 3, header, NULL);
 	if (str0 && !val)
 		snprintf(value, sizeof(value), "%s", str0);
 	else if (str1 && val)
 		snprintf(value, sizeof(value), "%s", str1);
 	else
 		snprintf(value, sizeof(value), "%u", val);
-	format_and_print(outf, 4, prefix, value);
+	format_and_print(outf, level, prefix, value);
 
 	format_and_print(outf, 1, NULL, NULL);
 }
-- 
2.18.4
