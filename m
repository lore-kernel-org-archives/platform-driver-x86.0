Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4087C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 14:58:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACFC6610A0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 14:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233756AbhIUPAE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 11:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48872 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233647AbhIUPAD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 11:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632236314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gpypRbetDoW4vlrOOyiS3JIREgB/4Ibwu6EOgqNDQfU=;
        b=Af0Vzxw4o3b9FVEvB51w7JdPRNnjfRMi6OZONzY43O1u9k/9HyHpzbwZrilOUzqRVg71pP
        NwWGLRLHi78CpZMkzdymNuD1aAR9vtgMDaYqseQ/wfj8ufmY8HGmESWxBXrBcgOg07ymh2
        92+N0+KjUuCt3ShkGT2XF1q4I6aVSiU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-E85CvGrXMASzgZWrCbVCYg-1; Tue, 21 Sep 2021 10:58:33 -0400
X-MC-Unique: E85CvGrXMASzgZWrCbVCYg-1
Received: by mail-ed1-f70.google.com with SMTP id m30-20020a50999e000000b003cdd7680c8cso19274538edb.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Sep 2021 07:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gpypRbetDoW4vlrOOyiS3JIREgB/4Ibwu6EOgqNDQfU=;
        b=GtZlr6HOsfn9wCtJo2fk03boS6kd1X9MpIFbS90EvjvZMlQruSW0zzhXiR157emepN
         Xc6AQ2icp3tuI1CaZcQX2BDSb/MLKHcCTG7naxlrpckSEbourdsX2ViX1XesnPU7/KY4
         EwpAAUSLvyVFsCWNgDR37sRL9IKN0MlJqz4Qn63yohbQMqgk6+fpmCubZhk5P0qsVP4e
         b3Wfs9kBerlk3cy5C3L3nEEW1ChsqS/AA9kq4QQwelcjepwLhOcsHCGIwwBU3851wMZO
         IX6Y4aAkprryBsYktGzI7r90qcEwuSnr3PpASvy6UX5DsNocRXdFruPkUiOPRELv1zBd
         GwSA==
X-Gm-Message-State: AOAM533VysbHOkEL4FPQ8RS/1Y99naSFvC6NbBNIs4emqAW4BklVxV3s
        xNKQGyYmxZLhSVOjrgA6KU7P01Ff/rJadJviw12WYAP+h2+G00OsP8OzwMG+vLeqG2bLZy8rOB6
        6+i2ltEwv9GoRI3b3+6v9gFvLhNj/7zV1pA==
X-Received: by 2002:a17:906:1c99:: with SMTP id g25mr34667640ejh.521.1632236312435;
        Tue, 21 Sep 2021 07:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKgHYXQ0BPzeCWyg3QC6cJ+ov6yXGO6lhEj+cWv2lLWj4V81UUlpqu9xkp2NcdO2411nF6yQ==
X-Received: by 2002:a17:906:1c99:: with SMTP id g25mr34667609ejh.521.1632236312194;
        Tue, 21 Sep 2021 07:58:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n25sm8537415eda.95.2021.09.21.07.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 07:58:31 -0700 (PDT)
Subject: Re: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "mario.limonciello@outlook.com" <mario.limonciello@outlook.com>,
        "pobrn@protonmail.com" <pobrn@protonmail.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        Aaron Plattner <aplattner@nvidia.com>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
References: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <20210903003838.15797-1-ddadap@nvidia.com>
 <11ffe8bc-b4ee-c451-9860-46997de8fe55@redhat.com>
 <20210920132911.cus27elz36dme63g@pali>
 <8b07125d-83b9-9de4-fd52-1cb01466364a@redhat.com>
 <20210920135106.y6mi57bcmurczmka@pali>
 <57a958e2-93d7-3eea-ec7b-9496acd6aae5@redhat.com>
 <A116D719-A0BD-4FA5-A758-E48D6428A8A6@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9cbb4e7a-4af9-32f8-0293-6c2ef7d44ceb@redhat.com>
