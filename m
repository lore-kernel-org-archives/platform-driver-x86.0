From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Thu, 8 Jun 2017 20:18:24 +0200
Message-ID: <201706082018.24251@pali>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com> <CAHp75VdRwuc5ZL-80=HBgUxHsuZ-MvMRBJxRQuTo8Bz9=RjxYA@mail.gmail.com> <CAHp75VcH__FDMfUWxDMfga3acBrUxKMqS9y+W6RLzAWsc6OmcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1999385.6sYS1qN7Vr";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33662 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751393AbdFHSS2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Jun 2017 14:18:28 -0400
In-Reply-To: <CAHp75VcH__FDMfUWxDMfga3acBrUxKMqS9y+W6RLzAWsc6OmcA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Joe Perches <joe@perches.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--nextPart1999385.6sYS1qN7Vr
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 08 June 2017 19:44:39 Andy Shevchenko wrote:
> On Thu, Jun 8, 2017 at 8:42 PM, Andy Shevchenko
>=20
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Jun 8, 2017 at 6:38 PM, Joe Perches <joe@perches.com> wrote:
> >> On Thu, 2017-06-08 at 08:16 -0700, Darren Hart wrote:
> >>> On Sat, May 27, 2017 at 11:49:22PM +0300, Andy Shevchenko wrote:
> >>> > On Sat, May 27, 2017 at 11:48 PM, Pali Roh=C3=A1r
> >>> > <pali.rohar@gmail.com> wrote:
> >>> > > On Saturday 27 May 2017 15:33:14 Andy Shevchenko wrote:
> >> Perhaps
> >>=20
> >>         pr_info("\t%*pE\n", (int)sizeof(g->object_id),
> >>         g->object_id);
> >=20
> > It will print some noisy characters as far as I understood the
> > initial intention.
>=20
> Ah, sorry, it will work, though sligtly differently. It will take
> extra argument from the stack which we can avoid. I don't expect the
> size of that growing. Pali?

ObjectID is always 2 bytes. And it should be printable ASCII (probably=20
only [A-Za-z0-9_]) as it is used as ACPI method name.

Size is not going to change.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1999385.6sYS1qN7Vr
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlk5lPAACgkQi/DJPQPkQ1L7dwCgvPVog/JilSOlsrraqYiRwTpF
YX0AoJ44mqeo04mFsDvtEtjZdV1Il1qA
=HLew
-----END PGP SIGNATURE-----

--nextPart1999385.6sYS1qN7Vr--
