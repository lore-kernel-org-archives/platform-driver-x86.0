From: Benoit Gschwind <gschwind@gnu-log.net>
Subject: Re: apple_gmux bug
Date: Thu, 24 Jan 2013 15:02:21 +0100
Message-ID: <51013EED.5050902@gnu-log.net>
References: <CABcS5h0iKuJ_wR1N+7e1J6U=M_7HaU6a+bKpzKkRxu-m7zkdnQ@mail.gmail.com> <5100ED34.4040400@gnu-log.net> <5100EDCF.1040208@gnu-log.net> <CABcS5h1EVee+RVDr1ebEn6hQDMHq3XdW1wwB0jhnE6bSdoirUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49502 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780Ab3AXOC0 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Jan 2013 09:02:26 -0500
In-Reply-To: <CABcS5h1EVee+RVDr1ebEn6hQDMHq3XdW1wwB0jhnE6bSdoirUQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rolando Martins <rolando.martins@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>

Hello Rolando,

I'm not a specialist about NVIDIA driver, I guess that NVIDIA can fix=20
this issue, but I also guess that Linux on NVIDIA Mac computer is not=20
their priority, we may are very few people (I use macbook pro retina=20
15.5' on linux too). And since issue is not a major issue, because=20
without this fixed you can use you computer, I Think we cannot expect=20
NVIDIA fix this soon.

So to fix this we have to find a work around, but my knowledge are=20
limited :D. Use sun glasses ? :D

=46or final words, if you don't plan to play rich graphical stuff, you =
can=20
use nouveau driver (which do not have this issue). In current=20
development branch, hardware acceleration is enable for GeForce 650M an=
d=20
seems that it will be available for kernel 3.8. note that nouveau=20
support of GeForce 650M accelerated or not is young, probably since=20
kernel 3.7.

Best regards.

Le 24/01/2013 14:37, Rolando Martins a =E9crit :
> Hi Benoit,
> thanks for the quick reply and help.
> Sorry forgot to mention that, yes I am using the Nvidia driver.
> You are right, after suspend it does work.
> Got this message after suspend, "apple-gmux 00:07: System wakeup
> disabled by ACPI"
>
>>> If this is the case, this explain your issue probably. NVIDIA drive=
r
>>> seems disable gmux chips.
> Also right:), if I shutdown and power up, the apple-gmux reports
> device not present.
> But if I do a reboot then it shows up.
>
> We will have to wait for a nvidia patch (while using the proprietary
> driver), right?
>
> Thanks again,
> Rolando
>
> On Thu, Jan 24, 2013 at 3:16 AM, Benoit Gschwind <gschwind@gnu-log.ne=
t> wrote:
>> Hello Rolando,
>>
>> I found that if you turn you computer in stanby (suspend to RAM) and=
 turn it
>> on again, gmux work again.
>>
>> I didn't found a way ot enable this behaviour at boot.
>>
>> Best regards
>>
>> Le 24/01/2013 09:13, Benoit Gschwind a =E9crit :
>>
>>> Hello Rolando,
>>>
>>> Do you use NVIDIA proprietary driver ?
>>>
>>> If this is the case, this explain your issue probably. NVIDIA drive=
r
>>> seems disable gmux chips.
>>>
>>> Best regards.
>>>
>>> Le 24/01/2013 06:25, Rolando Martins wrote :
>>>>
>>>> Hi,
>>>> I am currently experienced problems with the apple_gmux driver
>>>> while using a MBP retina 10,1.
>>>> System description & behavior:
>>>> -Ubuntu 13.04 with kernel 3.8-rc4.
>>>> -dmesg: apple_gmux: Found gmux version 3.2.19 [indexed]
>>>> -Under /sys/class/backlight I only have gmux_backlight.
>>>> -Under gmux_backlight both actual and max brightness are equal to =
2^24
>>>> =3D 16777216,
>>>> while brightness value is within [0,1023] (the value can be change=
d)
>>>> -The backlight is dimmed throughout the boot process and remains t=
he
>>>> same,
>>>> without being possible to adjust it.
>>>>
>>>> If the following hack is applied then full brightness can be achie=
ved,
>>>> however it remains nonadjustable.
>>>>
>>>>    #define HACK_VALUE 1023
>>>>    ...
>>>>    In gmux_probe() :
>>>>    ...
>>>>    props.max_brightness =3D gmux_read32(gmux_data,
>>>> GMUX_PORT_MAX_BRIGHTNESS);
>>>>    //hack
>>>>    props.max_brightness =3D HACK_VALUE;
>>>>    ....
>>>>    bdev->props.brightness =3D gmux_get_brightness(bdev);
>>>>    //hack
>>>>    bdev->props.brightness =3D HACK_VALUE;
>>>>
>>>> Does anybody have a clue to solve this problem?
>>>>
>>>> Thanks for the help,
>>>> Rolando
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe
>>>> platform-driver-x86" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>> platform-driver-x86" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
