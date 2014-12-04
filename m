From: Alex Hung <alex.hung@canonical.com>
Subject: Re: New dell-wireless driver
Date: Thu, 4 Dec 2014 14:52:21 +0800
Message-ID: <CAJ=jqua3fD65ymb98h5ViAPCFRsXFbarqRRpff+qr_B8yaarpQ@mail.gmail.com>
References: <201411222345.08384@pali>
	<CAJ=jquZqWJhh2eJu4W2xBP-E0mSKHmiTjiguvRLOZRH_5NeS_A@mail.gmail.com>
	<2045136.GvMxoAg5xi@xps13>
	<2647213.YkxFWdbPIe@xps13>
	<20141203085030.GB52608@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qa0-f54.google.com ([209.85.216.54]:62761 "EHLO
	mail-qa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751878AbaLDGwW convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 4 Dec 2014 01:52:22 -0500
Received: by mail-qa0-f54.google.com with SMTP id i13so11718171qae.27
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Dec 2014 22:52:21 -0800 (PST)
In-Reply-To: <20141203085030.GB52608@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Sorry for late reply. A few other tasks occupied my time.

Method(ARBT) is defined to enable/disable BIOS handling the radio,
where 1 is enable and 0 is disable, for your information.

However, I checked Latitude E5440, and its ARBT is empty such as

Method (ARBT, 1, NotSerialized)
{
}

This matches to what I remembered when I was working on other systems,
and that's why it is not used in my implementation, but it seems some
systems do implement it. It is good to know.


On Wed, Dec 3, 2014 at 4:50 PM, Darren Hart <dvhart@infradead.org> wrot=
e:
> On Tue, Dec 02, 2014 at 04:08:58PM +0100, Gabriele Mazzotta wrote:
>> On Tuesday 02 December 2014 12:06:45 Gabriele Mazzotta wrote:
>> > On Thursday 27 November 2014 12:41:19 Alex Hung wrote:
>> > > On Sun, Nov 23, 2014 at 8:52 AM, Pali Roh=C3=A1r <pali.rohar@gma=
il.com> wrote:
>> > > > On Saturday 22 November 2014 03:09:06 Darren Hart wrote:
>> > > >> On Sat, Nov 22, 2014 at 11:45:08PM +0100, Pali Roh=C3=A1r wro=
te:
>> > > >> > Hello,
>> > > >> >
>> > > >> > I saw dell-wireless driver on platform-driver-x86
>> > > >> > mailinglist [1] which using DELLABCE acpi device and I do
>> > > >> > not like some parts in this driver.
>> > > >>
>> > > >> Hi Pali,
>> > > >>
>> > > >> Thanks for reviewing and speaking up :)
>> > > >>
>> > > >> > First is that this driver export rfkill event as keypress
>> > > >> > which is also reported to userspace by keyboard controller.
>> > > >> > So then userspace receive two rfkill keypresses.
>> > > >>
>> > > >> Alex, can you comment? Does the keyboard controller also see
>> > > >> this event?
>> > > >
>> > > > Yes on my laptop E6440. But it looks like it does not have to =
be
>> > > > truth for all laptops...
>> > > >
>> > > >> > Second is that DELLABCE acpi device can also control "soft"
>> > > >> > rfkill status and this driver does not enable it because it
>> > > >> > use input class instead rfkill.
>> > > >> >
>> > > >> > Anyway I have unfinished my version of DELLABCE acpi driver
>> > > >> > which will use rfkill interface and plus allow to use hw
>> > > >> > switch events in dell-laptop.ko driver.
>> > > >>
>> > > >> Is this something that could be applied incrementally fo
>> > > >> Alex's driver, or is it something we'd be best starting over
>> > > >> with?
>> > > >
>> > > > Alex's driver is different. It registers input device. My
>> > > > approach register rfkill device plus add exported functions fo=
r
>> > > > registering atomic notifier (so other drivers like dell-laptop
>> > > > can use events too).
>> > > >
>> > > > First we need to know if input driver is really needed. And if
>> > > > yes determinate in which conditions and for which laptops. Rea=
lly
>> > > > duplicate key press are not good.
>> > > >
>> > > > In case when input driver is really needed I can just copy
>> > > > relevant input code and add it into my driver (in case when my
>> > > > driver will be used instead Alex's). This could be no problem,
>> > > > because my and Alex code doing different things and so could
>> > > > coexist in one driver (but cannot be split into more because o=
nly
>> > > > one acpi driver can handle one acpi device).
>> > > >
>> > > >> We have some precedent for input drivers (there is one nearly
>> > > >> identical to the dell driver for hp, also by Alex). Using
>> > > >> rfkill does seem like the better approach without digging
>> > > >> into it.
>> > > >
>> > > > It is different from HP. Dell ACPI device on some machines can
>> > > > also control wifi switches (it can enable/disable it!).
>> > > >
>> > > > So it make sense to use rfkill. But on some machines that ACPI
>> > > > device can only receive events that HW switch was switched, bu=
t
>> > > > it is possible to ask for state (if is enabled or not). HP dri=
ver
>> > > > just report switch was changed, but does not report if is enab=
led
>> > > > or disabled.
>> > > >
>> > > > So I think HP is not identical to this Dell one.
>> > >
>> > > I can provide a little more information on HP and Dell's design.
>> > >
>> > > Dell's design is more complex than HP's indeed.
>> > >
>> > > HP BIOS will send ACPI notification when hotkey is pressed;
>> > > especially HP uses buttons instead of hardware slider on their
>> > > systems.
>> > >
>> > > Dell has two design
>> > > 1. Button similar to HP. My patch targeted this type.
>> > > 2. Hardware slider. This handled will handled by Wireless device
>> > > drivers (ex. WLAN, BT and so on) by their rfkill hard-block. The=
re
>> > > is
>> > > no need to handle this case.
>> > >
>> > > This can be distinguished by calling CRBT. I checked Pali's patc=
h
>> > > and
>> > > it was used but the two types are not distinguished. You may wan=
t to
>> > > use it as hard-block can be out-of-sync with soft-block on corne=
r
>> > > cases for Type 2.
>> >
>> > Hi,
>> >
>> > my laptop (XPS13 9333) supports both the switch types taken into
>> > account in your patch. I can switch between them by calling a meth=
od
>> > named ARBT.
>> >
>> > I can see that in your patch CRBT is called to determine the switc=
h
>> > type. On my system, that method always returns 0, independently on
>> > the current mode. I have to verify this, but I think that would be=
 a
>> > problem on my system as by default the BIOS uses what you called
>> > "design 2" and there are currently no ways to change it. That mean=
s
>> > that with your driver KEY_RFKILL would be sent along with the rfki=
ll
>> > event. To make things worse, dell-wmi is currently sending KEY_WLA=
N
>> > when I press the Fn key that toggles the state of WiFi and Bluetoo=
th.
>> >
>> > I think that calling ARBT on driver init would solve all the probl=
ems:
>> > the correct mode would get selected, the BIOS would stop sending t=
he
>> > WMI events that make dell-wmi send KEY_WLAN and it would also no
>> > longer hard block the rfkill, letting userspace applications take
>> > care of everything.
>> >
>> > As I said, I have to look into this better and I'll do it as soon =
as I
>> > can. Sorry for being late.
>> >
>> > Gabriele
>>
>> I confirm what I wrote in my previous mail.
>>
>> I tried Alex's patch and every time I pressed Fn+WiFi I had an rfkil=
l
>> event, a KEY_WLAN keypress and a KEY_RFKILL keypresses, all together=
=2E
>>
>> Adding something like the following on module load:
>>
>>       acpi_execute_simple_method(device->handle, "ARBT", 1);
>>
>> and something like the following on module exit:
>>
>>       acpi_execute_simple_method(device->handle, "ARBT", 0);
>>
>> to his code solves the problem. Only KEY_RFKILL is sent to userspace
>> and nothing is done by the BIOS.
>
> Will someone be sending a follow-up patch?
>
> With Gabriele's patch above, is there any objection to merging Alex's
> dell-wireless patch for 3.19? If Pali's driver adds broader support, =
we can
> always merge them.
>
> --
> Darren Hart
> Intel Open Source Technology Center



--=20
Cheers,
Alex Hung
