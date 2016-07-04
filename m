From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Mon, 4 Jul 2016 17:58:59 +0530
Message-ID: <20160704122859.GA28740@rajaneesh-OptiPlex-9010>
References: <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
 <1467108307.30123.303.camel@linux.intel.com>
 <20160629080325.GA11318@rajaneesh-OptiPlex-9010>
 <1467200985.30123.320.camel@linux.intel.com>
 <20160629121604.GA26750@rajaneesh-OptiPlex-9010>
 <1467204505.30123.326.camel@linux.intel.com>
 <20160629132038.GB26750@rajaneesh-OptiPlex-9010>
 <1467207230.30123.329.camel@linux.intel.com>
 <20160704113518.GC1177@rajaneesh-OptiPlex-9010>
 <1467633693.30123.452.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:39288 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753235AbcGDM3D (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jul 2016 08:29:03 -0400
Content-Disposition: inline
In-Reply-To: <1467633693.30123.452.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Mon, Jul 04, 2016 at 03:01:33PM +0300, Andy Shevchenko wrote:
> On Mon, 2016-07-04 at 17:05 +0530, Rajneesh Bhardwaj wrote:
> > >=20
> > >=20
> > > So, if there is no objections (taking into consideration minors y=
ou
> > > mentioned) I think the patch can be applied.
> > >=20
> >=20
> > --- a/drivers/platform/x86/intel_pmc_core.c
> > +++ b/drivers/platform/x86/intel_pmc_core.c
> > @@ -23,6 +23,7 @@
> > =A0#include <linux/init.h>
> > =A0#include <linux/io.h>
> > =A0#include <linux/pci.h>
> > +#include <linux/seq_file.h>
>=20
> What is this for?
>

At this point it may be redundant as there will be no consumer for this=
=2E
We may add it later when it's needed for seq_printf / seq_* etc. So i t=
hink
we might just do away with this for v2.
=20
> >=20
> > =A0#include <asm/cpu_device_id.h>
> > =A0#include <asm/intel-family.h>
> > @@ -88,7 +89,8 @@ static int pmc_core_dev_state_get(void *data, u64
> > *val)
> > =A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > =A0}
> >=20
> > -DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_ge=
t,
> > NULL,
> > "%llu");
> > +DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_ge=
t,
> > NULL,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"%llu\n");
>=20
> Okay, since debugfs is actually using them in standard code, we may a=
dd
> it here as well.
>=20
> > --- a/drivers/platform/x86/intel_pmc_core.h
> > +++ b/drivers/platform/x86/intel_pmc_core.h
> > @@ -29,7 +29,6 @@
> > =A0#define SPT_PMC_MMIO_REG_LEN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A00x100
> > =A0#define SPT_PMC_SLP_S0_RES_COUNTER_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A00x64
> >=20
> > -struct dentry;
>=20
> Agreed.
>=20
> --=20
>=20
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy

--=20
Best Regards,
Rajneesh
