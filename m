From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Subject: Re: asus-wmi.ko should be loaded before video.ko
Date: Wed, 08 Aug 2012 22:17:33 +0200
Message-ID: <5022C95D.6090200@igalia.com>
References: <CAMz9Wg9A=mmSVRh8HS4ezTqs=A8EmX_yiGSB8HbNSOxckG+4KQ@mail.gmail.com> <CAHR064i7xywTh1-=bfTOSLGZkWEV-WtNwp9adtCtq1YrkRmF0g@mail.gmail.com> <CAMz9Wg-nYAV-hT_kXQAuP6yZDqAPGzqs1rKZP19PCmE-mGuivg@mail.gmail.com> <CAHR064i0VUp5djWdoKLpk9H32w81ULwQFeM3hrzTsehF6ou20A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="------------enig6880CFC226F90F22DFA0B6A2"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp3.mundo-r.com ([212.51.32.191]:18094 "EHLO
	smtp4.mundo-r.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753822Ab2HHURm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Aug 2012 16:17:42 -0400
In-Reply-To: <CAHR064i0VUp5djWdoKLpk9H32w81ULwQFeM3hrzTsehF6ou20A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: AceLan Kao <acelan.kao@canonical.com>, platform-driver-x86@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig6880CFC226F90F22DFA0B6A2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/08/12 11:34, Corentin Chary wrote:
>> The problem is that the /sys/class/backlight/acpi_video0 directory sti=
ll exists
>> > and the gnome-settings-daemon will choose acpi_video0 for the
>> > brightness functions
> Are you sure acpi_video_unregister() was called in this case ? can you
> add some traces to video.c to see what happened and why
> backlight_device_unregister() wasn't called ?
>=20
>> > But, if asus-wmi is loaded before video, then video won't call
>> > backlight_device_register(),
>> > since the flag is already be set.
> Honestly, I don't know if there is a way to do that, and asus-wmi
> should be loadable and working at any time, not only on boot.

What about writing an udev rule to force using acpi_video0 for asus-wmi?

Use udevadm to get the attributes for building the rule

udevadm info --attribute-walk --path=3D/sys/class/backlight/acpi_video0


--------------enig6880CFC226F90F22DFA0B6A2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBCgAGBQJQIsldAAoJEJZQic5rlfiCduYQAKtYoeYxXrYIVHoAiwAVVGjj
W0ruBzOmht4c+mIm4oOZLNhKhSQUNHKQmprPm+Hbkz/Q+4sK3kFpgWxC6mIj1oIH
4HPf8K/dHdQVYyEQsYdxfi3hk8p+bgl7+XNEBjK5fktZhjCHy+WZn0+ZEIJ/uKG2
0mjOyZSP93ZfcMQqvV8DtaGem8n2GqIcR49VBhlReXa+2ZRuM+OIq6wczDnAXn8o
pQkh0ypq07T/vq409kKk2tzCrSDNKvxYHX0yas6YJB0C2Tji/prYZVUa9rOp+L4z
FEcdhJqrEd8fFGlUu0VubvqcICik5KYy6yLvCNXEHgFCyRwBs5fOltxSA1IvX7gM
vKcnKqpwdyvavNMXo4Z1XexlYDAWD4U5gnvUJx3zMDlensTZUlP9xhBK6gQqIGp+
sTNTyFT9oQjkExMDDXPNSaeQvCTBZgFLz66BAA0L2r99Ge3PyQBGDhvOGI2AEJrr
z7hniJwDWbkMQsVPn5ScV6CBUnct6Q0Y88sh2o4Zrm9+6L1E2qqNxmB+3X3coGM9
IZopcHcD2NjOpmWaetLblwO1McnR04OO0F2WPysP3ANzMSTVNZIkeTjbyWDTgPcE
ohICQPCpNPXTBLc93usXGaN2R6k8hkMrNNn7GqUY/t/a3DV4izlwJf3b5OhtynLr
QudELAAaxGmdn8XbHzgj
=aqlq
-----END PGP SIGNATURE-----

--------------enig6880CFC226F90F22DFA0B6A2--
