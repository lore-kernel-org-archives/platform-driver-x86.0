From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5] platform:x86: Add PMC Driver for Intel Core SoC
Date: Tue, 24 May 2016 12:38:44 -0700
Message-ID: <20160524193844.GJ2735@f23x64.localdomain>
References: <1464099946-15078-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <CAHp75VfKowT6ZJ1_hy8LFWJ6dHmva3OQafOy4_LpDp4sU-jZsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57328 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932086AbcEXTin (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2016 15:38:43 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VfKowT6ZJ1_hy8LFWJ6dHmva3OQafOy4_LpDp4sU-jZsw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, dbasehore@google.com, vishwanath.somayaji@intel.com

On Tue, May 24, 2016 at 09:54:36PM +0300, Andy Shevchenko wrote:
> On Tue, May 24, 2016 at 5:25 PM, Rajneesh Bhardwaj
> <rajneesh.bhardwaj@intel.com> wrote:
> 
> Thanks for an update!
> 
> By the way, please keep me in the Cc list with my
> andriy.shevchenko@linux.intel.com address.
> 
> Additionally to what I said in the previous mail for v4.
> 
> > This patch adds the Power Management Controller driver as a pci driver
> 
> pci -> PCI
> 
> Check entire file.
> 
> > for Intel Core SoC architecture.
> 
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6096,6 +6096,15 @@ S:       Maintained
> >  F:     arch/x86/include/asm/intel_telemetry.h
> >  F:     drivers/platform/x86/intel_telemetry*
> >
> > +INTEL PMC CORE DRIVER
> > +M:     Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> > +M:     Vishwanath Somayaji <vishwanath.somayaji@intel.com>
> > +L:     platform-driver-x86@vger.kernel.org
> > +S:     Maintained
> > +F:     arch/x86/include/asm/pmc_core.h
> 
> > +F:     drivers/platform/x86/intel_pmc_core.h
> > +F:     drivers/platform/x86/intel_pmc_core.c
> 
> F:     drivers/platform/x86/intel_pmc_core*
> 
> ?
> 
> > +++ b/arch/x86/include/asm/pmc_core.h
> 
> > +#ifndef _ASM_PMC_CORE_H
> > +#define _ASM_PMC_CORE_H
> > +
> > +/* API to read slp_s0 residency */
> 
> I think in the comment you may use SLP_S0 like you did in the commit message.
> 
> > +int intel_pmc_slp_s0_counter_read(u32 *data);
> > +
> 
> > +#endif
> > +
> > +/* _ASM_PMC_CORE_H */
> 
> Would be one line.
> 
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -846,6 +846,18 @@ config INTEL_IMR
> >
> >           If you are running on a Galileo/Quark say Y here.
> >
> > +config INTEL_PMC_CORE
> > +       bool "Intel PMC Core driver"
> > +       depends on X86 && PCI
> > +       ---help---
> > +         The Intel Platform Controller Hub for Intel Core SoCs provides access
> > +         to Power Management Controller registers via a pci interface. This
> 
> PCI
> 
> > +         driver can utilize debugging capabilities and supported features as
> > +         exposed by the Power Management Controller.
> > +
> > +         Supported features:
> > +               - slp_s0_residency counter.
> 
> SLP_S0
> 
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -69,3 +69,4 @@ obj-$(CONFIG_INTEL_PUNIT_IPC)  += intel_punit_ipc.o
> >  obj-$(CONFIG_INTEL_TELEMETRY)  += intel_telemetry_core.o \
> >                                    intel_telemetry_pltdrv.o \
> >                                    intel_telemetry_debugfs.o
> > +obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
> 
> Alphabetical order?
> 
> > +++ b/drivers/platform/x86/intel_pmc_core.c
> 
> > +/**
> > + * intel_pmc_slp_s0_counter_read() - Read slp_s0 residency.
> 
> SLP_S0
> 
> > + * @data: Out param that contains current slp_s0 count.
> 
> Ditto.
> 
> > + *
> 
> + * Description:
> 
> > + * This API currently supports Intel Skylake SoC and Sunrise
> > + * Point Platform Controller Hub. Future platform support
> > + * should be added for platforms that support low power modes
> > + * beyond Package C10 state.
> > + *
> > + * SLP_S0_RESIDENCY counter counts in 100 us granularity per
> > + * step hence function populates the multiplied value in out
> > + * parameter @data.
> > + *
> > + * Return: an error code or 0 on success.
> > + */
> > +int intel_pmc_slp_s0_counter_read(u32 *data)
> > +{
> > +       struct pmc_dev *pmcdev = &pmc;
> > +       u32 value;
> > +
> > +       if (!pmcdev->has_slp_s0_res)
> 
> I would name this just initialized, so if you ever add something else
> there will be no need to rename.
> 
> if (!pmcdev->initialized)
> 

Previously this was "has_feature" or similar and I asked for something more
specific. "initialized" is going back the other way, and if the device can
support some features and not others, then this will need to go back to a more
specific naming. Let's leave this one as is for now. We can revisit it in the
future when more features provide us information on how it will be used.

> > +               return -EACCES;
> > +
> > +       value = pmc_core_reg_read(pmcdev, SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
> > +       *data = pmc_core_adjust_slp_s0_step(value);
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(intel_pmc_slp_s0_counter_read);
> > +
> 
> > +#if IS_ENABLED(CONFIG_DEBUG_FS)
> > +static int pmc_core_dev_state_show(struct seq_file *s, void *unused)
> > +{
> > +       struct pmc_dev *pmcdev = s->private;
> > +       u32 counter_val;
> > +
> > +       counter_val = pmc_core_reg_read(pmcdev,
> > +                                       SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
> > +       seq_printf(s, "%u\n", pmc_core_adjust_slp_s0_step(counter_val));
> > +
> > +       return 0;
> > +}
> > +
> > +static int pmc_core_dev_state_open(struct inode *inode, struct file *file)
> > +{
> > +       return single_open(file, pmc_core_dev_state_show, inode->i_private);
> > +}
> > +
> > +static const struct file_operations pmc_core_dev_state_ops = {
> > +       .open           = pmc_core_dev_state_open,
> > +       .read           = seq_read,
> > +       .llseek         = seq_lseek,
> > +       .release        = single_release,
> > +};
> 
> I suppose DEFINE_SIMPLE_ATTRIBUTE might reduce amount of LOC.
> 
> > +static int pmc_core_dbgfs_register(struct pmc_dev *pmc)
> 
> Use pmcdev for pointer for the sake of consistency.
> 
> > +{
> > +       struct dentry *dir, *file;
> 
> > +       int ret = 0;
> 
> Redundant.
> 
> > +
> > +       dir = debugfs_create_dir("pmc_core", NULL);
> > +       if (!dir)
> > +               return -ENOMEM;
> > +
> > +       pmc->dbgfs_dir = dir;
> 
> I'm not sure you need an additional variable here.
> 
> > +       file = debugfs_create_file("slp_s0_residency_usec", S_IFREG | S_IRUGO,
> > +                                  dir, pmc, &pmc_core_dev_state_ops);
> > +
> > +       if (!file) {
> > +               pmc_core_dbgfs_unregister(pmc);
> > +               ret = -ENODEV;
> > +       }
> > +       return ret;
> > +}
> > +#else
> > +static inline int pmc_core_dbgfs_register(struct pmc_dev *pmc)
> > +{
> > +       return 0; /* nothing to register */
> 
> Useless comment.
> 
> > +}
> > +
> > +static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmc)
> > +{
> > +       /* nothing to deregister */
> 
> Ditto.
> 
> > +}
> > +#endif /* CONFIG_DEBUG_FS */
> 
> > +static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
> > +{
> > +       struct device *ptr_dev = &dev->dev;
> > +       struct pmc_dev *pmcdev = &pmc;
> > +       const struct x86_cpu_id *cpu_id;
> > +       int err;
> > +
> > +       cpu_id = x86_match_cpu(intel_pmc_core_ids);
> > +       if (!cpu_id) {
> > +               dev_dbg(&dev->dev, "PMC Core: cpuid mismatch.\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       err = pcim_enable_device(dev);
> > +       if (err < 0) {
> > +               dev_dbg(&dev->dev, "PMC Core: failed to enable Power Management Controller.\n");
> > +               return err;
> > +       }
> > +
> > +       err = pci_read_config_dword(dev,
> > +                                   SPT_PMC_BASE_ADDR_OFFSET,
> > +                                   &pmcdev->base_addr);
> > +       if (err < 0) {
> > +               dev_dbg(&dev->dev, "PMC Core: failed to read pci config space.\n");
> 
> PCI
> 
> > +               return err;
> > +       }
> > +       dev_dbg(&dev->dev, "PMC Core: PWRMBASE is %#x\n", pmcdev->base_addr);
> > +
> > +       pmcdev->regmap = devm_ioremap_nocache(ptr_dev,
> > +                                             pmcdev->base_addr,
> > +                                             SPT_PMC_MMIO_REG_LEN);
> 
> I suggest to rename regmap to avoid confusion with regmap framework
> widely used in the drivers. Choose something like base, regs, regbase,
> etc.
> 
> > +       if (!pmcdev->regmap) {
> > +               dev_dbg(&dev->dev, "PMC Core: ioremap failed.\n");
> > +               return -ENOMEM;
> > +       }
> > +
> > +       err = pmc_core_dbgfs_register(pmcdev);
> > +       if (err < 0) {
> > +               dev_err(&dev->dev, "PMC Core: debugfs register failed.\n");
> > +               return err;
> > +       }
> > +
> > +       pmc.has_slp_s0_res = true;
> > +       return 0;
> > +}
> > +
> 
> 
> > +static void intel_pmc_core_remove(struct pci_dev *pdev)
> > +{
> > +       pmc_core_dbgfs_unregister(&pmc);
> > +}
> > +
> > +static struct pci_driver intel_pmc_core_driver = {
> > +       .name = "intel_pmc_core",
> > +       .id_table = pmc_pci_ids,
> > +       .probe = pmc_core_probe,
> > +       .remove = intel_pmc_core_remove,
> > +};
> > +module_pci_driver(intel_pmc_core_driver);
> > +
> > +MODULE_AUTHOR("Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>");
> > +MODULE_AUTHOR("Vishwanath Somayaji <vishwanath.somayaji@intel.com>");
> > +MODULE_DESCRIPTION("Intel CORE SoC Power Management Controller Interface");
> > +MODULE_LICENSE("GPL v2");
> 
> So, since you have symbol defined as boolean, most of the above lines
> are redundant including ->remove() and module.h inclusion.
> 
> Do we need it as a module? In that case you have to set to false
> pmcdev->initialized variable.

It was determined best not to build as a module given the it's primary consumer
was a built-in. Some of that is still being built, so we'll leave it as built-in
until it's in, and we can re-evaluate as needed.

> 
> > +++ b/drivers/platform/x86/intel_pmc_core.h
> > @@ -0,0 +1,53 @@
> > +/*
> > + * Intel Core SOC Power Management Controller Header File
> > + *

SoC

> > + * Copyright (c) 2016, Intel Corporation.
> > + * All Rights Reserved.
> 
> > + * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)
> > + * Author: Vishwanath Somayaji (vishwanath.somayaji@intel.com)
> 
> Authors: Author 1
>           Author 2
> 
> Check the other files.
> 
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
> > +/* Sunrise Point Power Management Controller PCI Device ID */
> > +#define SPT_PMC_PCI_DEVICE_ID                  0x9d21
> > +#define SPT_PMC_BASE_ADDR_OFFSET               0x48
> > +#define SPT_PMC_SLP_S0_RES_COUNTER_OFFSET      0x13c
> > +#define SPT_PMC_MMIO_REG_LEN                   0x100
> > +#define SPT_PMC_REG_BIT_WIDTH                  0x20
> > +#define SPT_PMC_SLP_S0_RES_COUNTER_STEP                0x64
> > +
> > +/**
> > + * struct pmc_dev - pmc device structure
> > + * @base_addr:         comtains pmc base address
> > + * @regmap:            pointer to io-remapped memory location
> > + * @dbgfs_dir:         path to debug fs interface
> > + * @feature_available: flag to indicate whether
> > + *                     the feature is available
> > + *                     on a particular platform or not.
> > + *
> > + * pmc_dev contains info about power management controller device.
> > + */
> > +struct pmc_dev {
> > +       u32 base_addr;
> > +       void __iomem *regmap;
> > +#if IS_ENABLED(CONFIG_DEBUG_FS)
> > +       struct dentry *dbgfs_dir;
> > +#endif /* CONFIG_DEBUG_FS */
> > +       bool has_slp_s0_res;
> > +};
> 
> I doubt this header makes any sense to be exist.

This is a very subjective call, and several folks have weighed in on how they
would like to see it. This could be part of the C file, but there is nothing
wrong with it like this. The important part to me is that the driver specific
stuff is kept close to the driver in this directory, while the interface alone
is exposed in the arch header.

-- 
Darren Hart
Intel Open Source Technology Center
