From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86: Add PMC Driver for Intel Core SOC
Date: Mon, 25 Apr 2016 11:10:49 -0700
Message-ID: <20160425181049.GF2115@f23x64.localdomain>
References: <1461236605-27245-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <20160421124728.GA8392@tyrael>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34162 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932905AbcDYSKv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Apr 2016 14:10:51 -0400
Content-Disposition: inline
In-Reply-To: <20160421124728.GA8392@tyrael>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, vishwanath.somayaji@intel.com

On Thu, Apr 21, 2016 at 03:47:29PM +0300, Giedrius Statkevi=C4=8Dius wr=
ote:
> On Thu, Apr 21, 2016 at 04:33:25PM +0530, Rajneesh Bhardwaj wrote:
> [...]
>=20
> Just some minor things I've spotted and one error is probably uncheck=
ed.
>=20
> [...]
> > diff --git a/arch/x86/include/asm/pmc_core.h b/arch/x86/include/asm=
/pmc_core.h
> > new file mode 100644
> > index 0000000..3ea61bf
> > --- /dev/null
> > +++ b/arch/x86/include/asm/pmc_core.h
> > @@ -0,0 +1,53 @@
> > +/*
> > + * Intel Core SOC Power Management Controller Header File
> > + *
> > + * Copyright (c) 2016, Intel Corporation.
> > + * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify it
> > + * under the terms and conditions of the GNU General Public Licens=
e,
> > + * version 2, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but =
WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABIL=
ITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public L=
icense for
> > + * more details.
> > + *
> > + */
> > +
> > +#ifndef PMC_CORE_H
> > +#define PMC_CORE_H
> > +
> > +/* Skylake Power Management Controller PCI Device ID */
> > +#define PCI_DEVICE_ID_SKL_PMC   0x9d21
> > +#define PMC_BASE_ADDR_OFFSET    0x48
> > +#define PMC_SLP_S0_RESIDENCY_COUNTER 0x13c
> > +#define PMC_MMIO_REG_LEN        0x100
> > +#define PMC_REG_BIT_WIDTH       0x20
> > +#define SLP_S0_RESIDENCY_COUNTER_GRANULARITY 0x64
>=20
> Inconsistent spaces. Maybe just use one space.
>=20
> [...]
>=20
> > diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platfo=
rm/x86/intel_pmc_core.c
> > new file mode 100644
> > index 0000000..42cee87
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_pmc_core.c
> > @@ -0,0 +1,200 @@
> > +/*
> > + * Intel Core SOC Power Management Controller Driver
> > + *
> > + * Copyright (c) 2016, Intel Corporation.
> > + * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify it
> > + * under the terms and conditions of the GNU General Public Licens=
e,
> > + * version 2, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but =
WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABIL=
ITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public L=
icense for
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
> > +static const struct pci_device_id pmc_pci_ids[] =3D {
> > +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_SKL_PMC), (kernel_ulong_t)NULL=
 },
>=20
> Minor thing here but maybe just use a simple 0 here instead of
> (kernel_ulong_t)NULL? In the other places as well.
>=20
> [...]
>=20

Please provide the rational for a request for change. What do you think=
 is wrong
with the above? There is precedent in the kernel today for this usage. =
Is it
wrong? Unnecessary? Subjectively ugly?

> > +static int pmc_core_dbgfs_register(struct pmc_dev *pmc)
> > +{
> > +	return 0; /* nothing to register */
> > +}
> > +
> > +#endif /* CONFIG_DEBUG_FS */
> > +
> > +static const struct x86_cpu_id intel_pmc_core_ids[] =3D {
> > +	{ X86_VENDOR_INTEL, 6, 0x4e, X86_FEATURE_MWAIT,
> > +		(kernel_ulong_t)NULL}, /* SKL CPU*/
> > +	{ X86_VENDOR_INTEL, 6, 0x5e, X86_FEATURE_MWAIT,
> > +		(kernel_ulong_t)NULL}, /* SKL CPU*/
> > +	{}
>=20
> A space after CPU? SKL? I assume this means skylake so perhaps add th=
e whole
> name.
>=20

The three letter CPU code is very common throughout the kernel of Intel=
 CPUs.
NHM,WSM,SNB,IVB,BYT,HSW,BDW,SKL, etc.

Those are becoming more and more difficult to grep for though, so a ful=
l
expansion now and then would certainly be nice :-)

> > +};
> > +MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_ids);
> > +
> > +static int pmc_core_probe(struct pci_dev *dev, const struct pci_de=
vice_id *id)
> > +{
> > +	int err;
> > +	const struct x86_cpu_id *cpu_id;
> > +
> > +	cpu_id =3D x86_match_cpu(intel_pmc_core_ids);
> > +	if (!cpu_id)
> > +		return -EINVAL;
> > +
> > +	err =3D pci_enable_device(dev);
> > +	if (err) {
> > +		dev_err(&dev->dev, "PMC Core: failed to enable Power Management =
Controller.\n");
> > +		goto exit;
> > +	}
> > +
> > +	pci_read_config_dword(dev, PMC_BASE_ADDR_OFFSET, &pmc.base_addr);
>=20
> Shouldn't the return value of this function be checked if an error oc=
cured? Also

Yes please.

> while we are at it maybe the label names could be improved. For examp=
le:
> err_disable_dev; err_return
>=20

This is more typical, although "out" or "err_out" if only used in the e=
rror
case. However, if the label does nothing but return with an error code,=
 be sure
to be consistent in it's usage. Don't do "return -EINVAL" and "ret =3D =
-EINVAL;
goto err_out;" in the same function.


Thanks,

> > +	err =3D pmc_core_dbgfs_register(&pmc);
> > +	if (err) {
> > +		dev_err(&dev->dev, "PMC Core: debugfs register failed\n");
> > +		iounmap(pmc.regmap);
> > +		goto disable;
> > +	}
> > +
> > +	pmc.feature_available =3D 1;
> > +	return 0;
> > +
> > +disable:
> > +	pci_disable_device(dev);
> > +exit:
> > +	return err;
> > +}
> > +
>=20

--=20
Darren Hart
Intel Open Source Technology Center
