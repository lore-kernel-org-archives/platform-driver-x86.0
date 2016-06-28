From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Tue, 28 Jun 2016 13:05:07 +0300
Message-ID: <1467108307.30123.303.camel@linux.intel.com>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:49527 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752171AbcF1KFL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 06:05:11 -0400
In-Reply-To: <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Tue, 2016-06-28 at 14:35 +0530, Rajneesh Bhardwaj wrote:
> On Mon, Jun 13, 2016 at 08:56:49PM +0300, Andy Shevchenko wrote:
> > This patch does the following:
> > - refactors code to use recently introduced
> > DEFINE_DEBUGFS_ATTRIBUTE() macro
> > - makes absence of DEBUG_FS non-fatal error


> > -	counter_val =3D pmc_core_reg_read(pmcdev,
> > -					SPT_PMC_SLP_S0_RES_COUNTER_
> > OFFSET);
> > -	seq_printf(s, "%u\n",
> > pmc_core_adjust_slp_s0_step(counter_val));
> > +	value =3D pmc_core_reg_read(pmcdev,
> > SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
> > +	*val =3D pmc_core_adjust_slp_s0_step(value);
> > =C2=A0
>=20
> We were ensuring a new line for printing the output value with
> seq_printf=C2=A0
> whereas in this case the output is printed along with the shell
> prompt.
> Sometimes this could be harder to read.

This would be a difference in the behaviour to a generic assumption
(since this new macro is going to be used by plenty of simple attribute=
s
under debugfs). If you still consider it's inappropriate I would
recommend to propose a fix globally then.

Regarding to change behaviour of the current implementation I think
Darren can tell his opinion. (For me at least pros and cons of new
format quite obvious).

> =C2=A0
> > +struct dentry;
> > +
>=20
> Why do we need this ?

Since we are using pointer to undefined type.

>=20
> > =C2=A0/**
> > =C2=A0 * struct pmc_dev - pmc device structure
> > =C2=A0 * @base_addr:		comtains pmc base address
> > @@ -42,9 +45,7 @@
> > =C2=A0struct pmc_dev {
> > =C2=A0	u32 base_addr;
> > =C2=A0	void __iomem *regbase;
> > -#if IS_ENABLED(CONFIG_DEBUG_FS)
> > =C2=A0	struct dentry *dbgfs_dir;
> > -#endif /* CONFIG_DEBUG_FS */



--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
