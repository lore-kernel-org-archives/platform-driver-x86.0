From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 19/27] tools/power/x86/intel-speed-select: Kernel interface error handling
Date: Thu,  5 Mar 2020 14:45:30 -0800
Message-ID: <20200305224538.490864-20-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Treat a case when mailbox/mmio command can't be handled by the kernel
drivers when the module is removed or send a command which no driver can
handle. In this case ENOTTY result is returned, so print error.

Also when the isst_if_mmio module is removed, we can't send CLOS message
messages via Mailbox on non SKX based platforms. When this module is
removed,  isst_platform_info.mmio_supported is set to 0. So it can't be
used as a condition to send via mailbox. Here replace check for Skylake
based platform to send via mailbox, other platforms can't use mailbox in
lieu of MMIO.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel-speed-select/isst-config.c      | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 48915470c572..2ab902c18bcc 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -95,6 +95,14 @@ int is_clx_n_platform(void)
 	return 0;
 }
 
+int is_skx_based_platform(void)
+{
+	if (cpu_model == 0x55)
+		return 1;
+
+	return 0;
+}
+
 static int update_cpu_model(void)
 {
 	unsigned int ebx, ecx, edx;
@@ -695,7 +703,11 @@ static int isst_send_mmio_command(unsigned int cpu, unsigned int reg, int write,
 	}
 
 	if (ioctl(fd, cmd, &io_regs) == -1) {
-		perror("ISST_IF_IO_CMD");
+		if (errno == ENOTTY) {
+			perror("ISST_IF_IO_COMMAND\n");
+			fprintf(stderr, "Check presence of kernel modules: isst_if_mmio\n");
+			exit(0);
+		}
 		fprintf(outf, "Error: mmio_cmd cpu:%d reg:%x read_write:%x\n",
 			cpu, reg, write);
 	} else {
@@ -724,7 +736,7 @@ int isst_send_mbox_command(unsigned int cpu, unsigned char command,
 		"mbox_send: cpu:%d command:%x sub_command:%x parameter:%x req_data:%x\n",
 		cpu, command, sub_command, parameter, req_data);
 
-	if (isst_platform_info.mmio_supported && command == CONFIG_CLOS &&
+	if (!is_skx_based_platform() && command == CONFIG_CLOS &&
 	    sub_command != CLOS_PM_QOS_CONFIG) {
 		unsigned int value;
 		int write = 0;
@@ -774,10 +786,14 @@ int isst_send_mbox_command(unsigned int cpu, unsigned char command,
 		err(-1, "%s open failed", pathname);
 
 	if (ioctl(fd, ISST_IF_MBOX_COMMAND, &mbox_cmds) == -1) {
-		perror("ISST_IF_MBOX_COMMAND");
-		fprintf(outf,
-			"Error: mbox_cmd cpu:%d command:%x sub_command:%x parameter:%x req_data:%x\n",
-			cpu, command, sub_command, parameter, req_data);
+		if (errno == ENOTTY) {
+			perror("ISST_IF_MBOX_COMMAND\n");
+			fprintf(stderr, "Check presence of kernel modules: isst_if_mbox_pci or isst_if_mbox_msr\n");
+			exit(0);
+		}
+		debug_printf(
+			"Error: mbox_cmd cpu:%d command:%x sub_command:%x parameter:%x req_data:%x errorno:%d\n",
+			cpu, command, sub_command, parameter, req_data, errno);
 		return -1;
 	} else {
 		*resp = mbox_cmds.mbox_cmd[0].resp_data;
-- 
2.24.1
