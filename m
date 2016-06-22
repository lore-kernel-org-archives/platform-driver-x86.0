From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Wed, 22 Jun 2016 16:39:31 +0200
Message-ID: <20d89b56-7633-e695-ef6e-b5a2698184d0@gmail.com>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <01b8e172bca546728b596c8cc4ebd932@ausx13mpc124.AMER.DELL.COM>
 <0d5a8762-b849-41c6-bfe5-e00da25d26d5@gmail.com> <201606152151.07407@pali>
 <efa30ea0242d4d2fa1b1f594b2e238c5@ausx13mpc120.AMER.DELL.COM>
 <20160622075602.GA29844@pali>
 <41f11bb2917349919e0b4eb21fab9a46@ausx13mpc124.AMER.DELL.COM>
 <20160622141239.GG29844@pali>
 <d24c871ec38e4fe2a21b25c16e0ec862@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:37004 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752759AbcFVOjf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 10:39:35 -0400
In-Reply-To: <d24c871ec38e4fe2a21b25c16e0ec862@ausx13mpc124.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@Dell.com, pali.rohar@gmail.com
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, kernel@kempniu.pl, luto@kernel.org, alex.hung@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 22/06/2016 16:21, Mario_Limonciello@Dell.com wrote:
>> -----Original Message-----
>> From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
>> Sent: Wednesday, June 22, 2016 9:13 AM
>> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
>> Cc: gabriele.mzt@gmail.com; mjg59@srcf.ucam.org; dvhart@infradead.or=
g;
>> kernel@kempniu.pl; luto@kernel.org; alex.hung@canonical.com; platfor=
m-
>> driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI e=
vent
>> codes
>>
>> On Wednesday 22 June 2016 13:40:57 Mario_Limonciello@Dell.com wrote:
>>>>> You aren't seeing this on the DSDT of your Latitude right?
>>>>
>>>> Yes, I do not see it on Latitude.
>>>
>>> Thanks, the usage of this scan code is specific to consumer BIOSes.
>>>
>>>>
>>>>> Gabriele,
>>>>>
>>>>> Your machine is from the year before XPS switched over to running=
 the
>>>>> Dell business client (eg Latitude, Precision, Optiplex) BIOS.
>>>>>
>>>>> The EC in that machine does have support for "Battery Health" via=
 that
>>>>> scancode.  On Windows it's used for relaying battery information =
to an
>>>>> application called Quick Set.
>>>>
>>>> Do you have some details when it is send to OS? And how to read th=
at
>> that
>>>> "battery health"?
>>>
>>> When a battery is removed or inserted this event is supposed to be
>> received
>>> by quickset over WMI and then Quickset will re-read battery informa=
tion.
>>
>> So event is sent only if battery is removed or inserted?
>>
>=20
> Yeah, that's what my spec says, I haven't tested this on actual syste=
m to see.
>=20
> I'm guessing what's going on is that during suspend ACPI battery drop=
s
> off system and comes back up on resume.
>=20
> Maybe Gabriele can comment if any other times were noticed, but in an=
y
> case I think it's appropriate for dell-wmi driver when receiving this=
 on WMI
> to not do anything.  Sending KEY_BATTERY would be wrong behavior.

I think I saw the event only after resume, but I don't read my dmesg
that often to notice other special cases. Surely it's not related to
any hotkey nor actual battery removal.

=46YI I have a "battery button" and the associated code is 0xe007. I
guess most of the laptop nowadays use that code for QuickSet, given
that the entry for it was added to dell-wmi.c back in 2009.

I would also like to remind that my laptop receives four WMI events
with code 0xe00e after resume. If we send an input event for each
WMI event with code 0xe00e, I'd get four bogus button keypresses.
