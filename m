From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: Re: How to read time stamp from HPET timer from device driver?
Date: Tue, 13 Jul 2010 11:03:10 -0300
Message-ID: <20100713140309.GF9114@barata.holoscopio.com>
References: <AANLkTimTF1tNxpfd86a9h6PDKDeFiq9zQcHCbKyfTm5M@mail.gmail.com>
 <AANLkTimRXZqDDcIsPEbgNdAEk3ZzEXzp2MXMcLgl1UnS@mail.gmail.com>
 <20100713130836.GD9114@barata.holoscopio.com>
 <AANLkTimILvk8XUGeoct6_DZKtAvjSSg9wmQwXRkt42_h@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y1L3PTX8QE8cb2T+"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:54167 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751449Ab0GMODP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Jul 2010 10:03:15 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimILvk8XUGeoct6_DZKtAvjSSg9wmQwXRkt42_h@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Samuel Xu <samuel.xu.tech@gmail.com>
Cc: platform-driver-x86@vger.kernel.org


--Y1L3PTX8QE8cb2T+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2010 at 09:34:50PM +0800, Samuel Xu wrote:
> Hi, Cascardo:
> Thanks for reply! I just want to get the guide on some sample code of
> HPET usage invoked from kernel mode driver.
> Any directly guide?
> Thanks!
>=20

You asked if this is the right API. And the answer depends on what do
you want to use it for.

Do you want to count CPU cycles for the purpose of performance analysis?
Take a look at perf!

Do you need to keep track of time to communicate with some
soft-real-time device (like audio devices)? Use hrtimers.

Do you want a piece of software that only works on PCs that have HPET
device available without any given reason? I can't help you more than
pointing you to Documentation/timers/hpet.txt, which does not point to
an API. So you are better off reading source code. hpet_readl is not
exported. Try 'grep EXPORT arch/x86/kernel/hpet.c'.

Regards,
Cascardo.

> 2010/7/13 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>:
> > On Tue, Jul 13, 2010 at 05:39:11PM +0800, Samuel Xu wrote:
> >> I tried hpet_readl() from my driver code, while hit compiling error.
> >> is it a correct API for kernel driver to invoke? any more hint?
> >>
> >
> > What are you trying to do exactly? Using TSC or HPET is not
> > platform-independent. You may take a look at hrtimers.
> >
> > Regards,
> > Cascardo.
> >
> >> 2010/7/13 Samuel Xu <samuel.xu.tech@gmail.com>:
> >> > HI:
> >> > I am a freshman for HPET timer. Previously, I use TSC counter, to use
> >> > rdtsc to get the time stamp. elapsed cycle can be counter from 2 time
> >> > stamps.
> >> > As a advanced replacement of TSC, I suppose HPET timer can be
> >> > conveniently to read time stamp from both kernel mode user =C2=A0and=
 user
> >> > mode apps.
> >> > While I failed to find a way to get time stamp value of HPET in Linux
> >> > kenerl (I am doing a driver and want to know elapsed cycle from driv=
er
> >> > code).
> >> >
> >> > Anyone can help me?
> >> >
> >> > Thanks!
> >> >
> >> > Samuel
> >> >
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe platform-dri=
ver-x86" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.html
> >
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.10 (GNU/Linux)
> >
> > iQIcBAEBAgAGBQJMPGVTAAoJEEWxSg7udFZIZHoQAKj0xOvvtE5pEZqau1OnFz1t
> > q15VC2q/OYQRRjAT5kRFEfWk7NcCaJmw4Y0TdrOjEW9YpYnZARksH2UwFA8myf9g
> > WOUpRe0o3HcuiutlxB321bI7mpJLHAaxpFwB8/10iXGjrH0LUQeOWkNo5smd9RQK
> > 1WfQ6BVEOqeyfY9ISnwzqhZQMu3AG0DbqnZQe6QtvE4Epg4L8ZeROL1piJqLGtlv
> > IGQ4fn+Pdu9+VXpmVl4Uzc/bLF1j2HTTKwwHO0KHTYZty40K8NnbCPJJp00KTfnN
> > TYVdEEgWzvIrJmB7hlrdl5gmjs9KYmOe3lpkRdotCzca9VNxFLvyi6ogkE/qiLpY
> > Au8wts22+qikxAkHdDfFdlnYAiiguGCJvku2usCtkEbTxsYWHKp/maP8xcNDE52H
> > HHwKmkKuYA/m+ML7kKmE7goDHjFvG0SZcm8Gjj4ghxbobhzQ6XGxzsGpJ9GwYz/E
> > JqAiqob3lD8TljWXPGN839pi0KHBivH71p9UoCC856G3GL4nXahsBSwMMg3KWj5i
> > avvQSCR838LK7qesKYak3xgjmLl9vRWVQwbx1vIlgjpOsBnmhUttUOKFy1eb4THz
> > EX080354M5mVfXsoiDVqUy3W5PwL1Yna9AaMVk+05lKg6OR/b0cMC6PFocGkgxRM
> > Okd0gXuUGv5IIy38UGSO
> > =3DBMoU
> > -----END PGP SIGNATURE-----
> >
> >

--Y1L3PTX8QE8cb2T+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJMPHIdAAoJEEWxSg7udFZIUXUQANACtBoPSFtW7d0Fa7d/rhwE
1md8qoLahMONHQwTdSzqZA+AFJxsNxoj92m8MXjbp+KBLKq+zjg+qc2t5/FKzzZl
nx28qccfFn+nOLcw04Bc/FddlYq/kldIAsNHC2XLHvBEQY5LjwgOcLVjZdWDg49b
B02tR4FPAHz/Zx8zD45j6esdbSAPNUWOEJtpue6ArlpAJ2dX4ZCxwD71FEuoPAXx
ouR9aCeOmQkOkRLN8btBfi/EydAFANZ8zCgl1RtLNv6vqedhQ6/8VMhvImIXkZlz
GiylPuRa52JDysJNi4wUSpBl6LoS/N4n6YO+uZh97jj4TStZHEMM/8AB3+SHPDoZ
8GM6ZXXckH6aoPgjyoig5XpfkxgBqM9FLtpRlhGEVs4Wjsye0+cad9DPhkyVsuW4
+VPUwXgC/vbeWYTIEtwQfByzkizAhouVUA/Yf5hH/ldWr2E1HZT7xcftDPMWqtAR
T1f3oJYWm6Zl4z9fj5NSpcKBOWll7SzAtN6f/fVC06sZHUu21jY7sUiDMmdViI2k
BSRAyTKk/HaQ24vBZDWvPz/4nVgdCbDCzcsxDt+GD7z1x/0U4cWe95GrjbpfDobm
k8RQQNXq36uhXy4KVg4vkdNFFVsgvYwBKufCeVi8+BLJRKi8N0VCcg2bp8LmIkiZ
S6uE9fH1Wl1EDCyY4XV4
=2sAn
-----END PGP SIGNATURE-----

--Y1L3PTX8QE8cb2T+--
