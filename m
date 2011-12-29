From: =?ISO-8859-1?Q?Richard_Sch=FCtz?= <r.schtz@t-online.de>
Subject: Re: [PATCH] Platform: samsung-laptop: add DMI information for Samsung
 N150 Plus
Date: Thu, 29 Dec 2011 12:45:52 +0100
Message-ID: <4EFC52F0.1010709@t-online.de>
References: <87ty4ss0z4.fsf@prochyra.name> <CAHR064h7a=RQq=p1J+gKpC5_6ow8ChUFFkC39HwtmerHaMksjw@mail.gmail.com> <87ty4qdpna.fsf@prochyra.name> <20111224142028.GA32171@srcf.ucam.org> <CANq1E4S+Sa1BERtR6aNH-ypRo+oJ1fRXkuVa+tREy5qVodv2pw@mail.gmail.com> <CAHR064jyubYf5d_KekB8+wqmGXcm8v4Gg9jVt3W9Kx_Ljh++GA@mail.gmail.com> <CANq1E4T9LtrBgAxhZAcZZc_gN5yuBm0Yn1ukYiWFvH84hKavBA@mail.gmail.com> <4EFC3FA8.6020401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4EFC3FA8.6020401@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>
Cc: David Herrmann <dh.herrmann@googlemail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Andrzej Prochyra <andrzej@prochyra.name>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Zhang, Rui" <rui.zhang@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Am 29.12.2011 11:23, schrieb Corentin Chary:
> On 12/26/2011 11:22 AM, David Herrmann wrote:
>> On Mon, Dec 26, 2011 at 10:49 AM, Corentin Chary
>> <corentin.chary@gmail.com> wrote:
>>> On Sat, Dec 24, 2011 at 3:28 PM, David Herrmann
>>> <dh.herrmann@googlemail.com> wrote:
>>>> On Sat, Dec 24, 2011 at 3:20 PM, Matthew
>>>> Garrett<mjg59@srcf.ucam.org> wrote:
>>>>> On Sat, Dec 24, 2011 at 02:12:57PM +0000, Andrzej Prochyra wrote:
>>>>>> 'acpi_video0' not functional. Brightness can be controlled throu=
gh
>>>>>> intel_backlight interface. There are 21 brightness levels and th=
e
>>>>>> backlight can be turned off.
>>>>>
>>>>> If acpi_video0 doesn't work then we either need to work out why
>>>>> it's not
>>>>> working or make it vanish completely, so this patch isn't the cor=
rect
>>>>> approach.
>>>>
>>>> Just to make clear, intel_backlight isn't working properly either.=
 If
>>>> my laptop boots with backlight at 50% then intel_backlight will on=
ly
>>>> work in the range 0%-50% on my machine. If I use the samsung modul=
e to
>>>> set it to 100% then intel_backlight works correctly in the range
>>>> 0-100% until next reboot/suspend.

The same problem exists on my N145 Plus, too.

>>>> So I'd recommend staying with the samsung module and disabling the
>>>> acpi_backlight entirely. The samsung module is the only backlight
>>>> control which works properly.
>>>
>>> Can I take a look at the DSDT to see how it's broken ?
>>> If it's really not functional, then it should be added to the
>>> blacklist in video_detect.c
>>
>> Raw and disassembled dsdt is attached.
>
> Took a quick look but didn't find anything obvious. What happens exac=
tly
> with acpi_video0 ?

Either Samsung's ACPI is totally broken [ACPI Warning: _BQC returned an=
=20
invalid level (20110623/video-472)] or they just don't support backligh=
t=20
setting via ACPI at all. Therefore it's implemented in the SABI stuff.=20
So every device that needs SABI should be blacklisted in video_detect.

--=20
Regards,
Richard Sch=FCtz
