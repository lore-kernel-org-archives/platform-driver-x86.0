From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-laptop: use dedicated sysfs file for ALS
Date: Tue, 10 Feb 2015 10:36:21 +0100
Message-ID: <201502101036.21896@pali>
References: <1421244357-31103-1-git-send-email-gabriele.mzt@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1684302.UJPWa41ATO";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:60663 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753486AbbBJJgZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Feb 2015 04:36:25 -0500
In-Reply-To: <1421244357-31103-1-git-send-email-gabriele.mzt@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, A.Sloman@cs.bham.ac.uk, computersforpeace@gmail.com

--nextPart1684302.UJPWa41ATO
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 14 January 2015 15:05:57 Gabriele Mazzotta wrote:
> The ambient light sensor doesn't act like an input trigger, so
> it has to be kept separate. The sensor readings are used to
> determine whether the conditions to change the keyboard
> illumination are satisfied or not the moment an input trigger
> is used. Ambient light changes alone can't change the
> keyboard backlight illumination and don't restart the timer.
>=20
> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> ---

Gabriele, can you look and integrate this patch into full=20
keyboard backlight support? Ideally send new full one...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1684302.UJPWa41ATO
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlTZ0RUACgkQi/DJPQPkQ1KfHwCgm3YrDsmVYct22xgNzQggDGV2
yCkAnigHTTJYLuRGtVzs0xAsut4YC00x
=zUjf
-----END PGP SIGNATURE-----

--nextPart1684302.UJPWa41ATO--
