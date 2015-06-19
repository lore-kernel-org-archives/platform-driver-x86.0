From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5] platform:x86: add Intel Broxton PMC IPC driver
Date: Fri, 19 Jun 2015 16:35:34 -0700
Message-ID: <20150619233534.GB70769@vmdeb7>
References: <1433346433-379-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41860 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752334AbbFSXfg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 19 Jun 2015 19:35:36 -0400
Content-Disposition: inline
In-Reply-To: <1433346433-379-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, fei.yang@intel.com, huiquan.zhong@intel.com, jason.cj.chen@intel.com, qi.zheng@intel.com

On Wed, Jun 03, 2015 at 11:47:13PM +0800, qipeng.zha wrote:
> From: "qipeng.zha" <qipeng.zha@intel.com>
> 
> This driver provides support for PMC control on Broxton platforms,
> PMC is ARC processor which defined some IPC commands for communication
> with other entities running in IA
> 
> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>


Sorry for the long delay here, I needed a block of time to review.

I had queued this to testing with some grammatical fixes, but then
ran into some problems and am going to need you to resend.

Please incorporate the grammatical fixes below as well as the few functional
changes.

In particular, if built with ARCH=i386, you generate 4 warnings.

> 
> Changes for v5:
>  add credit to intel_scu_ipc.c in driver description;
>  replace Fail with Failed in error messages;
>  fix typos;
>  remove read access of attribute device;
>  add comment for fs_initcall.
> 
> Changes for before versions:
>  fix compile errors when build as module;
>  fix typos;
>  use iplock mutex to sync access of command APIs;
>  confirm to be applicable of regmap APIs;
>  add comments for exported APIs;
>  order local variable declaration.
> ---

In the future, place the changelog (v5, v4, v3, etc.) below the "---". This
automatically gets dropped from the git commit along with the diffstat. This
information is only useful during the review process and should not be part of
the commit message.

>  arch/x86/include/asm/intel_pmc_ipc.h |  82 ++++
>  drivers/platform/x86/Kconfig         |   7 +
>  drivers/platform/x86/Makefile        |   1 +
>  drivers/platform/x86/intel_pmc_ipc.c | 770 +++++++++++++++++++++++++++++++++++
>  4 files changed, 860 insertions(+)
>  create mode 100644 arch/x86/include/asm/intel_pmc_ipc.h
>  create mode 100644 drivers/platform/x86/intel_pmc_ipc.c
> 
> diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
> new file mode 100644
> index 0000000..200ec2e
> --- /dev/null
> +++ b/arch/x86/include/asm/intel_pmc_ipc.h
> @@ -0,0 +1,82 @@
> +#ifndef _ASM_X86_INTEL_PMC_IPC_H_
> +#define  _ASM_X86_INTEL_PMC_IPC_H_
> +
> +/* Commands */
> +#define PMC_IPC_PMIC_ACCESS		0xFF
> +#define		PMC_IPC_PMIC_ACCESS_READ	0x0
> +#define		PMC_IPC_PMIC_ACCESS_WRITE	0x1
> +#define PMC_IPC_USB_PWR_CTRL		0xF0
> +#define PMC_IPC_PMIC_BLACKLIST_SEL	0xEF
> +#define PMC_IPC_PHY_CONFIG		0xEE
> +#define PMC_IPC_NORTHPEAK_CTRL		0xED
> +#define PMC_IPC_PM_DEBUG		0xEC
> +#define PMC_IPC_PMC_TELEMTRY		0xEB
> +#define PMC_IPC_PMC_FW_MSG_CTRL		0xEA
> +
> +/* IPC return code */
> +#define IPC_ERR_NONE			0
> +#define IPC_ERR_CMD_NOT_SUPPORTED	1
> +#define IPC_ERR_CMD_NOT_SERVICED	2
> +#define IPC_ERR_UNABLE_TO_SERVICE	3
> +#define IPC_ERR_CMD_INVALID		4
> +#define IPC_ERR_CMD_FAILED		5
> +#define IPC_ERR_EMSECURITY		6
> +#define IPC_ERR_UNSIGNEDKERNEL		7
> +
> +#if IS_ENABLED(CONFIG_INTEL_PMC_IPC)
> +
> +/*
> + * intel_pmc_ipc_simple_command
> + * @cmd: command
> + * @sub: sub type
> + */
> +int intel_pmc_ipc_simple_command(int cmd, int sub);
> +
> +/*
> + * intel_pmc_ipc_raw_cmd
> + * @cmd: command
> + * @sub: sub type
> + * @in: input data
> + * @inlen: input length in bytes
> + * @out: output data
> + * @outlen: output length in dwords
> + * @sptr: data writing to SPTR register
> + * @dptr: data writing to DPTR register
> + */
> +int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen,
> +		u32 *out, u32 outlen, u32 dptr, u32 sptr);
> +
> +/*
> + * intel_pmc_ipc_command
> + * @cmd: command
> + * @sub: sub type
> + * @in: input data
> + * @inlen: input length in bytes
> + * @out: output data
> + * @outlen: output length in dwords
> + */
> +int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
> +		u32 *out, u32 outlen);
> +
> +#else
> +
> +static inline int intel_pmc_ipc_simple_command(int cmd, int sub)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen,
> +		u32 *out, u32 outlen, u32 dptr, u32 sptr)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
> +		u32 *out, u32 outlen)
> +{
> +	return -EINVAL;
> +}
> +
> +#endif /*CONFIG_INTEL_PMC_IPC*/
> +
> +#endif
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9752761..4eb15eb 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -884,4 +884,11 @@ config PVPANIC
>  	  a paravirtualized device provided by QEMU; it lets a virtual machine
>  	  (guest) communicate panic events to the host.
>  
> +config INTEL_PMC_IPC
> +	tristate "Intel PMC IPC Driver"
> +	---help---
> +	This driver provides support for PMC control on some Intel platforms,
> +	PMC is ARC processor which defined some IPC commands for communication
> +	with other entities which running in IA.

