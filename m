Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3791CC7619A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 14:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbjCTOkI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 10:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbjCTOkD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 10:40:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F136B252B3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 07:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679323122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a7fIGrXl1ysbu0GTHFVZoUCHKcixI4yx2TedewVjE1c=;
        b=eUskLFflj09d/09jwtuosWv4R0ZiSJOjEMMLf+WDaIzS89YlKV5W7E8L/gLCSb+qUU0TL/
        Wdo3+DveDTZRbXn3WhfMrSFGWYgLhmqlo1SvxdPSYrFgC2+3Ut79HLp6CQdlkK43zHazoG
        2IwR0K6cO5Kwgy9VCKlOu4DBlQRfrsc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-bkVLLxRtOOWFcXPOvD_Uiw-1; Mon, 20 Mar 2023 10:38:41 -0400
X-MC-Unique: bkVLLxRtOOWFcXPOvD_Uiw-1
Received: by mail-ed1-f72.google.com with SMTP id k30-20020a50ce5e000000b00500544ebfb1so8276171edj.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 07:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679323120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7fIGrXl1ysbu0GTHFVZoUCHKcixI4yx2TedewVjE1c=;
        b=Vx1jYxiPOvaUBlFrPC7KnmD7LZqBKEWG+ov4IVN4nuxwEOCz83B5W80TipdtGr712P
         aB6vei0IOACmprfAsqdYHRi6CDoAxvXIuF6/fsR6HSM0BBo5QR07ZZVOI3kd3Q1O0BV1
         lwcM/0Okk8yr7zgiGM4Wegu2mmTjABh5o2adWHmBT8238eNMBcUVFt4kLefRj+wvbSC6
         mQnWN6UHwLYMF0FwHj0BZPxZuiiRZa1FH4ixLxgIyhlStRS1JGaj5HSOcawieh9EKYNN
         0MTYJRzV1abvof4F9WSMCzHZegtAwCKJPzlZ4MtAlMqD1szhZEfwtR5gUjiY5cbgDSsJ
         O/GA==
X-Gm-Message-State: AO0yUKWP6OzzYjuv/DBc5qYwd4AXh7TA6qvrABXdbTwrvYDGgE+rlFg3
        WEs+orZgKOm/HET4kRW/+/LXOqxNq6mrHdAspSA+vQ08cL/fOtT5Ohl38Hc67vPVuprMJ0aHoUu
        QlKzXSXDuvvvoiE6mqc+Pc5r184e5xvPtoWhJUKoblA==
X-Received: by 2002:a17:906:3bd1:b0:931:cac0:60ef with SMTP id v17-20020a1709063bd100b00931cac060efmr9081211ejf.50.1679323119728;
        Mon, 20 Mar 2023 07:38:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set+cvHbex4e1dHxsPYuHATRzwrOqPQG/7i+WwQRyC9iqvKPvQeG9/U+HZgCMoWj6dni0lhN7Jg==
X-Received: by 2002:a17:906:3bd1:b0:931:cac0:60ef with SMTP id v17-20020a1709063bd100b00931cac060efmr9081178ejf.50.1679323119335;
        Mon, 20 Mar 2023 07:38:39 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709064e1500b00930de1da701sm4608225eju.10.2023.03.20.07.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 07:38:38 -0700 (PDT)
Message-ID: <c3ef6518-8195-64e6-bdde-74d0ab6a64b8@redhat.com>
Date:   Mon, 20 Mar 2023 15:38:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>,
        Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, soyer@irl.hu
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
 <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
 <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de>
 <d00fbe99-6c82-ddfc-4e12-3dcb01eda0a6@redhat.com>
 <9b51d06c-d7b4-3886-4476-1c37f9400c62@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9b51d06c-d7b4-3886-4476-1c37f9400c62@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Armin,

