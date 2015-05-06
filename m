From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode
 Switch driver
Date: Wed, 6 May 2015 17:34:37 +0800
Message-ID: <CAJ=jquaeiUgsjZWma5FmPVsWm0CJVzhmZ_t78g4zhzajv3g+vg@mail.gmail.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
	<CAJ=jquYEEZ928A=eL158p38s4EEX32BZB5mOv5-841bRkKr_UQ@mail.gmail.com>
	<20150430074429.GT24346@pali>
	<1828808.mVmCDTOvJh@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:33720 "EHLO
	mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750997AbbEFJei convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 05:34:38 -0400
Received: by qkx62 with SMTP id 62so1986903qkx.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2015 02:34:37 -0700 (PDT)
In-Reply-To: <1828808.mVmCDTOvJh@xps13>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org

Since Windows 8 requirement asks  below, I see a trend that OEM is
moving wireless to HW-control to SW-control. That's also why some new
systems never trigger hard-blocks. I was also told that there may be
no "HW-GPIO" (my translation -> no hard-block) to control wireless in
some of future systems. I do not have any details but will share /
submit patches if this is going to impact Linux kernel.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
System.Client.RadioManagement.HardwareButton
If a PC has a physical (hardware) button switch on a PC that turns
wireless radios on and off, it must be software controllable and
interact appropriately with the Radio Management UI
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I don't see the kernel parameter as a workaround, either. I agree with
Gabriele that it is giving users an second option to choose how to use
the hardware they purchased.


On Wed, May 6, 2015 at 5:23 AM, Gabriele Mazzotta
<gabriele.mzt@gmail.com> wrote:
> On Thursday 30 April 2015 09:44:29 Pali Roh=C3=A1r wrote:
>> On Thursday 30 April 2015 14:06:27 Alex Hung wrote:
>> > Method ABRT is to be used by driver to disable BIOS handling of ra=
dio
>> > button. So the changes in behaviours observed by Gabriele is expec=
ted.
>> > I have seen other systems behave the same way.
>> >
>>
>> Right, that after that ARBT call operating system get full control o=
ver
>> radio devices and ACPI/BIOS will not automatically enable/disable th=
em.
>> I think this is OK.
>>
>> But for that we need also support for manually enable/disable radio
>> devices and code for this support is missing. Or do DELLABCE/RBTN ac=
pi
>> devices somehow support enabling/disabling it via system/kernel requ=
est?
>>
>> > I do also see firmware only sends Notify(RBTN, 0x80) and no hard b=
lock
>> > whether ABRT(1) is called or not.  Thus keycode are the only optio=
n on
>> > those machines.
>> >
>>
>> Key is ok, but we *must* have ability to hard block it via some
>> ACPI/WMI/BIOS/FW/etc... call. Otherwise ARBT(1) is no go as users sh=
ould
>> be able to enable/disable their radio devices (bluetooth for powersa=
ve)
>
> Does it really matter in the end? As I understand it, radio devices a=
re
> off either way.
>
>> > The idea to have an option (kernel parameter) for calling ABRT is
>> > great. I can help verify on more machines. Is Gabriele's patch abo=
ve a
>> > final version that I should test?
>> >
>>
>> No, I do not think so. This looks like hack or pure design. Kernel
>> option could be there, but just for buggy BIOSes (and future changed
>> design).
>>
>> But now it looks like for correct work is specifying that param
>> required -- which is bad.
>>
>> Alex, can you ask Dell people how should system turn off e.g bluetoo=
th
>> or wifi device if ARTB(1) is called and system/kernel (instead ACPI)=
 is
>> expected to turn off/on blueooth (and wifi) devices?
>>
>> I think that without this information (and working driver for it) we
>> should not enable ARTB(1) or including this driver into kernel tree =
as
>> it will break some existing machines...
>
> I disagree. If we skip ARBT(1), userspace will get confused on laptop=
s
> like mine as it would receive two events: an rfkill event (because of
> the BIOS shutting down radios) and a keypress (because of Alex's patc=
h).
> If we call ARBT(1), userspace will only receive the keypress and
> userspace will correctly handle the devices.
>
> That's why I suggested the use of a kernel parameter. It was just a w=
ay
> to allow users to choose one mode over another when they know they're
> both available. It's not something users are required to do.
>
> I believe that in the end what really matters is that when function
> keys are pressed something happens, be it the BIOS turning off radio
> devices or the kernel telling userspace to do it, but not both.
>
>> Darren, I do not know what is better, but it looks like that some de=
ll
>> machines working fine now and some not (since begining). And after
>> loading this driver some machines are fixed, but some which worked a=
re
>> broken... What do you think as maintainer?



--=20
Cheers,
Alex Hung
