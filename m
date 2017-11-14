From: Benjamin Berg <bberg@redhat.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Accept flat mode for type
 4 multi mode status
Date: Tue, 14 Nov 2017 20:29:10 +0100
Message-ID: <1510687750.5746.35.camel@redhat.com>
References: <20171114161414.14297-1-bberg@redhat.com>
         <CAHp75VeQXSF0ZqE6dr1=Mm0n25OJsAJ5_6uT-nb7TLKgpbsWFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-8hUM0EGieaZsGGqEwkYd"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:30002 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751637AbdKNT3W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 14:29:22 -0500
In-Reply-To: <CAHp75VeQXSF0ZqE6dr1=Mm0n25OJsAJ5_6uT-nb7TLKgpbsWFg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Peter FP1 Zhang <zhangfp1@lenovo.com>, Lyude <lyude@redhat.com>


--=-8hUM0EGieaZsGGqEwkYd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-11-14 at 18:58 +0200, Andy Shevchenko wrote:
> On Tue, Nov 14, 2017 at 6:14 PM, Benjamin Berg <bberg@redhat.com>
> wrote:
> > On the X1 Yoga 2nd Generation and most likely other notebooks the
> > FLAT
> > mode is reported. Decode it correctly rather than warning about an
> > unexpected multi mode status to be reported.
>=20
> If we can't check on all available hardware, better to avoid "doing
> for all" fixes.
> I suppose DMI match can help here.

The documentation I saw suggests that the flat mode cannot be detected
by machines reporting a multi mode status of type 4. This is why the
original patch excluded the FLAT mode in the list of valid modes on
those devices.

I think it is safe to simply assume that all laptops reporting type 4
can actually detect the flat state. Doing so will not affect actual
state reporting on machines that may not be able to detect it. And I
don't think that the information whether the flat state can be detected
or not is interesting enough to bother with DMI matches.

Benjamin

> It would be nice to hear from Henrique and others as well.
>=20
>=20
> >         case 4:
> > -               valid_modes =3D TP_ACPI_MULTI_MODE_LAPTOP |
> > -                             TP_ACPI_MULTI_MODE_TABLET |
> > -                             TP_ACPI_MULTI_MODE_STAND |
> > -                             TP_ACPI_MULTI_MODE_TENT;
> > -               break;
>=20
> The common practice is to put
> /* fallthrough */
> instead.
>=20
> >         case 5:
> > +               /* In mode 4, FLAT is not specified as a valid
> > mode. However,
> > +                * it can be seen at least on the X1 Yoga 2nd
> > Generation.
> > +                */
>=20
> We don't use network subsystem style of comments.
>=20
> >                 valid_modes =3D TP_ACPI_MULTI_MODE_LAPTOP |
> >                               TP_ACPI_MULTI_MODE_FLAT |
> >                               TP_ACPI_MULTI_MODE_TABLET |
> >                               TP_ACPI_MULTI_MODE_STAND |
> >                               TP_ACPI_MULTI_MODE_TENT;
> >                 break;
>=20
>=20
--=-8hUM0EGieaZsGGqEwkYd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEgVSeanxpB7WrDIKT0SNopmGFbCAFAloLRAcACgkQ0SNopmGF
bCAHVQ//b6Bcpq142XASO1atZ3MBWlIhWsBX37wxeZyrQOL1Eke1S6jpVD/xsqKY
ffx717Yr0VX6FPRDsTWK7OffqdN/4xiQLqSVpfYLzcfSeFS/yXkF/nhJ8xCFwrdg
8N/uTfhTYmHyWhMyjBUdyJaS9NdfFOYxSXkcdwYeqFPjKMcoc1FsDX0+Vodc8VZQ
Y4cuFMLz/P0VlADRSHjHey4Z0GO40VdaVasIWbVm+aIMwGQWsk9R4lqCnYBwua+w
Jgc1VPhhBCiOd2y2Ut2vv6bP+Qc+z+DRKf3UBn/8NEFC79YsRpv8fqIbRaQI1dBQ
h5wa8RFDiygqHxR3yCmBRYdVaNLKv+eEqYZdE9WW5aPXGX14sQrVG/AWd6Rh7bvl
kw+tUHTneAfj9/yEsrcCGRKWZq6lAGNe0XWoJzee6dxq+oFEf6xin9jd7r+h848k
9qSC3ztpS/GbBUORESM6veTu2hU2mC6rAd+YqHxRoeI20WHZJ5gi4IJDAoyZTaeX
MWAOvO0zVu9MS+M1u/5l4+71efke4L1ymTek9p/0VEZQKstncFMbqEPNRaZC7fGG
v7GC9Ta5FXEpzQJhr44AZ/gnboaeow8DWGNS2kbglM4BGI4vNSxKHnkxxHAmulno
0jF4egq9rTTja3CYChHtJMUDSX9/lvYAyOYJ28dtUx2UMCemvi4=
=8Xh7
-----END PGP SIGNATURE-----

--=-8hUM0EGieaZsGGqEwkYd--
