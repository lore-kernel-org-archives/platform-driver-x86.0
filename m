From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] acer-wmi: Using zero as the first WMI instance number
Date: Tue, 20 Jun 2017 22:46:12 +0200
Message-ID: <201706202246.12941@pali>
References: <20170620090623.18364-1-jlee@suse.com> <20170620164851.GA32699@pali> <CAHp75Vd1ZRpZc3P5qnsiWTiURCUSOjsRfPKgShe3seJmsh1GRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3625433.iIrMdDToXn";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:35966 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751036AbdFTUqR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Jun 2017 16:46:17 -0400
In-Reply-To: <CAHp75Vd1ZRpZc3P5qnsiWTiURCUSOjsRfPKgShe3seJmsh1GRQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Lee, Chun-Yi" <jlee@suse.com>, Andy Shevchenko <andy@infradead.org>

--nextPart3625433.iIrMdDToXn
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 20 June 2017 19:22:46 Andy Shevchenko wrote:
> On Tue, Jun 20, 2017 at 7:48 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> wrote:
> > On Tuesday 20 June 2017 17:06:23 Lee, Chun-Yi wrote:
> >> Pali Roh=C3=A1r found that there have some wmi query/evaluation
> >> code that they used 'one' as the first WMI instance number.
> >> But the number is indexed from zero that it's must less than
> >> the instance_count in _WDG.
> >>=20
> >> This patch changes those instance number from one to zero.
> >>=20
> >> Cc: Darren Hart <dvhart@infradead.org>
> >> Cc: Andy Shevchenko <andy@infradead.org>
> >> Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> >> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> >=20
> > Looks good, Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>=20
> Unfortunately patchwork ignores this tag.
> So, in the future please:
> - put a tag on a separate line
> - do _not_ prepend it by any characters including white spaces
> (except new line :-) )

I have not known that those lines are parsed automatically.
Will do it in future!

> No need to resend this one.
>=20
> Pushed to testing, thanks!

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3625433.iIrMdDToXn
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAllJiZQACgkQi/DJPQPkQ1I/cwCdG8Ukpx+pQZz+2aIz82ZMgX6i
WdEAn2af+CX5sfgcfcDL5bFOxwszf5aq
=bTv3
-----END PGP SIGNATURE-----

--nextPart3625433.iIrMdDToXn--
