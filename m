From: Matthew Thode <mthode@mthode.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: suppress warning about palm
 detection
Date: Sat, 13 Jan 2018 00:33:09 -0600
Message-ID: <20180113063309.iryfhufpilas3jnf@mthode.org>
References: <20180112110445.1876-1-dh.herrmann@gmail.com>
 <CAHp75Vc66ZfRmOoOKJRODpV0mS2aZru=b-r0cr8SKYH=hm+W6Q@mail.gmail.com>
 <CANq1E4RGo091oaG=0owKVfxOV8wR2qQ=nXfXzZsRxg6Q7_C8zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w53boewa63iyzsfo"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.mthode.org ([216.82.208.22]:36192 "EHLO mx1.mthode.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750777AbeAMGdL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 13 Jan 2018 01:33:11 -0500
Content-Disposition: inline
In-Reply-To: <CANq1E4RGo091oaG=0owKVfxOV8wR2qQ=nXfXzZsRxg6Q7_C8zw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--w53boewa63iyzsfo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 18-01-12 15:07:12, David Herrmann wrote:
> Hi Andy
>=20
> On Fri, Jan 12, 2018 at 2:50 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Jan 12, 2018 at 1:04 PM, David Herrmann <dh.herrmann@gmail.com>=
 wrote:
> >> Cc: Matthew Thode <mthode@mthode.org>
> >
> > Shouldn't be Suggested-by or even Signed-off-by?
>=20
> The patch is different (Matthew originally suppressed the ACPI event),
> so I did not copy the sign-off. Please add Suggested-by, if that is an
> acceptable tag.
>=20
> >> Signed-off-by: David Herrmann <dh.herrmann@gmail.com>
> >
> >
> >> +       case TP_HKEY_EV_PALM_DETECTED:
> >> +       case TP_HKEY_EV_PALM_UNDETECTED:
> >
> >> +               /* palm detected hovering the keyboard, forward to use=
r-space
> >> +                * via netlink for consumption */
> >
> > Comment style is
> > /*
> >  * Multi line comment.
> >  * This is an example.
> >  */
>=20
> All other 6 comments in this function follow the style I used here, so
> I tried to be consistent. But feel free to amend this change.
>=20

I'm fine with a signed-off-by or tested-by or suggested-by.  There is a
spelling mistake though, 'hoveres' should be hovers.

--=20
Matthew Thode

--w53boewa63iyzsfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEExFR3cOKGRpGbcMHPZKN76q4ZpOgFAlpZqCQACgkQZKN76q4Z
pOja2Q//UKubWEuGW96nrZN4zf6AqWMRLvDnRhN05kDRZ76hrg84E8tQukFst3wo
O+RrtKbKOonZ2HDHq6fnZZmy7RptBnETV+pkWJomI9trjd970ejZ5YTUk8fcXEI7
rexxSB/B1OGLsgwuaQCcUYUF9JL/55ydUsEZqZmKhKRTpgkPwFRpDaJpvX6aeKuM
97loHO1YLwcdg6RKol+wEPw4z8D4S1Cx+mm6Zwz0cWu12gnpd/+4jtbrQ1LyGR/Z
ykd9APNgDnt5CrJOEFLuwQfwXbBwLRLjcKzyFD0lbOeTLJdG+I3LZW8J2bdu0hl7
MV6Xp7ZZIrWHQiu4pOf4OQMFoXK3fshDL/ZX1S6xIBjEAvXY315+GVLxjFYmZQUL
Qq/r0RfLFBd16kfP2kHnZqifIsCikcgco8iZQVTXp7wi3JSHlPMl+1WP+Ego1FYN
dYQCWWC3nTuIsU6RPB6qKYUl0OhPg90p/vWJcn/exqPm1HgYV//6FCuX9IPrORzU
gzbpsuIBVXNQPsrTd+wHGnwb5uO8fRHj+fEJXY2YsEFAF+bj/ddcu7LUCro9z1jJ
UiVf44PJjpPhl2fBWPq+N7eY1nBWjUdlGS5b33xoMfSh1cGJAlgCLGuQxB+HDvxI
R4Vr1Z+SwG/Yu6DdxDtG/SuTKMs/ITgUPiK1FrnHOcYEFljPLYk=
=eTDs
-----END PGP SIGNATURE-----

--w53boewa63iyzsfo--
