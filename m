From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 2/3] dell-rbtn: Export notifier for other kernel modules
Date: Sat, 23 May 2015 03:05:50 +0200
Message-ID: <201505230305.50655@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <1431600868-11737-3-git-send-email-pali.rohar@gmail.com> <CAKdAkRRHZc3qk=gz7_KUwCNJup54gAjdmFn+V0=hQJ-bqkrWsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart6494080.Jv0g0R2ps8";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKdAkRRHZc3qk=gz7_KUwCNJup54gAjdmFn+V0=hQJ-bqkrWsA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

--nextPart6494080.Jv0g0R2ps8
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 23 May 2015 00:45:57 Dmitry Torokhov wrote:
> On Thu, May 14, 2015 at 3:54 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> wrote:
> > @@ -328,7 +408,9 @@ static void rbtn_notify(struct acpi_device
> > *device, u32 event)
> >=20
> >  static int __init rbtn_init(void)
> >  {
> >=20
> > -       return acpi_bus_register_driver(&rbtn_driver);
> > +       /* ignore errors so module always loads and exports needed
> > functions */ +       acpi_bus_register_driver(&rbtn_driver);
> > +       return 0;
>=20
> Ahem, and if it fails for some reason and you try to unload the
> module what will happen when you call
> acpi_bus_unregister_driver(&rbtn_driver) in rbtn_exit()?\
>=20
> Thanks.

I'm thinking about using symbol_request() in dell-laptop.c (instead hard=20
dependency) and then not ignoring error here... It could fix this=20
problem.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart6494080.Jv0g0R2ps8
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlVf0m4ACgkQi/DJPQPkQ1LgoQCeKJCJEQk1LDuevI/N/ceXUrrS
QW8AoJOtCDqvtUGPLunAZZ93L4ajv3df
=BC2h
-----END PGP SIGNATURE-----

--nextPart6494080.Jv0g0R2ps8--
