From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/3] dell-laptop: Do not cache hwswitch state
Date: Mon, 6 Jul 2015 12:09:59 +0200
Message-ID: <201507061209.59967@pali>
References: <201507012004.45275@pali> <1435774101-12329-3-git-send-email-pali.rohar@gmail.com> <20150702004204.GC27795@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4098021.qMp6DbmvHW";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150702004204.GC27795@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

--nextPart4098021.qMp6DbmvHW
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 02 July 2015 02:42:04 Darren Hart wrote:
> On Wed, Jul 01, 2015 at 08:08:21PM +0200, Pali Roh=C3=A1r wrote:
> > It can be changed at runtime so make sure that dell-laptop knows
> > always current state. It can be modified by userspace utility
> > smbios-wireless-ctl.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>=20
> Couple of checkpatch warnings on this one.

=46ixed in patches.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart4098021.qMp6DbmvHW
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWaU/cACgkQi/DJPQPkQ1JDkwCgwBlz9JO+ATHOY1fe9ruup2ij
HRgAnRmupfNqw4Y5x1LhIyj8l6xLqyCe
=s5Vs
-----END PGP SIGNATURE-----

--nextPart4098021.qMp6DbmvHW--
