From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 1/5] dell-laptop: move dell_smi_error() to dell-smbios
Date: Mon, 29 Feb 2016 21:24:07 +0100
Message-ID: <201602292124.07161@pali>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl> <20160229125214.GF21814@pali> <20160229202254.GA23395@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5482601.i4x7vqdyZG";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:36765 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750973AbcB2UYL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 15:24:11 -0500
In-Reply-To: <20160229202254.GA23395@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart5482601.i4x7vqdyZG
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 29 February 2016 21:22:54 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > On Wednesday 24 February 2016 08:20:11 Micha=C5=82 K=C4=99pie=C5=84 wro=
te:
> > > The dell_smi_error() method could be used by modules other than
> > > dell-laptop for convenient translation of SMBIOS request errors
> > > into errno values.  Thus, move it to dell-smbios.
> > >=20
> > > Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> > > ---
> > >=20
> > >  drivers/platform/x86/dell-laptop.c |   14 --------------
> > >  drivers/platform/x86/dell-smbios.c |   16 ++++++++++++++++
> > >  drivers/platform/x86/dell-smbios.h |    2 ++
> > >  3 files changed, 18 insertions(+), 14 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/dell-laptop.c
> > > b/drivers/platform/x86/dell-laptop.c index 76064c8..cbafb95
> > > 100644
> > > --- a/drivers/platform/x86/dell-laptop.c
> > > +++ b/drivers/platform/x86/dell-laptop.c
> > > @@ -273,20 +273,6 @@ static const struct dmi_system_id
> > > dell_quirks[] __initconst =3D {
> > >=20
> > >  	{ }
> > > =20
> > >  };
> > >=20
> > > -static inline int dell_smi_error(int value)
> > > -{
> > > -	switch (value) {
> > > -	case 0: /* Completed successfully */
> > > -		return 0;
> > > -	case -1: /* Completed with error */
> > > -		return -EIO;
> > > -	case -2: /* Function not supported */
> > > -		return -ENXIO;
> > > -	default: /* Unknown error */
> > > -		return -EINVAL;
> > > -	}
> > > -}
> > > -
> > >=20
> > >  /*
> > > =20
> > >   * Derived from information in smbios-wireless-ctl:
> > >   *
> > >=20
> > > diff --git a/drivers/platform/x86/dell-smbios.c
> > > b/drivers/platform/x86/dell-smbios.c index 2a4992a..942572f
> > > 100644
> > > --- a/drivers/platform/x86/dell-smbios.c
> > > +++ b/drivers/platform/x86/dell-smbios.c
> > > @@ -16,6 +16,7 @@
> > >=20
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > >  #include <linux/dmi.h>
> > >=20
> > > +#include <linux/err.h>
> > >=20
> > >  #include <linux/gfp.h>
> > >  #include <linux/mutex.h>
> > >  #include <linux/slab.h>
> > >=20
> > > @@ -39,6 +40,21 @@ static int da_command_code;
> > >=20
> > >  static int da_num_tokens;
> > >  static struct calling_interface_token *da_tokens;
> > >=20
> > > +int dell_smi_error(int value)
> > > +{
> > > +	switch (value) {
> > > +	case 0: /* Completed successfully */
> > > +		return 0;
> > > +	case -1: /* Completed with error */
> > > +		return -EIO;
> > > +	case -2: /* Function not supported */
> > > +		return -ENXIO;
> > > +	default: /* Unknown error */
> > > +		return -EINVAL;
> > > +	}
> > > +}
> > > +EXPORT_SYMBOL_GPL(dell_smi_error);
> > > +
> > >=20
> > >  struct calling_interface_buffer *dell_smbios_get_buffer(void)
> > >  {
> > > =20
> > >  	mutex_lock(&buffer_mutex);
> > >=20
> > > diff --git a/drivers/platform/x86/dell-smbios.h
> > > b/drivers/platform/x86/dell-smbios.h index 4f69b16..52febe6
> > > 100644
> > > --- a/drivers/platform/x86/dell-smbios.h
> > > +++ b/drivers/platform/x86/dell-smbios.h
> > > @@ -35,6 +35,8 @@ struct calling_interface_token {
> > >=20
> > >  	};
> > > =20
> > >  };
> > >=20
> > > +int dell_smi_error(int value);
> > > +
> > >=20
> > >  struct calling_interface_buffer *dell_smbios_get_buffer(void);
> > >  void dell_smbios_clear_buffer(void);
> > >  void dell_smbios_release_buffer(void);
> >=20
> > And... here what about inline vs EXPORT_SYMBOL function? Just
> > asking...
>=20
> Well, what about it? :)  The commit message is pretty explicit in
> describing what happens here, i.e. a previously static function is
> moved to another module so that it can be reused.  Thus, keeping the
> inline keyword makes no sense.  What exactly is your concern?

Just asking if this function should be or not be inline (of course in=20
header file, not in module .c).

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart5482601.i4x7vqdyZG
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlbUqOcACgkQi/DJPQPkQ1I2MQCfWWUaWlmHk/khLjMtPPrNHX9S
w/gAn2Us6ZRpPToR9/RtlYKYwMfEo1yR
=oLju
-----END PGP SIGNATURE-----

--nextPart5482601.i4x7vqdyZG--
