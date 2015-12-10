From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH V9 2/2] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Thu, 10 Dec 2015 13:23:05 +0200
Message-ID: <1449746585.30729.77.camel@linux.intel.com>
References: <1449771661-40300-1-git-send-email-qipeng.zha@intel.com>
	 <1449771661-40300-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:62788 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752194AbbLJLZL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Dec 2015 06:25:11 -0500
In-Reply-To: <1449771661-40300-2-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qipeng Zha <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org

On Fri, 2015-12-11 at 02:21 +0800, Qipeng Zha wrote:
> This driver provides support for P-Unit mailbox IPC on Intel
> platforms.
> The heart of the P-Unit is the Foxton microcontroller and its
> firmware,
> which provide mailbox interface for power management usage.
>=20
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Couple of nitpicks below, otherwise finally my tag

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> ---
> change in v9
> =C2=A0remove non-necessary cast for void pointer;
> =C2=A0remove redundant error messages.
>=20
> change in v8
> =C2=A0Change the way to get three IPCs's resources due to udpated acp=
i
> entries,
>=20
> =C2=A0In the new acpi resources layout, two entries for each IPC, one=
 for
> data
> and one for interface.
>=20
> change in v7
> =C2=A0Update ipc_err_string()'s return type to "const char *" from "c=
har
> *";
> =C2=A0Add terminator in acpi id array.
>=20
> change in v6
> =C2=A0Update header file;
> =C2=A0Update interface of lowlevel register access;
> =C2=A0Restructure implementation of two command functions;
> =C2=A0Save IPC private data pointer to pdev's priv;
>=20
> change in v5
> =C2=A0Fix commend style in header file;
> =C2=A0Replace EINVAL with ENODEV in stub functions;
> =C2=A0Replace ipc_err_sources array with ipc_err_string function;
> =C2=A0Correct comments: "if invalid" -> "if not used";
> =C2=A0Propagate return error of devm_request_irq.
>=20
> change in v4
> =C2=A0Fix two code style issues: make /* as a whole line and replace
> "return ret" with "goto out";
> =C2=A0Replace -EINVAL with -ENXIO for failures due to resource.
>=20
> change in v3
> =C2=A0Fix compile issue in intel_punit_ipc.h, it happened when built-=
in
> and the header file is included in other source file.
>=20
> change in v2
> =C2=A0Fix issues in code style and comments;
> =C2=A0Remove "default y" in Kconfig;
> =C2=A0Remove some header files;
> =C2=A0Replace request_mem_region with devm_request_mem_region,
> and same for request_irq;
> =C2=A0Change to use prefix of IPC_PUNIT_ to define commands.
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A04 +-
> =C2=A0arch/x86/include/asm/intel_punit_ipc.h | 101 ++++++++++
> =C2=A0drivers/platform/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A06 +
> =C2=A0drivers/platform/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/platform/x86/intel_punit_ipc.c | 336
> +++++++++++++++++++++++++++++++++
> =C2=A05 files changed, 447 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 arch/x86/include/asm/intel_punit_ipc.h
> =C2=A0create mode 100644 drivers/platform/x86/intel_punit_ipc.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5192700..333a022 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5683,12 +5683,14 @@ F:	drivers/dma/mic_x100_dma.c
> =C2=A0F:	drivers/dma/mic_x100_dma.h
> =C2=A0F	Documentation/mic/
> =C2=A0
> -INTEL PMC IPC DRIVER
> +INTEL PMC/P-Unit IPC DRIVER
> =C2=A0M:	Zha Qipeng<qipeng.zha@intel.com>
> =C2=A0L:	platform-driver-x86@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	drivers/platform/x86/intel_pmc_ipc.c
> +F:	drivers/platform/x86/intel_punit_ipc.c
> =C2=A0F:	arch/x86/include/asm/intel_pmc_ipc.h
> +F:	arch/x86/include/asm/intel_punit_ipc.h
> =C2=A0
> =C2=A0IOC3 ETHERNET DRIVER
> =C2=A0M:	Ralf Baechle <ralf@linux-mips.org>
> diff --git a/arch/x86/include/asm/intel_punit_ipc.h
> b/arch/x86/include/asm/intel_punit_ipc.h
> new file mode 100644
> index 0000000..201eb9d
> --- /dev/null
> +++ b/arch/x86/include/asm/intel_punit_ipc.h
> @@ -0,0 +1,101 @@
> +#ifndef _ASM_X86_INTEL_PUNIT_IPC_H_
> +#define=C2=A0=C2=A0_ASM_X86_INTEL_PUNIT_IPC_H_
> +
> +/*
> + * Three types of 8bit P-Unit IPC commands are supported,
> + * bit[7:6]: [00]: BIOS; [01]: GTD; [10]: ISPD.
> + */
> +typedef enum {
> +	BIOS_IPC =3D 0,
> +	GTDRIVER_IPC,
> +	ISPDRIVER_IPC,
> +	RESERVED_IPC,
> +} IPC_TYPE;
> +
> +#define IPC_TYPE_OFFSET			6
> +#define IPC_PUNIT_BIOS_CMD_BASE		(BIOS_IPC <<
> IPC_TYPE_OFFSET)
> +#define IPC_PUNIT_GTD_CMD_BASE		(GTDDRIVER_IPC <<
> IPC_TYPE_OFFSET)
> +#define IPC_PUNIT_ISPD_CMD_BASE		(ISPDRIVER_IPC <<
> IPC_TYPE_OFFSET)
> +#define IPC_PUNIT_CMD_TYPE_MASK		(RESERVED_IPC <<
> IPC_TYPE_OFFSET)
> +
> +/* BIOS =3D> Pcode commands */
> +#define IPC_PUNIT_BIOS_ZERO			(IPC_PUNIT_BIOS_C
> MD_BASE | 0x00)
> +#define IPC_PUNIT_BIOS_VR_INTERFACE		(IPC_PUNIT_BIOS_C
> MD_BASE | 0x01)
> +#define IPC_PUNIT_BIOS_READ_PCS			(IPC_PUNIT_BI
> OS_CMD_BASE | 0x02)
> +#define IPC_PUNIT_BIOS_WRITE_PCS		(IPC_PUNIT_BIOS_CMD_
> BASE | 0x03)
> +#define IPC_PUNIT_BIOS_READ_PCU_CONFIG		(IPC_PUNIT_BIO
> S_CMD_BASE | 0x04)
> +#define IPC_PUNIT_BIOS_WRITE_PCU_CONFIG		(IPC_PUNIT_BI
> OS_CMD_BASE | 0x05)
> +#define IPC_PUNIT_BIOS_READ_PL1_SETTING		(IPC_PUNIT_BI
> OS_CMD_BASE | 0x06)
> +#define IPC_PUNIT_BIOS_WRITE_PL1_SETTING	(IPC_PUNIT_BIOS_CMD_
> BASE | 0x07)
> +#define IPC_PUNIT_BIOS_TRIGGER_VDD_RAM		(IPC_PUNIT_BIO
> S_CMD_BASE | 0x08)
> +#define IPC_PUNIT_BIOS_READ_TELE_INFO		(IPC_PUNIT_BIOS
> _CMD_BASE | 0x09)
> +#define IPC_PUNIT_BIOS_READ_TELE_TRACE_CTRL	(IPC_PUNIT_BIOS_C
> MD_BASE | 0x0a)
> +#define IPC_PUNIT_BIOS_WRITE_TELE_TRACE_CTRL	(IPC_PUNIT_BIOS_
> CMD_BASE | 0x0b)
> +#define IPC_PUNIT_BIOS_READ_TELE_EVENT_CTRL	(IPC_PUNIT_BIOS_C
> MD_BASE | 0x0c)
> +#define IPC_PUNIT_BIOS_WRITE_TELE_EVENT_CTRL	(IPC_PUNIT_BIOS_
> CMD_BASE | 0x0d)
> +#define IPC_PUNIT_BIOS_READ_TELE_TRACE		(IPC_PUNIT_BIO
> S_CMD_BASE | 0x0e)
> +#define IPC_PUNIT_BIOS_WRITE_TELE_TRACE		(IPC_PUNIT_BI
> OS_CMD_BASE | 0x0f)
> +#define IPC_PUNIT_BIOS_READ_TELE_EVENT		(IPC_PUNIT_BIO
> S_CMD_BASE | 0x10)
> +#define IPC_PUNIT_BIOS_WRITE_TELE_EVENT		(IPC_PUNIT_BI
> OS_CMD_BASE | 0x11)
> +#define IPC_PUNIT_BIOS_READ_MODULE_TEMP		(IPC_PUNIT_BI
> OS_CMD_BASE | 0x12)
> +#define IPC_PUNIT_BIOS_RESERVED			(IPC_PUNIT_BI
> OS_CMD_BASE | 0x13)
> +#define IPC_PUNIT_BIOS_READ_VOLTAGE_OVER	(IPC_PUNIT_BIOS_CMD_
> BASE | 0x14)
> +#define IPC_PUNIT_BIOS_WRITE_VOLTAGE_OVER	(IPC_PUNIT_BIOS_CMD
> _BASE | 0x15)
> +#define IPC_PUNIT_BIOS_READ_RATIO_OVER		(IPC_PUNIT_BIO
> S_CMD_BASE | 0x16)
> +#define IPC_PUNIT_BIOS_WRITE_RATIO_OVER		(IPC_PUNIT_BI
> OS_CMD_BASE | 0x17)
> +#define IPC_PUNIT_BIOS_READ_VF_GL_CTRL		(IPC_PUNIT_BIO
> S_CMD_BASE | 0x18)
> +#define IPC_PUNIT_BIOS_WRITE_VF_GL_CTRL		(IPC_PUNIT_BI
> OS_CMD_BASE | 0x19)
> +#define IPC_PUNIT_BIOS_READ_FM_SOC_TEMP_THRESH	(IPC_PUNIT_BIO
> S_CMD_BASE | 0x1a)
> +#define IPC_PUNIT_BIOS_WRITE_FM_SOC_TEMP_THRESH	(IPC_PUNIT_BI
> OS_CMD_BASE | 0x1b)
> +
> +/* GT Driver =3D> Pcode commands */
> +#define IPC_PUNIT_GTD_ZERO			(IPC_PUNIT_GTD_CMD
> _BASE | 0x00)
> +#define IPC_PUNIT_GTD_CONFIG			(IPC_PUNIT_GTD_C
> MD_BASE | 0x01)
> +#define IPC_PUNIT_GTD_READ_ICCP_LIC_CDYN_SCAL	(IPC_PUNIT_GTD_
> CMD_BASE | 0x02)
> +#define IPC_PUNIT_GTD_WRITE_ICCP_LIC_CDYN_SCAL	(IPC_PUNIT_GTD
> _CMD_BASE | 0x03)
> +#define IPC_PUNIT_GTD_GET_WM_VAL		(IPC_PUNIT_GTD_CMD_B
> ASE | 0x06)
> +#define IPC_PUNIT_GTD_WRITE_CONFIG_WISHREQ	(IPC_PUNIT_GTD_CMD
> _BASE | 0x07)
> +#define IPC_PUNIT_GTD_READ_REQ_DUTY_CYCLE	(IPC_PUNIT_GTD_CMD_
> BASE | 0x16)
> +#define IPC_PUNIT_GTD_DIS_VOL_FREQ_CHG_REQUEST	(IPC_PUNIT_GTD
> _CMD_BASE | 0x17)
> +#define IPC_PUNIT_GTD_DYNA_DUTY_CYCLE_CTRL	(IPC_PUNIT_GTD_CMD
> _BASE | 0x1a)
> +#define IPC_PUNIT_GTD_DYNA_DUTY_CYCLE_TUNING	(IPC_PUNIT_GTD_C
> MD_BASE | 0x1c)
> +
> +/* ISP Driver =3D> Pcode commands */
> +#define IPC_PUNIT_ISPD_ZERO			(IPC_PUNIT_ISPD_C
> MD_BASE | 0x00)
> +#define IPC_PUNIT_ISPD_CONFIG			(IPC_PUNIT_ISPD
> _CMD_BASE | 0x01)
> +#define IPC_PUNIT_ISPD_GET_ISP_LTR_VAL		(IPC_PUNIT_ISP
> D_CMD_BASE | 0x02)
> +#define IPC_PUNIT_ISPD_ACCESS_IU_FREQ_BOUNDS	(IPC_PUNIT_ISPD_
> CMD_BASE | 0x03)
> +#define IPC_PUNIT_ISPD_READ_CDYN_LEVEL		(IPC_PUNIT_ISP
> D_CMD_BASE | 0x04)
> +#define IPC_PUNIT_ISPD_WRITE_CDYN_LEVEL		(IPC_PUNIT_IS
> PD_CMD_BASE | 0x05)
> +
> +/* Error codes */
> +#define IPC_PUNIT_ERR_SUCCESS			0
> +#define IPC_PUNIT_ERR_INVALID_CMD		1
> +#define IPC_PUNIT_ERR_INVALID_PARAMETER		2
> +#define IPC_PUNIT_ERR_CMD_TIMEOUT		3
> +#define IPC_PUNIT_ERR_CMD_LOCKED		4
> +#define IPC_PUNIT_ERR_INVALID_VR_ID		5
> +#define IPC_PUNIT_ERR_VR_ERR			6
> +
> +#if IS_ENABLED(CONFIG_INTEL_PUNIT_IPC)
> +
> +int intel_punit_ipc_simple_command(int cmd, int para1, int para2);
> +int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2, u32 *in,
> u32 *out);
> +
> +#else
> +
> +static inline int intel_punit_ipc_simple_command(int cmd,
> +						=C2=A0=C2=A0int para1, int
> para2)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int intel_punit_ipc_command(u32 cmd, u32 para1, u32
> para2,
> +					=C2=A0=C2=A0u32 *in, u32 *out)
> +{
> +	return -ENODEV;
> +}
> +
> +#endif /* CONFIG_INTEL_PUNIT_IPC */
> +
> +#endif
> diff --git a/drivers/platform/x86/Kconfig
> b/drivers/platform/x86/Kconfig
> index 1089eaa..148ff88 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -944,4 +944,10 @@ config SURFACE_PRO3_BUTTON
> =C2=A0	depends on ACPI && INPUT
> =C2=A0	---help---
> =C2=A0	=C2=A0=C2=A0This driver handles the power/home/volume buttons =
on the
> Microsoft Surface Pro 3 tablet.
> +
> +config INTEL_PUNIT_IPC
> +	tristate "Intel P-Unit IPC Driver"
> +	---help---
> +	=C2=A0=C2=A0This driver provides support for Intel P-Unit Mailbox I=
PC
> mechanism,
> +	=C2=A0=C2=A0which is used to bridge the communications between kern=
el
> and P-Unit.
> =C2=A0endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile
> b/drivers/platform/x86/Makefile
> index 3ca78a3..5ee5425 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -62,3 +62,4 @@ obj-$(CONFIG_PVPANIC)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=3D pvpanic.o
> =C2=A0obj-$(CONFIG_ALIENWARE_WMI)	+=3D alienware-wmi.o
> =C2=A0obj-$(CONFIG_INTEL_PMC_IPC)	+=3D intel_pmc_ipc.o
> =C2=A0obj-$(CONFIG_SURFACE_PRO3_BUTTON)	+=3D surfacepro3_button.o
> +obj-$(CONFIG_INTEL_PUNIT_IPC)=C2=A0=C2=A0+=3D intel_punit_ipc.o
> diff --git a/drivers/platform/x86/intel_punit_ipc.c
> b/drivers/platform/x86/intel_punit_ipc.c
> new file mode 100644
> index 0000000..e6354a7
> --- /dev/null
> +++ b/drivers/platform/x86/intel_punit_ipc.c
> @@ -0,0 +1,336 @@
> +/*
> + * Driver for the Intel P-Unit Mailbox IPC mechanism
> + *
> + * (C) Copyright 2015 Intel Corporation
> + *
> + * This program is free software; you can redistribute it and/or
> modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * The heart of the P-Unit is the Foxton microcontroller and its
> firmware,
> + * which provide mailbox interface for power management usage.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <asm/intel_punit_ipc.h>
> +
> +/* IPC Mailbox registers */
> +#define OFFSET_DATA_LOW		0x0
> +#define OFFSET_DATA_HIGH	0x4
> +/* bit field of interface register */
> +#define	CMD_RUN			(1 << 31)
> +#define	CMD_ERRCODE_MASK	0xFF