I've reworded as:

This driver provides support for PMC control on some Intel platforms.
The PMC is an ARC processor which defines IPC commands for communication
with other entities in the CPU.

> +
>  endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index f82232b..1051372 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -58,3 +58,4 @@ obj-$(CONFIG_INTEL_SMARTCONNECT)	+= intel-smartconnect.o
>  
>  obj-$(CONFIG_PVPANIC)           += pvpanic.o
>  obj-$(CONFIG_ALIENWARE_WMI)	+= alienware-wmi.o
> +obj-$(CONFIG_INTEL_PMC_IPC)	+= intel_pmc_ipc.o
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> new file mode 100644
> index 0000000..011fb75
> --- /dev/null
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -0,0 +1,770 @@
> +/*
> + * intel_pmc_ipc.c: Driver for the Intel PMC IPC mechanism
> + *
> + * (C) Copyright 2014 Intel Corporation
> + *
> + * This driver is based on Intel SCU IPC driver(intel_scu_opc.c) by
> + *     Sreedhara DS <sreedhara.ds@intel.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; version 2
> + * of the License.
> + *
> + * PMC running in ARC processor communicates with other entity running in IA
> + * core through IPC mechanism which in turn messaging between IA core ad PMC.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/device.h>
> +#include <linux/pm.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm_qos.h>
> +#include <linux/kernel.h>
> +#include <linux/bitops.h>
> +#include <linux/sched.h>
> +#include <linux/atomic.h>
> +#include <linux/notifier.h>
> +#include <linux/suspend.h>
> +#include <linux/acpi.h>
> +#include <asm/intel_pmc_ipc.h>
> +#include <linux/mfd/lpc_ich.h>
> +
> +/*
> + * IPC registers
> + * The IA write to IPC_CMD command register triggers an interrupt to the ARC,
> + * The ARC handles the interrupt and services it, writing optional data to
> + * the IPC1 registers, updates the IPC_STS response register with the status.
> + */
> +#define IPC_CMD			0x0
> +#define		IPC_CMD_MSI		0x100
> +#define		IPC_CMD_SIZE		16
> +#define		IPC_CMD_SUBCMD		12
> +#define IPC_STATUS		0x04
> +#define		IPC_STATUS_IRQ		0x4
> +#define		IPC_STATUS_ERR		0x2
> +#define		IPC_STATUS_BUSY		0x1
> +#define IPC_SPTR		0x08
> +#define IPC_DPTR		0x0C
> +#define IPC_WRITE_BUFFER	0x80
> +#define IPC_READ_BUFFER		0x90
> +
> +#define IPC_LOOP_CNT		3000000
> +#define IPC_MAX_SEC		3
> +
> +#define IPC_TRIGGER_MODE_IRQ		true
> +
> +/* exported resources from IFWI */
> +#define PLAT_RESOURCE_IPC_INDEX		0
> +#define PLAT_RESOURCE_IPC_SIZE		0x1000
> +#define PLAT_RESOURCE_GCR_SIZE		0x1000
> +#define PLAT_RESOURCE_PUNIT_DATA_INDEX	1
> +#define PLAT_RESOURCE_PUNIT_INTER_INDEX	2
> +#define PLAT_RESOURCE_ACPI_IO_INDEX	0
> +
> +/*
> + * BIOS don't create ACPI device for each PMC function,
> + * but export multi resources on one ACPI device(IPC) for
> + * multi functions, so this driver is responsible to create
> + * platform device and to export resource for those functions
> + */

