From: Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH] tools/power/x86/intel-speed-select: Fix a typo in error message
Date: Mon,  9 Mar 2020 17:54:44 +0900
Message-ID: <20200309085444.53499-1-standby24x7@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, srinivas.pandruvada@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: Masanari Iida <standby24x7@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch fix a spelling typo in error message.

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 2b2b8167c65b..f323dc9b770f 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -656,7 +656,7 @@ int isst_send_msr_command(unsigned int cpu, unsigned int msr, int write,
 		msr_cmds.msr_cmd[0].data = *req_resp;
 
 	if (ioctl(fd, ISST_IF_MSR_COMMAND, &msr_cmds) == -1) {
-		perror("ISST_IF_MSR_COMMAD");
+		perror("ISST_IF_MSR_COMMAND");
 		fprintf(outf, "Error: msr_cmd cpu:%d msr:%x read_write:%d\n",
 			cpu, msr, write);
 	} else {
-- 
2.26.0.rc0
