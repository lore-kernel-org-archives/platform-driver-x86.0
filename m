From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: Bug#649253: eeepc-wmi does not seem to adjust fan speed, but
 prevents use of fancontrol
Date: Mon, 03 Sep 2012 03:11:46 +0100
Message-ID: <1346638306.7787.73.camel@deadeye.wl.decadent.org.uk>
References: <201209021710.03222.hans.ullrich@loop.de>
	 <20120902195245.GA2187@mannheim-rule.local>
	 <201209022247.02111.hans.ullrich@loop.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Tp4dTkr6mhs1LAAzQLmk"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:41975 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755669Ab2ICCME (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 2 Sep 2012 22:12:04 -0400
In-Reply-To: <201209022247.02111.hans.ullrich@loop.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: "Hans-J. Ullrich" <hans.ullrich@loop.de>, Jonathan Nieder <jrnieder@gmail.com>, 649253@bugs.debian.org, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org


--=-Tp4dTkr6mhs1LAAzQLmk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-09-02 at 22:47 +0200, Hans-J. Ullrich wrote:
[...]
> Just to explain: eeepc-wmi will not be fixed, as the developers told me (=
almost=20
> 2 years ago). The problem of this, is that the old hardware specs of my E=
EEPC=20
> 1005 HGO are not made available by the vendor. So it is of course impossi=
ble,=20
> to write a kernel module.=20
>=20
> All newer hardware, which is in most newer processors will be supported, =
of=20
> course! But as I said, my EEEPC 1005 HGO with the old single core cpu (In=
tel=20
> N280), still got the old and undocumentd API. =20
>=20
> > What steps exactly do you use to work around the bug?  What do you
> > mean by "running the old kernel module"?  Are you using an older
> > kernel?
> >=20
>=20
> No, I can choose either to load eeepc-wmi or use the option "acpi_osi=3D"=
Linux"=20
> which let me load eeepc-laptop at startup. The second one I call the "old=
"=20
> module, as this is the old fancontroller module developed for my old cpu.
>=20
> If eeepc-laptop is used, then eeepc-wmi will not be loaded.
[...]

Corentin, I assume you understand what's going on with these different
drivers.  Shouldn't we add a dmi_enable_osi_linux quirk for the affected
models in drivers/acpi/blacklist.c?

Ben.

--=20
Ben Hutchings
In a hierarchy, every employee tends to rise to his level of incompetence.

--=-Tp4dTkr6mhs1LAAzQLmk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUEQR4ue/yOyVhhEJAQrzIhAAy6BnhEeQNXzwlyE0MBYqp6pnbg1whvY3
BZCcSpXSLL240ujRUUT72G4NiG+CaNF8GdP5028LBGzu6RGwDVC8NH2sphHNtvP9
zE9frmN/um/J1IJiLKwWNyjTIq6psGuRr/dUxCZ1OI36veRChPDHy6e2L9x/UqPu
Ty5Mc2eIBrDl0gvYrTOYYloVvz4L3rzPcc5mxvTsz4mVrMnAt7PhNez6tgIS+fD9
PwocARMFHJD8D0KFYq2KbxovuMsI+M8Jm8iO6geVzFPsAUbhVNoHz0gGBNKzjSFK
VdKg69y/M+VeBX4q3B+2O2wyXDzjMN0VBmULWLC7d8wpXeXXONLT/4V1V1UVcFTs
XNTSgE4j7bXwm12iOPsrvA2Zt2Gs1wpXWP/esx9l0tvPE1WEKW3SzauTd9XIFGyZ
1UOcuo/jRHvhhNJ9rw7AC58h83e9J6Uv7rCehIJ7T3ci5ytVIoBQiKXBCRXYmm4w
0B4Qr8pHRIuRQpyH/oYv3M/skGmLhPsN5NurZXb1bW/DHX5tCZsh9sKwa81C/w4D
KkWZio3nZWxGw2JB7KywAzg9f0IViH6Dy2QieNb+JRSaMj+gGg2lWGSebqpZ55LX
fq9S24GGbFEpcL23tRHZ1jmwX0XCSrWQtIipLFJYI1b1H153h4zb66GX2HcIyuTA
WtFl80xxiEU=
=zPOM
-----END PGP SIGNATURE-----

--=-Tp4dTkr6mhs1LAAzQLmk--
