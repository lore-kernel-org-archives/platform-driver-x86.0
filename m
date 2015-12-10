From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH V9 2/2] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Thu, 10 Dec 2015 15:01:57 -0800
Message-ID: <20151210230157.GF11972@malice.jf.intel.com>
References: <1449771661-40300-1-git-send-email-qipeng.zha@intel.com>
 <1449771661-40300-2-git-send-email-qipeng.zha@intel.com>
 <1449746585.30729.77.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52408 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750715AbbLJXCA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Dec 2015 18:02:00 -0500
Content-Disposition: inline
In-Reply-To: <1449746585.30729.77.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qipeng Zha <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org

On Thu, Dec 10, 2015 at 01:23:05PM +0200, Andy Shevchenko wrote:
> On Fri, 2015-12-11 at 02:21 +0800, Qipeng Zha wrote:
> > This driver provides support for P-Unit mailbox IPC on Intel
> > platforms.
> > The heart of the P-Unit is the Foxton microcontroller and its
> > firmware,
> > which provide mailbox interface for power management usage.
> >=20
> > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
>=20
> Couple of nitpicks below, otherwise finally my tag
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >=20
> > ---
> > change in v9
> > =C2=A0remove non-necessary cast for void pointer;
> > =C2=A0remove redundant error messages.
> >=20
> > change in v8
> > =C2=A0Change the way to get three IPCs's resources due to udpated a=
cpi
> > entries,
> >=20
> > =C2=A0In the new acpi resources layout, two entries for each IPC, o=
ne for
> > data
> > and one for interface.
> >=20
> > change in v7
> > =C2=A0Update ipc_err_string()'s return type to "const char *" from =
"char
> > *";
> > =C2=A0Add terminator in acpi id array.
> >=20
> > change in v6
> > =C2=A0Update header file;
> > =C2=A0Update interface of lowlevel register access;
> > =C2=A0Restructure implementation of two command functions;
> > =C2=A0Save IPC private data pointer to pdev's priv;
> >=20
> > change in v5
> > =C2=A0Fix commend style in header file;
> > =C2=A0Replace EINVAL with ENODEV in stub functions;
> > =C2=A0Replace ipc_err_sources array with ipc_err_string function;
> > =C2=A0Correct comments: "if invalid" -> "if not used";
> > =C2=A0Propagate return error of devm_request_irq.
> >=20
> > change in v4
> > =C2=A0Fix two code style issues: make /* as a whole line and replac=
e
> > "return ret" with "goto out";
> > =C2=A0Replace -EINVAL with -ENXIO for failures due to resource.
> >=20
> > change in v3
> > =C2=A0Fix compile issue in intel_punit_ipc.h, it happened when buil=
t-in
> > and the header file is included in other source file.
> >=20
> > change in v2
> > =C2=A0Fix issues in code style and comments;
> > =C2=A0Remove "default y" in Kconfig;
> > =C2=A0Remove some header files;
> > =C2=A0Replace request_mem_region with devm_request_mem_region,
> > and same for request_irq;
> > =C2=A0Change to use prefix of IPC_PUNIT_ to define commands.
> > ---
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A04 +-
> > =C2=A0arch/x86/include/asm/intel_punit_ipc.h | 101 ++++++++++
> > =C2=A0drivers/platform/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A06 +
> > =C2=A0drivers/platform/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> > =C2=A0drivers/platform/x86/intel_punit_ipc.c | 336
> > +++++++++++++++++++++++++++++++++
> > =C2=A05 files changed, 447 insertions(+), 1 deletion(-)
> > =C2=A0create mode 100644 arch/x86/include/asm/intel_punit_ipc.h
> > =C2=A0create mode 100644 drivers/platform/x86/intel_punit_ipc.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5192700..333a022 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5683,12 +5683,14 @@ F:	drivers/dma/mic_x100_dma.c
> > =C2=A0F:	drivers/dma/mic_x100_dma.h
> > =C2=A0F	Documentation/mic/
> > =C2=A0
> > -INTEL PMC IPC DRIVER
> > +INTEL PMC/P-Unit IPC DRIVER
> > =C2=A0M:	Zha Qipeng<qipeng.zha@intel.com>
> > =C2=A0L:	platform-driver-x86@vger.kernel.org
> > =C2=A0S:	Maintained
> > =C2=A0F:	drivers/platform/x86/intel_pmc_ipc.c
> > +F:	drivers/platform/x86/intel_punit_ipc.c
> > =C2=A0F:	arch/x86/include/asm/intel_pmc_ipc.h
> > +F:	arch/x86/include/asm/intel_punit_ipc.h
> > =C2=A0
> > =C2=A0IOC3 ETHERNET DRIVER
> > =C2=A0M:	Ralf Baechle <ralf@linux-mips.org>
> > diff --git a/arch/x86/include/asm/intel_punit_ipc.h
> > b/arch/x86/include/asm/intel_punit_ipc.h
> > new file mode 100644
> > index 0000000..201eb9d
> > --- /dev/null
> > +++ b/arch/x86/include/asm/intel_punit_ipc.h
> > @@ -0,0 +1,101 @@
> > +#ifndef _ASM_X86_INTEL_PUNIT_IPC_H_
> > +#define=C2=A0=C2=A0_ASM_X86_INTEL_PUNIT_IPC_H_
> > +
> > +/*
> > + * Three types of 8bit P-Unit IPC commands are supported,
> > + * bit[7:6]: [00]: BIOS; [01]: GTD; [10]: ISPD.
> > + */
> > +typedef enum {
> > +	BIOS_IPC =3D 0,
> > +	GTDRIVER_IPC,
> > +	ISPDRIVER_IPC,
> > +	RESERVED_IPC,
> > +} IPC_TYPE;
> > +
> > +#define IPC_TYPE_OFFSET			6
> > +#define IPC_PUNIT_BIOS_CMD_BASE		(BIOS_IPC <<
> > IPC_TYPE_OFFSET)
> > +#define IPC_PUNIT_GTD_CMD_BASE		(GTDDRIVER_IPC <<
> > IPC_TYPE_OFFSET)
> > +#define IPC_PUNIT_ISPD_CMD_BASE		(ISPDRIVER_IPC <<
> > IPC_TYPE_OFFSET)
> > +#define IPC_PUNIT_CMD_TYPE_MASK		(RESERVED_IPC <<
> > IPC_TYPE_OFFSET)
> > +
> > +/* BIOS =3D> Pcode commands */
> > +#define IPC_PUNIT_BIOS_ZERO			(IPC_PUNIT_BIOS_C
> > MD_BASE | 0x00)
> > +#define IPC_PUNIT_BIOS_VR_INTERFACE		(IPC_PUNIT_BIOS_C
> > MD_BASE | 0x01)
> > +#define IPC_PUNIT_BIOS_READ_PCS			(IPC_PUNIT_BI
> > OS_CMD_BASE | 0x02)
> > +#define IPC_PUNIT_BIOS_WRITE_PCS		(IPC_PUNIT_BIOS_CMD_
> > BASE | 0x03)
> > +#define IPC_PUNIT_BIOS_READ_PCU_CONFIG		(IPC_PUNIT_BIO
> > S_CMD_BASE | 0x04)
> > +#define IPC_PUNIT_BIOS_WRITE_PCU_CONFIG		(IPC_PUNIT_BI
> > OS_CMD_BASE | 0x05)
> > +#define IPC_PUNIT_BIOS_READ_PL1_SETTING		(IPC_PUNIT_BI
> > OS_CMD_BASE | 0x06)
> > +#define IPC_PUNIT_BIOS_WRITE_PL1_SETTING	(IPC_PUNIT_BIOS_CMD_
> > BASE | 0x07)
> > +#define IPC_PUNIT_BIOS_TRIGGER_VDD_RAM		(IPC_PUNIT_BIO
> > S_CMD_BASE | 0x08)
> > +#define IPC_PUNIT_BIOS_READ_TELE_INFO		(IPC_PUNIT_BIOS
> > _CMD_BASE | 0x09)
> > +#define IPC_PUNIT_BIOS_READ_TELE_TRACE_CTRL	(IPC_PUNIT_BIOS_C
> > MD_BASE | 0x0a)
> > +#define IPC_PUNIT_BIOS_WRITE_TELE_TRACE_CTRL	(IPC_PUNIT_BIOS_
> > CMD_BASE | 0x0b)
> > +#define IPC_PUNIT_BIOS_READ_TELE_EVENT_CTRL	(IPC_PUNIT_BIOS_C
> > MD_BASE | 0x0c)
> > +#define IPC_PUNIT_BIOS_WRITE_TELE_EVENT_CTRL	(IPC_PUNIT_BIOS_
> > CMD_BASE | 0x0d)
> > +#define IPC_PUNIT_BIOS_READ_TELE_TRACE		(IPC_PUNIT_BIO
> > S_CMD_BASE | 0x0e)
> > +#define IPC_PUNIT_BIOS_WRITE_TELE_TRACE		(IPC_PUNIT_BI
> > OS_CMD_BASE | 0x0f)
> > +#define IPC_PUNIT_BIOS_READ_TELE_EVENT		(IPC_PUNIT_BIO
> > S_CMD_BASE | 0x10)
> > +#define IPC_PUNIT_BIOS_WRITE_TELE_EVENT		(IPC_PUNIT_BI
> > OS_CMD_BASE | 0x11)
> > +#define IPC_PUNIT_BIOS_READ_MODULE_TEMP		(IPC_PUNIT_BI
> > OS_CMD_BASE | 0x12)
> > +#define IPC_PUNIT_BIOS_RESERVED			(IPC_PUNIT_BI
> > OS_CMD_BASE | 0x13)
> > +#define IPC_PUNIT_BIOS_READ_VOLTAGE_OVER	(IPC_PUNIT_BIOS_CMD_
> > BASE | 0x14)
> > +#define IPC_PUNIT_BIOS_WRITE_VOLTAGE_OVER	(IPC_PUNIT_BIOS_CMD
> > _BASE | 0x15)
> > +#define IPC_PUNIT_BIOS_READ_RATIO_OVER		(IPC_PUNIT_BIO
> > S_CMD_BASE | 0x16)
> > +#define IPC_PUNIT_BIOS_WRITE_RATIO_OVER		(IPC_PUNIT_BI
> > OS_CMD_BASE | 0x17)
> > +#define IPC_PUNIT_BIOS_READ_VF_GL_CTRL		(IPC_PUNIT_BIO
> > S_CMD_BASE | 0x18)
> > +#define IPC_PUNIT_BIOS_WRITE_VF_GL_CTRL		(IPC_PUNIT_BI
> > OS_CMD_BASE | 0x19)
> > +#define IPC_PUNIT_BIOS_READ_FM_SOC_TEMP_THRESH	(IPC_PUNIT_BIO
> > S_CMD_BASE | 0x1a)
> > +#define IPC_PUNIT_BIOS_WRITE_FM_SOC_TEMP_THRESH	(IPC_PUNIT_BI
> > OS_CMD_BASE | 0x1b)
> > +
> > +/* GT Driver =3D> Pcode commands */
> > +#define IPC_PUNIT_GTD_ZERO			(IPC_PUNIT_GTD_CMD
> > _BASE | 0x00)
> > +#define IPC_PUNIT_GTD_CONFIG			(IPC_PUNIT_GTD_C
> > MD_BASE | 0x01)
> > +#define IPC_PUNIT_GTD_READ_ICCP_LIC_CDYN_SCAL	(IPC_PUNIT_GTD_
> > CMD_BASE | 0x02)
> > +#define IPC_PUNIT_GTD_WRITE_ICCP_LIC_CDYN_SCAL	(IPC_PUNIT_GTD
> > _CMD_BASE | 0x03)
> > +#define IPC_PUNIT_GTD_GET_WM_VAL		(IPC_PUNIT_GTD_CMD_B
> > ASE | 0x06)
> > +#define IPC_PUNIT_GTD_WRITE_CONFIG_WISHREQ	(IPC_PUNIT_GTD_CMD
> > _BASE | 0x07)
> > +#define IPC_PUNIT_GTD_READ_REQ_DUTY_CYCLE	(IPC_PUNIT_GTD_CMD_
> > BASE | 0x16)
> > +#define IPC_PUNIT_GTD_DIS_VOL_FREQ_CHG_REQUEST	(IPC_PUNIT_GTD
> > _CMD_BASE | 0x17)
> > +#define IPC_PUNIT_GTD_DYNA_DUTY_CYCLE_CTRL	(IPC_PUNIT_GTD_CMD
> > _BASE | 0x1a)
> > +#define IPC_PUNIT_GTD_DYNA_DUTY_CYCLE_TUNING	(IPC_PUNIT_GTD_C
> > MD_BASE | 0x1c)
> > +
> > +/* ISP Driver =3D> Pcode commands */
> > +#define IPC_PUNIT_ISPD_ZERO			(IPC_PUNIT_ISPD_C
> > MD_BASE | 0x00)
> > +#define IPC_PUNIT_ISPD_CONFIG			(IPC_PUNIT_ISPD
> > _CMD_BASE | 0x01)
> > +#define IPC_PUNIT_ISPD_GET_ISP_LTR_VAL		(IPC_PUNIT_ISP
> > D_CMD_BASE | 0x02)
> > +#define IPC_PUNIT_ISPD_ACCESS_IU_FREQ_BOUNDS	(IPC_PUNIT_ISPD_
> > CMD_BASE | 0x03)
> > +#define IPC_PUNIT_ISPD_READ_CDYN_LEVEL		(IPC_PUNIT_ISP
> > D_CMD_BASE | 0x04)
> > +#define IPC_PUNIT_ISPD_WRITE_CDYN_LEVEL		(IPC_PUNIT_IS
> > PD_CMD_BASE | 0x05)
> > +
> > +/* Error codes */
> > +#define IPC_PUNIT_ERR_SUCCESS			0
> > +#define IPC_PUNIT_ERR_INVALID_CMD		1
> > +#define IPC_PUNIT_ERR_INVALID_PARAMETER		2
> > +#define IPC_PUNIT_ERR_CMD_TIMEOUT		3
> > +#define IPC_PUNIT_ERR_CMD_LOCKED		4
> > +#define IPC_PUNIT_ERR_INVALID_VR_ID		5
> > +#define IPC_PUNIT_ERR_VR_ERR			6
> > +
> > +#if IS_ENABLED(CONFIG_INTEL_PUNIT_IPC)
> > +
> > +int intel_punit_ipc_simple_command(int cmd, int para1, int para2);
> > +int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2, u32 *in=
,
> > u32 *out);
> > +
> > +#else
> > +
> > +static inline int intel_punit_ipc_simple_command(int cmd,
> > +						=C2=A0=C2=A0int para1, int
> > para2)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> > +static inline int intel_punit_ipc_command(u32 cmd, u32 para1, u32
> > para2,
> > +					=C2=A0=C2=A0u32 *in, u32 *out)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> > +#endif /* CONFIG_INTEL_PUNIT_IPC */
> > +
> > +#endif
> > diff --git a/drivers/platform/x86/Kconfig
> > b/drivers/platform/x86/Kconfig
> > index 1089eaa..148ff88 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -944,4 +944,10 @@ config SURFACE_PRO3_BUTTON
> > =C2=A0	depends on ACPI && INPUT
> > =C2=A0	---help---
> > =C2=A0	=C2=A0=C2=A0This driver handles the power/home/volume button=
s on the
> > Microsoft Surface Pro 3 tablet.
> > +
> > +config INTEL_PUNIT_IPC
> > +	tristate "Intel P-Unit IPC Driver"
> > +	---help---
> > +	=C2=A0=C2=A0This driver provides support for Intel P-Unit Mailbox=
 IPC
