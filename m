From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: New dell-wireless driver
Date: Thu, 27 Nov 2014 12:43:21 +0100
Message-ID: <201411271243.21216@pali>
References: <201411222345.08384@pali> <20141122020906.GB24951@vmdeb7> <CAJ=jquYg88aoTW1RA7gRVmA8FQOJ7zU6DC2-sL9KAfzLT4afkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3050759.3ShyMncgKB";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:37092 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753329AbaK0LnY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 27 Nov 2014 06:43:24 -0500
Received: by mail-wi0-f182.google.com with SMTP id h11so8048789wiw.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2014 03:43:23 -0800 (PST)
In-Reply-To: <CAJ=jquYg88aoTW1RA7gRVmA8FQOJ7zU6DC2-sL9KAfzLT4afkA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>

--nextPart3050759.3ShyMncgKB
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 27 November 2014 05:27:01 Alex Hung wrote:
> On Sat, Nov 22, 2014 at 10:09 AM, Darren Hart=20
<dvhart@infradead.org> wrote:
> > On Sat, Nov 22, 2014 at 11:45:08PM +0100, Pali Roh=C3=A1r wrote:
> >> Hello,
> >>=20
> >> I saw dell-wireless driver on platform-driver-x86
> >> mailinglist [1] which using DELLABCE acpi device and I do
> >> not like some parts in this driver.
> >=20
> > Hi Pali,
> >=20
> > Thanks for reviewing and speaking up :)
> >=20
> >> First is that this driver export rfkill event as keypress
> >> which is also reported to userspace by keyboard
> >> controller. So then userspace receive two rfkill
> >> keypresses.
> >=20
> > Alex, can you comment? Does the keyboard controller also see
> > this event?
>=20
> Hi Darrent and Pali,
>=20
> The internal KBC needs not to send any events in addition to
> the ACPI event Notify(RBTN, 0x80) according to the
> information I received from Dell. I did not received the same
> event on the Dell systems I tested.
>=20
> Can I have more detailed information of the system and I can
> ask Dell for clarifications.
>=20

Hello,

I have Dell Latitude E6440.

Do you have some documentation for Dell Embedded Controller (or=20
Keyboard controller) which receiving touchpad, trackstick and=20
keyboard data and how it modify them?

There are couple of problems with EC on Latitude Exx40 models=20
(invalid PS/2 packets from trackstick, keyboard repeating keys,=20
keyboard not releasing keys, duplicate key events). You can find=20
that these problems are discussed on internet by lot of users and=20
only occur on Linux (not Windows!). I would like to fix these=20
problems, but without some information from Dell it is=20
impossible. I was told that these problems does not come from=20
ALPS (touchpad+trackstick) device directly.

Do you have some contacts in Dell (BIOS/firmware/ACPI team) who=20
can look at it or provide some information?

> >> Second is that DELLABCE acpi device can also control "soft"
> >> rfkill status and this driver does not enable it because it
> >> use input class instead rfkill.
>=20
> Yes DELLABCE could have a rkfkill device that providing
> soft-block interface; however, I did not see the benefit of
> introducing the extra interfaces when one is sufficient.
>=20

Kernel module dell-laptop.ko (which using Dell SMM, not ACPI!)=20
can provides rfkill interface but only on some laptops=20
(Prevision, Latitude). For other models there is no rfkill=20
interface, so if ACPI provides one it should be exported to=20
userspace.

> Prior to Windows 8, each OEM has wireless interfaces of its
> own. Microsoft introduces standard wireless interfaces and
> OEM starts to drop OEM's interfaces.
>=20
> I  used the same philosophy and remove rfkill devices if they
> do not add extra benefits, especially inconsistency between
> rfkill devices can and does causes problems according to past
> experiences.
>=20
> >> Anyway I have unfinished my version of DELLABCE acpi driver
> >> which will use rfkill interface and plus allow to use hw
> >> switch events in dell-laptop.ko driver.
> >=20
> > Is this something that could be applied incrementally fo
> > Alex's driver, or is it something we'd be best starting
> > over with?
> >=20
> > We have some precedent for input drivers (there is one
> > nearly identical to the dell driver for hp, also by Alex).
> > Using rfkill does seem like the better approach without
> > digging into it.
> >=20
> >> Currently dell-laptop.ko driver is using i8042 hook
> >> function for detecting hw switch key press event. It is
> >> needed to detect if rfkill state was changed or not.
> >>=20
> >> My prepared patches for dell-laptop.ko allows to use acpi
> >> event from DELLABCE driver, so i8042 hook function can be
> >> dropped. Really it is not good idea to pass every PS/2
> >> data from both keyboard, touchpad and trackpoint to
> >> dell-laptop driver and if there is alternative (DELLABCE)
> >> it is better to use it.
> >>=20
> >> But now I would like to hear what do you think about it.
> >>=20
> >> Because only one kernel driver can attach to DELLABCE acpi
> >> device, I cannot use new dell-wireless driver. And I think
> >> only one driver can hit mainline kernel.
> >=20
> > I would like to see your patch, it sounds like it might be a
> > better option.
> >=20
> > --
> > Darren Hart
> > Intel Open Source Technology Center

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3050759.3ShyMncgKB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlR3DlkACgkQi/DJPQPkQ1JLuQCfe8y9i1R9Ewk6h2AGdkYn4VxP
vO8An19IgJQqV19o+yFvu9WA0Fgvy8x4
=62OH
-----END PGP SIGNATURE-----

--nextPart3050759.3ShyMncgKB--
