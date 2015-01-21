From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] intel_scu_ipc: fix indentation in few places
Date: Wed, 21 Jan 2015 21:38:09 +0200
Message-ID: <1421869091-11543-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:22648 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752395AbbAUTiO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Jan 2015 14:38:14 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

While here, do couple of amendments:
 - move platform variable to the function where it's used
 - define intel_scu_ipc_check_status() static

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 66a4d32..8938c31 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -1,7 +1,7 @@
 /*
  * intel_scu_ipc.c: Driver for the Intel SCU IPC mechanism
  *
- * (C) Copyright 2008-2010 Intel Corporation
+ * (C) Copyright 2008-2010,2015 Intel Corporation
  * Author: Sreedhara DS (sreedhara.ds@intel.com)
  *
  * This program is free software; you can redistribute it and/or
@@ -67,7 +67,7 @@
 #define PCI_DEVICE_ID_CLOVERVIEW	0x08ea
 #define PCI_DEVICE_ID_TANGIER		0x11a0
 
-/* intel scu ipc driver data*/
+/* intel scu ipc driver data */
 struct intel_scu_ipc_pdata_t {
 	u32 ipc_base;
 	u32 i2c_base;
@@ -114,8 +114,6 @@ struct intel_scu_ipc_dev {
 
 static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
 
-static int platform;		/* Platform type */
-
 /*
  * IPC Read Buffer (Read Only):
  * 16 byte buffer for receiving data from SCU, if IPC command
@@ -160,7 +158,6 @@ static inline void ipc_data_writel(u32 data, u32 offset) /* Write ipc data */
  * Format:
  * |rfu3(8)|error code(8)|initiator id(8)|cmd id(4)|rfu1(2)|error(1)|busy(1)|
  */
-
 static inline u8 ipc_read_status(void)
 {
 	return __raw_readl(ipcdev.ipc_base + 0x04);
@@ -176,7 +173,8 @@ static inline u32 ipc_data_readl(u32 offset) /* Read ipc u32 data */
 	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
 }
 
-static inline int busy_loop(void) /* Wait till scu status is busy */
+/* Wait till scu status is busy */
+static inline int busy_loop(void)
 {
 	u32 status = 0;
 	u32 loop_count = 0;
@@ -217,7 +215,7 @@ static inline int ipc_wait_for_interrupt(void)
 	return 0;
 }
 
-int intel_scu_ipc_check_status(void)
+static int intel_scu_ipc_check_status(void)
 {
 	return ipcdev.irq_mode ? ipc_wait_for_interrupt() : busy_loop();
 }
@@ -248,18 +246,18 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 	if (id == IPC_CMD_PCNTRL_R) {
 		for (nc = 0, offset = 0; nc < count; nc++, offset += 4)
 			ipc_data_writel(wbuf[nc], offset);
-		ipc_command((count*2) << 16 |  id << 12 | 0 << 8 | op);
+		ipc_command((count * 2) << 16 | id << 12 | 0 << 8 | op);
 	} else if (id == IPC_CMD_PCNTRL_W) {
 		for (nc = 0; nc < count; nc++, offset += 1)
 			cbuf[offset] = data[nc];
 		for (nc = 0, offset = 0; nc < count; nc++, offset += 4)
 			ipc_data_writel(wbuf[nc], offset);
-		ipc_command((count*3) << 16 |  id << 12 | 0 << 8 | op);
+		ipc_command((count * 3) << 16 | id << 12 | 0 << 8 | op);
 	} else if (id == IPC_CMD_PCNTRL_M) {
 		cbuf[offset] = data[0];
 		cbuf[offset + 1] = data[1];
 		ipc_data_writel(wbuf[0], 0); /* Write wbuff */
-		ipc_command(4 << 16 |  id << 12 | 0 << 8 | op);
+		ipc_command(4 << 16 | id << 12 | 0 << 8 | op);
 	}
 
 	err = intel_scu_ipc_check_status();
@@ -301,7 +299,7 @@ EXPORT_SYMBOL(intel_scu_ipc_ioread8);
  */
 int intel_scu_ipc_ioread16(u16 addr, u16 *data)
 {
-	u16 x[2] = {addr, addr + 1 };
+	u16 x[2] = {addr, addr + 1};
 	return pwr_reg_rdwr(x, (u8 *)data, 2, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_R);
 }
 EXPORT_SYMBOL(intel_scu_ipc_ioread16);
@@ -351,7 +349,7 @@ EXPORT_SYMBOL(intel_scu_ipc_iowrite8);
  */
 int intel_scu_ipc_iowrite16(u16 addr, u16 data)
 {
-	u16 x[2] = {addr, addr + 1 };
+	u16 x[2] = {addr, addr + 1};
 	return pwr_reg_rdwr(x, (u8 *)&data, 2, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_W);
 }
 EXPORT_SYMBOL(intel_scu_ipc_iowrite16);
@@ -412,7 +410,6 @@ int intel_scu_ipc_writev(u16 *addr, u8 *data, int len)
 }
 EXPORT_SYMBOL(intel_scu_ipc_writev);
 
-
 /**
  *	intel_scu_ipc_update_register	-	r/m/w a register
  *	@addr: register address
@@ -475,9 +472,8 @@ EXPORT_SYMBOL(intel_scu_ipc_simple_command);
  *	Issue a command to the SCU which involves data transfers. Do the
  *	data copies under the lock but leave it for the caller to interpret
  */
-
 int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
-							u32 *out, int outlen)
+			  u32 *out, int outlen)
 {
 	int i, err;
 
@@ -503,7 +499,7 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 }
 EXPORT_SYMBOL(intel_scu_ipc_command);
 
-/*I2C commands */
+/* I2C commands */
 #define IPC_I2C_WRITE 1 /* I2C Write command */
 #define IPC_I2C_READ  2 /* I2C Read command */
 
@@ -666,9 +662,10 @@ static struct pci_driver ipc_driver = {
 	.remove = ipc_remove,
 };
 
-
 static int __init intel_scu_ipc_init(void)
 {
+	int platform;		/* Platform type */
+
 	platform = intel_mid_identify_cpu();
 	if (platform == 0)
 		return -ENODEV;
-- 
2.1.4
