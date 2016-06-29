From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Wed, 29 Jun 2016 15:48:25 +0300
Message-ID: <1467204505.30123.326.camel@linux.intel.com>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
 <1467108307.30123.303.camel@linux.intel.com>
 <20160629080325.GA11318@rajaneesh-OptiPlex-9010>
 <1467200985.30123.320.camel@linux.intel.com>
	 <20160629121604.GA26750@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:2354 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752082AbcF2Ms3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 08:48:29 -0400
In-Reply-To: <20160629121604.GA26750@rajaneesh-OptiPlex-9010>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Wed, 2016-06-29 at 17:46 +0530, Rajneesh Bhardwaj wrote:
> On Wed, Jun 29, 2016 at 02:49:45PM +0300, Andy Shevchenko wrote:
> > On Wed, 2016-06-29 at 13:33 +0530, Rajneesh Bhardwaj wrote:
> > > On Tue, Jun 28, 2016 at 01:05:07PM +0300, Andy Shevchenko wrote:

> > > While this is good for simple attributes i see a potential issue
> > > with
> > > this
> > > approch when we want to display multiple attributes for a single
> > > debugfs
> > > entry.
> > > =C2=A0We typically use seq_printf in a loop and display multiline
> > > output
> > > for a single debugfs entry. How do we go about the scenarios wher=
e
> > > we
> > > want
> > > to display formatted=C2=A0=C2=A0multiline debug information?
> >=20
> > We are talking about abstract case or is it change coming to this
> > very
> > driver?
> >=20
>=20
> We will be sending few patches for this very driver shortly and one
> such
> feature would require multiline formatted output for a single debugfs=
=20
> entry.

If it touches the same attribute it needs to be seen first before
applying this one.

>=20
> Can we have seq_printf for such cases and use DEFINE_DEBUGFS_ATTRIBUT=
E
> for
> other simple attributes? Doing this might raise some coding style
> consistency=C2=A0
> concerns though so lets wait to hear=C2=A0=C2=A0Darren's opinion on t=
his patch.

=46or the rest we have to see the implementation and decide how to proc=
eed
(since it's a debugfs dedicated for _debugging_) we might change it in
the way we like. Though I don't encourage people to do this. I like
interfaces on which people thought before implementing.

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
