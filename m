From: Alex Hung <alex.hung@canonical.com>
Subject: Re: New dell-wireless driver
Date: Fri, 28 Nov 2014 13:33:07 +0800
Message-ID: <CAJ=jqua5TPP_XdgdneYbZ17V-vy0h5Y-442TVeM+0U0KLoQQAA@mail.gmail.com>
References: <201411222345.08384@pali>
	<20141122020906.GB24951@vmdeb7>
	<CAJ=jquYg88aoTW1RA7gRVmA8FQOJ7zU6DC2-sL9KAfzLT4afkA@mail.gmail.com>
	<201411271243.21216@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:51670 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750888AbaK1FdJ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Nov 2014 00:33:09 -0500
Received: by mail-qc0-f180.google.com with SMTP id i8so4442686qcq.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2014 21:33:08 -0800 (PST)
In-Reply-To: <201411271243.21216@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Thu, Nov 27, 2014 at 7:43 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> On Thursday 27 November 2014 05:27:01 Alex Hung wrote:
>> On Sat, Nov 22, 2014 at 10:09 AM, Darren Hart
> <dvhart@infradead.org> wrote:
>> > On Sat, Nov 22, 2014 at 11:45:08PM +0100, Pali Roh=C3=A1r wrote:
>> >> Hello,
>> >>
>> >> I saw dell-wireless driver on platform-driver-x86
>> >> mailinglist [1] which using DELLABCE acpi device and I do
>> >> not like some parts in this driver.
>> >
>> > Hi Pali,
>> >
>> > Thanks for reviewing and speaking up :)
>> >
>> >> First is that this driver export rfkill event as keypress
>> >> which is also reported to userspace by keyboard
>> >> controller. So then userspace receive two rfkill
>> >> keypresses.
>> >
>> > Alex, can you comment? Does the keyboard controller also see
>> > this event?
>>
>> Hi Darrent and Pali,
>>
>> The internal KBC needs not to send any events in addition to
>> the ACPI event Notify(RBTN, 0x80) according to the
>> information I received from Dell. I did not received the same
>> event on the Dell systems I tested.
>>
>> Can I have more detailed information of the system and I can
>> ask Dell for clarifications.
>>
>
> Hello,
>
> I have Dell Latitude E6440.
>
> Do you have some documentation for Dell Embedded Controller (or
> Keyboard controller) which receiving touchpad, trackstick and
> keyboard data and how it modify them?
>
> There are couple of problems with EC on Latitude Exx40 models
> (invalid PS/2 packets from trackstick, keyboard repeating keys,
> keyboard not releasing keys, duplicate key events). You can find
> that these problems are discussed on internet by lot of users and
> only occur on Linux (not Windows!). I would like to fix these
> problems, but without some information from Dell it is
> impossible. I was told that these problems does not come from
> ALPS (touchpad+trackstick) device directly.

I do not have any Dell's KBC/EC document and I do not have direct
contacts with Dell's Latitude team, but I can try to get to them.

Will you be able to provide dumpfile from "dmidecode,> dmi.log" (you
can send the attachment directly to me). I did some online searches
but am not sure which problems you are referring to. Will you provide
more details of the problems you encountered. I will check with ALPS
to see what they know about them, too.

>
> Do you have some contacts in Dell (BIOS/firmware/ACPI team) who
> can look at it or provide some information?
>
>> >> Second is that DELLABCE acpi device can also control "soft"
>> >> rfkill status and this driver does not enable it because it
>> >> use input class instead rfkill.
>>
>> Yes DELLABCE could have a rkfkill device that providing
>> soft-block interface; however, I did not see the benefit of
>> introducing the extra interfaces when one is sufficient.
>>
>
> Kernel module dell-laptop.ko (which using Dell SMM, not ACPI!)
> can provides rfkill interface but only on some laptops
> (Prevision, Latitude). For other models there is no rfkill
> interface, so if ACPI provides one it should be exported to
> userspace.
>
>> Prior to Windows 8, each OEM has wireless interfaces of its
>> own. Microsoft introduces standard wireless interfaces and
>> OEM starts to drop OEM's interfaces.
>>
>> I  used the same philosophy and remove rfkill devices if they
>> do not add extra benefits, especially inconsistency between
>> rfkill devices can and does causes problems according to past
>> experiences.
>>
>> >> Anyway I have unfinished my version of DELLABCE acpi driver
>> >> which will use rfkill interface and plus allow to use hw
>> >> switch events in dell-laptop.ko driver.
>> >
>> > Is this something that could be applied incrementally fo
>> > Alex's driver, or is it something we'd be best starting
>> > over with?
>> >
>> > We have some precedent for input drivers (there is one
>> > nearly identical to the dell driver for hp, also by Alex).
>> > Using rfkill does seem like the better approach without
>> > digging into it.
>> >
>> >> Currently dell-laptop.ko driver is using i8042 hook
>> >> function for detecting hw switch key press event. It is
>> >> needed to detect if rfkill state was changed or not.
>> >>
>> >> My prepared patches for dell-laptop.ko allows to use acpi
>> >> event from DELLABCE driver, so i8042 hook function can be
>> >> dropped. Really it is not good idea to pass every PS/2
>> >> data from both keyboard, touchpad and trackpoint to
>> >> dell-laptop driver and if there is alternative (DELLABCE)
>> >> it is better to use it.
>> >>
>> >> But now I would like to hear what do you think about it.
>> >>
>> >> Because only one kernel driver can attach to DELLABCE acpi
>> >> device, I cannot use new dell-wireless driver. And I think
>> >> only one driver can hit mainline kernel.
>> >
>> > I would like to see your patch, it sounds like it might be a
>> > better option.
>> >
>> > --
>> > Darren Hart
>> > Intel Open Source Technology Center
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
Cheers,
Alex Hung
