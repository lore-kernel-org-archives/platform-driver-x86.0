From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 08/11] Clean up command packing on MRST.
Date: Mon, 26 Jul 2010 10:05:03 +0100
Message-ID: <20100726090444.12329.24098.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:31829 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753835Ab0GZJiO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:38:14 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Andy Ross <andy.ross@windriver.com>

Don't pass more bytes in the command length field than we filled.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |   29 +++++++++++------------------
 1 files changed, 11 insertions(+), 18 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index b903420..5055c52 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -154,7 +154,7 @@ static inline int busy_loop(void) /* Wait till scu status is busy */
 /* Read/Write power control(PMIC in Langwell, MSIC in PenWell) registers */
 static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 {
-	int nc;
+	int i, nc, bytes;
 	u32 offset = 0;
 	u32 err = 0;
 	u8 cbuf[IPC_WWBUF_SIZE] = { };
@@ -170,25 +170,18 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 	}
 
 	if (platform != MRST_CPU_CHIP_PENWELL) {
-		/* Entry is 4 bytes for read/write, 5 bytes for read modify */
-		for (nc = 0; nc < count; nc++, offset += 3) {
-			cbuf[offset] = addr[nc];
-			cbuf[offset + 1] = addr[nc] >> 8;
+		bytes = 0;
+		for(i=0; i<count; i++) {
+			cbuf[bytes++] = addr[i];
+			cbuf[bytes++] = addr[i] >> 8;
 			if (id != IPC_CMD_PCNTRL_R)
-				cbuf[offset + 2] = data[nc];
-			if (id == IPC_CMD_PCNTRL_M) {
-				cbuf[offset + 3] = data[nc + 1];
-				offset += 1;
-			}
+				cbuf[bytes++] = data[i];
+			if (id == IPC_CMD_PCNTRL_M)
+				cbuf[bytes++] = data[i + 1];
 		}
-		for (nc = 0, offset = 0; nc < count; nc++, offset += 4)
-			ipc_data_writel(wbuf[nc], offset); /* Write wbuff */
-
-		if (id != IPC_CMD_PCNTRL_M)
-			ipc_command((count*4) << 16 |  id << 12 | 0 << 8 | op);
-		else
-			ipc_command((count*5) << 16 |  id << 12 | 0 << 8 | op);
-
+		for(i=0; i<bytes; i+=4)
+			ipc_data_writel(wbuf[i/4], i);
+		ipc_command(bytes << 16 |  id << 12 | 0 << 8 | op);
 	} else {
 		for (nc = 0; nc < count; nc++, offset += 2) {
 			cbuf[offset] = addr[nc];
