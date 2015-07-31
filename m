From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH] platform:x86: add Intel Punit mailbox IPC driver
Date: Fri, 31 Jul 2015 23:58:56 +0800
Message-ID: <1438358336-79179-1-git-send-email-qipeng.zha@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:11198 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752535AbbGaHzW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 31 Jul 2015 03:55:22 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org

This driver provides support for Punit mailbox IPC on Intel platforms.
The heart of the Punit is the Foxton microcontroller and its firmware,
which provide mailbox interface for power management usage.

Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
---
 arch/x86/include/asm/intel_punit_ipc.h | 101 +++++++++
 drivers/platform/x86/Kconfig           |   6 +
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/intel_punit_ipc.c | 388 +++++++++++++++++++++++++++++++++
 4 files changed, 496 insertions(+)
 create mode 100644 arch/x86/include/asm/intel_punit_ipc.h
 create mode 100644 drivers/platform/x86/intel_punit_ipc.c

diff --git a/arch/x86/include/asm/intel_punit_ipc.h b/arch/x86/include/asm/intel_punit_ipc.h
new file mode 100644
index 0000000..08e3e14
--- /dev/null
+++ b/arch/x86/include/asm/intel_punit_ipc.h
@@ -0,0 +1,101 @@
+#ifndef _ASM_X86_INTEL_PUNIT_IPC_H_
+#define  _ASM_X86_INTEL_PUNIT_IPC_H_
+
+/* Commands supported on GLM core, are handled by different bars,
+ * unify these commands together here
+ */
+#define IPC_BIOS_PUNIT_CMD_BASE				0x00
+#define IPC_GTD_PUNIT_CMD_BASE				0x20
+#define IPC_ISPD_PUNIT_CMD_BASE				0x40
+
+/* BIOS => Pcode commands */
+#define IPC_BIOS_PUNIT_CMD_ZERO			(IPC_BIOS_PUNIT_CMD_BASE + 0x00)
+#define IPC_BIOS_PUNIT_CMD_VR_INTERFACE		(IPC_BIOS_PUNIT_CMD_BASE + 0x01)
+#define IPC_BIOS_PUNIT_CMD_READ_PCS		(IPC_BIOS_PUNIT_CMD_BASE + 0x02)
+#define IPC_BIOS_PUNIT_CMD_WRITE_PCS		(IPC_BIOS_PUNIT_CMD_BASE + 0x03)
+#define IPC_BIOS_PUNIT_CMD_READ_PCU_CONFIG	(IPC_BIOS_PUNIT_CMD_BASE + 0x04)
+#define IPC_BIOS_PUNIT_CMD_WRITE_PCU_CONFIG	(IPC_BIOS_PUNIT_CMD_BASE + 0x05)
+#define IPC_BIOS_PUNIT_CMD_READ_PL1_SETTING	(IPC_BIOS_PUNIT_CMD_BASE + 0x06)
+#define IPC_BIOS_PUNIT_CMD_WRITE_PL1_SETTING	(IPC_BIOS_PUNIT_CMD_BASE + 0x07)
+#define IPC_BIOS_PUNIT_CMD_TRIGGER_VDD_RAM	(IPC_BIOS_PUNIT_CMD_BASE + 0x08)
+#define IPC_BIOS_PUNIT_CMD_READ_TELE_INFO	(IPC_BIOS_PUNIT_CMD_BASE + 0x09)
+#define IPC_BIOS_PUNIT_CMD_READ_TELE_TRACE_CTRL	(IPC_BIOS_PUNIT_CMD_BASE + 0x0a)
+#define IPC_BIOS_PUNIT_CMD_WRITE_TELE_TRACE_CTRL \
+						(IPC_BIOS_PUNIT_CMD_BASE + 0x0b)
+#define IPC_BIOS_PUNIT_CMD_READ_TELE_EVENT_CTRL	(IPC_BIOS_PUNIT_CMD_BASE + 0x0c)
+#define IPC_BIOS_PUNIT_CMD_WRITE_TELE_EVENT_CTRL \
+						(IPC_BIOS_PUNIT_CMD_BASE + 0x0d)
+#define IPC_BIOS_PUNIT_CMD_READ_TELE_TRACE	(IPC_BIOS_PUNIT_CMD_BASE + 0x0e)
+#define IPC_BIOS_PUNIT_CMD_WRITE_TELE_TRACE	(IPC_BIOS_PUNIT_CMD_BASE + 0x0f)
+#define IPC_BIOS_PUNIT_CMD_READ_TELE_EVENT	(IPC_BIOS_PUNIT_CMD_BASE + 0x10)
+#define IPC_BIOS_PUNIT_CMD_WRITE_TELE_EVENT	(IPC_BIOS_PUNIT_CMD_BASE + 0x11)
+#define IPC_BIOS_PUNIT_CMD_READ_MODULE_TEMP	(IPC_BIOS_PUNIT_CMD_BASE + 0x12)
+#define IPC_BIOS_PUNIT_CMD_RESERVED		(IPC_BIOS_PUNIT_CMD_BASE + 0x13)
+#define IPC_BIOS_PUNIT_CMD_READ_VOLTAGE_OVER	(IPC_BIOS_PUNIT_CMD_BASE + 0x14)
+#define IPC_BIOS_PUNIT_CMD_WRITE_VOLTAGE_OVER	(IPC_BIOS_PUNIT_CMD_BASE + 0x15)
+#define IPC_BIOS_PUNIT_CMD_READ_RATIO_OVER	(IPC_BIOS_PUNIT_CMD_BASE + 0x16)
+#define IPC_BIOS_PUNIT_CMD_WRITE_RATIO_OVER	(IPC_BIOS_PUNIT_CMD_BASE + 0x17)
+#define IPC_BIOS_PUNIT_CMD_READ_VF_GL_CTRL	(IPC_BIOS_PUNIT_CMD_BASE + 0x18)
+#define IPC_BIOS_PUNIT_CMD_WRITE_VF_GL_CTRL	(IPC_BIOS_PUNIT_CMD_BASE + 0x19)
+#define IPC_BIOS_PUNIT_CMD_READ_FM_SOC_TEMP_THRESH \
+						(IPC_BIOS_PUNIT_CMD_BASE + 0x1a)
+#define IPC_BIOS_PUNIT_CMD_WRITE_FM_SOC_TEMP_THRESH \
+						(IPC_BIOS_PUNIT_CMD_BASE + 0x1b)
+
+/*GT Driver => Pcode commands*/
+#define IPC_GTD_PUNIT_CMD_ZERO			(IPC_GTD_PUNIT_CMD_BASE + 0x00)
+#define IPC_GTD_PUNIT_CMD_CONFIG		(IPC_GTD_PUNIT_CMD_BASE + 0x01)
+#define IPC_GTD_PUNIT_CMD_READ_ICCP_LIC_CDYN_SCAL \
+						(IPC_GTD_PUNIT_CMD_BASE + 0x02)
+#define IPC_GTD_PUNIT_CMD_WRITE_ICCP_LIC_CDYN_SCAL \
+						(IPC_GTD_PUNIT_CMD_BASE + 0x03)
+#define IPC_GTD_PUNIT_CMD_GET_WM_VAL		(IPC_GTD_PUNIT_CMD_BASE + 0x06)
+#define IPC_GTD_PUNIT_CMD_WRITE_CONFIG_WISHREQ	(IPC_GTD_PUNIT_CMD_BASE + 0x07)
+#define IPC_GTD_PUNIT_CMD_READ_REQ_DUTY_CYCLE	(IPC_GTD_PUNIT_CMD_BASE + 0x16)
+#define IPC_GTD_PUNIT_CMD_DIS_VOL_FREQ_CHANGE_REQUEST \
+						(IPC_GTD_PUNIT_CMD_BASE + 0x17)
+#define IPC_GTD_PUNIT_CMD_DYNA_DUTY_CYCLE_CTRL	(IPC_GTD_PUNIT_CMD_BASE + 0x1a)
+#define IPC_GTD_PUNIT_CMD_DYNA_DUTY_CYCLE_TUNING \
+						(IPC_GTD_PUNIT_CMD_BASE + 0x1c)
+
+/* ISP Driver => Pcode commands */
+#define IPC_ISPD_PUNIT_CMD_ZERO			(IPC_ISPD_PUNIT_CMD_BASE + 0x00)
+#define IPC_ISPD_PUNIT_CMD_CONFIG		(IPC_ISPD_PUNIT_CMD_BASE + 0x01)
+#define IPC_ISPD_PUNIT_CMD_GET_ISP_LTR_VAL	(IPC_ISPD_PUNIT_CMD_BASE + 0x02)
+#define IPC_ISPD_PUNIT_CMD_ACCESS_IU_FREQ_BOUNDS \
+						(IPC_ISPD_PUNIT_CMD_BASE + 0x03)
+#define IPC_ISPD_PUNIT_CMD_READ_CDYN_LEVEL	(IPC_ISPD_PUNIT_CMD_BASE + 0x04)
+#define IPC_ISPD_PUNIT_CMD_WRITE_CDYN_LEVEL	(IPC_ISPD_PUNIT_CMD_BASE + 0x05)
+#define IPC_ISPD_PUNIT_CMD_MAX			(IPC_ISPD_PUNIT_CMD_BASE + 0x06)
+
+/* Error codes */
+#define IPC_ERR_SUCCESS				0
+#define IPC_ERR_INVALID_CMD			1
+#define IPC_ERR_INVALID_PARAMETER		2
+#define IPC_ERR_CMD_TIMEOUT			3
+#define IPC_ERR_CMD_LOCKED			4
+#define IPC_ERR_INVALID_VR_ID			5
+#define IPC_ERR_VR_ERR				6
+
+#if IS_ENABLED(CONFIG_INTEL_PUNIT_IPC)
+
+int intel_punit_ipc_simple_command(int cmd, int para1, int para2);
+int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2, u32 *in, u32 *out);
+
+#else
+
+static intline int intel_punit_ipc_simple_command(int cmd,
+						  int para1, int para2);
+{
+	return -EINVAL;
+}
+
+static inline int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2,
+					  u32 *in, u32 *out);
+{
+	return -EINVAL;
+}
+
+#endif /*CONFIG_INTEL_PUNIT_IPC*/
+
+#endif
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 346f1fd..42ada9b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -891,4 +891,10 @@ config INTEL_PMC_IPC
 	The PMC is an ARC processor which defines IPC commands for communication
 	with other entities in the CPU.
 
