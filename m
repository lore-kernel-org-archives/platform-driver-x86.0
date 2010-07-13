From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: Re: How to read time stamp from HPET timer from device driver?
Date: Tue, 13 Jul 2010 10:08:36 -0300
Message-ID: <20100713130836.GD9114@barata.holoscopio.com>
References: <AANLkTimTF1tNxpfd86a9h6PDKDeFiq9zQcHCbKyfTm5M@mail.gmail.com>
 <AANLkTimRXZqDDcIsPEbgNdAEk3ZzEXzp2MXMcLgl1UnS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:35310 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752620Ab0GMNIl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Jul 2010 09:08:41 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimRXZqDDcIsPEbgNdAEk3ZzEXzp2MXMcLgl1UnS@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Samuel Xu <samuel.xu.tech@gmail.com>
Cc: platform-driver-x86@vger.kernel.org


--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2010 at 05:39:11PM +0800, Samuel Xu wrote:
> I tried hpet_readl() from my driver code, while hit compiling error.
> is it a correct API for kernel driver to invoke? any more hint?
>=20

What are you trying to do exactly? Using TSC or HPET is not
platform-independent. You may take a look at hrtimers.

Regards,
Cascardo.

> 2010/7/13 Samuel Xu <samuel.xu.tech@gmail.com>:
> > HI:
> > I am a freshman for HPET timer. Previously, I use TSC counter, to use
> > rdtsc to get the time stamp. elapsed cycle can be counter from 2 time
> > stamps.
> > As a advanced replacement of TSC, I suppose HPET timer can be
> > conveniently to read time stamp from both kernel mode user =C2=A0and us=
er
> > mode apps.
> > While I failed to find a way to get time stamp value of HPET in Linux
> > kenerl (I am doing a driver and want to know elapsed cycle from driver
> > code).
> >
> > Anyone can help me?
> >
> > Thanks!
> >
> > Samuel
> >
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver=
-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJMPGVTAAoJEEWxSg7udFZIZHoQAKj0xOvvtE5pEZqau1OnFz1t
q15VC2q/OYQRRjAT5kRFEfWk7NcCaJmw4Y0TdrOjEW9YpYnZARksH2UwFA8myf9g
WOUpRe0o3HcuiutlxB321bI7mpJLHAaxpFwB8/10iXGjrH0LUQeOWkNo5smd9RQK
1WfQ6BVEOqeyfY9ISnwzqhZQMu3AG0DbqnZQe6QtvE4Epg4L8ZeROL1piJqLGtlv
IGQ4fn+Pdu9+VXpmVl4Uzc/bLF1j2HTTKwwHO0KHTYZty40K8NnbCPJJp00KTfnN
TYVdEEgWzvIrJmB7hlrdl5gmjs9KYmOe3lpkRdotCzca9VNxFLvyi6ogkE/qiLpY
Au8wts22+qikxAkHdDfFdlnYAiiguGCJvku2usCtkEbTxsYWHKp/maP8xcNDE52H
HHwKmkKuYA/m+ML7kKmE7goDHjFvG0SZcm8Gjj4ghxbobhzQ6XGxzsGpJ9GwYz/E
JqAiqob3lD8TljWXPGN839pi0KHBivH71p9UoCC856G3GL4nXahsBSwMMg3KWj5i
avvQSCR838LK7qesKYak3xgjmLl9vRWVQwbx1vIlgjpOsBnmhUttUOKFy1eb4THz
EX080354M5mVfXsoiDVqUy3W5PwL1Yna9AaMVk+05lKg6OR/b0cMC6PFocGkgxRM
Okd0gXuUGv5IIy38UGSO
=BMoU
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--
