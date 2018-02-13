From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3] platform/x86: dell-laptop: fix kbd_get_state's
 request value
Date: Tue, 13 Feb 2018 22:26:12 +0100
Message-ID: <20180213212612.u7b26krt47n4zpp6@pali>
References: <20180213204343.GA6586@laszlth>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hnlfrcyjvygw4i4h"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180213204343.GA6586@laszlth>
Sender: stable-owner@vger.kernel.org
To: Laszlo Toth <laszlth@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--hnlfrcyjvygw4i4h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tuesday 13 February 2018 21:43:43 Laszlo Toth wrote:
> Commit 9862b43624a5 ("platform/x86: dell-laptop: Allocate buffer on heap
> rather than globally")
> broke one request, changed it back to the original value.
>=20
> Tested on a Dell E6540, backlight came back.
>=20
> Fixes: 9862b43624a5 ("platform/x86: dell-laptop: Allocate buffer on heap =
rather than globally")
> Signed-off-by: Laszlo Toth <laszlth@gmail.com>
> ---
> Changes in v2:
>  - split the fix and the function merge part
> Changes in v3:
>  - added fixes tag
>=20
>  drivers/platform/x86/dell-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-laptop.c
> index 2a68f59..a37cff9 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -1279,7 +1279,7 @@ static int kbd_get_state(struct kbd_state *state)
>  	struct calling_interface_buffer buffer;
>  	int ret;
> =20
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> +	dell_fill_request(&buffer, 0x1, 0, 0, 0);
>  	ret =3D dell_send_request(&buffer,
>  				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT);
>  	if (ret)

Looks better!

Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--hnlfrcyjvygw4i4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWoNX8wAKCRCL8Mk9A+RD
UhQfAJsGhX1pN4gPdan/SJQAYHrUgA71jACfcBlqcjAiH2B570DJi3fiYXVtEKw=
=QD1S
-----END PGP SIGNATURE-----

--hnlfrcyjvygw4i4h--
