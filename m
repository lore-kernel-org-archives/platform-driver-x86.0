From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 10/27] tools/power/x86/intel-speed-select: Enhance --info option
Date: Thu,  5 Mar 2020 14:45:21 -0800
Message-ID: <20200305224538.490864-11-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Add additional information, which will allow user to detect available
features. This will allow users to check presence of features before
continue to test.
A sample output:

$sudo ./intel-speed-select --info

Intel(R) Speed Select Technology
Executing on CPU model:85[0x55]
Platform: API version : 1
Platform: Driver version : 1
Platform: mbox supported : 1
Platform: mmio supported : 0
Intel(R) SST-PP (feature perf-profile) is not supported
Only performance level 0 (base level) is present
TDP level change control is locked
Intel(R) SST-TF (feature turbo-freq) is supported
Intel(R) SST-BF (feature base-freq) is supported
Intel(R) SST-CP (feature core-power) is supported

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel-speed-select/isst-config.c      | 74 +++++++++++++++++++
 tools/power/x86/intel-speed-select/isst.h     |  2 +
 2 files changed, 76 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 5302a552f87f..65110d06394f 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -846,12 +846,85 @@ static int isst_fill_platform_info(void)
 	return 0;
 }
 
+static void isst_print_extended_platform_info(void)
+{
+	int cp_state, cp_cap, fact_support = 0, pbf_support = 0;
+	struct isst_pkg_ctdp_level_info ctdp_level;
+	struct isst_pkg_ctdp pkg_dev;
+	int ret, i, j;
+	FILE *filep;
+
+	for (i = 0; i < 256; ++i) {
+		char path[256];
+
+		snprintf(path, sizeof(path),
+			 "/sys/devices/system/cpu/cpu%d/topology/thread_siblings", i);
+		filep = fopen(path, "r");
+		if (filep)
+			break;
+	}
+
+	if (!filep)
+		return;
+
+	fclose(filep);
+
+	ret = isst_get_ctdp_levels(i, &pkg_dev);
+	if (ret)
+		return;
+
+	if (pkg_dev.enabled) {
+		fprintf(outf, "Intel(R) SST-PP (feature perf-profile) is supported\n");
+	} else {
+		fprintf(outf, "Intel(R) SST-PP (feature perf-profile) is not supported\n");
+		fprintf(outf, "Only performance level 0 (base level) is present\n");
+	}
+
+	if (pkg_dev.locked)
+		fprintf(outf, "TDP level change control is locked\n");
+	else
+		fprintf(outf, "TDP level change control is unlocked, max level: %d \n", pkg_dev.levels);
+
+	for (j = 0; j <= pkg_dev.levels; ++j) {
+		ret = isst_get_ctdp_control(i, j, &ctdp_level);
+		if (ret)
+			continue;
+
+		if (!fact_support && ctdp_level.fact_support)
+			fact_support = 1;
+
+		if (!pbf_support && ctdp_level.pbf_support)
+			pbf_support = 1;
+	}
+
+	if (fact_support)
+		fprintf(outf, "Intel(R) SST-TF (feature turbo-freq) is supported\n");
+	else
+		fprintf(outf, "Intel(R) SST-TF (feature turbo-freq) is not supported\n");
+
+	if (pbf_support)
+		fprintf(outf, "Intel(R) SST-BF (feature base-freq) is supported\n");
+	else
+		fprintf(outf, "Intel(R) SST-BF (feature base-freq) is not supported\n");
+
+	ret = isst_read_pm_config(i, &cp_state, &cp_cap);
+	if (cp_cap)
+		fprintf(outf, "Intel(R) SST-CP (feature core-power) is supported\n");
+	else
+		fprintf(outf, "Intel(R) SST-CP (feature core-power) is not supported\n");
+}
+
 static void isst_print_platform_information(void)
 {
 	struct isst_if_platform_info platform_info;
 	const char *pathname = "/dev/isst_interface";
 	int fd;
 
+	if (is_clx_n_platform()) {
+		fprintf(stderr, "\nThis option in not supported on this platform\n");
+		exit(0);
+	}
+
 	fd = open(pathname, O_RDWR);
 	if (fd < 0)
 		err(-1, "%s open failed", pathname);
@@ -867,6 +940,7 @@ static void isst_print_platform_information(void)
 			platform_info.mbox_supported);
 		fprintf(outf, "Platform: mmio supported : %d\n",
 			platform_info.mmio_supported);
+		isst_print_extended_platform_info();
 	}
 
 	close(fd);
diff --git a/tools/power/x86/intel-speed-select/isst.h b/tools/power/x86/intel-speed-select/isst.h
index 53e147a9a295..639d3d649480 100644
--- a/tools/power/x86/intel-speed-select/isst.h
+++ b/tools/power/x86/intel-speed-select/isst.h
@@ -196,6 +196,8 @@ extern int isst_send_msr_command(unsigned int cpu, unsigned int command,
 				 int write, unsigned long long *req_resp);
 
 extern int isst_get_ctdp_levels(int cpu, struct isst_pkg_ctdp *pkg_dev);
+extern int isst_get_ctdp_control(int cpu, int config_index,
+				 struct isst_pkg_ctdp_level_info *ctdp_level);
 extern int isst_get_coremask_info(int cpu, int config_index,
 			   struct isst_pkg_ctdp_level_info *ctdp_level);
 extern int isst_get_process_ctdp(int cpu, int tdp_level,
-- 
2.24.1
