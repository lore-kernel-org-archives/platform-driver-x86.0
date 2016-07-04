From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Mon, 04 Jul 2016 15:01:33 +0300
Message-ID: <1467633693.30123.452.camel@linux.intel.com>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
 <1467108307.30123.303.camel@linux.intel.com>
 <20160629080325.GA11318@rajaneesh-OptiPlex-9010>
 <1467200985.30123.320.camel@linux.intel.com>
 <20160629121604.GA26750@rajaneesh-OptiPlex-9010>
 <1467204505.30123.326.camel@linux.intel.com>
 <20160629132038.GB26750@rajaneesh-OptiPlex-9010>
 <1467207230.30123.329.camel@linux.intel.com>
	 <20160704113518.GC1177@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:18441 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753161AbcGDMBg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jul 2016 08:01:36 -0400
In-Reply-To: <20160704113518.GC1177@rajaneesh-OptiPlex-9010>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Mon, 2016-07-04 at 17:05 +0530, Rajneesh Bhardwaj wrote:
> >=20
> >=20
> > So, if there is no objections (taking into consideration minors you
> > mentioned) I think the patch can be applied.
> >=20
>=20
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -23,6 +23,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/io.h>
> =C2=A0#include <linux/pci.h>
> +#include <linux/seq_file.h>

What is this for?

>=20
> =C2=A0#include <asm/cpu_device_id.h>
> =C2=A0#include <asm/intel-family.h>
> @@ -88,7 +89,8 @@ static int pmc_core_dev_state_get(void *data, u64
> *val)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
>=20
> -DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get,
> NULL,
> "%llu");
> +DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get,
> NULL,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"%=
llu\n");

Okay, since debugfs is actually using them in standard code, we may add
it here as well.

> --- a/drivers/platform/x86/intel_pmc_core.h
> +++ b/drivers/platform/x86/intel_pmc_core.h
> @@ -29,7 +29,6 @@
> =C2=A0#define SPT_PMC_MMIO_REG_LEN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x100
> =C2=A0#define SPT_PMC_SLP_S0_RES_COUNTER_STEP=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
0x64
>=20
> -struct dentry;

Agreed.

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
