Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE79CC4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 07:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7B8761AAB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 07:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234168AbhHPHlS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Aug 2021 03:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20500 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234087AbhHPHlR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 03:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629099646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qa0k7YfK426kscE1aO9nV6tBlvwHBeAflkVJmCdxnBg=;
        b=JcDANbVQY5z/ObFTZiY1U1n5liD6wpkIHm3D9N55O6rrwdTlD5kQy2LvDRkvnNroSrINoU
        66TYUac2uVvqIOo1nud4kRrqL3c/nNUyTtdhOPgPnYH4AnaHCqvh2thQACXzT5R7EcaLbl
        czZZCnvDceUWIpEluidVy45USqh+lGM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-HJsrBr07NOiPuyFthbcSKA-1; Mon, 16 Aug 2021 03:40:44 -0400
X-MC-Unique: HJsrBr07NOiPuyFthbcSKA-1
Received: by mail-ej1-f69.google.com with SMTP id gg1-20020a170906e281b029053d0856c4cdso4359856ejb.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Aug 2021 00:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qa0k7YfK426kscE1aO9nV6tBlvwHBeAflkVJmCdxnBg=;
        b=jr/rmJ+cdNRVBudA+ZOzW/ZtxpMktq/CP1NGhTLdGe6y1H3aUIrN5adeDoP0MxMkDe
         B1vhvYfMGJmfB/KM2dF/gvGFLrBjacAUBzzT+q5wxu1e1IKw4NKMHg+cIufG+7+fN15t
         kkjzuntkt7kSykARQPmt3c5Ymtbvo1zhSNQ0Q0z/D/ZdFSoztdpBxOSEZF0V01trGM6C
         NaoEZ4FOvf3LR5+mX2sOdcV8odejZAAnaV1ZukVvJlehKMuMt0c2o/7y3KvjWBap9xio
         MQiXwaQDGVDzKLXu6q8F6DnI0ZGnVfx6G8sF8JjV4DVR467lHwluGadE3kWNwjmTEYWH
         D9Hg==
X-Gm-Message-State: AOAM531kzplhoE6AebQNhZ6KPoAgyy+x5ycNSoii3cIA0iyRA84/+KmY
        Rk+Jd82rL8TBFJwAUkk4qMLsNdXWv6YAFpBNkHK7RUO5KZ6eWtRKfI+VW6DtsWFFoJv4fkxj/SA
        XbE3QyKitmPYDQ5K+V1qs19K6UrKJMO9vB/IEqTApuIT92Nl+rt8wahKLiNldFBY22nKyvs3XDx
        JbvMmCeHxrXA==
X-Received: by 2002:a17:906:f992:: with SMTP id li18mr14687501ejb.381.1629099643564;
        Mon, 16 Aug 2021 00:40:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVzfV6W70SaJzNL9QPzO4whCtUqhAJq1HLbPM3/af2bXaM1EgJHhZ/ISk8gyuKhevKRY5X7w==
X-Received: by 2002:a17:906:f992:: with SMTP id li18mr14687471ejb.381.1629099643380;
        Mon, 16 Aug 2021 00:40:43 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id h10sm4406619edb.74.2021.08.16.00.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 00:40:42 -0700 (PDT)
Subject: Re: [PATCH 18/20] Move Intel thermal driver for menlow platform
 driver to intel/ directory to improve readability.
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "Thomas, Sujith" <sujith.thomas@intel.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Zha, Qipeng" <qipeng.zha@intel.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "Joseph, Jithu" <jithu.joseph@intel.com>,
        "irenic.rajneesh@gmail.com" <irenic.rajneesh@gmail.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "acelan.kao@canonical.com" <acelan.kao@canonical.com>,
        "Box, David E" <david.e.box@intel.com>,
        "Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
        "alex.hung@canonical.com" <alex.hung@canonical.com>,
        "hpa@redhat.com" <hpa@redhat.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "Ma, Maurice" <maurice.ma@intel.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20210810095832.4234-1-hpa@redhat.com>
 <20210810095832.4234-19-hpa@redhat.com>
 <95801e67-f09e-64f3-abd6-f38a8f1f1d51@linaro.org>
 <2cc45082-692d-1a0e-cb44-7e2393c95152@redhat.com>
 <5a80a56e41369204b7729d25f72dfcdd09919033.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e76e99b1-e66b-6339-00a7-b3e2aa0ab8a8@redhat.com>
