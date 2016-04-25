From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-laptop: correct error handling in
 asus_read_brightness()
Date: Mon, 25 Apr 2016 10:46:54 -0700
Message-ID: <20160425174654.GD2115@f23x64.localdomain>
References: <1460766432-5390-1-git-send-email-giedrius.statkevicius@gmail.com>
 <CAHp75VeS86iWKxTGVWmSgVcJ9cTgLWM7tDAmdonipB7pskJEHg@mail.gmail.com>
 <20160422074329.GA15499@tyrael>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41017 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754558AbcDYRq4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Apr 2016 13:46:56 -0400
Content-Disposition: inline
In-Reply-To: <20160422074329.GA15499@tyrael>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Apr 22, 2016 at 10:43:30AM +0300, Giedrius Statkevi=C4=8Dius wr=
ote:
> On Fri, Apr 22, 2016 at 02:09:22AM +0300, Andy Shevchenko wrote:
> > On Sat, Apr 16, 2016 at 3:27 AM, Giedrius Statkevi=C4=8Dius
> > <giedrius.statkevicius@gmail.com> wrote:
> > > It is possible that acpi_evaluate_integer might fail and value wo=
uld not be
> > > set to any value so correct this defect by returning 0 in case of=
 an
> > > error. This is also the correct thing to return because the backl=
ight
> > > subsystem will print the old value of brightness in this case.
> > >
> > > Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@=
gmail.com>
> > > ---
> > >  drivers/platform/x86/asus-laptop.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platfor=
m/x86/asus-laptop.c
> > > index 9a69734..15f1311 100644
> > > --- a/drivers/platform/x86/asus-laptop.c
> > > +++ b/drivers/platform/x86/asus-laptop.c
> > > @@ -775,8 +775,10 @@ static int asus_read_brightness(struct backl=
ight_device *bd)
> > >
> > >         rv =3D acpi_evaluate_integer(asus->handle, METHOD_BRIGHTN=
ESS_GET,
> > >                                    NULL, &value);
> > > -       if (ACPI_FAILURE(rv))
> > > +       if (ACPI_FAILURE(rv)) {
> > >                 pr_warn("Error reading brightness\n");
> > > +               return 0;
> > > +       }
> >=20
> > This looks like a workaround.
> > I suppose the real fix is to return here an error code and fix all =
callers, like
> > drivers/video/backlight/backlight.c.
> >=20
>=20
> It just fixes the behaviour according to the current code in that fil=
e. I
> suppose that would be nice but I don't think it would make any differ=
ence
> because the backlight core code still prints out ->props.brightness i=
n case
> ops->get_brightness fails. Just the difference would be that now actu=
al error
> messages are printed in the drivers themselves instead of generic mes=
sages from
> the backlight core. Anyway, I think the current behaviour is more use=
ful because
> the drivers know better about what has failed.
>=20

As a matter of practice, based on feedback from the previous pdx86 main=
tainers,
I prefer to accept patches which fix an immediate issue and leave the r=
ework or
broader work as a follow-on, or a TODO item.

We should look for a good place to document these TODOs.

Queued for 4.7.

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
