From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: New dell-wireless driver
Date: Sat, 22 Nov 2014 23:45:08 +0100
Message-ID: <201411222345.08384@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2124252.JxHauzJ5KX";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:60296 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbaKVWpL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 22 Nov 2014 17:45:11 -0500
Received: by mail-wi0-f170.google.com with SMTP id bs8so5807572wib.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Nov 2014 14:45:10 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

--nextPart2124252.JxHauzJ5KX
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I saw dell-wireless driver on platform-driver-x86 mailinglist [1]=20
which using DELLABCE acpi device and I do not like some parts in=20
this driver.

=46irst is that this driver export rfkill event as keypress which=20
is also reported to userspace by keyboard controller. So then=20
userspace receive two rfkill keypresses.

Second is that DELLABCE acpi device can also control "soft"=20
rfkill status and this driver does not enable it because it use=20
input class instead rfkill.

Anyway I have unfinished my version of DELLABCE acpi driver which=20
will use rfkill interface and plus allow to use hw switch events=20
in dell-laptop.ko driver.

Currently dell-laptop.ko driver is using i8042 hook function for=20
detecting hw switch key press event. It is needed to detect if=20
rfkill state was changed or not.

My prepared patches for dell-laptop.ko allows to use acpi event=20
from DELLABCE driver, so i8042 hook function can be dropped.=20
Really it is not good idea to pass every PS/2 data from both=20
keyboard, touchpad and trackpoint to dell-laptop driver and if=20
there is alternative (DELLABCE) it is better to use it.

But now I would like to hear what do you think about it.

Because only one kernel driver can attach to DELLABCE acpi=20
device, I cannot use new dell-wireless driver. And I think only=20
one driver can hit mainline kernel.

[1] -=20
http://thread.gmane.org/gmane.linux.drivers.platform.x86.devel/6036

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2124252.JxHauzJ5KX
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlRxEfQACgkQi/DJPQPkQ1KzXACgmzwtDg+nvSkPcBxxnzuWy4Pt
iFAAnjXpoD5QYNiisomsUgUdZ/mq5tTh
=05uV
-----END PGP SIGNATURE-----

--nextPart2124252.JxHauzJ5KX--
