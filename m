From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 0/2] Fixes for dell-wmi
Date: Mon, 28 Dec 2015 14:46:36 +0100
Message-ID: <201512281446.36868@pali>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com> <20151228133317.GA7540@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2138026.yoLa8TrZo1";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38658 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777AbbL1Nqk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Dec 2015 08:46:40 -0500
In-Reply-To: <20151228133317.GA7540@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart2138026.yoLa8TrZo1
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 28 December 2015 14:33:17 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > This patch series adds check if Dell WMI descriptor structure is
> > valid and fixes processing WMI events on devices with WMI
> > interface version 0.
> >=20
> > After testing, second patch is good candidate for backporting into
> > stable kernels, but problem is that it cannot be used without
> > first patch. So I let decision to other people.
> >=20
> > Gabriele and Micha=C5=82, this patch series should fix processing events
> > on yours Dell laptops (you have in DSDT defined version 0). Can
> > you test it?
>=20
> My Vostro V131 (and any other as well, judging from the DSDT dumps I
> found scattered around the web) has the WMI Interface Version field
> set to 1, as the first one of your patches correctly asserts.

Ok, great. Can you post DEBUG output when receiving events before and=20
after patch (to check that processing is correct)?=20

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2138026.yoLa8TrZo1
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaBPTwACgkQi/DJPQPkQ1JhcwCfeVtdjvyL8iU4WR2sbFgxu3Mn
bXkAoJrVpSs1slxOLr+gjimcgYZRkcG3
=D7WV
-----END PGP SIGNATURE-----

--nextPart2138026.yoLa8TrZo1--
