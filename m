From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 02/11] intel_scu_ipc: Support Medfield processors
Date: Mon, 26 Jul 2010 10:02:46 +0100
Message-ID: <20100726090232.12329.8770.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:42878 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753835Ab0GZJf6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:35:58 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Sreedhara DS <sreedhara.ds@intel.com>

Changes to work on bothMmoorestown and Medfield
New pci id added for Medfield
Return type of ipc_data_readl chnaged from u8 to u32

Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |   53 +++++++++++++++++++++-------------
 1 files changed, 33 insertions(+), 20 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index b6a0344..a0dc41e 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -151,7 +151,7 @@ static inline u8 ipc_data_readb(u32 offset) /* Read ipc byte data */
 	return readb(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
 }
 
-static inline u8 ipc_data_readl(u32 offset) /* Read ipc u32 data */
+static inline u32 ipc_data_readl(u32 offset) /* Read ipc u32 data */
 {
 	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
 }
@@ -181,18 +181,19 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 	int nc;
 	u32 offset = 0;
 	u32 err = 0;
-	u8 cbuf[IPC_WWBUF_SIZE] = { '\0' };
+	u8 cbuf[IPC_WWBUF_SIZE] = { };
 	u32 *wbuf = (u32 *)&cbuf;
 
 	mutex_lock(&ipclock);
+
 	if (ipcdev.pdev == NULL) {
 		mutex_unlock(&ipclock);
 		return -ENODEV;
 	}
 
-	if (platform == 1) {
+	if (platform == PLATFORM_LANGWELL) {
 		/* Entry is 4 bytes for read/write, 5 bytes for read modify */
-		for (nc = 0; nc < count; nc++) {
+		for (nc = 0; nc < count; nc++, offset += 3) {
 			cbuf[offset] = addr[nc];
 			cbuf[offset + 1] = addr[nc] >> 8;
 			if (id != IPC_CMD_PCNTRL_R)
@@ -201,33 +202,44 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 				cbuf[offset + 3] = data[nc + 1];
 				offset += 1;
 			}
-			offset += 3;
 		}
 		for (nc = 0, offset = 0; nc < count; nc++, offset += 4)
 			ipc_data_writel(wbuf[nc], offset); /* Write wbuff */
 
+		if (id != IPC_CMD_PCNTRL_M)
+			ipc_command((count*4) << 16 |  id << 12 | 0 << 8 | op);
+		else
+			ipc_command((count*5) << 16 |  id << 12 | 0 << 8 | op);
+
 	} else {
-		for (nc = 0, offset = 0; nc < count; nc++, offset += 2)
-			ipc_data_writel(addr[nc], offset); /* Write addresses */
-		if (id != IPC_CMD_PCNTRL_R) {
-			for (nc = 0; nc < count; nc++, offset++)
-				ipc_data_writel(data[nc], offset); /* Write data */
-			if (id == IPC_CMD_PCNTRL_M)
-				ipc_data_writel(data[nc + 1], offset); /* Mask value*/
+		for (nc = 0; nc < count; nc++, offset += 2) {
+			cbuf[offset] = addr[nc];
+			cbuf[offset + 1] = addr[nc] >> 8;
 		}
-	}
 
-	if (id != IPC_CMD_PCNTRL_M)
-		ipc_command((count * 3) << 16 |  id << 12 | 0 << 8 | op);
-	else
-		ipc_command((count * 4) << 16 |  id << 12 | 0 << 8 | op);
+		if (id == IPC_CMD_PCNTRL_R) {
+			for (nc = 0, offset = 0; nc < count; nc++, offset += 4)
+				ipc_data_writel(wbuf[nc], offset);
+			ipc_command((count*2) << 16 |  id << 12 | 0 << 8 | op);
+		} else if (id == IPC_CMD_PCNTRL_W) {
+			for (nc = 0; nc < count; nc++, offset += 1)
+				cbuf[offset] = data[nc];
+			for (nc = 0, offset = 0; nc < count; nc++, offset += 4)
+				ipc_data_writel(wbuf[nc], offset);
+			ipc_command((count*3) << 16 |  id << 12 | 0 << 8 | op);
+		} else if (id == IPC_CMD_PCNTRL_M) {
+			cbuf[offset] = data[0];
+			cbuf[offset + 1] = data[1];
+			ipc_data_writel(wbuf[0], 0); /* Write wbuff */
+			ipc_command(4 << 16 |  id << 12 | 0 << 8 | op);
+		}
+	}
 
 	err = busy_loop();
-
 	if (id == IPC_CMD_PCNTRL_R) { /* Read rbuf */
 		/* Workaround: values are read as 0 without memcpy_fromio */
-		memcpy_fromio(cbuf, ipcdev.ipc_base + IPC_READ_BUFFER, 16);
-		if (platform == 1) {
+		memcpy_fromio(cbuf, ipcdev.ipc_base + 0x90, 16);
+		if (platform == PLATFORM_LANGWELL) {
 			for (nc = 0, offset = 2; nc < count; nc++, offset += 3)
 				data[nc] = ipc_data_readb(offset);
 		} else {
@@ -800,6 +812,7 @@ static void ipc_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id pci_ids[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x080e)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x082a)},
 	{ 0,}
 };
 MODULE_DEVICE_TABLE(pci, pci_ids);
