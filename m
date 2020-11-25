Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7621EC56202
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 10:30:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B935206E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 10:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BnJODXu6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgKYKae (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Nov 2020 05:30:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28850 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725838AbgKYKae (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Nov 2020 05:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606300232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OEb4peLN5thE1iZl/KkseDlw/9aLwHd/u6A1/kMBRVs=;
        b=BnJODXu6IKAw2PWxHtriIF1Fk82D2x/gL5GRA/OQQFNJQC5hDEQdh5Dt5B+76aRU4fs3mm
        nGkyH4wi7oP2MEMnQ6hzR9KZ7TPS7s+hp0pbJAkBH7fK+bSQsww8prk5dz2oGPs2Ep8L/D
        V+BlKNbWQzuqXFT7KwHhaf4tntPW/pM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-91k7o11LMyuHj3dynSnMEA-1; Wed, 25 Nov 2020 05:30:30 -0500
X-MC-Unique: 91k7o11LMyuHj3dynSnMEA-1
Received: by mail-ej1-f72.google.com with SMTP id gr9so656418ejb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2020 02:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OEb4peLN5thE1iZl/KkseDlw/9aLwHd/u6A1/kMBRVs=;
        b=i1s5ZcaD2Wl6gQL9+/m41Vz/ws2ETkMzVKgdhzbfFLRPZF7PTFuH3dUZ70kYqg3CI9
         bClPs+afX7emnQdpuUk32bWmxdLPNlAimuVVqngXyhv4FSv42wSbytccXoOcF1c2+CSR
         4FfJSwoSHh3UVPmRqOQtQT4jYY0drSRKSBFJam4D1OAwe8KHNgbTrGWtbgjOk72TvO1F
         fvlbbO1NectZYaoHq4JU8dudRp49fhGmoUtMqZsBagHoiSsmWIQEIQ5clPamNWxVCOga
         COAB4YWFR9VrFFfeu3DrotaDdUGa37D1+ep9JCoC4Asp4AYcfpaSwrsACx2ATtLsHODI
         0c9w==
X-Gm-Message-State: AOAM532n7RH5tlWQAnJ0NhzYuoqGrKscLq2WjGlOWbDYRQamybOmFoC3
        RRAckucehlAawNuM5qlKSpex3zN/BnD2hxS0WmkR53y41knScFlFrogRzV2PAWtUu/eYO5woIlx
        yyV9028kzIaCOeQJZm/Vimau0yB+su5w2ng==
X-Received: by 2002:a17:906:4dd4:: with SMTP id f20mr2527493ejw.94.1606300229126;
        Wed, 25 Nov 2020 02:30:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz93m8vrJrLo97PhMDnNHscEyZ2VM/5QJxMrIF6doCd5ej3QRoY053cwgAiP2zYUXZER8SABA==
X-Received: by 2002:a17:906:4dd4:: with SMTP id f20mr2527475ejw.94.1606300228919;
        Wed, 25 Nov 2020 02:30:28 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id a26sm973688edt.74.2020.11.25.02.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 02:30:28 -0800 (PST)
Subject: Re: Asus Zephyrus G14 GA401IH-HE003 problem with sound and fan
To:     Mamchyts Dmitry <mamchyts@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        andriy.shevchenko@linux.intel.com
References: <CAC+zXp_w2T5BYvzC+rF+7LGsgn64+9rLt8BT-=X2XE7qKqG=QQ@mail.gmail.com>
 <0c2fd9aa-7af4-5adb-ae6d-923c5eefb0b8@redhat.com>
 <CAC+zXp9LpSqTBBCwOVbxK0VUjvyk3H4PU6jnqJSwx8v_O5g3xg@mail.gmail.com>
 <d9c16af8-5cbb-55cf-089a-158986734937@redhat.com>
 <CAC+zXp99B=J_qqCnP=xdzJpDDrDDWi6PzDQHwSMb-yi7jX0=xA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e9e52ecc-9ec2-3b51-67e7-32d57b24ad33@redhat.com>
Date:   Wed, 25 Nov 2020 11:30:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAC+zXp99B=J_qqCnP=xdzJpDDrDDWi6PzDQHwSMb-yi7jX0=xA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/20 11:23 AM, Mamchyts Dmitry wrote:
> Hi,
> Yes, you are right.
> 
> cat /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable returns 2
> 
> but it's too loud.
> I want to set a lower fan RPM value. 2400 - is too big for me.
> 
> Can I set 2000 or lower?

I'm afraid that manually setting the speed is not possible
(or we don't know how to, since we Asus has not documented their
interfaces for this).

Maybe there is a fan profile selection option somewhere in the
BIOS settings, which influences how aggressive the auto settings
ramp of the fan ?

> PS. When I set 0 into pwm1_enable. Fan speed is near 6000 RPM.

Ok, so that shows that switching between max and auto works, other
then that there is unfortunately little we can do.

Regards,

Hans



> 
> On Wed, Nov 25, 2020 at 1:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11/25/20 10:04 AM, Mamchyts Dmitry wrote:
>>> Hi, general problem with fan - fans run very loud
>>>
>>>   root@ga401ih:/sys/devices/platform/asus-nb-wmi/hwmon/hwmon6# cat fan1_input
>>>   2400
>>>
>>> But all sensors show temperatures 27-30 C.
>>> So, I want to set  a lower fan speed manually.
>>> Current speed - 2400
>>>
>>>   root@ga401ih:/sys/devices/platform/asus-nb-wmi/hwmon/hwmon6# cat fan1_input
>>>   2400
>>>
>>> Can I set lower fan speed?
>>
>> AFAIK the asus-wmi code sets the mode to auto at probe, you can check by doing:
>>
>> cat /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable
>>
>> That should return "2". If it does not try:
>>
>> echo 2 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable
>>
>> Regards,
>>
>> Hans
>>
>>
>>>
>>>
>>>
>>> On Tue, Nov 24, 2020 at 4:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 11/12/20 8:19 PM, Mamchyts Dmitry wrote:
>>>>> I got an Asus Zephyrus G14 GA401IH-HE003 with AMD Ryzen 7 4800HS and a
>>>>> NVIDIA GeForce GTX 1650.
>>>>> I am use 5.9.8-050908-generic kernel from
>>>>> (kernel.ubuntu.com/~kernel-ppa/mainline/v5.9.8/)
>>>>>
>>>>>     dmamchyts@ga401ih:~$ cat /etc/os-release
>>>>>     NAME="Ubuntu"
>>>>>     VERSION="20.10 (Groovy Gorilla)"
>>>>>
>>>>> I have some problem with sound and fan:
>>>>> The first problem is a sound from notebook speakers: when I use
>>>>> headphones via 3.5 jack - all works fine. I can control sound level
>>>>> (from low to high). But when I try to listen to any sounds from
>>>>> notebook speakers - volume always has a high level (I think it's a max
>>>>> level of notebook speakers sound). I am using KDE, and I hear a sound
>>>>> level of 5% the same as 100%.
>>>>
>>>> Next time please try reporting 1 issue per bug report. The
>>>> platform-driver-x86@vger.kernel.org mailinglist is the right address
>>>> for the fan issue, but for the sound issue you really should send
>>>> a separate bug report to the sound/alsa developers.
>>>>
>>>>> The second problem is a fan speed.
>>>>
>>>> What exactly is the problem with the fan speed ?
>>>>
>>>> <snip>
>>>>
>>>>>     xxx@ga401ih:~/downloads$ ll /sys/class/hwmon/hwmon6/
>>>>>     total 0
>>>>>     drwxr-xr-x 3 root root    0 Nov 12 20:33 ./
>>>>>     drwxr-xr-x 3 root root    0 Nov 12 20:33 ../
>>>>>     lrwxrwxrwx 1 root root    0 Nov 12 20:34 device -> ../../../asus-nb-wmi/
>>>>>     -r--r--r-- 1 root root 4096 Nov 12 20:34 fan1_input
>>>>>     -r--r--r-- 1 root root 4096 Nov 12 20:34 fan1_label
>>>>>     -r--r--r-- 1 root root 4096 Nov 12 20:34 name
>>>>>     drwxr-xr-x 2 root root    0 Nov 12 21:30 power/
>>>>>     -rw-r--r-- 1 root root 4096 Nov 12 21:30 pwm1_enable
>>>>>     lrwxrwxrwx 1 root root    0 Nov 12 21:30 subsystem ->
>>>>> ../../../../../class/hwmon/
>>>>>     -rw-r--r-- 1 root root 4096 Nov 12 20:33 uevent
>>>>
>>>> Ok, so pwmconfig will not work here because there only is a
>>>> pwm1_enable file and not a pwm1 file for controlling the actual
>>>> fan-speed.
>>>>
>>>> This is normal on most newer Asus models you can sat the fan
>>>> to 1 of 2 modes:
>>>>
>>>> 1. fullspeed:
>>>>
>>>> echo 0 > /sys/class/hwmon/hwmon6/pwm1_enable
>>>>
>>>> 2. automatic speed control (the default)
>>>>
>>>> echo 2 > /sys/class/hwmon/hwmon6/pwm1_enable
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>
>>
> 

