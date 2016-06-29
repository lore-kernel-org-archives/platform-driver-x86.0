From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Wed, 29 Jun 2016 18:50:38 +0530
Message-ID: <20160629132038.GB26750@rajaneesh-OptiPlex-9010>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
 <1467108307.30123.303.camel@linux.intel.com>
 <20160629080325.GA11318@rajaneesh-OptiPlex-9010>
 <1467200985.30123.320.camel@linux.intel.com>
 <20160629121604.GA26750@rajaneesh-OptiPlex-9010>
 <1467204505.30123.326.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:5369 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752043AbcF2NUl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 09:20:41 -0400
Content-Disposition: inline
In-Reply-To: <1467204505.30123.326.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Wed, Jun 29, 2016 at 03:48:25PM +0300, Andy Shevchenko wrote:
> On Wed, 2016-06-29 at 17:46 +0530, Rajneesh Bhardwaj wrote:
> > On Wed, Jun 29, 2016 at 02:49:45PM +0300, Andy Shevchenko wrote:
> > > On Wed, 2016-06-29 at 13:33 +0530, Rajneesh Bhardwaj wrote:
> > > > On Tue, Jun 28, 2016 at 01:05:07PM +0300, Andy Shevchenko wrote=
:
>=20
> > > > While this is good for simple attributes i see a potential issu=
e
> > > > with
> > > > this
> > > > approch when we want to display multiple attributes for a singl=
e
> > > > debugfs
> > > > entry.
> > > > =A0We typically use seq_printf in a loop and display multiline
> > > > output
> > > > for a single debugfs entry. How do we go about the scenarios wh=
ere
> > > > we
> > > > want
> > > > to display formatted=A0=A0multiline debug information?
> > >=20
> > > We are talking about abstract case or is it change coming to this
> > > very
> > > driver?
> > >=20
> >=20
> > We will be sending few patches for this very driver shortly and one
> > such
> > feature would require multiline formatted output for a single debug=
fs=20
> > entry.
>=20
> If it touches the same attribute it needs to be seen first before
> applying this one.
>

No, this attribute wont be touched.
=20
> >=20
> > Can we have seq_printf for such cases and use DEFINE_DEBUGFS_ATTRIB=
UTE
> > for
> > other simple attributes? Doing this might raise some coding style
> > consistency=A0
> > concerns though so lets wait to hear=A0=A0Darren's opinion on this =
patch.
>=20
> For the rest we have to see the implementation and decide how to proc=
eed
> (since it's a debugfs dedicated for _debugging_) we might change it i=
n
> the way we like. Though I don't encourage people to do this. I like
> interfaces on which people thought before implementing.
>=20

Sure, i am fine with DEFINE_DEBUGFS_ATTRIBUTE but would like to leave t=
he scope
for having seq_printf for future patches i.e. linux/seq_file.h and thus=
 would
have a dependency on struct file_operations for seq_read.

> --=20
>=20
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy

--=20
Best Regards,
Rajneesh
