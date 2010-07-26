From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 03/11] Remove indirect read write api support.
Date: Mon, 26 Jul 2010 10:03:10 +0100
Message-ID: <20100726090253.12329.11593.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:20964 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753835Ab0GZJgV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:36:21 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Sreedhara DS <sreedhara.ds@intel.com>

The firmware of production devices does not support this interface so this
is dead code.

Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 arch/x86/include/asm/intel_scu_ipc.h |   14 ------
 drivers/platform/x86/intel_scu_ipc.c |   82 ----------------------------------
 2 files changed, 0 insertions(+), 96 deletions(-)


diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/intel_scu_ipc.h
index 0320045..29f6679 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -34,20 +34,6 @@ int intel_scu_ipc_writev(u16 *addr, u8 *data, int len);
 /* Update single register based on the mask */
 int intel_scu_ipc_update_register(u16 addr, u8 data, u8 mask);
 
-/*
- * Indirect register read
- * Can be used when SCCB(System Controller Configuration Block) register
- * HRIM(Honor Restricted IPC Messages) is set (bit 23)
- */
-int intel_scu_ipc_register_read(u32 addr, u32 *data);
-
-/*
- * Indirect register write
- * Can be used when SCCB(System Controller Configuration Block) register
- * HRIM(Honor Restricted IPC Messages) is set (bit 23)
- */
-int intel_scu_ipc_register_write(u32 addr, u32 data);
-
 /* Issue commands to the SCU with or without data */
 int intel_scu_ipc_simple_command(int cmd, int sub);
 int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index a0dc41e..fd78386 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -116,24 +116,6 @@ static inline void ipc_data_writel(u32 data, u32 offset) /* Write ipc data */
 }
 
 /*
- * IPC destination Pointer (Write Only):
- * Use content as pointer for destination write
- */
-static inline void ipc_write_dptr(u32 data) /* Write dptr data */
-{
-	writel(data, ipcdev.ipc_base + 0x0C);
-}
-
-/*
- * IPC Source Pointer (Write Only):
- * Use content as pointer for read location
-*/
-static inline void ipc_write_sptr(u32 data) /* Write dptr data */
-{
-	writel(data, ipcdev.ipc_base + 0x08);
-}
-
-/*
  * Status Register (Read Only):
  * Driver will read this register to get the ready/busy status of the IPC
  * block and error status of the IPC command that was just processed by SCU
@@ -414,70 +396,6 @@ int intel_scu_ipc_update_register(u16 addr, u8 bits, u8 mask)
 EXPORT_SYMBOL(intel_scu_ipc_update_register);
 
 /**
- *	intel_scu_ipc_register_read	-	32bit indirect read
- *	@addr: register address
- *	@value: 32bit value return
- *
- *	Performs IA 32 bit indirect read, returns 0 on success, or an
- *	error code.
- *
- *	Can be used when SCCB(System Controller Configuration Block) register
- *	HRIM(Honor Restricted IPC Messages) is set (bit 23)
- *
- *	This function may sleep. Locking for SCU accesses is handled for
- *	the caller.
- */
-int intel_scu_ipc_register_read(u32 addr, u32 *value)
-{
-	u32 err = 0;
-
-	mutex_lock(&ipclock);
-	if (ipcdev.pdev == NULL) {
-		mutex_unlock(&ipclock);
-		return -ENODEV;
-	}
-	ipc_write_sptr(addr);
-	ipc_command(4 << 16 | IPC_CMD_INDIRECT_RD);
-	err = busy_loop();
-	*value = ipc_data_readl(0);
-	mutex_unlock(&ipclock);
-	return err;
-}
-EXPORT_SYMBOL(intel_scu_ipc_register_read);
-
-/**
- *	intel_scu_ipc_register_write	-	32bit indirect write
- *	@addr: register address
- *	@value: 32bit value to write
- *
- *	Performs IA 32 bit indirect write, returns 0 on success, or an
- *	error code.
- *
- *	Can be used when SCCB(System Controller Configuration Block) register
- *	HRIM(Honor Restricted IPC Messages) is set (bit 23)
- *
- *	This function may sleep. Locking for SCU accesses is handled for
- *	the caller.
- */
-int intel_scu_ipc_register_write(u32 addr, u32 value)
-{
-	u32 err = 0;
-
-	mutex_lock(&ipclock);
-	if (ipcdev.pdev == NULL) {
-		mutex_unlock(&ipclock);
-		return -ENODEV;
-	}
-	ipc_write_dptr(addr);
-	ipc_data_writel(value, 0);
-	ipc_command(4 << 16 | IPC_CMD_INDIRECT_WR);
-	err = busy_loop();
-	mutex_unlock(&ipclock);
-	return err;
-}
-EXPORT_SYMBOL(intel_scu_ipc_register_write);
-
-/**
  *	intel_scu_ipc_simple_command	-	send a simple command
  *	@cmd: command
  *	@sub: sub type
