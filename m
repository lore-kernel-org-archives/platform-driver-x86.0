From: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: Re: [PATCH] asus-laptop: correct error handling in
 asus_read_brightness()
Date: Fri, 22 Apr 2016 10:43:30 +0300
Message-ID: <20160422074329.GA15499@tyrael>
References: <1460766432-5390-1-git-send-email-giedrius.statkevicius@gmail.com>
 <CAHp75VeS86iWKxTGVWmSgVcJ9cTgLWM7tDAmdonipB7pskJEHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VeS86iWKxTGVWmSgVcJ9cTgLWM7tDAmdonipB7pskJEHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 22, 2016 at 02:09:22AM +0300, Andy Shevchenko wrote:
> On Sat, Apr 16, 2016 at 3:27 AM, Giedrius Statkevi=C4=8Dius
> <giedrius.statkevicius@gmail.com> wrote:
> > It is possible that acpi_evaluate_integer might fail and value woul=
d not be
> > set to any value so correct this defect by returning 0 in case of a=
n
> > error. This is also the correct thing to return because the backlig=
ht
> > subsystem will print the old value of brightness in this case.
> >
> > Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gm=
ail.com>
> > ---
> >  drivers/platform/x86/asus-laptop.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/=
x86/asus-laptop.c
> > index 9a69734..15f1311 100644
> > --- a/drivers/platform/x86/asus-laptop.c
> > +++ b/drivers/platform/x86/asus-laptop.c
> > @@ -775,8 +775,10 @@ static int asus_read_brightness(struct backlig=
ht_device *bd)
> >
> >         rv =3D acpi_evaluate_integer(asus->handle, METHOD_BRIGHTNES=
S_GET,
> >                                    NULL, &value);
> > -       if (ACPI_FAILURE(rv))
> > +       if (ACPI_FAILURE(rv)) {
> >                 pr_warn("Error reading brightness\n");
> > +               return 0;
> > +       }
>=20
> This looks like a workaround.
> I suppose the real fix is to return here an error code and fix all ca=
llers, like
> drivers/video/backlight/backlight.c.
>=20

It just fixes the behaviour according to the current code in that file.=
 I
suppose that would be nice but I don't think it would make any differen=
ce
because the backlight core code still prints out ->props.brightness in =
case
ops->get_brightness fails. Just the difference would be that now actual=
 error
messages are printed in the drivers themselves instead of generic messa=
ges from
the backlight core. Anyway, I think the current behaviour is more usefu=
l because
the drivers know better about what has failed.
