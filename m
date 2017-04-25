From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH] platform/x86: asus-wmi: try to set als by default
Date: Tue, 25 Apr 2017 20:42:44 +0200
Message-ID: <c8e5d303-7a46-9ce3-c567-09bc43be5dc8@rempel-privat.de>
References: <20170421152434.3834-1-linux@rempel-privat.de>
 <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>
 <cf184d2b-7736-3342-3a17-21ca998b8e0e@rempel-privat.de>
 <CAHp75Vcnm3h9D5OPFeoKyCr2VJP4kK+kbueW8eNuSs2U7Ttqsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="L5em703mTQmbSGv4k5bB8wP4QjTQ4gtH8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:52909 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1428808AbdDYSn2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2017 14:43:28 -0400
In-Reply-To: <CAHp75Vcnm3h9D5OPFeoKyCr2VJP4kK+kbueW8eNuSs2U7Ttqsg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--L5em703mTQmbSGv4k5bB8wP4QjTQ4gtH8
Content-Type: multipart/mixed; boundary="laRB9KwvliNXxioj661vEuh4Cg6UHbXGp";
 protected-headers="v1"
From: Oleksij Rempel <linux@rempel-privat.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
 Platform Driver <platform-driver-x86@vger.kernel.org>
Message-ID: <c8e5d303-7a46-9ce3-c567-09bc43be5dc8@rempel-privat.de>
Subject: Re: [PATCH] platform/x86: asus-wmi: try to set als by default
References: <20170421152434.3834-1-linux@rempel-privat.de>
 <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>
 <cf184d2b-7736-3342-3a17-21ca998b8e0e@rempel-privat.de>
 <CAHp75Vcnm3h9D5OPFeoKyCr2VJP4kK+kbueW8eNuSs2U7Ttqsg@mail.gmail.com>
In-Reply-To: <CAHp75Vcnm3h9D5OPFeoKyCr2VJP4kK+kbueW8eNuSs2U7Ttqsg@mail.gmail.com>

--laRB9KwvliNXxioj661vEuh4Cg6UHbXGp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 25.04.2017 um 14:25 schrieb Andy Shevchenko:
> On Sat, Apr 22, 2017 at 9:55 AM, Oleksij Rempel <linux@rempel-privat.de=
> wrote:
>> Am 21.04.2017 um 21:06 schrieb Andy Shevchenko:
>>> On Fri, Apr 21, 2017 at 6:24 PM, Oleksij Rempel <linux@rempel-privat.=
de> wrote:
>>>> some laptops, for example ASUS UX330UAK, have brocken als_get functi=
on
>>>> but working als_set funktion. In this case, ALS will stay turned off=
=2E
>=20
>>>> This patch will do the same. Turn ALS on by default.
>>>
>>> It would be good to see if there is no regression added.
>>
>> I just send this email to ASUS support, may be some thing will happen:=

>> https://pastebin.com/TLjbbNMc
>=20
> Okay, let's wait a bit and if there no answer submit v2 based on review=
=2E

Oh well, the answer is like usual. We support Windows 10, make shit and
bla bla...

I'll send v2 ASAP.

--=20
Regards,
Oleksij


--laRB9KwvliNXxioj661vEuh4Cg6UHbXGp--

--L5em703mTQmbSGv4k5bB8wP4QjTQ4gtH8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlj/mKQACgkQHwImuRkmbWmgGwD7BjP4NlOU6Dh4dAA4VjRiEflI
3OqdHm1P0ZpLGu8giVcA/3y8dtEXB9x/3aaFfwx6qljqAfevcO4zngSrzmKYddRI
=9DNu
-----END PGP SIGNATURE-----

--L5em703mTQmbSGv4k5bB8wP4QjTQ4gtH8--