#include <linux/bitops.h>

=E2=80=A6BIT(31)
=E2=80=A6GENMASK(7,0)

> +#define	CMD_PARA1_SHIFT		8
> +#define	CMD_PARA2_SHIFT		16
> +
> +#define CMD_TIMEOUT_SECONDS	1
> +
> +enum {
> +	DATA =3D 0,
> +	INTERFACE,

BASE_DATA
BASE_IFACE (or BASE_INTERFACE if you prefer, though better to be in
align across those two drivers)
BASE_MAX


> +};
> +
> +typedef struct {
> +	struct device *dev;
> +	struct mutex lock;
> +	int irq;
> +	struct completion cmd_complete;
> +	/* base of interface and data registers */
> +	void __iomem *base[RESERVED_IPC][INTERFACE + 1];

=E2=80=A6[][BASE_MAX];

> +	IPC_TYPE type;
> +} IPC_DEV;
> +
> +static IPC_DEV *punit_ipcdev;
> +
> +static inline u32 ipc_read_status(IPC_DEV *ipcdev, IPC_TYPE type)
> +{
> +	return readl(ipcdev->base[type][INTERFACE]);
> +}
> +
> +static inline void ipc_write_cmd(IPC_DEV *ipcdev, IPC_TYPE type, u32
> cmd)
> +{
> +	writel(cmd, ipcdev->base[type][INTERFACE]);
> +}
> +
> +static inline u32 ipc_read_data_low(IPC_DEV *ipcdev, IPC_TYPE type)
> +{
> +	return readl(ipcdev->base[type][DATA] + OFFSET_DATA_LOW);
> +}
> +
> +static inline u32 ipc_read_data_high(IPC_DEV *ipcdev, IPC_TYPE type)
> +{
> +	return readl(ipcdev->base[type][DATA] + OFFSET_DATA_HIGH);
> +}
> +
> +static inline void ipc_write_data_low(IPC_DEV *ipcdev, IPC_TYPE
> type, u32 data)
> +{
> +	writel(data, ipcdev->base[type][DATA] + OFFSET_DATA_LOW);
> +}
> +
> +static inline void ipc_write_data_high(IPC_DEV *ipcdev, IPC_TYPE
> type, u32 data)
> +{
> +	writel(data, ipcdev->base[type][DATA] + OFFSET_DATA_HIGH);
> +}
> +
> +static const char *ipc_err_string(int error)
> +{
> +	if (error =3D=3D IPC_PUNIT_ERR_SUCCESS)
> +		return "no error";
> +	else if (error =3D=3D IPC_PUNIT_ERR_INVALID_CMD)
> +		return "invalid command";
> +	else if (error =3D=3D IPC_PUNIT_ERR_INVALID_PARAMETER)
> +		return "invalid parameter";
> +	else if (error =3D=3D IPC_PUNIT_ERR_CMD_TIMEOUT)
> +		return "command timeout";
> +	else if (error =3D=3D IPC_PUNIT_ERR_CMD_LOCKED)
> +		return "command locked";
> +	else if (error =3D=3D IPC_PUNIT_ERR_INVALID_VR_ID)
> +		return "invalid vr id";
> +	else if (error =3D=3D IPC_PUNIT_ERR_VR_ERR)
> +		return "vr error";
> +	else
> +		return "unknown error";
> +}
> +
> +static int intel_punit_ipc_check_status(IPC_DEV *ipcdev, IPC_TYPE
> type)
> +{
> +	int loops =3D CMD_TIMEOUT_SECONDS * USEC_PER_SEC;
> +	int errcode;
> +	int status;
> +
> +	if (ipcdev->irq) {
> +		if (!wait_for_completion_timeout(&ipcdev-
> >cmd_complete,
> +						=C2=A0CMD_TIMEOUT_SECONDS
> * HZ)) {
> +			dev_err(ipcdev->dev, "IPC timed out\n");
> +			return -ETIMEDOUT;
> +		}
> +	} else {
> +		while ((ipc_read_status(ipcdev, type) & CMD_RUN) &&
> --loops)
> +			udelay(1);
> +		if (!loops) {
> +			dev_err(ipcdev->dev, "IPC timed out\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	status =3D ipc_read_status(ipcdev, type);
> +	errcode =3D status & CMD_ERRCODE_MASK;
> +	if (errcode) {
> +		dev_err(ipcdev->dev, "IPC failed: %s,
> IPC_STS=3D0x%x\n",
> +			ipc_err_string(errcode), status);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * intel_punit_ipc_simple_command() - Simple IPC command
> + * @cmd:	IPC command code.
> + * @para1:	First 8bit parameter, set 0 if not used.
> + * @para2:	Second 8bit parameter, set 0 if not used.
> + *
> + * Send a IPC command to P-Unit when there is no data transaction
> + *
> + * Return:	IPC error code or 0 on success.
> + */
> +int intel_punit_ipc_simple_command(int cmd, int para1, int para2)
> +{
> +	IPC_DEV *ipcdev =3D punit_ipcdev;
> +	IPC_TYPE type;
> +	u32 val;
> +	int ret;
> +
> +	mutex_lock(&ipcdev->lock);
> +
> +	reinit_completion(&ipcdev->cmd_complete);
> +	type =3D (cmd & IPC_PUNIT_CMD_TYPE_MASK) >> IPC_TYPE_OFFSET;
> +
> +	val =3D cmd & ~IPC_PUNIT_CMD_TYPE_MASK;
> +	val |=3D CMD_RUN | para2 << CMD_PARA2_SHIFT | para1 <<
> CMD_PARA1_SHIFT;
> +	ipc_write_cmd(ipcdev, type, val);
> +	ret =3D intel_punit_ipc_check_status(ipcdev, type);
> +
> +	mutex_unlock(&ipcdev->lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(intel_punit_ipc_simple_command);
> +
> +/**
> + * intel_punit_ipc_command() - IPC command with data and pointers
> + * @cmd:	IPC command code.
> + * @para1:	First 8bit parameter, set 0 if not used.
> + * @para2:	Second 8bit parameter, set 0 if not used.
> + * @in:		Input data, 32bit for BIOS cmd, two 32bit for
> GTD and ISPD.
> + * @out:	Output data.
> + *
> + * Send a IPC command to P-Unit with data transaction
> + *
> + * Return:	IPC error code or 0 on success.
> + */
> +int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2, u32 *in,
> u32 *out)
> +{
> +	IPC_DEV *ipcdev =3D punit_ipcdev;
> +	IPC_TYPE type;
> +	u32 val;
> +	int ret;
> +
> +	mutex_lock(&ipcdev->lock);
> +
> +	reinit_completion(&ipcdev->cmd_complete);
> +	type =3D (cmd & IPC_PUNIT_CMD_TYPE_MASK) >> IPC_TYPE_OFFSET;
> +	ipc_write_data_low(ipcdev, type, *in);
> +
> +	if (type =3D=3D GTDRIVER_IPC || type =3D=3D ISPDRIVER_IPC)
> +		ipc_write_data_high(ipcdev, type, *++in);
> +
> +	val =3D cmd & ~IPC_PUNIT_CMD_TYPE_MASK;
> +	val |=3D CMD_RUN | para2 << CMD_PARA2_SHIFT | para1 <<
> CMD_PARA1_SHIFT;
> +	ipc_write_cmd(ipcdev, type, val);
> +
> +	ret =3D intel_punit_ipc_check_status(ipcdev, type);
> +	if (ret)
> +		goto out;
> +	*out =3D ipc_read_data_low(ipcdev, type);
> +
> +	if (type =3D=3D GTDRIVER_IPC || type =3D=3D ISPDRIVER_IPC)
> +		*++out =3D ipc_read_data_high(ipcdev, type);
> +
> +out:
> +	mutex_unlock(&ipcdev->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(intel_punit_ipc_command);
> +
> +static irqreturn_t intel_punit_ioc(int irq, void *dev_id)
> +{
> +	IPC_DEV *ipcdev =3D dev_id;
> +
> +	complete(&ipcdev->cmd_complete);
> +	return IRQ_HANDLED;
> +}
> +
> +static int intel_punit_get_bars(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	void __iomem *addr;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	addr =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(addr))
> +		return PTR_ERR(addr);
> +	punit_ipcdev->base[BIOS_IPC][DATA] =3D addr;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	addr =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(addr))
> +		return PTR_ERR(addr);
> +	punit_ipcdev->base[BIOS_IPC][INTERFACE] =3D addr;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +	addr =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(addr))
> +		return PTR_ERR(addr);
> +	punit_ipcdev->base[ISPDRIVER_IPC][DATA] =3D addr;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 3);
> +	addr =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(addr))
> +		return PTR_ERR(addr);
> +	punit_ipcdev->base[ISPDRIVER_IPC][INTERFACE] =3D addr;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 4);
> +	addr =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(addr))
> +		return PTR_ERR(addr);
> +	punit_ipcdev->base[GTDRIVER_IPC][DATA] =3D addr;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 5);
> +	addr =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(addr))
> +		return PTR_ERR(addr);
> +	punit_ipcdev->base[GTDRIVER_IPC][INTERFACE] =3D addr;
> +
> +	return 0;
> +}
> +
> +static int intel_punit_ipc_probe(struct platform_device *pdev)
> +{
> +	int irq, ret;
> +
> +	punit_ipcdev =3D devm_kzalloc(&pdev->dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0sizeof(*punit_ipcdev),
> GFP_KERNEL);
> +	if (!punit_ipcdev)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, punit_ipcdev);
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		punit_ipcdev->irq =3D 0;
> +		dev_warn(&pdev->dev, "Invalid IRQ, using polling
> mode\n");
> +	} else {
> +		ret =3D devm_request_irq(&pdev->dev, irq,
> intel_punit_ioc,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0IRQF_NO_SUSPEND,
> "intel_punit_ipc",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&punit_ipcdev);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to request irq:
> %d\n", irq);
> +			return ret;
> +		}
> +		punit_ipcdev->irq =3D irq;
> +	}
> +
> +	ret =3D intel_punit_get_bars(pdev);
> +	if (ret)
> +		goto out;
> +
> +	punit_ipcdev->dev =3D &pdev->dev;
> +	mutex_init(&punit_ipcdev->lock);
> +	init_completion(&punit_ipcdev->cmd_complete);
> +
> +out:
> +	return ret;
> +}
> +
> +static int intel_punit_ipc_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}
> +
> +static const struct acpi_device_id punit_ipc_acpi_ids[] =3D {
> +	{ "INT34D4", 0 },
> +	{ }
> +};
> +
> +static struct platform_driver intel_punit_ipc_driver =3D {
> +	.probe =3D intel_punit_ipc_probe,
> +	.remove =3D intel_punit_ipc_remove,
> +	.driver =3D {
> +		.name =3D "intel_punit_ipc",
> +		.acpi_match_table =3D ACPI_PTR(punit_ipc_acpi_ids),
> +	},
> +};
> +

> +static int __init intel_punit_ipc_init(void)
> +{
> +	return platform_driver_register(&intel_punit_ipc_driver);
> +}
> +
> +static void __exit intel_punit_ipc_exit(void)
> +{
> +	platform_driver_unregister(&intel_punit_ipc_driver);
> +}

> +
> +MODULE_AUTHOR("Zha Qipeng <qipeng.zha@intel.com>");
> +MODULE_DESCRIPTION("Intel P-Unit IPC driver");
> +MODULE_LICENSE("GPL v2");
> +


> +/* Some modules are dependent on this, so init earlier */
> +fs_initcall(intel_punit_ipc_init);

Here still the question, but let's resolve this later.

> +module_exit(intel_punit_ipc_exit);

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
