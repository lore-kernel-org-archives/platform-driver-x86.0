From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Wed, 29 Jun 2016 14:49:45 +0300
Message-ID: <1467200985.30123.320.camel@linux.intel.com>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
 <1467108307.30123.303.camel@linux.intel.com>
	 <20160629080325.GA11318@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:46413 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751168AbcF2Ltt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 07:49:49 -0400
In-Reply-To: <20160629080325.GA11318@rajaneesh-OptiPlex-9010>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Wed, 2016-06-29 at 13:33 +0530, Rajneesh Bhardwaj wrote:
> On Tue, Jun 28, 2016 at 01:05:07PM +0300, Andy Shevchenko wrote:
> > On Tue, 2016-06-28 at 14:35 +0530, Rajneesh Bhardwaj wrote:
> > > On Mon, Jun 13, 2016 at 08:56:49PM +0300, Andy Shevchenko wrote:
> > > > This patch does the following:
> > > > - refactors code to use recently introduced
> > > > DEFINE_DEBUGFS_ATTRIBUTE() macro
> > > > - makes absence of DEBUG_FS non-fatal error
> >=20
> >=20
> > > > -	counter_val =3D pmc_core_reg_read(pmcdev,
> > > > -					SPT_PMC_SLP_S0_RES_COUN
> > > > TER_
> > > > OFFSET);
> > > > -	seq_printf(s, "%u\n",
> > > > pmc_core_adjust_slp_s0_step(counter_val));
> > > > +	value =3D pmc_core_reg_read(pmcdev,
> > > > SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
> > > > +	*val =3D pmc_core_adjust_slp_s0_step(value);
> > > > =C2=A0
> > >=20
> > > We were ensuring a new line for printing the output value with
> > > seq_printf=C2=A0
> > > whereas in this case the output is printed along with the shell
> > > prompt.
> > > Sometimes this could be harder to read.
> >=20
> > This would be a difference in the behaviour to a generic assumption
> > (since this new macro is going to be used by plenty of simple
> > attributes
> > under debugfs). If you still consider it's inappropriate I would
> > recommend to propose a fix globally then.
> >=20
> > Regarding to change behaviour of the current implementation I think
> > Darren can tell his opinion. (For me at least pros and cons of new
> > format quite obvious).
> >=20
>=20
> While this is good for simple attributes i see a potential issue with
> this
> approch when we want to display multiple attributes for a single
> debugfs
> entry.
>  We typically use seq_printf in a loop and display multiline output
> for a single debugfs entry. How do we go about the scenarios where we
> want
> to display formatted=C2=A0=C2=A0multiline debug information?

We are talking about abstract case or is it change coming to this very
driver?

> =C2=A0
> > > =C2=A0
> > > > +struct dentry;
> > > > +
> > >=20
> > > Why do we need this ?
> >=20
> > Since we are using pointer to undefined type.
> >=20
>=20
> I think we can omit this line if we chose to take this approach.

Yeah, it does not produce a warning on new compilers, though I think
Darren can share his opinion.


--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
