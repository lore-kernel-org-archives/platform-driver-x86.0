From: Karol Babioch <karol@babioch.de>
Subject: Re: sony_laptop: Default values for keyboard backlight
Date: Fri, 22 Nov 2013 00:05:10 +0100
Message-ID: <528E91A6.1070403@babioch.de>
References: <5289F067.40201@babioch.de> <20131118223008.GA4397@taihen.jp>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="fLni1AWxaV0VDk8IKB6qKUwA4rFH76gMv"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from babioch.de ([176.9.120.167]:52522 "EHLO babioch.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754973Ab3KUXFZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Nov 2013 18:05:25 -0500
In-Reply-To: <20131118223008.GA4397@taihen.jp>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Mattia Dongili <malattia@linux.it>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fLni1AWxaV0VDk8IKB6qKUwA4rFH76gMv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Am 18.11.2013 23:30, schrieb Mattia Dongili:
> I guess this is not the case on your
> machine. If you don't load sony-laptop module you still have the 10
> seconds timeout that you see in the BIOS? Only _after_ you load the
> module the backlight never goes off?

After playing around with this for a while I think that I narrowed the
issue down (or at least one aspect of it):

So when actually rebooting and/or powering up the device for the first
time, it works just fine by default without setting any module
parameters explicitly. The keyboard backlight is enabled and the timeout
is set to 10 seconds, which is the default.

But as soon as I suspend the machine it absolutely makes a difference
whether or not the module parameter is set. When it is not set
explicitly (sysfs interface reporting "-1") the keyboard backlight will
stay on from the moment I resume the machine and press a button. When
the module parameters are set explicitly it works just fine and as
expected.

Does this make any sense from your perspective? Maybe it's not the whole
story, but only one aspect of it. Is this something you can check and/or
verify?

> From the DSDTs I have hanging around these models may see the same
> behaviour as you're seeing:

Can't deny or confirm this, but this would be a reasonable guess.
Personally I'm using a Sony Vaio VPCS12C5E. I might provide you the
appropriate DSDT, if it can provide you any more insights.

> One approach could be to make the default setting handle based with
> again 0x137 being different from all others.

Not sure what the right approach would be. When there is absolutely no
way of reading the value before it was set at least once, then I don't
see much of an alternative, but to set it explicitly for these models
with an option to overwrite the default values using the appropriate
module parameters.

You'll definitely have more experience in this field, so it's your call.
Furthermore there are a lot of other models you have to keep in mind ;).

Let me know if you come up with something you might want to test ;).

Best regards,
Karol Babioch


--fLni1AWxaV0VDk8IKB6qKUwA4rFH76gMv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSjpGwAAoJEHSaZc1HnzIV1tcP/1ZPXxNIN7kke/iqeYoHkfDg
QZIMqipc5oxzZUakFSZM2RoFmsDTQwMEQksadCwY8TFE1QDmI3D7k6JgLgQVEsXs
86EkzuT6MAF8ycP01xohHy+HhlX/oBvqESidyhP0qmhRhi2QzvuGqJFQ18YPiGLl
Xg4NhNJnPmXlaOFKvgbNwLi3lNmktiUtszfhdZrBbGWMb4pPCNYRuTMMDZegXkZh
rJc9VSW34fLMecCDh0ZCFMjV2VQD0KSebjLw3dG3svgU0rl2hIrrBnKqP9RUZCJY
u6hgb60140poYG6n71PfAP1+iW5sdRKZv+bfXk10ItjWCXRBy2NTYZrQxrFXyQbF
lZK9QOMV7+xmlgsoUk6CQtGJ+H/UYSVv6UzhgZ4CG1krHtmm4bPCMNF4C9hfakvD
fknfFSvuErwCqK/pFk9S5wBKlWFqRifei+mHphapDDPQe9GXp3I/syEtFRYJSTeW
O+rLaUChb9EFOpw+OdSbOxhwPJux5CEBdHWXh4u8Wv65fokJPNtE/FXBLyTSvBXP
u9GKdU6FUTHM9hZgLYw77fcSfFhqILjEM6QNVIF+e+AA2tpE3P5GVTfaie9j4K6c
HelURAUbbd9umgx/RXh/HdEvOsWlQMrfnIf1M25fP/9Dgiq4Nd5YAVfRZl6wkuaO
W6kvRZVdijR62/SCGVK8
=qIp4
-----END PGP SIGNATURE-----

--fLni1AWxaV0VDk8IKB6qKUwA4rFH76gMv--
