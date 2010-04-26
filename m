From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] IPC driver for Intel Mobile Internet Device (MID)
 platforms
Date: Mon, 26 Apr 2010 18:13:05 +0100
Message-ID: <20100426181305.3b417a51@linux.intel.com>
References: <20100423143037.6744.87450.stgit@localhost.localdomain>
	<20100426150934.GA9422@srcf.ucam.org>
	<20100426155534.6dcaca0c@linux.intel.com>
	<20100426154300.GA10782@srcf.ucam.org>
	<20100426163958.2b5f16b7@linux.intel.com>
	<20100426162202.GA11755@srcf.ucam.org>
	<20100426172800.5405f352@linux.intel.com>
	<20100426170616.GA12769@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:9170 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751451Ab0DZRtJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Apr 2010 13:49:09 -0400
In-Reply-To: <20100426170616.GA12769@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org, sreedhara.ds@intel.com, mingo@elte.hu

On Mon, 26 Apr 2010 18:06:16 +0100
Matthew Garrett <mjg59@srcf.ucam.org> wrote:

> On Mon, Apr 26, 2010 at 05:28:00PM +0100, Alan Cox wrote:
> > > I'm really not terribly comfortable merging enabling code for an 
> > > architecture if there's no clear plan for merging critical parts
> > > of that architecture.
> > 
> > I'm not interested in playing graphics driver politics. If I could
> > do something short term about the graphics situation I would.
> > Furthermore there isn't anything I can do about it (even if it does
> > involve its own *clean* mode setting to keep KeithP from exploding)
> > until the core merges are done.
> 
> It's been pointed out to me that there are non-graphical targets for 
> this platform as well, so in that case there's no real argument on my 
> side. I'll queue this for .35.

Here's a better one. This has the modify API fix pulled in and the
various command locks fixed by the simple expedient of passing copies
of the data around. As its at most about 5 dwords it's not going to
kill anyone and it cleans up a fair bit

Alan
--

commit e0d3f5da70f26f39853a000a7cfc9575047c63d7
Author: Sreedhara DS <sreedhara.ds@intel.com>
Date:   Mon Apr 26 17:05:45 2010 +0100

    IPC driver for Intel Mobile Internet Device (MID) platforms
    
    The IPC (inter processor communications) is used to provide the communications
    between kernel and system control units on some embedded Intel x86 platforms.

    (Various bits of clean up and restructuring by Alan Cox)
    
    Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
    Signed-off-by: Alan Cox <alan@linux.intel.com>

diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/intel_scu_ipc.h
new file mode 100644
index 0000000..6c6170b
--- /dev/null
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -0,0 +1,55 @@
+#ifndef _ASM_X86_INTEL_SCU_IPC_H_
+#define  _ASM_X86_INTEL_SCU_IPC_H_
+
+/* Read single register */
+int intel_scu_ipc_ioread8(u16 addr, u8 *data);
+
+/* Read two sequential registers */
+int intel_scu_ipc_ioread16(u16 addr, u16 *data);
+
+/* Read four sequential registers */
+int intel_scu_ipc_ioread32(u16 addr, u32 *data);
+
+/* Read a vector */
+int intel_scu_ipc_readv(u16 *addr, u8 *data, int len);
+
+/* Write single register */
+int intel_scu_ipc_iowrite8(u16 addr, u8 data);
+
+/* Write two sequential registers */
+int intel_scu_ipc_iowrite16(u16 addr, u16 data);
+
+/* Write four sequential registers */
+int intel_scu_ipc_iowrite32(u16 addr, u32 data);
+
+/* Write a vector */
+int intel_scu_ipc_writev(u16 *addr, u8 *data, int len);
+
+/* Update single register based on the mask */
+int intel_scu_ipc_update_register(u16 addr, u8 data, u8 mask);
+
+/*
+ * Indirect register read
+ * Can be used when SCCB(System Controller Configuration Block) register
+ * HRIM(Honor Restricted IPC Messages) is set (bit 23)
+ */
+int intel_scu_ipc_register_read(u32 addr, u32 *data);
+
+/*
+ * Indirect register write
+ * Can be used when SCCB(System Controller Configuration Block) register
+ * HRIM(Honor Restricted IPC Messages) is set (bit 23)
+ */
+int intel_scu_ipc_register_write(u32 addr, u32 data);
+
+/* Issue commands to the SCU with or without data */
+int intel_scu_ipc_simple_command(int cmd, int sub);
+int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
+							u32 * out, int outlen);
+/* I2C control api */
+int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data);
+
+/* Update FW version */
+int intel_scu_ipc_fw_update(u8 *buffer, u32 length);
+
+#endif
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7bec458..09060a0 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -526,4 +526,12 @@ config ACPI_CMPC
 	  keys as input device, backlight device, tablet and accelerometer
 	  devices.
 
