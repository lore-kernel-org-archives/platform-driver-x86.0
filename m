Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A533FEE4996
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 17:53:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236907AbjHURxU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 13:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236749AbjHURxU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 13:53:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F7DE9
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 10:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692640356;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AzA70iGz95MR5t0oC1cy0IlXA1LzdX3qf+5G+dPOMCk=;
        b=W3FdDOZ3hnONVgcPEz9XC1nItN3irctKH/Q/Q4E7PDeybieVHGgdS45Cjuq39Bu6gkqMAA
        EPeCFyitIDasHLrNeg9fmdCYdaygu/w4x/JkSgR94ECwj2oLpsr6nr49vTaEX+poC1AA0Q
        /TSYr+XMoOkrcWMCf9Pj10/lM7fYeoM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-ysRgzb9KMquF2bxoc8Ef3Q-1; Mon, 21 Aug 2023 13:52:34 -0400
X-MC-Unique: ysRgzb9KMquF2bxoc8Ef3Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a34d3e5ebso229598566b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 10:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692640354; x=1693245154;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzA70iGz95MR5t0oC1cy0IlXA1LzdX3qf+5G+dPOMCk=;
        b=Wyw0O22YlAvueKIOXzUKhsXCFSngeht5AvBqD8unT/fEAPCH+0rzKEn3IhwQu2XKgN
         s6k6T3cpn2LCN+5d/OEaBerSmTC52cdYz4s9Dep6Dx1oAhQYlkGSUjB3UkvVET5IvC7j
         QbQUqetqRRwrROVxsZFPvTQ3qIZJoYuira0XmAOQIydX1adRFaItcrW9K4Kcp7P3+B1+
         C7eRDMZd+9cg/nKwIVa6dehH9mwqCZqlIl4fOV9y/O7TznXIQVBf5cPRwYm0gKnc85KY
         vfosJzxpDIGV+AVL4zlljKPyAb2Hq8IPzpeWi23cSiRVjh/KQfRIGQWPmdxTIj3LoBf7
         eAcg==
X-Gm-Message-State: AOJu0Yymxpe/YUvcecX3Fxdho0t1ZJJHdWpaTitVaxKS8+4OheXG0R00
        Vrj9F/yY+9GYZxmFCEvcuEbXBjLhGZN3zxFxss3sjO1uZTlVBLtkXxl76YydkHelbkSCSHeR+Fq
        2tjLSmPBvKMtv2QLji4MiGyXESGxvlc4t2w==
X-Received: by 2002:a17:906:1ba9:b0:9a1:680e:8c54 with SMTP id r9-20020a1709061ba900b009a1680e8c54mr5649456ejg.71.1692640353865;
        Mon, 21 Aug 2023 10:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmKbVHxWff4lcPCPI+VT7c5mOa4WioYepjYjp0RmAilaEjuxogxv8txI+CvsIx8xParpshXw==
X-Received: by 2002:a17:906:1ba9:b0:9a1:680e:8c54 with SMTP id r9-20020a1709061ba900b009a1680e8c54mr5649444ejg.71.1692640353582;
        Mon, 21 Aug 2023 10:52:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e3-20020a170906504300b0099bccb03eadsm6862139ejk.205.2023.08.21.10.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 10:52:32 -0700 (PDT)
Message-ID: <a2a5f3e5-c921-d62b-4c11-109d24b90811@redhat.com>
Date:   Mon, 21 Aug 2023 19:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] Updates to amd-pmc driver
From:   Hans de Goede <hdegoede@redhat.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
 <2c0ee105-8610-5698-a729-8d665b9318b3@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <2c0ee105-8610-5698-a729-8d665b9318b3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Again,

On 8/21/23 14:57, Hans de Goede wrote:
> Hi Shyam,
> 
> On 8/11/23 13:21, Shyam Sundar S K wrote:
>> This patch series includes:
>>
>> - Move PMC driver to separate directory
> 
> This one seems to rely on the state of the amd-pmc code in pdx86/fixes
> which is also the state in Linus' master but not the state in pdx86/for-next
> which is based on 6.5-rc1 where as e.g. :
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=fixes&id=e8ef8dd28c4c4b86cd3010ff42c79582f766862e
> 
> Which adds the pmc-quirks.c file was added later in the fixes branch.
> 
> So it is best to do this moving into a separate dir directly
> after 6.6-rc1 is out, at which point fixes and for-next will have
> both been merged.

So I have just back-merged pdx86/fixes into review-hans (future pdx86/for-next)
because some pending mellanox changes need this to avoid conflicts.

As such I think I can pick this patch (the patch moving things into its
own subdir) now.

I think it might be a good idea to merge this patch for the upcoming
6.6 window so that we have the moving of files behind us.

Shyam, shall I merge 1/4 into review-hans / for 6.6-rc1 now ?

Regards,

Hans




> 
>> - Read SMU version at the time of probe to avoid duplication of code
> 
> Please address the comments made on this patch (or drop it).
> 
> I assume the rest relies on this patch, so I'm going to drop this
> entire series from my queue now.
> 
> Regards,
> 
> Hans
> 
> 
> 
>> - Add a Firmware command that can force flush the Spill to DRAM contents.
>> - override the STB dump size with a custom one using a module_param
>>
>>
>> Shyam Sundar S K (4):
>>   platform/x86/amd/pmc: Move PMC driver to separate directory
>>   platform/x86/amd/pmc: Read SMU version at the time of probe
>>   platform/x86/amd/pmc: Add PMFW command id to support S2D force flush
>>   platform/x86/amd/pmc: Add dump_custom_stb module parameter
>>
>>  MAINTAINERS                                   |  2 +-
>>  drivers/platform/x86/amd/Kconfig              | 16 +---
>>  drivers/platform/x86/amd/Makefile             |  3 +-
>>  drivers/platform/x86/amd/pmc/Kconfig          | 19 +++++
>>  drivers/platform/x86/amd/pmc/Makefile         |  8 ++
>>  .../platform/x86/amd/{ => pmc}/pmc-quirks.c   |  0
>>  drivers/platform/x86/amd/{ => pmc}/pmc.c      | 80 ++++++++-----------
>>  drivers/platform/x86/amd/{ => pmc}/pmc.h      |  1 +
>>  8 files changed, 66 insertions(+), 63 deletions(-)
>>  create mode 100644 drivers/platform/x86/amd/pmc/Kconfig
>>  create mode 100644 drivers/platform/x86/amd/pmc/Makefile
>>  rename drivers/platform/x86/amd/{ => pmc}/pmc-quirks.c (100%)
>>  rename drivers/platform/x86/amd/{ => pmc}/pmc.c (96%)
>>  rename drivers/platform/x86/amd/{ => pmc}/pmc.h (98%)
>>

