From: Harvey <harv@gmx.de>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Fix radio LED detection
Date: Tue, 31 Oct 2017 11:54:05 +0100
Message-ID: <683ac1cb-abf5-8d16-d016-8cbb4a75964e@gmx.de>
References: <20171025042946.13225-1-kernel@kempniu.pl>
 <CAHp75Vc50cjeYCp9dOfRxAaRJnjN2E5aMRA_iBHXz43=m9UUtw@mail.gmail.com>
 <20171029212806.GA8470@kmp-mobile.hq.kempniu.pl>
 <CAHp75VdJqWTgFhM8dcxkQzUfE7kEvTXQgaz04FVqgXayu8tLkg@mail.gmail.com>
 <20171030121257.GA28737@marvin.atrad.com.au>
 <20171031042002.GA9788@larwa.localdomain>
Reply-To: harv@gmx.de
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="C6JTbFfohe3L31CtWpnsS7Xc9WarLb7fA"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:58720 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751667AbdJaKyy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2017 06:54:54 -0400
In-Reply-To: <20171031042002.GA9788@larwa.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--C6JTbFfohe3L31CtWpnsS7Xc9WarLb7fA
Content-Type: multipart/mixed; boundary="724NW2eDbtlI0mWP18vro43wwPwdsWxXt";
 protected-headers="v1"
From: Harvey <harv@gmx.de>
Reply-To: harv@gmx.de
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
 Jonathan Woithe <jwoithe@just42.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <683ac1cb-abf5-8d16-d016-8cbb4a75964e@gmx.de>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Fix radio LED detection
References: <20171025042946.13225-1-kernel@kempniu.pl>
 <CAHp75Vc50cjeYCp9dOfRxAaRJnjN2E5aMRA_iBHXz43=m9UUtw@mail.gmail.com>
 <20171029212806.GA8470@kmp-mobile.hq.kempniu.pl>
 <CAHp75VdJqWTgFhM8dcxkQzUfE7kEvTXQgaz04FVqgXayu8tLkg@mail.gmail.com>
 <20171030121257.GA28737@marvin.atrad.com.au>
 <20171031042002.GA9788@larwa.localdomain>
In-Reply-To: <20171031042002.GA9788@larwa.localdomain>

--724NW2eDbtlI0mWP18vro43wwPwdsWxXt
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

> I agree as well.  The erroneous log messages will only be generated whe=
n
> any rfkill device in the system is enabled or disabled, so IMHO this is=

> mostly a nuisance thus can be handled when convenient.

FWIW: They are generated several times during every startup of the machin=
e:

sudo journalctl -b | grep radio_led
718:Okt 31 11:46:21 gruenix kernel: leds fujitsu::radio_led: Setting an
LED's brightness failed (-2147483648)
744:Okt 31 11:46:22 gruenix kernel: leds fujitsu::radio_led: Setting an
LED's brightness failed (-2147483648)
760:Okt 31 11:46:22 gruenix kernel: leds fujitsu::radio_led: Setting an
LED's brightness failed (-2147483648)
790:Okt 31 11:46:22 gruenix kernel: leds fujitsu::radio_led: Setting an
LED's brightness failed (-2147483648)
793:Okt 31 11:46:22 gruenix kernel: leds fujitsu::radio_led: Setting an
LED's brightness failed (-2147483648)
893:Okt 31 11:46:29 gruenix kernel: leds fujitsu::radio_led: Setting an
LED's brightness failed (-2147483648)

But, yes. This is only a cosmetic issue. There don't seem to be too many
people reportig this as well.

Greetings
Harvey

--=20
I am root. If you see me laughing, you'd better have a backup!


--724NW2eDbtlI0mWP18vro43wwPwdsWxXt--

--C6JTbFfohe3L31CtWpnsS7Xc9WarLb7fA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRSRNvmxYqoNs6vm0SLlqqYsFRKCQUCWfhWUwAKCRCLlqqYsFRK
CTsxAJ9RnKDvM0VETe1/TxhEVnFMSPITlwCeID6Xdz0OvMZ37P4e+7k4Z/V3R4U=
=NHJt
-----END PGP SIGNATURE-----

--C6JTbFfohe3L31CtWpnsS7Xc9WarLb7fA--
