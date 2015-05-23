From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: dell_rbtn - kernel panic at boot...
Date: Sat, 23 May 2015 22:08:38 +0200
Message-ID: <201505232208.38978@pali>
References: <5875.1432260403@turing-police.cc.vt.edu> <CAKdAkRQRdFBsgCmvL-aTKL=1xxPN-YYVEa0nTVkEV9jHMbzgYA@mail.gmail.com> <201505230305.36633@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4008862.2oGq7YGgdf";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:38544 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932279AbbEWUIm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 23 May 2015 16:08:42 -0400
In-Reply-To: <201505230305.36633@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, Darren Hart <dvhart@infradead.org>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

--nextPart4008862.2oGq7YGgdf
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 23 May 2015 03:05:36 Pali Roh=C3=A1r wrote:
> On Saturday 23 May 2015 00:53:16 Dmitry Torokhov wrote:
> > On Thu, May 21, 2015 at 7:06 PM, Valdis Kletnieks
> >=20
> > <Valdis.Kletnieks@vt.edu> wrote:
> > > So after I made both config variables =3Dy, the resulting kernel
> > > built, but died a glorious death at boot.
> >=20
> > I guess if both are built-in then, according to link order,
> > dell-laptop starts first, before dell-rbtn, and dies in
> > dell_rbtn_notifier_register() in call to
> > driver_for_each_device(&rbtn_driver.drv, ...) because rbtn_driver
> > has not been registered yet and thus half-initlalized.
> >=20
> > Thanks.
>=20
> pr_debug() messages could be useful... but no idea if we can get
> them.
>=20
> Is there any way to fix that dependency race condition? Could
> driver_attach() function call help?

Or what about using late_initcall() instead module_init() for driver=20
dell-laptop.ko? By default module_init() for static linked modules is=20
macro for device_initcall() which is called before late_initcall(),=20
right?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart4008862.2oGq7YGgdf
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlVg3kYACgkQi/DJPQPkQ1ItQwCffOriso9XMd3+AuZjvwb7V7k/
iZYAoKx1SLb357orsfCsuy9BocCKggv3
=YEn+
-----END PGP SIGNATURE-----

--nextPart4008862.2oGq7YGgdf--
