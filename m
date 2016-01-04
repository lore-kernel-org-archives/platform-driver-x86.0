From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 4 Jan 2016 21:23:52 +0100
Message-ID: <201601042123.52524@pali>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com> <20160104201231.GB5847@amd>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1914816.oXtGk1Vs16";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33700 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751902AbcADUXz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 15:23:55 -0500
In-Reply-To: <20160104201231.GB5847@amd>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

--nextPart1914816.oXtGk1Vs16
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 04 January 2016 21:12:31 Pavel Machek wrote:
> Hi1
>=20
> > This patch adds support for controlling keyboard backlight via
> > standard linux led class interface (::kbd_backlight). It uses ACPI
> > HKEY device with MLCG and MLCS methods.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > Tested-by: Fabio D'Urso <fabiodurso@hotmail.it>
>=20
> On my thinkpad, keyboard light is controlled by
>=20
> /sys/class/leds/tpacpi\:\:thinklight/brightness
>=20
> (that's a bad name).

Hi!

That is light in upper case of bezel/display, right? Thinklight is=20
probably official marketing name for that by IBM/Lenovo.

My patch adds support for keyboard backlight (light under the keyboard).

> On n900, it is .../leds/kb0..kb6. Now we'd have kbd_backlight. I
> guess we should standartize on one name for this light, so that
> userspace has the chance to handle it automatically...

Looks like userspace already uses /sys/class/leds/*::kbd_backlight for=20
keyboard backlight (light under the keyboard). At least other drivers=20
uses this name and my KDE desktop recognized "dell::kbd_backlight" (from=20
dell-laptop.ko) and "tpacpi::kbd_backlight" too.

So really for keyboard backlight use *::kbd_backlight it is already=20
handled by existing userspace applications.

> Also, neccessity of workqueues for LED setting is slowly being
> removed from the kernel, see LED mailing list for details.

My patch uses kbd_backlight LED in same as as other LEDs in thinkpad=20
acpi driver.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1914816.oXtGk1Vs16
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaK1NgACgkQi/DJPQPkQ1LB0gCgppMn36wHlnGElpsG/khuZU7r
+IMAoJbvPKjwCigzKvvACjzQ5HO8hrrf
=0xRL
-----END PGP SIGNATURE-----

--nextPart1914816.oXtGk1Vs16--
