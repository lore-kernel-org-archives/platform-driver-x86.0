Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8598CC4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 13:42:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58305233EA
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 13:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgLGNmH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 08:42:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40671 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726096AbgLGNmG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 08:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607348438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pIW7jnn+qvNT81H7Fude+j/idrprK4rYKqu5djeQ+v4=;
        b=egCOE5dRGDWEntEXuWCIi9PZrETwQBtHl9PxYtzMOGKZAbqaKPywUv6jhf90y8dASb4Wx7
        sYemisLNroZkdYsLuA7B+l+HLBiMvO5nxyvfGEWoQoGPdSxUq2tzLHMxHzc/oxK4kuE6ak
        widvCsWYRc0nPqg2GPNY/B59Dynbw7I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-w6uE-63JMqK_S55jlrSOqQ-1; Mon, 07 Dec 2020 08:40:36 -0500
X-MC-Unique: w6uE-63JMqK_S55jlrSOqQ-1
Received: by mail-ed1-f72.google.com with SMTP id d12so3479552edx.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 05:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pIW7jnn+qvNT81H7Fude+j/idrprK4rYKqu5djeQ+v4=;
        b=HXc+3QDPTuD+CyYt/HTfqLy/aIT8lIBuCo+HX1QnC6XB4b6/mJbRLpBW+I6jW3Wjie
         aOpE0y4Ln3kWrjLE4AEZBAPRws407KO23YDkugywze/dO3ZISvaDbwLy+gRYIQIgx6lM
         ZuawwKMLeF39QkTR+gr4hasxLUvma3V4Qkz1v91fuytKhumH3EOnJlvliNux4kCBHrKB
         Vy2G3TqCJndCbj6oGuMhUdEtXl+0d2bUQlQ2JED+eQOMfqmOSV6VEI6CWEVW69J5pXB+
         gVYMNHxPoajpJ6UdZo6clqZUHGVZjRPfced96HXsGwD2rUPFl5AfkuYkBfoLbCyYq2Oa
         1lYA==
X-Gm-Message-State: AOAM5315t6r85gXuq9e6/jO5BgRDBdX5iyh/hesTAWBsgWqnW2r71aAq
        f2ipTLL7/wSM9qR9wrBVEjqU8XucNsHBNAMgYQHmt4LtT/FIP4RuPh5W0d4BWH6xW13IlZf1kHz
        23143RBUlIrvEd/tHAZG97CjXIyDFzihKjD7F3ek5elF9CIzPYv8zfx23/Q1BlKB3SzhmojCjJR
        6+zdibABtuvg==
X-Received: by 2002:a50:d4cd:: with SMTP id e13mr20023406edj.117.1607348434963;
        Mon, 07 Dec 2020 05:40:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwa2gJkTcFP01/ZLmFZg1lVM2MQwOVtYV/y/TsDOiKJLIY+54KDliw3oWHUKT/TmyJtbyskYA==
X-Received: by 2002:a50:d4cd:: with SMTP id e13mr20023386edj.117.1607348434654;
        Mon, 07 Dec 2020 05:40:34 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id g9sm13481858edw.67.2020.12.07.05.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 05:40:33 -0800 (PST)
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
 <bd23588b-7c3e-b5e2-3ce6-74c92ec5a9bd@redhat.com>
 <230c6976-c3f8-865f-f2b9-82d7de03e07f@cock.li>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e403834f-352f-438c-135e-7ca063bbf3b0@redhat.com>
