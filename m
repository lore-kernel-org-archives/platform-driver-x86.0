From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Fri, 1 Jul 2016 14:30:28 -0700
Message-ID: <20160701213028.GE60048@f23x64.localdomain>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
 <1467108307.30123.303.camel@linux.intel.com>
 <20160629080325.GA11318@rajaneesh-OptiPlex-9010>
 <1467200985.30123.320.camel@linux.intel.com>
 <20160629121604.GA26750@rajaneesh-OptiPlex-9010>
 <1467204505.30123.326.camel@linux.intel.com>
 <20160629132038.GB26750@rajaneesh-OptiPlex-9010>
 <1467207230.30123.329.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:60915 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752232AbcGAVaa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2016 17:30:30 -0400
Content-Disposition: inline
In-Reply-To: <1467207230.30123.329.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Wed, Jun 29, 2016 at 04:33:50PM +0300, Andy Shevchenko wrote:
> On Wed, 2016-06-29 at 18:50 +0530, Rajneesh Bhardwaj wrote:
> > On Wed, Jun 29, 2016 at 03:48:25PM +0300, Andy Shevchenko wrote:
> > > On Wed, 2016-06-29 at 17:46 +0530, Rajneesh Bhardwaj wrote:
> > > > On Wed, Jun 29, 2016 at 02:49:45PM +0300, Andy Shevchenko wrote=
:
> > > > > On Wed, 2016-06-29 at 13:33 +0530, Rajneesh Bhardwaj wrote:
> > > > > > On Tue, Jun 28, 2016 at 01:05:07PM +0300, Andy Shevchenko
> > > > > > wrote:
> > >=20
> > > > > >=20
>=20
>=20
> > > If it touches the same attribute it needs to be seen first before
> > > applying this one.
> > >=20
> >=20
> > No, this attribute wont be touched.
>=20
> So, if there is no objections (taking into consideration minors you
> mentioned) I think the patch can be applied.
>=20
> > Can we have seq_printf for such cases and use
> > > > DEFINE_DEBUGFS_ATTRIBUTE
> > > > for
> > > > other simple attributes? Doing this might raise some coding sty=
le
> > > > consistency=A0
> > > > concerns though so lets wait to hear=A0=A0Darren's opinion on t=
his
> > > > patch.
> > >=20
> > > For the rest we have to see the implementation and decide how to
> > > proceed
> > > (since it's a debugfs dedicated for _debugging_) we might change =
it
> > > in
> > > the way we like. Though I don't encourage people to do this. I li=
ke
> > > interfaces on which people thought before implementing.
> > >=20
> >=20
> > Sure, i am fine with DEFINE_DEBUGFS_ATTRIBUTE but would like to lea=
ve
> > the scope
> > for having seq_printf for future patches i.e. linux/seq_file.h and
> > thus would
> > have a dependency on struct file_operations for seq_read.
>=20
> Of course! No-one is insisting to use only the macro and simple
> attributes.

Agreed. I do wonder if some of the newer debugfs types like array and r=
egset
would be sufficient for your needs. Whenever you can reuse an abstracti=
on of the
subsystem through higher level interfaces, I encourage you to do so as =
it
reduces code size and potential programming errors.

--=20
Darren Hart
Intel Open Source Technology Center
