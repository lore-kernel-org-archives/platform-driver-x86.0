From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-laptop: use dedicated sysfs file for ALS
Date: Wed, 18 Feb 2015 20:09:28 +0100
Message-ID: <201502182009.28962@pali>
References: <1421244357-31103-1-git-send-email-gabriele.mzt@gmail.com> <201502101036.21896@pali> <6193126.UlCB3asGVW@xps13>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3775917.xFrLTfkfef";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6193126.UlCB3asGVW@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, A.Sloman@cs.bham.ac.uk, computersforpeace@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

--nextPart3775917.xFrLTfkfef
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 13 February 2015 15:30:42 Gabriele Mazzotta wrote:
> On Tuesday 10 February 2015 10:36:21 Pali Roh=C3=A1r wrote:
> > On Wednesday 14 January 2015 15:05:57 Gabriele Mazzotta=20
wrote:
> > > The ambient light sensor doesn't act like an input
> > > trigger, so it has to be kept separate. The sensor
> > > readings are used to determine whether the conditions to
> > > change the keyboard illumination are satisfied or not the
> > > moment an input trigger is used. Ambient light changes
> > > alone can't change the keyboard backlight illumination
> > > and don't restart the timer.
> > >=20
> > > Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> > > ---
> >=20
> > Gabriele, can you look and integrate this patch into full
> > keyboard backlight support? Ideally send new full one...
>=20
> I will do that soon.
>=20
> Darren, do you prefer one single patch or should I send Pali's
> patch and my changes in different patches (that can be later
> squashed) to make the review easier?

Gabriele, I think you should send patch now. Just integrate all=20
changes to one (this could be easy) and send it.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3775917.xFrLTfkfef
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlTk42gACgkQi/DJPQPkQ1K1KwCgySokswImeYlQcDECEcJtjzoz
aYIAoKtbH2yi90TPzeXm6NiRtbjijV4V
=vfNB
-----END PGP SIGNATURE-----

--nextPart3775917.xFrLTfkfef--
