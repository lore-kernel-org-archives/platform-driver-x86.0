Return-Path: <SRS0=i/bP=C7=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3680C2D0E2
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Sep 2020 10:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59AAE208A9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Sep 2020 10:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W/iwo2rC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgIVKat (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Sep 2020 06:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25902 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726353AbgIVKas (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Sep 2020 06:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600770646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ohOkzQNwxzOWnb277PMtmxGc7cw6FoKlE9qPXZZFmUw=;
        b=W/iwo2rCeuodgPXdwhVqKwU4lrbAB4ioy+ZkC47NN+9IJ2eideKiUSNl1deW7esQvK526a
        fJJj6nhU+83eZTFVcOPAiAVxWT5INJn2xoe14GkwpqauoAu44zveOcorxrv7bVQyBPaO5a
        wQe0tWxamCKhtxx4GEwhUg76M6iFyJI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-OhVJBIwiPAisZSv5uBNb0A-1; Tue, 22 Sep 2020 06:30:44 -0400
X-MC-Unique: OhVJBIwiPAisZSv5uBNb0A-1
Received: by mail-ed1-f72.google.com with SMTP id y21so5546627edu.23
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2020 03:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ohOkzQNwxzOWnb277PMtmxGc7cw6FoKlE9qPXZZFmUw=;
        b=q0M7MFNH+1H/Jy0RYCpB9rcqLgVpySuRqh8SiEBcgS4fYLpkwDEhuL9B/XP7UHFeQc
         kM0TqfxM5NyTYKa9dJazFOIQqoBO1RISDKZpGn35ksnzM1KSJZ7Eh87O/loOtpdXfcQp
         g45Dez+rX34e3adaiSEVqkXqJIx5AhlPnW1/DfLAT3aWEgzrGD09yeBqSIQtk+0g+B93
         ws7bvQECYi6CcxQfBnBOG5oIaOTGW5x1v8S8GsQYPEmKSxTiB/el1cIG/OfOGSe3FCwH
         aldQieIFT5fO1cqXxILNJ2P/XNxoBCJJtNnaF3TXkN7EsizY+PrU4ADEnTB/L7EhW+Vk
         mH3w==
X-Gm-Message-State: AOAM5300vCwYWt0Ij7RLULqqYjVYdZgcWkadyiJqJ07u9tvYairHiMoP
        ppkIEKtPmJwf1RYiouqd8UXJ87p5slqdFLCkk2AVMBoca4KM1OuUuZpg/OOLtKqW7m30Ip+wi1r
        PXanyIgx3V9YeIZnubtGp/+2I0lSP0ONVAQ==
X-Received: by 2002:a17:907:9c3:: with SMTP id bx3mr4144662ejc.164.1600770642934;
        Tue, 22 Sep 2020 03:30:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHrQ2E4dYOEGsMTbu+OfvJZZbogpEU5NBjqN8szMMHY3EBOzu5JWWTPglbcllXIMnHtE5FHQ==
X-Received: by 2002:a17:907:9c3:: with SMTP id bx3mr4144645ejc.164.1600770642666;
        Tue, 22 Sep 2020 03:30:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id m2sm10831355ejo.4.2020.09.22.03.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 03:30:41 -0700 (PDT)
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
To:     Mark Pearson <markpearson@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
 <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
 <9f01ce60a6b3319855f6a26b94af3e5fc6d2595e.camel@redhat.com>
 <6e0409e7-5bc2-4ca6-a0aa-725a9a91aa8d@redhat.com>
 <83694d5164a32d1ce6cdafb9cb73d731ca4b4a78.camel@redhat.com>
 <0577bc9b-aa9f-c4b6-bac6-64325d81eeff@lenovo.com>
 <c06f214d-ca9d-9ca3-236a-82a0bacfb582@redhat.com>
 <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9d473bcb-9773-6ee6-d60c-e180e3bb8e0a@redhat.com>
Date:   Tue, 22 Sep 2020 12:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 7:16 PM, Mark Pearson wrote:
> 
> On 9/17/2020 1:03 PM, Hans de Goede wrote:
>> Hi Mark,
>>
>> On 9/17/20 6:58 PM, Mark Pearson wrote:
>>> On 9/17/2020 10:10 AM, Benjamin Berg wrote:
>>>> Hi,
>>>>
>>>> On Thu, 2020-09-17 at 15:54 +0200, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 9/17/20 3:50 PM, Benjamin Berg wrote:
>>>>>> On Thu, 2020-09-17 at 14:51 +0200, Hans de Goede wrote:
>>>>>>>> Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
>>>>>>>> something to advertise the unavailability of a profile, and the reason
>>>>>>>> for that unavailability.
>>>>>>>
>>>>>>> UGh, do we really need to export this though. We have the lap_mode thing
>>>>>>> already; and that is something which we will need for other reasons in
>>>>>>> the future too. Any UI for selecting performance modes can display a
>>>>>>> warning when lap_mode is true saying that: "The laptop has detected that it
>>>>>>> is sitting on someone's lap and that performance may be limited
>>>>>>> because of this." (feel free to improve the text).
>>>>>>
>>>>>> Well, for dytc_perfmode there are actually always the three states
>>>>>> L/M/H. It just happens that the kernel will write "H*" (was "M*" until
>>>>>> yesterday) when the performance mode is degraded due to lap detection.
>>>>>>
>>>>>> Think of dytc_perfmode as a profile that sets a number of things:
>>>>>>    * Thermal Limits
>>>>>>    * Fan Behaviour
>>>>>>    * possibly more
>>>>>>
>>>>>> While dytc_lapmode will only enforce a change to the thermal limit.
>>>>>> So "performance" (H) is technically a valid mode even when the lap is
>>>>>> detected.
>>>>>>
>>>>>>> I guess we could split the "value" attribute from my reply to Benjamin's
>>>>>>> email into "configured_value" (rw) and "actual_value" (rw) attributes.
>>>>>>> If we have the info we might as well export it I guess,.
>>>>>>
>>>>>> I consider the "*" purely a curtsey to users that read the attribute
>>>>>> directly using e.g. cat to help with the interpretation. It probably is
>>>>>> not interesting to userspace applications/daemons.
>>>>>
>>>>> So if there is a difference between M and H and H* then I think we should
>>>>> just do the KISS thing and only have a single value attribute and in the
>>>>> new interface handle the H* like H (p-p-d can still check the lap_mode
>>>>> attribute to differentiate the 2 if it wants to).
>>>>
>>>> I guess you are saying to drop "H*" and only have "L"/"M"/"H"? If so,
>>>> fine with me, but we probably need that input in reply to
>>>>    https://patchwork.kernel.org/patch/11730133/#23618881
>>>> then :)
>>>>
>>>> In principle it could be useful for userspace to know that performance
>>>> is or would be dramatically impacted. i.e. when dytc_lapmode is 1, then
>>>> you might want to say something like:
>>>>
>>>>    performance states >= 75 are impacted due to "lapmode"
>>>>
>>>> But, not sure if a kernel interface for that is useful or whether we
>>>> should just put that kind of knowledge into userspace.
>>>>
>>>> Benjamin
>>>>
>>> I don't have a strong opinion on this but the kernel driver is already knowledgeable about the quirks of what does and doesn't work on the system so it seems like a good place to have that logic.
>>>
>>> What if we have an API for "configured" and "actual" - and if they differ userspace knows it should figure out why (likely lapmode, but if the HW vendor adds a new setting related to "position of sun in the sky" or "how much money is in your account and can you afford the electricity bill?" that could be added too....)
>>
>> As I understand the problem with the configured and actual value/performance_level ideas is that if I understand things correctly that H* is not the same as M,
>> it behaves close-ish to M because of the lower thermal-limits from lapmode, but if I understood Benjamin correctly is is not exactly the same, so if we were
>> to advertise "M" in the actual_performance_level sysfs-attribute then that would not really be correct ?
>>
> 
> Just a small clarification - in our case High performance is only for deskmode. It drops to Medium in lapmode.
> Medium mode is slightly different in power rating between lap and desk mode (e.g on X1Carbon 14.5W on lap, 15W on desk). I haven't really worried about this in my patch implementation - it's still "medium"
> 
> Does that make it better or more confusing?

I think that calling both medium is fair in this case.

The big question is, do we want to expose that even though the user configured
a performance-profile of high, the user is only getting medium atm because of
reasons?

Note I say "because of reasons" specifically, because things become even more
complicated if we want to spell out the reasons in the sysfs interface too.

I mean high will give different results even when in desk mode, depending
on if there is a cloth on the desk (bad) or if the table is a metal picknick
table full of round holes to drain the rain (allowing more airflow to the
bottom of the laptop) not to mention that the ambient temperature in which
the laptop is used can probably vary from 15 to 35 degrees celcius.

IOW there can be many factors why high may not really lead to high turbo
clocks; or why it leads to higher turbo clocks then normally expected...

I still have the feeling that it would be best to drop the UI requirement
to show being in a degraded performance mode, because the performance
with modern laptops is just very variable and dependent on many factors.

If we drop that UI requirement; then there also is no need to advertise
configured vs actual performance profile in the sysfs interface.

Users who really want to know what is going on will get much more
detailed and useful information when using something like turbostat
(or a UI for that) anyways.

Regards,

Hans

