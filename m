From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add a comment explaining the 0xb2 magic number
Date: Sat, 27 May 2017 12:51:36 +0200
Message-ID: <201705271251.37069@pali>
References: <e630e25d78e60a4f1c9bf4bdc725f0693d617db2.1495862128.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1837375.UKsI5RX0LM";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e630e25d78e60a4f1c9bf4bdc725f0693d617db2.1495862128.git.dvhart@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

--nextPart1837375.UKsI5RX0LM
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 27 May 2017 07:15:28 Darren Hart wrote:
> From: Andy Lutomirski <luto@kernel.org>
>=20
> The hotkey table is 0xb2, add a comment for clarity.
>=20
> Suggested-by: Darren Hart <dvhart@infradead.org>
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> Cc: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> Cc: Andy Shevchenko <andy@infradead.org>
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> ---
>  drivers/platform/x86/dell-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c
> b/drivers/platform/x86/dell-wmi.c index 8a64c79..24467b1 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -449,6 +449,7 @@ static void __init handle_dmi_entry(const struct
> dmi_header *dm, if (results->err || results->keymap)
>  		return;		/* We already found the hotkey table. */
>=20
> +	/* The Dell hotkey table is type 0xB2.  Scan until we find it. */
>  	if (dm->type !=3D 0xb2)
>  		return;

Good. Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

(Maybe in future we should add a #define name for such magic constants)

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1837375.UKsI5RX0LM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlkpWjkACgkQi/DJPQPkQ1IodwCgvFj4FuuHqq8qx9B6mp6CywH1
CRQAoLYpy8EMWnW+9oasTfRitTnZA0kW
=VBRk
-----END PGP SIGNATURE-----

--nextPart1837375.UKsI5RX0LM--
