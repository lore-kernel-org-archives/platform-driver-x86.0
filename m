From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4] platform:x86: Add PMC Driver for Intel Core SOC
Date: Thu, 12 May 2016 18:02:45 +0300
Message-ID: <CAHp75VfHzh2mBtNBGDHcz9BZ5C8eAdSxUqXq1Cdn-ujm9mtX8g@mail.gmail.com>
References: <1463061001-23210-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34710 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752071AbcELPOa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 May 2016 11:14:30 -0400
In-Reply-To: <1463061001-23210-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, "dvhart@infradead.org" <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, vishwanath.somayaji@intel.com

On Thu, May 12, 2016 at 4:50 PM, Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:

Sorry for a bit late review, but I think there are still issues need
to be addressed.

> This patch adds the Power Management Controller driver as a pci driver
> for Intel Core SOC architecture.

SOC -> SoC

>
> This driver can utilize debugging capabilities and supported features
> as exposed by the Power Management Controller.
>
> Please refer to the below specification for more details on PMC features.
> http://www.intel.in/content/www/in/en/chipsets/100-series-chipset-datasheet-vol-2.html
>
> The current version of this driver exposes slp_s0_residency counter.
> This counter can be used for detecting fragile SLP_S0 signal related
> failures and take corrective actions when PCH SLP_S0 signal is not
> asserted after kernel freeze as part of suspend to idle flow
> (echo freeze > /sys/power/state).
>
> Intel Platform Controller Hub (PCH) asserts SLP_S0 signal when it
> detects favorable conditions to enter its low power mode. As a
> pre-requisite the SOC should be in deepest possible Package C-State
> and devices should be in low power mode. For example, on Skylake SOC

Ditto.
Check entire code for this.

> the deepest Package C-State is Package C10 or PC10. Suspend to idle
> flow generally leads to PC10 state but PC10 state may not be sufficient
> for realizing the platform wide power potential which SLP_S0 signal
> assertion can provide.
>
> SLP_S0 signal is often connected to the Embedded Controller (EC) and the
> Power Management IC (PMIC) for other platform power management related
> optimizations.
>
> In general, SLP_S0 assertion == PC10 + PCH low power mode + ModPhy Lanes
> power gated + PLL Idle.
>
> As part of this driver, a mechanism to read the slp_s0 residency is exposed
> as an api and also debugfs features are added to indicate slp_s0 signal

api -> API

> assertion residency in microseconds.
>
> echo freeze > /sys/power/state
> wake the system
> cat /sys/kernel/debug/pmc_core/slp_s0_residency_usec
>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Signed-off-by: Vishwanath Somayaji <vishwanath.somayaji@intel.com>

Two people (1).


> +INTEL PMC CORE DRIVER
> +M:      Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> +M:      Vishwanath Somayaji <vishwanath.somayaji@intel.com>
> +L:      platform-driver-x86@vger.kernel.org
> +S:      Maintained
> +F:      drivers/platform/x86/intel_pmc_core.h
> +F:      drivers/platform/x86/intel_pmc_core.c

So, we have arch/x86/platform/atom/pmc_atom.c

This driver looks very similar (by what functional is), so, we have to
become clear what our layout is.
Either we go with drivers/platform/x86 or with arch/x86/platform.

> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -821,6 +821,18 @@ config INTEL_IPS
>           functionality.  If in doubt, say Y here; it will only load on
>           supported platforms.
>
> +config INTEL_PMC_CORE

Better to locate this in alphabetical order.

> +       bool "Intel PMC Core driver"
> +       depends on X86 && PCI

