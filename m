From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 2/8] platform/x86: dell-smbios: Introduce a WMI-ACPI interface
Date: Sat, 30 Sep 2017 09:15:40 +0200
Message-ID: <201709300915.40983@pali>
References: <cover.1506571187.git.mario.limonciello@dell.com> <7b632baafbfdc6c55c4d56225c54fd441b747286.1506571188.git.mario.limonciello@dell.com> <20170930005127.GA13307@fury>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2934565.cT2RLlZiou";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170930005127.GA13307@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com
List-Id: platform-driver-x86.vger.kernel.org

--nextPart2934565.cT2RLlZiou
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 30 September 2017 02:51:27 Darren Hart wrote:
> > +DELL SMBIOS DRIVER
> > +M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > +M:	Mario Limonciello <mario.limonciello@dell.com>
> > +S:	Maintained
> > +F:	drivers/platform/x86/dell-smbios.*
>=20
> Pali, do you agree with this?

Yes, no problem.

> > -static int __init dell_smbios_init(void)
> > +static int dell_smbios_wmi_probe(struct wmi_device *wdev)
> > +{
> > +	/* no longer need the SMI page */
> > +	free_page((unsigned long)buffer);
> > +
> > +	/* WMI buffer should be 32k */
> > +	buffer =3D (void *)__get_free_pages(GFP_KERNEL, 3);
>=20
> Assuming PAGE_SIZE here (I know, this driver, this architecture,
> etc...). But, please use get_order() to determine number of pages
> from a linear size:
>=20
> __get_free_pages(GFP_KERNEL, get_order(32768));

I agree that specifying size (instead of count) explicitly lead to more=20
readable code.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2934565.cT2RLlZiou
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlnPRJwACgkQi/DJPQPkQ1Lv4ACeKO5d2T83DzBSuFl3ZT2dnEDW
s8oAoLrBMMPShOuJ3MufZbcu3DKXUtmm
=VZt/
-----END PGP SIGNATURE-----

--nextPart2934565.cT2RLlZiou--
