From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [Acpi4asus-user] 1005PE's and backlight controls
Date: Wed, 14 Apr 2010 15:45:32 +0200
Message-ID: <p2t71cd59b01004140645v587098bdg2fb3628bcf2a78d3@mail.gmail.com>
References: <y2g3b2dfeb01004131934x67e23d80vc73dfd6d5af133fa@mail.gmail.com>
	 <o2z71cd59b01004132316jd06b2a40m593ee5376e4dfa28@mail.gmail.com>
	 <r2odb599ead1004140624g56c2465qc4aaa3d1ee1c79b3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.24]:60171 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755408Ab0DNNpe convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Apr 2010 09:45:34 -0400
Received: by ey-out-2122.google.com with SMTP id d26so40653eyd.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Apr 2010 06:45:32 -0700 (PDT)
In-Reply-To: <r2odb599ead1004140624g56c2465qc4aaa3d1ee1c79b3@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Wed, Apr 14, 2010 at 3:24 PM, Chris Bagwell <chris@cnpbagwell.com> w=
rote:
> On Wed, Apr 14, 2010 at 1:16 AM, Corentin Chary
> <corentin.chary@gmail.com> wrote:
>> On Wed, Apr 14, 2010 at 4:34 AM, Chris Bagwell <chris@cnpbagwell.com=
> wrote:
>>> Hi all,
>>>
>>> I've seen the following issue reported on various web pages but not=
 sure if
>>> it was directly reported.=A0 First up, you guys know about issue wi=
th acpi_osi
>>> of "Windows 2009" disables eeepc_backend and thats were eeepc_wmi c=
omes in.
>>>
>>> There is a secondary bug though if you boot with acpi_osi=3D"!Windo=
ws 2009"
>>> (or "Linux").=A0 The ACPI driver will take control of backlight con=
trols with
>>> Fn-F5/F6.=A0 Those keys will work but has issues with Gnome and oth=
er user
>>> processes.
>>>
>>> Anything that uses any of the /sys/* interfaces to control backligh=
t do not
>>> work correctly.=A0 When software cycles threw levels, the behavior =
is kinda
>>> odd.=A0 It will cycle each time you dim to something like
>>> Bright->Dim->Bight->Off->Bright->etc.=A0 Also, Gnome will give no f=
eedback
>>> because eeepc_laptop discards the events and it will not make it to
>>> /dev/input/event*.=A0 And last, the status of current brightness is=
 never
>>> updated under /sys/* correctly which confuses Gnome as well.
>>>
>>> The secondary work around is to add acpi_backlight=3Dvendor to boot=
 options.
>>> Then eepc_backlight takes charge and life is good.=A0 Gnome gives v=
isual
>>> feedback and dimmer works as expected.
>>>
>>> Baring a firmware fix from Asus, would it be possible to enable som=
e sort of
>>> backlist for using ACPI backlight support and have 1005P's use eeep=
c_laptop?
>>>
>>> Chris
>>
>> Hi,
>> Did you try the eeepc-wmi ? It's the long term solution and it don't=
 need
>> any extra kernel parameters. Yong Wang just added backlight support =
to it.
>>
>> http://git.kernel.org/?p=3Dlinux/kernel/git/mjg59/platform-drivers-x=
86.git;a=3Dshortlog;h=3Drefs/heads/for_linus
>>
>
> I havent't tried it yet but it looks like it has same issue that
> eeepc-laptop does. =A0If ACPI reports it handles backlight then
> eeepc-wmi disables controlling of backlight and I'd get buggy ACPI
> version.
>
> Does Yong happen to be on this email list?

I don't think, but he reads platform-x86 which is now CCed

Are you sure that the backlight behavior is the same with and without
acpi_osi=3DLinux ?


--=20
Corentin Chary
http://xf.iksaif.net
--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
