From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH]: dell-wmi: Found location of 'auto brightness' key in dmi table
Date: Wed, 18 Jan 2017 20:15:55 +0100
Message-ID: <201701182015.55214@pali>
References: <CAMFK4TN85t6ynbf3=hfTfjyxeyY5W-j0g42DxTrL0=STCJ31rw@mail.gmail.com> <201701181933.37320@pali> <CAMFK4TO=Nt56Ygs0gKWbj+JoEfx7gG=Ug_3Cid-g3Y5uSNtuzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3903306.trjb5J2qFU";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36025 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753403AbdARTRe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Jan 2017 14:17:34 -0500
Received: by mail-wm0-f68.google.com with SMTP id r126so6320069wmr.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jan 2017 11:16:03 -0800 (PST)
In-Reply-To: <CAMFK4TO=Nt56Ygs0gKWbj+JoEfx7gG=Ug_3Cid-g3Y5uSNtuzw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henk <henk.vergonet@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

--nextPart3903306.trjb5J2qFU
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 18 January 2017 20:06:11 Henk wrote:
> No need for user space application, this is handled by dell-wmi.c
> itself and the key is translated into a regular linux key-code like
> the keys for brightness up/down.
>=20
> For the latter these are already translated to:
> #define KEY_BRIGHTNESSDOWN      224
> #define KEY_BRIGHTNESSUP        225
>=20
> Now with this patch adds support for:
> #define KEY_BRIGHTNESS_AUTO 244
>=20
> See the enclosed picture for actual key

So... this key enable/disable automatic display brightness based on=20
integrated ALS sensors. From your description "Found location of 'auto=20
brightness'" I did not understand what exactly you mean... As I know=20
these Dell keyboards, picture helped me :-) I would suggest to describe=20
your change more preciously but patch is OK for me.

> 2017-01-18 19:33 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
> > On Wednesday 18 January 2017 19:27:00 you wrote:
> > > Tested on Dell Lattitude E6500.
> > >=20
> > > Signed-off-by: Henk Vergonet <henk.vergonet@gmail.com>
> > >=20
> > > diff --git a/drivers/platform/x86/dell-wmi.c
> > > b/drivers/platform/x86/dell-wmi.c
> > > index 75e6370..2949aee 100644
> > > --- a/drivers/platform/x86/dell-wmi.c
> > > +++ b/drivers/platform/x86/dell-wmi.c
> > > @@ -229,7 +229,7 @@ static const u16 bios_to_linux_keycode[256]
> > > __initconst =3D {
> > >=20
> > >      [18]    =3D KEY_PROG1,
> > >      [19]    =3D KEY_BRIGHTNESSDOWN,
> > >      [20]    =3D KEY_BRIGHTNESSUP,
> > >=20
> > > -    [21]    =3D KEY_UNKNOWN,
> > > +    [21]    =3D KEY_BRIGHTNESS_AUTO,
> > >=20
> > >      [22]    =3D KEY_KBDILLUMTOGGLE,
> > >      [23]    =3D KEY_UNKNOWN,
> > >      [24]    =3D KEY_SWITCHVIDEOMODE,
> >=20
> > Hi! Can you describe more details? Is that key handled by
> > notebook's firmware itself or do you need some userspace
> > application for handling?
> >=20
> > And what should that key suppose to do on your notebook?
> >=20
> > --
> > Pali Roh=C3=A1r
> > pali.rohar@gmail.com

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3903306.trjb5J2qFU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlh/vusACgkQi/DJPQPkQ1J/gwCferU4AXynBFyogRGIqhgRoURW
p8QAn0bqX5QAWyQyCaKNPD9J1Z8/cK+7
=8WN5
-----END PGP SIGNATURE-----

--nextPart3903306.trjb5J2qFU--