Date:   Mon, 16 Aug 2021 09:40:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5a80a56e41369204b7729d25f72dfcdd09919033.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/16/21 5:11 AM, Pandruvada, Srinivas wrote:
> On Sun, 2021-08-15 at 16:08 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 8/14/21 12:39 PM, Daniel Lezcano wrote:
>>> On 10/08/2021 11:58, Kate Hsuan wrote:
>>>
>>>
>>> Why not move it into drivers/thermal/intel ?
>>
>> This cleanup is really something which Intel should have been doing
>> itself, but they have not done that, so now Kate has stepped up to
>> do this.
>>
>> Figuring out if there is a better home for each of these drivers
>> really falls outside of the scope of this. If Intel and specifically
>> Sujith Thomas, the maintainer for that driver who is in the Cc,
>> believe that drivers/thermal/intel is a better place then they
>> can submit a patch for this themselves.
>>
>> If Intel does that right away, then this patch can be dropped from
>> Kate's patch-set. Otherwise this can be moved a second time once
>> someone from Intel gets around to it.
> We can move to thermal/intel. I will submit a change to do that.

Great, I see that you've already send a patch for this, thank you.

Kate, please drop this patch from your series.

Regards,

Hans


>>>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>>>> ---
>>>>  drivers/platform/x86/Kconfig                       |  8 --------
>>>>  drivers/platform/x86/Makefile                      |  2 +-
>>>>  drivers/platform/x86/intel/Kconfig                 |  1 +
>>>>  drivers/platform/x86/intel/Makefile                |  2 ++
>>>>  drivers/platform/x86/intel/menlow/Kconfig          | 14
>>>> ++++++++++++++
>>>>  drivers/platform/x86/intel/menlow/Makefile         |  6 ++++++
>>>>  .../platform/x86/{ => intel/menlow}/intel_menlow.c |  0
>>>>  7 files changed, 24 insertions(+), 9 deletions(-)
>>>>  create mode 100644 drivers/platform/x86/intel/menlow/Kconfig
>>>>  create mode 100644 drivers/platform/x86/intel/menlow/Makefile
>>>>  rename drivers/platform/x86/{ => intel/menlow}/intel_menlow.c
>>>> (100%)
>>>>
>>>> diff --git a/drivers/platform/x86/Kconfig
>>>> b/drivers/platform/x86/Kconfig
>>>> index b9c0d2d97793..50ded236a841 100644
>>>> --- a/drivers/platform/x86/Kconfig
>>>> +++ b/drivers/platform/x86/Kconfig
>>>> @@ -632,15 +632,7 @@ config THINKPAD_LMI
>>>>  
>>>>  source "drivers/platform/x86/intel/Kconfig"
>>>>  
>>>> -config INTEL_MENLOW
>>>> -       tristate "Thermal Management driver for Intel menlow
>>>> platform"
>>>> -       depends on ACPI_THERMAL
>>>> -       select THERMAL
>>>> -       help
>>>> -         ACPI thermal management enhancement driver on
>>>> -         Intel Menlow platform.
>>>>  
>>>> -         If unsure, say N.
>>>>  
>>>>  config INTEL_OAKTRAIL
>>>>         tristate "Intel Oaktrail Platform Extras"
>>>> diff --git a/drivers/platform/x86/Makefile
>>>> b/drivers/platform/x86/Makefile
>>>> index f4c6ced59da1..ea5f5dd3f78a 100644
>>>> --- a/drivers/platform/x86/Makefile
>>>> +++ b/drivers/platform/x86/Makefile
>>>> @@ -67,7 +67,7 @@ obj-$(CONFIG_THINKPAD_LMI)    += think-lmi.o
>>>>  obj-$(CONFIG_X86_PLATFORM_DRIVERS_INTEL)               += intel/
>>>>  
>>>>  
>>>> -obj-$(CONFIG_INTEL_MENLOW)             += intel_menlow.o
>>>> +
>>>>  obj-$(CONFIG_INTEL_OAKTRAIL)           += intel_oaktrail.o
>>>>  obj-$(CONFIG_INTEL_VBTN)               += intel-vbtn.o
>>>>  
>>>> diff --git a/drivers/platform/x86/intel/Kconfig
>>>> b/drivers/platform/x86/intel/Kconfig
>>>> index 4efb5ad3e3e1..59c9b602c784 100644
>>>> --- a/drivers/platform/x86/intel/Kconfig
>>>> +++ b/drivers/platform/x86/intel/Kconfig
>>>> @@ -36,6 +36,7 @@ source
>>>> "drivers/platform/x86/intel/intel_speed_select_if/Kconfig"
>>>>  source "drivers/platform/x86/intel/turbo_max_3/Kconfig"
>>>>  source "drivers/platform/x86/intel/uncore_freq/Kconfig"
>>>>  source "drivers/platform/x86/intel/int0002/Kconfig"
>>>> +source "drivers/platform/x86/intel/menlow/Kconfig"
>>>>  
>>>>  
>>>>  endif # X86_PLATFORM_DRIVERS_INTEL
>>>> diff --git a/drivers/platform/x86/intel/Makefile
>>>> b/drivers/platform/x86/intel/Makefile
>>>> index fe5058c3af18..b2326554bd84 100644
>>>> --- a/drivers/platform/x86/intel/Makefile
>>>> +++ b/drivers/platform/x86/intel/Makefile
>>>> @@ -12,6 +12,7 @@ obj-$(CONFIG_INTEL_HID_EVENT)         += hid/
>>>>  obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)  += wmi/
>>>>  obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)    += wmi/
>>>>  obj-$(CONFIG_INTEL_INT0002_VGPIO)      += int0002/
>>>> +obj-$(CONFIG_INTEL_MENLOW)             += menlow/
>>>>  
>>>>  
>>>>  # Intel PMIC / PMC / P-Unit devices
>>>> @@ -38,3 +39,4 @@ obj-
>>>> $(CONFIG_INTEL_SPEED_SELECT_INTERFACE)    +=
>>>> intel_speed_select_if/
>>>>  obj-$(CONFIG_INTEL_TURBO_MAX_3)                        +=
>>>> turbo_max_3/
>>>>  obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)                +=
>>>> uncore_freq/
>>>>  
>>>> +
>>>> diff --git a/drivers/platform/x86/intel/menlow/Kconfig
>>>> b/drivers/platform/x86/intel/menlow/Kconfig
>>>> new file mode 100644
>>>> index 000000000000..b2920d259ff7
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/intel/menlow/Kconfig
>>>> @@ -0,0 +1,14 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +#
>>>> +# Intel x86 Platform Specific Drivers
>>>> +#
>>>> +
>>>> +config INTEL_MENLOW
>>>> +       tristate "Thermal Management driver for Intel menlow
>>>> platform"
>>>> +       depends on ACPI_THERMAL
>>>> +       select THERMAL
>>>> +       help
>>>> +         ACPI thermal management enhancement driver on
>>>> +         Intel Menlow platform.
>>>> +
>>>> +         If unsure, say N.
>>>> diff --git a/drivers/platform/x86/intel/menlow/Makefile
>>>> b/drivers/platform/x86/intel/menlow/Makefile
>>>> new file mode 100644
>>>> index 000000000000..0e9fda9bff98
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/intel/menlow/Makefile
>>>> @@ -0,0 +1,6 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +#
>>>> +# Intel x86 Platform Specific Drivers
>>>> +#
>>>> +
>>>> +obj-$(CONFIG_INTEL_MENLOW)             += intel_menlow.o
>>>> diff --git a/drivers/platform/x86/intel_menlow.c
>>>> b/drivers/platform/x86/intel/menlow/intel_menlow.c
>>>> similarity index 100%
>>>> rename from drivers/platform/x86/intel_menlow.c
>>>> rename to drivers/platform/x86/intel/menlow/intel_menlow.c
>>>>
>>>
>>>
>>
> 

