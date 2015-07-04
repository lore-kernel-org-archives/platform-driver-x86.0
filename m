From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Sat, 4 Jul 2015 21:13:14 +0200
Message-ID: <201507042113.14902@pali>
References: <20150701105544.GD17577@pali> <20150703135047.GA3530@eudyptula.hq.kempniu.pl> <20150703140901.GN1841@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart25219968.Z9VGI2qMnv";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:35629 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755121AbbGELrk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jul 2015 07:47:40 -0400
Received: by wgjx7 with SMTP id x7so118756516wgj.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Jul 2015 04:47:39 -0700 (PDT)
In-Reply-To: <20150703140901.GN1841@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

--nextPart25219968.Z9VGI2qMnv
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 03 July 2015 16:09:01 Pali Roh=C3=A1r wrote:
> Then in your case, I would need to know format of *all* events which
> can your laptop via WMI receive. If we collect as more as possible
> events from different laptops we can try to abstract
> format/interface.

To have list of events "more" complete, here are dumps from my Latitude E64=
40:
(dell_new_hk_type is true)

(brightness up)
[41389.833588] dell_wmi: Received WMI event (02 00 10 00 48 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41389.833591] dell_wmi: Process buffer (02 00 10 00 48 00)
[41389.833592] dell_wmi: Key 48 pressed

(brightness down)
[41393.984812] dell_wmi: Received WMI event (02 00 10 00 50 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41393.984815] dell_wmi: Process buffer (02 00 10 00 50 00)
[41393.984816] dell_wmi: Key 50 pressed

(toggle keyboard backlight)
[41396.660972] dell_wmi: Received WMI event (02 00 10 00 4d 00 02 00 11 00 =
e1 01 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41396.660975] dell_wmi: Process buffer (02 00 10 00 4d 00)
[41396.660977] dell_wmi: Key 4d pressed
[41396.660977] dell_wmi: Process buffer (02 00 11 00 e1 01)
[41396.660978] dell_wmi: Keyboard backlight level changed

(toggle keyboard backlight again)
[41408.872213] dell_wmi: Received WMI event (02 00 10 00 4d 00 02 00 11 00 =
ea 02 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41408.872215] dell_wmi: Process buffer (02 00 10 00 4d 00)
[41408.872217] dell_wmi: Key 4d pressed
[41408.872218] dell_wmi: Process buffer (02 00 11 00 ea 02)
[41408.872218] dell_wmi: Keyboard backlight level changed

(again)
[41410.604351] dell_wmi: Received WMI event (02 00 10 00 4d 00 02 00 11 00 =
eb 02 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41410.604354] dell_wmi: Process buffer (02 00 10 00 4d 00)
[41410.604355] dell_wmi: Key 4d pressed
[41410.604356] dell_wmi: Process buffer (02 00 11 00 eb 02)
[41410.604357] dell_wmi: Keyboard backlight level changed

(and again)
[41411.313732] dell_wmi: Received WMI event (02 00 10 00 4d 00 02 00 11 00 =
ec 02 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41411.313735] dell_wmi: Process buffer (02 00 10 00 4d 00)
[41411.313736] dell_wmi: Key 4d pressed
[41411.313737] dell_wmi: Process buffer (02 00 11 00 ec 02)
[41411.313737] dell_wmi: Keyboard backlight level changed

(and again)
[41412.046983] dell_wmi: Received WMI event (02 00 10 00 4d 00 02 00 11 00 =
f6 02 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41412.046986] dell_wmi: Process buffer (02 00 10 00 4d 00)
[41412.046988] dell_wmi: Key 4d pressed
[41412.046989] dell_wmi: Process buffer (02 00 11 00 f6 02)
[41412.046989] dell_wmi: Keyboard backlight level changed

(Fn+Q)
[41471.644347] dell_wmi: Received WMI event (02 00 10 00 10 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41471.644350] dell_wmi: Process buffer (02 00 10 00 10 00)
[41471.644351] dell_wmi: Key 10 pressed

