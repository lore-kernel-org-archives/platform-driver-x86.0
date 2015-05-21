From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Compile errors with dell_rbtn_notifier_register
Date: Thu, 21 May 2015 22:59:28 +0200
Message-ID: <201505212259.29035@pali>
References: <56482.1432241617@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart12571220.l28V9Ja8Jf";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:35964 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755922AbbEUU7c (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 May 2015 16:59:32 -0400
In-Reply-To: <56482.1432241617@turing-police.cc.vt.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

--nextPart12571220.l28V9Ja8Jf
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 21 May 2015 22:53:37 Valdis Kletnieks wrote:
> commit 61104aa44529d59bd01a5d51df571ca2823a04b3
> Author: Pali Roh=C3=83=C2=A1r <pali.rohar@gmail.com>
> Date:   Thu May 14 12:54:27 2015 +0200
>=20
>     dell-laptop: Use dell-rbtn instead i8042 filter when possible
>=20
> causes build errors:
>=20
>   LD      init/built-in.o
> drivers/built-in.o: In function `dell_init':
> /usr/src/linux-next/drivers/platform/x86/dell-laptop.c:762: undefined
> reference to `dell_rbtn_notifier_register'
> /usr/src/linux-next/drivers/platform/x86/dell-laptop.c:2016:
> undefined reference to `dell_rbtn_notifier_unregister'
> drivers/built-in.o: In function `dell_exit':
> /usr/src/linux-next/drivers/platform/x86/dell-laptop.c:2041:
> undefined reference to `dell_rbtn_notifier_unregister'
>=20
> when built with:
>=20
> CONFIG_DELL_LAPTOP=3Dy
> CONFIG_DELL_RBTN=3Dm
>=20
> because the builtin then references a symbol that's in a module.
>=20
> Probably needs some Kconfig magic to ensure this case doesn't happen.

Darren, what do you prefer as fix? Some Kconfig magic (maybe depends?)?=20
or other magic in dell_rbtn.h to inline empty functions?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart12571220.l28V9Ja8Jf
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlVeRzEACgkQi/DJPQPkQ1LrogCfSy0Dq+K1SbOjzZnULOp0kZiI
wFEAn1GZWhGdKAipzGR9B7dkMkyNkg4/
=Noot
-----END PGP SIGNATURE-----

--nextPart12571220.l28V9Ja8Jf--
