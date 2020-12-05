Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B03C4361A
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Dec 2020 18:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A682230FD
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Dec 2020 18:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgLESvp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Dec 2020 13:51:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53373 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726125AbgLESvl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Dec 2020 13:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607194214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ms+pdl0hq+SwhTItpapTEXDHih6f+g11JxtouZdOXjg=;
        b=WELOQW8J9Ddg7qU7Fvg4TTTP9UTaFRZqwOiK0ZgI8rWR4Gmc8y25zb5C33+1K1XvUZF39B
        05q4YzSYsL1Kdwt7ON97I/qBjt23ETF0hiUAHpAlrN1IPOg7kiaFby6PKNXk0RxGOSiqbj
        cb1MGoVr9/BLGohMVFIQYcA/Uvn7KgA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-l7XTLj_qNha0GjByJECgiA-1; Sat, 05 Dec 2020 13:50:12 -0500
X-MC-Unique: l7XTLj_qNha0GjByJECgiA-1
Received: by mail-ed1-f71.google.com with SMTP id cq17so305448edb.17
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Dec 2020 10:50:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ms+pdl0hq+SwhTItpapTEXDHih6f+g11JxtouZdOXjg=;
        b=ugIt4HvxEszxPzsXo8XcaFtSU7s1gBI9KCcf4znO5vflck7DO5CmbAjCdd8iBECsnB
         azo7cnmZnMdc2rGn75gj7VA7q8S4R51STVLi9QAPh49NLpNjCGfmJzrM1mNRcgAiGU33
         bIDPGHJX/QteZ0yKFCY1yzxe4rRzHgxdzhsn6uYugbYAnbGCWR5lLDIHTEhJowGBlQoc
         x59dnwP2r7SFGvvlpHm5i+oKVLyGmYycN4pm8Mrtm/f5kY7ZnoGhr8yxn6xkOThZ634X
         ftrSHTB48CKLTg0zP8PSruxJdPgwxAXvqI0TEmjPA7w+6HJ6q9XbnStj3gRMbR/Rg29K
         8/8A==
X-Gm-Message-State: AOAM531Ik0UIw0ZlAplCLvVEJb4CIw64BYUT4BNXolqvmFfm0vFjnXKZ
        Q6ayp73sk0YRNa6heEosujPuNi3crZqJvU3xRsW5ukFIYhaJSW8FxNZ+4vh+ULCIND05D1bwwsK
        XS48usZ6YO8RZfxjh0g/KNVHht4HJmU1PVImAV4GJvgw0IU86WByRwGMHwg1AEG2YmBMJqW6JSG
        pjxMJczCrJig==
X-Received: by 2002:a17:906:1481:: with SMTP id x1mr12464935ejc.186.1607194210987;
        Sat, 05 Dec 2020 10:50:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhQzv/v3TYRWSwYN1GCOEVBq38ljca5nQ52gokQQjIGfUuiSDSEuTjZvx6KgOoLXlamcSTwA==
X-Received: by 2002:a17:906:1481:: with SMTP id x1mr12464921ejc.186.1607194210692;
        Sat, 05 Dec 2020 10:50:10 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id z26sm6213599edl.71.2020.12.05.10.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Dec 2020 10:50:10 -0800 (PST)
Subject: Re: HP Zbook studio G5 Brightness and mic mute keys give same
 scancode
To:     Friso Smit <thestroyer@cock.li>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <d2753cb4ca4d0d819d5a76b0a076e281@cock.li>
 <CAHp75VfTXieJws5gB70L5grsc0f_SFo+sNv1ySmt37aOUa6TmA@mail.gmail.com>
 <97c507c1-21a9-2b77-5d07-09cfcd93ca39@redhat.com>
 <1dbe090f-03c4-f003-6c38-c139c38313e2@cock.li>
 <52f754d9-f4c4-9a5b-82b4-6d6878a94eec@redhat.com>
 <0270fc83-7142-917b-f4bb-0ee214de9dcd@cock.li>
 <66bfa5e2-df5f-c004-f50e-4894bfdd3c46@redhat.com>
 <d5d7a276-c897-8951-9502-e8c2b49b63c2@cock.li>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bd23588b-7c3e-b5e2-3ce6-74c92ec5a9bd@redhat.com>