> +       ---help---
> +         The Intel Platform Controller Hub for Intel Core SoCs provides access
> +         to Power Management Controller registers via a pci interface. This
> +         driver can utilize debugging capabilities and supported features as
> +         exposed by the Power Management Controller.
> +
> +         Supported features:
> +               - slp_s0_residency counter.
> +
>  config INTEL_IMR
>         bool "Intel Isolated Memory Region support"
>         default n
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 448443c..9b11b40 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,3 +69,4 @@ obj-$(CONFIG_INTEL_PUNIT_IPC)  += intel_punit_ipc.o
>  obj-$(CONFIG_INTEL_TELEMETRY)  += intel_telemetry_core.o \
>                                    intel_telemetry_pltdrv.o \
>                                    intel_telemetry_debugfs.o
> +obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> new file mode 100644
> index 0000000..0b5388e
> --- /dev/null
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -0,0 +1,201 @@
> +/*
> + * Intel Core SOC Power Management Controller Driver
> + *
> + * Copyright (c) 2016, Intel Corporation.
> + * All Rights Reserved.

> + * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)

(2)

In (1) you put two people, here is one. Please, explain who is the
author and why SoB is not in align with Author(s).

> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + */
> +
> +#include <linux/init.h>
> +#include <linux/pci.h>
> +#include <linux/device.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/module.h>
> +#include <linux/io.h>

Alphabetical order.

+ empty line

> +#include <asm/cpu_device_id.h>

+ empty line

> +#include "intel_pmc_core.h"
> +

> +static struct pmc_dev pmc;
> +
> +static const struct pci_device_id pmc_pci_ids[] = {
> +       { PCI_VDEVICE(INTEL, SPT_PMC_PCI_DEVICE_ID), (kernel_ulong_t)NULL },

No need to have an explicit NULL

> +       { 0, },
> +};
> +MODULE_DEVICE_TABLE(pci, pmc_pci_ids);
> +
> +/**
> + * intel_pmc_slp_s0_counter_read() - Read slp_s0 residency.
> + * @data: Out param that contains current slp_s0 count.
> + *
> + * This API currently supports Intel Skylake SOC and Sunrise
> + * point Platform Controller Hub. Future platform support

Either Sunrisepoint or Sunrise Point.
SOC -> SoC

> + * should be added for platforms that support low power modes
> + * beyond Package C10 state.
> + *
> + * SLP_S0_RESIDENCY counter counts in 100 us granularity per
> + * step hence function populates the multiplied value in out
> + * parameter @data

+ dot at the end of sentence.

> + *
> + * Return:     an error code or 0 on success.
> + */
> +int intel_pmc_slp_s0_counter_read(u64 *data)
> +{

struct pmc_dev *pmcdev = &pmc;


> +       if (!pmc.has_slp_s0_res)

'pmc.' -> 'pmcdev->'

> +               return -EACCES;
> +
> +       *data = readl(pmc.regmap + SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);

Ditto.

> +       *data *= SPT_PMC_SLP_S0_RES_COUNTER_STEP;

Use temporary variable.

u64 value;

value = readl();
value *= ;

*data = value;

This makes only one place where you assign returning value.

> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(intel_pmc_slp_s0_counter_read);

Who is going to be a user of that?

> +

> +#if IS_ENABLED(CONFIG_DEBUG_FS)


> +static int pmc_core_dev_state_show(struct seq_file *s, void *unused)
> +{

Pointer to pmc, i.e. pmc_dev *, would be supplied in seq_file. Take it
from there...

> +       u64 counter_val;

u64 value;

> +       int err;
> +
> +       err = intel_pmc_slp_s0_counter_read(&counter_val);

...thus split your function to internal, which takes pmc_dev * as a
first parameter and use exported variant for users which takes global
variable.

int intel_pmc_slp_s0_counter_read(u64 *data)
{
 struct pmc_dev *pmcdev = &pmc;

 return do_counter_read(pmcdev, data);
}


> +       if (!err)
> +               seq_printf(s, "%lld\n", counter_val);

Please, use positive check

if (err)
 return err;

> +
> +       return err;
> +}
> +
> +static int pmc_core_dev_state_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, pmc_core_dev_state_show, inode->i_private);
> +}
> +
> +static const struct file_operations pmc_core_dev_state_ops = {
> +       .open           = pmc_core_dev_state_open,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +

> +static void pmc_core_dbgfs_unregister(struct pmc_dev *pmc)
> +{
> +       debugfs_remove_recursive(pmc->dbgfs_dir);
> +}

No need to keep this under #ifdef.

> +
> +static int pmc_core_dbgfs_register(struct pmc_dev *pmc)
> +{
> +       struct dentry *dir, *file;

> +       int ret = 0;

Redundant, see below.

> +
> +       dir = debugfs_create_dir("pmc_core", NULL);
> +       if (!dir)
> +               return -ENOMEM;
> +
> +       pmc->dbgfs_dir = dir;
> +       file = debugfs_create_file("slp_s0_residency_usec", S_IFREG | S_IRUGO,
> +                                  dir, pmc, &pmc_core_dev_state_ops);
> +
> +       if (!file) {
> +               pmc_core_dbgfs_unregister(pmc);
> +               ret = -ENODEV;

return -ENODEV;

> +       }

> +       return ret;

return 0;

> +}
> +#else
> +static inline int pmc_core_dbgfs_register(struct pmc_dev *pmc)
> +{
> +       return 0; /* nothing to register */
> +}
> +

> +static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmc)
> +{
> +       /* nothing to deregister */
> +}

