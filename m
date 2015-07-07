From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Tue, 07 Jul 2015 13:36:07 -0500
Message-ID: <559C1C17.3060009@dell.com>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl> <20150701105544.GD17577@pali> <20150702204122.GA2610@eudyptula.hq.kempniu.pl> <201507022258.32104@pali> <20150703065244.GA2401@eudyptula.hq.kempniu.pl> <20150703074813.GD1841@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxipps301.us.dell.com ([143.166.148.223]:44691 "EHLO
	ausxipps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933038AbbGGSqa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jul 2015 14:46:30 -0400
In-Reply-To: <20150703074813.GD1841@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?UGFsaSBSb2jDoXI=?= <pali.rohar@gmail.com>, =?UTF-8?B?TWljaGE=?= =?UTF-8?B?xYIgS8SZcGllxYQ=?= <kernel@kempniu.pl>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>
Cc: Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>



On 07/03/2015 02:48 AM, Pali Roh=C3=A1r wrote:
> On Friday 03 July 2015 08:52:44 Micha=C5=82 K=C4=99pie=C5=84 wrote:
>>> Can you write which WMI call needs to be called?
>> Technically, one needs to call method DoBFn (method ID =3D 1) using =
GUID
>> A80593CE-A997-11DA-B012-B622A1EF5492. Though if you look at the ACPI
>> method this GUID maps to (WMBA), you'll notice that the first two
>> arguments passed to it (instance number and method ID) are simply
>> ignored and the only one that matters is the buffer passed (third
>> argument).
>>
>>> Last time when I looked into dell-led.c code it called some WMI
>>> functions which are just re-implementation of SMI based SMBIOS
>>> functions. From information which I have that is just WMI interface=
 for
>>> dell SMBIOS one.
>>>
>>> I already asked Alex and other people for official ACPI/WMI Dell
>>> documentation, so we would be able to solve these hotkey problems o=
nce
>>> and for all, but I did not get anything yet.
>>>
>>> What I found on internet is just this one out-of-dated documentatio=
n:
>>> http://vpsservice1.sampo.com.tw/sampo_update/document/jimmy/ACPI-WM=
I%20.pdf
>>>
>>> I would suggest you to read it (it is not long) to see Dell WMI met=
hods
>>> are just ACPI "wrapper" around Dell SMBIOS (dcdbas.ko driver) used =
by
>>> dell-laptop.ko.
>> Great, thanks. I'll look into it.
>> =20
>>>>  2) Pressing hotkey #3 on a Dell Vostro V131 generates WMI event
>>>> 0xe025, but no keycode. Apparently, Dell XPS L502X generates the
>>>> same WMI event for a hotkey which also generates a keycode [1].
>>>> What's the best way to solve this conflict?
>>>>
>>>> [1] commit f1566f0: "dell-wmi: Add keys for Dell XPS L502X"
>>> Look at dell-wmi.c source code. Which event format is that? New one
>>> (partially described in above PDF document) when dell_new_hk_type i=
s
>>> true? Or old one?
>> Vostro V131 is using the legacy keymap.
>>
>>> Can you please enable pr_debug() in dell-wmi.c and send dmesg outpu=
t
>>> from dell-wmi.ko (specially dell_wmi_notify)?
>> Here's what appears in dmesg after pressing hotkey #3:
>>
>> --------------------------------------------------------------------=
----
>> dell_wmi: Received WMI event (02 00 00 00 25 e0 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00)
>> dell_wmi: Key e025 pressed
>> wmi: DEBUG Event GUID: 9DBB5994-A997-11DA-B012-B622A1EF5492
>> --------------------------------------------------------------------=
----
>>
> It looks like above buffer has format of *new* event (0002 - length o=
f
> event, 0000 - type of event, e025 - data). But when using legacy keym=
ap
> then dell-wmi.c parse events with old format (which means type=3D0000=
 is
> dropped and data=3De025 is translated to some key).
>
> This is even harder as I thought. Looks like big mess and now I would
> say, without documentation for Dell WMI events we are not able to fix
> this correctly without breaking other laptops...
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> CCing kernel Dell developers, can you provide Dell WMI documentation =
for
> events and hotkeys? We have problems with enabling events for additio=
nal
> buttons/keys on Dell laptops and also parsing WMI events which BIOS/A=
CPI
> generates and send to kernel. Please, I really do not know how to how=
 we
> can fix these "hotkey/events" problems.
>
> Something like this document, but updated for new laptops:
> http://vpsservice1.sampo.com.tw/sampo_update/document/jimmy/ACPI-WMI%=
20.pdf
>
> Thanks!
>
I'm unsure how that document ended up on the web, it shouldn't have bee=
n
released in verbose form like that, but aside from that the BIOS
ACPI-WMI interface has not changed since that document was created.=20
There are some other BIOS specs that do refer to a few other things I
should mention though.

You added a patch to look at multiple events in one buffer in November.=
=20
I didn't see anything checking for the type, so here's the detail you
missed:
Word 0 is the length (as you mentioned)
Word 1 is the type.  It can be either :
* 0x0000 meaning one hot key is pressed or an event occured.=20
* 0x000F meaning a sequence of hotkeys are pressed.

e025 is supposed to be translated into "Dell Instant Launch".  This key
is a bit special because the EC can be configured to send programmed
scan codes.  Some other documentation that isn't part of the WMI
documentation does describe more clearly how you can query what is
supported.=20
Query key press simulation capability:
class 4, selector 11.
Arg1=3D0x40.
Res1 value of 0, means success
Res1 value of -1, error
Res1 value of -2, not supported
Res2 bit0 if set means that the EC can send scan codes when Instant
Launch is pressed.

What's probably happening is that  the earlier system doesn't yet
support key press simulation.  You can add a check for it with the abov=
e.

Now as for actually simulating a keypress, it can be programmed using
the following calling interface (on receiving the e025 WMI notification=
).
To actually simulate the keypress:
Arg1=3D0x41
Arg2 Byte [1:0]: Scan code to simulate
Byte [3:2]
* Bit0 - L Alt
* Bit1 - R Alt
* Bit2 - L Ctrl
* Bit3 - R Ctrl
* Bit4 - L Shift
* Bit5 - R shift
* Bit6 - L Win
* Bit7 - R Win
* Bit8 - Fn key
