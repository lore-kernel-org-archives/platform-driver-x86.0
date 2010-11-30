From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: Re: [PATCH 1/2] classmate-laptop: add missing input_sync call
Date: Tue, 30 Nov 2010 16:50:55 -0200
Message-ID: <20101130185055.GD3885@barata.holoscopio.com>
References: <1291141843-8807-1-git-send-email-herton@mandriva.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:58261 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752246Ab0K3SvC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Nov 2010 13:51:02 -0500
Content-Disposition: inline
In-Reply-To: <1291141843-8807-1-git-send-email-herton@mandriva.com.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2010 at 04:30:42PM -0200, Herton Ronaldo Krzesinski wrote:
> Add missing input_sync call in cmpc_keys_handler function.
>=20
> Signed-off-by: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
> Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
> ---
>  drivers/platform/x86/classmate-laptop.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x=
86/classmate-laptop.c
> index 341cbfe..b714c6a 100644
> --- a/drivers/platform/x86/classmate-laptop.c
> +++ b/drivers/platform/x86/classmate-laptop.c
> @@ -655,6 +655,7 @@ static void cmpc_keys_handler(struct acpi_device *dev=
, u32 event)
>  		code =3D cmpc_keys_codes[event & 0x0F];
>  	inputdev =3D dev_get_drvdata(&dev->dev);;
>  	input_report_key(inputdev, code, !(event & 0x10));
> +	input_sync(inputdev);
>  }
> =20
>  static void cmpc_keys_idev_init(struct input_dev *inputdev)
> --=20
> 1.7.3.2
>=20

Acked-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJM9UeOAAoJEEWxSg7udFZI6uEQAKeRW+PcgtT4YhMY21Z7O5rJ
mtpvWDqY8qJsRUJ1f2M3Qh0Qx1+Dz3W+m/Hxuo1uRGHKNJKmMle8TiA9fZ/Gekb7
gpcVGRBiNSJKgaNKFsvJ49sQQveh8JDWXbkIapKhQlAekV463sCea1/5+Fh7c+WB
xUllaVn30sHeOGmrs2AY+0p/WKvJEkYPf1AkJseX6wgJyk+H6tXn4s7gLDW8DTe/
lyvimUpZw62BZIaK6XD8r7ey6iMyT+xDS/wLGlb+Hb4aqPXIUKkFceyvXNPOMjmo
ZL4+qESrhLcaxWoTLZLjd5xHKm4E5PcYprtp6e2flZ6tDjfoOm94VFK+KteGNQQ8
GOgfxiis8Vv37lyVRnZdBBhNgjjmqfQB2U2F0zaFjrEMk9PTm4hQOwOiqrpHIJDD
p7pxAfKjPLyJebBJzB01I3GHRNbhZEzMmm1fIX1D/ft4cXyrjxzt5yO75ghxi5Ve
fE158PuvtcOo98rDzIGw6EfaXO6fhIPG3kmRw7GdamqlM3mwMdOmo/3zWpACuM4h
7srNgNy9Dn8sBiLWbfiGY575kMSrXBSqQgtWE0WFBtD6VM8I2ZcLh07KKRCCMkfJ
yqVaIyUmYNAxgrZK+thAdm0PQPeDqdx9lvDWBq6+w5cqcsSh1D6ItjqAPi/QR72I
lcNFEsnBpxXwKqO2Ag6b
=yApw
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
