Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2380C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Dec 2022 23:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234931AbiLBXww (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Dec 2022 18:52:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234934AbiLBXwg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Dec 2022 18:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D379CFB8B2
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Dec 2022 15:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670025101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=91+N7TaxeFvwsM4JrbKlZLvXSnLrW2mm53buGh2zOoY=;
        b=aHB/DcV3dQYGX70QAzhY4SRdaSH5SIagxWYM/hPFP9kiMad/MqP+m54V260GCiEObcO1XW
        1LkqPQZDl1GubfQKRWcWmhYLAcRXSN13N0xJrbewj2U0zEO0W6StcyCkm9vnZ4TkXIdUma
        hb1LeQgrpk9GFse9/wfarEigSvNMb/E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-282-0f53NfWaPHS1YipR3xI2HQ-1; Fri, 02 Dec 2022 18:51:37 -0500
X-MC-Unique: 0f53NfWaPHS1YipR3xI2HQ-1
Received: by mail-ej1-f70.google.com with SMTP id gb8-20020a170907960800b007bef177dddeso4295179ejc.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Dec 2022 15:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91+N7TaxeFvwsM4JrbKlZLvXSnLrW2mm53buGh2zOoY=;
        b=7REUlTC2RzFVObXAh6/m3rbBggJJPX9f50oh20QpRFK2ZLykEJMUXuamJxLIYRuu/p
         b0NWCDvGeMmFomNdoe8Msnh7k7ZdB4wUUhuOkfbFkhT6XF0K6NWd7m2ak45lIvuTZWdx
         aoBbySVya+5gdmEqEuXdje/5hlp0EbFxC93FWZcQ1O1+Z8ReID3u5dmao9deMaR4j6ki
         hgtVtqSweW9vM5t7FDjx/qL1reV/P9EUg1AhmuOSEnDNgsfqwPN3honcolXI8vumSuxe
         4YFVgaaiUL6SSWiFqafcyeG1Sd8sMX7E2wAaUmmBZrZNmd5G9lDzdNOeYqH4X/kDNzkB
         vGpA==
X-Gm-Message-State: ANoB5pklXHtHN70Uq0EfkUnFP9eNg7n4BaFr2Z0WPm3beMDJ2LsVvh4r
        jLcZhHEf8Sto3RFFoDRcDA09tmoLAVUMc/cLex6o07cbvHkEF1zlPviHR4TPNr4LnksvTyVLjHw
        KGJNxGPOpLWI4HNoKPS9q8fTYmoACoVZIUA==
X-Received: by 2002:a17:906:39c8:b0:7ad:79c0:5482 with SMTP id i8-20020a17090639c800b007ad79c05482mr52292739eje.730.1670025096886;
        Fri, 02 Dec 2022 15:51:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6/ofwo0VQIXwcZofZ6BE8JYZnBgs7ubLgoqfMPNOEoVwvFiWneisnGmeh/uqksGZq3/nRgqA==
X-Received: by 2002:a17:906:39c8:b0:7ad:79c0:5482 with SMTP id i8-20020a17090639c800b007ad79c05482mr52292727eje.730.1670025096643;
        Fri, 02 Dec 2022 15:51:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id z3-20020a170906240300b007aef930360asm3585578eja.59.2022.12.02.15.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 15:51:36 -0800 (PST)
Message-ID: <011865e7-33aa-d707-ff2f-a74f27037ab6@redhat.com>
Date:   Sat, 3 Dec 2022 00:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 6/6] platform/x86: int3472/discrete: Get the polarity from
 the _DSM entry
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-7-hdegoede@redhat.com>
 <CAHp75Vc2nYtvHhrsNPe8JwbK_665F5_Z6bMDfvmtBKr0HomycA@mail.gmail.com>
 <7a110978-268d-811d-daa6-39f78f802e2c@redhat.com>
 <Y4c5PVBkWA3lHoqR@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4c5PVBkWA3lHoqR@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/30/22 12:06, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 11:39:42AM +0100, Hans de Goede wrote:
>> On 11/30/22 11:01, Andy Shevchenko wrote:
>>> On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> According to:
>>>> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
>>>>
>>>> Bits 31-24 of the _DSM pin entry integer value codes the active-value,
>>>> that is the actual physical signal (0 or 1) which needs to be output on
>>>> the pin to turn the sensor chip on (to make it active).
>>>>
>>>> So if bits 31-24 are 0 for a reset pin, then the actual value of the reset
>>>> pin needs to be 0 to take the chip out of reset. IOW in this case the reset
>>>> signal is active-high rather then the default active-low.
>>>>
>>>> And if bits 31-24 are 0 for a clk-en pin then the actual value of the clk
>>>> pin needs to be 0 to enable the clk. So in this case the clk-en signal
>>>> is active-low rather then the default active-high.
>>>>
>>>> IOW if bits 31-24 are 0 for a pin, then the default polarity of the pin
>>>> is inverted.
>>>>
>>>> Add a check for this and also propagate this new polarity to the clock
>>>> registration.
>>>
>>> I like it in this form, thanks!
>>>
>>> ...
>>>
>>>> +               (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
>>>
>>> Perhaps
>>>
>>> static inline str_high_low(bool v)
>>> {
>>>   return v ? "high" : "low";
>>> }
>>>
>>> In the string_helpers.h? If you are okay with the idea, you may use my
>>> tag ahead for that patch.
>>
>> That is an interesting idea. but IMHO best done in a follow-up series
>> after checking for similar code in the rest of the kernel.
>>
>> This is based on the assumption that "selling" this new helper to
>> the string_helpers.h maintainer will be easier if there are multiple
>> consumers of it right away.
> 
> strings_helper.h maintainer is any known kernel subsystem maintainer + me
> (as a reviewer / main contributor to that library). That's why I proposed
> the solution and my tag would be enough to route it via your tree.
> 
> So, offer still stays.

Ok I'll add your patch adding the str_high_low() helper to the next
version of this series (or when I merge it, depending on how things go)
and then move this over to use the str_high_low() helper.

Regards,

Hans


