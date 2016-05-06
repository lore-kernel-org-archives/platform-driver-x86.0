From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH v2] platform:x86: Add PMC Driver for Intel Core SOC
Date: Fri, 6 May 2016 15:30:21 +0530
Message-ID: <20160506100019.GA8778@rajaneesh-OptiPlex-9010>
References: <1461666887-29220-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <20160505183331.GA2113@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:57836 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752005AbcEFKA2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 May 2016 06:00:28 -0400
Content-Disposition: inline
In-Reply-To: <20160505183331.GA2113@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, vishwanath.somayaji@intel.com

On Thu, May 05, 2016 at 11:33:31AM -0700, Darren Hart wrote:
> On Tue, Apr 26, 2016 at 04:04:47PM +0530, Rajneesh Bhardwaj wrote:
> 
> Hi Rajneesh,
> 
> Thanks for a solid description below. Apologies for the delay in review, we try
> for a much faster turn-around.
>

Hi Darren,
Thanks so much for taking the time to review the code and for providing
your valuable feedback.
 
> > This patch adds the Power Management Controller driver as a pci driver
> > for Intel Core SOC architecture.
> > 
> > This driver can utilize debugging capabilities and supported features
> > as exposed by the Power Management Controller.
> > 
> 
> Which features specifically? They vary by SoC I presume? The features are
> advertised via the exposed registers?
> 

The current version of this driver exposes SLP_S0_RESIDENCY counter feature
exposed by memory mapped register available on Sunrise Point PCH. Yes, these
may vary from one generation of PCH to other. This feature is particularly
useful for the platforms that prefer to use 'suspend to idle' over 'ACPI S3'
for sleep.

Please refer to the below specification for more details on PMC features.
http://www.intel.in/content/www/in/en/chipsets/100-series-chipset-datasheet-vol-2.html

More such features may be added to this driver in the future versions.