+config INTEL_SCU_IPC
+	bool "Intel SCU IPC Support"
+	depends on X86_MRST
+	default y
+	---help---
+	  IPC is used to bridge the communications between kernel and SCU on
+	  some embedded Intel x86 platforms.
+
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index a906490..8770bfe 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_ACPI_ASUS)		+= asus_acpi.o
 obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
 obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+= toshiba_bluetooth.o
+obj-$(CONFIG_INTEL_SCU_IPC)	+= intel_scu_ipc.o
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
new file mode 100644
index 0000000..2c49ad2
--- /dev/null
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -0,0 +1,829 @@
+/*
+ * intel_scu_ipc.c: Driver for the Intel SCU IPC mechanism
+ *
+ * (C) Copyright 2008-2010 Intel Corporation
+ * Author: Sreedhara DS (sreedhara.ds@intel.com)
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; version 2
+ * of the License.
+ *
+ * SCU runing in ARC processor communicates with other entity running in IA
+ * core through IPC mechanism which in turn messaging between IA core ad SCU.
+ * SCU has two IPC mechanism IPC-1 and IPC-2. IPC-1 is used between IA32 and
+ * SCU where IPC-2 is used between P-Unit and SCU. This driver delas with
+ * IPC-1 Driver provides an API for power control unit registers (e.g. MSIC)
+ * along with other APIs.
+ */
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/sysdev.h>
+#include <linux/pm.h>
+#include <linux/pci.h>
+#include <linux/interrupt.h>
+#include <asm/setup.h>
+#include <asm/intel_scu_ipc.h>
+
+/* IPC defines the following message types */
+#define IPCMSG_WATCHDOG_TIMER 0xF8 /* Set Kernel Watchdog Threshold */
+#define IPCMSG_BATTERY        0xEF /* Coulomb Counter Accumulator */
+#define IPCMSG_FW_UPDATE      0xFE /* Firmware update */
+#define IPCMSG_PCNTRL         0xFF /* Power controller unit read/write */
+#define IPCMSG_FW_REVISION    0xF4 /* Get firmware revision */
+
+/* Command id associated with message IPCMSG_PCNTRL */
+#define IPC_CMD_PCNTRL_W      0 /* Register write */
+#define IPC_CMD_PCNTRL_R      1 /* Register read */
+#define IPC_CMD_PCNTRL_M      2 /* Register read-modify-write */
+
+/* Miscelaneous Command ids */
+#define IPC_CMD_INDIRECT_RD   2 /* 32bit indirect read */
+#define IPC_CMD_INDIRECT_WR   5 /* 32bit indirect write */
+
+/*
+ * IPC register summary
+ *
+ * IPC register blocks are memory mapped at fixed address of 0xFF11C000
+ * To read or write information to the SCU, driver writes to IPC-1 memory
+ * mapped registers (base address 0xFF11C000). The following is the IPC
+ * mechanism
+ *
+ * 1. IA core cDMI interface claims this transaction and converts it to a
+ *    Transaction Layer Packet (TLP) message which is sent across the cDMI.
+ *
+ * 2. South Complex cDMI block receives this message and writes it to
+ *    the IPC-1 register block, causing an interrupt to the SCU
+ *
+ * 3. SCU firmware decodes this interrupt and IPC message and the appropriate
+ *    message handler is called within firmware.
+ */
+
+#define IPC_BASE_ADDR     0xFF11C000	/* IPC1 base register address */
+#define IPC_MAX_ADDR      0x100		/* Maximum IPC regisers */
+#define IPC_WWBUF_SIZE    16		/* IPC Write buffer Size */
+#define IPC_RWBUF_SIZE    16		/* IPC Read buffer Size */
+#define IPC_I2C_BASE      0xFF12B000	/* I2C control register base address */
+#define IPC_I2C_MAX_ADDR  0x10		/* Maximum I2C regisers */
+
+static int ipc_probe(struct pci_dev *dev, const struct pci_device_id *id);
+static void ipc_remove(struct pci_dev *pdev);
+
+struct intel_scu_ipc_dev {
+	struct pci_dev *pdev;
+	void __iomem *ipc_base;
+	void __iomem *i2c_base;
+};
+
+static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
+
+static int platform = 1;
+module_param(platform, int, 0);
+MODULE_PARM_DESC(platform, "1 for moorestown platform");
+
+
+
+
+/*
+ * IPC Read Buffer (Read Only):
+ * 16 byte buffer for receiving data from SCU, if IPC command
+ * processing results in response data
+ */
+#define IPC_READ_BUFFER		0x90
+
+#define IPC_I2C_CNTRL_ADDR	0
+#define I2C_DATA_ADDR		0x04
+
+static DEFINE_MUTEX(ipclock); /* lock used to prevent multiple call to SCU */
+
+/*
+ * Command Register (Write Only):
+ * A write to this register results in an interrupt to the SCU core processor
+ * Format:
+ * |rfu2(8) | size(8) | command id(4) | rfu1(3) | ioc(1) | command(8)|
+ */
+static inline void ipc_command(u32 cmd) /* Send ipc command */
+{
+	writel(cmd, ipcdev.ipc_base);
+}
+
+/*
+ * IPC Write Buffer (Write Only):
+ * 16-byte buffer for sending data associated with IPC command to
+ * SCU. Size of the data is specified in the IPC_COMMAND_REG register
+ */
+static inline void ipc_data_writel(u32 data, u32 offset) /* Write ipc data */
+{
+	writel(data, ipcdev.ipc_base + 0x80 + offset);
+}
+
+/*
+ * IPC destination Pointer (Write Only):
+ * Use content as pointer for destination write
+ */
+static inline void ipc_write_dptr(u32 data) /* Write dptr data */
+{
+	writel(data, ipcdev.ipc_base + 0x0C);
+}
+
+/*
+ * IPC Source Pointer (Write Only):
+ * Use content as pointer for read location
+*/
+static inline void ipc_write_sptr(u32 data) /* Write dptr data */
+{
+	writel(data, ipcdev.ipc_base + 0x08);
+}
+
+/*
+ * Status Register (Read Only):
+ * Driver will read this register to get the ready/busy status of the IPC
+ * block and error status of the IPC command that was just processed by SCU
+ * Format:
+ * |rfu3(8)|error code(8)|initiator id(8)|cmd id(4)|rfu1(2)|error(1)|busy(1)|
+ */
+
+static inline u8 ipc_read_status(void)
+{
+	return __raw_readl(ipcdev.ipc_base + 0x04);
+}
+
+static inline u8 ipc_data_readb(u32 offset) /* Read ipc byte data */
+{
+	return readb(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
+}
+
+static inline u8 ipc_data_readl(u32 offset) /* Read ipc u32 data */
+{
+	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
+}
+
+static inline int busy_loop(void) /* Wait till scu status is busy */
+{
+	u32 status = 0;
+	u32 loop_count = 0;
+
+	status = ipc_read_status();
+	while (status & 1) {
+		udelay(1); /* scu processing time is in few u secods */
+		status = ipc_read_status();
+		loop_count++;
+		/* break if scu doesn't reset busy bit after huge retry */
+		if (loop_count > 100000) {
+			dev_err(&ipcdev.pdev->dev, "IPC timed out");
+			return -ETIMEDOUT;
+		}
+	}
+	return (status >> 1) & 1;
+}
+
+/* Read/Write power control(PMIC in Langwell, MSIC in PenWell) registers */
+static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
+{
+	int nc;
+	u32 offset = 0;
+	u32 err = 0;
+	u8 cbuf[IPC_WWBUF_SIZE] = { '\0' };
+	u32 *wbuf = (u32 *)&cbuf;
+
+	mutex_lock(&ipclock);
+	if (ipcdev.pdev == NULL) {
+		mutex_unlock(&ipclock);
+		return -ENODEV;
+	}
+
+	if (platform == 1) {
+		/* Entry is 4 bytes for read/write, 5 bytes for read modify */
+		for (nc = 0; nc < count; nc++) {
+			cbuf[offset] = addr[nc];
+			cbuf[offset + 1] = addr[nc] >> 8;
+			if (id != IPC_CMD_PCNTRL_R)
+				cbuf[offset + 2] = data[nc];
+			if (id == IPC_CMD_PCNTRL_M) {
+				cbuf[offset + 3] = data[nc + 1];
+				offset += 1;
+			}
+			offset += 3;
+		}
+		for (nc = 0, offset = 0; nc < count; nc++, offset += 4)
+			ipc_data_writel(wbuf[nc], offset); /* Write wbuff */
+
+	} else {
+		for (nc = 0, offset = 0; nc < count; nc++, offset += 2)
+			ipc_data_writel(addr[nc], offset); /* Write addresses */
+		if (id != IPC_CMD_PCNTRL_R) {
+			for (nc = 0; nc < count; nc++, offset++)
+				ipc_data_writel(data[nc], offset); /* Write data */
+			if (id == IPC_CMD_PCNTRL_M)
+				ipc_data_writel(data[nc + 1], offset); /* Mask value*/
+		}
+	}
+
+	if (id != IPC_CMD_PCNTRL_M)
+		ipc_command((count * 3) << 16 |  id << 12 | 0 << 8 | op);
+	else
+		ipc_command((count * 4) << 16 |  id << 12 | 0 << 8 | op);
+
+	err = busy_loop();
+
+	if (id == IPC_CMD_PCNTRL_R) { /* Read rbuf */
+		/* Workaround: values are read as 0 without memcpy_fromio */
+		memcpy_fromio(cbuf, ipcdev.ipc_base + IPC_READ_BUFFER, 16);
+		if (platform == 1) {
+			for (nc = 0, offset = 2; nc < count; nc++, offset += 3)
+				data[nc] = ipc_data_readb(offset);
+		} else {
+			for (nc = 0; nc < count; nc++)
+				data[nc] = ipc_data_readb(nc);
+		}
+	}
+	mutex_unlock(&ipclock);
+	return err;
+}
+
+/**
+ *	intel_scu_ipc_ioread8		-	read a word via the SCU
+ *	@addr: register on SCU
+ *	@data: return pointer for read byte
+ *
+ *	Read a single register. Returns 0 on success or an error code. All
+ *	locking between SCU accesses is handled for the caller.
+ *
+ *	This function may sleep.
+ */
+int intel_scu_ipc_ioread8(u16 addr, u8 *data)
+{
+	return pwr_reg_rdwr(&addr, data, 1, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_R);
+}
+EXPORT_SYMBOL(intel_scu_ipc_ioread8);
+
+/**
+ *	intel_scu_ipc_ioread16		-	read a word via the SCU
+ *	@addr: register on SCU
+ *	@data: return pointer for read word
+ *
+ *	Read a register pair. Returns 0 on success or an error code. All
+ *	locking between SCU accesses is handled for the caller.
+ *
+ *	This function may sleep.
+ */
+int intel_scu_ipc_ioread16(u16 addr, u16 *data)
+{
+	u16 x[2] = {addr, addr + 1 };
+	return pwr_reg_rdwr(x, (u8 *)data, 2, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_R);
+}
+EXPORT_SYMBOL(intel_scu_ipc_ioread16);
+
+/**
+ *	intel_scu_ipc_ioread32		-	read a dword via the SCU
+ *	@addr: register on SCU
+ *	@data: return pointer for read dword
+ *
+ *	Read four registers. Returns 0 on success or an error code. All
+ *	locking between SCU accesses is handled for the caller.
+ *
+ *	This function may sleep.
+ */
+int intel_scu_ipc_ioread32(u16 addr, u32 *data)
+{
+	u16 x[4] = {addr, addr + 1, addr + 2, addr + 3};
+	return pwr_reg_rdwr(x, (u8 *)data, 4, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_R);
+}
+EXPORT_SYMBOL(intel_scu_ipc_ioread32);
+
+/**
+ *	intel_scu_ipc_iowrite8		-	write a byte via the SCU
+ *	@addr: register on SCU
+ *	@data: byte to write
+ *
+ *	Write a single register. Returns 0 on success or an error code. All
+ *	locking between SCU accesses is handled for the caller.
+ *
+ *	This function may sleep.
+ */
+int intel_scu_ipc_iowrite8(u16 addr, u8 data)
+{
+	return pwr_reg_rdwr(&addr, &data, 1, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_W);
+}
+EXPORT_SYMBOL(intel_scu_ipc_iowrite8);
+
+/**
+ *	intel_scu_ipc_iowrite16		-	write a word via the SCU
+ *	@addr: register on SCU
+ *	@data: word to write
+ *
+ *	Write two registers. Returns 0 on success or an error code. All
+ *	locking between SCU accesses is handled for the caller.
+ *
+ *	This function may sleep.
+ */
+int intel_scu_ipc_iowrite16(u16 addr, u16 data)
+{
+	u16 x[2] = {addr, addr + 1 };
+	return pwr_reg_rdwr(x, (u8 *)&data, 2, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_W);
+}
+EXPORT_SYMBOL(intel_scu_ipc_iowrite16);
+
+/**
+ *	intel_scu_ipc_iowrite32		-	write a dword via the SCU
+ *	@addr: register on SCU
+ *	@data: dword to write
+ *
+ *	Write four registers. Returns 0 on success or an error code. All
+ *	locking between SCU accesses is handled for the caller.
+ *
+ *	This function may sleep.
+ */
+int intel_scu_ipc_iowrite32(u16 addr, u32 data)
+{
+	u16 x[4] = {addr, addr + 1, addr + 2, addr + 3};
+	return pwr_reg_rdwr(x, (u8 *)&data, 4, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_W);
+}
+EXPORT_SYMBOL(intel_scu_ipc_iowrite32);
+
+/**
+ *	intel_scu_ipc_readvv		-	read a set of registers
+ *	@addr: register list
+ *	@data: bytes to return
+ *	@len: length of array
+ *
+ *	Read registers. Returns 0 on success or an error code. All
+ *	locking between SCU accesses is handled for the caller.
+ *
+ *	The largest array length permitted by the hardware is 5 items.
+ *
+ *	This function may sleep.
+ */
+int intel_scu_ipc_readv(u16 *addr, u8 *data, int len)
+{
+	return pwr_reg_rdwr(addr, data, len, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_R);
+}
+EXPORT_SYMBOL(intel_scu_ipc_readv);
+
+/**
+ *	intel_scu_ipc_writev		-	write a set of registers
+ *	@addr: register list
+ *	@data: bytes to write
+ *	@len: length of array
+ *
+ *	Write registers. Returns 0 on success or an error code. All
+ *	locking between SCU accesses is handled for the caller.
+ *
+ *	The largest array length permitted by the hardware is 5 items.
+ *
+ *	This function may sleep.
+ *
+ */
+int intel_scu_ipc_writev(u16 *addr, u8 *data, int len)
+{
+	return pwr_reg_rdwr(addr, data, len, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_W);
+}
+EXPORT_SYMBOL(intel_scu_ipc_writev);
+
+
+/**
+ *	intel_scu_ipc_update_register	-	r/m/w a register
+ *	@addr: register address
+ *	@bits: bits to update
+ *	@mask: mask of bits to update
+ *
+ *	Read-modify-write power control unit register. The first data argument
+ *	must be register value and second is mask value
+ *	mask is a bitmap that indicates which bits to update.
+ *	0 = masked. Don't modify this bit, 1 = modify this bit.
+ *	returns 0 on success or an error code.
+ *
+ *	This function may sleep. Locking between SCU accesses is handled
+ *	for the caller.
+ */
+int intel_scu_ipc_update_register(u16 addr, u8 bits, u8 mask)
+{
+	u8 data[2] = { bits, mask };
+	return pwr_reg_rdwr(&addr, data, 1, IPCMSG_PCNTRL, IPC_CMD_PCNTRL_M);
+}
+EXPORT_SYMBOL(intel_scu_ipc_update_register);
+
+/**
+ *	intel_scu_ipc_register_read	-	32bit indirect read
+ *	@addr: register address
+ *	@value: 32bit value return
+ *
+ *	Performs IA 32 bit indirect read, returns 0 on success, or an
+ *	error code.
+ *
+ *	Can be used when SCCB(System Controller Configuration Block) register
+ *	HRIM(Honor Restricted IPC Messages) is set (bit 23)
+ *
+ *	This function may sleep. Locking for SCU accesses is handled for
+ *	the caller.
+ */
+int intel_scu_ipc_register_read(u32 addr, u32 *value)
+{
+	u32 err = 0;
+
+	mutex_lock(&ipclock);
+	if (ipcdev.pdev == NULL) {
+		mutex_unlock(&ipclock);
+		return -ENODEV;
+	}
+	ipc_write_sptr(addr);
+	ipc_command(4 << 16 | IPC_CMD_INDIRECT_RD);
+	err = busy_loop();
+	*value = ipc_data_readl(0);
+	mutex_unlock(&ipclock);
+	return err;
+}
+EXPORT_SYMBOL(intel_scu_ipc_register_read);
+
+/**
+ *	intel_scu_ipc_register_write	-	32bit indirect write
+ *	@addr: register address
+ *	@value: 32bit value to write
+ *
+ *	Performs IA 32 bit indirect write, returns 0 on success, or an
+ *	error code.
+ *
+ *	Can be used when SCCB(System Controller Configuration Block) register
+ *	HRIM(Honor Restricted IPC Messages) is set (bit 23)
+ *
+ *	This function may sleep. Locking for SCU accesses is handled for
+ *	the caller.
+ */
+int intel_scu_ipc_register_write(u32 addr, u32 value)
+{
+	u32 err = 0;
+
+	mutex_lock(&ipclock);
+	if (ipcdev.pdev == NULL) {
+		mutex_unlock(&ipclock);
+		return -ENODEV;
+	}
+	ipc_write_dptr(addr);
+	ipc_data_writel(value, 0);
+	ipc_command(4 << 16 | IPC_CMD_INDIRECT_WR);
+	err = busy_loop();
+	mutex_unlock(&ipclock);
+	return err;
+}
+EXPORT_SYMBOL(intel_scu_ipc_register_write);
+
+/**
+ *	intel_scu_ipc_simple_command	-	send a simple command
+ *	@cmd: command
+ *	@sub: sub type
+ *
+ *	Issue a simple command to the SCU. Do not use this interface if
+ *	you must then access data as any data values may be overwritten
+ *	by another SCU access by the time this function returns.
+ *
+ *	This function may sleep. Locking for SCU accesses is handled for
+ *	the caller.
+ */
+int intel_scu_ipc_simple_command(int cmd, int sub)
+{
+	u32 err = 0;
+
+	mutex_lock(&ipclock);
+	if (ipcdev.pdev == NULL) {
+		mutex_unlock(&ipclock);
+		return -ENODEV;
+	}
+	ipc_command(cmd << 12 | sub);
+	err = busy_loop();
+	mutex_unlock(&ipclock);
+	return err;
+}
+EXPORT_SYMBOL(intel_scu_ipc_simple_command);
+
+/**
+ *	intel_scu_ipc_command	-	command with data
+ *	@cmd: command
+ *	@sub: sub type
+ *	@in: input data
+ *	@inlen: input length
+ *	@out: output data
+ *	@outlein: output length
+ *
+ *	Issue a command to the SCU which involves data transfers. Do the
+ *	data copies under the lock but leave it for the caller to interpret
+ */
+
+int intel_scu_ipc_command(int cmd, int sub, u32 *in ,int inlen,
+							u32 * out, int outlen)
+{
+	u32 err = 0;
+	int i = 0;
+
+	mutex_lock(&ipclock);
+	if (ipcdev.pdev == NULL) {
+		mutex_unlock(&ipclock);
+		return -ENODEV;
+	}
+
+	for (i = 0; i < inlen; i++)
+		ipc_data_writel(*in++, 4 * i);
+
+	ipc_command(cmd << 12 | sub);
+	err = busy_loop();
+
+	for (i = 0; i < outlen; i++)
+		*out++ = ipc_data_readl(4 * i);
+
+	mutex_unlock(&ipclock);
+	return err;
+}
+EXPORT_SYMBOL(intel_scu_ipc_command);
+
+/*I2C commands */
+#define IPC_I2C_WRITE 1 /* I2C Write command */
+#define IPC_I2C_READ  2 /* I2C Read command */
+
+/**
+ *	intel_scu_ipc_i2c_cntrl		-	I2C read/write operations
+ *	@addr: I2C address + command bits
+ *	@data: data to read/write
+ *
+ *	Perform an an I2C read/write operation via the SCU. All locking is
+ *	handled for the caller. This function may sleep.
+ *
+ *	Returns an error code or 0 on success.
+ *
+ *	This has to be in the IPC driver for the locking.
+ */
+int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data)
+{
+	u32 cmd = 0;
+
+	mutex_lock(&ipclock);
+	cmd = (addr >> 24) & 0xFF;
+	if (cmd == IPC_I2C_READ) {
+		writel(addr, ipcdev.i2c_base + IPC_I2C_CNTRL_ADDR);
+		/* Write not getting updated without delay */
+		mdelay(1);
+		*data = readl(ipcdev.i2c_base + I2C_DATA_ADDR);
+	} else if (cmd == IPC_I2C_WRITE) {
+		writel(addr, ipcdev.i2c_base + I2C_DATA_ADDR);
+		mdelay(1);
+		writel(addr, ipcdev.i2c_base + IPC_I2C_CNTRL_ADDR);
+	} else {
+		dev_err(&ipcdev.pdev->dev,
+			"intel_scu_ipc: I2C INVALID_CMD = 0x%x\n", cmd);
+
+		mutex_unlock(&ipclock);
+		return -1;
+	}
+	mutex_unlock(&ipclock);
+	return 0;
+}
+EXPORT_SYMBOL(intel_scu_ipc_i2c_cntrl);
+
+#define IPC_FW_LOAD_ADDR 0xFFFC0000 /* Storage location for FW image */
+#define IPC_FW_UPDATE_MBOX_ADDR 0xFFFFDFF4 /* Mailbox between ipc and scu */
+#define IPC_MAX_FW_SIZE 262144 /* 256K storage size for loading the FW image */
+#define IPC_FW_MIP_HEADER_SIZE 2048 /* Firmware MIP header size */
+/* IPC inform SCU to get ready for update process */
+#define IPC_CMD_FW_UPDATE_READY  0x10FE
+/* IPC inform SCU to go for update process */
+#define IPC_CMD_FW_UPDATE_GO     0x20FE
+/* Status code for fw update */
+#define IPC_FW_UPDATE_SUCCESS	0x444f4e45 /* Status code 'DONE' */
+#define IPC_FW_UPDATE_BADN	0x4241444E /* Status code 'BADN' */
+#define IPC_FW_TXHIGH		0x54784849 /* Status code 'IPC_FW_TXHIGH' */
+#define IPC_FW_TXLOW		0x54784c4f /* Status code 'IPC_FW_TXLOW' */
+
+struct fw_update_mailbox {
+	u32    status;
+	u32    scu_flag;
+	u32    driver_flag;
+};
+
+
+/**
+ *	intel_scu_ipc_fw_update	-	 Firmware update utility
+ *	@buffer: firmware buffer
+ *	@length: size of firmware buffer
+ *
+ *	This function provides an interface to load the firmware into
+ *	the SCU. Returns 0 on success or -1 on failure
+ */
+int intel_scu_ipc_fw_update(u8 *buffer, u32 length)
+{
+	void __iomem *fw_update_base;
+	struct fw_update_mailbox __iomem *mailbox = NULL;
+	int retry_cnt = 0;
+	u32 status;
+
+	mutex_lock(&ipclock);
+	fw_update_base = ioremap_nocache(IPC_FW_LOAD_ADDR, (128*1024));
+	if (fw_update_base == NULL) {
+		mutex_unlock(&ipclock);
+		return -ENOMEM;
+	}
+	mailbox = ioremap_nocache(IPC_FW_UPDATE_MBOX_ADDR,
+					sizeof(struct fw_update_mailbox));
+	if (mailbox == NULL) {
+		iounmap(fw_update_base);
+		mutex_unlock(&ipclock);
+		return -ENOMEM;
+	}
+
+	ipc_command(IPC_CMD_FW_UPDATE_READY);
+
+	/* Intitialize mailbox */
+	writel(0, &mailbox->status);
+	writel(0, &mailbox->scu_flag);
+	writel(0, &mailbox->driver_flag);
+
+	/* Driver copies the 2KB MIP header to SRAM at 0xFFFC0000*/
+	memcpy_toio(fw_update_base, buffer, 0x800);
+
+	/* Driver sends "FW Update" IPC command (CMD_ID 0xFE; MSG_ID 0x02).
+	* Upon receiving this command, SCU will write the 2K MIP header
+	* from 0xFFFC0000 into NAND.
+	* SCU will write a status code into the Mailbox, and then set scu_flag.
+	*/
+
+	ipc_command(IPC_CMD_FW_UPDATE_GO);
+
+	/*Driver stalls until scu_flag is set */
+	while (readl(&mailbox->scu_flag) != 1) {
+		rmb();
+		mdelay(1);
+	}
+
+	/* Driver checks Mailbox status.
+	 * If the status is 'BADN', then abort (bad NAND).
+	 * If the status is 'IPC_FW_TXLOW', then continue.
+	 */
+	while (readl(&mailbox->status) != IPC_FW_TXLOW) {
+		rmb();
+		mdelay(10);
+	}
+	mdelay(10);
+
+update_retry:
+	if (retry_cnt > 5)
+		goto update_end;
+
+	if (readl(&mailbox->status) != IPC_FW_TXLOW)
+		goto update_end;
+	buffer = buffer + 0x800;
+	memcpy_toio(fw_update_base, buffer, 0x20000);
+	writel(1, &mailbox->driver_flag);
+	while (readl(&mailbox->scu_flag) == 1) {
+		rmb();
+		mdelay(1);
+	}
+
+	/* check for 'BADN' */
+	if (readl(&mailbox->status) == IPC_FW_UPDATE_BADN)
+		goto update_end;
+
+	while (readl(&mailbox->status) != IPC_FW_TXHIGH) {
+		rmb();
+		mdelay(10);
+	}
+	mdelay(10);
+
+	if (readl(&mailbox->status) != IPC_FW_TXHIGH)
+		goto update_end;
+
+	buffer = buffer + 0x20000;
+	memcpy_toio(fw_update_base, buffer, 0x20000);
+	writel(0, &mailbox->driver_flag);
+
+	while (mailbox->scu_flag == 0) {
+		rmb();
+		mdelay(1);
+	}
+
+	/* check for 'BADN' */
+	if (readl(&mailbox->status) == IPC_FW_UPDATE_BADN)
+		goto update_end;
+
+	if (readl(&mailbox->status) == IPC_FW_TXLOW) {
+		++retry_cnt;
+		goto update_retry;
+	}
+
+update_end:
+	status = readl(&mailbox->status);
+
+	iounmap(fw_update_base);
+	iounmap(mailbox);
+	mutex_unlock(&ipclock);
+
+	if (status == IPC_FW_UPDATE_SUCCESS)
+		return 0;
+	return -1;
+}
+EXPORT_SYMBOL(intel_scu_ipc_fw_update);
+
+/*
+ * Interrupt handler gets called when ioc bit of IPC_COMMAND_REG set to 1
+ * When ioc bit is set to 1, caller api must wait for interrupt handler called
+ * which in turn unlocks the caller api. Currently this is not used
+ *
+ * This is edge triggered so we need take no action to clear anything
+ */
+static irqreturn_t ioc(int irq, void *dev_id)
+{
+	return IRQ_HANDLED;
+}
+
+/**
+ *	ipc_probe	-	probe an Intel SCU IPC
+ *	@dev: the PCI device matching
+ *	@id: entry in the match table
+ *
+ *	Enable and install an intel SCU IPC. This appears in the PCI space
+ *	but uses some hard coded addresses as well.
+ */
+static int ipc_probe(struct pci_dev *dev, const struct pci_device_id *id)
+{
+	int err;
+	resource_size_t pci_resource;
+
+	if (ipcdev.pdev)		/* We support only one SCU */
+		return -EBUSY;
+
+	ipcdev.pdev = pci_dev_get(dev);
+
+	err = pci_enable_device(dev);
+	if (err)
+		return err;
+
+	err = pci_request_regions(dev, "intel_scu_ipc");
+	if (err)
+		return err;
+
+	pci_resource = pci_resource_start(dev, 0);
+	if (!pci_resource)
+		return -ENOMEM;
+
+	if (request_irq(dev->irq, ioc, 0, "intel_scu_ipc", &ipcdev))
+		return -EBUSY;
+
+	ipcdev.ipc_base = ioremap_nocache(IPC_BASE_ADDR, IPC_MAX_ADDR);
+	if (!ipcdev.ipc_base)
+		return -ENOMEM;
+
+	ipcdev.i2c_base = ioremap_nocache(IPC_I2C_BASE, IPC_I2C_MAX_ADDR);
+	if (!ipcdev.i2c_base) {
+		iounmap(ipcdev.ipc_base);
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+/**
+ *	ipc_remove	-	remove a bound IPC device
+ *	@pdev: PCI device
+ *
+ *	In practice the SCU is not removable but this function is also
+ *	called for each device on a module unload or cleanup which is the
+ *	path that will get used.
+ *
+ *	Free up the mappings and release the PCI resources
+ */
+static void ipc_remove(struct pci_dev *pdev)
+{
+	free_irq(pdev->irq, &ipcdev);
+	pci_release_regions(pdev);
+	pci_dev_put(ipcdev.pdev);
+	iounmap(ipcdev.ipc_base);
+	iounmap(ipcdev.i2c_base);
+	ipcdev.pdev = NULL;
+}
+
+static const struct pci_device_id pci_ids[] = {
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x080e)},
+	{ 0,}
+};
+MODULE_DEVICE_TABLE(pci, pci_ids);
+
+static struct pci_driver ipc_driver = {
+	.name = "intel_scu_ipc",
+	.id_table = pci_ids,
+	.probe = ipc_probe,
+	.remove = ipc_remove,
+};
+
+
+static int __init intel_scu_ipc_init(void)
+{
+	return  pci_register_driver(&ipc_driver);
+}
+
+static void __exit intel_scu_ipc_exit(void)
+{
+	pci_unregister_driver(&ipc_driver);
+}
+
+MODULE_AUTHOR("Sreedhara DS <sreedhara.ds@intel.com>");
+MODULE_DESCRIPTION("Intel SCU IPC driver");
+MODULE_LICENSE("GPL");
+
+module_init(intel_scu_ipc_init);
+module_exit(intel_scu_ipc_exit);
