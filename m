From: Harvey <harv@gmx.de>
Subject: Re: Kernel error messages: leds fujitsu::radio_led: Setting an LED's
 brightness failed
Date: Wed, 25 Oct 2017 15:17:56 +0200
Message-ID: <7af5f592-df89-fd9d-916c-2e7bf941cf1f@gmx.de>
References: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
 <20170720064257.GA4942@larwa.localdomain>
 <bec5d8be-fa0b-be42-7af3-fa01fb071663@gmx.de>
 <20170804061352.GA7838@kmp-mobile.hq.kempniu.pl>
 <e8477251-1f12-43c2-3760-fdf8fb221b7a@gmx.de>
 <20171025043957.GA13202@kmp-mobile.hq.kempniu.pl>
Reply-To: harv@gmx.de
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="f51w451WUfUTbOT0d3m5Oflq8U0iPT3UK"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171025043957.GA13202@kmp-mobile.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f51w451WUfUTbOT0d3m5Oflq8U0iPT3UK
Content-Type: multipart/mixed; boundary="ax4tMrldwA6Ae6DEx5iDP36rUhx26NIJU";
 protected-headers="v1"
From: Harvey <harv@gmx.de>
Reply-To: harv@gmx.de
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <7af5f592-df89-fd9d-916c-2e7bf941cf1f@gmx.de>
Subject: Re: Kernel error messages: leds fujitsu::radio_led: Setting an LED's
 brightness failed
References: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
 <20170720064257.GA4942@larwa.localdomain>
 <bec5d8be-fa0b-be42-7af3-fa01fb071663@gmx.de>
 <20170804061352.GA7838@kmp-mobile.hq.kempniu.pl>
 <e8477251-1f12-43c2-3760-fdf8fb221b7a@gmx.de>
 <20171025043957.GA13202@kmp-mobile.hq.kempniu.pl>
In-Reply-To: <20171025043957.GA13202@kmp-mobile.hq.kempniu.pl>

--ax4tMrldwA6Ae6DEx5iDP36rUhx26NIJU
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Am 25.10.2017 um 06:39 schrieb Micha=C5=82 K=C4=99pie=C5=84:
>>>   - Investigating the E LED.  This requires taking a look at the DSDT=

>>>     dump from your laptop and searching for clues as to how this LED =
is
>>>     handled.  I will be happy to do that, but again, no promises abou=
t
>>>     how much time it will take.  (And given the nature of this task, =
I
>>>     cannot promise I will find anything reasonable at all.  I also mi=
ght
>>>     ask you to do some further experiments as I do not have an E751
>>>     myself.)
>=20
> I feel stupid for only suggesting this now, but can this simply be the
> eco LED?  The DSDT dump from your laptop suggests so, as well as the
> description of the E LED in the manual.  Have you tried playing around
> with /sys/class/leds/fujitsu::eco_led?

No, I haven't.

I tried to set brightness to 255 and back to 0:

[root@gruenix ~]# echo 255 >/sys/class/leds/fujitsu::eco_led/brightness

=3D> eco LED lights up!

[root@gruenix ~]# cat /sys/class/leds/fujitsu::eco_led/brightness

=3D> eco LED off!

Tadaaa!

So yes, this is the eco LED of my E751.

>> Don't forget to take a look at the I LED...
>=20
> I could not find anything in the DSDT dump from your laptop that would
> suggest this LED can be controlled using ACPI.
>=20

Greetings
Harvey

--=20
I am root. If you see me laughing, you'd better have a backup!


--ax4tMrldwA6Ae6DEx5iDP36rUhx26NIJU--

--f51w451WUfUTbOT0d3m5Oflq8U0iPT3UK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRSRNvmxYqoNs6vm0SLlqqYsFRKCQUCWfCPBAAKCRCLlqqYsFRK
CYTuAJ0XiSBsoM7QD2cHGesZnBt0ApTqBACfXYRFInp3xi+MDxi/JllXOm7xb2o=
=RzC/
-----END PGP SIGNATURE-----

--f51w451WUfUTbOT0d3m5Oflq8U0iPT3UK--
