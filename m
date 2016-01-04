From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 4 Jan 2016 21:51:23 +0100
Message-ID: <201601042151.23995@pali>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com> <201601042126.19417@pali> <20160104204020.GC4219@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5723182.SpWK0u57Fd";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37556 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751990AbcADUv0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 15:51:26 -0500
In-Reply-To: <20160104204020.GC4219@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

--nextPart5723182.SpWK0u57Fd
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 04 January 2016 21:40:20 Darren Hart wrote:
> On Mon, Jan 04, 2016 at 09:26:19PM +0100, Pali Roh=C3=A1r wrote:
> > On Monday 04 January 2016 21:04:25 Darren Hart wrote:
> > > On Wed, Dec 30, 2015 at 11:27:41PM +0100, Pali Roh=C3=A1r wrote:
> > > > This patch adds support for controlling keyboard backlight via
> > > > standard linux led class interface (::kbd_backlight). It uses
> > > > ACPI HKEY device with MLCG and MLCS methods.
> > >=20
> > > Which laptops is this intended to support?
> >=20
> > Thinkpad ??30 series and new which have backlight keyboard.
>=20
> Thanks, we should include that in the commit message as well as the
> comments surrounding the driver section.

??30 is probably not good characteristic, but I mean all those Thinkpad=20
laptops like T430, x230, E430, X1 (1st) and their successors (T440,=20
T450, X1 3rd, ...) All those which are from Ivy Bridge processor=20
generation (and new).

But basically it cover all Thinkpad laptops which have backlight=20
keyboard. Older Thinkpad laptops had only light in bezel.

So if you have better idea for commit message, feel free to change it.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart5723182.SpWK0u57Fd
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaK20sACgkQi/DJPQPkQ1KDgACgkr5DFg4TDhoc28I2PA2bsYdZ
+KEAn2yzF3MbXXcf0BHqtKwoI3ttuaNq
=CPIm
-----END PGP SIGNATURE-----

--nextPart5723182.SpWK0u57Fd--
