From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro 3360 multimedia keys
Date: Tue, 21 Nov 2017 19:36:24 +0100
Message-ID: <201711211936.25184@pali>
References: <5089742.2pBsoxBtzf@natalenko.name> <20171121135110.nbnxc3n3xxlbvyis@pali> <1716681.OUoELY8X92@natalenko.name>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2940011.P8GuYGTT4r";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f181.google.com ([209.85.128.181]:36749 "EHLO
        mail-wr0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751191AbdKUSg2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 13:36:28 -0500
In-Reply-To: <1716681.OUoELY8X92@natalenko.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Mario Limonciello <mario_limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

--nextPart2940011.P8GuYGTT4r
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Tuesday 21 November 2017 15:52:28 Oleksandr Natalenko wrote:
> Hi, Pali et al.
>=20
> Answers go inline.
>=20
> On =C3=BAter=C3=BD 21. listopadu 2017 14:51:10 CET Pali Roh=C3=A1r wrote:
> > What would happen if you enable wmi_requires_smbios_request?
> > Nothing? And situation is exactly same?
>=20
> Yes, this is what I did with DMI quirk which enables
> wmi_requires_smbios_request. Keys "1" and "2" behave the same, key
> "3" gets reported via both atkbd and wmi (see my thoughts about this
> key below).

Ok, if wmi_requires_smbios_request is really doing nothing, then it=20
should not be used. It enables some QSET feature in Dell SMM mode which=20
is for 2 laptops.

> > > +	/* Dell Vostro 3360 combined keycode */
> > > +	{ KE_KEY,    0xe0f1, { KEY_PROG1 } },
> > > +	{ KE_KEY,    0xe0f2, { KEY_PROG2 } },
> >=20
> > What is purpose of those two keys? Does not linux kernel already
> > have better description for them as KEY_PROG1 and KEY_PROG2?
>=20
> Well, I didn't find KEY_PROG1/KEY_PROG2 in 0000 table. Thus, I just
> added them. Actually, since these keys have some icons drawn on
> them, they have some designated purpose (most likely,
> Windows-related), but I'd rather think of them as of custom
> programmable keys without any specific function assigned.

Looks like that Dell Vostro 3360 have this meaning for multimedia keys:

first key: Mobility Center
second key: Dell Support Center
third key: Dell Instant Launch Manager

(same as other Vostro laptops)

But do not know what KEY_* are used on other Vostro laptops for those=20
keys. It would be great to use same KEY_*...

> > /* snip */
> >=20
> > > Third key (the one that is handled via PS/2 keyboard) produces
> > > this in the
> >=20
> > > kernel buffer:
> > / *snip */
> >=20
> > Seems you still have not configured keycode for your internal PS/2
> > keyboard to make this key working. Use 'setkeycodes 60 <keycode>'
> > as written in dmesg.
>=20
> Well, I've tried. The problem is that if I even configure this key
> via setkeycodes, it doesn't work.

Hm... why it does not work?

CCing Dmitry, can you tell us what needs to be done to "active" key from=20
AT Keyboard driver which prints following messages to dmesg?

=3D=3D=3D
Nov 20 15:36:51 spock kernel: atkbd serio0: Unknown key pressed=20
(translated set 2, code 0x60 on isa0060/serio0).
Nov 20 15:36:51 spock kernel: atkbd serio0: Use 'setkeycodes 60=20
<keycode>' to make it known.
=3D=3D=3D

I was in impression that if we see such message in dmesg, then key is=20
working fine...

> evtest shows me "value 2" (the
> same value is shown if I press and hold some ordinary key, like "A",
> for instance) instead of 0 and/or 1. Looks like key press event is
> not generated properly by this key via atkbd.
>=20
> That's why I think wmi_requires_smbios_request quirk must be
> permanently enabled for this laptop, and 3rd key must be handled via
> wmi (like two other keys), not via atkbd. And all atkbd events from
> this key must be just suppressed via userspace.

In dell-wmi we filter all key events which are also delivered via PS/2=20
AT Keyboard driver. So filtering PS/2 keys instead of WMI is anti-design=20
solution.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2940011.P8GuYGTT4r
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAloUcikACgkQi/DJPQPkQ1K3LQCfUD0z49MlqNlLSk7nZbPyE8mB
mdcAoJSxKu2CdbhENLme8wBju0sT4uHF
=LRzW
-----END PGP SIGNATURE-----

--nextPart2940011.P8GuYGTT4r--
