From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: randconfig build error with next-20150521, in drivers/platform/x86/dell-rbtn.c
Date: Thu, 21 May 2015 22:07:11 +0200
Message-ID: <201505212207.11872@pali>
References: <CA+r1Zhij2wUuLK6cdhr44NFW+okW4YuyFoo2_58mR6yncsXo3w@mail.gmail.com> <20150521195615.GF22037@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1765042.aR0VuzIsjg";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20150521195615.GF22037@vmdeb7>
Sender: linux-next-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart1765042.aR0VuzIsjg
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 21 May 2015 21:56:15 Darren Hart wrote:
> On Thu, May 21, 2015 at 10:36:15AM -0700, Jim Davis wrote:
> > Building with the attached random configuration file,
> >=20
> > drivers/built-in.o: In function `rbtn_remove':
> > dell-rbtn.c:(.text+0x31d7f4): undefined reference to
> > `input_unregister_device' drivers/built-in.o: In function
> > `rbtn_notify':
> > dell-rbtn.c:(.text+0x31d8e5): undefined reference to `input_event'
> > dell-rbtn.c:(.text+0x31d8f8): undefined reference to `input_event'
> > dell-rbtn.c:(.text+0x31d911): undefined reference to `input_event'
> > dell-rbtn.c:(.text+0x31d924): undefined reference to `input_event'
> > drivers/built-in.o: In function `rbtn_add':
> > dell-rbtn.c:(.text+0x31da11): undefined reference to
> > `input_allocate_device' dell-rbtn.c:(.text+0x31da4a): undefined
> > reference to `input_register_device' dell-rbtn.c:(.text+0x31da5e):
> > undefined reference to `input_free_device' Makefile:938: recipe
> > for target 'vmlinux' failed
>=20
> Thanks Jim,
>=20
> Pali, the DELL_RBTN needs to ensure if it it's built-in, that INPUT
> is too. ...
>=20
> > CONFIG_INPUT=3Dm
> > CONFIG_INPUT_FF_MEMLESS=3Dm
> > CONFIG_INPUT_POLLDEV=3Dm
> > CONFIG_INPUT_SPARSEKMAP=3Dm
> > CONFIG_INPUT_MATRIXKMAP=3Dm
>=20
> ...
>=20
> > CONFIG_DELL_RBTN=3Dy
>=20
> Please submit a fix as a new patch.

I believe that this patch is needed:

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 8c03223..d025fd8 100644
=2D-- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -141,6 +141,7 @@ config DELL_SMO8800
 config DELL_RBTN
 	tristate "Dell Airplane Mode Switch driver"
 	depends on ACPI
+	depends on INPUT
 	depends on RFKILL
 	---help---
 	  Say Y here if you want to support Dell Airplane Mode Switch ACPI

I did not tested it yet, but all other drivers depends on INPUT.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1765042.aR0VuzIsjg
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlVeOu8ACgkQi/DJPQPkQ1IKBQCgmX9LIIAIcZtM/jLtOKp0K4bx
E44AoLu6XDKXEAHxu2C1e/gU9h8z1yVu
=5Hto
-----END PGP SIGNATURE-----

--nextPart1765042.aR0VuzIsjg--
