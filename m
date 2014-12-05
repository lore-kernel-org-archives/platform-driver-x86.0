From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 0/3] Dell Airplane Mode Switch driver
Date: Fri, 5 Dec 2014 21:38:17 +0100
Message-ID: <201412052138.17092@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <201412041055.32689@pali> <20141203130023.GC75099@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart10130674.iXHPkGsaus";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:64207 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751168AbaLEUiU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Dec 2014 15:38:20 -0500
In-Reply-To: <20141203130023.GC75099@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

--nextPart10130674.iXHPkGsaus
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 03 December 2014 14:00:23 Darren Hart wrote:
> On Thu, Dec 04, 2014 at 10:55:32AM +0100, Pali Roh=C3=A1r wrote:
> > Darren, I think that if we do not solve problem with
> > duplicate key events (in dell-wireless.c) we should
> > postpone these patches to later kernel version. It is
> > better to not have such regression as it confuse software
> > like NetworkManager which is widely used.
>=20
> OK, that's what I needed. Thanks. Ignore my previous request,
> you answered it here. I will drop dell-wireless.c and look
> for a combined solution from you and Alex for the next
> release.
>=20
> Thanks,

And according to discussion about Side effect of pressing special
keys at [1] [2] we should not report this wireless key event (as
input device) to userspace. And Alex's driver is doing that.

[1] - http://www.spinics.net/lists/platform-driver-x86/msg05922.html
[2] - http://www.spinics.net/lists/platform-driver-x86/msg05924.html

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart10130674.iXHPkGsaus
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlSCF7kACgkQi/DJPQPkQ1LH8gCcDXKZgJoefRMF4tcP8jO/UuDE
Y0wAoJ5oQdJU7M4mrDFmC6L15HB0C1jJ
=bpxq
-----END PGP SIGNATURE-----

--nextPart10130674.iXHPkGsaus--
