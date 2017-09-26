From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 09/14] platform/x86: dell-smbios: rename to dell-wmi-smbios
Date: Tue, 26 Sep 2017 22:06:12 +0200
Message-ID: <201709262206.13177@pali>
References: <cover.1506451187.git.mario.limonciello@dell.com> <746fb34ff44824808e7892f81247436f80c7ab83.1506451187.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart6616299.MZ8qg6LDSB";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <746fb34ff44824808e7892f81247436f80c7ab83.1506451187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com
List-Id: platform-driver-x86.vger.kernel.org

--nextPart6616299.MZ8qg6LDSB
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 26 September 2017 20:50:07 Mario Limonciello wrote:
> This follows the style of the rest of the platform x86 WMI drivers.
>=20
> Renaming the driver requires adjusting the other drivers using
> dell-smbios to pick up the newly named includes.
>=20
> While renaming, I noticed that this driver was missing from
> MAINTAINERS. Add it to that and myself to the list of people
> maintaing it.
>=20
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Now when driver supports both old and new WMI call interface, I think=20
that renaming is not needed...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart6616299.MZ8qg6LDSB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlnKszUACgkQi/DJPQPkQ1JyDgCeKFQVr/YdivR+8VshOImX33eI
FPkAn2sHdWOG4A7Q49JLy59lW2/+recv
=TreL
-----END PGP SIGNATURE-----

--nextPart6616299.MZ8qg6LDSB--
