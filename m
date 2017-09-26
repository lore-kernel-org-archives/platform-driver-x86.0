From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 14/14] platform/x86: dell-wmi-smbios: clean up wmi descriptor check
Date: Tue, 26 Sep 2017 22:11:56 +0200
Message-ID: <201709262211.57222@pali>
References: <cover.1506451187.git.mario.limonciello@dell.com> <4178d2bdfc69c94fe4972fee7b97b08202890e66.1506451187.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart14356241.LFkene8jV0";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4178d2bdfc69c94fe4972fee7b97b08202890e66.1506451187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com
List-Id: platform-driver-x86.vger.kernel.org

--nextPart14356241.LFkene8jV0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 26 September 2017 20:50:12 Mario Limonciello wrote:
> +	if (strncmp(obj->string.pointer, "DELL WMI", 8) !=3D 0)

Should not be this memcmp? IIRC we want to compare that buffer is equal=20
to some bytes, right?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart14356241.LFkene8jV0
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlnKtI0ACgkQi/DJPQPkQ1Ir2gCgoXxyQJCN+uDsCeHQzaZBh3Kk
uAQAoJTED+mNA2waVl34aQvkcJodZCxr
=11yG
-----END PGP SIGNATURE-----

--nextPart14356241.LFkene8jV0--
