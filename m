From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 4/4] platform/x86/dell-*: Call led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Sun, 19 Mar 2017 16:10:38 +0100
Message-ID: <201703191610.38557@pali>
References: <20170316105535.8885-1-hdegoede@redhat.com> <20170316105535.8885-4-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1747596.NDh4XfBSZ3";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:36867 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751513AbdCSPLY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Mar 2017 11:11:24 -0400
Received: by mail-wm0-f44.google.com with SMTP id n11so47349561wma.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Mar 2017 08:10:41 -0700 (PDT)
In-Reply-To: <20170316105535.8885-4-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

--nextPart1747596.NDh4XfBSZ3
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 16 March 2017 11:55:35 Hans de Goede wrote:
> Changes in v9:
> -Only listen to type 0x0010 kbd-led events in dell-wmi.c, these only
> trigger on hotkey presses
> -Drop the new / previous brightness comparison from dell-laptop.c now
> that we only get events on hotkey presses it is no longer necessary
> ---

Hi! I'm really not sure if this change is correct there.

Now you are only listening for keypress "change kbd backlight", but some=20
dell machines could change keyboard backlight also in other different=20
situations, like attaching AC adapter. I guess (but I'm not sure) this=20
probably does not send keypress event.=20

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1747596.NDh4XfBSZ3
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAljOn24ACgkQi/DJPQPkQ1I0bwCgki6/g/pElDIdWs2TBYG21kF8
yqsAnA3wLxinPrS8KvcM8A7DqIY1G5Lc
=Rpbf
-----END PGP SIGNATURE-----

--nextPart1747596.NDh4XfBSZ3--
