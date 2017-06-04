From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Binary MOF buffer in WMI is finally decoded!
Date: Sun, 4 Jun 2017 18:09:21 +0200
Message-ID: <201706041809.21573@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart11521106.MStCUVhUt2";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Mario.Limonciello@dell.com, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart11521106.MStCUVhUt2
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi!

As already mentioned in RFC: WMI Enhancements thread [1], I looked at=20
binary MOF buffer used by WMI which is included in ACPI DSDT table.

That binary MOF buffer contains description of WMI methods and=20
structures used by ACPI-WMI. It also contains mapping from human=20
readable function names to ACPI-WMI magical numbers used for calling WMI=20
methods via ACPI.

Basically in that binary MOF buffer is description of structures used as=20
input and output arguments for WMI methods/function calls.

Until now, there were not information nor any parser of those binary MOF=20
files (.bmf file). There is some Microsoft proprietary tool which can=20
compile text MOF file to binary and vice versa.

I was able to decode that binary MOF format and wrote simple bmfparse=20
tool. It is available in git repository [2]. Currently parsing of=20
function parameters is not implemented yet.

Binary MOF format is compressed by prehistoric DS-01 algorithm=20
(modification of LZ-77) which was used as compression algorithm for=20
=46AT-16. Maybe you remember DMSDOS or DoubleSpace... After decompression,=
=20
the whole format is so shitty, probably half of data are just lengths of=20
sub structures and sub-sub-... structures.

I hope this bmfparse program would help in writing new wmi drivers for=20
Linux or inspection of available WMI methods.

Probably we could implement parser of BMOF in kernel and allow=20
validation of function parameters or usage of human readable names of=20
WMI methods?

[1] - https://www.spinics.net/lists/platform-driver-x86/msg11574.html
[2] - https://github.com/pali/bmfdec

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart11521106.MStCUVhUt2
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlk0MLEACgkQi/DJPQPkQ1Lt0QCfXM22n3+TpYYJy9slu/EJCeF9
hCsAn0MNrniu16+IxRdP0cT2tMtQWiLD
=Edjv
-----END PGP SIGNATURE-----

--nextPart11521106.MStCUVhUt2--
