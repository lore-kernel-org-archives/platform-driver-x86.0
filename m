From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH v2 7/7] intel-speed-select: Implement base-freq commands on CascadeLake-N
Date: Thu,  3 Oct 2019 08:11:12 -0400
Message-ID: <20191003121112.25870-8-prarit@redhat.com>
References: <20191003121112.25870-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003121112.25870-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, srinivas.pandruvada@linux.intel.com, Prarit Bhargava <prarit@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

Add functionality for base-freq info|enable|disable info on CascadeLake-N.

The enable command always returns success, and the disable command always
returns failed because SST-BF cannot be enabled or disabled from the OS on
CascadeLake-N.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
---
 .../x86/intel-speed-select/isst-config.c      | 68 +++++++++++++------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index d9b580139a07..7c7f0551eda1 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -836,7 +836,7 @@ static void clx_n_config(void)
 	ctdp_level->fact_enabled = 0;
 }
 
-static void dump_cn_config_for_cpu(int cpu, void *arg1, void *arg2,
+static void dump_clx_n_config_for_cpu(int cpu, void *arg1, void *arg2,
 				   void *arg3, void *arg4)
 {
 	isst_ctdp_display_information(cpu, outf, tdp_level, &clx_n_pkg_dev);
@@ -876,7 +876,7 @@ static void dump_isst_config(int arg)
 	if (!is_clx_n_platform())
 		fn = dump_isst_config_for_cpu;
 	else
-		fn = dump_cn_config_for_cpu;
+		fn = dump_clx_n_config_for_cpu;
 
 	isst_ctdp_display_information_start(outf);
 
@@ -951,6 +951,18 @@ static void set_tdp_level(int arg)
 	isst_ctdp_display_information_end(outf);
 }
 
+static void clx_n_dump_pbf_config_for_cpu(int cpu, void *arg1, void *arg2,
+				       void *arg3, void *arg4)
+{
+	struct isst_pbf_info *pbf_info;
+	struct isst_pkg_ctdp_level_info *ctdp_level;
+
+	ctdp_level = &clx_n_pkg_dev.ctdp_level[0];
+	pbf_info = &ctdp_level->pbf_info;
+
+	isst_pbf_display_information(cpu, outf, tdp_level, pbf_info);
+}
+
 static void dump_pbf_config_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 				    void *arg4)
 {
@@ -968,6 +980,8 @@ static void dump_pbf_config_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 
 static void dump_pbf_config(int arg)
 {
+	void *fn;
+
 	if (cmd_help) {
 		fprintf(stderr,
 			"Print Intel(R) Speed Select Technology base frequency configuration for a TDP level\n");
@@ -981,13 +995,18 @@ static void dump_pbf_config(int arg)
 		exit(1);
 	}
 
+	if (!is_clx_n_platform())
+		fn = dump_pbf_config_for_cpu;
+	else
+		fn = clx_n_dump_pbf_config_for_cpu;
+
 	isst_ctdp_display_information_start(outf);
+
 	if (max_target_cpus)
-		for_each_online_target_cpu_in_set(dump_pbf_config_for_cpu, NULL,
-						  NULL, NULL, NULL);
+		for_each_online_target_cpu_in_set(fn, NULL, NULL, NULL, NULL);
 	else
-		for_each_online_package_in_set(dump_pbf_config_for_cpu, NULL,
-					       NULL, NULL, NULL);
+		for_each_online_package_in_set(fn, NULL, NULL, NULL, NULL);
+
 	isst_ctdp_display_information_end(outf);
 }
 
@@ -1165,21 +1184,27 @@ static void set_pbf_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 	int ret;
 	int status = *(int *)arg4;
 
-	ret = isst_set_pbf_fact_status(cpu, 1, status);
-	if (ret) {
-		perror("isst_set_pbf");
-	} else {
-		if (status) {
-			if (auto_mode)
-				ret = set_pbf_core_power(cpu);
-			isst_display_result(cpu, outf, "base-freq", "enable",
-					    ret);
-		} else {
-			if (auto_mode)
-				isst_pm_qos_config(cpu, 0, 0);
-			isst_display_result(cpu, outf, "base-freq", "disable",
-					    ret);
+	if (!is_clx_n_platform()) {
+		ret = isst_set_pbf_fact_status(cpu, 1, status);
+		if (ret) {
+			perror("isst_set_pbf");
+			return;
 		}
+	} else {
+		if (status == 0)
+			ret = -1;
+		else
+			ret = 0;
+	}
+
+	if (status) {
+		if (auto_mode)
+			ret = set_pbf_core_power(cpu);
+		isst_display_result(cpu, outf, "base-freq", "enable", ret);
+	} else {
+		if (auto_mode)
+			isst_pm_qos_config(cpu, 0, 0);
+		isst_display_result(cpu, outf, "base-freq", "disable", ret);
 	}
 }
 
@@ -1645,6 +1670,9 @@ static void get_clos_assoc(int arg)
 
 static struct process_cmd_struct clx_n_cmds[] = {
 	{ "perf-profile", "info", dump_isst_config, 0 },
+	{ "base-freq", "info", dump_pbf_config, 0 },
+	{ "base-freq", "enable", set_pbf_enable, 1 },
+	{ "base-freq", "disable", set_pbf_enable, 0 },
 	{ NULL, NULL, NULL, 0 }
 };
 
-- 
2.18.1
