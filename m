From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Sat, 10 Jun 2017 21:15:57 +0200
Message-ID: <201706102115.57995@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3297869.eVptn7DLR1";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:36333 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751555AbdFJTQA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Jun 2017 15:16:00 -0400
In-Reply-To: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart3297869.eVptn7DLR1
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 27 May 2017 13:55:34 Pali Roh=C3=A1r wrote:
> instance_count defines number of instances of data block and instance
> itself is indexed from zero, which means first instance has number 0.
> Therefore check for invalid instance should be non-strict inequality.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> ---
> I'm marking this patch as RFC because it is not tested at all and
> probably could break existing WMI drivers. Some WMI drivers pass
> instance number 1 and I'm not sure if ACPI-WMI bytecode for those
> machines has really two instances. In more cases ACPI-WMI bytecode
> does not check instance number if supports only one instance. So
> then any instance id can be used for correct execution of ACPI-WMI
> method.
>=20
> So this patch is open for discussion.

Hi! Any comments?

> ---
>  drivers/platform/x86/wmi.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index cd7045f..df63037 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -191,7 +191,7 @@ acpi_status wmi_evaluate_method(const char
> *guid_string, u8 instance, if (!(block->flags & ACPI_WMI_METHOD))
>  		return AE_BAD_DATA;
>=20
> -	if (block->instance_count < instance)
> +	if (block->instance_count <=3D instance)
>  		return AE_BAD_PARAMETER;
>=20
>  	input.count =3D 2;
> @@ -250,7 +250,7 @@ struct acpi_buffer *out)
>  	block =3D &wblock->gblock;
>  	handle =3D wblock->handle;
>=20
> -	if (block->instance_count < instance)
> +	if (block->instance_count <=3D instance)
>  		return AE_BAD_PARAMETER;
>=20
>  	/* Check GUID is a data block */
> @@ -323,7 +323,7 @@ acpi_status wmi_set_block(const char
> *guid_string, u8 instance, block =3D &wblock->gblock;
>  	handle =3D wblock->handle;
>=20
> -	if (block->instance_count < instance)
> +	if (block->instance_count <=3D instance)
>  		return AE_BAD_PARAMETER;
>=20
>  	/* Check GUID is a data block */

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3297869.eVptn7DLR1
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlk8RW0ACgkQi/DJPQPkQ1K8WACgywv3Iwy1Sxf4hVF8pDbUU79A
y4MAn1yeDyyWkQe5Ievvx1aMN8nLnw+9
=kF1h
-----END PGP SIGNATURE-----

--nextPart3297869.eVptn7DLR1--
