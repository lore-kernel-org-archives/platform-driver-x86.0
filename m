From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface
 for touchpad state
Date: Mon, 01 May 2017 23:57:27 +0530
Message-ID: <1493663247.10973.1.camel@debian.org>
References: <20170217184756.15181-1-rrs@debian.org>
         <1487759058.9334.7.camel@debian.org>
         <CAHp75VcGYLSsnDgb_dzD0NVCK+aR6w7jZWfR+4nN-BfnAcdRWA@mail.gmail.com>
         <1493448775.9725.5.camel@debian.org>
         <CAHp75Vds7Vc3aJWpOO8uqo-y+PzUO+PNrhsjnHxGRs4WXt935A@mail.gmail.com>
         <20170501160543.GA29387@fury>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-EKQs4on9NoR8H6MIQrUu"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:33219 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751341AbdEAS1s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 May 2017 14:27:48 -0400
Received: by mail-pf0-f174.google.com with SMTP id q20so24083139pfg.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 May 2017 11:27:47 -0700 (PDT)
In-Reply-To: <20170501160543.GA29387@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--=-EKQs4on9NoR8H6MIQrUu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-05-01 at 09:05 -0700, Darren Hart wrote:
> > sysfs ABI for drivers that provide input interface is quite strong for
> > my opinion. It means I'm not totally objecting, but I would accept it
> > if and only if there is nothing else could be done.
>=20
> Agreed, we've recently wanted to remove certain sysfs attributes from ano=
ther
> driver as they were obsolete and better implemented in other ways, but on=
ce
> they
> are there, are hands are tied.
>=20
> That said, we will support getting these systems functional. From what I =
see
> in
> the patch you are implementing a polling sysfs interface. Have you verifi=
ed
> that
> there is no event we can capture and send the SW_TABLET_MODE along to the
> input
> system?

I believe it does generate an event (at least on my Yoga 2 13 variant). IIR=
C,
when I talked to Andy initially about the driver's limitation, we did do an
exercise [1] to determine if an event was generated.

Cooking this patch (sysfs interface) was much quicker and easy. I looked at=
 the
other example drivers, that do SW_TABLET_MODE, but left it there. I don't t=
hink
I have all the necessary information to get that done for the ideapad drive=
r.


[1] https://patchwork.kernel.org/patch/9546987/

--=20
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
--=-EKQs4on9NoR8H6MIQrUu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAlkHfg8ACgkQpjpYo/Lh
dWnWyw//Wm7L2KjYXqv+DsBGsSKbHf2YVpkwOrmf7jfjRGI+Vw8KfqLl/8HywYh8
2bdqi3gtI2Wmo1qPNhGuo3fKlXE0dH0qMmqn+5Wrs/ccQEUfhUQKZKpcfeC2LqwC
0kYNkoT5LOtSNoeAVfkEEWiD5Zz/L2z+IG5EdYInN8dG4ovRwFdBNOSqaVpWwDHY
z9xB1sMn4X+DhpUOrXhIzmJoggTx99cFr3aS1xyt+PYKGcbGjUhOdMU1duyVRKOG
p37btOVbKjTsShGfoBu4j/H9MaMKqWQMS413CTZUCnysAg6JXXn5YmTe2p7L2i1A
mMdSE5Ya6pvb0Hs4PZEIsE4GObvHC8/EhMkSZ1UQE2NkhniBKCguBpi4BImAialK
IWKoAON6sWuVNLk/HWPDKvLbSfVPE19eUscNGfstfnEQBpU0nFXEaL0jce73t8eu
ENbSlhzBAKhkEwUbYukTtxUpEo/yvZPyk5y5QtWiTxmIna1oC3rZ0zemtiUMmvJu
M7I3MN6JucBkAVX85WMfZ2iqpOvSczppBkmA5aBhuNGtTlQocVenR1eSgmBbF5S0
ADUAx3P7DN4E5Lq0R+u82Ig8dUronBUROxS9o1sXSKd5uW+WfdKu7tYVZNq+9z3j
zIgy/mJQVsx1dvA83VCA+JZwBAjJ6j+DONg+bqvpAttvudK2+wc=
=vkcZ
-----END PGP SIGNATURE-----

--=-EKQs4on9NoR8H6MIQrUu--
