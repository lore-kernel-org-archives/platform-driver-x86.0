From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH 7/8] tools/power/x86/intel-speed-select: Output human readable CPU list
Date: Tue,  3 Sep 2019 11:37:33 -0400
Message-ID: <20190903153734.11904-8-prarit@redhat.com>
References: <20190903153734.11904-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903153734.11904-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The intel-speed-select tool currently only outputs a hexidecimal CPU mask,
which requires translation for use with kernel parameters such as
isolcpus.

Along with the CPU mask, output a human readable CPU list.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: David Arcari <darcari@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 .../x86/intel-speed-select/isst-display.c     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index cfeee0beb78d..890a01bfee4b 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -8,6 +8,33 @@
 
 #define DISP_FREQ_MULTIPLIER 100
 
+static void printcpulist(int str_len, char *str, int mask_size,
+			 cpu_set_t *cpu_mask)
+{
+	int i, first, curr_index, index;
+
+	if (!CPU_COUNT_S(mask_size, cpu_mask)) {
+		snprintf(str, str_len, "none");
+		return;
+	}
+
+	curr_index = 0;
+	first = 1;
+	for (i = 0; i < get_topo_max_cpus(); ++i) {
+		if (!CPU_ISSET_S(i, mask_size, cpu_mask))
+			continue;
+		if (!first) {
+			index = snprintf(&str[curr_index],
+					 str_len - curr_index, ",");
+			curr_index += index;
+		}
+		index = snprintf(&str[curr_index], str_len - curr_index, "%d",
+				 i);
+		curr_index += index;
+		first = 0;
+	}
+}
+
 static void printcpumask(int str_len, char *str, int mask_size,
 			 cpu_set_t *cpu_mask)
 {
@@ -166,6 +193,12 @@ static void _isst_pbf_display_information(int cpu, FILE *outf, int level,
 		     pbf_info->core_cpumask);
 	format_and_print(outf, disp_level + 1, header, value);
 
+	snprintf(header, sizeof(header), "high-priority-cpu-list");
+	printcpulist(sizeof(value), value,
+		     pbf_info->core_cpumask_size,
+		     pbf_info->core_cpumask);
+	format_and_print(outf, disp_level + 1, header, value);
+
 	snprintf(header, sizeof(header), "low-priority-base-frequency(MHz)");
 	snprintf(value, sizeof(value), "%d",
 		 pbf_info->p1_low * DISP_FREQ_MULTIPLIER);
@@ -287,6 +320,12 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 			     ctdp_level->core_cpumask);
 		format_and_print(outf, base_level + 4, header, value);
 
+		snprintf(header, sizeof(header), "enable-cpu-list");
+		printcpulist(sizeof(value), value,
+			     ctdp_level->core_cpumask_size,
+			     ctdp_level->core_cpumask);
+		format_and_print(outf, base_level + 4, header, value);
+
 		snprintf(header, sizeof(header), "thermal-design-power-ratio");
 		snprintf(value, sizeof(value), "%d", ctdp_level->tdp_ratio);
 		format_and_print(outf, base_level + 4, header, value);
-- 
2.21.0
