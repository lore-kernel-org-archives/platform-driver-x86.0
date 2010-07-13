From: Alan Cox <alan@linux.intel.com>
Subject: [RESEND PATCH] From: Sreedhara DS <sreedhara.ds@intel.com>
Date: Tue, 13 Jul 2010 10:59:52 +0100
Message-ID: <20100713095944.3399.28528.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:20753 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754174Ab0GMK3n (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Jul 2010 06:29:43 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org

intel_scu_ipc: Resync with development branch

- Add support for Medfield (different message format)
- Use the mrst_platform_id to autodetect the correct type of message
- delete unused interfaces
- fix reversing of command/sub argments in simple_command
- fix a crash if the i2c interface is called before the device is found
- new PCI identifier

Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |  164 ++++++++++------------------------
 1 files changed, 47 insertions(+), 117 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 40658e3..df88b51 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -23,7 +23,8 @@
 #include <linux/pm.h>
 #include <linux/pci.h>
 #include <linux/interrupt.h>
-#include <asm/setup.h>
+#include <linux/sfi.h>
+#include <asm/mrst.h>
 #include <asm/intel_scu_ipc.h>
 
 /* IPC defines the following message types */
@@ -38,10 +39,6 @@
 #define IPC_CMD_PCNTRL_R      1 /* Register read */
 #define IPC_CMD_PCNTRL_M      2 /* Register read-modify-write */
 
-/* Miscelaneous Command ids */
-#define IPC_CMD_INDIRECT_RD   2 /* 32bit indirect read */
-#define IPC_CMD_INDIRECT_WR   5 /* 32bit indirect write */
-
 /*
  * IPC register summary
  *
@@ -78,12 +75,7 @@ struct intel_scu_ipc_dev {
 
 static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
 
-static int platform = 1;
-module_param(platform, int, 0);
-MODULE_PARM_DESC(platform, "1 for moorestown platform");
-
-
-
+static int platform;		/* Platform type */
 
 /*
  * IPC Read Buffer (Read Only):
@@ -119,24 +111,6 @@ static inline void ipc_data_writel(u32 data, u32 offset) /* Write ipc data */
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
@@ -154,7 +128,7 @@ static inline u8 ipc_data_readb(u32 offset) /* Read ipc byte data */
 	return readb(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
 }
 
-static inline u8 ipc_data_readl(u32 offset) /* Read ipc u32 data */
+static inline u32 ipc_data_readl(u32 offset) /* Read ipc u32 data */
 {
 	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
 }
@@ -184,18 +158,19 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
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
+	if (platform != MRST_CPU_CHIP_PENWELL) {
 		/* Entry is 4 bytes for read/write, 5 bytes for read modify */
-		for (nc = 0; nc < count; nc++) {
+		for (nc = 0; nc < count; nc++, offset += 3) {
 			cbuf[offset] = addr[nc];
 			cbuf[offset + 1] = addr[nc] >> 8;
 			if (id != IPC_CMD_PCNTRL_R)
@@ -204,33 +179,44 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
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
+		if (platform != MRST_CPU_CHIP_PENWELL) {
 			for (nc = 0, offset = 2; nc < count; nc++, offset += 3)
 				data[nc] = ipc_data_readb(offset);
 		} else {
@@ -405,70 +391,6 @@ int intel_scu_ipc_update_register(u16 addr, u8 bits, u8 mask)
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
@@ -489,7 +411,7 @@ int intel_scu_ipc_simple_command(int cmd, int sub)
 		mutex_unlock(&ipclock);
 		return -ENODEV;
 	}
-	ipc_command(cmd << 12 | sub);
+	ipc_command(sub << 12 | cmd);
 	err = busy_loop();
 	mutex_unlock(&ipclock);
 	return err;
@@ -501,9 +423,9 @@ EXPORT_SYMBOL(intel_scu_ipc_simple_command);
  *	@cmd: command
  *	@sub: sub type
  *	@in: input data
- *	@inlen: input length
+ *	@inlen: input length in dwords
  *	@out: output data
- *	@outlein: output length
+ *	@outlein: output length in dwords
  *
  *	Issue a command to the SCU which involves data transfers. Do the
  *	data copies under the lock but leave it for the caller to interpret
@@ -524,7 +446,7 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 	for (i = 0; i < inlen; i++)
 		ipc_data_writel(*in++, 4 * i);
 
-	ipc_command((cmd << 12) | sub | (inlen << 18));
+	ipc_command((sub << 12) | cmd | (inlen << 18));
 	err = busy_loop();
 
 	for (i = 0; i < outlen; i++)
@@ -556,6 +478,10 @@ int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data)
 	u32 cmd = 0;
 
 	mutex_lock(&ipclock);
+	if (ipcdev.pdev == NULL) {
+		mutex_unlock(&ipclock);
+		return -ENODEV;
+	}
 	cmd = (addr >> 24) & 0xFF;
 	if (cmd == IPC_I2C_READ) {
 		writel(addr, ipcdev.i2c_base + IPC_I2C_CNTRL_ADDR);
@@ -799,6 +725,7 @@ static void ipc_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id pci_ids[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x080e)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x082a)},
 	{ 0,}
 };
 MODULE_DEVICE_TABLE(pci, pci_ids);
@@ -813,6 +740,9 @@ static struct pci_driver ipc_driver = {
 
 static int __init intel_scu_ipc_init(void)
 {
+	platform = mrst_identify_cpu();
+	if (platform == 0)
+		return -ENODEV;
 	return  pci_register_driver(&ipc_driver);
 }
 
