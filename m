From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Wed, 29 Jun 2016 17:46:04 +0530
Message-ID: <20160629121604.GA26750@rajaneesh-OptiPlex-9010>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
 <1467108307.30123.303.camel@linux.intel.com>
 <20160629080325.GA11318@rajaneesh-OptiPlex-9010>
 <1467200985.30123.320.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:46470 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751962AbcF2MQI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 08:16:08 -0400
Content-Disposition: inline
In-Reply-To: <1467200985.30123.320.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Wed, Jun 29, 2016 at 02:49:45PM +0300, Andy Shevchenko wrote:
> On Wed, 2016-06-29 at 13:33 +0530, Rajneesh Bhardwaj wrote:
> > On Tue, Jun 28, 2016 at 01:05:07PM +0300, Andy Shevchenko wrote:
> > > On Tue, 2016-06-28 at 14:35 +0530, Rajneesh Bhardwaj wrote:
> > > > On Mon, Jun 13, 2016 at 08:56:49PM +0300, Andy Shevchenko wrote=
:
> > > > > This patch does the following:
> > > > > - refactors code to use recently introduced
> > > > > DEFINE_DEBUGFS_ATTRIBUTE() macro
> > > > > - makes absence of DEBUG_FS non-fatal error
> > >=20
> > >=20
> > > > > -	counter_val =3D pmc_core_reg_read(pmcdev,
> > > > > -					SPT_PMC_SLP_S0_RES_COUN
> > > > > TER_
> > > > > OFFSET);
> > > > > -	seq_printf(s, "%u\n",
> > > > > pmc_core_adjust_slp_s0_step(counter_val));
> > > > > +	value =3D pmc_core_reg_read(pmcdev,
> > > > > SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
> > > > > +	*val =3D pmc_core_adjust_slp_s0_step(value);
> > > > > =A0
> > > >=20
> > > > We were ensuring a new line for printing the output value with
> > > > seq_printf=A0
> > > > whereas in this case the output is printed along with the shell
> > > > prompt.
> > > > Sometimes this could be harder to read.
> > >=20
> > > This would be a difference in the behaviour to a generic assumpti=
on
> > > (since this new macro is going to be used by plenty of simple
> > > attributes
> > > under debugfs). If you still consider it's inappropriate I would
> > > recommend to propose a fix globally then.
> > >=20
> > > Regarding to change behaviour of the current implementation I thi=
nk
> > > Darren can tell his opinion. (For me at least pros and cons of ne=
w
> > > format quite obvious).
> > >=20
> >=20
> > While this is good for simple attributes i see a potential issue wi=
th
> > this
> > approch when we want to display multiple attributes for a single
> > debugfs
> > entry.
> >  We typically use seq_printf in a loop and display multiline output
> > for a single debugfs entry. How do we go about the scenarios where =
we
> > want
> > to display formatted=A0=A0multiline debug information?
>=20
> We are talking about abstract case or is it change coming to this ver=
y
> driver?
>

We will be sending few patches for this very driver shortly and one suc=
h
feature would require multiline formatted output for a single debugfs e=
ntry.

Can we have seq_printf for such cases and use DEFINE_DEBUGFS_ATTRIBUTE =
for
other simple attributes? Doing this might raise some coding style consi=
stency=20
concerns though so lets wait to hear  Darren's opinion on this patch.
=20
> > =A0
> > > > =A0
> > > > > +struct dentry;
> > > > > +
> > > >=20
> > > > Why do we need this ?
> > >=20
> > > Since we are using pointer to undefined type.
> > >=20
> >=20
> > I think we can omit this line if we chose to take this approach.
>=20
> Yeah, it does not produce a warning on new compilers, though I think
> Darren can share his opinion.
>=20

Sure.

>=20
> --=20
>=20
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy
i> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Best Regards,
Rajneesh
