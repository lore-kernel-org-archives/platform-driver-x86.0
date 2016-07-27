From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Wed, 27 Jul 2016 09:23:50 +0200
Message-ID: <20160727072350.GF29844@pali>
References: <1469217684-6643-1-git-send-email-mario_limonciello@dell.com>
 <20160727051909.GC75806@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33265 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751723AbcG0HXx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jul 2016 03:23:53 -0400
Content-Disposition: inline
In-Reply-To: <20160727051909.GC75806@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mario Limonciello <mario_limonciello@dell.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tuesday 26 July 2016 22:19:09 Darren Hart wrote:
> On Fri, Jul 22, 2016 at 03:01:24PM -0500, Mario Limonciello wrote:
> > The Dell Rugged 7202 has 3 programmable buttons (labeled P1, P2, P3=
)
> > and a detachable magnetic keyboard/mouse.
> >=20
> > Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
>=20
> +Pali
>=20
> Pali, any concerns?

Hi! I'm not sure if KEY_PROG1/2/3 are good names here as we already use
those for other actions (see bios_to_linux_keycode). Also there is:

/* Wifi Catcher */
{ KE_KEY,    0xe011, { KEY_PROG2 } },

But probably we do not have better names...

Another small cosmetic change: align WMI codes, so 0x157 and 0x850 are
at some column (similar like are formatted other actions).

> > ---
> >  drivers/platform/x86/dell-wmi.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86=
/dell-wmi.c
> > index 15c6f11..6ba42d0 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -222,6 +222,16 @@ static const struct key_entry dell_wmi_extra_k=
eymap[] __initconst =3D {
> > =20
> >  	/* Stealth mode toggle */
> >  	{ KE_IGNORE, 0x155, { KEY_RESERVED } },
> > +
> > +	/* Rugged magnetic keyboard/mouse events */
> > +	{ KE_IGNORE, 0x156, { KEY_RESERVED } },
> > +	{ KE_IGNORE, 0x157, { KEY_RESERVED } },
> > +
> > +	/* Rugged programmable (P1/P2/P3 keys) */
> > +	{ KE_KEY, 0x850, { KEY_PROG1 } },
> > +	{ KE_KEY, 0x851, { KEY_PROG2 } },
> > +	{ KE_KEY, 0x852, { KEY_PROG3 } },
> > +
> >  };
> > =20
> >  static struct input_dev *dell_wmi_input_dev;
> > --=20
> > 2.7.4
> >=20
> >=20
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
