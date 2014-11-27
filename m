From: Alex Hung <alex.hung@canonical.com>
Subject: Re: New dell-wireless driver
Date: Thu, 27 Nov 2014 12:41:19 +0800
Message-ID: <CAJ=jquZqWJhh2eJu4W2xBP-E0mSKHmiTjiguvRLOZRH_5NeS_A@mail.gmail.com>
References: <201411222345.08384@pali>
	<20141122020906.GB24951@vmdeb7>
	<201411230152.46619@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:58229 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752817AbaK0ElU convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Nov 2014 23:41:20 -0500
Received: by mail-qa0-f46.google.com with SMTP id u7so2855366qaz.33
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2014 20:41:19 -0800 (PST)
In-Reply-To: <201411230152.46619@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Sun, Nov 23, 2014 at 8:52 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> On Saturday 22 November 2014 03:09:06 Darren Hart wrote:
>> On Sat, Nov 22, 2014 at 11:45:08PM +0100, Pali Roh=C3=A1r wrote:
>> > Hello,
>> >
>> > I saw dell-wireless driver on platform-driver-x86
>> > mailinglist [1] which using DELLABCE acpi device and I do
>> > not like some parts in this driver.
>>
>> Hi Pali,
>>
>> Thanks for reviewing and speaking up :)
>>
>> > First is that this driver export rfkill event as keypress
>> > which is also reported to userspace by keyboard controller.
>> > So then userspace receive two rfkill keypresses.
>>
>> Alex, can you comment? Does the keyboard controller also see
>> this event?
>>
>
> Yes on my laptop E6440. But it looks like it does not have to be
> truth for all laptops...
>
>> > Second is that DELLABCE acpi device can also control "soft"
>> > rfkill status and this driver does not enable it because it
>> > use input class instead rfkill.
>> >
>> > Anyway I have unfinished my version of DELLABCE acpi driver
>> > which will use rfkill interface and plus allow to use hw
>> > switch events in dell-laptop.ko driver.
>>
>> Is this something that could be applied incrementally fo
>> Alex's driver, or is it something we'd be best starting over
>> with?
>>
>
> Alex's driver is different. It registers input device. My
> approach register rfkill device plus add exported functions for
> registering atomic notifier (so other drivers like dell-laptop
> can use events too).
>
> First we need to know if input driver is really needed. And if
> yes determinate in which conditions and for which laptops. Really
> duplicate key press are not good.
>
> In case when input driver is really needed I can just copy
> relevant input code and add it into my driver (in case when my
> driver will be used instead Alex's). This could be no problem,
> because my and Alex code doing different things and so could
> coexist in one driver (but cannot be split into more because only
> one acpi driver can handle one acpi device).
>
>> We have some precedent for input drivers (there is one nearly
>> identical to the dell driver for hp, also by Alex). Using
>> rfkill does seem like the better approach without digging
>> into it.
>>
>
> It is different from HP. Dell ACPI device on some machines can
> also control wifi switches (it can enable/disable it!).
>
> So it make sense to use rfkill. But on some machines that ACPI
> device can only receive events that HW switch was switched, but
> it is possible to ask for state (if is enabled or not). HP driver
> just report switch was changed, but does not report if is enabled
> or disabled.
>
> So I think HP is not identical to this Dell one.

I can provide a little more information on HP and Dell's design.

Dell's design is more complex than HP's indeed.

HP BIOS will send ACPI notification when hotkey is pressed; especially
HP uses buttons instead of hardware slider on their systems.

Dell has two design
1. Button similar to HP. My patch targeted this type.
2. Hardware slider. This handled will handled by Wireless device
drivers (ex. WLAN, BT and so on) by their rfkill hard-block. There is
no need to handle this case.

This can be distinguished by calling CRBT. I checked Pali's patch and
it was used but the two types are not distinguished. You may want to
use it as hard-block can be out-of-sync with soft-block on corner
cases for Type 2.

>
>> > Currently dell-laptop.ko driver is using i8042 hook function
>> > for detecting hw switch key press event. It is needed to
>> > detect if rfkill state was changed or not.
>> >
>> > My prepared patches for dell-laptop.ko allows to use acpi
>> > event from DELLABCE driver, so i8042 hook function can be
>> > dropped. Really it is not good idea to pass every PS/2 data
>> > from both keyboard, touchpad and trackpoint to dell-laptop
>> > driver and if there is alternative (DELLABCE) it is better
>> > to use it.
>> >
>> > But now I would like to hear what do you think about it.
>> >
>> > Because only one kernel driver can attach to DELLABCE acpi
>> > device, I cannot use new dell-wireless driver. And I think
>> > only one driver can hit mainline kernel.
>>
>> I would like to see your patch, it sounds like it might be a
>> better option.
>
> Ok, I will sent patches. There are some problems which I'm trying
> to fix together with Gabriele. Do you need to see patches now, or
> can you wait some time until we fix it?
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
Cheers,
Alex Hung
