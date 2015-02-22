From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform: x86: dell-laptop: Add support for keyboard backlight
Date: Sun, 22 Feb 2015 12:04:23 +0100
Message-ID: <201502221204.24003@pali>
References: <1424343509-13639-1-git-send-email-gabriele.mzt@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4986911.4yBa9hISaC";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:57218 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751744AbbBVLE1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 22 Feb 2015 06:04:27 -0500
In-Reply-To: <1424343509-13639-1-git-send-email-gabriele.mzt@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, A.Sloman@cs.bham.ac.uk, computersforpeace@gmail.com, dan.carpenter@oracle.com

--nextPart4986911.4yBa9hISaC
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 19 February 2015 11:58:29 Gabriele Mazzotta wrote:
> This patch adds the support for the configuration of the
> keyboard backlight on supported Dell laptops.
>=20
> With this patch it is possible to set:
> * keyboard backlight level
> * timeout after which the backlight will be automatically
> turned off * input activity triggers (keyboard, touchpad,
> mouse) that enable the backlight * ambient light settings
>=20
> The settings are exposed via
> /sys/class/leds/dell::kbd_backlight/
>=20
> The code is based on the newly released documentation by Dell
> in the libsmbios project.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  .../ABI/testing/sysfs-platform-dell-laptop         |   69 ++
>  drivers/platform/x86/dell-laptop.c                 | 1089
> +++++++++++++++++++- 2 files changed, 1152 insertions(+), 6
> deletions(-)
>  create mode 100644
> Documentation/ABI/testing/sysfs-platform-dell-laptop
>=20

This patch is same as combination of previous, just contains all=20
changes in single patch file. Difference between v3.19-rc5 and=20
current version is just als code was moved to separate functions=20
and als backlight can be enabled via new sysfs attribute (like in=20
second patch which was sent).

I tested this patch on top of linus tree (commit 79513d0) and=20
keyboard backlight works fine.

Darren, what do you think, can be this patch which brings=20
keyboard backlight support finally moved to mainline kernel?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart4986911.4yBa9hISaC
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlTpt7cACgkQi/DJPQPkQ1JLBQCeIVdSEWuxeiO36e2IetFg0P3U
IcQAoIMfSFA8f3q2BLtNXd4Kli6fG5op
=409M
-----END PGP SIGNATURE-----

--nextPart4986911.4yBa9hISaC--
