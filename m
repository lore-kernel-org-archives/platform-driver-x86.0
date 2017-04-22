From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH] platform/x86: asus-wmi: try to set als by default
Date: Sat, 22 Apr 2017 08:55:02 +0200
Message-ID: <cf184d2b-7736-3342-3a17-21ca998b8e0e@rempel-privat.de>
References: <20170421152434.3834-1-linux@rempel-privat.de>
 <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FS52norBkWbEPLGB83M3N5jNtaHO0dnVu"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:59710 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1040743AbdDVGz4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 Apr 2017 02:55:56 -0400
In-Reply-To: <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FS52norBkWbEPLGB83M3N5jNtaHO0dnVu
Content-Type: multipart/mixed; boundary="kTA13IIcOIRs1WtUBQIJOWI30QWvNkGtG";
 protected-headers="v1"
From: Oleksij Rempel <linux@rempel-privat.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
 Platform Driver <platform-driver-x86@vger.kernel.org>
Message-ID: <cf184d2b-7736-3342-3a17-21ca998b8e0e@rempel-privat.de>
Subject: Re: [PATCH] platform/x86: asus-wmi: try to set als by default
References: <20170421152434.3834-1-linux@rempel-privat.de>
 <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>
In-Reply-To: <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>

--kTA13IIcOIRs1WtUBQIJOWI30QWvNkGtG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 21.04.2017 um 21:06 schrieb Andy Shevchenko:
> On Fri, Apr 21, 2017 at 6:24 PM, Oleksij Rempel <linux@rempel-privat.de=
> wrote:
>> some laptops, for example ASUS UX330UAK, have brocken als_get function=

>> but working als_set funktion. In this case, ALS will stay turned off.
>=20
> Please, spell check the above.
>=20
> some -> Some
> brocken -> broken
> funktion -> function
>=20
>>
>>              Method (WMNB, 3, Serialized)
>>             {
>>             ...
>>                If (Local0 =3D=3D 0x53545344)
>>                 {
>>                 ...
>>                     If (IIA0 =3D=3D 0x00050001)
>>                     {
>>                         If (!ALSP)
>>                         {
>>                             Return (0x02)
>>                         }
>>
>>                         Local0 =3D (GALS & 0x10)    <<<---- bug,
>>                                                     should be: (GALS (=
) & 0x10)
>=20
> How GALS is defined in ASL?
>=20
>> Since it works without problems on Windows I assume ASUS WMI driver fo=
r Win
>> never trying to get ALS state, and instead it is setting it by default=
 to ON.
>>
>> This patch will do the same. Turn ALS on by default.
>=20
> It would be good to see if there is no regression added.

I just send this email to ASUS support, may be some thing will happen:
https://pastebin.com/TLjbbNMc

--=20
Regards,
Oleksij


--kTA13IIcOIRs1WtUBQIJOWI30QWvNkGtG--

--FS52norBkWbEPLGB83M3N5jNtaHO0dnVu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlj6/kYACgkQHwImuRkmbWmzrQD/TlpKH24CCBS+BNfWV6Emmd+4
u38yFQ2WkEK/8uDGw+QA/RE04OqRhGLX2oMnI7/KHhscHIr/aGFC1TD1/X8bN7rL
=UG98
-----END PGP SIGNATURE-----

--FS52norBkWbEPLGB83M3N5jNtaHO0dnVu--
