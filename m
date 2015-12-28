From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/2] dell-wmi: Check if Dell WMI descriptor structure is valid
Date: Mon, 28 Dec 2015 15:08:20 +0100
Message-ID: <201512281508.20683@pali>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com> <1450991926-20937-2-git-send-email-pali.rohar@gmail.com> <20151228133707.GB7540@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8802709.6tff9tpSFN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:37335 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777AbbL1OIY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Dec 2015 09:08:24 -0500
In-Reply-To: <20151228133707.GB7540@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart8802709.6tff9tpSFN
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 28 December 2015 14:37:07 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > According to Dell WMI document mentioned in ML dicussion archived
> > at http://www.spinics.net/lists/platform-driver-x86/msg07220.html
> > OS should check Dell WMI descriptor structure.
>=20
> "Should" or "can"?  I skimmed through the ACPI-WMI PDF and Mario's
> message again and I couldn't find any explicit statement urging the
> reader to check the structure in question before doing anything else.

That's questionable... In "Design flow" is first point that WMI=20
descriptor check.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart8802709.6tff9tpSFN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaBQlQACgkQi/DJPQPkQ1LfrwCgjnZ/CvxSHLeram8nlnJV3NuO
3rYAoKiHyu0xuIammYDKq+PNuFdVd7B1
=NDq7
-----END PGP SIGNATURE-----

--nextPart8802709.6tff9tpSFN--
