From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Tue, 23 Jun 2015 21:47:24 +0200
Message-ID: <201506232147.24651@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl> <20150623114659.GM31818@pali> <20150623194015.GA2579@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart49492260.xtBcHWjBAs";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:36719 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932552AbbFWTr2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Jun 2015 15:47:28 -0400
Received: by wicnd19 with SMTP id nd19so115954828wic.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2015 12:47:27 -0700 (PDT)
In-Reply-To: <20150623194015.GA2579@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

--nextPart49492260.xtBcHWjBAs
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 23 June 2015 21:40:15 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > Then compile dell-wmi.ko driver with debug messages, so pr_debug()
> > call will print messages to dmesg. Press key and check if you see
> > some info from dell-wmi.ko in dmesg.
>=20
> I did that as well. Nothing appears in dmesg after pressing the
> hotkeys, even when dell-wmi is compiled with -DDEBUG.

In this case it means that event was not received via WMI... pr_debug()=20
should write debug info to dmesg when we receive unknown WMI event.

Maybe we need to somehow enable receiving such events? I do not have WMI=20
documentation and without it I'm unable to probably fix this problem...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart49492260.xtBcHWjBAs
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWJt8wACgkQi/DJPQPkQ1L/YwCfbKgHVSaqltdl0tn1jGqe808O
7J8An14Ie89wsC3T6xOJQw6Mn26sRAdF
=5Oh/
-----END PGP SIGNATURE-----

--nextPart49492260.xtBcHWjBAs--