Date:   Mon, 7 Dec 2020 14:40:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <230c6976-c3f8-865f-f2b9-82d7de03e07f@cock.li>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/7/20 2:23 PM, Friso Smit wrote:
> On 12/5/20 7:50 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 12/5/20 7:21 PM, Friso Smit wrote:
>>> Hi,
>>>
>>>
>>>> On 12/4/20 2:05 PM, TheStroyer wrote:
>>>>> So we're back where we started I guess.
>>> Correction, there is something different this time around. Last time there
>>>
>>> were other keys that had the same scan codes as each other. They are still
>>>
>>> working now. This results in a win of four keys, yay.
>>>
>>>> Interesting, this sounds as if Windows is doing something which causes them to
>>>> all send the same scancode.
>>> Yeah, but I still cannot say with confidence it's not something else.
>>>> If the device has a removable battery, or an option in the BIOS to disable the
>>>> internal battery for long term storage (it will get re-enabled when you plug
>>>> in a charger then), it would be good if you can either remove the battery or
>>>> use the BIOS option; and then after that boot directly into Linux. I'm guessing /
>>>> hoping that that will fix things.
>>>>
>>>> This is not really a good / usable workaround but it would be in interesting
>>>> data point.
>>>>
>>>> If the battery is not removable; and there is no BIOS option, you could disable
>>>> the emergency shutdown on low battery behavior on Linux and let the battery be
>>>> drained until the battery-management-controller turns the machine off, that
>>>> hopefully has the same result.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>> Sound like an interesting workaround. Unfortunately there is no BIOS
>>>
>>> option for this and the battery is not easily removable.  I do not want
>>>
>>> to risk damaging my battery as this is a very expensive laptop.
>> Discharging your battery till the hardware shuts itself off should never
>> harm the battery, the battery-management-controller will turn off all
>> power (simulating removing the battery) before the battery discharges
>> to a level where it can be damaged.  So unless there is some very bad
>> bug in the hw of your laptop this should be safe to do. Otherwise
>> the OS hanging while the battery is already low and you are not
>> present to detect this could also damage the hardware.
>>
>> With recent Linux distributions you need to disable the upower daemon
>> (you probably need to mask it in systemd to avoid it being autostarted)
>> to avoid the auto-shutdown.
>>
>> Note I completely understand if you still do not want to do this,
>> I'm just saying that it is not *that* dangerous.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> Thanks
>>>
>>> for the help though. I will update when something interesting happens
>>>
>>>
>>> Regards,
>>>
>>> Friso
>>>
>>>>> Best regards,
>>>>>
>>>>> Friso
>>>>>
>>>>> On 24/11/2020 12:14, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 11/12/20 7:25 PM, Friso Smit wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> I'm not sure if you have read the previous mails in this thread, but the
>>>>>>> problem is solved, at least for me, with a bios update.
>>>>>> At that is good to know.
>>>>>>
>>>>>>> I don't know how
>>>>>>> it works exactly, but all keys produce different scan codes now. Are there
>>>>>>> still some models where this is a problem?
>>>>>> Yes this is till a problem on at least the hp-pavilion-cx-0598na, see
>>>>>> the mail thread starting here:
>>>>>>
>>>>>> https://lore.kernel.org/platform-driver-x86/CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com/
>>>>>>
>>>>>> I've just asked the reported of that problem to check if there is a BIOS
>>>>>> update for his system.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Hans
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>> On 11/9/20 2:44 PM, Hans de Goede wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 11/5/20 5:47 PM, Andy Shevchenko wrote:
>>>>>>>>> +Cc: subsystem maintainers
>>>>>>>>>
>>>>>>>>> On Sun, May 17, 2020 at 2:24 PM<thestroyer@cock.li>  wrote:
>>>>>>>>>> Hi,
>>>>>>>>>> On my HP Zbook studio G5 a few keys on my keyboard give the same
>>>>>>>>>> scancodes. Most notably, the brightness and mute function keys all give
>>>>>>>>>> the scan code sequence 0xe0 0x20 0xe0 0xa0 as reported by showkey
>>>>>>>>>> --scancodes. It only produces a scancode when pressed, not when
>>>>>>>>>> released. I found another very similar issue in this mailing list found
>>>>>>>>>> inhttps://www.spinics.net/lists/platform-driver-x86/msg16791.html. The
>>>>>>>>>> issue in that mail was solved by a bios update. I'm running the latest
>>>>>>>>>> bios, but I still have the issue.
>>>>>>>>>> I tried the kernels: Manjaro 5.7rc4-1, Manjaro 5.6.11-1 and Manjaro
>>>>>>>>>> 5.4.39-1
>>>>>>>>>> I also tried a few other distributions, but they all have the same
>>>>>>>>>> issue.
>>>>>>>>>> I'm happy to provide more information about this issue if needed.
>>>>>>>> So this already came in another thread for another HP laptop model,
>>>>>>>> this seems to be a common issue on some (newer?) HP laptop models.
>>>>>>>>
>>>>>>>> It seems that we need to make some special WMI calls for this, either
>>>>>>>> to figure out which key is actually pressed when receiving the
>>>>>>>> PS/2 scancode which is shared between multiple keys. Or to get the
>>>>>>>> device to send different scancodes.
>>>>>>>>
>>>>>>>> This will require someone with some knowledge of ACPI/WMI as well
>>>>>>>> as of writing kernel code to get physical access to an affected HP
>>>>>>>> laptop to figure out what is going on and write some code to deal with
>>>>>>>> this special setup.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>>
>>>>>>>> Hans
>>>>>>>>
> 
> Hi,
> 
> It worked! I looked up a video online and apparently it's not that hard to remove the
> battery. For those reading this who will never boot windows again, just remove the
> battery and re-insert it. In my case (HP Zbook Studio G5) I had to remove the battery
> screws as well to make room for disconnecting the battery. I waited a few minutes for
> any remaining energy to drain and reconnected the battery.
> 
> I booted straight to Linux (with Grub). I noticed the keyboard backlight was turned on
> because of the power disconnect, so that's probably a sign to look if it worked.
> Now my brightness keys work again, and the other special keys still work as well.

Good, so now we know that it is some embedded-controller setting which Windows
(or likely some HP specific sw/drivers under Windows) enables, which is causing
this problem.

> At some point I will probably have to boot into windows again, so can I do something
> before that to get some data out of this?

Nothing comes to mind, but maybe others have some good ideas ?  One thing which you
could do is contact HP about this and see if they are willing to provide some help.

If they can just tell us which WMI method (I'm guessing it is a WMI method) Windows
is calling and what we can do to undo that; or how to receive the events in the same
way Windows is receiving them then that would be helpful.

The other options is some kernel-dev with some ACPI/WMI experience getting their
hands on an affected device and then poke around a bit and hopefully figure out
a solution.

Regards,

Hans

