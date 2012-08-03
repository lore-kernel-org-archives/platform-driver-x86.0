From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Subject: Re: [PATCH] dell-laptop: Add 6 machines to touchpad led quirk
Date: Fri, 03 Aug 2012 15:43:56 +0200
Message-ID: <501BD59C.5040007@igalia.com>
References: <1342168797-26080-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="------------enigD4C60F929CA751534ADD417A"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp3.mundo-r.com ([212.51.32.191]:57205 "EHLO
	smtp4.mundo-r.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753879Ab2HCNoH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Aug 2012 09:44:07 -0400
In-Reply-To: <1342168797-26080-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigD4C60F929CA751534ADD417A
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 13/07/12 10:39, AceLan Kao wrote:
> Add the following machines into quirk,
> Isnpiron 5420, Isnpiron 5520, Isnpiron 5720,
> Isnpiron 7420, Isnpiron 7520, Isnpiron 7720
>=20
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/platform/x86/dell-laptop.c |   54 ++++++++++++++++++++++++++++=
++++++++
>  1 file changed, 54 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
> index 5f78aac..4e96e8c 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -206,6 +206,60 @@ static struct dmi_system_id __devinitdata dell_qui=
rks[] =3D {
>  		},
>  		.driver_data =3D &quirk_dell_vostro_v130,
>  	},
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Inspiron 5420",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5420"),
> +		},
> +		.driver_data =3D &quirk_dell_vostro_v130,
> +	},
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Inspiron 5520",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5520"),
> +		},
> +		.driver_data =3D &quirk_dell_vostro_v130,
> +	},
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Inspiron 5720",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5720"),
> +		},
> +		.driver_data =3D &quirk_dell_vostro_v130,
> +	},
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Inspiron 7420",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7420"),
> +		},
> +		.driver_data =3D &quirk_dell_vostro_v130,
> +	},
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Inspiron 7520",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7520"),
> +		},
> +		.driver_data =3D &quirk_dell_vostro_v130,
> +	},
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Inspiron 7720",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7720"),
> +		},
> +		.driver_data =3D &quirk_dell_vostro_v130,
> +	},
>  	{ }
>  };
> =20

Perhaps this needs a sed "s/Isnpiron/Inspiron/g" ???


--------------enigD4C60F929CA751534ADD417A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBCgAGBQJQG9WcAAoJEJZQic5rlfiCu/MQALMn4Zb/IHtVajG5pLVyRY3D
Lyjf2WKa0DhdNPfrN41awJPeyWzeFZrpOD94ySEicm8WY6XBsvcnZ5zZwbM+iV84
4QTJtYLS3pPzGj4Kzc8C7AnKlHmHCWOXzPYFb9k2j6rw6EGjRngU+qvt2Y9FCBuW
IO7ODM+RhffVinfw9CDxEMPYppfwg7Tna+cbEDSRCmcnd8tqpRz1dr9JQYDrkcfN
zM+yuFbqxeUUV/32e6WURu2AB03cbmS4LctF/+5evep6cr7kUwa6lZ+Tg03/qLow
R2RN/lpYYMBXzFfdYaRniz3s21bDTrzFCJ14PQFs8wn3VHQFNzUzhiXwP5cofhAH
7/LrO/mNXZ/n4fQaoFwC/ot6Tgxno69HJjZPNo9ekhNRNVqz6SB4yxrBx60yN41k
lBVzQwyNnKS7Ij/n7XybFH1KrPDemLPGxn5AMGWZ1pQv/KWhDINCxqcU7u7inAFI
rt6oaBwbWW96S4td1JLtEMzeQdC9R8pn1oywDSEV3nR9c4R9WINCal7+bGDVinua
O3fPAbKP2QxREhIhyeTBBVGIlo659jyWafzDHqqEJn48JeYGv/cN0KlEa60ctqcQ
hdiYpbBrl57X/5WUkIyxXy/4kBKlkiMayl405zWyTC+yMI+m7gL/jw+cgy1xl68D
T/MrPB3dgBT35EQSd1CU
=ZE9Y
-----END PGP SIGNATURE-----

--------------enigD4C60F929CA751534ADD417A--