Date:   Tue, 21 Sep 2021 16:58:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <A116D719-A0BD-4FA5-A758-E48D6428A8A6@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/21 4:29 PM, Daniel Dadap wrote:
> 
>> On Sep 21, 2021, at 08:53, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> ﻿Hi,
>>
>>> On 9/20/21 3:51 PM, Pali Rohár wrote:
>>>> On Monday 20 September 2021 15:33:20 Hans de Goede wrote:
>>>> Hi Pali,
>>>>
>>>> On 9/20/21 3:29 PM, Pali Rohár wrote:
>>>>> On Monday 13 September 2021 11:01:50 Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 9/3/21 2:38 AM, Daniel Dadap wrote:
>>>>>>> A number of upcoming notebook computer designs drive the internal
>>>>>>> display panel's backlight PWM through the Embedded Controller (EC).
>>>>>>> This EC-based backlight control can be plumbed through to an ACPI
>>>>>>> "WMAA" method interface, which in turn can be wrapped by WMI with
>>>>>>> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>>>>>>>
>>>>>>> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
>>>>>>> backlight class driver to control backlight levels on systems with
>>>>>>> EC-driven backlights.
>>>>>>>
>>>>>>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>>>>>>> Reviewed-By: Thomas Weißschuh <linux@weissschuh.net>
>>>>>>
>>>>>> Thank you for your patch, I've applied this patch to my review-hans 
>>>>>> branch:
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>>>>>
>>>>>> Note it will show up in my review-hans branch once I've pushed my
>>>>>> local branch there, which might take a while.
>>>>>>
>>>>>> Once I've run some tests on this branch the patches there will be
>>>>>> added to the platform-drivers-x86/for-next branch and eventually
>>>>>> will be included in the pdx86 pull-request to Linus for the next
>>>>>> merge-window.
>>>>>
>>>>> Hello Hans!
>>>>>
>>>>> I would suggest to rename this driver and config option to not include
>>>>> -AA in its name. WMAA is just internal name of ACPI method, composed
>>>>> from two parts: "WM" and "AA". Second part "AA" is read from the _WDG
>>>>> where is the translation table from WMI GUID (in this case 603E9613...)
>>>>> to ACPI method name. "AA" is just autogenerated identifier by wmi
>>>>> compiler and because names are ASCII strings, I guess "AA" could mean
>>>>> the first (autogenerated) method. In the whole driver code you are not
>>>>> using AA function name, but directly WMI GUID, which also means that
>>>>> driver is prepared if vendor "recompiles" wmi code in acpi (and compiler
>>>>> generates another identifier, not AA). Also another argument is that
>>>>> there can be lot of other laptops which have WMAA ACPI method but they
>>>>> can have different API or do something totally different. So name WMAA
>>>>> is in this wmi context very misleading. Rather it should be named by
>>>>> vendor.
>>>>
>>>> Right, that is a very valid point. I should have spotted this myself.
>>>>
>>>> So what would be a better name wmi-nvidia-backlight.ko I guess ?
>>>> (and update the rest to match ?)
>>>
>>> It looks like that no vendor driver starts with "wmi-" prefix. "-wmi"
>>> string is used as a suffix. So for consistency it would be better to
>>> choose "nvidia-backlight-wmi.ko".
>>
>> Right, I should have checked first.
>>
>> So I just checked and the standard pattern used is:
>> vendor_wmi_feature
>>
>> So lets go with nvidia_wmi_backlight.ko
>>
>> Daniel, can you prepare a patch on top of your merged patch to do
>> the rename of the Kconfig entry and the module-name please?
>>
> 
> Yes, I already had a patch prepared to rename things to nvidia-backlight-wmi; I am waiting to hear back from some folks if there’s a more specific name that might be appropriate (e.g. a name of a particular feature tied to this) or if it should be more generic (e.g., if there is a strong possibility this design may be used in systems with no NVIDIA GPU); while I’m waiting for those answers, I’ll switch to nvidia-wmi-backlight as the assumed option, if there isn’t something more appropriate.

Ok, sounds good, thank you.

Regards,

Hans

