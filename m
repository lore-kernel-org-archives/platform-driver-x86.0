From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v7] platform:x86: Add PMC Driver for Intel Core SoC
Date: Thu, 26 May 2016 13:53:09 +0300
Message-ID: <1464259989.27624.6.camel@linux.intel.com>
References: <1464253879-18504-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:57870 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753283AbcEZKwC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 May 2016 06:52:02 -0400
In-Reply-To: <1464253879-18504-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, olof@lixom.net, tglx@linutronix.de, hpa@zytor.com, dbasehore@google.com, vishwanath.somayaji@intel.com

On Thu, 2016-05-26 at 14:41 +0530, Rajneesh Bhardwaj wrote:
> This patch adds the Power Management Controller driver as a PCI drive=
r
> for Intel Core SoC architecture.
>=20
> This driver can utilize debugging capabilities and supported features
> as exposed by the Power Management Controller.
>=20
> Please refer to the below specification for more details on PMC
> features.
> http://www.intel.in/content/www/in/en/chipsets/100-series-chipset-dat=
a
> sheet-vol-2.html
>=20
> The current version of this driver exposes SLP_S0_RESIDENCY counter.
> This counter can be used for detecting fragile SLP_S0 signal related
> failures and take corrective actions when PCH SLP_S0 signal is not
> asserted after kernel freeze as part of suspend to idle flow
> (echo freeze > /sys/power/state).
>=20
> Intel Platform Controller Hub (PCH) asserts SLP_S0 signal when it
> detects favorable conditions to enter its low power mode. As a
> pre-requisite the SoC should be in deepest possible Package C-State
> and devices should be in low power mode. For example, on Skylake SoC
> the deepest Package C-State is Package C10 or PC10. Suspend to idle
> flow generally leads to PC10 state but PC10 state may not be
> sufficient
> for realizing the platform wide power potential which SLP_S0 signal
> assertion can provide.
>=20
> SLP_S0 signal is often connected to the Embedded Controller (EC) and
> the
> Power Management IC (PMIC) for other platform power management relate=
d
> optimizations.
>=20
> In general, SLP_S0 assertion =3D=3D PC10 + PCH low power mode + ModPh=
y
> Lanes
> power gated + PLL Idle.
>=20
> As part of this driver, a mechanism to read the SLP_S0_RESIDENCY is
> exposed
> as an API and also debugfs features are added to indicate SLP_S0
> signal
> assertion residency in microseconds.
>=20
> echo freeze > /sys/power/state
> wake the system
> cat /sys/kernel/debug/pmc_core/slp_s0_residency_usec
>=20
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Signed-off-by: Vishwanath Somayaji <vishwanath.somayaji@intel.com>

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> ---
> Changes in v7:
> =C2=A0* Using builtin_pci_driver instead of device_initcall to fix bu=
ild
> warning
> =C2=A0* Deleted .remove line from struct intel_pmc_core_driver
>=20
> Changes in v6:
> =C2=A0* Removed module specific code:
> 	- removed module.h, .remove callback.
> 	- replaced module_pci_driver with device_initcall.
> 	- removed MODULE_*
> =C2=A0* Address style related review comments.
> =C2=A0* Updated Authors, MAINTAINERS.
> =C2=A0* Removed unused #define from intel_pmc_core.h:
> 	- SPT_PMC_REG_BIT_WIDTH
>=20
> Changes in v5:
> =C2=A0* Addressed generic review comments for v4.
> =C2=A0* Added generic read function "pmc_core_reg_read".
> =C2=A0* Split the header file into two:
> 	- arch/x86/include/asm/pmc_core.h =3D> exposes API.
> 	- driver/platform/x86/intel_pmc_core.h =3D> used by the driver.
> =C2=A0* Updated signature for intel_pmc_slp_s0_counter_read as slp_s0
> =C2=A0=C2=A0=C2=A0counter is a 32 bit counter.
> =C2=A0* Updated SOB, Authors and MAINTAINERS.
> =C2=A0* Using managed APIs:
> 	- pcim_enable_device
> 	- devm_ioremap_nocache
> =C2=A0* Updated probe and remove code.
>=20
> Changes in v4:
> =C2=A0* Moved the header file to drivers/platform/x86 directory.
> =C2=A0* Updated the same in MAINTAINERS.
> =C2=A0* Removed 'default y' option from Kconfig.
> =C2=A0* Introduced static inline dummy functions for debugfs register
> =C2=A0=C2=A0=C2=A0and unregister case when CONFIG_DEBUG_FS is not set=
=2E Removed
> =C2=A0=C2=A0=C2=A0#if IS_ENABLED(CONFIG_DEBUG_FS) check from .probe a=
nd .remove
> calls.
> =C2=A0* Add CC to LKML (linux-kernel@vger.kernel.org)
> =C2=A0* Earlier review comments till v3 are available at:
> =C2=A0=C2=A0=C2=A0- http://www.spinics.net/lists/platform-driver-x86/=
msg08790.html
> =C2=A0=C2=A0=C2=A0- http://www.spinics.net/lists/platform-driver-x86/=
msg08759.html
> =C2=A0=C2=A0=C2=A0- http://www.spinics.net/lists/platform-driver-x86/=
msg08742.html
>=20
> Changes in v3:
> =C2=A0* Updated the commit message, added reference to the chipset
> datasheet.
> =C2=A0* Renamed the header file to intel_pmc_core.h for consistency.
> =C2=A0* Added All rights reserved notification after the Copyright me=
ssage.
> =C2=A0* Improved variable names in the header file. Added SPT prefix.
> =C2=A0* Fixed kernel-doc related whitespace and comma issues for stru=
ct
> pmc_dev.
> =C2=A0* Changed feature_available to bool has_slp_s0_res.
> =C2=A0* Enhanced the Kconfig description as per the review suggestion=
s.
> =C2=A0* Added error propagating logic to pmc_core_dev_state_show.
> =C2=A0* Streamlined intel_pmc_slp_s0_counter_read as per the review
> comments.
> =C2=A0* Streamlined the use of #if IS_ENABLED(CONFIG_DEBUG_FS) while
> registering
> =C2=A0=C2=A0=C2=A0debugfs in the probe call.
> =C2=A0* Removed the *duplicate definition* of pmc_core_debugfs_regist=
er.
> =C2=A0* Added MAINTAINERS related changes.
> =C2=A0* Checkpatch warning due to long URL name in the commit message=
=2E
>=20
> Changes in v2:
> =C2=A0* Fixed inconsistent spaces in the header file.
> =C2=A0* Updated commit message.
> =C2=A0* Enhanced acronym SKL CPU to Skylake CPUID Signature.
> =C2=A0* Put error check on pci_read_config_dword in probe function.
> =C2=A0* Changed goto label (disable) to disable_pci.
> =C2=A0* Changed x86_match_cpu error handling for consistency.
>=20
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A08 ++
> =C2=A0arch/x86/include/asm/pmc_core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A027 +++++
> =C2=A0drivers/platform/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A012 ++
> =C2=A0drivers/platform/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/platform/x86/intel_pmc_core.c | 200
> ++++++++++++++++++++++++++++++++++
> =C2=A0drivers/platform/x86/intel_pmc_core.h |=C2=A0=C2=A051 +++++++++
> =C2=A06 files changed, 299 insertions(+)
> =C2=A0create mode 100644 arch/x86/include/asm/pmc_core.h
> =C2=A0create mode 100644 drivers/platform/x86/intel_pmc_core.c
> =C2=A0create mode 100644 drivers/platform/x86/intel_pmc_core.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3302006..db18359 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6096,6 +6096,14 @@ S:	Maintained
> =C2=A0F:	arch/x86/include/asm/intel_telemetry.h
> =C2=A0F:	drivers/platform/x86/intel_telemetry*
> =C2=A0
> +INTEL PMC CORE DRIVER
> +M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> +M:	Vishwanath Somayaji <vishwanath.somayaji@intel.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	arch/x86/include/asm/pmc_core.h
> +F:	drivers/platform/x86/intel_pmc_core*
> +
> =C2=A0IOC3 ETHERNET DRIVER
> =C2=A0M:	Ralf Baechle <ralf@linux-mips.org>
> =C2=A0L:	linux-mips@linux-mips.org
> diff --git a/arch/x86/include/asm/pmc_core.h
> b/arch/x86/include/asm/pmc_core.h
> new file mode 100644
> index 0000000..d4855f1
> --- /dev/null
> +++ b/arch/x86/include/asm/pmc_core.h
> @@ -0,0 +1,27 @@
> +/*
> + * Intel Core SoC Power Management Controller Header File
> + *
> + * Copyright (c) 2016, Intel Corporation.
> + * All Rights Reserved.
> + *
> + * Authors: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Vishwa=
nath Somayaji <vishwanath.somayaji@intel.com>
> + *
> + * This program is free software; you can redistribute it and/or
> modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but
> WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y
> or
> + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See the GNU General =
Public
> License for
> + * more details.
> + *
> + */
> +
> +#ifndef _ASM_PMC_CORE_H
> +#define _ASM_PMC_CORE_H
> +
> +/* API to read SLP_S0_RESIDENCY counter */
> +int intel_pmc_slp_s0_counter_read(u32 *data);
> +
> +#endif /* _ASM_PMC_CORE_H */
> diff --git a/drivers/platform/x86/Kconfig
> b/drivers/platform/x86/Kconfig
> index ed2004b..c06bb85 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -846,6 +846,18 @@ config INTEL_IMR
> =C2=A0
> =C2=A0	=C2=A0=C2=A0If you are running on a Galileo/Quark say Y here.
> =C2=A0
> +config INTEL_PMC_CORE
> +	bool "Intel PMC Core driver"
> +	depends on X86 && PCI
> +	---help---
> +	=C2=A0=C2=A0The Intel Platform Controller Hub for Intel Core SoCs
> provides access
> +	=C2=A0=C2=A0to Power Management Controller registers via a PCI
> interface. This
> +	=C2=A0=C2=A0driver can utilize debugging capabilities and supported
> features as
> +	=C2=A0=C2=A0exposed by the Power Management Controller.
> +
> +	=C2=A0=C2=A0Supported features:
> +		- SLP_S0_RESIDENCY counter.
> +
> =C2=A0config IBM_RTL
> =C2=A0	tristate "Device driver to enable PRTL support"
> =C2=A0	depends on X86 && PCI
> diff --git a/drivers/platform/x86/Makefile
> b/drivers/platform/x86/Makefile
> index 448443c..9b11b40 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,3 +69,4 @@ obj-$(CONFIG_INTEL_PUNIT_IPC)=C2=A0=C2=A0+=3D intel=
_punit_ipc.o
> =C2=A0obj-$(CONFIG_INTEL_TELEMETRY)	+=3D intel_telemetry_core.o \
> =C2=A0				=C2=A0=C2=A0=C2=A0intel_telemetry_pltdrv.o \
> =C2=A0				=C2=A0=C2=A0=C2=A0intel_telemetry_debugfs.o
> +obj-$(CONFIG_INTEL_PMC_CORE)=C2=A0=C2=A0=C2=A0=C2=A0+=3D intel_pmc_c=
ore.o
> diff --git a/drivers/platform/x86/intel_pmc_core.c
> b/drivers/platform/x86/intel_pmc_core.c
> new file mode 100644
> index 0000000..2776bec
> --- /dev/null
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -0,0 +1,200 @@
> +/*
> + * Intel Core SoC Power Management Controller Driver
> + *
> + * Copyright (c) 2016, Intel Corporation.
> + * All Rights Reserved.
> + *
> + * Authors: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Vishwa=
nath Somayaji <vishwanath.somayaji@intel.com>
> + *
> + * This program is free software; you can redistribute it and/or
> modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but
> WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y
> or
> + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See the GNU General =
Public
> License for
> + * more details.
> + *
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/pci.h>
> +#include <linux/seq_file.h>
> +
> +#include <asm/cpu_device_id.h>
> +#include <asm/pmc_core.h>
> +
> +#include "intel_pmc_core.h"
> +
> +static struct pmc_dev pmc;
> +
> +static const struct pci_device_id pmc_pci_ids[] =3D {
> +	{ PCI_VDEVICE(INTEL, SPT_PMC_PCI_DEVICE_ID),
> (kernel_ulong_t)NULL },
> +	{ 0, },
> +};
> +
> +static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int
> reg_offset)
> +{
> +	return readl(pmcdev->regbase + reg_offset);
> +}
> +
> +static inline u32 pmc_core_adjust_slp_s0_step(u32 value)
> +{
> +	return value * SPT_PMC_SLP_S0_RES_COUNTER_STEP;
> +}
> +
> +/**
> + * intel_pmc_slp_s0_counter_read() - Read SLP_S0 residency.
> + * @data: Out param that contains current SLP_S0 count.
> + *
> + * This API currently supports Intel Skylake SoC and Sunrise
> + * Point Platform Controller Hub. Future platform support
> + * should be added for platforms that support low power modes
> + * beyond Package C10 state.
> + *
> + * SLP_S0_RESIDENCY counter counts in 100 us granularity per
> + * step hence function populates the multiplied value in out
> + * parameter @data.
> + *
> + * Return: an error code or 0 on success.
> + */
> +int intel_pmc_slp_s0_counter_read(u32 *data)
> +{
> +	struct pmc_dev *pmcdev =3D &pmc;
> +	u32 value;
> +
> +	if (!pmcdev->has_slp_s0_res)
> +		return -EACCES;
> +
> +	value =3D pmc_core_reg_read(pmcdev,
> SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
> +	*data =3D pmc_core_adjust_slp_s0_step(value);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(intel_pmc_slp_s0_counter_read);
> +
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static int pmc_core_dev_state_show(struct seq_file *s, void *unused)
> +{
> +	struct pmc_dev *pmcdev =3D s->private;
> +	u32 counter_val;
> +
> +	counter_val =3D pmc_core_reg_read(pmcdev,
> +					SPT_PMC_SLP_S0_RES_COUNTER_OF
> FSET);
> +	seq_printf(s, "%u\n",
> pmc_core_adjust_slp_s0_step(counter_val));
> +
> +	return 0;
> +}
> +
> +static int pmc_core_dev_state_open(struct inode *inode, struct file
> *file)
> +{
> +	return single_open(file, pmc_core_dev_state_show, inode-
> >i_private);
> +}
> +
> +static const struct file_operations pmc_core_dev_state_ops =3D {
> +	.open=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=3D pmc_core_dev_state_open,
> +	.read=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=3D seq_read,
> +	.llseek=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D se=
q_lseek,
> +	.release=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D single_=
release,
> +};
> +
> +static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
> +{
> +	debugfs_remove_recursive(pmcdev->dbgfs_dir);
> +}
> +
> +static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
> +{
> +	struct dentry *dir, *file;
> +
> +	dir =3D debugfs_create_dir("pmc_core", NULL);
> +	if (!dir)
> +		return -ENOMEM;
> +
> +	pmcdev->dbgfs_dir =3D dir;
> +	file =3D debugfs_create_file("slp_s0_residency_usec", S_IFREG |
> S_IRUGO,
> +				=C2=A0=C2=A0=C2=A0dir, pmcdev,
> &pmc_core_dev_state_ops);
> +
> +	if (!file) {
> +		pmc_core_dbgfs_unregister(pmcdev);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +#else
> +static inline int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
> +{
> +	return 0;
> +}
> +
> +static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
> +{
> +}
> +#endif /* CONFIG_DEBUG_FS */
> +
> +static const struct x86_cpu_id intel_pmc_core_ids[] =3D {
> +	{ X86_VENDOR_INTEL, 6, 0x4e, X86_FEATURE_MWAIT,
> +		(kernel_ulong_t)NULL}, /* Skylake CPUID Signature */
> +	{ X86_VENDOR_INTEL, 6, 0x5e, X86_FEATURE_MWAIT,
> +		(kernel_ulong_t)NULL}, /* Skylake CPUID Signature */
> +	{}
> +};
> +
> +static int pmc_core_probe(struct pci_dev *dev, const struct
> pci_device_id *id)
> +{
> +	struct device *ptr_dev =3D &dev->dev;
> +	struct pmc_dev *pmcdev =3D &pmc;
> +	const struct x86_cpu_id *cpu_id;
> +	int err;
> +
> +	cpu_id =3D x86_match_cpu(intel_pmc_core_ids);
> +	if (!cpu_id) {
> +		dev_dbg(&dev->dev, "PMC Core: cpuid mismatch.\n");
> +		return -EINVAL;
> +	}
> +
> +	err =3D pcim_enable_device(dev);
> +	if (err < 0) {
> +		dev_dbg(&dev->dev, "PMC Core: failed to enable Power
> Management Controller.\n");
> +		return err;
> +	}
> +
> +	err =3D pci_read_config_dword(dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0SPT_PMC_BASE_ADDR_OFFSET,
> +				=C2=A0=C2=A0=C2=A0=C2=A0&pmcdev->base_addr);
> +	if (err < 0) {
> +		dev_dbg(&dev->dev, "PMC Core: failed to read PCI
> config space.\n");
> +		return err;
> +	}
> +	dev_dbg(&dev->dev, "PMC Core: PWRMBASE is %#x\n", pmcdev-
> >base_addr);
> +
> +	pmcdev->regbase =3D devm_ioremap_nocache(ptr_dev,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmcdev->base_addr,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SPT_PMC_MMIO_REG_LEN);
> +	if (!pmcdev->regbase) {
> +		dev_dbg(&dev->dev, "PMC Core: ioremap failed.\n");
> +		return -ENOMEM;
> +	}
> +
> +	err =3D pmc_core_dbgfs_register(pmcdev);
> +	if (err < 0) {
> +		dev_err(&dev->dev, "PMC Core: debugfs register
> failed.\n");
> +		return err;
> +	}
> +
> +	pmc.has_slp_s0_res =3D true;
> +	return 0;
> +}
> +
> +static struct pci_driver intel_pmc_core_driver =3D {
> +	.name =3D "intel_pmc_core",
> +	.id_table =3D pmc_pci_ids,
> +	.probe =3D pmc_core_probe,
> +};
> +
> +builtin_pci_driver(intel_pmc_core_driver);
> diff --git a/drivers/platform/x86/intel_pmc_core.h
> b/drivers/platform/x86/intel_pmc_core.h
> new file mode 100644
> index 0000000..a9dadaf
> --- /dev/null
> +++ b/drivers/platform/x86/intel_pmc_core.h
> @@ -0,0 +1,51 @@
> +/*
> + * Intel Core SoC Power Management Controller Header File
> + *
> + * Copyright (c) 2016, Intel Corporation.
> + * All Rights Reserved.
> + *
> + * Authors: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Vishwa=
nath Somayaji <vishwanath.somayaji@intel.com>
> + *
> + * This program is free software; you can redistribute it and/or
> modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but
> WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y
> or
> + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See the GNU General =
Public
> License for
> + * more details.
> + *
> + */
> +
> +#ifndef PMC_CORE_H
> +#define PMC_CORE_H
> +
> +/* Sunrise Point Power Management Controller PCI Device ID */
> +#define SPT_PMC_PCI_DEVICE_ID			0x9d21
> +#define SPT_PMC_BASE_ADDR_OFFSET		0x48
> +#define SPT_PMC_SLP_S0_RES_COUNTER_OFFSET	0x13c
> +#define SPT_PMC_MMIO_REG_LEN			0x100
> +#define SPT_PMC_SLP_S0_RES_COUNTER_STEP		0x64
> +
> +/**
> + * struct pmc_dev - pmc device structure
> + * @base_addr:		comtains pmc base address
> + * @regbase:		pointer to io-remapped memory location
> + * @dbgfs_dir:		path to debug fs interface
> + * @feature_available:	flag to indicate whether
> + *			the feature is available
> + *			on a particular platform or not.
> + *
> + * pmc_dev contains info about power management controller device.
> + */
> +struct pmc_dev {
> +	u32 base_addr;
> +	void __iomem *regbase;
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	struct dentry *dbgfs_dir;
> +#endif /* CONFIG_DEBUG_FS */
> +	bool has_slp_s0_res;
> +};
> +
> +#endif /* PMC_CORE_H */

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
