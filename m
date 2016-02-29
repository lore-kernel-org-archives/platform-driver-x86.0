From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v4 1/5] dell-laptop: move dell_smi_error() to dell-smbios
Date: Mon, 29 Feb 2016 21:22:54 +0100
Message-ID: <20160229202254.GA23395@eudyptula.hq.kempniu.pl>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-2-git-send-email-kernel@kempniu.pl>
 <20160229125214.GF21814@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f195.google.com ([209.85.217.195]:33870 "EHLO
	mail-lb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750729AbcB2UVt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 15:21:49 -0500
Received: by mail-lb0-f195.google.com with SMTP id vk4so5699680lbb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Feb 2016 12:21:48 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160229125214.GF21814@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> On Wednesday 24 February 2016 08:20:11 Micha=C5=82 K=C4=99pie=C5=84 w=
rote:
> > The dell_smi_error() method could be used by modules other than
> > dell-laptop for convenient translation of SMBIOS request errors int=
o
> > errno values.  Thus, move it to dell-smbios.
> >=20
> > Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> > ---
> >  drivers/platform/x86/dell-laptop.c |   14 --------------
> >  drivers/platform/x86/dell-smbios.c |   16 ++++++++++++++++
> >  drivers/platform/x86/dell-smbios.h |    2 ++
> >  3 files changed, 18 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/=
x86/dell-laptop.c
> > index 76064c8..cbafb95 100644
> > --- a/drivers/platform/x86/dell-laptop.c
> > +++ b/drivers/platform/x86/dell-laptop.c
> > @@ -273,20 +273,6 @@ static const struct dmi_system_id dell_quirks[=
] __initconst =3D {
> >  	{ }
> >  };
> > =20
> > -static inline int dell_smi_error(int value)
> > -{
> > -	switch (value) {
> > -	case 0: /* Completed successfully */
> > -		return 0;
> > -	case -1: /* Completed with error */
> > -		return -EIO;
> > -	case -2: /* Function not supported */
> > -		return -ENXIO;
> > -	default: /* Unknown error */
> > -		return -EINVAL;
> > -	}
> > -}
> > -
> >  /*
> >   * Derived from information in smbios-wireless-ctl:
> >   *
> > diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/=
x86/dell-smbios.c
> > index 2a4992a..942572f 100644
> > --- a/drivers/platform/x86/dell-smbios.c
> > +++ b/drivers/platform/x86/dell-smbios.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/dmi.h>
> > +#include <linux/err.h>
> >  #include <linux/gfp.h>
> >  #include <linux/mutex.h>
> >  #include <linux/slab.h>
> > @@ -39,6 +40,21 @@ static int da_command_code;
> >  static int da_num_tokens;
> >  static struct calling_interface_token *da_tokens;
> > =20
> > +int dell_smi_error(int value)
> > +{
> > +	switch (value) {
> > +	case 0: /* Completed successfully */
> > +		return 0;
> > +	case -1: /* Completed with error */
> > +		return -EIO;
> > +	case -2: /* Function not supported */
> > +		return -ENXIO;
> > +	default: /* Unknown error */
> > +		return -EINVAL;
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(dell_smi_error);
> > +
> >  struct calling_interface_buffer *dell_smbios_get_buffer(void)
> >  {
> >  	mutex_lock(&buffer_mutex);
> > diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/=
x86/dell-smbios.h
> > index 4f69b16..52febe6 100644
> > --- a/drivers/platform/x86/dell-smbios.h
> > +++ b/drivers/platform/x86/dell-smbios.h
> > @@ -35,6 +35,8 @@ struct calling_interface_token {
> >  	};
> >  };
> > =20
> > +int dell_smi_error(int value);
> > +
> >  struct calling_interface_buffer *dell_smbios_get_buffer(void);
> >  void dell_smbios_clear_buffer(void);
> >  void dell_smbios_release_buffer(void);
>=20
> And... here what about inline vs EXPORT_SYMBOL function? Just asking.=
=2E.

Well, what about it? :)  The commit message is pretty explicit in
describing what happens here, i.e. a previously static function is move=
d
to another module so that it can be reused.  Thus, keeping the inline
keyword makes no sense.  What exactly is your concern?

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
