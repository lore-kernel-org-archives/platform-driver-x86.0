From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
Date: Fri, 28 Nov 2014 12:45:55 +0100
Message-ID: <201411281245.55747@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <1416755361-17357-2-git-send-email-pali.rohar@gmail.com> <20141128113328.GS1304@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1837402.4QMuoY0e5H";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:62526 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929AbaK1Lp7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Nov 2014 06:45:59 -0500
In-Reply-To: <20141128113328.GS1304@lahna.fi.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>

--nextPart1837402.4QMuoY0e5H
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I will fix all those style problems and add some comments.

On Friday 28 November 2014 12:33:28 Mika Westerberg wrote:
> > +	if (ACPI_FAILURE(status))
> > +		return;
> > +
> > +	rfkill_set_states(rfkill, !output, !output);
>=20
> You can also write it like:
>=20
> 	if (ACPI_SUCCESS(status))
> 		rfkill_set_states(rfkill, !output, !output);
>=20
> which looks better to me at least.
>=20

In whole module I'm using this style:

f1();
if (f1_failed)
	return;
f2()
if (f2_failed)
	return;

So I would like not to change it for one function.

> > +}
> > +
> > +static int rbtn_set_block(void *data, bool blocked)
> > +{
> > +	/* FIXME: setting soft rfkill cause problems, so disable
> > it for now */ +	return -EINVAL;
> > +}
> > +
> > +struct rfkill_ops rbtn_ops =3D {
>=20
> static? const?
>=20

Yes, static const should be used.

>=20
> > +/*** module functions ***/
> > +
> > +static int __init rbtn_init(void)
> > +{
> > +	return acpi_bus_register_driver(&rbtn_driver);
> > +}
> > +
> > +static void __exit rbtn_exit(void)
> > +{
> > +	acpi_bus_unregister_driver(&rbtn_driver);
> > +}
> > +
> > +module_init(rbtn_init);
> > +module_exit(rbtn_exit);
>=20
> module_acpi_driver()?
>=20

No, see PATCH 2/3.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1837402.4QMuoY0e5H
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlR4YHMACgkQi/DJPQPkQ1KoEACgyIZ+DKorpfwC1n7I64p589Wm
tCAAoMmwNkCnGZEil9WvhbjxMpGJVzdw
=CI+a
-----END PGP SIGNATURE-----

--nextPart1837402.4QMuoY0e5H--
