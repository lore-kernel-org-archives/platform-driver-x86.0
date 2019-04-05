From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] drivers/platform/x86/dell-rbtn.c - add missing #include
Date: Fri, 5 Apr 2019 17:04:56 +0300
Message-ID: <CAHp75Vft=SfD0BEsM8hOUuHKVBa_-p_-mk4c6odrFjkbuYtO1A@mail.gmail.com>
References: <17631.1552389966@turing-police> <20190312224611.elsl2buuhkddecih@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190312224611.elsl2buuhkddecih@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Mar 13, 2019 at 12:46 AM Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
>
> On Tuesday 12 March 2019 07:26:06 Valdis Kl=C4=93tnieks wrote:
> > Building with W=3D1 complains:
> >   CC [M]  drivers/platform/x86/dell-rbtn.o
> > drivers/platform/x86/dell-rbtn.c:345:5: warning: no previous prototype =
for 'dell_rbtn_notifier_register' [-Wmissing-prototypes]
> >   345 | int dell_rbtn_notifier_register(struct notifier_block *nb)
> >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/platform/x86/dell-rbtn.c:371:5: warning: no previous prototype =
for 'dell_rbtn_notifier_unregister' [-Wmissing-prototypes]
> >   371 | int dell_rbtn_notifier_unregister(struct notifier_block *nb)
> >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Can you identify in which commit was introduced this problem? If yes,
> then Fixes: keyword should be added into commit message.
>

Pushed to my review and testing queue, thanks!

P.S. I have added Fixes tag.

> >
> > The real problem is a missing include. Add it to keep dell-rbtn.c and .=
h in sync
> >
> > Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
> >
> > diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/de=
ll-rbtn.c
> > index f3afe778001e..d50ca96d99f0 100644
> > --- a/drivers/platform/x86/dell-rbtn.c
> > +++ b/drivers/platform/x86/dell-rbtn.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/acpi.h>
> >  #include <linux/rfkill.h>
> >  #include <linux/input.h>
> > +#include "dell-rbtn.h"
> >
> >  enum rbtn_type {
> >       RBTN_UNKNOWN,
> >
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
With Best Regards,
Andy Shevchenko
