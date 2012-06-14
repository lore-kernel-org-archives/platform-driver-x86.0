From: Karol Babioch <karol@babioch.de>
Subject: Issues with the sony-platform module
Date: Thu, 14 Jun 2012 19:33:05 +0200
Message-ID: <4FDA2051.3050108@babioch.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigAC40336DF40550CEEFF40C3F"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from babioch.de ([176.9.120.167]:37034 "EHLO babioch.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751632Ab2FNRk7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Jun 2012 13:40:59 -0400
Received: from [10.25.11.201] (unknown [138.246.2.7])
	by babioch.de (Postfix) with ESMTPSA id 499304007C
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jun 2012 19:33:06 +0200 (CEST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigAC40336DF40550CEEFF40C3F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'm a user of the Sony VAIO VPCS12C5E and as such have always struggled
with the Linux support of my laptop basically forever. Until now I've
used the patch provided here [1], which worked quite well for some time.
However since kernel version 3.3 I couldn't change the brightness of my
screen anymore.

So I was quite glad to see that finally the patch was cleaned up and
included upstream. Unfortunately it doesn't fix the issue with the
brightness control, although the commit messages do say something about
various fixes to the ACPI handling.

When loading the module with the debug option enabled I get the
following message, which, I suppose, is related to the issue:

[ 2713.289135] sony_laptop: brightness ignored, must be controlled by
ACPI video driver

Probably I should add that I have a dedicated graphics card from Nvidia
(310 M) and not - as many others - the integrated GPU.

Maybe, someone can look into this. I'm glad to provide some logs and
test out patches, but other than that I can't do any good, I guess.

As already said the original patch from [1] worked fine with 3.1 (and
3.2 if I remember it rightly), so something within the kernel probably
changed and broke the support of my hardware.

So, I've uploaded a dmesg log when loading the module with the debug
option enabled and trying to change the brightness with the fn keys here
[2]. Maybe this is already enough to nail the issue down. Otherwise just
let me know what you would like to have.

Thanks in advance!

Best regards,
Karol Babioch

[1] https://code.google.com/p/vaio-f11-linux/wiki/KernelSupport
[2] http://pastebin.com/GRrtp024


--------------enigAC40336DF40550CEEFF40C3F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBAgAGBQJP2iBRAAoJEHSaZc1HnzIVApoQAK4Ybc2OJhQfKUcxrZ6GQx6K
MOgnbr+bcNXtjBuUMXtyqz4KpmuD7Dz8njXpDOHeDdqGjOhLtmEcjIjTQf8x0t5R
OyxtIAuEufg1cX2+cqJquaC3Q0C387ZUCB+yAQxw793DyEhm8BTzAanEL/bBxvyH
C4Kqs8072QCrMa6mXV9bGIyj2k7PKe1rL+eYl2FkjnTwlYEHp5V24wYbnIECQn70
WlSqfoagUcfeIItUFqDMGNPzARLmRDoBK1m72I45kaoLI5mjNML93BDEREhTHvy6
m8fDFnZ0x2VPAL4yT4mSbLpzDsJKPLZbs+LZGIMw1GaxCYjtH6B5Su7WkvwAPDpJ
jz4yDDmws2hrX5FXhCoatj1rwknoiG/EaETfMN+zZLF3m8F2X2J6picZHdmQINDe
sea2JF/T0xIygGrRhubOdRKRo4Lj5VT0x8mUja+bCKDgj8waeyMdsz9rjHX4ASIt
qh2xgPa2GlBUVjQV9SgG3akatvq+aIUelzNSLHpO09tpBn+TSMPqHvYELFbPgfnz
rK6Pw2Y5NHNUK5UEiBNh9ayMn6d1VAhL94OxqgMG5p3Kabyj5kXUPlLUvKLZZaAI
BqzHw8Dgzf5PKiwmwcDhNeps6TKWUyT1y/pzWVn7hu1kp8Jz1zpz3T/uqabZgYMY
/W0fjh01Z8AQ+yEevNpv
=j1s9
-----END PGP SIGNATURE-----

--------------enigAC40336DF40550CEEFF40C3F--
