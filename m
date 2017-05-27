From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Sat, 27 May 2017 22:48:13 +0200
Message-ID: <201705272248.13257@pali>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com> <201705271517.30111@pali> <CAHp75VfkudDRNTh9dR=y4G5HD+OaPoxjxVZgw6=9-YpOn4sJSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1979575.28rbZ1fWrW";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33911 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750743AbdE0UsQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 16:48:16 -0400
In-Reply-To: <CAHp75VfkudDRNTh9dR=y4G5HD+OaPoxjxVZgw6=9-YpOn4sJSA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--nextPart1979575.28rbZ1fWrW
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 27 May 2017 15:33:14 Andy Shevchenko wrote:
> On Sat, May 27, 2017 at 4:17 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> wrote:
> > On Saturday 27 May 2017 15:07:09 Andy Shevchenko wrote:
> >> On Sat, May 27, 2017 at 2:51 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> >>=20
> >> wrote:
> >> > Remove
> >> > also reserved member as it does not have any defined meaning or
> >> > type yet.
> >> >=20
> >> > -       pr_info("\treserved: %02X\n", g->reserved);
> >>=20
> >> Do we need this? Commit message doesn't clarify.
> >=20
> > I wrote to commit message that reserved does not have defined
> > meaning nor type. Also reserved overlap with object_id[1] so for
> > non-event should not be print at all. And as it is reserved, I
> > removed it.
>=20
> Oh, indeed.
>=20
> >> > +               pr_info("\tobject_id: %c%c\n", g->object_id[0],
> >> > g->object_id[1]);
> >>=20
> >> If this can still contain non-printable characters the %*pE can
> >> help instead.
> >=20
> > Those are printable ASCII. object_id contains two characters which
> > are suffix for ACPI method.
> >=20
> > Problem was only for events when we tried to print notify_id as
> > object_id. notify_id is binary and overlaps with object_id.
>=20
> Okay, got it. But on your opinion does it make sense to do
>=20
> pr_info("\tobject_id: %2pE\n", g->object_id);
>=20
> instead?
>=20
> For ASCII it will go as is previously, otherwise escaping would be
> done.

Both is OK for me. Do you want to send a new patch with %2pE?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1979575.28rbZ1fWrW
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlkp5g0ACgkQi/DJPQPkQ1JyEQCfWmTm6K1xSPVvrzCOM/AjcW+m
1ZEAnieq4dK///WcsD3Uv8jh+q07ZZ/J
=MKX7
-----END PGP SIGNATURE-----

--nextPart1979575.28rbZ1fWrW--
