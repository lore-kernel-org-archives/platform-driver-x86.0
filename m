From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 4/5] tools/power/x86/intel-speed-select: Fix some debug prints
Date: Sat, 14 Sep 2019 12:45:46 -0700
Message-ID: <20190914194547.24271-5-srinivas.pandruvada@linux.intel.com>
References: <20190914194547.24271-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190914194547.24271-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.shevchenko@gmail.com, andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, darcari@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Fix wrong debug print for cpu, which is displayed as CLOS. Also
avoid printing clos id, when user is specify clos as parameter.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index c2892d86be36..889396d676cb 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -508,7 +508,7 @@ int isst_send_mbox_command(unsigned int cpu, unsigned char command,
 		int write = 0;
 		int clos_id, core_id, ret = 0;
 
-		debug_printf("CLOS %d\n", cpu);
+		debug_printf("CPU %d\n", cpu);
 
 		if (parameter & BIT(MBOX_CMD_WRITE_BIT)) {
 			value = req_data;
@@ -1421,7 +1421,6 @@ static void parse_cmd_args(int argc, int start, char **argv)
 		/* CLOS related */
 		case 'c':
 			current_clos = atoi(optarg);
-			printf("clos %d\n", current_clos);
 			break;
 		case 'd':
 			clos_desired = atoi(optarg);
-- 
2.17.2
