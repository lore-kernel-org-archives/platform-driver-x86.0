From: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: Re: [PATCH] platform:x86: Add PMC Driver for Intel Core SOC
Date: Thu, 21 Apr 2016 15:47:29 +0300
Message-ID: <20160421124728.GA8392@tyrael>
References: <1461236605-27245-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33487 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751949AbcDUMrc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Apr 2016 08:47:32 -0400
Received: by mail-wm0-f67.google.com with SMTP id r12so9655736wme.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Apr 2016 05:47:31 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1461236605-27245-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, vishwanath.somayaji@intel.com

On Thu, Apr 21, 2016 at 04:33:25PM +0530, Rajneesh Bhardwaj wrote:
[...]

Just some minor things I've spotted and one error is probably unchecked.

[...]
> diff --git a/arch/x86/include/asm/pmc_core.h b/arch/x86/include/asm/pmc_core.h
> new file mode 100644
> index 0000000..3ea61bf
> --- /dev/null
> +++ b/arch/x86/include/asm/pmc_core.h
> @@ -0,0 +1,53 @@
> +/*
> + * Intel Core SOC Power Management Controller Header File
> + *
> + * Copyright (c) 2016, Intel Corporation.
> + * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)
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
> +#ifndef PMC_CORE_H
> +#define PMC_CORE_H
> +
> +/* Skylake Power Management Controller PCI Device ID */
> +#define PCI_DEVICE_ID_SKL_PMC   0x9d21
> +#define PMC_BASE_ADDR_OFFSET    0x48
> +#define PMC_SLP_S0_RESIDENCY_COUNTER 0x13c
> +#define PMC_MMIO_REG_LEN        0x100
> +#define PMC_REG_BIT_WIDTH       0x20
> +#define SLP_S0_RESIDENCY_COUNTER_GRANULARITY 0x64

Inconsistent spaces. Maybe just use one space.

[...]

> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> new file mode 100644
> index 0000000..42cee87
> --- /dev/null
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -0,0 +1,200 @@
> +/*
> + * Intel Core SOC Power Management Controller Driver
> + *
> + * Copyright (c) 2016, Intel Corporation.
> + * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)
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
> +#include <asm/cpu_device_id.h>
> +#include <asm/pmc_core.h>
> +
> +static struct pmc_dev pmc;
> +
> +static const struct pci_device_id pmc_pci_ids[] = {
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_SKL_PMC), (kernel_ulong_t)NULL },

Minor thing here but maybe just use a simple 0 here instead of
(kernel_ulong_t)NULL? In the other places as well.

[...]

> +static int pmc_core_dbgfs_register(struct pmc_dev *pmc)
> +{
> +	return 0; /* nothing to register */
> +}
> +
> +#endif /* CONFIG_DEBUG_FS */
> +
> +static const struct x86_cpu_id intel_pmc_core_ids[] = {
> +	{ X86_VENDOR_INTEL, 6, 0x4e, X86_FEATURE_MWAIT,
> +		(kernel_ulong_t)NULL}, /* SKL CPU*/
> +	{ X86_VENDOR_INTEL, 6, 0x5e, X86_FEATURE_MWAIT,
> +		(kernel_ulong_t)NULL}, /* SKL CPU*/
> +	{}

A space after CPU? SKL? I assume this means skylake so perhaps add the whole
name.

> +};
> +MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_ids);
> +
> +static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
> +{
> +	int err;
> +	const struct x86_cpu_id *cpu_id;
> +
> +	cpu_id = x86_match_cpu(intel_pmc_core_ids);
> +	if (!cpu_id)
> +		return -EINVAL;
> +
> +	err = pci_enable_device(dev);
> +	if (err) {
> +		dev_err(&dev->dev, "PMC Core: failed to enable Power Management Controller.\n");
> +		goto exit;
> +	}
> +
> +	pci_read_config_dword(dev, PMC_BASE_ADDR_OFFSET, &pmc.base_addr);

Shouldn't the return value of this function be checked if an error occured? Also
while we are at it maybe the label names could be improved. For example:
err_disable_dev; err_return

> +	err = pmc_core_dbgfs_register(&pmc);
> +	if (err) {
> +		dev_err(&dev->dev, "PMC Core: debugfs register failed\n");
> +		iounmap(pmc.regmap);
> +		goto disable;
> +	}
> +
> +	pmc.feature_available = 1;
> +	return 0;
> +
> +disable:
> +	pci_disable_device(dev);
> +exit:
> +	return err;
> +}
> +
