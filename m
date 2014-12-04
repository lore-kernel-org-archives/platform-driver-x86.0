From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: New dell-wireless driver
Date: Thu, 4 Dec 2014 10:57:56 +0100
Message-ID: <201412041057.56284@pali>
References: <201411222345.08384@pali> <20141203085030.GB52608@vmdeb7> <CAJ=jqua3fD65ymb98h5ViAPCFRsXFbarqRRpff+qr_B8yaarpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1987063.cYphbzAvq1";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:54336 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753420AbaLDJ57 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 4 Dec 2014 04:57:59 -0500
Received: by mail-wi0-f181.google.com with SMTP id r20so27273718wiv.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Dec 2014 01:57:58 -0800 (PST)
In-Reply-To: <CAJ=jqua3fD65ymb98h5ViAPCFRsXFbarqRRpff+qr_B8yaarpQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

--nextPart1987063.cYphbzAvq1
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for info!

Do you know if Latitude E5440 has Fn wifi key or HW switch?

My Latitude E6440 has only HW switch and ARBT is empty too.

On Thursday 04 December 2014 07:52:21 Alex Hung wrote:
> Sorry for late reply. A few other tasks occupied my time.
>=20
> Method(ARBT) is defined to enable/disable BIOS handling the
> radio, where 1 is enable and 0 is disable, for your
> information.
>=20
> However, I checked Latitude E5440, and its ARBT is empty such
> as
>=20
> Method (ARBT, 1, NotSerialized)
> {
> }
>=20
> This matches to what I remembered when I was working on other
> systems, and that's why it is not used in my implementation,
> but it seems some systems do implement it. It is good to
> know.
>=20
> On Wed, Dec 3, 2014 at 4:50 PM, Darren Hart=20
<dvhart@infradead.org> wrote:
> > On Tue, Dec 02, 2014 at 04:08:58PM +0100, Gabriele Mazzotta=20
wrote:
> >> On Tuesday 02 December 2014 12:06:45 Gabriele Mazzotta=20
wrote:
> >> > On Thursday 27 November 2014 12:41:19 Alex Hung wrote:
> >> > > On Sun, Nov 23, 2014 at 8:52 AM, Pali Roh=C3=A1r=20
<pali.rohar@gmail.com> wrote:
> >> > > > On Saturday 22 November 2014 03:09:06 Darren Hart=20
wrote:
> >> > > >> On Sat, Nov 22, 2014 at 11:45:08PM +0100, Pali Roh=C3=A1r=20
wrote:
> >> > > >> > Hello,
> >> > > >> >=20
> >> > > >> > I saw dell-wireless driver on platform-driver-x86
> >> > > >> > mailinglist [1] which using DELLABCE acpi device
> >> > > >> > and I do not like some parts in this driver.
> >> > > >>=20
> >> > > >> Hi Pali,
> >> > > >>=20
> >> > > >> Thanks for reviewing and speaking up :)
> >> > > >>=20
> >> > > >> > First is that this driver export rfkill event as
> >> > > >> > keypress which is also reported to userspace by
> >> > > >> > keyboard controller. So then userspace receive
> >> > > >> > two rfkill keypresses.
> >> > > >>=20
> >> > > >> Alex, can you comment? Does the keyboard controller
> >> > > >> also see this event?
> >> > > >=20
> >> > > > Yes on my laptop E6440. But it looks like it does not
> >> > > > have to be truth for all laptops...
> >> > > >=20
> >> > > >> > Second is that DELLABCE acpi device can also
> >> > > >> > control "soft" rfkill status and this driver does
> >> > > >> > not enable it because it use input class instead
> >> > > >> > rfkill.
> >> > > >> >=20
> >> > > >> > Anyway I have unfinished my version of DELLABCE
> >> > > >> > acpi driver which will use rfkill interface and
> >> > > >> > plus allow to use hw switch events in
> >> > > >> > dell-laptop.ko driver.
> >> > > >>=20
> >> > > >> Is this something that could be applied
> >> > > >> incrementally fo Alex's driver, or is it something
> >> > > >> we'd be best starting over with?
> >> > > >=20
> >> > > > Alex's driver is different. It registers input
> >> > > > device. My approach register rfkill device plus add
> >> > > > exported functions for registering atomic notifier
> >> > > > (so other drivers like dell-laptop can use events
> >> > > > too).
> >> > > >=20
> >> > > > First we need to know if input driver is really
> >> > > > needed. And if yes determinate in which conditions
> >> > > > and for which laptops. Really duplicate key press
> >> > > > are not good.
> >> > > >=20
> >> > > > In case when input driver is really needed I can just
> >> > > > copy relevant input code and add it into my driver
> >> > > > (in case when my driver will be used instead
> >> > > > Alex's). This could be no problem, because my and
> >> > > > Alex code doing different things and so could
> >> > > > coexist in one driver (but cannot be split into more
> >> > > > because only one acpi driver can handle one acpi
> >> > > > device).
> >> > > >=20
> >> > > >> We have some precedent for input drivers (there is
> >> > > >> one nearly identical to the dell driver for hp,
> >> > > >> also by Alex). Using rfkill does seem like the
> >> > > >> better approach without digging into it.
> >> > > >=20
> >> > > > It is different from HP. Dell ACPI device on some
> >> > > > machines can also control wifi switches (it can
> >> > > > enable/disable it!).
> >> > > >=20
> >> > > > So it make sense to use rfkill. But on some machines
> >> > > > that ACPI device can only receive events that HW
> >> > > > switch was switched, but it is possible to ask for
> >> > > > state (if is enabled or not). HP driver just report
> >> > > > switch was changed, but does not report if is
> >> > > > enabled or disabled.
> >> > > >=20
> >> > > > So I think HP is not identical to this Dell one.
> >> > >=20
> >> > > I can provide a little more information on HP and
> >> > > Dell's design.
> >> > >=20
> >> > > Dell's design is more complex than HP's indeed.
> >> > >=20
> >> > > HP BIOS will send ACPI notification when hotkey is
> >> > > pressed; especially HP uses buttons instead of
> >> > > hardware slider on their systems.
> >> > >=20
> >> > > Dell has two design
> >> > > 1. Button similar to HP. My patch targeted this type.
> >> > > 2. Hardware slider. This handled will handled by
> >> > > Wireless device drivers (ex. WLAN, BT and so on) by
> >> > > their rfkill hard-block. There is
> >> > > no need to handle this case.
> >> > >=20
> >> > > This can be distinguished by calling CRBT. I checked
> >> > > Pali's patch and
> >> > > it was used but the two types are not distinguished.
> >> > > You may want to use it as hard-block can be
> >> > > out-of-sync with soft-block on corner cases for Type
> >> > > 2.
> >> >=20
> >> > Hi,
> >> >=20
> >> > my laptop (XPS13 9333) supports both the switch types
> >> > taken into account in your patch. I can switch between
> >> > them by calling a method named ARBT.
> >> >=20
> >> > I can see that in your patch CRBT is called to determine
> >> > the switch type. On my system, that method always
> >> > returns 0, independently on the current mode. I have to
> >> > verify this, but I think that would be a problem on my
> >> > system as by default the BIOS uses what you called
> >> > "design 2" and there are currently no ways to change it.
> >> > That means that with your driver KEY_RFKILL would be
> >> > sent along with the rfkill event. To make things worse,
> >> > dell-wmi is currently sending KEY_WLAN when I press the
> >> > Fn key that toggles the state of WiFi and Bluetooth.
> >> >=20
> >> > I think that calling ARBT on driver init would solve all
> >> > the problems: the correct mode would get selected, the
> >> > BIOS would stop sending the WMI events that make
> >> > dell-wmi send KEY_WLAN and it would also no longer hard
> >> > block the rfkill, letting userspace applications take
> >> > care of everything.
> >> >=20
> >> > As I said, I have to look into this better and I'll do it
> >> > as soon as I can. Sorry for being late.
> >> >=20
> >> > Gabriele
> >>=20
> >> I confirm what I wrote in my previous mail.
> >>=20
> >> I tried Alex's patch and every time I pressed Fn+WiFi I had
> >> an rfkill event, a KEY_WLAN keypress and a KEY_RFKILL
> >> keypresses, all together.
> >>=20
> >> Adding something like the following on module load:
> >>       acpi_execute_simple_method(device->handle, "ARBT",
> >>       1);
> >>=20
> >> and something like the following on module exit:
> >>       acpi_execute_simple_method(device->handle, "ARBT",
> >>       0);
> >>=20
> >> to his code solves the problem. Only KEY_RFKILL is sent to
> >> userspace and nothing is done by the BIOS.
> >=20
> > Will someone be sending a follow-up patch?
> >=20
> > With Gabriele's patch above, is there any objection to
> > merging Alex's dell-wireless patch for 3.19? If Pali's
> > driver adds broader support, we can always merge them.
> >=20
> > --
> > Darren Hart
> > Intel Open Source Technology Center

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1987063.cYphbzAvq1
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlSAMCQACgkQi/DJPQPkQ1JSlgCdEv5E2CowqFA70fdViqrQ9CN1
7PkAoKY89It6TstGtmEYPXImtXofnB5I
=Eh6v
-----END PGP SIGNATURE-----

--nextPart1987063.cYphbzAvq1--
