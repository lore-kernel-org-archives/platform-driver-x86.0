From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/2] dell-wmi: Check if Dell WMI descriptor structure is valid
Date: Fri, 25 Dec 2015 14:02:41 +0100
Message-ID: <201512251402.42066@pali>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com> <1450991926-20937-2-git-send-email-pali.rohar@gmail.com> <CALCETrW0HmHiXmM23Y0XV1FBKaw9dcEwdrRWzwSJJhj89RkQYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart27911669.1Ux5pOvkZo";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38041 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753550AbbLYNCu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Dec 2015 08:02:50 -0500
In-Reply-To: <CALCETrW0HmHiXmM23Y0XV1FBKaw9dcEwdrRWzwSJJhj89RkQYQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--nextPart27911669.1Ux5pOvkZo
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 25 December 2015 02:23:04 Andy Lutomirski wrote:
> On Thu, Dec 24, 2015 at 1:18 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> wrote:
> > According to Dell WMI document mentioned in ML dicussion archived
> > at http://www.spinics.net/lists/platform-driver-x86/msg07220.html
> > OS should check Dell WMI descriptor structure. Structure also
> > provide Dell WMI interface version which is used later.
>=20
> I will rebase my big series on top of this.  It'll give me a good
> excuse to test that I got the probe ordering right.  (The code is
> explicitly intended to support use cases like this, and now I'll have
> a real-world test for it.)  I'll also test this in a bit.

Ok!

> > +MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);
>=20
> I don't think this is necessary.  The driver will only work if both
> wmi devices and, hence, modaliases are present, so there's no need to
> cause just one or the other to trigger dell-wmi autoloading.

Maybe now when you are working on big WMI patch series is time to change=20
modalias support in WMI to support AND-conjunction (&&) on WMI aliases,=20
not just OR (one alias match).

Something like: load dell-wmi.ko driver if system provides both WMI=20
GUIDs.

> > +/**
>=20
> > + * Descriptor buffer is 128 byte long and contains:
> This isn't kerneldoc format, so I think this should just be "/*".
>=20

Ok, I will fix this in next version.

> > +       if (obj->buffer.length !=3D 128) {
> > +               pr_err("Dell descriptor buffer has invalid length
> > (%d)\n", +                       obj->buffer.length);
> > +               kfree(obj);
> > +               return -EINVAL;
> > +       }
>=20
> I would advocate for being more permissive: a buffer that is actually
> too short for the fields we need would result in -EINVAL, but a
> buffer that isn't 128 bytes would just be a warning and not cause
> module load to fail.
>=20
> --Andy

Sounds good, I will change this part.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart27911669.1Ux5pOvkZo
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlZ9PnIACgkQi/DJPQPkQ1JIeACgq8prmCsdMWMP+DIBZWMof3lq
TH8An19Yd2U5us3gn3TjX2lTvz5YPxmK
=lTow
-----END PGP SIGNATURE-----

--nextPart27911669.1Ux5pOvkZo--