> > mechanism,
> > +	=C2=A0=C2=A0which is used to bridge the communications between ke=
rnel
> > and P-Unit.
> > =C2=A0endif # X86_PLATFORM_DEVICES
> > diff --git a/drivers/platform/x86/Makefile
> > b/drivers/platform/x86/Makefile
> > index 3ca78a3..5ee5425 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -62,3 +62,4 @@ obj-$(CONFIG_PVPANIC)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=3D pvpanic.o
> > =C2=A0obj-$(CONFIG_ALIENWARE_WMI)	+=3D alienware-wmi.o
> > =C2=A0obj-$(CONFIG_INTEL_PMC_IPC)	+=3D intel_pmc_ipc.o
> > =C2=A0obj-$(CONFIG_SURFACE_PRO3_BUTTON)	+=3D surfacepro3_button.o
> > +obj-$(CONFIG_INTEL_PUNIT_IPC)=C2=A0=C2=A0+=3D intel_punit_ipc.o
> > diff --git a/drivers/platform/x86/intel_punit_ipc.c
> > b/drivers/platform/x86/intel_punit_ipc.c
> > new file mode 100644
> > index 0000000..e6354a7
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_punit_ipc.c
> > @@ -0,0 +1,336 @@
> > +/*
> > + * Driver for the Intel P-Unit Mailbox IPC mechanism
> > + *
> > + * (C) Copyright 2015 Intel Corporation
> > + *
> > + * This program is free software; you can redistribute it and/or
> > modify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + *
> > + * The heart of the P-Unit is the Foxton microcontroller and its
> > firmware,
> > + * which provide mailbox interface for power management usage.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/acpi.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/platform_device.h>
> > +#include <asm/intel_punit_ipc.h>
> > +
> > +/* IPC Mailbox registers */
> > +#define OFFSET_DATA_LOW		0x0
> > +#define OFFSET_DATA_HIGH	0x4
> > +/* bit field of interface register */
> > +#define	CMD_RUN			(1 << 31)
> > +#define	CMD_ERRCODE_MASK	0xFF
>=20
> #include <linux/bitops.h>
>=20
> =E2=80=A6BIT(31)
> =E2=80=A6GENMASK(7,0)
>=20
> > +#define	CMD_PARA1_SHIFT		8
> > +#define	CMD_PARA2_SHIFT		16
> > +
> > +#define CMD_TIMEOUT_SECONDS	1
> > +
> > +enum {
> > +	DATA =3D 0,
> > +	INTERFACE,
>=20
> BASE_DATA
> BASE_IFACE (or BASE_INTERFACE if you prefer, though better to be in
> align across those two drivers)
> BASE_MAX
>=20
>=20
> > +};
> > +
> > +typedef struct {
> > +	struct device *dev;
> > +	struct mutex lock;
> > +	int irq;
> > +	struct completion cmd_complete;
> > +	/* base of interface and data registers */
> > +	void __iomem *base[RESERVED_IPC][INTERFACE + 1];
>=20
> =E2=80=A6[][BASE_MAX];
>=20

These are solid improvements. Qipeng, one more spin please and we can h=
ave this
in next by the weekend. I'm personally much more confident in this driv=
er.
Thanks to Andriy for his careful review, and thank you for sticking wit=
h it.

--=20
Darren Hart
Intel Open Source Technology Center
