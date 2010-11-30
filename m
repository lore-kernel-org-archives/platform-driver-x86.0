From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: Re: [PATCH 2/2] classmate-laptop: little optimization for
 cmpc_rfkill_block
Date: Tue, 30 Nov 2010 16:54:20 -0200
Message-ID: <20101130185420.GE3885@barata.holoscopio.com>
References: <1291141843-8807-1-git-send-email-herton@mandriva.com.br>
 <1291141843-8807-2-git-send-email-herton@mandriva.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:58269 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751784Ab0K3Sy0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Nov 2010 13:54:26 -0500
Content-Disposition: inline
In-Reply-To: <1291141843-8807-2-git-send-email-herton@mandriva.com.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2010 at 04:30:43PM -0200, Herton Ronaldo Krzesinski wrote:
> We don't need to call bios/acpi (cmpc_set_rfkill_wlan) if the blocked
> state is already set to the same value (little optimization). This can
> happen for example if we initialize the module with same initial
> hardware state (rfkill core always call cmpc_rfkill_block on
> initialization here).
>=20
> Also GWRI method only accepts 0 or 1 for setting rfkill block, as can be
> seen on AML code from acpidump->DSDT from a classmate sample I have, so
> should be fine setting state only to 0 or 1 directly.
>=20
> Signed-off-by: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
> Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
> ---
>  drivers/platform/x86/classmate-laptop.c |   16 +++++++++-------
>  1 files changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x=
86/classmate-laptop.c
> index b714c6a..51ec5f5 100644
> --- a/drivers/platform/x86/classmate-laptop.c
> +++ b/drivers/platform/x86/classmate-laptop.c
> @@ -522,18 +522,20 @@ static int cmpc_rfkill_block(void *data, bool block=
ed)
>  	acpi_status status;
>  	acpi_handle handle;
>  	unsigned long long state;
> +	bool is_blocked;
> =20
>  	handle =3D data;
>  	status =3D cmpc_get_rfkill_wlan(handle, &state);
>  	if (ACPI_FAILURE(status))
>  		return -ENODEV;
> -	if (blocked)
> -		state &=3D ~1;
> -	else
> -		state |=3D 1;
> -	status =3D cmpc_set_rfkill_wlan(handle, state);
> -	if (ACPI_FAILURE(status))
> -		return -ENODEV;
> +	/* Check if we really need to call cmpc_set_rfkill_wlan */
> +	is_blocked =3D state & 1 ? false : true;
> +	if (is_blocked !=3D blocked) {
> +		state =3D blocked ? 0 : 1;
> +		status =3D cmpc_set_rfkill_wlan(handle, state);
> +		if (ACPI_FAILURE(status))
> +			return -ENODEV;
> +	}
>  	return 0;
>  }
> =20
> --=20
> 1.7.3.2
>=20

Acked-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJM9UhbAAoJEEWxSg7udFZIne8QAM3xkUaYsA63o/H01BlB997g
+j6V2BVw4UKfz3nPnBfq0H4vNeRwaD7+qAxyRIAgEqM3M8Ys+/0PZcZtc1rFrhdE
f3txScSsQ2wirynNjmC4k10y9hFXsYSQzEcv9bnwAMSR9hLIlSBALRCcP26IPHET
g7+1bveq6Cl/VGMKigRfYaYla7YajCsj1ijqJ/1G/AL0Zjv7SD38oKmj2c+7Vi45
/hcmJCdNa7FapB24vEOwJyZZLC4K20hp4j7zh/6v0Do/dFlo8zWsojhzAPBVs/za
XZ3SjcGUdpnoqvdpGoNiY7/b4almJUIeg0t+4aQ87gix3KUbn3YZjwUhU/JEJ1pf
PYAhZY0osspjVgy8E+x6yBGvVLj5PW9IDQOmSlLNhR8HYSb4AoDSn9/OJI36l8F6
F1QZkPxB1KT8JlRlwN/fWM618Ub3fimobgXYLZ78i0NsBESGtNuOwBr7yprkhgB5
D01IDcIbz+VPchZeeQTR6eezrRF57gJ1wQ1GBTQEC3vsY4jnvU/y+ziH+00i3A38
FHtbJ0p0XCcZw2aAyF6Pg3j9lo00gOwPvNGRRrA2227u1nAvjPVu/4BeAzzn2LS8
CLlMELJKAJ74Ib/lEkz5EKoBtvE4sPf7GQMHaHHtM8O9faEAzTtLOp5XZqkYXHg7
OG/Rb/Rv7obvQ5ni2cNF
=22PP
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
