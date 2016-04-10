From: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: Re: [PATCH 2/2] asus-laptop: remove unused variable
Date: Sun, 10 Apr 2016 11:48:52 +0300
Message-ID: <20160410084852.GA5473@tyrael>
References: <1460060401-20742-1-git-send-email-giedrius.statkevicius@gmail.com>
 <1460060401-20742-2-git-send-email-giedrius.statkevicius@gmail.com>
 <20160410032121.GD18689@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36365 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbcDJIs4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 10 Apr 2016 04:48:56 -0400
Content-Disposition: inline
In-Reply-To: <20160410032121.GD18689@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 09, 2016 at 08:21:21PM -0700, Darren Hart wrote:
> On Thu, Apr 07, 2016 at 11:20:01PM +0300, Giedrius Statkevi=C4=8Dius =
wrote:
> > `out' was assigned value but it was never used so remove it
> >=20
> > Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gm=
ail.com>
> > ---
> >  drivers/platform/x86/asus-laptop.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/=
x86/asus-laptop.c
> > index d86d42e..39ddcee 100644
> > --- a/drivers/platform/x86/asus-laptop.c
> > +++ b/drivers/platform/x86/asus-laptop.c
> > @@ -946,11 +946,8 @@ static ssize_t sysfs_acpi_set(struct asus_lapt=
op *asus,
> >  			      const char *method)
> >  {
> >  	int rv, value;
> > -	int out =3D 0;
> > =20
> >  	rv =3D parse_arg(buf, count, &value);
> > -	if (rv > 0)
> > -		out =3D value ? 1 : 0;
> > =20
> >  	if (write_acpi_int(asus->handle, method, value))
>=20
> out is indeed unused, however the rv > 0 condition is relevant as <=3D=
0 will pass
> value uninitialized to write_acpi_int.
That's indeed a problem. Somehow I missed that :( Should I make a v2 to=
 include
another patch that checks for rv < 0 or send it as an independent one?
