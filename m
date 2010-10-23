From: Jon Dowland <jmtd@debian.org>
Subject: [PATCH] toshiba_acpi.c: Add key_entry for a lone FN keypress
Date: Sat, 23 Oct 2010 23:12:53 +0100
Message-ID: <20101023221253.GA4829@hathor>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from redmars.org ([92.243.31.175]:53695 "EHLO deckard.alcopop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753406Ab0JWW5W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 23 Oct 2010 18:57:22 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

A lone FN key press on a Toshiba Port=E9g=E9 R700 without another key in
conjunction results in an ACPI event and a spurious error message on
the console.

Add a key entry to map this event to a KEY_UNKNOWN keypress silences
this message.

Signed-off-by: Jon Dowland <jmtd@debian.org>

----

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/tos=
hiba_acpi.c
index a388bd6..954443e 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -142,6 +142,7 @@ static struct key_entry toshiba_acpi_keymap[]  =3D {
 	{KE_KEY, 0x141, KEY_BRIGHTNESSUP},
 	{KE_KEY, 0x142, KEY_WLAN},
 	{KE_KEY, 0x143, KEY_PROG1},
+	{KE_KEY, 0x17f, KEY_UNKNOWN}, /* FN key by itself */
 	{KE_KEY, 0xb05, KEY_PROG2},
 	{KE_KEY, 0xb06, KEY_WWW},
 	{KE_KEY, 0xb07, KEY_MAIL},

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkzDXeUACgkQFotOcXAy8jjwlwCgqqtWItROnb0rbb17a58pcgC6
B/AAoJEBDH/c76NCcFJZ6kFuDw0TUT73
=VgLO
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
