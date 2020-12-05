Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CCDC433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Dec 2020 14:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A093923128
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Dec 2020 14:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgLEOy1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Dec 2020 09:54:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50492 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726410AbgLEOva (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Dec 2020 09:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607179803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vGKJpjkhVJnJtgaPHQsNJripImopWq93RUUbZSbzG8Y=;
        b=G8vUJNbzfZevH5XaoTJDOyTPAjx8jhbyP03AsM+93w6ef5+sli+Spw9k+qMKFE/vmiOtyA
        ZKK61D/SS8Ne5nKFLqjheuOJtATYrU8Owa2pX+KOMLAGgxTrsXjY9PRv1dOQyux3e0g7e/
        pFPNdS0YeXkfswxKI4ZEH4KbNe6njIY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-V4gireRzNjmDUds9iW6i8Q-1; Sat, 05 Dec 2020 09:50:01 -0500
X-MC-Unique: V4gireRzNjmDUds9iW6i8Q-1
Received: by mail-ed1-f69.google.com with SMTP id r16so3611595eds.13
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Dec 2020 06:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vGKJpjkhVJnJtgaPHQsNJripImopWq93RUUbZSbzG8Y=;
        b=BQIFq0bQurNYi7qlBWpP4gFZcmfEy1SB2gkQdWEqXrubeKeK7qDXAhzyENk8QYzXl7
         TAm9jzzbp4vGHpetULmFhOiXDQSa9PYBoUiMbT2nCee+3QzM5ey8H6D9wCbY+b68/wqq
         +7OG9ZdSC8POu+oZOJEaogLxnu/tPnMVsc2gli403i7VCq/Uxa9gE03kIXoI4/tksMsQ
         G8nNxLwYiqbJzpwlT/jrDlqQ/nt8H0gU36Sd9SkfyKZMLy6bz8KWQILnGCbrMJ4CIWk6
         2SZeb4yDAscd7vmTZlD3AEZvnnsEhLL3exzYZtQguxb3+OSyrsmnx1k22QD7FSFi2mc5
         gTYQ==
X-Gm-Message-State: AOAM531QV1VZfZXUaGjhK4OqnST5HSaliLlZBtL/tAPpf4CERzDqflpB
        Jx46iZz5L0TM5vmvbfZm2i3RI6bEZlIKiB6DciCESAOswMVjXll4YJXTVgOxD+FS6DmPcwqtq9g
        KOYpNJ7MwuuugyqyFveXwedZsy0NriO1UKmtFgg+n3y7yWLqYgPlMsRjSVzUK4DgDXLQpwQHeI+
        GDzZLT0oFqTw==
X-Received: by 2002:a50:b264:: with SMTP id o91mr12293332edd.7.1607179798828;
        Sat, 05 Dec 2020 06:49:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynKz6vGYjkF9hjysdQNSrhxSH73bOv2AqHrhV4w56F2Kw6MCFxpvvIShlN5Tpn3e358vlifg==
X-Received: by 2002:a50:b264:: with SMTP id o91mr12293317edd.7.1607179798523;
        Sat, 05 Dec 2020 06:49:58 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id da9sm3785874edb.84.2020.12.05.06.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Dec 2020 06:49:57 -0800 (PST)
Subject: Re: HP Zbook studio G5 Brightness and mic mute keys give same
 scancode
To:     TheStroyer <TheStroyer@cock.li>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <d2753cb4ca4d0d819d5a76b0a076e281@cock.li>
 <CAHp75VfTXieJws5gB70L5grsc0f_SFo+sNv1ySmt37aOUa6TmA@mail.gmail.com>
 <97c507c1-21a9-2b77-5d07-09cfcd93ca39@redhat.com>
 <1dbe090f-03c4-f003-6c38-c139c38313e2@cock.li>
 <52f754d9-f4c4-9a5b-82b4-6d6878a94eec@redhat.com>
 <0270fc83-7142-917b-f4bb-0ee214de9dcd@cock.li>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <66bfa5e2-df5f-c004-f50e-4894bfdd3c46@redhat.com>
Date:   Sat, 5 Dec 2020 15:49:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0270fc83-7142-917b-f4bb-0ee214de9dcd@cock.li>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/4/20 2:05 PM, TheStroyer wrote:
> Hi,
> 
> Somewhere between 28-11-2020 and today my brightness hotkeys are broken again. They act as mic mute key again. I don't know if this is caused by the system upgrade or something else. I have used windows for the first time in a while, so that may have sneakily upgraded something.
> 
> I have tried downgrading the packages linux, linux-headers, linux-firmware, systemd and systemd-libs (form Arch Linux) to some older version.
> 
> I also tried updating the bios from the bios screen and updating the firmware from windows device manager. This all didn't change anything.
> 
> So we're back where we started I guess.

Interesting, this sounds as if Windows is doing something which causes them to
all send the same scancode.

If the device has a removable battery, or an option in the BIOS to disable the
internal battery for long term storage (it will get re-enabled when you plug
in a charger then), it would be good if you can either remove the battery or
use the BIOS option; and then after that boot directly into Linux. I'm guessing /
hoping that that will fix things.

This is not really a good / usable workaround but it would be in interesting
data point.

If the battery is not removable; and there is no BIOS option, you could disable
the emergency shutdown on low battery behavior on Linux and let the battery be
drained until the battery-management-controller turns the machine off, that
hopefully has the same result.

Regards,

Hans


> 
> Best regards,
> 
> Friso
> 
> On 24/11/2020 12:14, Hans de Goede wrote:
>> Hi,
>>
>> On 11/12/20 7:25 PM, Friso Smit wrote:
>>> Hi,
>>>
>>> I'm not sure if you have read the previous mails in this thread, but the
>>> problem is solved, at least for me, with a bios update.
>> At that is good to know.
>>
>>> I don't know how
>>> it works exactly, but all keys produce different scan codes now. Are there
>>> still some models where this is a problem?
>> Yes this is till a problem on at least the hp-pavilion-cx-0598na, see
>> the mail thread starting here:
>>
>> https://lore.kernel.org/platform-driver-x86/CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com/
>>
>> I've just asked the reported of that problem to check if there is a BIOS
>> update for his system.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> On 11/9/20 2:44 PM, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 11/5/20 5:47 PM, Andy Shevchenko wrote:
>>>>> +Cc: subsystem maintainers
>>>>>
>>>>> On Sun, May 17, 2020 at 2:24 PM <thestroyer@cock.li> wrote:
>>>>>> Hi,
>>>>>> On my HP Zbook studio G5 a few keys on my keyboard give the same
>>>>>> scancodes. Most notably, the brightness and mute function keys all give
>>>>>> the scan code sequence 0xe0 0x20 0xe0 0xa0 as reported by showkey
>>>>>> --scancodes. It only produces a scancode when pressed, not when
>>>>>> released. I found another very similar issue in this mailing list found
>>>>>> in https://www.spinics.net/lists/platform-driver-x86/msg16791.html. The
>>>>>> issue in that mail was solved by a bios update. I'm running the latest
>>>>>> bios, but I still have the issue.
>>>>>> I tried the kernels: Manjaro 5.7rc4-1, Manjaro 5.6.11-1 and Manjaro
>>>>>> 5.4.39-1
>>>>>> I also tried a few other distributions, but they all have the same
>>>>>> issue.
>>>>>> I'm happy to provide more information about this issue if needed.
>>>> So this already came in another thread for another HP laptop model,
>>>> this seems to be a common issue on some (newer?) HP laptop models.
>>>>
>>>> It seems that we need to make some special WMI calls for this, either
>>>> to figure out which key is actually pressed when receiving the
>>>> PS/2 scancode which is shared between multiple keys. Or to get the
>>>> device to send different scancodes.
>>>>
>>>> This will require someone with some knowledge of ACPI/WMI as well
>>>> as of writing kernel code to get physical access to an affected HP
>>>> laptop to figure out what is going on and write some code to deal with
>>>> this special setup.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
> 

