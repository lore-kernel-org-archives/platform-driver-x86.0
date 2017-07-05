From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Wed, 5 Jul 2017 22:24:20 +0200
Message-ID: <201707052224.20656@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com> <20170705095113.GI2102@pali> <1588258750.25982542.1499283035221.JavaMail.zimbra@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1927206.HG2zidWJQi";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:34824 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752849AbdGEUYY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Jul 2017 16:24:24 -0400
In-Reply-To: <1588258750.25982542.1499283035221.JavaMail.zimbra@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Airlie <airlied@redhat.com>
Cc: Chun-Yi Lee <jlee@suse.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, Oleksij Rempel <linux@rempel-privat.de>, =?utf-8?q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart1927206.HG2zidWJQi
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 05 July 2017 21:30:35 David Airlie wrote:
> ----- Original Message -----
>=20
> > From: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> > To: "Chun-Yi Lee" <jlee@suse.com>, "Corentin Chary"
> > <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net,
> > "Dave Airlie" <airlied@redhat.com>, "Oleksij Rempel"
> > <linux@rempel-privat.de>, "Jo=C3=A3o Paulo Rechi Vita"
> > <jprvita@gmail.com>
> > Cc: "Darren Hart" <dvhart@infradead.org>, "Andy Shevchenko"
> > <andy@infradead.org>, "Andy Lutomirski" <luto@kernel.org>,
> > platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
> > Sent: Wednesday, 5 July, 2017 7:51:13 PM
> > Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method
> > instance number
> >=20
> > On Saturday 17 June 2017 18:47:54 Pali Roh=C3=A1r wrote:
> > > > So problematic drivers which use instance=3D1 without any comments
> > > > are:
> > > >   acer-wmi
> > > >   asus-wmi
> > > >   mxm-wmi
> > >=20
> > > Adding authors & maintainers of those drivers in loop.
> >=20
> > Hi!
> >=20
> > Dell drivers and acer-wmi are fixed now. So only asus-wmi and
> > mxm-wmi needs to be investigated.
> >=20
> > Adding more people who developed those drivers recently in loop.
> > Can you check if instance number is used correctly or not?
>=20
> I've no memory of why I picked 1 or 0, I probably cut-n-paste it from
> somewhere else.
>=20
> Dave.

And do you have at least ACPI DSDT dumps from that machine? Or are you=20
able to find some?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1927206.HG2zidWJQi
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlldSvQACgkQi/DJPQPkQ1K1+wCglR0zqmQfXNnbkzRvvVLicDyE
NaYAnj9rvFnUVdvjQIT3UmclXWNKbE3Y
=5wz6
-----END PGP SIGNATURE-----

--nextPart1927206.HG2zidWJQi--
