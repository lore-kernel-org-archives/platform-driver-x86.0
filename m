From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH v3] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Thu, 27 Aug 2015 00:38:37 +0800
Message-ID: <1440607117-57683-1-git-send-email-qipeng.zha@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:19178 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752248AbbHZIfI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Aug 2015 04:35:08 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, qipeng.zha@intel.com

This driver provides support for P-Unit mailbox IPC on Intel platforms.
The heart of the P-Unit is the Foxton microcontroller and its firmware,
which provide mailbox interface for power management usage.

Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

---
change in v3
 Fix compile issue in intel_punit_ipc.h, it happened when built-in
and the header file is included in other source file.

change in v2
 Fix issues in code style and comments;
 Remove "default y" in Kconfig;
 Remove some header files;
 Replace request_mem_region with devm_request_mem_region,
and same for request_irq;
 Change to use prefix of IPC_PUNIT_ to define commands;
---
 MAINTAINERS                            |   4 +-
 arch/x86/include/asm/intel_punit_ipc.h | 101 ++++++++++
 drivers/platform/x86/Kconfig           |   6 +
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/intel_punit_ipc.c | 353 +++++++++++++++++++++++++++++++++
 5 files changed, 464 insertions(+), 1 deletion(-)
 create mode 100644 arch/x86/include/asm/intel_punit_ipc.h
 create mode 100644 drivers/platform/x86/intel_punit_ipc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 13ac861..cf71387 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5207,12 +5207,14 @@ F:	include/uapi/linux/mei.h
 F:	drivers/misc/mei/*
 F:	Documentation/misc-devices/mei/*
 
-INTEL PMC IPC DRIVER
+INTEL PMC/P-Unit IPC DRIVER
 M:	Zha Qipeng<qipeng.zha@intel.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/intel_pmc_ipc.c
+F:	drivers/platform/x86/intel_punit_ipc.c
 F:	arch/x86/include/asm/intel_pmc_ipc.h
+F:	arch/x86/include/asm/intel_punit_ipc.h
 
 IOC3 ETHERNET DRIVER
 M:	Ralf Baechle <ralf@linux-mips.org>
diff --git a/arch/x86/include/asm/intel_punit_ipc.h b/arch/x86/include/asm/intel_punit_ipc.h
new file mode 100644
index 0000000..0537434
--- /dev/null
+++ b/arch/x86/include/asm/intel_punit_ipc.h
@@ -0,0 +1,101 @@
+#ifndef _ASM_X86_INTEL_PUNIT_IPC_H_
+#define  _ASM_X86_INTEL_PUNIT_IPC_H_
+
+/* Commands supported on CPU core, are handled by different bars,
+ * unify these commands together here
+ */
+#define IPC_PUNIT_BIOS_CMD_BASE			0x00
+#define IPC_PUNIT_GTD_CMD_BASE			0x20
+#define IPC_PUNIT_ISPD_CMD_BASE			0x40
+
+/* BIOS => Pcode commands */
+#define IPC_PUNIT_BIOS_CMD_ZERO			(IPC_PUNIT_BIOS_CMD_BASE + 0x00)
+#define IPC_PUNIT_BIOS_CMD_VR_INTERFACE		(IPC_PUNIT_BIOS_CMD_BASE + 0x01)
+#define IPC_PUNIT_BIOS_CMD_READ_PCS		(IPC_PUNIT_BIOS_CMD_BASE + 0x02)
+#define IPC_PUNIT_BIOS_CMD_WRITE_PCS		(IPC_PUNIT_BIOS_CMD_BASE + 0x03)
+#define IPC_PUNIT_BIOS_CMD_READ_PCU_CONFIG	(IPC_PUNIT_BIOS_CMD_BASE + 0x04)
+#define IPC_PUNIT_BIOS_CMD_WRITE_PCU_CONFIG	(IPC_PUNIT_BIOS_CMD_BASE + 0x05)
+#define IPC_PUNIT_BIOS_CMD_READ_PL1_SETTING	(IPC_PUNIT_BIOS_CMD_BASE + 0x06)
+#define IPC_PUNIT_BIOS_WRITE_PL1_SETTING	(IPC_PUNIT_BIOS_CMD_BASE + 0x07)
+#define IPC_PUNIT_BIOS_CMD_TRIGGER_VDD_RAM	(IPC_PUNIT_BIOS_CMD_BASE + 0x08)
+#define IPC_PUNIT_BIOS_CMD_READ_TELE_INFO	(IPC_PUNIT_BIOS_CMD_BASE + 0x09)
+#define IPC_PUNIT_BIOS_CMD_READ_TELE_TRACE_CTRL	(IPC_PUNIT_BIOS_CMD_BASE + 0x0a)
+#define IPC_PUNIT_BIOS_CMD_WRITE_TELE_TRACE_CTRL \
+						(IPC_PUNIT_BIOS_CMD_BASE + 0x0b)
+#define IPC_PUNIT_BIOS_CMD_READ_TELE_EVENT_CTRL	(IPC_PUNIT_BIOS_CMD_BASE + 0x0c)
+#define IPC_PUNIT_BIOS_CMD_WRITE_TELE_EVENT_CTRL \
+						(IPC_PUNIT_BIOS_CMD_BASE + 0x0d)
+#define IPC_PUNIT_BIOS_CMD_READ_TELE_TRACE	(IPC_PUNIT_BIOS_CMD_BASE + 0x0e)
+#define IPC_PUNIT_BIOS_CMD_WRITE_TELE_TRACE	(IPC_PUNIT_BIOS_CMD_BASE + 0x0f)
+#define IPC_PUNIT_BIOS_CMD_READ_TELE_EVENT	(IPC_PUNIT_BIOS_CMD_BASE + 0x10)
+#define IPC_PUNIT_BIOS_CMD_WRITE_TELE_EVENT	(IPC_PUNIT_BIOS_CMD_BASE + 0x11)
+#define IPC_PUNIT_BIOS_CMD_READ_MODULE_TEMP	(IPC_PUNIT_BIOS_CMD_BASE + 0x12)
+#define IPC_PUNIT_BIOS_CMD_RESERVED		(IPC_PUNIT_BIOS_CMD_BASE + 0x13)
+#define IPC_PUNIT_BIOS_CMD_READ_VOLTAGE_OVER	(IPC_PUNIT_BIOS_CMD_BASE + 0x14)
+#define IPC_PUNIT_BIOS_CMD_WRITE_VOLTAGE_OVER	(IPC_PUNIT_BIOS_CMD_BASE + 0x15)
+#define IPC_PUNIT_BIOS_CMD_READ_RATIO_OVER	(IPC_PUNIT_BIOS_CMD_BASE + 0x16)
+#define IPC_PUNIT_BIOS_CMD_WRITE_RATIO_OVER	(IPC_PUNIT_BIOS_CMD_BASE + 0x17)
+#define IPC_PUNIT_BIOS_CMD_READ_VF_GL_CTRL	(IPC_PUNIT_BIOS_CMD_BASE + 0x18)
+#define IPC_PUNIT_BIOS_CMD_WRITE_VF_GL_CTRL	(IPC_PUNIT_BIOS_CMD_BASE + 0x19)
+#define IPC_PUNIT_BIOS_CMD_READ_FM_SOC_TEMP_THRESH \
+						(IPC_PUNIT_BIOS_CMD_BASE + 0x1a)
+#define IPC_PUNIT_BIOS_CMD_WRITE_FM_SOC_TEMP_THRESH \
+						(IPC_PUNIT_BIOS_CMD_BASE + 0x1b)
+
+/*GT Driver => Pcode commands*/
+#define IPC_PUNIT_GTD_CMD_ZERO			(IPC_PUNIT_GTD_CMD_BASE + 0x00)
+#define IPC_PUNIT_GTD_CMD_CONFIG		(IPC_PUNIT_GTD_CMD_BASE + 0x01)
+#define IPC_PUNIT_GTD_CMD_READ_ICCP_LIC_CDYN_SCAL \
+						(IPC_PUNIT_GTD_CMD_BASE + 0x02)
+#define IPC_PUNIT_GTD_CMD_WRITE_ICCP_LIC_CDYN_SCAL \
+						(IPC_PUNIT_GTD_CMD_BASE + 0x03)
+#define IPC_PUNIT_GTD_CMD_GET_WM_VAL		(IPC_PUNIT_GTD_CMD_BASE + 0x06)
+#define IPC_PUNIT_GTD_CMD_WRITE_CONFIG_WISHREQ	(IPC_PUNIT_GTD_CMD_BASE + 0x07)
+#define IPC_PUNIT_GTD_CMD_READ_REQ_DUTY_CYCLE	(IPC_PUNIT_GTD_CMD_BASE + 0x16)
+#define IPC_PUNIT_GTD_CMD_DIS_VOL_FREQ_CHANGE_REQUEST \
+						(IPC_PUNIT_GTD_CMD_BASE + 0x17)
+#define IPC_PUNIT_GTD_CMD_DYNA_DUTY_CYCLE_CTRL	(IPC_PUNIT_GTD_CMD_BASE + 0x1a)
+#define IPC_PUNIT_GTD_CMD_DYNA_DUTY_CYCLE_TUNING \
+						(IPC_PUNIT_GTD_CMD_BASE + 0x1c)
+
+/* ISP Driver => Pcode commands */
+#define IPC_PUNIT_ISPD_CMD_ZERO			(IPC_PUNIT_ISPD_CMD_BASE + 0x00)
+#define IPC_PUNIT_ISPD_CMD_CONFIG		(IPC_PUNIT_ISPD_CMD_BASE + 0x01)
+#define IPC_PUNIT_ISPD_CMD_GET_ISP_LTR_VAL	(IPC_PUNIT_ISPD_CMD_BASE + 0x02)
+#define IPC_PUNIT_ISPD_CMD_ACCESS_IU_FREQ_BOUNDS \
+						(IPC_PUNIT_ISPD_CMD_BASE + 0x03)
+#define IPC_PUNIT_ISPD_CMD_READ_CDYN_LEVEL	(IPC_PUNIT_ISPD_CMD_BASE + 0x04)
+#define IPC_PUNIT_ISPD_CMD_WRITE_CDYN_LEVEL	(IPC_PUNIT_ISPD_CMD_BASE + 0x05)
+#define IPC_PUNIT_ISPD_CMD_MAX			(IPC_PUNIT_ISPD_CMD_BASE + 0x06)
+
+/* Error codes */
+#define IPC_PUNIT_ERR_SUCCESS			0
+#define IPC_PUNIT_ERR_INVALID_CMD		1
+#define IPC_PUNIT_ERR_INVALID_PARAMETER		2
+#define IPC_PUNIT_ERR_CMD_TIMEOUT		3
+#define IPC_PUNIT_ERR_CMD_LOCKED		4
+#define IPC_PUNIT_ERR_INVALID_VR_ID		5
+#define IPC_PUNIT_ERR_VR_ERR			6
+
+#if IS_ENABLED(CONFIG_INTEL_PUNIT_IPC)
+
+int intel_punit_ipc_simple_command(int cmd, int para1, int para2);
+int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2, u32 *in, u32 *out);
+
+#else
+
+static inline int intel_punit_ipc_simple_command(int cmd,
+						  int para1, int para2)
+{
+	return -EINVAL;
+}
+
+static inline int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2,
+					  u32 *in, u32 *out)
+{
+	return -EINVAL;
+}
+
+#endif /*CONFIG_INTEL_PUNIT_IPC*/
+
+#endif
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 346f1fd..9948369 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -891,4 +891,10 @@ config INTEL_PMC_IPC
 	The PMC is an ARC processor which defines IPC commands for communication
 	with other entities in the CPU.
 
