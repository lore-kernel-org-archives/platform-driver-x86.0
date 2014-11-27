From: Alex Hung <alex.hung@canonical.com>
Subject: Re: New dell-wireless driver
Date: Thu, 27 Nov 2014 12:27:01 +0800
Message-ID: <CAJ=jquYg88aoTW1RA7gRVmA8FQOJ7zU6DC2-sL9KAfzLT4afkA@mail.gmail.com>
References: <201411222345.08384@pali>
	<20141122020906.GB24951@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:60237 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753528AbaK0E1C convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Nov 2014 23:27:02 -0500
Received: by mail-qc0-f180.google.com with SMTP id i8so3120124qcq.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2014 20:27:01 -0800 (PST)
In-Reply-To: <20141122020906.GB24951@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Sat, Nov 22, 2014 at 10:09 AM, Darren Hart <dvhart@infradead.org> wr=
ote:
> On Sat, Nov 22, 2014 at 11:45:08PM +0100, Pali Roh=C3=A1r wrote:
>> Hello,
>>
>> I saw dell-wireless driver on platform-driver-x86 mailinglist [1]
>> which using DELLABCE acpi device and I do not like some parts in
>> this driver.
>
> Hi Pali,
>
> Thanks for reviewing and speaking up :)
>
>>
>> First is that this driver export rfkill event as keypress which
>> is also reported to userspace by keyboard controller. So then
>> userspace receive two rfkill keypresses.
>
> Alex, can you comment? Does the keyboard controller also see this eve=
nt?
>
Hi Darrent and Pali,

The internal KBC needs not to send any events in addition to the ACPI
event Notify(RBTN, 0x80) according to the information I received from
Dell. I did not received the same event on the Dell systems I tested.

Can I have more detailed information of the system and I can ask Dell
for clarifications.

>>
>> Second is that DELLABCE acpi device can also control "soft"
>> rfkill status and this driver does not enable it because it use
>> input class instead rfkill.

Yes DELLABCE could have a rkfkill device that providing soft-block
interface; however, I did not see the benefit of introducing the extra
interfaces when one is sufficient.

Prior to Windows 8, each OEM has wireless interfaces of its own.
Microsoft introduces standard wireless interfaces and OEM starts to
drop OEM's interfaces.

I  used the same philosophy and remove rfkill devices if they do not
add extra benefits, especially inconsistency between rfkill devices
can and does causes problems according to past experiences.

>>
>> Anyway I have unfinished my version of DELLABCE acpi driver which
>> will use rfkill interface and plus allow to use hw switch events
>> in dell-laptop.ko driver.
>
> Is this something that could be applied incrementally fo Alex's drive=
r, or is it
> something we'd be best starting over with?
>
> We have some precedent for input drivers (there is one nearly identic=
al to the
> dell driver for hp, also by Alex). Using rfkill does seem like the be=
tter
> approach without digging into it.
>
>>
>> Currently dell-laptop.ko driver is using i8042 hook function for
>> detecting hw switch key press event. It is needed to detect if
>> rfkill state was changed or not.
>>
>> My prepared patches for dell-laptop.ko allows to use acpi event
>> from DELLABCE driver, so i8042 hook function can be dropped.
>> Really it is not good idea to pass every PS/2 data from both
>> keyboard, touchpad and trackpoint to dell-laptop driver and if
>> there is alternative (DELLABCE) it is better to use it.
>>
>> But now I would like to hear what do you think about it.
>>
>> Because only one kernel driver can attach to DELLABCE acpi
>> device, I cannot use new dell-wireless driver. And I think only
>> one driver can hit mainline kernel.
>
> I would like to see your patch, it sounds like it might be a better o=
ption.
>
> --
> Darren Hart
> Intel Open Source Technology Center



--=20
Cheers,
Alex Hung
