From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend to RAM
Date: Sat, 21 Nov 2015 20:08:46 +0100
Message-ID: <201511212008.46761@pali>
References: <5650BE8E.2080506@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8235092.c1Pmyk4oxQ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:34404 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751780AbbKUTIt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 Nov 2015 14:08:49 -0500
Received: by wmvv187 with SMTP id v187so112330808wmv.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2015 11:08:48 -0800 (PST)
In-Reply-To: <5650BE8E.2080506@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrei Borzenkov <arvidjaar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, dvhart@infradead.org

--nextPart8235092.c1Pmyk4oxQ
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 21 November 2015 19:57:18 Andrei Borzenkov wrote:
> After installing 4.2 on Dell Latitude E5450 I found that wireless was
> disabled every second resume from suspend to RAM. Blacklisting
> dell-rbtn "fixed" it.
>=20
> This is probably the same as discussed in this Arch forum and related
> bug report: https://bbs.archlinux.org/viewtopic.php?id=3D203404. I
> myself hit it on Ubuntu.
>=20
> I am not familiar with other models, but E5450 does have DELLABCE and
> so is using dell-rbtn driver.
>=20
> I am happy to test patches if need. Please let me know if formal bug
> report is required.
>=20
> -andrei

Hi Andrei!

About five hours ago Gabriele sent patch which fixing this problem to=20
LKML. You can find it on: https://lkml.org/lkml/2015/11/21/57

Can you test that patch and confirm it fix also for you?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart8235092.c1Pmyk4oxQ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlZQwT4ACgkQi/DJPQPkQ1IBLQCdGSB/nfH27VhjefvqmWyoXl/r
SpQAmwYi4FOnQnExOxwOBOW/onmCQuj2
=A8N5
-----END PGP SIGNATURE-----

--nextPart8235092.c1Pmyk4oxQ--
