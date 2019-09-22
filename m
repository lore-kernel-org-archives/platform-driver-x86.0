From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: fix phantom kbd backlight on
 Inspiron 10xx
Date: Sun, 22 Sep 2019 15:43:23 +0200
Message-ID: <20190922134323.mowwoyeuqoalpwsg@pali>
References: <156824368856.28378.14511879419677114177@WARFSTATION>
 <20190912073358.n5bxqosowhky5uhb@pali>
 <156882055514.9370.16951540573597044820@WARFSTATION>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hve2rdbpgwpt5hzd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <156882055514.9370.16951540573597044820@WARFSTATION>
Sender: linux-kernel-owner@vger.kernel.org
To: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mario.limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org


--hve2rdbpgwpt5hzd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wednesday 18 September 2019 17:29:15 Pacien TRAN-GIRARD wrote:
> Quoting Pali Roh=C3=A1r (2019-09-12 09:33:58)
> > On Thursday 12 September 2019 01:14:48 Pacien TRAN-GIRARD wrote:
> > > This patch registers a quirk disabling keyboard backlight support
> > > for the Dell Inspiron 1012 and 1018.
> > >=20
> > > Those models wrongly report supporting the KBD_LED_OFF_TOKEN and
> > > KBD_LED_ON_TOKEN SMBIOS tokens, exposing keyboard brightness controls
> > > through sysfs which freeze the system when used.
> > >=20
> > > The associated SMBIOS calls never return and cause the system to
> > > hang, notably at boot when systemd-backlight tries to restore
> > > previous brightness settings.
> >=20
> > Hi! This sounds like a firmware bug. Have you already reported it to De=
ll?
>=20
> Yes, the issue has been reported to Dell's technical support, which didn't
> provide a satisfying answer.

There were already some firmware problems with keyboard backlight and
Mario posted this comment about Linux support:
https://github.com/dell/libsmbios/issues/48#issuecomment-391328501

Can you try to use libsmbios tools and if they do not work too, report
problem also there?

> I'm not familiar with Dell's policy, but I doubt that they would issue a
> BIOS update for discontinued models from 2010.

We need to wait what Mario wrote about this particular problem.

> >=20
> > > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D107651
> > > Signed-off-by: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
> >=20
> > --=20
> > Pali Rohr
> > pali.rohar@gmail.com
>=20
> --
> Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--hve2rdbpgwpt5hzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXYd6eQAKCRCL8Mk9A+RD
UvCfAJ9OGlR6Lvdo/g0uHuS1xjs+xY+qYACdHJqEhlTHrOq7NT4TwVs7GLVSol4=
=6851
-----END PGP SIGNATURE-----

--hve2rdbpgwpt5hzd--
