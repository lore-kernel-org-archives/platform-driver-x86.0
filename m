From: Karol Babioch <karol@babioch.de>
Subject: Re: sony_laptop: Default values for keyboard backlight
Date: Mon, 25 Nov 2013 13:09:33 +0100
Message-ID: <52933DFD.8060206@babioch.de>
References: <5289F067.40201@babioch.de> <20131118223008.GA4397@taihen.jp> <528E91A6.1070403@babioch.de> <20131122221156.GA8993@taihen.jp>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="4tVuwUUFffB5P8rQDkqunqm7A2PhkW70d"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from babioch.de ([176.9.120.167]:52545 "EHLO babioch.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754162Ab3KYMJo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Nov 2013 07:09:44 -0500
In-Reply-To: <20131122221156.GA8993@taihen.jp>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4tVuwUUFffB5P8rQDkqunqm7A2PhkW70d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Am 22.11.2013 23:11, schrieb Mattia Dongili:
Can you apply it and see if it makes a difference?

Yes, it seems to do the job just fine. Couldn't find any problems with
it so far. I'm using it without setting any parameters explicitly, and
it behaves just like beforehand (keyboard backlight on by default with a
10 second timeout).

So thanks for the fast turn around. I'm sorry that it took me so long to
actually test it. Hoping to see this being merged into the mainline kerne=
l.

Best regards,
Karol Babioch


--4tVuwUUFffB5P8rQDkqunqm7A2PhkW70d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSkz4DAAoJEHSaZc1HnzIVnMMP/iOAQrl9Kp+siulwwo2F7HN0
48Fq4lSpvddYbRs9N2LMGRUyAaK/jgdgwU67pzLQ0RmRB4YrchjLtWoDrJ7OmOXq
FVjZc+4ARAbnttHGb6T4IP4VcQzP8kmGW27NXzZPMixoDcQl7THz8Q9t0KNTvAMQ
aH21w5dNJM+bAO4xHbbR2EIAB4ltK8oKM+suvmgFkDL/1GBrEDpS9bKWGhf2b08B
rFxYtowLOxz9atb8QBDVZ15NmypRavO9BjOueykhAFGw+r2DpoJ/pW6cvKYaUF0Z
tx277BOxn9kHYUsE0oTuWKoHQtiP5unMiuMmg+8MhEUXxZzOeQpDzbqgJwIkh5jp
hjc/fpJlu914EDe94nPHB2A7VCBQkwO3YYPzTXXtIKhPw7kfZCyKaeAbwXrQuLRk
edLFVwdCvN8nSvUh3U82CA7sb2+CbK2P/oxS9xYsKAJSzLQMm+A/7Si9hS2JC127
5cQNbRYWRO3G8v0Q1FzxqonTSr5NrDhlJyM6qL3akQDUcKm2vt3Qz/UxEz3ODvJB
Hgo3CJOkGySZ244sAjhICcRXyFzk16yDNhLlV5UhwnYKxaM5d7F2BZeATIAPMxnt
Njxg1LZxwsdZ1DVTxho6NIz+aK+fMMx6UtlzmcZSaZcDSnBzMFVWA5M7rctdt0gR
B8BLhGSEW3lVTB1IdU35
=Cqds
-----END PGP SIGNATURE-----

--4tVuwUUFffB5P8rQDkqunqm7A2PhkW70d--
