From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Fri, 4 Dec 2015 13:36:50 +0100
Message-ID: <20151204123650.GA12988@eudyptula.hq.kempniu.pl>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <1654e7bcde98f1cf89f698a1e359110c06c6fcd4.1448999372.git.kernel@kempniu.pl>
 <20151204084806.GM10982@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36281 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751136AbbLDMgy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Dec 2015 07:36:54 -0500
Received: by lfs39 with SMTP id 39so107648739lfs.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Dec 2015 04:36:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151204084806.GM10982@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -47,6 +47,38 @@ static int acpi_video;
> > =20
> >  MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
> > =20
> > +struct quirk_entry {
> > +	bool process_dell_instant_launch;
> > +};
> > +
> > +static struct quirk_entry *quirks;
> > +
> > +static struct quirk_entry quirk_unknown =3D {
> > +};
> > +
> > +static struct quirk_entry quirk_dell_vostro_v131 =3D {
> > +	.process_dell_instant_launch =3D true,
> > +};
> > +
> > +static int __init dmi_matched(const struct dmi_system_id *dmi)
> > +{
> > +	quirks =3D dmi->driver_data;
> > +	return 1;
> > +}
> > +
> > +static const struct dmi_system_id dell_wmi_quirks[] __initconst =3D=
 {
> > +	{
> > +		.callback =3D dmi_matched,
> > +		.ident =3D "Dell Vostro V131",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
> > +		},
> > +		.driver_data =3D &quirk_dell_vostro_v131,
> > +	},
> > +	{ }
> > +};
> > +
>=20
> It is not possible to simplify this part of code? Currently we only n=
eed
> boolean variable: ignore 0xe025 event or not. I think that whole quir=
k
> structure is not needed yet (and I would be happy if never in future)=
=2E

Of course it is possible.  I just got the feeling that using a quirk
structure is the way to go for this subsystem as it currently contains =
7
drivers using something like this.  Moreover, I saw that in some commit=
s
initially adding a quirk structure to a driver (2d8b90be, a979e2e2) tha=
t
structure contained just one field. =20

So, between KISS and following the beaten path, I chose the latter.  If
you still think this patch should be reworked to use a single global
boolean instead, please let me know and I'll prepare a v3.

> > @@ -432,6 +467,8 @@ static int __init dell_wmi_init(void)
> >  		return -ENODEV;
> >  	}
> > =20
> > +	quirks =3D &quirk_unknown;
>=20
> Unknown sounds like something is not know or we do not know what it i=
s.
> But here we know exactly what is needed (=3D ignore 0xe025 key).

Again, not my idea, I just thought it would be wise to follow what seem=
s
to be an established pattern:

    $ git grep 'quirk.*unknown' drivers/platform/x86/

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
