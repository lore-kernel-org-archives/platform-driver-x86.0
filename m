From: Karol Babioch <karol@babioch.de>
Subject: sony_laptop: Default values for keyboard backlight
Date: Mon, 18 Nov 2013 11:48:07 +0100
Message-ID: <5289F067.40201@babioch.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="cEL8DwOEQEd3fdGKg57hN830ECBUe7KIl"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from babioch.de ([176.9.120.167]:52492 "EHLO babioch.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751221Ab3KRKzS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Nov 2013 05:55:18 -0500
Received: from vpcs.babioch (unknown [IPv6:2001:4ca0:0:f230:904f:dbb3:f8ce:3688])
	by babioch.de (Postfix) with ESMTPSA id E828640085
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2013 11:48:11 +0100 (CET)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cEL8DwOEQEd3fdGKg57hN830ECBUe7KIl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

the keyboard backlight has been working for me for the last couple of
years without any problems and I was fine with the default values, so I
wasn't too happy when I realized that a recent kernel upgrade has
changed this by leaving the backlight always on.

I've tracked down the "issue" to a specific commit (see [1]) from Mattia
itself, so I guess he had every reason to make this change. I've dealt
with the "problem" with a specific modprobe.d file.

I'm wondering whether this is the right approach, though. The default
behavior before even any "sony-laptop" module is loaded at all (e.g.
within the BIOS and/or the bootloader selection menu) is to enable the
keyboard backlight with a timeout of 10 seconds - at least on my machine.=


This has changed with the recent commit once the module is actually
loaded and the backlight is never turned off again. The sysfs interface
reports "-1" for both "kbd_backlight" and "kbd_backlight_timeout", which
in itself is fine according to the message describing the commit as the
values can't be known until having them set for the first time.

But to my understanding the commit shouldn't change the default behavior
for the keyboard backlight itself, as it actually doesn't touch the
registers involved. But as the behavior has actually changed, something
is definitely going on here, which might not necessarily be intentional.

So is this something that has been overlooked, or is my understanding of
the new behavior wrong?

Best regards,
Karol Babioch

[1]:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/dr=
ivers/platform/x86/sony-laptop.c?id=3D294d31e8227c9892a89d6b3e58d17886b79=
ea4e6


--cEL8DwOEQEd3fdGKg57hN830ECBUe7KIl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSifBrAAoJEHSaZc1HnzIVc/kP/2gk04ql4EBhCDNTzALHHEnF
agOoAchehjxx+e/RhQj4+y5iyvU9m7Hca9Psk5YVU3osbcnb9iM5TjpXhlSO257p
kcKF1l7efVizktjZOOPLl2CLztn9zsCKv4CWh0PXFQNJiSQFl+TDHZ67ZhLq8kyA
EnaaI/EWf94YXc1OfnEKHLg/YToM3qAnsrFqP3YXyvhwjfYaY1zUPdE7eBzNBbJ+
DY7k9PhUX97L2pT/PkWpSDtzOofTIqleGcpadfkoYpXkq92CuuRq7bAF4Cae/Wme
JmIx6BhJYdzzzNb2mjh1K/H4JjP9kF2Yv9GZWg9eItCDn11mRE/EiIOBmuGdzJdS
Cb0gMF6IDYTdtACUcRVVZb1M6bgjf2OMjAXt9julw/lIttoog1r3NayBHYskHeTQ
TpCVlTv2E1bFchGm5vSAQva2oIpVPQqbhN/sQsg4c/ihrYn+jpvpOoRgnCECw9ci
ud1q6iKZI0tSuUscuZeI1vXmZrgTLXy2Yx1XvvoaEl4bHsBqao1Xw2vKztQaAqma
qiYkSb3GE4oHcv7qw5rMKQwK64xDr346hq55tgHEREkvZF2YXkkEBa1pwsQpX7o7
a1eqJG3dnSLrUyEpbhNHfpPHOKgj8TPJ35tqHsNofg3zJXqzdq2xE8Bu0oGc2P4z
8w/GDAL922sV7Excxrny
=52fe
-----END PGP SIGNATURE-----

--cEL8DwOEQEd3fdGKg57hN830ECBUe7KIl--
