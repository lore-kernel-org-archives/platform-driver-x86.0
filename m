From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-laptop: Fix backlight detection
Date: Sun, 8 Jul 2018 17:09:14 +0200
Message-ID: <20180708150914.x4tpxbe5yq54hw6a@pali>
References: <20180708170220.35f40818@anakin>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wtqqc3twmzzketk2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180708170220.35f40818@anakin>
Sender: linux-kernel-owner@vger.kernel.org
To: Damien =?utf-8?B?VGjDqWJhdWx0?= <damien@dtbo.net>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--wtqqc3twmzzketk2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sunday 08 July 2018 17:02:20 Damien Th=C3=A9bault wrote:
> Fix return code check for "max brightness" ACPI call.
>=20
> The dell laptop ACPI video brightness control is not present on dell
> laptops anymore, but was present in older kernel versions.
>=20
> The code that checks the return value is incorrect since the SMM
> refactoring.
>=20
> The old code was:
>   if (buffer->output[0] =3D=3D 0)
>=20
> Which was changed to:
>   ret =3D dell_send_request(...)
>   if (ret)
>=20
> However, dell_send_request() will return 0 if buffer->output[0] =3D=3D 0,
> so we must change the check to:
>   if (ret =3D=3D 0)

You are right, dell_send_request() return non-zero value on error.

> This issue was found on a Dell M4800 laptop, and the fix tested on it
> as well.
>=20
> Fixes: 549b4930f057 ("dell-smbios: Introduce dispatcher for SMM calls")
> Signed-off-by: Damien Th=C3=A9bault <damien@dtbo.net>
> Tested-by: Damien Th=C3=A9bault <damien@dtbo.net>
> ---
>  drivers/platform/x86/dell-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c
> b/drivers/platform/x86/dell-laptop.c index f1fa8612db40..06978c14c83b
> 100644 --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -2185,7 +2185,7 @@ static int __init dell_init(void)
>  		dell_fill_request(&buffer, token->location, 0, 0, 0);
>  		ret =3D dell_send_request(&buffer,
>  					CLASS_TOKEN_READ,
> SELECT_TOKEN_AC);
> -		if (ret)
> +		if (ret =3D=3D 0)
>  			max_intensity =3D buffer.output[3];
>  	}
> =20

Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--wtqqc3twmzzketk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCW0IpGAAKCRCL8Mk9A+RD
UktQAJ9ndsT1KIfEeZAahpigvrPbDJH+sACfYRCDasXR+UBhF7ARasxGpznSWXU=
=rZw7
-----END PGP SIGNATURE-----

--wtqqc3twmzzketk2--
