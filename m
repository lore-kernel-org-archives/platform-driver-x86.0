From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Sat, 4 Jul 2015 23:24:57 +0200
Message-ID: <201507042324.57768@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl> <201507022258.32104@pali> <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2138165.XcJqVxA5XM";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:34454 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751273AbbGEKyz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jul 2015 06:54:55 -0400
Received: by wifm2 with SMTP id m2so6272428wif.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Jul 2015 03:54:54 -0700 (PDT)
In-Reply-To: <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

--nextPart2138165.XcJqVxA5XM
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 03 July 2015 08:52:44 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > Can you write which WMI call needs to be called?
>=20
> Technically, one needs to call method DoBFn (method ID =3D 1) using
> GUID A80593CE-A997-11DA-B012-B622A1EF5492. Though if you look at the
> ACPI method this GUID maps to (WMBA), you'll notice that the first
> two arguments passed to it (instance number and method ID) are
> simply ignored and the only one that matters is the buffer passed
> (third argument).
>=20

OK, and can you write what is needed to fill into buffer?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2138165.XcJqVxA5XM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWYTykACgkQi/DJPQPkQ1Ih9wCfUgO3lSFDkN7tcYIpQr+IPsEF
QOgAn3Kp4N696z5uapTPPFpJ5N7G/Rf8
=TwhA
-----END PGP SIGNATURE-----

--nextPart2138165.XcJqVxA5XM--
