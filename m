From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [patch] dell-laptop: fix kbd_timeout handling
Date: Thu, 4 Dec 2014 10:42:37 +0100
Message-ID: <201412041042.37888@pali>
References: <1417597233.14672.2.camel@Pali-Nokia-N900> <20141203100159.GA18731@mwanda> <20141203073324.GA8568@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1450902.JuMhvZQjqJ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:43363 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751391AbaLDJml (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 4 Dec 2014 04:42:41 -0500
Received: by mail-wg0-f45.google.com with SMTP id b13so22172051wgh.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Dec 2014 01:42:40 -0800 (PST)
In-Reply-To: <20141203073324.GA8568@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, kbuild@01.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

--nextPart1450902.JuMhvZQjqJ
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 03 December 2014 08:33:25 Darren Hart wrote:
> On Wed, Dec 03, 2014 at 01:01:59PM +0300, Dan Carpenter wrote:
> > The original code had a static checker warning:
> > 	drivers/platform/x86/dell-laptop.c:1389
> > 	kbd_led_timeout_store() warn: this array is probably
> > 	non-NULL. 'quirks->kbd_timeouts'
> >=20
> > This warning does indicate a bug.  I have added a
> > .needs_kbd_timeouts flag which is true if the
> > .kbd_timeouts[] array has been declared. Otherwise, in the
> > original code the quirk_dell_vostro_v130 struct didn't
> >=20
> > have .kbd_timeouts[] declared so the loop:
> > 	for (i =3D 0; quirks->kbd_timeouts[i] !=3D -1; i++) {
> >=20
> > Would have read beyond the end of the struct with
> > unpredictable results.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Thanks Dan,
>=20
> Pali, any objections?
>=20
> Dan, any objection to Pali rolling this into another revision?
> No point in introducing the bug to next and mainline.
>=20
> Thanks,

No problem from my side. This quirks code was done by Gabriele to=20
fix BIOS problems on some laptops.

Gabriele, any objections?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1450902.JuMhvZQjqJ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlSALI0ACgkQi/DJPQPkQ1Lw3QCfeLx3RfBmYMPgNkDhbT5MwF1O
4qwAnjkH7bhOi4GCZyMwC2Zr5LGz8KGc
=Hlvh
-----END PGP SIGNATURE-----

--nextPart1450902.JuMhvZQjqJ--