+config INTEL_PUNIT_IPC
+	tristate "Intel P-Unit IPC Driver"
+	---help---
+	  This driver provides support for Intel P-Unit Mailbox IPC mechanism,
+	  which is used to bridge the communications between kernel and P-Unit.
+
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 1051372..eea765f 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -59,3 +59,4 @@ obj-$(CONFIG_INTEL_SMARTCONNECT)	+= intel-smartconnect.o
 obj-$(CONFIG_PVPANIC)           += pvpanic.o
 obj-$(CONFIG_ALIENWARE_WMI)	+= alienware-wmi.o
 obj-$(CONFIG_INTEL_PMC_IPC)	+= intel_pmc_ipc.o
+obj-$(CONFIG_INTEL_PUNIT_IPC)	+= intel_punit_ipc.o
diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
new file mode 100644
index 0000000..2d48bc0
--- /dev/null
+++ b/drivers/platform/x86/intel_punit_ipc.c
@@ -0,0 +1,353 @@
+/*
+ * Driver for the Intel P-Unit Mailbox IPC mechanism
+ *
+ * (C) Copyright 2015 Intel Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * The heart of the P-Unit is the Foxton microcontroller and its firmware,
+ * which provide mailbox interface for power management usage.
+ */
+
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <asm/intel_punit_ipc.h>
+
+/* Mailbox registers */
+#define MAILBOX_DATA_LOW		0x0
+#define MAILBOX_INTERFACE		0x4
+#define		CMD_RUN			(1 << 31)
+#define		CMD_ERRCODE_MASK	0xFF
+#define		CMD_PARA1_SHIFT		8
+#define		CMD_PARA2_SHIFT		16
+#define		CMD_MASK		0xFF
+#define MAILBOX_DATA_HIGH		0x8
+
+#define MAILBOX_REGISTER_SPACE		0x10
+
+#define CMD_TIMEOUT_SECONDS		3
+
+/* Three external mailbox */
+enum mailbox_type {
+	BIOS_MAILBOX,
+	GTDRIVER_MAILBOX,
+	ISPDRIVER_MAILBOX,
+	RESERVED_MAILBOX,
+};
+
+static char *ipc_err_sources[] = {
+	[IPC_PUNIT_ERR_SUCCESS] =
+		"no error",
+	[IPC_PUNIT_ERR_INVALID_CMD] =
+		"invalid command",
+	[IPC_PUNIT_ERR_INVALID_PARAMETER] =
+		"invalid parameter",
+	[IPC_PUNIT_ERR_CMD_TIMEOUT] =
+		"command timeout",
+	[IPC_PUNIT_ERR_CMD_LOCKED] =
+		"command locked",
+	[IPC_PUNIT_ERR_INVALID_VR_ID] =
+		"invalid vr id",
+	[IPC_PUNIT_ERR_VR_ERR] =
+		"vr error",
+};
+
+struct intel_punit_ipc_controller {
+	struct platform_device *pdev;
+	struct mutex lock;
+	void __iomem *base[RESERVED_MAILBOX];
+	struct completion cmd_complete;
+	int irq;
+
+	int cmd;
+	enum mailbox_type type;
+} ipcdev;
+
+static inline u32 ipc_read_status(void)
+{
+	return readl(ipcdev.base[ipcdev.type] + MAILBOX_INTERFACE);
+}
+
+static inline void ipc_write_cmd(u32 cmd)
+{
+	writel(cmd, ipcdev.base[ipcdev.type] + MAILBOX_INTERFACE);
+}
+
+static inline u32 ipc_read_data_low(void)
+{
+	return readl(ipcdev.base[ipcdev.type] + MAILBOX_DATA_LOW);
+}
+
+static inline u32 ipc_read_data_high(void)
+{
+	return readl(ipcdev.base[ipcdev.type] + MAILBOX_DATA_HIGH);
+}
+
+static inline void ipc_write_data_low(u32 data)
+{
+	writel(data, ipcdev.base[ipcdev.type] + MAILBOX_DATA_LOW);
+}
+
+static inline void ipc_write_data_high(u32 data)
+{
+	writel(data, ipcdev.base[ipcdev.type] + MAILBOX_DATA_HIGH);
+}
+
+static int intel_punit_ipc_send_command(u32 cmd)
+{
+	ipcdev.cmd = cmd;
+
+	cmd &= CMD_MASK;
+	if (cmd < IPC_PUNIT_BIOS_CMD_BASE)
+		return -EINVAL;
+	else if (cmd < IPC_PUNIT_GTD_CMD_BASE)
+		ipcdev.type = BIOS_MAILBOX;
+	else if (cmd < IPC_PUNIT_ISPD_CMD_BASE) {
+		ipcdev.type = GTDRIVER_MAILBOX;
+		ipcdev.cmd -= IPC_PUNIT_GTD_CMD_BASE;
+	} else if (cmd < IPC_PUNIT_ISPD_CMD_MAX) {
+		ipcdev.type = ISPDRIVER_MAILBOX;
+		ipcdev.cmd -= IPC_PUNIT_ISPD_CMD_BASE;
+	} else
+		return -EINVAL;
+
+	reinit_completion(&ipcdev.cmd_complete);
+	ipc_write_cmd(ipcdev.cmd);
+
+	return 0;
+}
+
+static int intel_punit_ipc_check_status(void)
+{
+	int loops = CMD_TIMEOUT_SECONDS * USEC_PER_SEC;
+	int errcode;
+	int status;
+
+	if (ipcdev.irq) {
+		if (!wait_for_completion_timeout(
+				&ipcdev.cmd_complete,
+				CMD_TIMEOUT_SECONDS * HZ)) {
+			dev_err(&ipcdev.pdev->dev,
+				"IPC timed out, IPC_CMD=0x%x\n", ipcdev.cmd);
+			return -ETIMEDOUT;
+		}
+	} else {
+		while ((ipc_read_status() & CMD_RUN) && --loops)
+			udelay(1);
+		if (!loops) {
+			dev_err(&ipcdev.pdev->dev,
+				"IPC timed out, IPC_CMD=0x%x\n", ipcdev.cmd);
+			return -ETIMEDOUT;
+		}
+	}
+
+	status = ipc_read_status();
+	errcode = status & CMD_ERRCODE_MASK;
+	if (errcode) {
+		if (errcode < ARRAY_SIZE(ipc_err_sources))
+			dev_err(&ipcdev.pdev->dev,
+				"IPC failed: %s, IPC_STS=0x%x, IPC_CMD=0x%x\n",
+				ipc_err_sources[errcode], status, ipcdev.cmd);
+		else
+			dev_err(&ipcdev.pdev->dev,
+				"IPC failed: unknown err,STS=0x%x, CMD=0x%x\n",
+				status, ipcdev.cmd);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * intel_punit_ipc_simple_command() - Simple IPC command
+ * @cmd:	IPC command code.
+ * @para1:	First 8bit parameter, set 0 if invalid.
+ * @para2:	Second 8bit parameter, set 0 if invalid.
+ *
+ * Send a IPC command to P-Unit when there is no data transaction
+ *
+ * Return:	IPC error code or 0 on success.
+ */
+int intel_punit_ipc_simple_command(int cmd, int para1, int para2)
+{
+	int ret;
+
+	mutex_lock(&ipcdev.lock);
+	ret = intel_punit_ipc_send_command(CMD_RUN |
+					   para2 << CMD_PARA2_SHIFT |
+					   para1 << CMD_PARA1_SHIFT | cmd);
+	if (ret)
+		goto out;
+	ret = intel_punit_ipc_check_status();
+out:
+	mutex_unlock(&ipcdev.lock);
+	return ret;
+}
+EXPORT_SYMBOL(intel_punit_ipc_simple_command);
+
+/**
+ * intel_punit_ipc_command() - IPC command with data and pointers
+ * @cmd:	IPC command code.
+ * @para1:	First 8bit parameter, set 0 if invalid.
+ * @para2:	Second 8bit parameter, set 0 if invalid.
+ * @in:		Input data, 32bit for BIOS cmd, two 32bit for GTD and ISPD.
+ * @out:	Output data.
+ *
+ * Send a IPC command to P-Unit with data transaction
+ *
+ * Return:	IPC error code or 0 on success.
+ */
+int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2, u32 *in, u32 *out)
+{
+	int ret;
+
+	mutex_lock(&ipcdev.lock);
+	ipc_write_data_low(*in);
+	if (ipcdev.type == GTDRIVER_MAILBOX ||
+			ipcdev.type == ISPDRIVER_MAILBOX) {
+		in++;
+		ipc_write_data_high(*in);
+	}
+	ret = intel_punit_ipc_send_command(CMD_RUN |
+					   para2 << CMD_PARA2_SHIFT |
+					   para1 << CMD_PARA1_SHIFT | cmd);
+	if (ret)
+		goto out;
+	ret = intel_punit_ipc_check_status();
+	if (ret)
+		goto out;
+	*out = ipc_read_data_low();
+	if (ipcdev.type == GTDRIVER_MAILBOX ||
+			ipcdev.type == ISPDRIVER_MAILBOX) {
+		out++;
+		*out = ipc_read_data_high();
+	}
+out:
+	mutex_unlock(&ipcdev.lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(intel_punit_ipc_command);
+
+static irqreturn_t intel_punit_ioc(int irq, void *dev_id)
+{
+	complete(&ipcdev.cmd_complete);
+	return IRQ_HANDLED;
+}
+
+static int intel_punit_get_bars(struct platform_device *pdev)
+{
+	struct resource *res0, *res1;
+	void __iomem *addr;
+	int size;
+
+	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res0) {
+		dev_err(&pdev->dev, "Failed to get iomem resource\n");
+		return -EINVAL;
+	}
+	size = resource_size(res0);
+	if (!devm_request_mem_region(&pdev->dev, res0->start,
+				     size, pdev->name)) {
+		dev_err(&pdev->dev, "Failed to request iomem resouce\n");
+		return -EBUSY;
+	}
+
+	res1 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res1) {
+		dev_err(&pdev->dev, "Failed to get iomem resource1\n");
+		return -EINVAL;
+	}
+	size = resource_size(res1);
+	if (!devm_request_mem_region(&pdev->dev, res1->start,
+				     size, pdev->name)) {
+		dev_err(&pdev->dev, "Failed to request iomem resouce1\n");
+		return -EBUSY;
+	}
+
+	addr = ioremap_nocache(res0->start,
+			       resource_size(res0) + resource_size(res1));
+	if (!addr) {
+		dev_err(&pdev->dev, "Failed to ioremap ipc base\n");
+		return  -ENOMEM;
+	}
+	ipcdev.base[BIOS_MAILBOX] = addr;
+	addr += MAILBOX_REGISTER_SPACE;
+	ipcdev.base[GTDRIVER_MAILBOX] = addr;
+	addr += MAILBOX_REGISTER_SPACE;
+	ipcdev.base[ISPDRIVER_MAILBOX] = addr;
+
+	return 0;
+}
+
+static int intel_punit_ipc_probe(struct platform_device *pdev)
+{
+	int irq, ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ipcdev.irq = 0;
+		dev_warn(&pdev->dev, "Invalid IRQ\n");
+	} else {
+		if (devm_request_irq(&pdev->dev, irq, intel_punit_ioc,
+				     IRQF_NO_SUSPEND, "intel_punit_ipc",
+				     &ipcdev)) {
+			dev_err(&pdev->dev, "Failed to request irq: %d\n", irq);
+			return -EBUSY;
+		}
+		ipcdev.irq = irq;
+	}
+
+	ret = intel_punit_get_bars(pdev);
+	if (ret)
+		return ret;
+
+	ipcdev.pdev = pdev;
+	mutex_init(&ipcdev.lock);
+	init_completion(&ipcdev.cmd_complete);
+
+	return ret;
+}
+
+static int intel_punit_ipc_remove(struct platform_device *pdev)
+{
+	iounmap(ipcdev.base[BIOS_MAILBOX]);
+
+	return 0;
+}
+
+static const struct acpi_device_id punit_ipc_acpi_ids[] = {
+	{"INT34D4", 0}
+};
+
+static struct platform_driver intel_punit_ipc_driver = {
+	.probe = intel_punit_ipc_probe,
+	.remove = intel_punit_ipc_remove,
+	.driver = {
+		.name = "intel_punit_ipc",
+		.acpi_match_table = ACPI_PTR(punit_ipc_acpi_ids),
+	},
+};
+
+static int __init intel_punit_ipc_init(void)
+{
+	return platform_driver_register(&intel_punit_ipc_driver);
+}
+
+static void __exit intel_punit_ipc_exit(void)
+{
+	platform_driver_unregister(&intel_punit_ipc_driver);
+}
+
+MODULE_AUTHOR("Zha Qipeng <qipeng.zha@intel.com>");
+MODULE_DESCRIPTION("Intel P-Unit IPC driver");
+MODULE_LICENSE("GPL v2");
+
+/* Some modules are dependent on this, so init earlier */
+fs_initcall(intel_punit_ipc_init);
+module_exit(intel_punit_ipc_exit);
-- 
1.8.3.2
