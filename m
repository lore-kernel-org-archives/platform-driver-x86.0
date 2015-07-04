From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Sat, 4 Jul 2015 21:47:24 +0200
Message-ID: <201507042147.24327@pali>
References: <20150701105544.GD17577@pali> <20150703140901.GN1841@pali> <201507042113.14902@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1471041.FXlvg3Fq4v";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:33116 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753267AbbGEJIs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jul 2015 05:08:48 -0400
Received: by wgck11 with SMTP id k11so117350292wgc.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Jul 2015 02:08:47 -0700 (PDT)
In-Reply-To: <201507042113.14902@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

--nextPart1471041.FXlvg3Fq4v
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

And I forgot to send these two events:

(calling ifconfig eth0 down)
[44634.098954] dell_wmi: Received WMI event (02 00 00 00 44 e0 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00)
[44634.098957] dell_wmi: Process buffer (02 00 00 00 44 e0)
[44634.098958] dell_wmi: NIC Link is Down

(calling ifconfig eth0 up)
[44639.722292] dell_wmi: Received WMI event (02 00 00 00 43 e0 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00)
[44639.722296] dell_wmi: Process buffer (02 00 00 00 43 e0)
[44639.722296] dell_wmi: NIC Link is Up

Important is that type of event is 0x00 like old hotkey event...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1471041.FXlvg3Fq4v
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWYOEwACgkQi/DJPQPkQ1Lr2gCfTzSXEYvNDt1+Z0DcjtLyIPbJ
s1EAn0ii2+0s43S1PuwDIdGQHfBdTYZ2
=AToM
-----END PGP SIGNATURE-----

--nextPart1471041.FXlvg3Fq4v--
