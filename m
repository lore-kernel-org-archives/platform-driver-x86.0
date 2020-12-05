Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57168C2BB48
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Dec 2020 18:32:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3318323339
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Dec 2020 18:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbgLEScO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Dec 2020 13:32:14 -0500
Received: from mail.cock.li ([37.120.193.124]:49316 "EHLO mail.cock.li"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726322AbgLEScN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Dec 2020 13:32:13 -0500
From:   Friso Smit <thestroyer@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
        t=1607192455; bh=6xTKuDabffdC9ehrklby+b25lr3FkU15JhR47GAMXtA=;
        h=From:Subject:To:References:Date:In-Reply-To:From;
        b=EzdF3F+YZtXjNZOZp+pwa0LV14vOuiFMgBKnIeaHPFyYeWKY4dY99Ga3fyYp2UYm3
         dLnWJktoC/XhWwkPZQsznVPMSSFkndgbEIl378nk82rN1wwpQiOll5buDkzE9kebdQ
         GRCFuPd+BpeJnCbybWeN+jTlewr/gee8UJW1sW6vxjb0coMn1MJzszqdMPHpnO4PcG
         AgmYz3dQx8Zi8OYwBtbbHcNZ37f/KWpeCjSJXSqSFHBCB4zmeK0BsvXDeNKQQHakES
         jQ76w0oNUZUgxan8FYkAqYijXJtq0BubW/EPi0FbaEwil9HUz/mcwxYb/KhFogz51I
         2aFfUPQz0v0WA==
Subject: Re: HP Zbook studio G5 Brightness and mic mute keys give same
 scancode
To:     Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <d2753cb4ca4d0d819d5a76b0a076e281@cock.li>
 <CAHp75VfTXieJws5gB70L5grsc0f_SFo+sNv1ySmt37aOUa6TmA@mail.gmail.com>
 <97c507c1-21a9-2b77-5d07-09cfcd93ca39@redhat.com>
 <1dbe090f-03c4-f003-6c38-c139c38313e2@cock.li>
 <52f754d9-f4c4-9a5b-82b4-6d6878a94eec@redhat.com>
 <0270fc83-7142-917b-f4bb-0ee214de9dcd@cock.li>
 <66bfa5e2-df5f-c004-f50e-4894bfdd3c46@redhat.com>
Message-ID: <d5d7a276-c897-8951-9502-e8c2b49b63c2@cock.li>
Date:   Sat, 5 Dec 2020 19:21:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <66bfa5e2-df5f-c004-f50e-4894bfdd3c46@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,


> On 12/4/20 2:05 PM, TheStroyer wrote:
>> So we're back where we started I guess.

Correction, there is something different this time around. Last time there

were other keys that had the same scan codes as each other. They are still

working now. This results in a win of four keys, yay.

> Interesting, this sounds as if Windows is doing something which causes them to
> all send the same scancode.
Yeah, but I still cannot say with confidence it's not something else.
> If the device has a removable battery, or an option in the BIOS to disable the
> internal battery for long term storage (it will get re-enabled when you plug
> in a charger then), it would be good if you can either remove the battery or
> use the BIOS option; and then after that boot directly into Linux. I'm guessing /
> hoping that that will fix things.
>
> This is not really a good / usable workaround but it would be in interesting
> data point.
>
> If the battery is not removable; and there is no BIOS option, you could disable
> the emergency shutdown on low battery behavior on Linux and let the battery be
> drained until the battery-management-controller turns the machine off, that
> hopefully has the same result.
>
> Regards,
>
> Hans

Sound like an interesting workaround. Unfortunately there is no BIOS

option for this and the battery is not easily removable.  I do not want

to risk damaging my battery as this is a very expensive laptop. Thanks

for the help though. I will update when something interesting happens


Regards,

Friso

>
>> Best regards,
>>
>> Friso
>>
>> On 24/11/2020 12:14, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 11/12/20 7:25 PM, Friso Smit wrote:
>>>> Hi,
>>>>
>>>> I'm not sure if you have read the previous mails in this thread, but the
>>>> problem is solved, at least for me, with a bios update.
>>> At that is good to know.
>>>
>>>> I don't know how
>>>> it works exactly, but all keys produce different scan codes now. Are there
>>>> still some models where this is a problem?
>>> Yes this is till a problem on at least the hp-pavilion-cx-0598na, see
>>> the mail thread starting here:
>>>
>>> https://lore.kernel.org/platform-driver-x86/CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com/
>>>
>>> I've just asked the reported of that problem to check if there is a BIOS
>>> update for his system.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>>
>>>
>>>> On 11/9/20 2:44 PM, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 11/5/20 5:47 PM, Andy Shevchenko wrote:
>>>>>> +Cc: subsystem maintainers
>>>>>>
>>>>>> On Sun, May 17, 2020 at 2:24 PM<thestroyer@cock.li>  wrote:
>>>>>>> Hi,
>>>>>>> On my HP Zbook studio G5 a few keys on my keyboard give the same
>>>>>>> scancodes. Most notably, the brightness and mute function keys all give
>>>>>>> the scan code sequence 0xe0 0x20 0xe0 0xa0 as reported by showkey
>>>>>>> --scancodes. It only produces a scancode when pressed, not when
>>>>>>> released. I found another very similar issue in this mailing list found
>>>>>>> inhttps://www.spinics.net/lists/platform-driver-x86/msg16791.html. The
>>>>>>> issue in that mail was solved by a bios update. I'm running the latest
>>>>>>> bios, but I still have the issue.
>>>>>>> I tried the kernels: Manjaro 5.7rc4-1, Manjaro 5.6.11-1 and Manjaro
>>>>>>> 5.4.39-1
>>>>>>> I also tried a few other distributions, but they all have the same
>>>>>>> issue.
>>>>>>> I'm happy to provide more information about this issue if needed.
>>>>> So this already came in another thread for another HP laptop model,
>>>>> this seems to be a common issue on some (newer?) HP laptop models.
>>>>>
>>>>> It seems that we need to make some special WMI calls for this, either
>>>>> to figure out which key is actually pressed when receiving the
>>>>> PS/2 scancode which is shared between multiple keys. Or to get the
>>>>> device to send different scancodes.
>>>>>
>>>>> This will require someone with some knowledge of ACPI/WMI as well
>>>>> as of writing kernel code to get physical access to an affected HP
>>>>> laptop to figure out what is going on and write some code to deal with
>>>>> this special setup.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Hans
>>>>>
