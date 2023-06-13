Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ECBC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Jun 2023 10:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241490AbjFMKan (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Jun 2023 06:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242050AbjFMKaL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2023 06:30:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6FD187
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686652163;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FqtHUfyNE9hKB7RdGVWaTEBlqFaYncwa3Vu7I4xxlcA=;
        b=enCXOzurnXoBt7eRl0vGlmDZVOc58Q/eRQOiUMnm98hcmA0dh6zClZZOUmAICUGzPwKJFS
        8O4ouQKDrkV7lkVNAvqAfX1WEaUw+PKu92IexeevZd9sHT0vfYk9eD5RxrjLNzV9/BTbX1
        tTXgw2XMtB4JDkGaY9SQG1boicbi9wo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-SzXSHfk2MN-oY7Nnt74vwg-1; Tue, 13 Jun 2023 06:29:12 -0400
X-MC-Unique: SzXSHfk2MN-oY7Nnt74vwg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-982180ac15cso237529166b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 03:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652151; x=1689244151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqtHUfyNE9hKB7RdGVWaTEBlqFaYncwa3Vu7I4xxlcA=;
        b=lYYeXdq6ULUINJCiLaFakp3YoTgeFQSj5UGpaq05j24NgxP/lXgLHnZxcddvroN1Km
         BZxr22IzKwz4+T2AKpxdTCNH3gsOnnzD6CTiy32aVzXsv0sOkkASBunOhObBky2ALsxh
         pSjeLB540a1rQb15U3kmcyQ6JGa6NbfTdqLgZ4qRVfL0+wzDtZQRaTD9hQYpBnJ69yXC
         GR5HEsgiz84xKYypG3Jl9hIwUp1daAiH8N7uz4OporFHrLL4djJawlCTBQZC1gmDV4v3
         c6S5No/tRY75vka70usHCYHLe8Vm6XXOpqOXbzAoAVX9klAIz01MhQpcPCz7ru8skd1W
         PoSw==
X-Gm-Message-State: AC+VfDxnnXNqFsV+5ljJ5jqvjC4LpJVmszNmfKC3GFOUIloRYNZS/A+1
        LFJSYFuqrcjx4tolXOOV4/aU4qakCM5+ACw7Sb+eqSLDWONSnTBzXlQpbI3y8B0o6vPcMOs9ucP
        e7sjqFG5jWUY96IKcl7KrFpmufXz2K3bV8A==
X-Received: by 2002:a17:907:981:b0:96a:30b5:cfb0 with SMTP id bf1-20020a170907098100b0096a30b5cfb0mr12235653ejc.22.1686652151259;
        Tue, 13 Jun 2023 03:29:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55Fd5NYSQkb7w2rPsxgsoqVSpsVjEBcKap630sv5vaVo08+tT0Yk48yodQv0fyjbl9vyRZ3Q==
X-Received: by 2002:a17:907:981:b0:96a:30b5:cfb0 with SMTP id bf1-20020a170907098100b0096a30b5cfb0mr12235635ejc.22.1686652150980;
        Tue, 13 Jun 2023 03:29:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m25-20020a1709062b9900b0096637a19dccsm6380090ejg.210.2023.06.13.03.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:29:10 -0700 (PDT)
Message-ID: <c3e2ea9f-7971-9946-50e7-e7fa83fe5231@redhat.com>
Date:   Tue, 13 Jun 2023 12:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V2 2/2] platform/x86/intel/pmc/mtl: Put devices in D3
 during resume
Content-Language: en-US, nl
To:     david.e.box@linux.intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     markgross@kernel.org, irenic.rajneesh@gmail.com,
        ilpo.jarvinen@linux.intel.com, xi.pardee@intel.com,
        rajvi.jingar@linux.intel.com
