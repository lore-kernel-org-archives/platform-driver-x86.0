From: Chris Bagwell <chris@cnpbagwell.com>
Subject: Re: [Acpi4asus-user] 1005PE's and backlight controls
Date: Wed, 14 Apr 2010 09:00:16 -0500
Message-ID: <i2tdb599ead1004140700v22d8e0c2ta01d5d130922a075@mail.gmail.com>
References: <y2g3b2dfeb01004131934x67e23d80vc73dfd6d5af133fa@mail.gmail.com>
	 <o2z71cd59b01004132316jd06b2a40m593ee5376e4dfa28@mail.gmail.com>
	 <r2odb599ead1004140624g56c2465qc4aaa3d1ee1c79b3@mail.gmail.com>
	 <p2t71cd59b01004140645v587098bdg2fb3628bcf2a78d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f199.google.com ([209.85.210.199]:62602 "EHLO
	mail-yx0-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755388Ab0DNOAR convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Apr 2010 10:00:17 -0400
Received: by yxe37 with SMTP id 37so72084yxe.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Apr 2010 07:00:16 -0700 (PDT)
In-Reply-To: <p2t71cd59b01004140645v587098bdg2fb3628bcf2a78d3@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Wed, Apr 14, 2010 at 8:45 AM, Corentin Chary
<corentin.chary@gmail.com> wrote:
> On Wed, Apr 14, 2010 at 3:24 PM, Chris Bagwell <chris@cnpbagwell.com>=
 wrote:
>> On Wed, Apr 14, 2010 at 1:16 AM, Corentin Chary
>> <corentin.chary@gmail.com> wrote:
>>> On Wed, Apr 14, 2010 at 4:34 AM, Chris Bagwell <chris@cnpbagwell.co=
m> wrote:
>>>> Hi all,
>>>>
>>>> I've seen the following issue reported on various web pages but no=
t sure if
>>>> it was directly reported.=A0 First up, you guys know about issue w=
ith acpi_osi
>>>> of "Windows 2009" disables eeepc_backend and thats were eeepc_wmi =
comes in.
>>>>
>>>> There is a secondary bug though if you boot with acpi_osi=3D"!Wind=
ows 2009"
>>>> (or "Linux").=A0 The ACPI driver will take control of backlight co=
ntrols with
>>>> Fn-F5/F6.=A0 Those keys will work but has issues with Gnome and ot=
her user
>>>> processes.
>>>>
>>>> Anything that uses any of the /sys/* interfaces to control backlig=
ht do not
>>>> work correctly.=A0 When software cycles threw levels, the behavior=
 is kinda
>>>> odd.=A0 It will cycle each time you dim to something like
>>>> Bright->Dim->Bight->Off->Bright->etc.=A0 Also, Gnome will give no =
feedback
>>>> because eeepc_laptop discards the events and it will not make it t=
o
>>>> /dev/input/event*.=A0 And last, the status of current brightness i=
s never
>>>> updated under /sys/* correctly which confuses Gnome as well.
>>>>
>>>> The secondary work around is to add acpi_backlight=3Dvendor to boo=
t options.
>>>> Then eepc_backlight takes charge and life is good.=A0 Gnome gives =
visual
>>>> feedback and dimmer works as expected.
>>>>
>>>> Baring a firmware fix from Asus, would it be possible to enable so=
me sort of
>>>> backlist for using ACPI backlight support and have 1005P's use eee=
pc_laptop?
>>>>
>>>> Chris
>>>
>>> Hi,
>>> Did you try the eeepc-wmi ? It's the long term solution and it don'=
t need
>>> any extra kernel parameters. Yong Wang just added backlight support=
 to it.
>>>
>>> http://git.kernel.org/?p=3Dlinux/kernel/git/mjg59/platform-drivers-=
x86.git;a=3Dshortlog;h=3Drefs/heads/for_linus
>>>
>>
>> I havent't tried it yet but it looks like it has same issue that
>> eeepc-laptop does. =A0If ACPI reports it handles backlight then
>> eeepc-wmi disables controlling of backlight and I'd get buggy ACPI
>> version.
>>
>> Does Yong happen to be on this email list?
>
> I don't think, but he reads platform-x86 which is now CCed
>
> Are you sure that the backlight behavior is the same with and without
> acpi_osi=3DLinux ?
>

I just retested to be sure and I think this confirms my suspicion that
using eeepc-wmi will not work either for 1005PE's backlights.

I tried no acpi_osi (same as "WIndows 2009" I guess),
acpi_osi=3D"!Windows 2009", and acpi_osi=3D"Linux"... all without
specifying acpi_backlight=3Dvendor.  They all had the same behaviour.
The later two options allow eeepc-laptop to load and it always gives
message about ACPI controlling backlight.

You can see bad behaviour easiest by using Gnome's Preferences->Power
Management and controlling dimmer.  Sliding between 0% and 100% gives
seemingly random behaviour.  Anything software based acts bad.

Since ACPI did seem to be controlling backlight when I didn't specify
an acpi_osi, I suspect that means eeepc-wmi's logic to disable
backlight support would be invoked for 1005PE's.

Chris
--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
