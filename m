From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 4/5] dell-wmi: Support new hotkeys on the XPS 13 9350 (Skylake)
Date: Mon, 15 Feb 2016 18:37:16 +0100
Message-ID: <201602151837.16114@pali>
References: <cover.1455553470.git.luto@kernel.org> <201602151820.56085@pali> <56C20A40.6010807@dell.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1554842.zQ32sQKmRI";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:36120 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481AbcBORhS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 12:37:18 -0500
Received: by mail-wm0-f54.google.com with SMTP id g62so69824055wme.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2016 09:37:18 -0800 (PST)
In-Reply-To: <56C20A40.6010807@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>

--nextPart1554842.zQ32sQKmRI
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 15 February 2016 18:26:24 Mario Limonciello wrote:
> On 02/15/2016 11:20 AM, Pali Roh=C3=A1r wrote:
> > On Monday 15 February 2016 17:32:36 Andy Lutomirski wrote:
> >> +       /* Stealth mode toggle */
> >> +       { KE_IGNORE, 0x155, { KEY_RESERVED } },
> >=20
> > Hi! Just one question, what does this "Stealth mode" means and what
> > this toggle key/button doing?
> >=20
> > I would propose for Laptops manufactures to revert back normal
> > nonchiclet keyboard with full 105 normal keys (with F1-F12) instead
> > inventing such useless and crappy/funny names for keys/buttons on
> > laptops which replace PgUP/PgDown/SysRq and etc...
>=20
> Pali,
>=20
> Stealth mode will "disable all lights and sounds".  The event is for
> notification only.  The actual change is performed by a combination
> of the BIOS and EC.
>=20
> There is also a BIOS setting that disables the hotkey from doing
> anything.
>=20
> Thanks,

Thank you! Now I can image what this line in diff means :-)

Anyway, I would propose some rule to and longer description for newly=20
invented hot key events which are marked as KEY_RESERVED in kernel=20
source code. Really sometimes it is hard to guess what it can means and=20
constant KEY_RESERVED does not help much more.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1554842.zQ32sQKmRI
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlbCDMwACgkQi/DJPQPkQ1KP4QCfcqBj/KJ8JCGIaxKTlM1yBUVl
FPsAniEaW64eVlEAoJWdlhAj2aK586gU
=qtgf
-----END PGP SIGNATURE-----

--nextPart1554842.zQ32sQKmRI--
