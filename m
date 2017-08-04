From: Harvey <harv@gmx.de>
Subject: Re: Kernel error messages: leds fujitsu::radio_led: Setting an LED's
 brightness failed
Date: Fri, 4 Aug 2017 10:55:05 +0200
Message-ID: <e8477251-1f12-43c2-3760-fdf8fb221b7a@gmx.de>
References: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
 <20170720064257.GA4942@larwa.localdomain>
 <bec5d8be-fa0b-be42-7af3-fa01fb071663@gmx.de>
 <20170804061352.GA7838@kmp-mobile.hq.kempniu.pl>
Reply-To: harv@gmx.de
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="pVOR5sRDCaXXRsr2Te1sonMB0e43IJeuH"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:63720 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751891AbdHDIzV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Aug 2017 04:55:21 -0400
In-Reply-To: <20170804061352.GA7838@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pVOR5sRDCaXXRsr2Te1sonMB0e43IJeuH
Content-Type: multipart/mixed; boundary="N1CUd2H11dhONhKrH2pC0HM2LacngK0WQ";
 protected-headers="v1"
From: Harvey <harv@gmx.de>
Reply-To: harv@gmx.de
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <e8477251-1f12-43c2-3760-fdf8fb221b7a@gmx.de>
Subject: Re: Kernel error messages: leds fujitsu::radio_led: Setting an LED's
 brightness failed
References: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
 <20170720064257.GA4942@larwa.localdomain>
 <bec5d8be-fa0b-be42-7af3-fa01fb071663@gmx.de>
 <20170804061352.GA7838@kmp-mobile.hq.kempniu.pl>
In-Reply-To: <20170804061352.GA7838@kmp-mobile.hq.kempniu.pl>

--N1CUd2H11dhONhKrH2pC0HM2LacngK0WQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi Micha=C5=82,

> Thank you for providing us with further information.

Again, glad to help where I can.

>> Pressing the E button brings up some kind of Energy saving applet and
>> pressing the I button brings up an applet telling me about the hardwar=
e
>> in my laptop and its current state.
>=20
> These hotkeys should already work fine under Linux

Yes, they do. I already redefined them as shortcuts to start some useful
programs.

> If I did not miss anything in your reports, there are two issues that
> require some work:
>=20
>   - Fixing radio LED detection.  I have an idea how to do this, but
>     please mind that I am quite busy lately and cannot guarantee any
>     specific time frame for submitting a patch.
>=20
>   - Investigating the E LED.  This requires taking a look at the DSDT
>     dump from your laptop and searching for clues as to how this LED is=

>     handled.  I will be happy to do that, but again, no promises about
>     how much time it will take.  (And given the nature of this task, I
>     cannot promise I will find anything reasonable at all.  I also migh=
t
>     ask you to do some further experiments as I do not have an E751
>     myself.)

Don't forget to take a look at the I LED... And concerning time. it is
ready when it's ready ;)

I will be happy to help and test anything that is required. Just send me
a note what needs to be done.

Greetings
Harvey

--=20
I am root. If you see me laughing, you'd better have a backup!


--N1CUd2H11dhONhKrH2pC0HM2LacngK0WQ--

--pVOR5sRDCaXXRsr2Te1sonMB0e43IJeuH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRSRNvmxYqoNs6vm0SLlqqYsFRKCQUCWYQ2aQAKCRCLlqqYsFRK
CWO8AKCEL71dHxV90tijEuqW6oeDeV/LWwCeIQNXt0Buss1+668AAc+xbBNTueA=
=7iP0
-----END PGP SIGNATURE-----

--pVOR5sRDCaXXRsr2Te1sonMB0e43IJeuH--
