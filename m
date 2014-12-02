From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: New dell-wireless driver
Date: Tue, 02 Dec 2014 12:06:45 +0100
Message-ID: <2045136.GvMxoAg5xi@xps13>
References: <201411222345.08384@pali> <201411230152.46619@pali> <CAJ=jquZqWJhh2eJu4W2xBP-E0mSKHmiTjiguvRLOZRH_5NeS_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:34581 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296AbaLBLGs convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Dec 2014 06:06:48 -0500
Received: by mail-wi0-f169.google.com with SMTP id r20so29680023wiv.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Dec 2014 03:06:47 -0800 (PST)
In-Reply-To: <CAJ=jquZqWJhh2eJu4W2xBP-E0mSKHmiTjiguvRLOZRH_5NeS_A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Thursday 27 November 2014 12:41:19 Alex Hung wrote:
> On Sun, Nov 23, 2014 at 8:52 AM, Pali Roh=E1r <pali.rohar@gmail.com> =
wrote:
> > On Saturday 22 November 2014 03:09:06 Darren Hart wrote:
> >> On Sat, Nov 22, 2014 at 11:45:08PM +0100, Pali Roh=E1r wrote:
> >> > Hello,
> >> >=20
> >> > I saw dell-wireless driver on platform-driver-x86
> >> > mailinglist [1] which using DELLABCE acpi device and I do
> >> > not like some parts in this driver.
> >>=20
> >> Hi Pali,
> >>=20
> >> Thanks for reviewing and speaking up :)
> >>=20
> >> > First is that this driver export rfkill event as keypress
> >> > which is also reported to userspace by keyboard controller.
> >> > So then userspace receive two rfkill keypresses.
> >>=20
> >> Alex, can you comment? Does the keyboard controller also see
> >> this event?
> >=20
> > Yes on my laptop E6440. But it looks like it does not have to be
> > truth for all laptops...
> >=20
> >> > Second is that DELLABCE acpi device can also control "soft"
> >> > rfkill status and this driver does not enable it because it
> >> > use input class instead rfkill.
> >> >=20
> >> > Anyway I have unfinished my version of DELLABCE acpi driver
> >> > which will use rfkill interface and plus allow to use hw
> >> > switch events in dell-laptop.ko driver.
> >>=20
> >> Is this something that could be applied incrementally fo
> >> Alex's driver, or is it something we'd be best starting over
> >> with?
> >=20
> > Alex's driver is different. It registers input device. My
> > approach register rfkill device plus add exported functions for
> > registering atomic notifier (so other drivers like dell-laptop
> > can use events too).
> >=20
> > First we need to know if input driver is really needed. And if
> > yes determinate in which conditions and for which laptops. Really
> > duplicate key press are not good.
> >=20
> > In case when input driver is really needed I can just copy
> > relevant input code and add it into my driver (in case when my
> > driver will be used instead Alex's). This could be no problem,
> > because my and Alex code doing different things and so could
> > coexist in one driver (but cannot be split into more because only
> > one acpi driver can handle one acpi device).
> >=20
> >> We have some precedent for input drivers (there is one nearly
> >> identical to the dell driver for hp, also by Alex). Using
> >> rfkill does seem like the better approach without digging
> >> into it.
> >=20
> > It is different from HP. Dell ACPI device on some machines can
> > also control wifi switches (it can enable/disable it!).
> >=20
> > So it make sense to use rfkill. But on some machines that ACPI
> > device can only receive events that HW switch was switched, but
> > it is possible to ask for state (if is enabled or not). HP driver
> > just report switch was changed, but does not report if is enabled
> > or disabled.
> >=20
> > So I think HP is not identical to this Dell one.
>=20
> I can provide a little more information on HP and Dell's design.
>=20
> Dell's design is more complex than HP's indeed.
>=20
> HP BIOS will send ACPI notification when hotkey is pressed; especiall=
y
> HP uses buttons instead of hardware slider on their systems.
>=20
> Dell has two design
> 1. Button similar to HP. My patch targeted this type.
> 2. Hardware slider. This handled will handled by Wireless device
> drivers (ex. WLAN, BT and so on) by their rfkill hard-block. There is
> no need to handle this case.
>=20
> This can be distinguished by calling CRBT. I checked Pali's patch and
> it was used but the two types are not distinguished. You may want to
> use it as hard-block can be out-of-sync with soft-block on corner
> cases for Type 2.

Hi,

my laptop (XPS13 9333) supports both the switch types taken into accoun=
t
in your patch. I can switch between them by calling a method named ARBT=
=2E

I can see that in your patch CRBT is called to determine the switch typ=
e.
On my system, that method always returns 0, independently on the curren=
t
mode. I have to verify this, but I think that would be a problem on my
system as by default the BIOS uses what you called "design 2" and there
are currently no ways to change it. That means that with your driver
KEY_RFKILL would be sent along with the rfkill event. To make things
worse, dell-wmi is currently sending KEY_WLAN when I press the Fn key
that toggles the state of WiFi and Bluetooth.

I think that calling ARBT on driver init would solve all the problems:
the correct mode would get selected, the BIOS would stop sending the WM=
I
events that make dell-wmi send KEY_WLAN and it would also no longer har=
d
block the rfkill, letting userspace applications take care of everythin=
g.

As I said, I have to look into this better and I'll do it as soon as I =
can.
Sorry for being late.

Gabriele

> >> > Currently dell-laptop.ko driver is using i8042 hook function
> >> > for detecting hw switch key press event. It is needed to
> >> > detect if rfkill state was changed or not.
> >> >=20
> >> > My prepared patches for dell-laptop.ko allows to use acpi
> >> > event from DELLABCE driver, so i8042 hook function can be
> >> > dropped. Really it is not good idea to pass every PS/2 data
> >> > from both keyboard, touchpad and trackpoint to dell-laptop
> >> > driver and if there is alternative (DELLABCE) it is better
> >> > to use it.
> >> >=20
> >> > But now I would like to hear what do you think about it.
> >> >=20
> >> > Because only one kernel driver can attach to DELLABCE acpi
> >> > device, I cannot use new dell-wireless driver. And I think
> >> > only one driver can hit mainline kernel.
> >>=20
> >> I would like to see your patch, it sounds like it might be a
> >> better option.
> >=20
> > Ok, I will sent patches. There are some problems which I'm trying
> > to fix together with Gabriele. Do you need to see patches now, or
> > can you wait some time until we fix it?
> >=20
> > --
> > Pali Roh=E1r
> > pali.rohar@gmail.com
