From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH 5/7] intel-speed-select: Implement CascadeLake-N help and command functions structures
Date: Thu, 26 Sep 2019 08:54:59 -0400
Message-ID: <20190926125501.1616-6-prarit@redhat.com>
References: <20190926125501.1616-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926125501.1616-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

CascadeLake-N only supports SST-BF and needs some of the perf-profile
commands, and the base-freq commands.

Add help functions, and create an empty command structures (the functions
will be implemented later in this patchset).  Call these functions
when running on CascadeLake-N.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel-speed-select/isst-config.c      | 37 ++++++++++++++-----
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 33f328d971d3..a82005825990 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1373,6 +1373,10 @@ static void get_clos_assoc(int arg)
 	isst_ctdp_display_information_end(outf);
 }
 
+static struct process_cmd_struct cn_cmds[] = {
+	{ NULL, NULL, NULL, 0 }
+};
+
 static struct process_cmd_struct isst_cmds[] = {
 	{ "perf-profile", "get-lock-status", get_tdp_locked, 0 },
 	{ "perf-profile", "get-config-levels", get_tdp_levels, 0 },
@@ -1557,12 +1561,15 @@ static void isst_help(void)
 		TDP, etc.\n");
 	printf("\nCommands : For feature=perf-profile\n");
 	printf("\tinfo\n");
-	printf("\tget-lock-status\n");
-	printf("\tget-config-levels\n");
-	printf("\tget-config-version\n");
-	printf("\tget-config-enabled\n");
-	printf("\tget-config-current-level\n");
-	printf("\tset-config-level\n");
+
+	if (cpu_model != 0x55) {
+		printf("\tget-lock-status\n");
+		printf("\tget-config-levels\n");
+		printf("\tget-config-version\n");
+		printf("\tget-config-enabled\n");
+		printf("\tget-config-current-level\n");
+		printf("\tset-config-level\n");
+	}
 }
 
 static void pbf_help(void)
@@ -1612,6 +1619,12 @@ static struct process_cmd_help_struct isst_help_cmds[] = {
 	{ NULL, NULL }
 };
 
+static struct process_cmd_help_struct cn_help_cmds[] = {
+	{ "perf-profile", isst_help },
+	{ "base-freq", pbf_help },
+	{ NULL, NULL }
+};
+
 void process_command(int argc, char **argv,
 		     struct process_cmd_help_struct *help_cmds,
 		     struct process_cmd_struct *cmds)
@@ -1768,11 +1781,15 @@ static void cmdline(int argc, char **argv)
 	set_max_cpu_num();
 	set_cpu_present_cpu_mask();
 	set_cpu_target_cpu_mask();
-	ret = isst_fill_platform_info();
-	if (ret)
-		goto out;
 
-	process_command(argc, argv, isst_help_cmds, isst_cmds);
+	if (cpu_model != 0x55) {
+		ret = isst_fill_platform_info();
+		if (ret)
+			goto out;
+		process_command(argc, argv, isst_help_cmds, isst_cmds);
+	} else {
+		process_command(argc, argv, cn_help_cmds, cn_cmds);
+	}
 out:
 	free_cpu_set(present_cpumask);
 	free_cpu_set(target_cpumask);
-- 
2.21.0