Redundant.

> +#endif /* CONFIG_DEBUG_FS */
> +
> +static const struct x86_cpu_id intel_pmc_core_ids[] = {
> +       { X86_VENDOR_INTEL, 6, 0x4e, X86_FEATURE_MWAIT,
> +               (kernel_ulong_t)NULL}, /* Skylake CPUID Signature */

No explicit NULL.

> +       { X86_VENDOR_INTEL, 6, 0x5e, X86_FEATURE_MWAIT,
> +               (kernel_ulong_t)NULL}, /* Skylake CPUID Signature */

Ditto.

> +       {}
> +};
> +MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_ids);
> +
> +static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
> +{

> +       int err;
> +       const struct x86_cpu_id *cpu_id;

Swap them.

 +       const struct x86_cpu_id *cpu_id;
 +       int err;

struct pmc_dev *pmcdev = &pmc;

> +
> +       cpu_id = x86_match_cpu(intel_pmc_core_ids);
> +       if (!cpu_id) {
> +               err = -EINVAL;
> +               goto exit;
> +       }
> +
> +       err = pci_enable_device(dev);

pcim_enable_device();

> +       if (err) {
> +               dev_err(&dev->dev, "PMC Core: failed to enable Power Management Controller.\n");

I doubt this message is useful anyhow.

> +               goto exit;
> +       }
> +
> +       err = pci_read_config_dword(dev,
> +                                   SPT_PMC_BASE_ADDR_OFFSET,
> +                                   &pmc.base_addr);

'pmc.' -> 'pmcdev->'

> +       if (err) {
> +               dev_err(&dev->dev, "PMC Core: failed to read pci config space.\n");
> +               goto disable_pci;
> +       }

So, and this is not available through BARs?

> +       dev_dbg(&dev->dev, "PMC Core: PWRMBASE is 0x%x\n", pmc.base_addr);

%#x will prefix the number.

> +
> +       pmc.regmap = ioremap_nocache(pmc.base_addr, SPT_PMC_MMIO_REG_LEN);
> +       if (!pmc.regmap) {

> +               dev_err(&dev->dev, "PMC Core: ioremap failed\n");

Useful?

> +               err = -ENOMEM;
> +               goto disable_pci;
> +       }
> +
> +       err = pmc_core_dbgfs_register(&pmc);
> +       if (err) {
> +               dev_err(&dev->dev, "PMC Core: debugfs register failed\n");
> +               iounmap(pmc.regmap);
> +               goto disable_pci;
> +       }
> +
> +       pmc.has_slp_s0_res = true;


> +       return 0;
> +

> +disable_pci:
> +       pci_disable_device(dev);

Remove after using pcim_*().

> +exit:

Redundant. Use return directly.

> +       return err;
> +}
> +
> +static void intel_pmc_core_remove(struct pci_dev *pdev)
> +{
> +       pmc_core_dbgfs_unregister(&pmc);
> +       pci_disable_device(pdev);
> +       iounmap(pmc.regmap);
> +}


-- 
With Best Regards,
Andy Shevchenko
