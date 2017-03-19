From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 4/4] platform/x86/dell-*: Call led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Sun, 19 Mar 2017 19:11:43 +0100
Message-ID: <201703191911.43694@pali>
References: <20170316105535.8885-1-hdegoede@redhat.com> <201703191610.38557@pali> <16957a6a-be85-8771-2000-978c4bc88270@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5057685.FUl8IqzCVV";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36397 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751643AbdCSSno (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Mar 2017 14:43:44 -0400
Received: by mail-wm0-f67.google.com with SMTP id x124so11070243wmf.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Mar 2017 11:43:42 -0700 (PDT)
In-Reply-To: <16957a6a-be85-8771-2000-978c4bc88270@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

--nextPart5057685.FUl8IqzCVV
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 19 March 2017 19:06:19 Hans de Goede wrote:
> Hi,
>=20
> On 19-03-17 16:10, Pali Roh=C3=A1r wrote:
> > On Thursday 16 March 2017 11:55:35 Hans de Goede wrote:
> >> Changes in v9:
> >> -Only listen to type 0x0010 kbd-led events in dell-wmi.c, these
> >> only trigger on hotkey presses
> >> -Drop the new / previous brightness comparison from dell-laptop.c
> >> now that we only get events on hotkey presses it is no longer
> >> necessary ---
> >=20
> > Hi! I'm really not sure if this change is correct there.
> >=20
> > Now you are only listening for keypress "change kbd backlight", but
> > some dell machines could change keyboard backlight also in other
> > different situations, like attaching AC adapter. I guess (but I'm
> > not sure) this probably does not send keypress event.
>=20
> I'm not aware of any Dells doing such a thing, if we encounter any
> then we can deal with that if and when that happens.

Ok, go ahead. We can fix issues when appear later.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart5057685.FUl8IqzCVV
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAljOyd8ACgkQi/DJPQPkQ1K7zwCgtEJbbDRXD/uIRXQ3SHyAbSP2
anEAmgO16NqRZ2+8upt98B+35y2jhOva
=bqIS
-----END PGP SIGNATURE-----

--nextPart5057685.FUl8IqzCVV--
