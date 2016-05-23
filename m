From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: save kbdlight state on suspend and restore it on resume
Date: Tue, 24 May 2016 00:04:09 +0200
Message-ID: <201605240004.09829@pali>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net> <20160523215752.GC2735@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart7184665.TsNSIxR0Nx";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36444 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753087AbcEWWEM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2016 18:04:12 -0400
Received: by mail-wm0-f68.google.com with SMTP id q62so506486wmg.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 May 2016 15:04:12 -0700 (PDT)
In-Reply-To: <20160523215752.GC2735@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Marco Trevisan <mail@3v1n0.net>, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

--nextPart7184665.TsNSIxR0Nx
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 23 May 2016 23:57:52 Darren Hart wrote:
> On Thu, May 19, 2016 at 03:23:02AM +0200, Marco Trevisan wrote:
> > From: Marco Trevisan (Trevi=C3=B1o) <mail@3v1n0.net>
> >=20
> > Override default LED class suspend/resume handles, by keeping track
> > of the brightness level before suspending so that it can be
> > automatically restored on resume by calling default resume
> > handler.
> >=20
> > Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>=20
> The patch requires a Signed-off-by. I presume that should be from
> Marco?
>=20
> Henrique, is this Acked-by from you accurate? I need to see
> maintainers respond on list as they would likely object to me just
> taking other people's word for it in other scenarios ;-)

Darren, I'm not sure if this is really correct approach in current=20
patch... Anyway as Marco wrote, there is ACPI event when keyboard=20
backlight change and maybe we should handle it...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart7184665.TsNSIxR0Nx
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldDflkACgkQi/DJPQPkQ1K9BQCdEo+yBgq4wGkCeFxJToy0fkOW
Hv0AnRNsDe/sEP0+xR/w0Ul67/KkHxSl
=ZOyl
-----END PGP SIGNATURE-----

--nextPart7184665.TsNSIxR0Nx--
