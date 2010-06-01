From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH] intel_scu_ipc: add definitions for vRTC related command
Date: Tue, 01 Jun 2010 13:07:34 +0100
Message-ID: <20100601120729.25165.82881.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:57501 "EHLO
	bob.linux.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756102Ab0FAMxy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 Jun 2010 08:53:54 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org

From: Feng Tang <feng.tang@intel.com>

Signed-off-by: Feng Tang <feng.tang@intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 arch/x86/include/asm/intel_scu_ipc.h |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)


diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/intel_scu_ipc.h
index 4470c9a..0320045 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -1,6 +1,12 @@
 #ifndef _ASM_X86_INTEL_SCU_IPC_H_
 #define  _ASM_X86_INTEL_SCU_IPC_H_
 
+#define IPCMSG_VRTC	0xFA	 /* Set vRTC device */
+
+/* Command id associated with message IPCMSG_VRTC */
+#define IPC_CMD_VRTC_SETTIME      1 /* Set time */
+#define IPC_CMD_VRTC_SETALARM     2 /* Set alarm */
+
 /* Read single register */
 int intel_scu_ipc_ioread8(u16 addr, u8 *data);
 

