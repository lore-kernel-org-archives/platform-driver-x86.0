From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Sun, 6 Aug 2017 22:21:11 +0200
Message-ID: <201708062221.11938@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com> <201708061735.31002@pali> <CAHp75VdAhHNZvnE-T9rYbCihsDiiEKog57iVLORPS-t+hz0gCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart16698485.7RS9etNs2I";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f181.google.com ([209.85.128.181]:36917 "EHLO
        mail-wr0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751345AbdHFUVO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Aug 2017 16:21:14 -0400
In-Reply-To: <CAHp75VdAhHNZvnE-T9rYbCihsDiiEKog57iVLORPS-t+hz0gCA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, David Airlie <airlied@redhat.com>, Chun-Yi Lee <jlee@suse.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Oleksij Rempel <linux@rempel-privat.de>, =?utf-8?q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--nextPart16698485.7RS9etNs2I
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 06 August 2017 18:10:12 Andy Shevchenko wrote:
> On Sun, Aug 6, 2017 at 6:35 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> wrote:
> > On Wednesday 05 July 2017 22:24:20 Pali Roh=C3=A1r wrote:
> >> On Wednesday 05 July 2017 21:30:35 David Airlie wrote:
> >> > > On Saturday 17 June 2017 18:47:54 Pali Roh=C3=A1r wrote:
> >> > > > > So problematic drivers which use instance=3D1 without any
> >> > > > > comments
> >> > > > >=20
> >> > > > > are:
> >> > > > >   acer-wmi
> >> > > > >   asus-wmi
> >> > > > >   mxm-wmi
> >=20
> > Hi! For mxm-wmi I found this document:
> > https://lekensteyn.nl/files/docs/mxm-2.1-software-spec.pdf
> >=20
> > On page numbered 26 (resp. in PDF page 31) is information about WMI
> > GUID {F6CB5C3C-9CAE-4EBD-B577-931EA32A2CC0} interface and there is
> > written that instance count =3D 1.
> >=20
> > // Methods GUID {F6CB5C3C-9CAE-4ebd-B577-931EA32A2CC0}
> > 0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xbd, 0x4e, 0xB5, 0x77, 0x93,
> > 0x1E, 0xA3, 0x2A, 0x2C, 0xC0,
> > 0x4D, 0x58,    // Object ID =E2=80=9CMX=E2=80=9D =3D method =E2=80=9CWM=
MX=E2=80=9D
> > 1,             // Instance Count
> > 0x02,          // Flags (WMIACPI_REGFLAG_METHOD)
> >=20
> > And ACPI method for handling this WMI call does not check Arg0 and
> > Arg1 at all.
> >=20
> > So... Andy, Darren, any objections for following patch which
> > changes instance number from one to zero?
>=20
> No objections from me! Just put enough explanation into commit
> message.

Ok.

Now I found ACPI code for asus-wmi.c GUID=20
97845ED0-4E6D-11DE-8A39-0800200C9A66 on https://lwn.net/Articles/391249/=20
and there is also in _WDG buffer instance count just 1 and WMBC method=20
do not check Arg0.

So asus-wmi.c needs to be fixed too.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart16698485.7RS9etNs2I
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlmHejcACgkQi/DJPQPkQ1KcJwCdHfOGt31i0ZwXRfXT0IJdPw9X
mSkAn0LfI8QbYZVooFbvO+F7n5wpD4z9
=Opsu
-----END PGP SIGNATURE-----

--nextPart16698485.7RS9etNs2I--
