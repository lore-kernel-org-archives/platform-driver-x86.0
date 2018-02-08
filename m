From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Removed duplicates in DMI
 whitelist
Date: Thu, 8 Feb 2018 17:52:33 +0100
Message-ID: <20180208165233.t5oywk7ikjds6gnk@pali>
References: <20180207221226.11345-1-alexander.n.abrosimov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yfhgoliowzcfaozs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180207221226.11345-1-alexander.n.abrosimov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--yfhgoliowzcfaozs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thursday 08 February 2018 01:12:26 Alexander Abrosimov wrote:
> Fixed a mistake in which several entries were duplicated in the DMI list
> from the below commit
> fe486138 platform/x86: dell-laptop: Add 2-in-1 devices to the DMI whiteli=
st
>=20
> Signed-off-by: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>

Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

> ---
>  drivers/platform/x86/dell-laptop.c | 18 ------------------
>  1 file changed, 18 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-laptop.c
> index a7b141992cb3..a66a6a6e47b9 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -125,28 +125,10 @@ static const struct dmi_system_id dell_device_table=
[] __initconst =3D {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>  			DMI_MATCH(DMI_CHASSIS_TYPE, "32"), /*Detachable*/
>  		},
>  	},
>  	{
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_CHASSIS_TYPE, "30"), /*Tablet*/
> -		},
> -	},
> -	{
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_CHASSIS_TYPE, "31"), /*Convertible*/
> -		},
> -	},
> -	{
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_CHASSIS_TYPE, "32"), /*Detachable*/
> -		},
> -	},
> -	{
>  		.ident =3D "Dell Computer Corporation",
>  		.matches =3D {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
>  			DMI_MATCH(DMI_CHASSIS_TYPE, "8"),
>  		},

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--yfhgoliowzcfaozs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWnyATwAKCRCL8Mk9A+RD
UlHyAJ4s15C7UhMWXpDNyD7fc6a104FzTQCfVXOt9uiHUEX320ytxzBLD2TxAJs=
=IEfl
-----END PGP SIGNATURE-----

--yfhgoliowzcfaozs--
