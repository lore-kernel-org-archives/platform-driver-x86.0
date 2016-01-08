From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH] intel_punit_ipc: add NULL check for input parameters
Date: Fri,  8 Jan 2016 18:32:27 +0800
Message-ID: <1452249147-34712-1-git-send-email-qipeng.zha@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:63057 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753946AbcAHC1p (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jan 2016 21:27:45 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, souvik.k.chakravarty@intel.com

intel_punit_ipc_command() maybe called when in or out
data pointers are NULL.

Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
---
 drivers/platform/x86/intel_punit_ipc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
index 16685bc..bd87540 100644
--- a/drivers/platform/x86/intel_punit_ipc.c
+++ b/drivers/platform/x86/intel_punit_ipc.c
@@ -187,10 +187,12 @@ int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2, u32 *in, u32 *out)
 
 	reinit_completion(&ipcdev->cmd_complete);
 	type = (cmd & IPC_PUNIT_CMD_TYPE_MASK) >> IPC_TYPE_OFFSET;
-	ipc_write_data_low(ipcdev, type, *in);
 
-	if (type == GTDRIVER_IPC || type == ISPDRIVER_IPC)
-		ipc_write_data_high(ipcdev, type, *++in);
+	if (in) {
+		ipc_write_data_low(ipcdev, type, *in);
+		if (type == GTDRIVER_IPC || type == ISPDRIVER_IPC)
+			ipc_write_data_high(ipcdev, type, *++in);
+	}
 
 	val = cmd & ~IPC_PUNIT_CMD_TYPE_MASK;
 	val |= CMD_RUN | para2 << CMD_PARA2_SHIFT | para1 << CMD_PARA1_SHIFT;
@@ -199,10 +201,12 @@ int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2, u32 *in, u32 *out)
 	ret = intel_punit_ipc_check_status(ipcdev, type);
 	if (ret)
 		goto out;
-	*out = ipc_read_data_low(ipcdev, type);
 
-	if (type == GTDRIVER_IPC || type == ISPDRIVER_IPC)
-		*++out = ipc_read_data_high(ipcdev, type);
+	if (out) {
+		*out = ipc_read_data_low(ipcdev, type);
+		if (type == GTDRIVER_IPC || type == ISPDRIVER_IPC)
+			*++out = ipc_read_data_high(ipcdev, type);
+	}
 
 out:
 	mutex_unlock(&ipcdev->lock);
-- 
1.8.3.2
