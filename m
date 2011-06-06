From: Javier Achirica <achirica@gmail.com>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Mon, 6 Jun 2011 09:41:24 +0200
Message-ID: <BANLkTi=szZifnDJcfkDJpxcEuL+FY2B5iA@mail.gmail.com>
References: <4DE8FC4A.9010401@absence.it>
	<4DE93AC0.3000506@absence.it>
	<20110605053110.GA21142@kamineko.org>
	<4DEC0186.5010209@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:52430 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014Ab1FFHlZ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Jun 2011 03:41:25 -0400
Received: by wwa36 with SMTP id 36so3498181wwa.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jun 2011 00:41:24 -0700 (PDT)
In-Reply-To: <4DEC0186.5010209@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Mattia Dongili <malattia@linux.it>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Mon, Jun 6, 2011 at 12:21 AM, Marco Chiappero <marco@absence.it> wro=
te:
> Il 05/06/2011 07:31, Mattia Dongili ha scritto:
>>
>> To my understanding, SNC will receive GPEs in two cases under manage=
d
>> mode:
>> =A01. when the user request a backlight change via the standard acpi=
_video
>> =A02. when ambient light changes
>
> Right, more in detail:
>
> When managed mode is set to 1, automatic backlight is desired by the =
user
> and a userspace tool is supposed to take control of every backlight c=
hange,
> to be applied via als_backlight node (which offers a fine grain backl=
ight
> control for smooth transitions). It will receive two different types =
of ALS
> events, depending on the source of the event, as you said: 1 - ambien=
t light
> change 2 - backlight change request via backlight device (in linux, t=
he
> standard acpi_video backlight device). When either of the two events =
occurs,
> this software will calculate a new backlight level (using a model spe=
cific
> formula) and set it by writing in the als_backlight file mentioned ea=
rlier.
> (NOTE: this is how the hardware has been designed and it supposed to =
work
> even though workarounds are possible).
>
> When managed mode is set to 0, no automatic backlight control is requ=
ested
> by the user and no userspace software is doing any backlight regulati=
on
> based on the ALS readings. This implies that no ALS events are genera=
ted
> (regardless the source) and the standard ACPI =A0backlight methods (u=
sed by
> the acpi_video backlight device) will work properly as usual.
>
>> In both cases your code sends an acpi event to userspace. Let alone =
the
>> acpi event discussion that belongs to another thread, why aren't we
>> just setting the requested brightness?
>
> Simply because any calculation can be done in userspace, but if we ca=
n
> include the calculation stuff inside the driver, then we can get rid =
of the
> daemon, everything will be easier and we can avoid the als_backlight =
file
> too. Is it possible? The formulas are a bit complex but just a few li=
nes of
> code, while the keyboard backlight based on the ambient light is just=
 a
> matter of a threshold check.

It bothers me a bit that due to the fact that Sony implemented complex
formulas using floating point arithmetic, that would require us to use
floating point within the kernel. In fact in Sony Windows drivers
everything is done in user-space. Hiding the calculation of the lux
values and handling interrupt set-up in the kernel seems like a good
thing, but moving all management there, not.

=46rom what I'm researching, in newer models, brightness and backlight
calculation are also related to power status and other aspects, so
putting that into a driver will generate lots of dependencies.

Javier