Date:   Sat, 5 Dec 2020 19:50:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d5d7a276-c897-8951-9502-e8c2b49b63c2@cock.li>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/5/20 7:21 PM, Friso Smit wrote:
> Hi,
> 
> 
>> On 12/4/20 2:05 PM, TheStroyer wrote:
>>> So we're back where we started I guess.
> 
> Correction, there is something different this time around. Last time there
> 
> were other keys that had the same scan codes as each other. They are still
> 
> working now. This results in a win of four keys, yay.
> 
>> Interesting, this sounds as if Windows is doing something which causes them to
>> all send the same scancode.
> Yeah, but I still cannot say with confidence it's not something else.
>> If the device has a removable battery, or an option in the BIOS to disable the
>> internal battery for long term storage (it will get re-enabled when you plug
>> in a charger then), it would be good if you can either remove the battery or
>> use the BIOS option; and then after that boot directly into Linux. I'm guessing /
>> hoping that that will fix things.
>>
>> This is not really a good / usable workaround but it would be in interesting
>> data point.
>>
>> If the battery is not removable; and there is no BIOS option, you could disable
>> the emergency shutdown on low battery behavior on Linux and let the battery be
>> drained until the battery-management-controller turns the machine off, that
>> hopefully has the same result.
>>
>> Regards,
>>
>> Hans
> 
> Sound like an interesting workaround. Unfortunately there is no BIOS
> 
> option for this and the battery is not easily removable.  I do not want
> 
> to risk damaging my battery as this is a very expensive laptop.

Discharging your battery till the hardware shuts itself off should never
harm the battery, the battery-management-controller will turn off all
power (simulating removing the battery) before the battery discharges
to a level where it can be damaged.  So unless there is some very bad
bug in the hw of your laptop this should be safe to do. Otherwise
the OS hanging while the battery is already low and you are not
present to detect this could also damage the hardware.

With recent Linux distributions you need to disable the upower daemon
(you probably need to mask it in systemd to avoid it being autostarted)
to avoid the auto-shutdown.

Note I completely understand if you still do not want to do this,
I'm just saying that it is not *that* dangerous.

Regards,

Hans




> Thanks
> 
> for the help though. I will update when something interesting happens
> 
> 
> Regards,
> 
> Friso
> 
>>
>>> Best regards,
>>>
>>> Friso
>>>
>>> On 24/11/2020 12:14, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 11/12/20 7:25 PM, Friso Smit wrote:
>>>>> Hi,
>>>>>
>>>>> I'm not sure if you have read the previous mails in this thread, but the
>>>>> problem is solved, at least for me, with a bios update.
>>>> At that is good to know.
>>>>
>>>>> I don't know how
>>>>> it works exactly, but all keys produce different scan codes now. Are there
>>>>> still some models where this is a problem?
>>>> Yes this is till a problem on at least the hp-pavilion-cx-0598na, see
>>>> the mail thread starting here:
>>>>
>>>> https://lore.kernel.org/platform-driver-x86/CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com/
>>>>
>>>> I've just asked the reported of that problem to check if there is a BIOS
>>>> update for his system.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>>
>>>>> On 11/9/20 2:44 PM, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 11/5/20 5:47 PM, Andy Shevchenko wrote:
>>>>>>> +Cc: subsystem maintainers
>>>>>>>
>>>>>>> On Sun, May 17, 2020 at 2:24 PM<thestroyer@cock.li>  wrote:
>>>>>>>> Hi,
>>>>>>>> On my HP Zbook studio G5 a few keys on my keyboard give the same
>>>>>>>> scancodes. Most notably, the brightness and mute function keys all give
>>>>>>>> the scan code sequence 0xe0 0x20 0xe0 0xa0 as reported by showkey
>>>>>>>> --scancodes. It only produces a scancode when pressed, not when
>>>>>>>> released. I found another very similar issue in this mailing list found
>>>>>>>> inhttps://www.spinics.net/lists/platform-driver-x86/msg16791.html. The
>>>>>>>> issue in that mail was solved by a bios update. I'm running the latest
>>>>>>>> bios, but I still have the issue.
>>>>>>>> I tried the kernels: Manjaro 5.7rc4-1, Manjaro 5.6.11-1 and Manjaro
>>>>>>>> 5.4.39-1
>>>>>>>> I also tried a few other distributions, but they all have the same
>>>>>>>> issue.
>>>>>>>> I'm happy to provide more information about this issue if needed.
>>>>>> So this already came in another thread for another HP laptop model,
>>>>>> this seems to be a common issue on some (newer?) HP laptop models.
>>>>>>
>>>>>> It seems that we need to make some special WMI calls for this, either
>>>>>> to figure out which key is actually pressed when receiving the
>>>>>> PS/2 scancode which is shared between multiple keys. Or to get the
>>>>>> device to send different scancodes.
>>>>>>
>>>>>> This will require someone with some knowledge of ACPI/WMI as well
>>>>>> as of writing kernel code to get physical access to an affected HP
>>>>>> laptop to figure out what is going on and write some code to deal with
>>>>>> this special setup.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Hans
>>>>>>
> 