Reworded as:

/*
 * BIOS does not create an ACPI device for each PMC function,
 * but exports multiple resources from one ACPI device(IPC) for
 * multiple functions. This driver is responsible to create a
 * platform device and to export resources for those functions.
 */


> +#define TCO_DEVICE_NAME			"iTCO_wdt"
> +#define SMI_EN_OFFSET			0x30
> +#define SMI_EN_SIZE			4
> +#define TCO_BASE_OFFSET			0x60
> +#define TCO_REGS_SIZE			16
> +#define PUNIT_DEVICE_NAME		"intel_punit_ipc"
> +
> +static const int iTCO_version = 3;
> +
> +static struct intel_pmc_ipc_dev {
> +	struct device *dev;
> +	void __iomem *ipc_base;
> +	bool irq_mode;
> +	int irq;
> +	int cmd;
> +	struct completion cmd_complete;
> +
> +	/* Below bars in PMC share same ACPI device with IPC */

Reworded as:

/* The following PMC BARs share the same ACPI device with the IPC */

> +	void *acpi_io_base;
> +	int acpi_io_size;
> +	struct platform_device *tco_dev;
> +
> +	/* gcr */
> +	void __iomem *gcr_base;
> +	int gcr_size;
> +
> +	/* punit */
> +	void *punit_base;
> +	int punit_size;
> +	void *punit_base2;
> +	int punit_size2;
> +	struct platform_device *punit_dev;
> +} ipcdev;
> +
> +static char *ipc_err_sources[] = {
> +	[IPC_ERR_NONE] =
> +		"no error",
> +	[IPC_ERR_CMD_NOT_SUPPORTED] =
> +		"command not supported",
> +	[IPC_ERR_CMD_NOT_SERVICED] =
> +		"command not serviced",
> +	[IPC_ERR_UNABLE_TO_SERVICE] =
> +		"unable to service",
> +	[IPC_ERR_CMD_INVALID] =
> +		"command invalid",
> +	[IPC_ERR_CMD_FAILED] =
> +		"command failed",
> +	[IPC_ERR_EMSECURITY] =
> +		"Invalid Battery",
> +	[IPC_ERR_UNSIGNEDKERNEL] =
> +		"Unsigned kernel",
> +};
> +
> +/* Prevent multiple call to PMC */

/* Prevent concurrent calls to the PMC */

> +static DEFINE_MUTEX(ipclock);
> +
> +static inline void ipc_send_command(u32 cmd)
> +{
> +	ipcdev.cmd = cmd;
> +	if (ipcdev.irq_mode) {
> +		reinit_completion(&ipcdev.cmd_complete);
> +		cmd |= IPC_CMD_MSI;
> +	}
> +	writel(cmd, ipcdev.ipc_base + IPC_CMD);
> +}
> +
> +static inline u32 ipc_read_status(void)
> +{
> +	return readl(ipcdev.ipc_base + IPC_STATUS);
> +}
> +
> +/*
> + * 16-byte buffer for sending data associated with IPC command
> + * Size of the data is specified in the IPC_CMD[size]
> + */

