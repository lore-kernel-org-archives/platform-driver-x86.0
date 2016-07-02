From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Sat, 02 Jul 2016 15:10:57 +0300
Message-ID: <1467461457.30123.446.camel@linux.intel.com>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
 <1467108307.30123.303.camel@linux.intel.com>
	 <20160701212434.GC60048@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:45410 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750994AbcGBMLB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 2 Jul 2016 08:11:01 -0400
In-Reply-To: <20160701212434.GC60048@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Fri, 2016-07-01 at 14:24 -0700, Darren Hart wrote:
=C2=A0
> > > > +struct dentry;
> > > > +
> > >=20
> > > Why do we need this ?
> >=20
> > Since we are using pointer to undefined type.
>=20
> Erm... why is dentry an undefined type?

In this header it's undefined. Though I can't get any warning using
recent compilers, thus the change is not needed.

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
