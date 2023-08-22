Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70D7EE4993
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 15:32:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbjHVPc4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 11:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234923AbjHVPcz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 11:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896ABCEF
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692718322;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uwM3CTTTUG82tNvUUDHqBwYrQnBn5vWHg/sCxuqcQ2o=;
        b=Qv/A69f6UI2Isa7eOXY/lOINl5u5bfQURWA2YlfKIvV1pnEoHW6EKdM/lCpP5urZVWBZwf
        MkttsnoAmMl+22CF8bryFXZ1iD3K2NpjhC10pJcZN2gn3J8UZl/NfM2UIWx5aBxWyHVBA5
        wxonj2PR8gLUdqH6LlYY58V1TdmqN/s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-iKZS7eziPdeaka6UggmLPw-1; Tue, 22 Aug 2023 11:32:01 -0400
X-MC-Unique: iKZS7eziPdeaka6UggmLPw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a34a0b75eso312418966b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 08:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692718320; x=1693323120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwM3CTTTUG82tNvUUDHqBwYrQnBn5vWHg/sCxuqcQ2o=;
        b=HxSlf2CQ72IVciByE0VCwchsLrbQLFZiXAfO5Mr+xtUaYHJDCHGWmY/Y5ECK3tlmZZ
         XNWrnhelvZmRHbVQBQveRRSMrvdBwEF4lcT6mioLIEncxHMKD0DkFPm+eSHC+vIEKZ7Q
         JR3mpXfJneP/riKTNig881Ksw4xn2zyxnXlvJ1FONSNewn5gf7uM/Xq3zkCKPkW6XbqS
         dxe7oZuAFBzFgINSVuJXFGLm3VABO2b5pccX7zOCW582B9N89m/xoFnFyRjMrn+XlrGu
         rKPKFwU5KIOR9U4QVEc4V5Vdbeyy1pRDntPkifbrmJqIVtvPhFvd1cxIX5Z5TZFPRdZq
         v1lw==
X-Gm-Message-State: AOJu0Yzig+c+iyodFQASuUc+RYkrnFe1WfgD93pGoYcpH6KXk4v/ZRIi
        8azyBS5QYZgJa36HSXc2BjSDFESlDcIfsTvJqb+SN6q+9dDEdiFJeDaQc49b939ZHUWFnN8DlRV
        cDjxA+dLT3baf0jqQDJ9UKCMKVWwpPHOOBg==
X-Received: by 2002:a17:906:73da:b0:993:f540:5bb1 with SMTP id n26-20020a17090673da00b00993f5405bb1mr8528931ejl.41.1692718320323;
        Tue, 22 Aug 2023 08:32:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrT72lqsG1OcJ3t6YpFKVGl/X7JDIquELTErBuCLLz5emE9yLKmWVCofGHuBxs/LtehyHzRQ==
X-Received: by 2002:a17:906:73da:b0:993:f540:5bb1 with SMTP id n26-20020a17090673da00b00993f5405bb1mr8528906ejl.41.1692718319960;
        Tue, 22 Aug 2023 08:31:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id kf7-20020a17090776c700b00993664a9987sm8413983ejc.103.2023.08.22.08.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 08:31:59 -0700 (PDT)
Message-ID: <2378c48c-aaa7-19e8-3ea9-f20db81f1a8d@redhat.com>
Date:   Tue, 22 Aug 2023 17:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] Updates to amd-pmc driver
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
 <2c0ee105-8610-5698-a729-8d665b9318b3@redhat.com>
 <a2a5f3e5-c921-d62b-4c11-109d24b90811@redhat.com>
 <060110a2-d0d6-5954-eace-7c80a3386990@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <060110a2-d0d6-5954-eace-7c80a3386990@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/22/23 06:11, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 8/21/2023 11:22 PM, Hans de Goede wrote:
>> Hi Again,
>>
>> On 8/21/23 14:57, Hans de Goede wrote:
>>> Hi Shyam,
>>>
>>> On 8/11/23 13:21, Shyam Sundar S K wrote:
>>>> This patch series includes:
>>>>
>>>> - Move PMC driver to separate directory
>>>
>>> This one seems to rely on the state of the amd-pmc code in pdx86/fixes
>>> which is also the state in Linus' master but not the state in pdx86/for-next
>>> which is based on 6.5-rc1 where as e.g. :
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=fixes&id=e8ef8dd28c4c4b86cd3010ff42c79582f766862e
>>>
>>> Which adds the pmc-quirks.c file was added later in the fixes branch.
>>>
>>> So it is best to do this moving into a separate dir directly
>>> after 6.6-rc1 is out, at which point fixes and for-next will have
>>> both been merged.
>>
>> So I have just back-merged pdx86/fixes into review-hans (future pdx86/for-next)
>> because some pending mellanox changes need this to avoid conflicts.
>>
>> As such I think I can pick this patch (the patch moving things into its
>> own subdir) now.
>>
>> I think it might be a good idea to merge this patch for the upcoming
>> 6.6 window so that we have the moving of files behind us.
>>
>> Shyam, shall I merge 1/4 into review-hans / for 6.6-rc1 now ?
> 
> Yes please. I will drop 2/4 as per Mario's remark. Once you have 1/4
> into review-hans,

I have just pushed 1/4 to review-hans.

> I will rebase my changes on top of it and send 3/4,
> 4/4 as v2.
> 
> Will that work for you?

Yes sounds good, thank you.

Regards,

Hans






>>>> - Read SMU version at the time of probe to avoid duplication of code
>>>
>>> Please address the comments made on this patch (or drop it).
>>>
>>> I assume the rest relies on this patch, so I'm going to drop this
>>> entire series from my queue now.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>>
>>>> - Add a Firmware command that can force flush the Spill to DRAM contents.
>>>> - override the STB dump size with a custom one using a module_param
>>>>
>>>>
>>>> Shyam Sundar S K (4):
>>>>   platform/x86/amd/pmc: Move PMC driver to separate directory
>>>>   platform/x86/amd/pmc: Read SMU version at the time of probe
>>>>   platform/x86/amd/pmc: Add PMFW command id to support S2D force flush
>>>>   platform/x86/amd/pmc: Add dump_custom_stb module parameter
>>>>
>>>>  MAINTAINERS                                   |  2 +-
>>>>  drivers/platform/x86/amd/Kconfig              | 16 +---
>>>>  drivers/platform/x86/amd/Makefile             |  3 +-
>>>>  drivers/platform/x86/amd/pmc/Kconfig          | 19 +++++
>>>>  drivers/platform/x86/amd/pmc/Makefile         |  8 ++
>>>>  .../platform/x86/amd/{ => pmc}/pmc-quirks.c   |  0
>>>>  drivers/platform/x86/amd/{ => pmc}/pmc.c      | 80 ++++++++-----------
>>>>  drivers/platform/x86/amd/{ => pmc}/pmc.h      |  1 +
>>>>  8 files changed, 66 insertions(+), 63 deletions(-)
>>>>  create mode 100644 drivers/platform/x86/amd/pmc/Kconfig
>>>>  create mode 100644 drivers/platform/x86/amd/pmc/Makefile
>>>>  rename drivers/platform/x86/amd/{ => pmc}/pmc-quirks.c (100%)
>>>>  rename drivers/platform/x86/amd/{ => pmc}/pmc.c (96%)
>>>>  rename drivers/platform/x86/amd/{ => pmc}/pmc.h (98%)
>>>>
>>
> 

