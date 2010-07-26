From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 05/11] intel_scu_ipc: Use the new cpu identification function
Date: Mon, 26 Jul 2010 10:03:58 +0100
Message-ID: <20100726090337.12329.6969.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:39866 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753835Ab0GZJhI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:37:08 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

This provides an architecture level board identify function to replace the
cpuid direct usage

Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |   17 +++++------------
 1 files changed, 5 insertions(+), 12 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 2245876..5258749 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -74,8 +74,6 @@ struct intel_scu_ipc_dev {
 
 static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
 
-#define PLATFORM_LANGWELL 1
-#define PLATFORM_PENWELL 2
 static int platform;		/* Platform type */
 
 /*
@@ -169,7 +167,7 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 		return -ENODEV;
 	}
 
-	if (platform == PLATFORM_LANGWELL) {
+	if (platform != MRST_CPU_CHIP_PENWELL) {
 		/* Entry is 4 bytes for read/write, 5 bytes for read modify */
 		for (nc = 0; nc < count; nc++, offset += 3) {
 			cbuf[offset] = addr[nc];
@@ -217,7 +215,7 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 	if (id == IPC_CMD_PCNTRL_R) { /* Read rbuf */
 		/* Workaround: values are read as 0 without memcpy_fromio */
 		memcpy_fromio(cbuf, ipcdev.ipc_base + 0x90, 16);
-		if (platform == PLATFORM_LANGWELL) {
+		if (platform != MRST_CPU_CHIP_PENWELL) {
 			for (nc = 0, offset = 2; nc < count; nc++, offset += 3)
 				data[nc] = ipc_data_readb(offset);
 		} else {
@@ -741,14 +739,9 @@ static struct pci_driver ipc_driver = {
 
 static int __init intel_scu_ipc_init(void)
 {
-	if (boot_cpu_data.x86 == 6 &&
-		boot_cpu_data.x86_model == 0x27 &&
-		boot_cpu_data.x86_mask == 1)
-			platform = PLATFORM_PENWELL;
-	else if (boot_cpu_data.x86 == 6 &&
-		boot_cpu_data.x86_model == 0x26)
-			platform = PLATFORM_LANGWELL;
-
+	platform = mrst_identify_cpu();
+	if (platform == 0)
+		return -ENODEV;
 	return  pci_register_driver(&ipc_driver);
 }
 
