Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D880AECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Sep 2022 08:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236044AbiIBIzV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Sep 2022 04:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236023AbiIBIzT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Sep 2022 04:55:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3044130550
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Sep 2022 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662108917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2PBzYnC5sIAEx9jclZAQCY9ti6JzHmf4JQg198diMlI=;
        b=QqHLCrqO0AxNErS3SXwFH0lIHOnNdlDnLCmVAbc+RKJTX64rS7W71pBNUJaxIaz73e3Fs8
        dNJElDhupPJ9exhK/9Bu7MXvjkreTm9ECUcWYzg/9vwC/o0xvCB+9vYqHeVp7xhRy9GoZ2
        e3xYXAOUHt+FPI9YJmTxr8kQEgwDEUA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-0v-IOF7PN5OQezPq9eICFA-1; Fri, 02 Sep 2022 04:55:08 -0400
X-MC-Unique: 0v-IOF7PN5OQezPq9eICFA-1
Received: by mail-ej1-f71.google.com with SMTP id nb19-20020a1709071c9300b0074151953770so746901ejc.21
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Sep 2022 01:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2PBzYnC5sIAEx9jclZAQCY9ti6JzHmf4JQg198diMlI=;
        b=J0gsB1DmPkHBfKU8ipoWI/ELqBicXKH0CHVbSN9pr4W1m2EXYjI83kVkctLqUYPFFd
         zhpjnndg86kVI2sauefrNeoxFGBuU0929JhFfSVuW/TsuGN0mVADHMDVuTivC66MwA0N
         P116nw4CPqNsEfystNJIJtq89r55QEZOTYFAAIz7QODj2GD4XDUi0ZMwuw08aZN3CTwX
         GuOLcPE8N8BUb1RofuwD0PiM2FAutUrZt+AQFh11awB/N+rbuqsbsGH9IYOg3WFiC7vG
         S3caFCdnJ7X+c2n7Pp5z1wuLaEwZGmtktQI4ydsa9iz+aKPLU5dzgZ1xHJN+lN1UvIdK
         OSrA==
X-Gm-Message-State: ACgBeo2P1dSTO1HXPBj6KkGba2RBsUD+xAcnU6c1e+72F8Bfs0RuzqMi
        nkO4iFX+da9xUd+3dWs1cmYE/TNugOlb9JbMVJd39Er1k1ldNe6RqxAnGBWtgItjUv8AyNwcLxn
        V+kEXccdPZ9ruuxWNN8ptsQsRolkK6+QoTA==
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id nd19-20020a170907629300b0073db27be594mr27134081ejc.526.1662108907382;
        Fri, 02 Sep 2022 01:55:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6uhQWjwGw+gd3HsCSCPfAFbZJweKGDYGIwYplB6RxquWktT2hp1QxnAyzmasn9896uKr4K4w==
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id nd19-20020a170907629300b0073db27be594mr27134069ejc.526.1662108907167;
        Fri, 02 Sep 2022 01:55:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id i19-20020a50fc13000000b00446639c01easm989643edr.44.2022.09.02.01.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 01:55:06 -0700 (PDT)
Message-ID: <c3401c66-251e-b009-e62f-3909ec8f52f2@redhat.com>
Date:   Fri, 2 Sep 2022 10:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1] platform/x86/intel: pmc/core: Add Raptor Lake support
 to pmc core driver
Content-Language: en-US
To:     "Kammela, Gayatri" <gayatri.kammela@linux.intel.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, irenic.rajneesh@gmail.com,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
References: <20220830182001.3693030-1-gayatri.kammela@linux.intel.com>
 <b8a5038b-3d3a-4a2c-8fca-32b47f11e85c@redhat.com>
 <e14b3264-7e60-9cfe-34f8-f79815878d50@redhat.com>
 <8d1dec22-72e2-8297-9dbd-6b2904349fda@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8d1dec22-72e2-8297-9dbd-6b2904349fda@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/1/22 19:32, Kammela, Gayatri wrote:
