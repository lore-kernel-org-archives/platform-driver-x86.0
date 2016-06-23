From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Thu, 23 Jun 2016 19:22:40 +0300
Message-ID: <1466698960.30123.260.camel@linux.intel.com>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <20160623152652.GA1217@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:21884 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751454AbcFWQWv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 12:22:51 -0400
In-Reply-To: <20160623152652.GA1217@rajaneesh-OptiPlex-9010>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Thu, 2016-06-23 at 20:56 +0530, Rajneesh Bhardwaj wrote:
> On Mon, Jun 13, 2016 at 08:56:49PM +0300, Andy Shevchenko wrote:
>=20
> Sorry for the late reply. I compiled/tested this on linux-next on a
> Skylake
> system and it looks ok to me except for a couple of minor comments.
>=20
> > +static int pmc_core_dev_state_get(void *data, u64 *val)
> > =C2=A0{
> > -	struct pmc_dev *pmcdev =3D s->private;
> > -	u32 counter_val;
> > +	struct pmc_dev *pmcdev =3D data;
>=20
> I am hoping that data being passed here is similar to inode.i_private
> so that we get the address of pmc struct here.

Yes, I went through the debugfs support code to be sure.

> > +DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state,
> > pmc_core_dev_state_get, NULL, "%llu");

> > =C2=A0	pmcdev->dbgfs_dir =3D dir;
> > =C2=A0	file =3D debugfs_create_file("slp_s0_residency_usec", S_IFRE=
G
> > | S_IRUGO,
>=20
> Should we consider using debugfs_create_file_unsafe ?

But why? I would choose safest option among others if there is no stron=
g
objection and explanation.

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
