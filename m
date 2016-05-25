From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v6] platform:x86: Add PMC Driver for Intel Core SoC
Date: Wed, 25 May 2016 14:04:03 -0700
Message-ID: <20160525210403.GD109010@f23x64.localdomain>
References: <1464198292-32356-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <20160525201353.GA109010@f23x64.localdomain>
 <CAHp75Vcqxreujm9+D2JpAGkbyYZJ+uvKXjcSb_Dqcs96Y0n2_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47071 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbcEYVEE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2016 17:04:04 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Vcqxreujm9+D2JpAGkbyYZJ+uvKXjcSb_Dqcs96Y0n2_Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, dbasehore@google.com, vishwanath.somayaji@intel.com

On Wed, May 25, 2016 at 11:37:21PM +0300, Andy Shevchenko wrote:
> On Wed, May 25, 2016 at 11:13 PM, Darren Hart <dvhart@infradead.org> =
wrote:
> > On Wed, May 25, 2016 at 11:14:52PM +0530, Rajneesh Bhardwaj wrote:
>=20
> > Hi Rajneesh,
> >
> > Unfortunately during my build test, this introduced a new warning t=
o the build:
> >
> > drivers/platform/x86/intel_pmc_core.c:201:19: warning: =E2=80=98int=
el_pmc_core_init=E2=80=99
> > defined but not used [-Wunused-function]
> >  static int __init intel_pmc_core_init(void)
> >
> > After the removal of the module stuff, the driver needed a device_i=
nitcall, or
> > the macro equivalent, consider:
> >
> > $ git diff
> > diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platfo=
rm/x86/intel_pmc_core.c
> > index c834281..f6a29b9 100644
> > --- a/drivers/platform/x86/intel_pmc_core.c
> > +++ b/drivers/platform/x86/intel_pmc_core.c
> > @@ -198,7 +198,4 @@ static struct pci_driver intel_pmc_core_driver =
=3D {
>=20
> >         .remove =3D NULL, /* not a hot-plug capable driver */
>=20
> Since it requires an update I would suggest to remove above line comp=
letely.

Indeed, thank you Andy.

--=20
Darren Hart
Intel Open Source Technology Center
