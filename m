Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F124AC7EE2C
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 09:51:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbjEYJvR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 05:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbjEYJvQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 05:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CA819C
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685008228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5V82KHtJcZ7ZOahUW9QBEqMaALqeIdw3wDxT7yFtAOU=;
        b=F2cRP41ZzEP9o0Bi1KqJd6kF8z+jZ+NM9VovlyBxtvPTsEo/vK3X/8SjgHPkFWCkF8SXzU
        DKnEEJJKerkZpF47GXVB8IJlvZel2nd6sMp1OHvwmw6DZETwrrDMZbqoaVpP+tbV6hxMk8
        QNxrP71goYQ2/nLU9PXLNZPznSZz+Zo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-LIpMg-ShPbCR48bQ9zqsfQ-1; Thu, 25 May 2023 05:50:26 -0400
X-MC-Unique: LIpMg-ShPbCR48bQ9zqsfQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-96f6944c529so42604366b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 02:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685008225; x=1687600225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5V82KHtJcZ7ZOahUW9QBEqMaALqeIdw3wDxT7yFtAOU=;
        b=LvnM9eBVOI7sMWIunSz4zwS8GXfm77isbNssglO9hoYE+rtAz+v4rGEDN6Zw/jB2Ao
         /V4hLjxBvdeZ94p0ZjLkF0gFEcEsV1MtVdrpUlQ4Uuh/EkQWEiwTAEDQbGyLc0blXeh0
         tR5pN2xBcNJmtFQTqCR5rSbbtnowYcYOI2Wu+QJH4bl/0VVIGixQ+YqEpiWEpgYckJDm
         oJZsDd9KeFlDqYibT5+aqav/VxV3FCE08mKh5dOnPGd3oGTudk7lmUyEguKCGj09y2HG
         hJPZm1oXb9v7W4EsQJqoQYs7FptCZxwZ5Byhksx8M++7j4IOzweDNPK3Rir2BB1VilMP
         AVww==
X-Gm-Message-State: AC+VfDwtQp70JNqwN9upfxzg7ih1wMP8iHVKyO0tW5HgK6bmUySccBSR
        oXgRFF8cYyYmzRpHchU54iZnxVlSp3gc35lIxMll2xZyar1s60RyGegryTTgTguONCSsev4wFre
        PVsHJK7WCcgquqUpk55o/IISdKZJYWS6j6Q==
X-Received: by 2002:a17:906:da83:b0:973:94a0:fe23 with SMTP id xh3-20020a170906da8300b0097394a0fe23mr929306ejb.10.1685008225348;
        Thu, 25 May 2023 02:50:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6m/tF0SK/MhWaZ0rtukKLD2ycQ+pGtQmuaZTJwYi7WLjdder/YZUgzJnseTgiLXGBlEzPEZA==
X-Received: by 2002:a17:906:da83:b0:973:94a0:fe23 with SMTP id xh3-20020a170906da8300b0097394a0fe23mr929290ejb.10.1685008225016;
        Thu, 25 May 2023 02:50:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t11-20020a170906a10b00b009663115c8f8sm610993ejy.152.2023.05.25.02.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 02:50:24 -0700 (PDT)
Message-ID: <515a1f93-8100-f78b-ca7c-6a6f68b1df2c@redhat.com>
Date:   Thu, 25 May 2023 11:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/4] platform/x86/amd: pmc: Add helper function to
 check the cpu id
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
 <20230516091308.3905113-4-Shyam-sundar.S-k@amd.com>
 <d4e98445-d2f2-10f7-7f62-9bcb16deef79@linux.intel.com>
 <378b7e91-3b14-c6fa-036a-c91a30ab4665@amd.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <378b7e91-3b14-c6fa-036a-c91a30ab4665@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 5/25/23 11:46, Shyam Sundar S K wrote:
> 
> 
> On 5/23/2023 1:56 PM, Ilpo Järvinen wrote:
>> On Tue, 16 May 2023, Shyam Sundar S K wrote:
>>
>>> Add a helper routine to check the underlying cpu id, that can be used
>>> across the PMC driver to remove the duplicate code.
>>>
>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
>>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
>>> index e2439fda5c02..7e5e6afb3410 100644
>>> --- a/drivers/platform/x86/amd/pmc.c
>>> +++ b/drivers/platform/x86/amd/pmc.c
>>> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>>>  	debugfs_remove_recursive(dev->dbgfs_dir);
>>>  }
>>>  
>>> +static bool amd_pmc_check_sup_cpuid(struct amd_pmc_dev *dev)
>>
>> Does sup refer to "supported" or some other acronym? If the latter,
> 
> Yes, please read that as "supported"
> 
>> you should mention/open it in the changelog and/or in a comment. If the 
>> former, the function naming seems too generic (an observation entirely 
>> based on how/where the function is used, you're not exactly verbose on 
>> what this actually checks for other than what looks like a set of CPU 
>> IDs but clearly there's more behind it).
> 
> OK. renaming the function as amd_pmc_is_cpu_supported() would be fine?

Yes that should be fine.

Regards,

Hans