> On 9/1/2022 8:47 AM, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 9/1/22 17:43, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 8/30/22 20:20, Gayatri Kammela wrote:
>>>> Add Raptor Lake client parts (both RPL and RPL_S) support to pmc core
>>>> driver. Raptor Lake client parts reuse all the Alder Lake PCH IPs.
>>>>
>>>> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
>>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>> Cc: David Box <david.e.box@intel.com>
>>>> Signed-off-by: Gayatri Kammela <gayatri.kammela@linux.intel.com>
>>> Thank you for your patch, I've applied this patch to my review-hans
>>> branch:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>> In file included from drivers/platform/x86/intel/pmc/core.c:29:
>> ./arch/x86/include/asm/cpu_device_id.h:161:46: error: ‘INTEL_FAM6_RAPTORLAKE_S’ undeclared here (not in a function); did you mean ‘INTEL_FAM6_RAPTORLAKE_P’?
>>    161 |         X86_MATCH_VENDOR_FAM_MODEL(INTEL, 6, INTEL_FAM6_##model, data)
>>        |                                              ^~~~~~~~~~~
>> ./arch/x86/include/asm/cpu_device_id.h:46:27: note: in definition of macro ‘X86_MATCH_VENDOR_FAM_MODEL_STEPPINGS_FEATURE’
>>     46 |         .model          = _model,                                       \
>>        |                           ^~~~~~
>> ./arch/x86/include/asm/cpu_device_id.h:129:9: note: in expansion of macro ‘X86_MATCH_VENDOR_FAM_MODEL_FEATURE’
>>    129 |         X86_MATCH_VENDOR_FAM_MODEL_FEATURE(vendor, family, model,       \
>>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ./arch/x86/include/asm/cpu_device_id.h:161:9: note: in expansion of macro ‘X86_MATCH_VENDOR_FAM_MODEL’
>>    161 |         X86_MATCH_VENDOR_FAM_MODEL(INTEL, 6, INTEL_FAM6_##model, data)
>>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/intel/pmc/core.c:1918:9: note: in expansion of macro ‘X86_MATCH_INTEL_FAM6_MODEL’
>>   1918 |         X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S,        &adl_reg_map),
>>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> make[5]: *** [scripts/Makefile.build:249: drivers/platform/x86/intel/pmc/core.o] Error 1
>>
>> And dropped again, please upstream this through the tree which also has the new
>> INTEL_FAM6_RAPTORLAKE* macros.
>>
>> Here is my Acked-by for merging this through another tree:
>>
>> Acked-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Regards,
>>
>> Hans
> 
> Hi Hans!
> 
> Thank you for your Acked-by! The cpuid patch has been merged in to v6.0-rc3. I am not sure why its complaining about INTEL_FAM6_RAPTORLAKE_S being undeclared.
> 
> patch - ea902bcc1943f7539200ec464de3f54335588774 : "x86/cpu: Add new Raptor Lake CPU model number".
> 
> I made sure its built without errors before sending it out.

Ah I see, but my tree (like most trees) is based on 6.0-rc1,
please submit this patch to the same tree as through which
ea902bcc1943f7539200ec464de3f54335588774 went upstream,
with my Acked-by added.

Thanks,

Hans



> 
>>
>>
>>
>>>> ---
>>>>   drivers/platform/x86/intel/pmc/core.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
>>>> index a1fe1e0dcf4a..17ec5825d13d 100644
>>>> --- a/drivers/platform/x86/intel/pmc/core.c
>>>> +++ b/drivers/platform/x86/intel/pmc/core.c
>>>> @@ -1914,6 +1914,8 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
>>>>       X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_N,        &tgl_reg_map),
>>>>       X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE,        &adl_reg_map),
>>>>       X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P,        &tgl_reg_map),
>>>> +    X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE,        &adl_reg_map),
>>>> +    X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S,    &adl_reg_map),
>>>>       {}
>>>>   };
>>>>  
>>>> base-commit: b90cb1053190353cc30f0fef0ef1f378ccc063c5
> 