> > The current version of this driver can be used for detecting fragile
> > SLP_S0 signal related failures and take corrective actions when PCH
> > SLP_S0 signal is not asserted after kernel freeze as part of
> > suspend to idle flow i.e. echo freeze > /sys/power/state.
> > 
> > Intel Platform Controller Hub (PCH) asserts SLP_S0 signal when it
> > detects favorable conditions to enter its low power mode. As a
> > pre-requisite the SOC should be in deepest possible Package C-State
> > and devices should be in low power mode. For example, on Skylake SOC
> > the deepest Package C-State is Package C10 or PC10. Suspend to idle
> > flow generally leads to PC10 state but PC10 state may not be sufficient
> > for realizing the platform wide power potential which SLP_S0 signal
> > assertion can provide.
> > 
> > SLP_S0 signal is often connected to the Embedded Controller (EC) and the
> > Power Management IC (PMIC) for other platform power management related
> > optimizations.
> > 
> > In general, SLP_S0 assertion == PC10 + PCH low power mode + ModPhy Lanes
> > power gated + PLL Idle.
> > 
> > As part of this driver, a mechanism to read the slp_s0 residency is exposed
> > as an api and also debugfs features are added to indicate slp_s0 signal
> > assertion residency in microseconds.
> > 
> > echo freeze > /sys/power/state
> > wake the system
> > cat /sys/kernel/debug/pmc_core/slp_s0_residency_usec
> > 
> > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> > Signed-off-by: Vishwanath Somayaji <vishwanath.somayaji@intel.com>
> > ---
> > Changes in v2:
> >  * Fixed inconsistent spaces in the header file.
> >  * Updated commit message.
> >  * Enhanced acronym SKL CPU to Skylake CPUID Signature.
> >  * Put error check on pci_read_config_dword in probe function.
> >  * Changed goto label (disable) to disable_pci.
> >  * Changed x86_match_cpu error handling for consistency.
> > 
> >  arch/x86/include/asm/pmc_core.h       |  53 +++++++++
> >  drivers/platform/x86/Kconfig          |  10 ++
> >  drivers/platform/x86/Makefile         |   1 +
> >  drivers/platform/x86/intel_pmc_core.c | 206 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 270 insertions(+)
> >  create mode 100644 arch/x86/include/asm/pmc_core.h
> >  create mode 100644 drivers/platform/x86/intel_pmc_core.c
> > 
> > diff --git a/arch/x86/include/asm/pmc_core.h b/arch/x86/include/asm/pmc_core.h
> > new file mode 100644
> > index 0000000..2930c6c
> > --- /dev/null
> > +++ b/arch/x86/include/asm/pmc_core.h
> > @@ -0,0 +1,53 @@
> > +/*
> > + * Intel Core SOC Power Management Controller Header File
> > + *
> > + * Copyright (c) 2016, Intel Corporation.
> 
> Intel recommendation is to include the following line in addition to the above:
> 
>   * All rights reserved.
> 

Ok, will add in the next revision of the patch.

> > + * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + */
> > +
> > +#ifndef PMC_CORE_H
> > +#define PMC_CORE_H
> > +
> > +/* Skylake Power Management Controller PCI Device ID */
> > +#define PCI_DEVICE_ID_SKL_PMC			0x9d21
> > +#define PMC_BASE_ADDR_OFFSET			0x48
> > +#define PMC_SLP_S0_RESIDENCY_COUNTER		0x13c
> > +#define PMC_MMIO_REG_LEN			0x100
> > +#define PMC_REG_BIT_WIDTH			0x20
> > +#define SLP_S0_RESIDENCY_COUNTER_GRANULARITY	0x64
> > +
> > +/**
> > + * struct pmc_dev - pmc device structure
> > + * @base_addr:		comtains pmc base address
> > + * @regmap: pointer to io-remapped memory location
> 
> Whitespace alignment ^
>

Ok, will fix it.
 
> > + * @dbgfs_dir:		path to debug fs interface
> > + * @feature_available:	flag to indicate whether,
> 
> No trailing comma here
> 

Ok, will fix it.

> > + *			the feature is available,
> > + *			on a particular platform or not.
> > + *
> > + * pmc_dev contains info about power management controller device.
> > + */
> > +struct pmc_dev {
> > +	u32 base_addr;
> > +	void __iomem *regmap;
> > +#if IS_ENABLED(CONFIG_DEBUG_FS)
> > +	struct dentry *dbgfs_dir;
> > +#endif /* CONFIG_DEBUG_FS */
> > +	int feature_available;
> 
> The meaning of "feature_available" isn't obvious to me reading the code to here.
> In what scenario would I have a pmc_dev but not "feature_available" ? Is it one
> particular feature of the device, or is the device itself useless?
>

There are variants of Sunrise point PCH where this feature (slp_s0_res ) is unavailable.
This feature_available flag was added to keep future additions in mind and also to
protect the exported API to return error in case the API is called from a non-supported
platform.

As this driver is primarily intended to expose debug features of PMC, if feature is not
available, there is nothing much to do for the driver.
 
> > +};
> > +
> > +int intel_pmc_slp_s0_counter_read(u64 *data);
> > +
> > +#endif
> > +
> > +/* PMC_CORE_H */
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index ed2004b..5db364c 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -821,6 +821,16 @@ config INTEL_IPS
> >  	  functionality.  If in doubt, say Y here; it will only load on
> >  	  supported platforms.
> >  
> > +config INTEL_PMC_CORE
> > +	bool "Intel PMC Core driver"
> > +	depends on X86 && PCI
> > +	default y
> > +	---help---
> > +	  This driver exposes the features provided by Power Management
> > +	  Controller for Intel Core SOC. Intel Platform Controller Hub
> > +	  for Intel Core SOCs provides access to Power Management Controller
> > +	  registers via pci interface.
> 
> This needs a few grammatical corrections:
> 
> 	  This driver exposes the Intel Core SoC Power Management Controller
> 	  features. The Intel Platform Controller Hub for Intel Core SoCs
> 	  provides access to the Power Management Controller registers via a PCI
> 	  interface.
> 
> Even this is rather vague in my opinion. The term "features" doesn't tell the
> reader anything about what is actually being enabled? Again, is it enabling the
> device itself, or is it enabling some additional feature of this device, if so,
> which ones?
> 

Honestly, i added the buffer lines to pass the Checkpatch.pl warnings if we have
less than 4 lines. 
Thanks for pointing this out, will make it more contextual and descriptive.

