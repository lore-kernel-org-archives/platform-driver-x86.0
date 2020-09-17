Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F547C43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 14:10:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07232206B6
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 14:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UY/HOrSL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbgIQOKY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 10:10:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27460 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727302AbgIQOF6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 10:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600351496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aoZVGxvCQPeaLhPYq5mZiybm5+QRTn9pATdkZ2lbvYo=;
        b=UY/HOrSLJlVFibHwFzHJzIGAg3vjYaNEb7Hqa3/ajr0zeMBErPWOPE7Ix5OysyrTxjGaDN
        GBHLIubQRU64L/+q+v4JeJ79XJ0EzRcm9k8bYQ7gyAmcOukSX5lRiQVP8JyG+bTWNpXpdt
        R7d73LQnF4byKdVzC6cYp50YTl7tjjk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-e4XWzLPCPkSBN5U2r-RpxQ-1; Thu, 17 Sep 2020 10:04:53 -0400
X-MC-Unique: e4XWzLPCPkSBN5U2r-RpxQ-1
Received: by mail-ej1-f71.google.com with SMTP id dc22so916176ejb.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 07:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aoZVGxvCQPeaLhPYq5mZiybm5+QRTn9pATdkZ2lbvYo=;
        b=CJ8crdRe4DQQVZaTR24C7HAdNogOfxLbScKRE2f5Dl6vu5W1ccc1oSq646F4k4M2fx
         gQcYvd0P+ELh5Gb6/eNjc9NJGgyP7YmfbOtMKeRv4RNqwJ7psuvyo1uh20DdHucq78QI
         KLYI0dqt9MHeVR2vL/2N8S6NncYw/eT7q+RnPouKrANrtA5pramSdL0+SN0GEy22YNWs
         vqKU9tL/jzXSADbg6b9mgk8QrsA7NBa5knFNHRKxuVLFvHQhZXpI7lFNLICeYxnI4UXl
         3++znH5ADakw61hZ4/y6XIy0uoYv0Mkcb5iThjcXwyv8VFNqA49CrFVtQQy8nG19REoO
         rHOw==
X-Gm-Message-State: AOAM5338aZ9FE7dg6K0xhsgqbCcPG8xFJMm9qmZX9WTddQqOLetlJFqe
        NIn0X15soN6Y8zszSHG1s7Ypsv/NGh+vLiWkHhxpbs/bePHRnrWef777T6B5lWvQRT/NXm7l+2e
        zxg6GXW4xxECrpxaKmHlBgKMAFRYODdz1vA==
X-Received: by 2002:aa7:d805:: with SMTP id v5mr33475820edq.29.1600351491837;
        Thu, 17 Sep 2020 07:04:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdrb/HqW0nsJUJn33qJQNdpXrBijQ/Ya2S05wlYyl8SeCkqCxQaCl8ftA1gGQTVVxriKjMpw==
X-Received: by 2002:aa7:d805:: with SMTP id v5mr33475790edq.29.1600351491510;
        Thu, 17 Sep 2020 07:04:51 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id w8sm15458347ejo.117.2020.09.17.07.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 07:04:50 -0700 (PDT)
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
To:     Mark Pearson <markpearson@lenovo.com>,
        Bastien Nocera <hadess@hadess.net>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
 <f8e4fc83-9665-2a58-d2e0-e858a16417e8@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6e49abf2-6e93-bb41-7df3-0ac66b689df6@redhat.com>
Date:   Thu, 17 Sep 2020 16:04:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8e4fc83-9665-2a58-d2e0-e858a16417e8@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 3:36 PM, Mark Pearson wrote:
> Hi all,
> 
> More emails came in since I wrote this....but I'm going to send anyway and catch up with those after. I need to write faster :)
> 
> On 9/17/2020 7:50 AM, Bastien Nocera wrote:
>> Hey,
>>
>> On Thu, 2020-09-17 at 13:22 +0200, Hans de Goede wrote:

<snip>

>> Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
>> something to advertise the unavailability of a profile, and the reason
>> for that unavailability.
>>
> In all honesty I was slightly dreading this email :) I know the similar issue killed our ePrivacy patch...but I fully appreciate that is part of open source contribution

Getting offtopic here, but the e-privacy screen stuff is already available to userspace through /proc/acpi/ibm/lcdshadow.
What is on hold is adding userspace support for it, because we want to use the new generic API for that once it lands.

> So yes - I agree that having a common interface would be a good idea and making it common between the vendors makes sense. Let me know how to contribute and make that happen.
> 
>  From Lenovo's firmware point of view - our three settings should map on to this quite closely with the exception that we have one setting that covers balance_power and power (I never understood why the FW team did that - as they have the four states in Windows - I wasn't able to get a satisfactory answer to that question)
>
>>> I would like to think that the above proposal is a good start,
>>> if we can quickly (*) decide on an userspace API here
> 
> Yes and understood. Let me know what is the best place to make this happen - from my point of view the main aim is to get this to our users to make the whole performance mode implemetnation more usable and obvious. Without my proposed patch it's really hard to tell what mode you are in on our platforms (and leads to lots of support questions).
> 
> I'm particularly aware of the eprivacy patch where that got rejected for a generic solution that was under development - but the person working on the generic solution stopped part way through to work on other things. We didn't have the knowledge or experience of the graphics driver to be able to really go and contribute effectively so for now that feature is dead even though our initial patch was fairly simple. It is still disappointing that our users don't get useful functionality (and I also have to argue with marketing as to whether we can sell Linux systems with ePrivacy screens which is 
> no fun - I spend way too much of my life doing Lenovo internal paperwork).
> 
> I figure on this item it's less complicated (not tied into the graphics drivers details) so I hope I can contribute more directly - let me know if I'm being naive.
> 
> One question - the main reason for a common interface is for user space to not deal with a mess of APIs.

Correct.

> Is it worth me doing a simplified version of my patch (maybe using debugfs?) so I can expose the modes to users whilst we work on the common solution? I'm assuming there is no mileage in getting my patch (with the fix I owe Benjamin) in and then changing it in the future once the generic solution is available as that potentially messes up userspace too much?

Using debugfs as an intermediate solution is a good idea. debugfs interfaces have no ABI guarantees, so we can simply drop it when the generic stuff lands.

> Something as a stopgap measure that won't annoy the kernel community but is good for Linux users as I'm guessing the generic solution 
> is likely to be months away

The generic solution will definitely not make the 5.10 kernel, but 5.11 is not entirely out of the question, although to be honest 5.12 seems more realistic.

<snip>

>>> I guess we should also add an optional lap_mode sysfs attribute
>>> to the class-device, to have all the info for the Thinkpads in
>>> one place.
>>>
> I'm good with this too - but the lapmode patch is accepted and there is the palm sensor patch too which I'm hoping is accepted soon. Whilst I'm happy to make them part of this implementation (if they fit) I'd appreciate if they didn't get removed or held up as they're needed for our WWAN implementation which is already overdue.
> The main consumer there will be our WWAN enablement utility and we can change that to support different API if needs be :)

As the rest of the dicussion has shown the lap_mode thingie indeed is best left in place as a
thinkpad_acpi only interface for now.

I guess the same applies to the palm_sensor stuff. We may want to advertise that through
some standardize API later, but for now we can just use a thinkpad_acpi specific API and
then also export the info through the standardized API later, as we will do for the
lcdshadow stuff.

Regards,

Hans