(Fn+W)
[41482.965057] dell_wmi: Received WMI event (02 00 10 00 11 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41482.965062] dell_wmi: Process buffer (02 00 10 00 11 00)
[41482.965064] dell_wmi: Key 11 pressed

(Fn+E)
[41485.619605] dell_wmi: Received WMI event (02 00 10 00 12 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41485.619608] dell_wmi: Process buffer (02 00 10 00 12 00)
[41485.619609] dell_wmi: Key 12 pressed

(Fn+R)
[41486.537823] dell_wmi: Received WMI event (02 00 10 00 13 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41486.537827] dell_wmi: Process buffer (02 00 10 00 13 00)
[41486.537828] dell_wmi: Key 13 pressed

(Fn+T)
[41487.090608] dell_wmi: Received WMI event (02 00 10 00 14 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41487.090610] dell_wmi: Process buffer (02 00 10 00 14 00)
[41487.090612] dell_wmi: Key 14 pressed

(Fn+A)
[41491.910608] dell_wmi: Received WMI event (02 00 10 00 1e 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41491.910611] dell_wmi: Process buffer (02 00 10 00 1e 00)
[41491.910613] dell_wmi: Key 1e pressed

(Fn+S)
[41492.645035] dell_wmi: Received WMI event (02 00 10 00 1f 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41492.645039] dell_wmi: Process buffer (02 00 10 00 1f 00)
[41492.645040] dell_wmi: Key 1f pressed

(Fn+D)
[41493.132750] dell_wmi: Received WMI event (02 00 10 00 20 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41493.132753] dell_wmi: Process buffer (02 00 10 00 20 00)
[41493.132755] dell_wmi: Key 20 pressed

(Fn+F)
[41493.624070] dell_wmi: Received WMI event (02 00 10 00 21 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41493.624073] dell_wmi: Process buffer (02 00 10 00 21 00)
[41493.624074] dell_wmi: Key 21 pressed

(Fn+G)
[41494.603007] dell_wmi: Received WMI event (02 00 10 00 22 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41494.603010] dell_wmi: Process buffer (02 00 10 00 22 00)
[41494.603011] dell_wmi: Key 22 pressed


(now pressed brightness down key more times, but very very quickly)
[41566.295409] dell_wmi: Received WMI event (03 00 10 00 50 00 50 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41566.295413] dell_wmi: Process buffer (03 00 10 00 50 00 50 00)
[41566.295415] dell_wmi: Key 50 pressed
[41566.295429] dell_wmi: Key 50 pressed

[41566.418593] dell_wmi: Received WMI event (02 00 10 00 50 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41566.418595] dell_wmi: Process buffer (02 00 10 00 50 00)
[41566.418597] dell_wmi: Key 50 pressed

[41566.448279] dell_wmi: Received WMI event (00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)

(so sometimes double key is received in one event! and sometimes empty even=
t is received)


(and now via /sys dell-laptop.ko I changed keyboard backlight, very very qu=
ickly all 5 levels)
[41602.300604] dell_wmi: Received WMI event (06 00 11 00 f6 02 ec 02 eb 02 =
ea 02 e1 01 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00)
[41602.300607] dell_wmi: Process buffer (06 00 11 00 f6 02 ec 02 eb 02 ea 0=
2 e1 01)
[41602.300608] dell_wmi: Keyboard backlight level changed
[41602.300608] dell_wmi: Keyboard backlight level changed
[41602.300609] dell_wmi: Keyboard backlight level changed
[41602.300609] dell_wmi: Keyboard backlight level changed
[41602.300610] dell_wmi: Keyboard backlight level changed

(and all five events were received in one WMI buffer)


So what is important: Dell BIOS send via one WMI buffer more events and als=
o with different types!

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart25219968.Z9VGI2qMnv
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWYMEoACgkQi/DJPQPkQ1LbWQCgvhomZGYmwNRd7rqiyJ61Ioze
GCIAn1S6l7st1qdxPvDG8I7sWVRUP0DE
=03D2
-----END PGP SIGNATURE-----

--nextPart25219968.Z9VGI2qMnv--