On 3/17/23 13:39, Armin Wolf wrote:
> Am 16.03.23 um 10:00 schrieb Hans de Goede:
> 
>> Hi,
>>
>> Sorry for being a bit late with replying.
>>
>> Andrew, thank you for your work on this, at a quick glance it looks great.
>>
>> Armin, thank you for your help / input on this.
>>
>> On 3/15/23 23:33, Armin Wolf wrote:
>>> Am 15.03.23 um 04:37 schrieb Andrew Kallmeyer:
>>>
>>>> On Fri, Mar 10, 2023 at 2:28 AM Armin Wolf<W_Armin@gmx.de>  wrote:
>>>>> Hi,
>>>>>
>>>>> according to the embedded MOF data, the method id for retrieving the mode data
>>>>> is 0x1, not 0xAB.
>>>> Thanks! I can see from your earlier email in the other thread that
>>>> this is right. Strangely, when I tested 0xAB had almost exactly the
>>>> same behavior as 0x01. I think you're right though, I have updated my
>>>> local copy to 0x01.
>>> Hi,
>>>
>>> the reason for this is that most hardware vendors will omit any input checks
>>> if they think they are unnecessary. The WMI interface on my Dell notebook
>>> does the same, sadly.
>> Ack.
>>
>>
>>>> I have also fixed the missing cleanup calls and
>>>>
>>>>> Using wmi_evaluate_method() is deprecated as WMI GUIDs are not guaranteed to be
>>>>> unique for a given machine. I think both WMI GUIDs should be handled by separate
>>>>> drivers, and the driver for the event GUID uses a notifier call chain to inform
>>>>> the driver for the data GUID that the usage mode changed, which then handles the
>>>>> input device stuff.
>>>>>
>>>>> This way the driver does not rely on deprecated WMI APIs, and everything would
>>>>> still work should Lenovo decide to duplicate some WMI GUIDs.
>> Jumping into the discussion a bit late here, but I disagree with this, using wmi_evaluate_method() here is fine. The chances of there ever being 2 instances of the LENOVO_YMC_QUERY_GUID are very small and we can deal with that if it ever happens.
>>
>> So I really so no need to make the code needlessly complicated with 2 sub-drivers which then notify each other. Let keep things KISS and keep this as is, so for the next version only change
>> the method_id from 0xab to 0x01.
> 
> I think that using wmi_evaluate_method() is deprecated and we should try to minimize its usage whenever possible. As for the handling of the WMI GUIDs, i believe that
> just using the first matching WMI device is not a stable solution. We simply do not know if Lenovo considers both WMI GUIDs singletons or not. This means they could
> for example decide to have multiple independent data sources for tablet mode events. The chances for this are indeed small, but it will still create a problem for users
> using such machines. By having two drivers and maybe a global notifier call chain, we would enable the driver to handle such "unlikely situations" correctly.

Armin, first of all let me say tht I really appreciate your input / help with
reviewing pdx86 patches.

The problem is that your suggestion with 2 drivers attaching themselves
to 2 different wmi_device-s is that we will need to introduce some
shared global data / variable for the 2 to communicate. Notifiers
don't magically work. They need a shared notifier head between the
producer and consumer(s) to work. So you are still introducing
a singleton.

Sometimes this is a good solution, but in this case this really
seems like an overly complicated solution to me. Making the code
needlessly complicated to deal with a theoretical scenario which
I don't believe will ever happen.

Also see below.