This bit is rather unclear... reworded as:

/*
 * 16-byte buffer for sending data associated with IPC command.
 * Size of the data is specified by IPC_CMD[size].
 */

> +static inline void ipc_data_writel(u32 data, u32 offset)
> +{
> +	writel(data, ipcdev.ipc_base + IPC_WRITE_BUFFER + offset);

I'm thinking some input validation of offset is in order here, especially for
the write.

> +}
> +
> +static inline u8 ipc_data_readb(u32 offset)
> +{
> +	return readb(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
> +}
> +
> +static inline u32 ipc_data_readl(u32 offset)
> +{
> +	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
> +}
> +
> +int intel_pmc_ipc_check_status(void)
> +{
> +	int status;
> +	int ret = 0;
> +
> +	if (ipcdev.irq_mode) {
> +		if (0 == wait_for_completion_timeout(
> +				&ipcdev.cmd_complete, IPC_MAX_SEC * HZ))
> +			ret = -ETIMEDOUT;
> +	} else {
> +		int loop_count = IPC_LOOP_CNT;
> +
> +		while ((ipc_read_status() & IPC_STATUS_BUSY) && --loop_count)
> +			udelay(1);
> +		if (loop_count == 0)
> +			ret = -ETIMEDOUT;
> +	}
> +
> +	status = ipc_read_status();
> +	if (ret == -ETIMEDOUT) {
> +		dev_err(ipcdev.dev,
> +			"IPC timed out, TS=0x%x, CMD=0x%x\n",
> +			status, ipcdev.cmd);
> +		return ret;
> +	}
> +
> +	if (status & IPC_STATUS_ERR) {
> +		int i;
> +
> +		ret = -EIO;
> +		i = (status >> IPC_CMD_SIZE) & 0xFF;
> +		if (i < ARRAY_SIZE(ipc_err_sources))
> +			dev_err(ipcdev.dev,
> +				"IPC failed: %s, STS=0x%x, CMD=0x%x\n",
> +				ipc_err_sources[i], status, ipcdev.cmd);
> +		else
> +			dev_err(ipcdev.dev,
> +				"IPC failed: unknown, STS=0x%x, CMD=0x%x\n",
> +				 status, ipcdev.cmd);
> +		if ((i == IPC_ERR_UNSIGNEDKERNEL) || (i == IPC_ERR_EMSECURITY))
> +			ret = -EACCES;
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * intel_pmc_ipc_simple_command
> + * @cmd: command
> + * @sub: sub type
> + */
> +int intel_pmc_ipc_simple_command(int cmd, int sub)
> +{
> +	int ret;
> +
> +	mutex_lock(&ipclock);
> +	if (ipcdev.dev == NULL) {
> +		mutex_unlock(&ipclock);
> +		return -ENODEV;
> +	}
> +	ipc_send_command(sub << IPC_CMD_SUBCMD | cmd);
> +	ret = intel_pmc_ipc_check_status();
> +	mutex_unlock(&ipclock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(intel_pmc_ipc_simple_command);
> +
> +/*
> + * intel_pmc_ipc_raw_cmd
> + * @cmd: command
> + * @sub: sub type
> + * @in: input data
> + * @inlen: input length in bytes
> + * @out: output data
> + * @outlen: output length in dwords
> + * @sptr: data writing to SPTR register
> + * @dptr: data writing to DPTR register
> + */
> +int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen, u32 *out,
> +		u32 outlen, u32 dptr, u32 sptr)

Indented second line to align with start of arg list

> +{
> +	u32 wbuf[4] = { 0 };
> +	int ret;
> +	int i;
> +
> +	if (inlen > 16)
> +		return -EINVAL;
> +
> +	mutex_lock(&ipclock);
> +	if (ipcdev.dev == NULL) {
> +		mutex_unlock(&ipclock);
> +		return -ENODEV;
> +	}
> +	memcpy(wbuf, in, inlen);
> +	writel(dptr, ipcdev.ipc_base + IPC_DPTR);
> +	writel(sptr, ipcdev.ipc_base + IPC_SPTR);
> +	/* The input data register is 32bit register and inlen is in Byte */
> +	for (i = 0; i < ((inlen + 3) / 4); i++)
> +		ipc_data_writel(wbuf[i], 4 * i);
> +	ipc_send_command((inlen << IPC_CMD_SIZE) |
> +			(sub << IPC_CMD_SUBCMD) | cmd);
> +	ret = intel_pmc_ipc_check_status();
> +	if (!ret) {
> +		/* out is read from 32bit register and outlen is in 32bit */
> +		for (i = 0; i < outlen; i++)
> +			*out++ = ipc_data_readl(4 * i);
> +	}
> +	mutex_unlock(&ipclock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(intel_pmc_ipc_raw_cmd);

Is this intentionally not EXPORT_SYMBOL_GPL?

> +
> +/*
> + * intel_pmc_ipc_command
> + * @cmd: command
> + * @sub: sub type
> + * @in: input data
> + * @inlen: input length in bytes
> + * @out: output data
> + * @outlen: output length in dwords
> + */
> +int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
> +		u32 *out, u32 outlen)

Indented second line to align with start of arg list

> +{
> +	return intel_pmc_ipc_raw_cmd(cmd, sub, in, inlen, out, outlen, 0, 0);
> +}
> +EXPORT_SYMBOL_GPL(intel_pmc_ipc_command);
> +
> +static irqreturn_t ioc(int irq, void *dev_id)
> +{
> +	int status;
> +
> +	if (ipcdev.irq_mode) {
> +		status = ipc_read_status();
> +		writel(status | IPC_STATUS_IRQ, ipcdev.ipc_base + IPC_STATUS);
> +	}
> +	complete(&ipcdev.cmd_complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +{
> +	resource_size_t pci_resource;
> +	int ret;
> +	int len;
> +
> +	ipcdev.dev = &pci_dev_get(pdev)->dev;
> +	ipcdev.irq_mode = IPC_TRIGGER_MODE_IRQ;
> +
> +	ret = pci_enable_device(pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pci_request_regions(pdev, "intel_pmc_ipc");
> +	if (ret)
> +		return ret;
> +
> +	pci_resource = pci_resource_start(pdev, 0);
> +	len = pci_resource_len(pdev, 0);
> +	if (!pci_resource || !len) {
> +		dev_err(&pdev->dev, "Failed to get resource\n");
> +		return -ENOMEM;
> +	}
> +
> +	init_completion(&ipcdev.cmd_complete);
> +
> +	if (request_irq(pdev->irq, ioc, 0, "intel_pmc_ipc", &ipcdev)) {
> +		dev_err(&pdev->dev, "Failed to request irq\n");
> +		return -EBUSY;
> +	}
> +
> +	ipcdev.ipc_base = ioremap_nocache(pci_resource, len);
> +	if (!ipcdev.ipc_base) {
> +		dev_err(&pdev->dev, "Failed to ioremap ipc base\n");
> +		ret = -ENOMEM;
> +		goto err;

So here... just free_irq

> +	}
> +
> +	return 0;

And here, return ret;

> +err:
> +	free_irq(pdev->irq, &ipcdev);
> +	return ret;

Then drop the err: and extra cleanup logic.

I've incorporated this into the testing commit as well.

> +}
> +
> +static void ipc_pci_remove(struct pci_dev *pdev)
> +{
> +	free_irq(pdev->irq, &ipcdev);
> +	pci_release_regions(pdev);
> +	pci_dev_put(pdev);
> +	iounmap(ipcdev.ipc_base);
> +	ipcdev.dev = NULL;
> +}
> +
> +static const struct pci_device_id ipc_pci_ids[] = {
> +	{PCI_VDEVICE(INTEL, 0x0a94), 0},
> +	{PCI_VDEVICE(INTEL, 0x1a94), 0},
> +	{ 0,}
> +};
> +MODULE_DEVICE_TABLE(pci, ipc_pci_ids);
> +
> +static struct pci_driver ipc_pci_driver = {
> +	.name = "intel_pmc_ipc",
> +	.id_table = ipc_pci_ids,
> +	.probe = ipc_pci_probe,
> +	.remove = ipc_pci_remove,
> +};
> +
> +static ssize_t intel_pmc_ipc_simple_cmd_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	int subcmd;
> +	int cmd;
> +	int ret;
> +
> +	ret = sscanf(buf, "%d %d", &cmd, &subcmd);
> +	if (ret != 2) {
> +		dev_err(dev, "Error args\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = intel_pmc_ipc_simple_command(cmd, subcmd);
> +	if (ret) {
> +		dev_err(dev, "command %d error with %d\n", cmd, ret);
> +		return ret;
> +	}
> +	return  count;

Double space.

Also, ssize_t can be either int or long depending on __BITS_PER_LONG, so your
return type here can change based on arch.


> +}
> +
> +static ssize_t intel_pmc_ipc_northpeak_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	unsigned long val;
> +	int subcmd;
> +	int ret;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (val)
> +		subcmd = 1;
> +	else
> +		subcmd = 0;
> +	ret = intel_pmc_ipc_simple_command(PMC_IPC_NORTHPEAK_CTRL, subcmd);
> +	if (ret) {
> +		dev_err(dev, "command north %d error with %d\n", subcmd, ret);
> +		return ret;
> +	}
> +	return count;
> +}
> +
> +static DEVICE_ATTR(simplecmd, S_IWUSR,
> +		NULL,
> +		intel_pmc_ipc_simple_cmd_store);
> +static DEVICE_ATTR(northpeak, S_IWUSR,
> +		NULL,
> +		intel_pmc_ipc_northpeak_store);
> +
> +static struct attribute *intel_ipc_attrs[] = {
> +	&dev_attr_northpeak.attr,
> +	&dev_attr_simplecmd.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group intel_ipc_group = {
> +	.attrs = intel_ipc_attrs,
> +};
> +
> +#define PUNIT_RESOURCE_INTER		1
> +static struct resource punit_res[] = {
> +	/* Punit */
> +	{
> +		.flags = IORESOURCE_MEM,
> +	},
> +	{
> +		.flags = IORESOURCE_MEM,
> +	},
> +};
> +
> +#define TCO_RESOURCE_ACPI_IO		0
> +#define TCO_RESOURCE_SMI_EN_IO		1
> +#define TCO_RESOURCE_GCR_MEM		2
> +static struct resource tco_res[] = {
> +	/* ACPI - TCO */
> +	{
> +		.flags = IORESOURCE_IO,
> +	},
> +	/* ACPI - SMI */
> +	{
> +		.flags = IORESOURCE_IO,
> +	},
> +	/* GCS */
> +	{
> +		.flags = IORESOURCE_MEM,
> +	},
> +};
> +
> +static struct lpc_ich_info tco_info = {
> +	.name = "Broxton SoC",
> +	.iTCO_version = 3,
> +};
> +
> +static int ipc_create_punit_device(void)
> +{
> +	struct platform_device *pdev;
> +	struct resource *res;
> +	int ret;
> +
> +	pdev = platform_device_alloc(PUNIT_DEVICE_NAME, -1);
> +	if (!pdev) {
> +		dev_err(ipcdev.dev, "Failed to alloc punit platform device\n");
> +		return -ENOMEM;
> +	}
> +
> +	pdev->dev.parent = ipcdev.dev;
> +
> +	res = punit_res;
> +	res->start = (resource_size_t)ipcdev.punit_base;
> +	res->end = res->start + ipcdev.punit_size - 1;
> +
> +	res = punit_res + PUNIT_RESOURCE_INTER;
> +	res->start = (resource_size_t)ipcdev.punit_base2;
> +	res->end = res->start + ipcdev.punit_size2 - 1;
> +
> +	ret = platform_device_add_resources(pdev,
> +				punit_res, ARRAY_SIZE(punit_res));

Align start of arguments whenever feasible - it is here.
Apply throughout please.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
