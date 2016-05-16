From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: add a new WMI string for ESC key
Date: Mon, 16 May 2016 16:38:16 -0700
Message-ID: <20160516233816.GB3402@f23x64.localdomain>
References: <1462830577-1670360-1-git-send-email-arnd@arndb.de>
 <20160511200937.GC4225@f23x64.localdomain>
 <CAOxJCxfxmTyZhsAwp9oDkAEVd9iPPygKJcZvBkqQ=VrU_Vrzog@mail.gmail.com>
 <CAOxJCxdsMDCY33JHr+JrQtEwQ4Jh7UyvUFS4SNeoA71ojDxYpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48354 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751587AbcEPXiV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 May 2016 19:38:21 -0400
Content-Disposition: inline
In-Reply-To: <CAOxJCxdsMDCY33JHr+JrQtEwQ4Jh7UyvUFS4SNeoA71ojDxYpg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Denis Gordienko <denis.gordienko.mail@gmail.com>
Cc: Christian Hesse <mail@eworm.de>, Philippe Coval <philippe.coval@open.eurogiciel.org>, Ike Panhc <ike.pan@canonical.com>, linux-kernel@vger.kernel.org, Dmitry Tunin <hanipouspilot@gmail.com>, platform-driver-x86@vger.kernel.org, John Dahlstrom <jodarom@sdf.org>, Hans de Goede <hdegoede@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@fedoraproject.org>

On Thu, May 12, 2016 at 12:34:05AM +0300, Denis Gordienko wrote:
> Hi, Darren. This patch already tested on my laptop and I can confirm =
- it's
> work fine.

Awesome, thanks! Added your tested-by.

> Denis
> 11 =D0=9C=D0=B0=D0=B9 2016 =D0=B3. 23:09 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=
=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C "Darren Hart" <dvhart@infrad=
ead.org>
> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>=20
> On Mon, May 09, 2016 at 11:49:21PM +0200, Arnd Bergmann wrote:
> > My patch to the ideapad-laptop driver to get the ESC key working on=
 the
> > Yoga 1170 (Yoga 3) failed to do the same for the following model, t=
he
> > Lenovo Yoga 700.
> >
> > Denis Gordienko managed to get it working by adding another GUID fo=
r the
> > new WMI interface. I have adapted his patch to normal coding style
> > and simplified it a bit for inclusion, but this patch is currently
> > untested.
> >
> > Link:
> https://forums.lenovo.com/t5/Lenovo-Yoga-Series-Notebooks/YOGA-3-14-H=
ow-to-reclaim-my-Esc-key-and-permanently-disable/m-p/3317499
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Cc: Denis Gordienko <denis.gordienko.mail@gmail.com>
>=20
> Looks good to me, but of course I would like to see some testing. Den=
is, I
> presume you have a Yoga 700 you could verify this version of your pat=
ch on?
> Would you be willing to do so?
>=20
>=20
> > ---
> >  drivers/platform/x86/ideapad-laptop.c | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/x86/ideapad-laptop.c
> b/drivers/platform/x86/ideapad-laptop.c
> > index 1d49db124753..531ecca9dbe3 100644
> > --- a/drivers/platform/x86/ideapad-laptop.c
> > +++ b/drivers/platform/x86/ideapad-laptop.c
> > @@ -48,7 +48,10 @@
> >  #define CFG_CAMERA_BIT       (19)
> >
> >  #if IS_ENABLED(CONFIG_ACPI_WMI)
> > -static const char ideapad_wmi_fnesc_event[] =3D
> "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6";
> > +static const char* ideapad_wmi_fnesc_events[] =3D {

Arnd, should this be:

static const char *const ideapad_wmi_fnesc_events[] =3D {

?

Checkpatch complains, I see both usages throughout the kernel. I believ=
e we do
want a const array of const char arrays, so I think this is a better
declaration.

Any objection to this change?

--=20
Darren Hart
Intel Open Source Technology Center
