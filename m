From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH] platform/x86: asus-wmi: try to set als by default
Date: Sat, 22 Apr 2017 08:14:08 +0200
Message-ID: <1b6c4351-7052-2986-510d-dade3a88770f@rempel-privat.de>
References: <20170421152434.3834-1-linux@rempel-privat.de>
 <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="El8sDcgMkjxJB0Kopo15onOg7CcVWxrvW"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:63664 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932625AbdDVGPN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 Apr 2017 02:15:13 -0400
In-Reply-To: <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--El8sDcgMkjxJB0Kopo15onOg7CcVWxrvW
Content-Type: multipart/mixed; boundary="E4DGAsW0uRJF6pLwFoj50qPg2AcCEuemq";
 protected-headers="v1"
From: Oleksij Rempel <linux@rempel-privat.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
 Platform Driver <platform-driver-x86@vger.kernel.org>
Message-ID: <1b6c4351-7052-2986-510d-dade3a88770f@rempel-privat.de>
Subject: Re: [PATCH] platform/x86: asus-wmi: try to set als by default
References: <20170421152434.3834-1-linux@rempel-privat.de>
 <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>
In-Reply-To: <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>

--E4DGAsW0uRJF6pLwFoj50qPg2AcCEuemq
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

ok. thank you.

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

                    Method (GALS, 0, NotSerialized)
                    {
                        Local0 =3D Zero
                        Local0 |=3D 0x20
                        If (ALAE)
                        {
                            Local0 |=3D 0x10
                        }

                        Local1 =3D 0x0A
                        Local1 <<=3D 0x08
                        Local0 |=3D Local1
                        Return (Local0)
                    }


beside, same part of code on ASUS UX32A, which works just fine:

                    If ((IIA0 =3D=3D 0x00050001))
                    {
                        If (!ALSP)
                        {
                            Return (0x02)
                        }

                        Local0 =3D (GALS () & 0x10)
                        If (Local0)
                        {
                            Return (0x00050001)
                        }
                        Else
                        {
                            Return (0x00050000)
                        }
                    }

                    If ((IIA0 =3D=3D 0x00050013))
                    {
                        Local0 =3D (GALS () & 0x0F0F)
                        Return (Local0)
                    }

=2E...
            Method (GALS, 0, NotSerialized)
            {
                Local0 =3D (LBTN & 0x0F)
                Local0 |=3D 0x20
                If (ALAE)
                {
                    Local0 |=3D 0x10
                }

                Local1 =3D (0x0B - One)
                Local1 <<=3D 0x08
                Local0 |=3D Local1
                Return (Local0)
            }


>> Since it works without problems on Windows I assume ASUS WMI driver fo=
r Win
>> never trying to get ALS state, and instead it is setting it by default=
 to ON.
>>
>> This patch will do the same. Turn ALS on by default.
>=20
> It would be good to see if there is no regression added.

sure. Is there anything i can do for this, except continue to use this
patch with my HW?

--=20
Regards,
Oleksij


--E4DGAsW0uRJF6pLwFoj50qPg2AcCEuemq--

--El8sDcgMkjxJB0Kopo15onOg7CcVWxrvW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF4EAREIAAYFAlj69LUACgkQHwImuRkmbWlkpgD+P5jE78ThgOS2xCZjkNB4UgS8
WwE0MltLBISs6vjw8fkA/ROmwuiP50Z0EyXKlr2RytFDGpDEUTXp/DdWf9f6n/qG
=l4NY
-----END PGP SIGNATURE-----

--El8sDcgMkjxJB0Kopo15onOg7CcVWxrvW--