References: <20230607233849.239047-1-david.e.box@linux.intel.com>
 <20230607233849.239047-2-david.e.box@linux.intel.com>
 <e5fce103-fbb6-0eb6-f6ff-4bfeadd89c90@redhat.com>
 <fa84b0098551123f34a68b3c0d9c7aa12f592bbf.camel@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <fa84b0098551123f34a68b3c0d9c7aa12f592bbf.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/12/23 20:02, David E. Box wrote:
> Hi Hans,
> 
> On Mon, 2023-06-12 at 11:42 +0200, Hans de Goede wrote:
>> Hi David,
>>
>> On 6/8/23 01:38, David E. Box wrote:
>>> An earlier commit placed some driverless devices in D3 during boot so that
>>> they don't block package cstate entry on Meteor Lake. Also place these
>>> devices in D3 after resume from suspend.
>>>
>>> Fixes: 336ba968d3e3 ("platform/x86/intel/pmc/mtl: Put GNA/IPU/VPU devices in
>>> D3")
>>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>>
>> Thank you for your patch.
>>
>> There is one thing which has me worried here:
>>
>> What about when real proper drivers show up for these blocks?
>>
>> I know that at least some people will likely be using the out of tree IPU6
>> driver with the IPU block.
>>
>> And having 2 different drivers poke at the hw state seems like a bad idea to
>> me.
>>
>> Maybe we can add a check if no driver is bound and only set the state to D3 if
>> no driver is bound?
> 
> This check exists but is not shown in the patch. mtl_set_device_d3() gets the
> device lock and checks to see if dev.driver is NULL before putting in D3. This
> was checked with the GNA driver installed.

Ah, yes I remember this now from the original patch adding
mtl_set_device_d3(). Good.

Let me go and merge this right away then.

Regards,

Hans






>>> ---
>>>
>>> V2 - rename mtl_fixup to mtl_d3_fixup. Call it from new mtl_resume
>>>      function, followed by the common resume. Suggested by Ilpo.
>>>
>>>  drivers/platform/x86/intel/pmc/mtl.c | 29 ++++++++++++++++++++--------
>>>  1 file changed, 21 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/intel/pmc/mtl.c
>>> b/drivers/platform/x86/intel/pmc/mtl.c
>>> index e8cc156412ce..2b00ad9da621 100644
>>> --- a/drivers/platform/x86/intel/pmc/mtl.c
>>> +++ b/drivers/platform/x86/intel/pmc/mtl.c
>>> @@ -68,16 +68,29 @@ static void mtl_set_device_d3(unsigned int device)
>>>         }
>>>  }
>>>  
>>> -void mtl_core_init(struct pmc_dev *pmcdev)
>>> +/*
>>> + * Set power state of select devices that do not have drivers to D3
>>> + * so that they do not block Package C entry.
>>> + */
>>> +static void mtl_d3_fixup(void)
>>>  {
>>> -       pmcdev->map = &mtl_reg_map;
>>> -       pmcdev->core_configure = mtl_core_configure;
>>> -
>>> -       /*
>>> -        * Set power state of select devices that do not have drivers to D3
>>> -        * so that they do not block Package C entry.
>>> -        */
>>>         mtl_set_device_d3(MTL_GNA_PCI_DEV);
>>>         mtl_set_device_d3(MTL_IPU_PCI_DEV);
>>>         mtl_set_device_d3(MTL_VPU_PCI_DEV);
>>>  }
>>> +
>>> +static int mtl_resume(struct pmc_dev *pmcdev)
>>> +{
>>> +       mtl_d3_fixup();
>>> +       return pmc_core_resume_common(pmcdev);
>>> +}
>>> +
>>> +void mtl_core_init(struct pmc_dev *pmcdev)
>>> +{
>>> +       pmcdev->map = &mtl_reg_map;
>>> +       pmcdev->core_configure = mtl_core_configure;
>>> +
>>> +       mtl_d3_fixup();
>>> +
>>> +       pmcdev->resume = mtl_resume;
>>> +}
>>
> 

