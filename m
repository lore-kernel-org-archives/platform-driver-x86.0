From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Improve explanation about DELLABC6
Date: Sat, 27 May 2017 13:01:10 +0200
Message-ID: <201705271301.10526@pali>
References: <c3d605a0a82e819891fec18b4057406358878a76.1495862179.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart115076582.QaZgfroqLs";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33059 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752602AbdE0LBO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 07:01:14 -0400
In-Reply-To: <c3d605a0a82e819891fec18b4057406358878a76.1495862179.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Mario Limonciello <mario_limonciello@dell.com>

--nextPart115076582.QaZgfroqLs
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 27 May 2017 07:16:19 Darren Hart wrote:
> From: Andy Lutomirski <luto@kernel.org>
>=20
> According to Mario at Dell, the DELLABC6 device should not be used on
> a Linux system. It also conflicts with Intel-HID and its
> interactions with Network Manager. Document that we are aware of the
> device, but that we are intentionally ignoring it.
>=20
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> [dvhart: New commit message and minor comment wording fixes]
> Cc: Mario Limonciello <mario_limonciello@dell.com>
> Cc: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> ---
>  drivers/platform/x86/dell-rbtn.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-rbtn.c
> b/drivers/platform/x86/dell-rbtn.c index dcd9f40..2eeef03 100644
> --- a/drivers/platform/x86/dell-rbtn.c
> +++ b/drivers/platform/x86/dell-rbtn.c
> @@ -223,14 +223,26 @@ static const struct acpi_device_id rbtn_ids[] =3D
> { * This driver can also handle the "DELLABC6" device that
>  	 * appears on the XPS 13 9350, but that device is disabled
>  	 * by the DSDT unless booted with acpi_osi=3D"!Windows 2012"
> -	 * acpi_osi=3D"!Windows 2013".  Even if we boot that and bind
> -	 * the driver, we seem to have inconsistent behavior in
> -	 * which NetworkManager can get out of sync with the rfkill
> -	 * state.
> +	 * acpi_osi=3D"!Windows 2013".
>  	 *
> -	 * On the XPS 13 9350 and similar laptops, we're not supposed to
> -	 * use DELLABC6 at all.  Instead, we handle the rfkill button
> -	 * via the intel-hid driver.
> +	 * According to Mario at Dell:
> +	 *
> +	 *  DELLABC6 is a custom interface that was created solely to
> +	 *  have airplane mode support for Windows 7.  For Windows 10
> +	 *  the proper interface is to use that which is handled by
> +	 *  intel-hid.  A OEM airplane mode driver is not used.
> +	 *
> +	 *  Since the kernel doesn't identify as Windows 7 it would be
> +	 *  incorrect to do attempt to use that interface.
> +	 *
> +	 * Even if we override _OSI and bind to DELLABC6, we end up
> +	 * with inconsistent behavior in which NetworkManager can get
> +	 * out of sync with the rfkill state.  This happens because
> +	 * NetworkManager receives events from intel-hid and fights with
> +	 * dell-rbtn for control.
> +	 *
> +	 * The upshot is that it's better to just ignore DELLABC6
> +	 * devices.
>  	 */
>=20
>  	{ "", 0 },

Just one note: Kernel code should not depend on one particular software=20
which implements networking (in userspace). Either behaviour is=20
independent of used software and therefore comment does not apply only=20
to Network Manager OR behaviour is strictly bounded to Network Manager=20
which is IMHO not a kernel bug, but rather userspace software=20
application bug. If there is a bug in userspace, then userspace should=20
be fixed instead of adding hacks/workarounds in kernel.

Currently from comment it is hard for non platform/x86/dell people to=20
decide if problem is in userspace or kernel/acpi. It could be understood=20
as two kernel drivers "dell-rbtn" and "intel-hid" are fighting, but also=20
as one particular software (network manager) is unable to handle state=20
with more then on driver.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart115076582.QaZgfroqLs
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlkpXHYACgkQi/DJPQPkQ1JZyACffD/WV82EP56/ltLlJoui5PPe
wZ0An0cAgmLhGUgeg2LtEUaRVPaRK5g0
=ixBw
-----END PGP SIGNATURE-----

--nextPart115076582.QaZgfroqLs--