> This would also allow the driver to work on machines missing the WMI event GUID. In such a case, userspace could then just poll the data WMI GUID for input, but
> this is just an idea.
> 
>>>> After reading many times, I believe I understand this and can figure
>>>> out the implementation. How should I attribute the commits? Should
>>>> this be a 3rd patch in a v2 patch series with myself as the author? Or
>>>> should these drivers be introduced in one commit without the
>>>> intermediate single driver that uses the deprecated API?
>>> I thing the new driver(s) should be introduced in one commit. I am not sure about the
>>> new author of the commit. If the original driver was significantly altered, then AFAIK
>>> you should be the new author. Still, the original author should at least be mentioned
>>> with a "Co-developed by" tag. You can then omit your "Co-developed by" tag.
>> Ack to introducing the new driver in 1 commit. Since compared to this version only the method_id is going to make change t make it makes sense to keep Gergo as author and Andrew as Co-developed-by .
>>
>>> As a site note, i recommend to use the get_maintainer.pl scripts under scripts/ to find
>>> any additional maintainers which should be CC-ed. Since your patch series touches the
>>> ideapad-laptop driver, its maintainer (Ike Panhc<ike.pan@canonical.com>) should also be
>>> notified about this patch series.
>>>
>>>> Also have I correctly set Gergo as the commit author for this PATCH
>>>> 2/2 email like Hans said to? I wasn't sure if I had it right and I
>>>> could fix it in the v2 series.
>>>>
>>> You are still the author of the second patch. Also you should not send a patch series as
>>> a reply to any previous emails.
>>>
>>>>> acpi_dev_put() is missing.
>>>> Thanks! Not sure why I thought it was okay to delete lenovo_ymc_remove
>>>> but I have added that back in with the input_unregister_device call.
>>>>
>>>>> Maybe it would be beneficial to allow userspace to get the current usage mode without having
>>>>> to wait for an WMI event. This way, userspace could still react to situations like the device
>>>>> already being in tablet mode when this driver is loaded.
>>>> I'm not following how to implement this, not familiar enough with WMI.
>>>> Could you explain more?
>>> I meant that your driver should, after (!) setting up the input device and event handling, call
>>> sparse_keymap_report_event() with the code obtained from
>>> wmidev_evaluate_method() so that userspace knows about the initial state
>>> of the input device. You might also CClinux-input@vger.kernel.org  for
>>> the next patch series, so that the input driver maintainers can also
>>> review your patch series.
>> Ack, reporting the initial state would be a good addition. To keep the authorship clear I think this can be added as a follow-up 3/3 patch in the next version.
>>
>> I realize this contradicts a bit with my previous lets introduce the driver in 1 commit thing, but in this case I think this makes the most sense.
>>
>>>>> If the drivers handling the event and data GUIDs are fine with being instantiated multiple
>>>>> times, then adding the WMI GUIDs to the allow_duplicates[] list in drivers/platform/x86/wmi.c
>>>>> will allow the WMI driver core to handle duplicated event and data GUIDs.
>>>> Is there an easy way to test if it's fine to run multiple copies?
>>>> Currently testing by compiling the module with an inlined
>>>> ideapad-laptop.h out of the kernel tree and using the insmod command
>>>> to load it.
>>> Drivers can be instantiated multiple times, and each time their probe callback is invoked,
>>> and many older WMI drivers cannot do this, so the allowlist exists.
>>> The section "State Container" in Documentation/driver-api/driver-model/design-patterns.rst
>>> explains how to write drivers which can be instantiated multiple times.
>>>
>>> If your driver is not a singleton, i.e. it can safely be instantiated multiple times, then
>>> you can add its WMI GUID to the allowlist.
>> I'm not sure about adding this to the allowlist, using the new API is good (and nice and clean) but this is still expected to be a singleton.
> 
> The allowlist is dealing with drivers not jet converted to the WMI bus model. The allowlist should ideally disappear once the conversion has been
> completed, something which would become difficult if WMI drivers would continue to rely on the older GUID singleton behavior which is not compliant
> with the ACPI WMI spec AFAIK. If we know that our WMI GUID is a singleton (which we do not), then we should handle this inside our driver, not inside
> the WMI probing code.

Ah I see (wrt the above discussion), your aiming for some ideal scenario here
were all WMI code gets converted to the new model and the singleton assuming
functions can simply be removed.

I'm afraid that this will never happen. The old way of doing things is deprecated
but if you look at drivers like e.g. acer-wmi not only does it deal with
7 different WMI GUIDs in a single driver. It also exposes sysfs interface under
a platform_device which its registers. Moving drivers like this over to
binding to a wmi_device instead of to a self-created platform-device, will
break userspace API so this simply cannot be done.

For reasons of these I have let go the idea of the ideal scenario being
converting all existing WMI code to the new model. I don't believe that
this is a realistic plan.

As such although I don't want to see new WMI drivers which completely
use the old model. I'm ok with using some of the old model when
single driver needs to deal with more then 1 GUID and the expectations
are that the involved GUIDs will always be and stay singletons.

Andrew, sorry for the conflicting advice you are getting here.
Unfortunately this sometimes happens.

In the end I think both approaches (2 separate driver for the
GUIDs; or just keep using wmi_evaluate_method()) are fine.

So since you are doing the work here, you get to choice which
solution you want to pick for the next version.

Regards,

Hans

