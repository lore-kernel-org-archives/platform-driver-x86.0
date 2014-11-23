From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: New dell-wireless driver
Date: Sun, 23 Nov 2014 01:52:46 +0100
Message-ID: <201411230152.46619@pali>
References: <201411222345.08384@pali> <20141122020906.GB24951@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8972577.NPxZpJePiE";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:42481 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753041AbaKWAwt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 22 Nov 2014 19:52:49 -0500
Received: by mail-wg0-f43.google.com with SMTP id l18so9679722wgh.30
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Nov 2014 16:52:48 -0800 (PST)
In-Reply-To: <20141122020906.GB24951@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

--nextPart8972577.NPxZpJePiE
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 22 November 2014 03:09:06 Darren Hart wrote:
> On Sat, Nov 22, 2014 at 11:45:08PM +0100, Pali Roh=C3=A1r wrote:
> > Hello,
> >=20
> > I saw dell-wireless driver on platform-driver-x86
> > mailinglist [1] which using DELLABCE acpi device and I do
> > not like some parts in this driver.
>=20
> Hi Pali,
>=20
> Thanks for reviewing and speaking up :)
>=20
> > First is that this driver export rfkill event as keypress
> > which is also reported to userspace by keyboard controller.
> > So then userspace receive two rfkill keypresses.
>=20
> Alex, can you comment? Does the keyboard controller also see
> this event?
>=20

Yes on my laptop E6440. But it looks like it does not have to be=20
truth for all laptops...

> > Second is that DELLABCE acpi device can also control "soft"
> > rfkill status and this driver does not enable it because it
> > use input class instead rfkill.
> >=20
> > Anyway I have unfinished my version of DELLABCE acpi driver
> > which will use rfkill interface and plus allow to use hw
> > switch events in dell-laptop.ko driver.
>=20
> Is this something that could be applied incrementally fo
> Alex's driver, or is it something we'd be best starting over
> with?
>=20

Alex's driver is different. It registers input device. My=20
approach register rfkill device plus add exported functions for=20
registering atomic notifier (so other drivers like dell-laptop=20
can use events too).

=46irst we need to know if input driver is really needed. And if=20
yes determinate in which conditions and for which laptops. Really=20
duplicate key press are not good.

In case when input driver is really needed I can just copy=20
relevant input code and add it into my driver (in case when my=20
driver will be used instead Alex's). This could be no problem,=20
because my and Alex code doing different things and so could=20
coexist in one driver (but cannot be split into more because only=20
one acpi driver can handle one acpi device).

> We have some precedent for input drivers (there is one nearly
> identical to the dell driver for hp, also by Alex). Using
> rfkill does seem like the better approach without digging
> into it.
>=20

It is different from HP. Dell ACPI device on some machines can=20
also control wifi switches (it can enable/disable it!).

So it make sense to use rfkill. But on some machines that ACPI=20
device can only receive events that HW switch was switched, but=20
it is possible to ask for state (if is enabled or not). HP driver=20
just report switch was changed, but does not report if is enabled=20
or disabled.

So I think HP is not identical to this Dell one.

> > Currently dell-laptop.ko driver is using i8042 hook function
> > for detecting hw switch key press event. It is needed to
> > detect if rfkill state was changed or not.
> >=20
> > My prepared patches for dell-laptop.ko allows to use acpi
> > event from DELLABCE driver, so i8042 hook function can be
> > dropped. Really it is not good idea to pass every PS/2 data
> > from both keyboard, touchpad and trackpoint to dell-laptop
> > driver and if there is alternative (DELLABCE) it is better
> > to use it.
> >=20
> > But now I would like to hear what do you think about it.
> >=20
> > Because only one kernel driver can attach to DELLABCE acpi
> > device, I cannot use new dell-wireless driver. And I think
> > only one driver can hit mainline kernel.
>=20
> I would like to see your patch, it sounds like it might be a
> better option.

Ok, I will sent patches. There are some problems which I'm trying=20
to fix together with Gabriele. Do you need to see patches now, or=20
can you wait some time until we fix it?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart8972577.NPxZpJePiE
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlRxL94ACgkQi/DJPQPkQ1JntwCgiOUjoxpVwyKTlXf8urWzEFS6
sAQAnjqjKgNQJ/CUZ08+ypvVMU0+0doP
=hiBX
-----END PGP SIGNATURE-----

--nextPart8972577.NPxZpJePiE--
