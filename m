From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add 2-in-1 devices to the DMI
 whitelist
Date: Fri, 26 Jan 2018 00:06:15 +0100
Message-ID: <20180125230615.akr2nvmmrqzfo53q@pali>
References: <20180125224857.3622-1-alexander.n.abrosimov@gmail.com>
 <20180125230239.GA3736@fury>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5cmxwnxf5bttqguu"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:43370 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751399AbeAYXGT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Jan 2018 18:06:19 -0500
Content-Disposition: inline
In-Reply-To: <20180125230239.GA3736@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org


--5cmxwnxf5bttqguu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thursday 25 January 2018 15:02:39 Darren Hart wrote:
> On Fri, Jan 26, 2018 at 01:48:57AM +0300, Alexander Abrosimov wrote:
> > SMBIOS 3.0.0 Specification introduced new Chassis Types field values for
> > 2-in-1 devices like tablets, convertibles and detachables. Dell's
> > Inspiron 2-in-1 and XPS 2-in-1 fall into this category and they have to
> > be added to the DMI whitelist, so rfkill and backlight can be controlled
> > for them as for other laptops.
> >=20
> > Signed-off-by: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>
>=20
> Thanks Alexander. Looks good - just going to give Pali and +Mario a chanc=
e to
> respond before merging...

I have no comments for this. This should be confirmed by Mario or
somebody else from Dell, which DMI names are used for a new products.

> > ---
> >  drivers/platform/x86/dell-laptop.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
> > index cd4725e7e0b5..23fc94d70ea1 100644
> > --- a/drivers/platform/x86/dell-laptop.c
> > +++ b/drivers/platform/x86/dell-laptop.c
> > @@ -110,6 +110,24 @@ static const struct dmi_system_id dell_device_tabl=
e[] __initconst =3D {
> >  		},
> >  	},
> >  	{
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_CHASSIS_TYPE, "30"), /*Tablet*/
> > +		},
> > +	},
> > +	{
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_CHASSIS_TYPE, "31"), /*Convertible*/
> > +		},
> > +	},
> > +	{
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_CHASSIS_TYPE, "32"), /*Detachable*/
> > +		},
> > +	},
> > +	{
> >  		.ident =3D "Dell Computer Corporation",
> >  		.matches =3D {
> >  			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
> > --=20
> > 2.13.6
> >=20
> >=20
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--5cmxwnxf5bttqguu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWmpi4wAKCRCL8Mk9A+RD
UvuiAJ9g0EvBqtNuNtDWbbIi3kbjJ1YjZgCgrMQgoHOavtOxDCG1iB7RIAclxDA=
=6FIC
-----END PGP SIGNATURE-----

--5cmxwnxf5bttqguu--
