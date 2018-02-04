From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: dell_wmi: Unknown key on Dell Latitude E6410
Date: Sun, 4 Feb 2018 13:04:49 +0100
Message-ID: <20180204120449.tyxpngr2bja7eg3a@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a4mt3wi3u73qwedt"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:37009 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeBDMEw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Feb 2018 07:04:52 -0500
Received: by mail-wm0-f44.google.com with SMTP id v71so20699946wmv.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 04 Feb 2018 04:04:52 -0800 (PST)
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org, Eric Light <eric@ericlight.com>


--a4mt3wi3u73qwedt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mario!

Eric Light wrote me that on his Dell Latitude E6410 laptop, dell_wmi
prints following messages into dmesg at every boot.

[   14.254258] dell_wmi: Unknown key with type 0x0011 and code 0xffd0 press=
ed
[   14.254259] dell_wmi: Unknown WMI event type 0x12
[   14.487922] dell_wmi: Unknown key with type 0x0011 and code 0xffd1 press=
ed
[   15.014983] dell_wmi: Unknown key with type 0x0011 and code 0x01e3 press=
ed

Seems that in dell_wmi we are completely missing processing of WMI
events which starts with 0x0012 and then there are some unknown codes
0xffd0 and 0xffd1.

Do you have access to documentation what are those code at all? And what
is hidden behind WMI events which starts with 0x0012?

Also Eric wrote me that pressing brightness up or down key generates
following events:

Brightness Up:

[ 1103.717988] dell_wmi: Unknown key with type 0x0011 and code 0xffae press=
ed
[ 1103.717990] dell_wmi: Unknown key with type 0x0011 and code 0xff81 press=
ed

Brightness Down:

[ 1157.078641] dell_wmi: Unknown key with type 0x0011 and code 0xffac press=
ed
[ 1157.078644] dell_wmi: Unknown key with type 0x0011 and code 0xff80 press=
ed

For me it looks suspicious because why pressing one key generates those
two 0x0011 events and why next one is generated after 2-3s...

I think the best way is to define all those events in dell_wmi to be
ignored (as I have not heard that brightness does not work), but it
would be a good idea to know we are going to ignore.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--a4mt3wi3u73qwedt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWnb24AAKCRCL8Mk9A+RD
UltZAJ9DmhElZQM1mshnVwvGjKASFj8DEACgten+i6uw+EQXfwMYK7xiu+xL7Kw=
=6hxZ
-----END PGP SIGNATURE-----

--a4mt3wi3u73qwedt--