> >  config INTEL_IMR
> >  	bool "Intel Isolated Memory Region support"
> >  	default n
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> > index 448443c..9b11b40 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -69,3 +69,4 @@ obj-$(CONFIG_INTEL_PUNIT_IPC)  += intel_punit_ipc.o
> >  obj-$(CONFIG_INTEL_TELEMETRY)	+= intel_telemetry_core.o \
> >  				   intel_telemetry_pltdrv.o \
> >  				   intel_telemetry_debugfs.o
> > +obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
> > diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> > new file mode 100644
> > index 0000000..d092655
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_pmc_core.c
> > @@ -0,0 +1,206 @@
> > +/*
> > + * Intel Core SOC Power Management Controller Driver
> > + *
> > + * Copyright (c) 2016, Intel Corporation.
> 
> All rights reserved.
>

Ok.
 
> > + * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + */
> > +
> > +#include <linux/init.h>
> > +#include <linux/pci.h>
> > +#include <linux/device.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/seq_file.h>
> > +#include <linux/module.h>
> > +#include <linux/io.h>
> > +#include <asm/cpu_device_id.h>
> > +#include <asm/pmc_core.h>
> > +
> > +static struct pmc_dev pmc;
> > +
> > +static const struct pci_device_id pmc_pci_ids[] = {
> > +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_SKL_PMC), (kernel_ulong_t)NULL },
> > +	{ 0, },
> > +};
> > +MODULE_DEVICE_TABLE(pci, pmc_pci_ids);
> > +
> > +/**
> > + * intel_pmc_slp_s0_counter_read() - Read slp_s0 residency.
> > + * @data: Out param that contains current slp_s0 count.
> > + *
> > + * This API currently supports Intel Skylake SOC and Sunrise
> > + * point Platform Controller Hub. Future platform support
> > + * should be added for platforms that support low power modes
> > + * beyond Package C10 state.
> > + *
> > + * SLP_S0_RESIDENCY counter counts in 100 us granularity per
> > + * step hence function populates the multiplied value in out
> > + * parameter @data
> > + *
> > + * Return:	an error code or 0 on success.
> > + */
> > +int intel_pmc_slp_s0_counter_read(u64 *data)
> > +{
> > +	int ret = 0;
> > +
> > +	if (pmc.feature_available) {
> > +		*data = readl(pmc.regmap + PMC_SLP_S0_RESIDENCY_COUNTER);
> > +		*data *= SLP_S0_RESIDENCY_COUNTER_GRANULARITY;
> > +	} else {
> > +		ret = -EACCES;
> > +	}
> > +
> > +	return ret;
> > +}
> 
> This can be streamlined significantly by checking for errors, rather than
> success:
> 
> 
> 	if (!pmc.feature_available)
> 		return -EACCESS;
> 
> 	*data = readl(pmc.regmap + PMC_SLP_S0_RESIDENCY_COUNTER);
> 	*data *= SLP_S0_RESIDENCY_COUNTER_GRANULARITY;
> 	return 0;
> 

Thanks for explaining this, will do.

