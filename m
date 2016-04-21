From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 2/2] asus-laptop: correct error handling in
 sysfs_acpi_set
Date: Thu, 21 Apr 2016 13:59:09 -0700
Message-ID: <20160421205909.GA56887@f23x64.localdomain>
References: <1460764917-1042-1-git-send-email-giedrius.statkevicius@gmail.com>
 <1460764917-1042-2-git-send-email-giedrius.statkevicius@gmail.com>
 <CAHp75Vc8qrSouEUNP5p8OuzVgS84D8pLA_iS0wLzgrocdLcLwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vc8qrSouEUNP5p8OuzVgS84D8pLA_iS0wLzgrocdLcLwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 21, 2016 at 11:34:13PM +0300, Andy Shevchenko wrote:
> On Sat, Apr 16, 2016 at 3:01 AM, Giedrius Statkevi=C4=8Dius
> <giedrius.statkevicius@gmail.com> wrote:
> > Properly return rv back to the caller in the case of an error in
> > parse_arg. In the process remove a unused variable 'out'.
> >
> > Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gm=
ail.com>
> > ---
> >  drivers/platform/x86/asus-laptop.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/=
x86/asus-laptop.c
> > index d86d42e..9a69734 100644
> > --- a/drivers/platform/x86/asus-laptop.c
> > +++ b/drivers/platform/x86/asus-laptop.c
> > @@ -946,11 +946,10 @@ static ssize_t sysfs_acpi_set(struct asus_lap=
top *asus,
> >                               const char *method)
> >  {
> >         int rv, value;
> > -       int out =3D 0;
> >
> >         rv =3D parse_arg(buf, count, &value);
>=20
> Just noticed (might be a separate patch for this) that parse_arg
> pretty much duplicated kstrotint().

Ah, thanks Andy.

I'd like to take this one as is, but a cleanup for that would be welcom=
e indeed.

--=20
Darren Hart
Intel Open Source Technology Center