+config INTEL_PUNIT_IPC
+	tristate "Intel PUNIT IPC Driver"
+	default y
+	---help---
+	  IPC is used to bridge the communications between kernel and PUNIT
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
index 0000000..78cb794
--- /dev/null
+++ b/drivers/platform/x86/intel_punit_ipc.c
@@ -0,0 +1,388 @@
+/*
+ * intel_punit_ipc.c: Driver for the Intel Punit Mailbox IPC mechanism
+ *
+ * (C) Copyright 2015 Intel Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * The heart of the Punit is the Foxton microcontroller and its firmware,
+ * which provide mailbox interface for power management usage.
+ */
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/pm.h>
+#include <linux/acpi.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/bitops.h>
+#include <linux/atomic.h>
+#include <linux/notifier.h>
+#include <linux/suspend.h>
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
+struct intel_punit_ipc_controller {
+	struct platform_device *pdev;
+	struct mutex lock;
+	void __iomem *base[RESERVED_MAILBOX];
+	struct completion cmd_complete;
+	int irq;
+
+	int cmd;
+	enum mailbox_type type;
+};
+
+static char *ipc_err_sources[] = {
+	[IPC_ERR_SUCCESS] =
+		"no error",
+	[IPC_ERR_INVALID_CMD] =
+		"invalid command",
+	[IPC_ERR_INVALID_PARAMETER] =
+		"invalid parameter",
+	[IPC_ERR_CMD_TIMEOUT] =
+		"command timeout",
+	[IPC_ERR_CMD_LOCKED] =
+		"command locked",
+	[IPC_ERR_INVALID_VR_ID] =
+		"invalid vr id",
+	[IPC_ERR_VR_ERR] =
+		"vr error",
+};
+
+static struct intel_punit_ipc_controller ipcdev;
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
+static int intel_punit_init_cmd(u32 cmd)
+{
+	cmd &= CMD_MASK;
+	if (cmd < IPC_BIOS_PUNIT_CMD_BASE)
+		return -EINVAL;
+	else if (cmd < IPC_GTD_PUNIT_CMD_BASE)
+		ipcdev.type = BIOS_MAILBOX;
+	else if (cmd < IPC_ISPD_PUNIT_CMD_BASE)
+		ipcdev.type = GTDRIVER_MAILBOX;
+	else if (cmd < IPC_ISPD_PUNIT_CMD_MAX)
+		ipcdev.type = ISPDRIVER_MAILBOX;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int intel_punit_ipc_send_command(u32 cmd)
+{
+	int ret;
+
+	ret = intel_punit_init_cmd(cmd);
+	if (ret)
+		return ret;
+	ipcdev.cmd = cmd;
+	reinit_completion(&ipcdev.cmd_complete);
+	ipc_write_cmd(cmd);
+	return 0;
+}
+
+static int intel_punit_ipc_check_status(void)
+{
+	int loops = CMD_TIMEOUT_SECONDS * USEC_PER_SEC;
+	int ret = 0;
+	int status;
+	int errcode;
+
+	if (ipcdev.irq) {
+		if (0 == wait_for_completion_timeout(
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
+		ret = -EIO;
+		if (errcode < ARRAY_SIZE(ipc_err_sources))
+			dev_err(&ipcdev.pdev->dev,
+				"IPC failed: %s, IPC_STS=0x%x, IPC_CMD=0x%x\n",
+				ipc_err_sources[errcode], status, ipcdev.cmd);
+		else
+			dev_err(&ipcdev.pdev->dev,
+				"IPC failed: unknown err,STS=0x%x, CMD=0x%x\n",
+				status, ipcdev.cmd);
+	}
+
+	return ret;
+}
+
+/**
+ * intel_punit_ipc_simple_command() - Simple IPC command
+ * @cmd:	IPC command code.
+ * @para1:	First 8bit parameter, set 0 if invalid.
+ * @para2:	Second 8bit parameter, set 0 if invalid.
+ *
+ * Send a IPC command to Punit when there is no data transaction
+ *
+ * Return:	an IPC error code or 0 on success.
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
+ * Send a IPC command to Punit with data transaction
+ *
+ * Return:	an IPC error code or 0 on success.
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
+	int ret;
+
+	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res0) {
+		dev_err(&pdev->dev, "Failed to get iomem resource\n");
+		return -EINVAL;
+	}
+	size = resource_size(res0);
+	if (!request_mem_region(res0->start, size, pdev->name)) {
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
+	if (!request_mem_region(res1->start, size, pdev->name)) {
+		dev_err(&pdev->dev, "Failed to request iomem resouce1\n");
+		ret = -EBUSY;
+		goto err_res1;
+	}
+
+	addr = ioremap_nocache(res0->start,
+			       resource_size(res0) + resource_size(res1));
+	if (!addr) {
+		dev_err(&pdev->dev, "Failed to ioremap ipc base\n");
+		ret = -ENOMEM;
+		goto err_map;
+	}
+	ipcdev.base[BIOS_MAILBOX] = addr;
+	addr += MAILBOX_REGISTER_SPACE;
+	ipcdev.base[GTDRIVER_MAILBOX] = addr;
+	addr += MAILBOX_REGISTER_SPACE;
+	ipcdev.base[ISPDRIVER_MAILBOX] = addr;
+
+	return 0;
+
+err_map:
+	release_mem_region(res1->start, resource_size(res1));
+err_res1:
+	release_mem_region(res0->start, resource_size(res0));
+	return ret;
+}
+
+static int intel_punit_ipc_probe(struct platform_device *pdev)
+{
+	int irq;
+	int ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ipcdev.irq = 0;
+		dev_warn(&pdev->dev, "Could not get irq number\n");
+	} else {
+		if (request_irq(irq, intel_punit_ioc, IRQF_NO_SUSPEND,
+				"intel_punit_ipc", &ipcdev)) {
+			dev_err(&pdev->dev, "request irq %d\n", irq);
+			return -EBUSY;
+		}
+		ipcdev.irq = irq;
+	}
+
+	ret = intel_punit_get_bars(pdev);
+	if (ret) {
+		if (ipcdev.irq)
+			free_irq(ipcdev.irq, &ipcdev);
+		return ret;
+	}
+
+	ipcdev.pdev = pdev;
+	mutex_init(&ipcdev.lock);
+	init_completion(&ipcdev.cmd_complete);
+	return ret;
+}
+
+static int intel_punit_ipc_remove(struct platform_device *pdev)
+{
+	struct resource *res;
+
+	if (ipcdev.irq)
+		free_irq(ipcdev.irq, &ipcdev);
+	iounmap(ipcdev.base[BIOS_MAILBOX]);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res)
+		release_mem_region(res->start, resource_size(res));
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res)
+		release_mem_region(res->start, resource_size(res));
+	return 0;
+}
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id punit_ipc_acpi_ids[] = {
+	{"INT34D4", 0}
+};
+#endif
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
+MODULE_DESCRIPTION("Intel Punit IPC driver");
+MODULE_LICENSE("GPL");
+
+/* Some modules are dependent on this, so init earlier */
+fs_initcall(intel_punit_ipc_init);
+module_exit(intel_punit_ipc_exit);
-- 
1.8.3.2