> > +EXPORT_SYMBOL_GPL(intel_pmc_slp_s0_counter_read);
> > +
> > +#if IS_ENABLED(CONFIG_DEBUG_FS)
> > +
> > +static int pmc_core_dev_state_show(struct seq_file *s, void *unused)
> > +{
> > +	u64 counter_val;
> > +	int err;
> > +
> > +	err = intel_pmc_slp_s0_counter_read(&counter_val);
> > +	if (err) {
> > +		counter_val = 0;
> > +		seq_printf(s, "%lld\n", counter_val);
> 
> I presume we should propagate the error here? If not, there is no need to store
> err, and this function should return void.
>

Ok.
 
> > +	} else {
> > +		seq_printf(s, "%lld\n", counter_val);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int pmc_core_dev_state_open(struct inode *inode, struct file *file)
> > +{
> > +	return single_open(file, pmc_core_dev_state_show, inode->i_private);
> > +}
> > +
> > +static const struct file_operations pmc_core_dev_state_ops = {
> > +	.open           = pmc_core_dev_state_open,
> > +	.read           = seq_read,
> > +	.llseek         = seq_lseek,
> > +	.release        = single_release,
> > +};
> > +
> > +static void pmc_core_dbgfs_unregister(struct pmc_dev *pmc)
> > +{
> > +	debugfs_remove_recursive(pmc->dbgfs_dir);
> > +}
> > +
> > +static int pmc_core_dbgfs_register(struct pmc_dev *pmc)
> > +{
> > +	struct dentry *dir, *file;
> > +	int ret = 0;
> > +
> > +	dir = debugfs_create_dir("pmc_core", NULL);
> > +	if (!dir)
> > +		return -ENOMEM;
> > +
> > +	pmc->dbgfs_dir = dir;
> > +	file = debugfs_create_file("slp_s0_residency_usec", S_IFREG | S_IRUGO,
> > +				   dir, pmc, &pmc_core_dev_state_ops);
> > +
> > +	if (!file) {
> > +		pmc_core_dbgfs_unregister(pmc);
> > +		ret = -ENODEV;
> > +	}
> > +	return ret;
> > +}
> > +
> > +#else
> > +
> > +static int pmc_core_dbgfs_register(struct pmc_dev *pmc)
> > +{
> > +	return 0; /* nothing to register */
> > +}
> > +
> > +#endif /* CONFIG_DEBUG_FS */
> > +
> > +static const struct x86_cpu_id intel_pmc_core_ids[] = {
> > +	{ X86_VENDOR_INTEL, 6, 0x4e, X86_FEATURE_MWAIT,
> > +		(kernel_ulong_t)NULL}, /* Skylake CPUID Signature */
> > +	{ X86_VENDOR_INTEL, 6, 0x5e, X86_FEATURE_MWAIT,
> > +		(kernel_ulong_t)NULL}, /* Skylake CPUID Signature */
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_ids);
> > +
> > +static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
> > +{
> > +	int err;
> > +	const struct x86_cpu_id *cpu_id;
> > +
> > +	cpu_id = x86_match_cpu(intel_pmc_core_ids);
> > +	if (!cpu_id) {
> > +		err = -EINVAL;
> > +		goto exit;
> > +	}
> > +
> > +	err = pci_enable_device(dev);
> > +	if (err) {
> > +		dev_err(&dev->dev, "PMC Core: failed to enable Power Management Controller.\n");
> > +		goto exit;
> > +	}
> > +
> > +	err = pci_read_config_dword(dev, PMC_BASE_ADDR_OFFSET, &pmc.base_addr);
> > +	if (err) {
> > +		dev_err(&dev->dev, "PMC Core: failed to read pci config space.\n");
> > +		goto disable_pci;
> > +	}
> > +	dev_dbg(&dev->dev, "PMC Core: PWRMBASE is 0x%x\n", pmc.base_addr);
> > +
> > +	pmc.regmap = ioremap_nocache(pmc.base_addr, PMC_MMIO_REG_LEN);
> > +	if (!pmc.regmap) {
> > +		dev_err(&dev->dev, "PMC Core: ioremap failed\n");
> > +		err = -ENOMEM;
> > +		goto disable_pci;
> > +	}
> > +
> > +	err = pmc_core_dbgfs_register(&pmc);
> > +	if (err) {
> > +		dev_err(&dev->dev, "PMC Core: debugfs register failed\n");
> > +		iounmap(pmc.regmap);
> > +		goto disable_pci;
> > +	}
> > +
> > +	pmc.feature_available = 1;
> > +	return 0;
> > +
> > +disable_pci:
> > +	pci_disable_device(dev);
> > +exit:
> > +	return err;
> > +}
> > +
> > +static void intel_pmc_core_remove(struct pci_dev *pdev)
> > +{
> > +#if IS_ENABLED(CONFIG_DEBUG_FS)
> > +	pmc_core_dbgfs_unregister(&pmc);
> > +#endif
> 
> You are using the ifdef rather inconsistently. In probe you call
> pmc_core_dbgs_register regardless and redefine that function based on
> CONFIG_DEBIG_FS, but here you only call unregister if CONFIG_DEBUG_FS is set. I
> don't know that one is particularly preferable to the other - but please be
> consistent and parallel in such usages.
>

Ok, will keep only one implementation of pmc_core_dbgfs_register and will call
it only when CONFIG_DEBUG_FS is set.
 
> > +	pci_disable_device(pdev);
> > +	iounmap(pmc.regmap);
> > +}
> > +
> > +static struct pci_driver intel_pmc_core_driver = {
> > +	.name = "intel_pmc_core",
> > +	.id_table = pmc_pci_ids,
> > +	.probe = pmc_core_probe,
> > +	.remove = intel_pmc_core_remove,
> > +};
> > +module_pci_driver(intel_pmc_core_driver);
> > +
> > +MODULE_AUTHOR("Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>");
> > +MODULE_AUTHOR("Vishwanath Somayaji <vishwanath.somayaji@intel.com>");
> > +MODULE_DESCRIPTION("Intel CORE SOC Power Management Controller Interface");
> > +MODULE_LICENSE("GPL v2");
> > -- 
> > 1.9.1
> > 
> > 
> 
> Who will own this driver going forward? Who gets added to MAINTAINERS?
>

It would be great to have you maintain it, if you agree :).I can provide
the required support. Otherwise, i can maintain it.
 
> -- 
> Darren Hart
> Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Best Regards,
Rajneesh
