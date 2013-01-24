From: Benoit Gschwind <gschwind@gnu-log.net>
Subject: Re: apple_gmux bug
Date: Thu, 24 Jan 2013 09:16:15 +0100
Message-ID: <5100EDCF.1040208@gnu-log.net>
References: <CABcS5h0iKuJ_wR1N+7e1J6U=M_7HaU6a+bKpzKkRxu-m7zkdnQ@mail.gmail.com> <5100ED34.4040400@gnu-log.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38303 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751777Ab3AXIQT convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Jan 2013 03:16:19 -0500
In-Reply-To: <5100ED34.4040400@gnu-log.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rolando Martins <rolando.martins@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>

Hello Rolando,

I found that if you turn you computer in stanby (suspend to RAM) and=20
turn it on again, gmux work again.

I didn't found a way ot enable this behaviour at boot.

Best regards

Le 24/01/2013 09:13, Benoit Gschwind a =E9crit :
> Hello Rolando,
>
> Do you use NVIDIA proprietary driver ?
>
> If this is the case, this explain your issue probably. NVIDIA driver
> seems disable gmux chips.
>
> Best regards.
>
> Le 24/01/2013 06:25, Rolando Martins wrote :
>> Hi,
>> I am currently experienced problems with the apple_gmux driver
>> while using a MBP retina 10,1.
>> System description & behavior:
>> -Ubuntu 13.04 with kernel 3.8-rc4.
>> -dmesg: apple_gmux: Found gmux version 3.2.19 [indexed]
>> -Under /sys/class/backlight I only have gmux_backlight.
>> -Under gmux_backlight both actual and max brightness are equal to 2^=
24
>> =3D 16777216,
>> while brightness value is within [0,1023] (the value can be changed)
>> -The backlight is dimmed throughout the boot process and remains the
>> same,
>> without being possible to adjust it.
>>
>> If the following hack is applied then full brightness can be achieve=
d,
>> however it remains nonadjustable.
>>
>>   #define HACK_VALUE 1023
>>   ...
>>   In gmux_probe() :
>>   ...
>>   props.max_brightness =3D gmux_read32(gmux_data,
>> GMUX_PORT_MAX_BRIGHTNESS);
>>   //hack
>>   props.max_brightness =3D HACK_VALUE;
>>   ....
>>   bdev->props.brightness =3D gmux_get_brightness(bdev);
>>   //hack
>>   bdev->props.brightness =3D HACK_VALUE;
>>
>> Does anybody have a clue to solve this problem?
>>
>> Thanks for the help,
>> Rolando
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> platform-driver-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
