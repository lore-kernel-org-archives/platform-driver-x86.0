From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: New dell-wireless driver
Date: Sun, 23 Nov 2014 16:11:03 +0100
Message-ID: <201411231611.03636@pali>
References: <201411222345.08384@pali> <201411230152.46619@pali> <20141122034444.GA47826@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1982077.Q4LizkZ9JL";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:48806 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466AbaKWPLH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 23 Nov 2014 10:11:07 -0500
Received: by mail-wi0-f169.google.com with SMTP id r20so6597000wiv.4
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Nov 2014 07:11:05 -0800 (PST)
In-Reply-To: <20141122034444.GA47826@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

--nextPart1982077.Q4LizkZ9JL
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 22 November 2014 04:44:45 Darren Hart wrote:
> On Sun, Nov 23, 2014 at 01:52:46AM +0100, Pali Roh=C3=A1r wrote:
> > Ok, I will sent patches. There are some problems which I'm
> > trying to fix together with Gabriele. Do you need to see
> > patches now, or can you wait some time until we fix it?
>=20
> We can definitely wait some time. A week is perfectly fine, a
> couple weeks starts to be a stretch (relative to the upcoming
> merge window). Still, I'd rather get this right. So yes, we
> can wait.

Driver sent to ML. Setting soft rfkill has problems, so code is=20
disabled and driver reports only hard rfkill state.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1982077.Q4LizkZ9JL
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlRx+QcACgkQi/DJPQPkQ1LzMgCeJJN4ES2PljGujvmTWiPzkNOA
5EgAoMHAFgni2SqieUIjaaBPf81+PW3h
=QNQE
-----END PGP SIGNATURE-----

--nextPart1982077.Q4LizkZ9JL--
