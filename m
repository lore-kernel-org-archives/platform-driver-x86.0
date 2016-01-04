From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 4 Jan 2016 21:40:01 +0100
Message-ID: <201601042140.02085@pali>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com> <20160104201231.GB5847@amd> <201601042123.52524@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2572146.8jNRuuBMSq";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36150 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751912AbcADUkE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 15:40:04 -0500
In-Reply-To: <201601042123.52524@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

--nextPart2572146.8jNRuuBMSq
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 04 January 2016 21:23:52 Pali Roh=C3=A1r wrote:
> Looks like userspace already uses /sys/class/leds/*::kbd_backlight
> for keyboard backlight (light under the keyboard). At least other
> drivers uses this name and my KDE desktop recognized
> "dell::kbd_backlight" (from dell-laptop.ko) and
> "tpacpi::kbd_backlight" too.
>=20
> So really for keyboard backlight use *::kbd_backlight it is already
> handled by existing userspace applications.

upower is one of tool used on linux desktops. See this source code:

http://cgit.freedesktop.org/upower/tree/src/up-kbd-backlight.c

It has function up_kbd_backlight_find() which do:

	/* find a led device that is a keyboard device */
	while ((filename =3D g_dir_read_name (dir)) !=3D NULL) {
		if (g_strstr_len (filename, -1, "kbd_backlight") !=3D NULL) {
			dir_path =3D g_build_filename ("/sys/class/leds",
						    filename, NULL);
			break;
		}
	}

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2572146.8jNRuuBMSq
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaK2KIACgkQi/DJPQPkQ1I6dQCfR164oXhoiOFJzcanfFjnam1H
aW0AoKZyGMcODJ+Sy7HpGC3ztNqbQMWF
=ISD3
-----END PGP SIGNATURE-----

--nextPart2572146.8jNRuuBMSq--
