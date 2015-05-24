From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 2/3] dell-rbtn: Export notifier for other kernel modules
Date: Sun, 24 May 2015 13:42:41 +0200
Message-ID: <201505241342.41351@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <201505230305.50655@pali> <220947.1432444056@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart16102842.LFHIuOhPXK";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <220947.1432444056@turing-police.cc.vt.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Valdis.Kletnieks@vt.edu
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

--nextPart16102842.LFHIuOhPXK
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 24 May 2015 07:07:36 Valdis.Kletnieks@vt.edu wrote:
> On Sat, 23 May 2015 03:05:50 +0200, Pali Roh=C3=A1r said:
> > I'm thinking about using symbol_request() in dell-laptop.c (instead
> > hard=3D20 dependency) and then not ignoring error here... It could
> > fix this=3D20 problem.
>=20
> That would also address the problem of a build
> that has DELL_LAPTOP=3D[ym] but DELL_RBTN=3Dn.

That is already handled. But DELL_LAPTOP=3Dy and DELL_RBTN=3Dm not. I will=
=20
send PATCH v4 with all fixed after somebody tell me what to do with=20
kernel panic at boot...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart16102842.LFHIuOhPXK
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlVhuTEACgkQi/DJPQPkQ1LvPQCgpTqozhADJ22dfSsEee/UWaVq
sNYAn3+ATFcuTbS39MPWM/CziDmyNOEC
=iBBu
-----END PGP SIGNATURE-----

--nextPart16102842.LFHIuOhPXK--
