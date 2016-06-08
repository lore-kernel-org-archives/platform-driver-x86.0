From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Wed, 8 Jun 2016 12:44:44 +0200
Message-ID: <0d5a8762-b849-41c6-bfe5-e00da25d26d5@gmail.com>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <1463916983-12562-4-git-send-email-pali.rohar@gmail.com>
 <79752a4a-22b0-13ec-721c-d92b5dfd46e1@gmail.com>
 <20160607230008.GQ29844@pali>
 <01b8e172bca546728b596c8cc4ebd932@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36112 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932250AbcFHKos (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2016 06:44:48 -0400
In-Reply-To: <01b8e172bca546728b596c8cc4ebd932@ausx13mpc124.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@Dell.com, pali.rohar@gmail.com
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, kernel@kempniu.pl, luto@kernel.org, alex.hung@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/06/2016 08:02, Mario_Limonciello@Dell.com wrote:
>> -----Original Message-----
>> From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
>> Sent: Tuesday, June 7, 2016 6:00 PM
>> To: Gabriele Mazzotta <gabriele.mzt@gmail.com>; Limonciello, Mario
>> <Mario_Limonciello@Dell.com>
>> Cc: Matthew Garrett <mjg59@srcf.ucam.org>; Darren Hart
>> <dvhart@infradead.org>; Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu=
=2Epl>; Andy Lutomirski
>> <luto@kernel.org>; Alex Hung <alex.hung@canonical.com>; platform-dri=
ver-
>> x86@vger.kernel.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI e=
vent
>> codes
>>
>> On Friday 27 May 2016 00:04:23 Gabriele Mazzotta wrote:
>>> On 22/05/2016 13:36, Pali Roh=C3=A1r wrote:
>>>> ACPI DSDT tables have defined other WMI codes, but does not contai=
n
>>>> any description when those codes are emitted. Some other codes can
>>>> be found in logs on internet. In this patch are all which I saw, b=
ut
>>>> lot of them are not tested properly (e.g. for duplicate events wit=
h
>>>> AT keyboard). Now we have all WMI event codes at one place and in
>>>> future after proper testing those codes can be correctly enabled o=
r
>> disabled...
>>>>
>>>> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>>>> ---
>>>>  drivers/platform/x86/dell-wmi.c |   32
>> ++++++++++++++++++++++++++++++++
>>>>  1 file changed, 32 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/dell-wmi.c
>>>> b/drivers/platform/x86/dell-wmi.c index 363d927..7aac1dc 100644
>>>> --- a/drivers/platform/x86/dell-wmi.c
>>>> +++ b/drivers/platform/x86/dell-wmi.c
>>>> @@ -110,6 +110,9 @@ static const struct key_entry
>> dell_wmi_legacy_keymap[] __initconst =3D {
>>>>  	/* BIOS error detected */
>>>>  	{ KE_IGNORE, 0xe00d, { KEY_RESERVED } },
>>>>
>>>> +	/* Unknown, defined in ACPI DSDT */
>>>> +	/* { KE_IGNORE, 0xe00e, { KEY_RESERVED } }, */
>>>> +
>>>
>>> I'm interested in knowing what's the meaning of this 0xe00e. This
>>> event is sent multiple times when I suspend/resume my laptop and it=
's
>>> definitely not a keypress.
>>
>> From DSDT dumps which I have seen, I guess it could be something wit=
h battery
>> charging... but that is only my guess.
>>
>> Mario, do you have any idea, what these unknown events are?
>=20
> Off-hand I'm not sure, it would require some more digging.
>=20
> Can you please remind me what model numbers and BIOS combinations you=
 have=20
> found e00e in DSDT and what context the events are actually happening=
?  =20
> Anything released in the past two years?
>=20

XPS13 9333, BIOS A07.

I think I saw the event only after resuming from suspend and
it's sent four times in a row.

As Pali says, it seems to be related to the battery. There are
three _Qxx ACPI methods in my DSDT sending this event: one stops
battery charging, one detaches the battery and the last one stores
a value on the GNVS.
