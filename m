From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Binary MOF buffer in WMI is finally decoded!
Date: Tue, 6 Jun 2017 00:08:49 +0200
Message-ID: <201706060008.49125@pali>
References: <201706041809.21573@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2625445.5iM7OJPIK4";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:35232 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751216AbdFEWIw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Jun 2017 18:08:52 -0400
In-Reply-To: <201706041809.21573@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mario.Limonciello@dell.com, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, andriy.shevchenko@linux.intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart2625445.5iM7OJPIK4
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 04 June 2017 18:09:21 Pali Roh=C3=A1r wrote:
> Hi!
>=20
> As already mentioned in RFC: WMI Enhancements thread [1], I looked at
> binary MOF buffer used by WMI which is included in ACPI DSDT table.
>=20
> That binary MOF buffer contains description of WMI methods and
> structures used by ACPI-WMI. It also contains mapping from human
> readable function names to ACPI-WMI magical numbers used for calling
> WMI methods via ACPI.
>=20
> Basically in that binary MOF buffer is description of structures used
> as input and output arguments for WMI methods/function calls.
>=20
> Until now, there were not information nor any parser of those binary
> MOF files (.bmf file). There is some Microsoft proprietary tool
> which can compile text MOF file to binary and vice versa.
>=20
> I was able to decode that binary MOF format and wrote simple bmfparse
> tool. It is available in git repository [2]. Currently parsing of
> function parameters is not implemented yet.
>=20
> Binary MOF format is compressed by prehistoric DS-01 algorithm
> (modification of LZ-77) which was used as compression algorithm for
> FAT-16. Maybe you remember DMSDOS or DoubleSpace... After
> decompression, the whole format is so shitty, probably half of data
> are just lengths of sub structures and sub-sub-... structures.
>=20
> I hope this bmfparse program would help in writing new wmi drivers
> for Linux or inspection of available WMI methods.
>=20
> Probably we could implement parser of BMOF in kernel and allow
> validation of function parameters or usage of human readable names of
> WMI methods?
>=20
> [1] - https://www.spinics.net/lists/platform-driver-x86/msg11574.html
> [2] - https://github.com/pali/bmfdec

Small update: function parameters are now decoded too. I fixed some=20
problems and added new tool bmf2mof which decompile BMF file back to=20
UTF-8 encoded plain text MOF file. It is in git repository:

https://github.com/pali/bmfdec

I run it on more binary WMI MOF buffers and it successfully parsed=20
everything.

So if you have some time, I would like you to ask for testing those=20
tools if they can parse binary WMI MOF buffers without problems.

As I wrote it by just looking at decompressed dumps without any=20
documentation, it does not have to be correct or working... Also there=20
are no proper checks for buffer overflows yet.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2625445.5iM7OJPIK4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlk11nEACgkQi/DJPQPkQ1IT8wCfTAfXlfAitAATNeS3Y6Z5xL+6
VEwAn1+GKiBNTxvI4bE1uZDrjhbYMu1+
=edLk
-----END PGP SIGNATURE-----

--nextPart2625445.5iM7OJPIK4--
