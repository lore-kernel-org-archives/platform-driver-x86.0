From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 2/2] dell-wmi: Process only one event on devices with interface version 0
Date: Mon, 28 Dec 2015 14:49:10 +0100
Message-ID: <201512281449.10384@pali>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com> <1450991926-20937-3-git-send-email-pali.rohar@gmail.com> <20151228134056.GC7540@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2083147.sUJ7bDcOJm";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151228134056.GC7540@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart2083147.sUJ7bDcOJm
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 28 December 2015 14:40:56 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > BIOS/ACPI on devices with WMI interface version 0 does not clear
> > buffer before filling it. So next time when BIOS/ACPI send WMI
> > event which is smaller as previous then it contains garbage in
> > buffer from previous event.
> >=20
> > BIOS/ACPI on devices with WMI interface version 1 clears buffer and
> > sometimes send more events in buffer at one call.
>=20
> Are the explanations above based on your observations or perhaps some
> documentation?

Just observation from all DSDT files which I have seen.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2083147.sUJ7bDcOJm
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaBPdYACgkQi/DJPQPkQ1J65gCgsslKkyNEbkVpyPA7oXOZE0iU
WrwAnjFYTbHp1TQj80brbwcDGf47+vph
=PIyM
-----END PGP SIGNATURE-----

--nextPart2083147.sUJ7bDcOJm--
