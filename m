From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 4 Jan 2016 21:26:19 +0100
Message-ID: <201601042126.19417@pali>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com> <1451514461-31999-1-git-send-email-pali.rohar@gmail.com> <20160104200425.GC26072@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1618356.s9WdzTHfeJ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36025 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751933AbcADU0W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 15:26:22 -0500
In-Reply-To: <20160104200425.GC26072@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

--nextPart1618356.s9WdzTHfeJ
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 04 January 2016 21:04:25 Darren Hart wrote:
> On Wed, Dec 30, 2015 at 11:27:41PM +0100, Pali Roh=C3=A1r wrote:
> > This patch adds support for controlling keyboard backlight via
> > standard linux led class interface (::kbd_backlight). It uses ACPI
> > HKEY device with MLCG and MLCS methods.
>=20
> Which laptops is this intended to support?

Thinkpad ??30 series and new which have backlight keyboard.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1618356.s9WdzTHfeJ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaK1WsACgkQi/DJPQPkQ1IeWwCgi7H+oe1DQcYGP2I1e0AkP+F3
++EAniJUeESpE7DYK+j4aD8u0vCZXCps
=2C2G
-----END PGP SIGNATURE-----

--nextPart1618356.s9WdzTHfeJ--
