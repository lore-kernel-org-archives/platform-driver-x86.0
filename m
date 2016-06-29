From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Wed, 29 Jun 2016 16:33:50 +0300
Message-ID: <1467207230.30123.329.camel@linux.intel.com>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
 <1467108307.30123.303.camel@linux.intel.com>
 <20160629080325.GA11318@rajaneesh-OptiPlex-9010>
 <1467200985.30123.320.camel@linux.intel.com>
 <20160629121604.GA26750@rajaneesh-OptiPlex-9010>
 <1467204505.30123.326.camel@linux.intel.com>
	 <20160629132038.GB26750@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:39302 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752524AbcF2NeT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 09:34:19 -0400
In-Reply-To: <20160629132038.GB26750@rajaneesh-OptiPlex-9010>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Wed, 2016-06-29 at 18:50 +0530, Rajneesh Bhardwaj wrote:
> On Wed, Jun 29, 2016 at 03:48:25PM +0300, Andy Shevchenko wrote:
> > On Wed, 2016-06-29 at 17:46 +0530, Rajneesh Bhardwaj wrote:
> > > On Wed, Jun 29, 2016 at 02:49:45PM +0300, Andy Shevchenko wrote:
> > > > On Wed, 2016-06-29 at 13:33 +0530, Rajneesh Bhardwaj wrote:
> > > > > On Tue, Jun 28, 2016 at 01:05:07PM +0300, Andy Shevchenko
> > > > > wrote:
> >=20
> > > > >=20


> > If it touches the same attribute it needs to be seen first before
> > applying this one.
> >=20
>=20
> No, this attribute wont be touched.

So, if there is no objections (taking into consideration minors you
mentioned) I think the patch can be applied.

> Can we have seq_printf for such cases and use
> > > DEFINE_DEBUGFS_ATTRIBUTE
> > > for
> > > other simple attributes? Doing this might raise some coding style
> > > consistency=C2=A0
> > > concerns though so lets wait to hear=C2=A0=C2=A0Darren's opinion =
on this
> > > patch.
> >=20
> > For the rest we have to see the implementation and decide how to
> > proceed
> > (since it's a debugfs dedicated for _debugging_) we might change it
> > in
> > the way we like. Though I don't encourage people to do this. I like
> > interfaces on which people thought before implementing.
> >=20
>=20
> Sure, i am fine with DEFINE_DEBUGFS_ATTRIBUTE but would like to leave
> the scope
> for having seq_printf for future patches i.e. linux/seq_file.h and
> thus would
> have a dependency on struct file_operations for seq_read.

Of course! No-one is insisting to use only the macro and simple
attributes.


--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
