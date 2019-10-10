From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [RESEND][PATCH 06/10] tools/power/x86/intel-speed-select: Make process_command generic
Date: Thu, 10 Oct 2019 13:29:41 -0700
Message-ID: <20191010202945.73616-7-srinivas.pandruvada@linux.intel.com>
References: <20191010202945.73616-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010202945.73616-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: prarit@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Prarit Bhargava <prarit@redhat.com>

Make the process_command take any help command and command list.  This
will make it easier to help commands and a command list for CascadeLake-N.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel-speed-select/isst-config.c      | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 4927aebee306..907b79e16c68 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1816,7 +1816,9 @@ static struct process_cmd_help_struct isst_help_cmds[] = {
 	{ NULL, NULL }
 };
 
-void process_command(int argc, char **argv)
+void process_command(int argc, char **argv,
+		     struct process_cmd_help_struct *help_cmds,
+		     struct process_cmd_struct *cmds)
 {
 	int i = 0, matched = 0;
 	char *feature = argv[optind];
@@ -1827,9 +1829,9 @@ void process_command(int argc, char **argv)
 
 	debug_printf("feature name [%s] command [%s]\n", feature, cmd);
 	if (!strcmp(cmd, "-h") || !strcmp(cmd, "--help")) {
-		while (isst_help_cmds[i].feature) {
-			if (!strcmp(isst_help_cmds[i].feature, feature)) {
-				isst_help_cmds[i].process_fn();
+		while (help_cmds[i].feature) {
+			if (!strcmp(help_cmds[i].feature, feature)) {
+				help_cmds[i].process_fn();
 				exit(0);
 			}
 			++i;
@@ -1839,11 +1841,11 @@ void process_command(int argc, char **argv)
 	create_cpu_map();
 
 	i = 0;
-	while (isst_cmds[i].feature) {
-		if (!strcmp(isst_cmds[i].feature, feature) &&
-		    !strcmp(isst_cmds[i].command, cmd)) {
+	while (cmds[i].feature) {
+		if (!strcmp(cmds[i].feature, feature) &&
+		    !strcmp(cmds[i].command, cmd)) {
 			parse_cmd_args(argc, optind + 1, argv);
-			isst_cmds[i].process_fn(isst_cmds[i].arg);
+			cmds[i].process_fn(cmds[i].arg);
 			matched = 1;
 			break;
 		}
@@ -1964,7 +1966,7 @@ static void cmdline(int argc, char **argv)
 	if (ret)
 		goto out;
 
-	process_command(argc, argv);
+	process_command(argc, argv, isst_help_cmds, isst_cmds);
 out:
 	free_cpu_set(present_cpumask);
 	free_cpu_set(target_cpumask);
-- 
2.17.2
