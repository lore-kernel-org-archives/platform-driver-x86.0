From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 28 Dec 2015 15:48:14 +0100
Message-ID: <201512281548.14411@pali>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com> <20151227231417.GB8731@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart12101165.radMcZ7XEk";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151227231417.GB8731@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>
List-Id: platform-driver-x86.vger.kernel.org

--nextPart12101165.radMcZ7XEk
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 28 December 2015 00:14:17 Henrique de Moraes Holschuh wrote:
> On Thu, 24 Dec 2015, Pali Roh=C3=A1r wrote:
> > This patch adds support for controlling keyboard backlight via
> > standard linux led class interface (::kbd_backlight). It uses ACPI
> > HKEY device with MLCG and MLCS methods.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > Tested-by: Fabio D'Urso <fabiodurso@hotmail.it>
>=20
> It looks good at a first glance.  But at init you might need to take
> steps so that the current state is not changed.  Did you test this?

Tested. Modprobing driver does not change keyboard backlight level.

> Also, is it working properly across suspend+resume?

When doing resume from suspend or hibernate BIOS turning keyboard=20
backlight automatically off.

But driver at any time report correct backlight level from sysfs node.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart12101165.radMcZ7XEk
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaBS64ACgkQi/DJPQPkQ1LU9QCfVuqiOqBPwLqvYTpVG9LNcaiU
hJwAnRpW/QtLrBFKOtX+qtk0gPqZ/oBk
=okNf
-----END PGP SIGNATURE-----

--nextPart12101165.radMcZ7XEk--
