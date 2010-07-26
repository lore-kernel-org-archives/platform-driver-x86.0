From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 09/11] intel_scu_ipc: fix data packing of PMIC command on
	Moorestown
Date: Mon, 26 Jul 2010 10:05:52 +0100
Message-ID: <20100726090510.12329.78250.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:40533 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753321Ab0GZJjE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:39:04 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Hong Liu <hong.liu@intel.com>

Data is 2-byte per entry for PMIC read-modify-update command.

Signed-off-by: Hong Liu <hong.liu@intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 5055c52..84a2d4b 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -154,7 +154,7 @@ static inline int busy_loop(void) /* Wait till scu status is busy */
 /* Read/Write power control(PMIC in Langwell, MSIC in PenWell) registers */
 static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 {
-	int i, nc, bytes;
+	int i, nc, bytes, d;
 	u32 offset = 0;
 	u32 err = 0;
 	u8 cbuf[IPC_WWBUF_SIZE] = { };
@@ -171,15 +171,16 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 
 	if (platform != MRST_CPU_CHIP_PENWELL) {
 		bytes = 0;
-		for(i=0; i<count; i++) {
+		d = 0;
+		for (i = 0; i < count; i++) {
 			cbuf[bytes++] = addr[i];
 			cbuf[bytes++] = addr[i] >> 8;
 			if (id != IPC_CMD_PCNTRL_R)
-				cbuf[bytes++] = data[i];
+				cbuf[bytes++] = data[d++];
 			if (id == IPC_CMD_PCNTRL_M)
-				cbuf[bytes++] = data[i + 1];
+				cbuf[bytes++] = data[d++];
 		}
-		for(i=0; i<bytes; i+=4)
+		for (i = 0; i < bytes; i += 4)
 			ipc_data_writel(wbuf[i/4], i);
 		ipc_command(bytes << 16 |  id << 12 | 0 << 8 | op);
 	} else {
