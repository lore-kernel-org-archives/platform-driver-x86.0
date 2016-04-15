From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/2] asus-laptop: remove unused variable
Date: Thu, 14 Apr 2016 17:36:00 -0700
Message-ID: <20160415003600.GC3232@f23x64.localdomain>
References: <1460060401-20742-1-git-send-email-giedrius.statkevicius@gmail.com>
 <1460060401-20742-2-git-send-email-giedrius.statkevicius@gmail.com>
 <20160410032121.GD18689@dvhart-mobl5.amr.corp.intel.com>
 <20160410084852.GA5473@tyrael>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53277 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752486AbcDOAgE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Apr 2016 20:36:04 -0400
Content-Disposition: inline
In-Reply-To: <20160410084852.GA5473@tyrael>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Apr 10, 2016 at 11:48:52AM +0300, Giedrius Statkevi=C4=8Dius wr=
ote:
> On Sat, Apr 09, 2016 at 08:21:21PM -0700, Darren Hart wrote:
> > On Thu, Apr 07, 2016 at 11:20:01PM +0300, Giedrius Statkevi=C4=8Diu=
s wrote:
> > > `out' was assigned value but it was never used so remove it
> > >=20
> > > Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@=
gmail.com>
> > > ---
> > >  drivers/platform/x86/asus-laptop.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platfor=
m/x86/asus-laptop.c
> > > index d86d42e..39ddcee 100644
> > > --- a/drivers/platform/x86/asus-laptop.c
> > > +++ b/drivers/platform/x86/asus-laptop.c
> > > @@ -946,11 +946,8 @@ static ssize_t sysfs_acpi_set(struct asus_la=
ptop *asus,
> > >  			      const char *method)
> > >  {
> > >  	int rv, value;
> > > -	int out =3D 0;
> > > =20
> > >  	rv =3D parse_arg(buf, count, &value);
> > > -	if (rv > 0)
> > > -		out =3D value ? 1 : 0;
> > > =20
> > >  	if (write_acpi_int(asus->handle, method, value))
> >=20
> > out is indeed unused, however the rv > 0 condition is relevant as <=
=3D0 will pass
> > value uninitialized to write_acpi_int.
> That's indeed a problem. Somehow I missed that :( Should I make a v2 =
to include
> another patch that checks for rv < 0 or send it as an independent one=
?
>=20

Sorry, my response was not clear. Please resend both patches as a v2, w=
ith the
first unchanged, and this one updated to do the right thing. This just =
makes
managing the patches as series simpler.

Thank you,

--=20
Darren Hart
Intel Open Source Technology Center
