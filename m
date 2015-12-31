From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Heads up: dell-wmi bug
Date: Thu, 31 Dec 2015 13:34:20 +0100
Message-ID: <201512311334.20816@pali>
References: <CALCETrUh6VPfwdCHAZyqcou4VQN4_xZuZ+St=gjhCB1aqPvuag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1851309.B6jPvWO2j4";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:36298 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750991AbbLaMeY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 Dec 2015 07:34:24 -0500
Received: by mail-wm0-f48.google.com with SMTP id l65so84884501wmf.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 31 Dec 2015 04:34:23 -0800 (PST)
In-Reply-To: <CALCETrUh6VPfwdCHAZyqcou4VQN4_xZuZ+St=gjhCB1aqPvuag@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: platform-driver-x86@vger.kernel.org

--nextPart1851309.B6jPvWO2j4
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 31 December 2015 13:31:03 Andy Lutomirski wrote:
> Hi-
>=20
> I'm getting intermittent OOPSes when playing with dell-wmi.  I think
> that find_hk_type function is buggy: it's saving a pointer to DMI
> data, but you can't do that, because dmi_walk unmaps the data at the
> end.  It probably works reliably on current kernels due to luck
> (either a memory layout such that the unmap has no effect or deferred
> vmap zapping).
>=20
> If no one beats me to it, I'll fix this as part of the rebase work on
> my big wmi series.
>=20
> --Andy

Hi! If this is truth, then I think separate patch for fixing this=20
problem should be created and backported also to stable kernels.

In my opinion WMI rework patches should not change functionality, just=20
API... Other function changes should be in separate commits.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1851309.B6jPvWO2j4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaFIMwACgkQi/DJPQPkQ1L5VACfXpv7357jwzUFwFxrrdF8/Ebt
fJYAmwXrAxj8z7QCtncdLrG+uw71bxQa
=44o9
-----END PGP SIGNATURE-----

--nextPart1851309.B6jPvWO2j4--
