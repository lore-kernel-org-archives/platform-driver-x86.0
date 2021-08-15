Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E387AC4338F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 15 Aug 2021 14:08:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C24E06103A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 15 Aug 2021 14:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238401AbhHOOIt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 15 Aug 2021 10:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29164 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238351AbhHOOIt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 Aug 2021 10:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629036499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qfa93i2ZK7DbW0IUEkpbw8qs/9PpSQu7yX+YS2BAR6k=;
        b=P0v0ObU0yBNlm13YPBQMwiPWcS+X/JCUF0aW751u95myG4Cq6HRLZFpb6uZ5/8jL+U58eY
        zcnk4sNWiHtMKua+cLCJmQEkyJX8SdC1vETOBgogjJlUuhsOvIsgeIl5B+QC68o1JO4mg3
        +gUuX4H2fOukkXDmGhzp9sXEb6IYN6c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-Ym1VvDG1MIy-jrL0D8Vf3Q-1; Sun, 15 Aug 2021 10:08:18 -0400
X-MC-Unique: Ym1VvDG1MIy-jrL0D8Vf3Q-1
Received: by mail-ed1-f71.google.com with SMTP id n4-20020aa7c6840000b02903be94ce771fso6902934edq.11
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Aug 2021 07:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qfa93i2ZK7DbW0IUEkpbw8qs/9PpSQu7yX+YS2BAR6k=;
        b=D8dtibeA1SyncHgFFjzQCrSzVCaSGCM7NCpI5M/YJD5cVh34vy7mEnwR5plmRuKZca
         3J8Ik+Y7sBUdUVuiZU4xjoYNMGvZPeGDzFeSHYNSINyDiEcuxHNOJAfZ2RbtY/MAfoZJ
         umsww0/STC1gkQAtNUYQoCvIyIEYTQmwNWJIwIpHGTApbcTUJgyv+320BSJBX51kcTUF
         WkCZm9Y8Phj67s819fkukLglyfJcuqQtOdmiBC3BfRQj9uw5O4pNpz8/sYptG0eM2DVQ
         k+dTfDNEe39LUo5KjZy6rOEHWGnhO/zlLmolSvL7PfEq7jRz8yMS3R1HvRjh1AJwY31d
         ZNwA==
X-Gm-Message-State: AOAM532xI9mkk1zkFlzM189NTWpl78IeLhLXsXX4qAlg7UhxQtaN0VTF
        ML3wzQW8M40/MBLubYYQXP2r2H7JmxyfIWcq4xU3cYsQum29VHMAt10m4P/rl0fGRyx3H2GU3bO
        z/0IqL0m8cza2KNmBQmGBmFpV7uRci3bYNEQQEXMJvisVv0OIZfK0ylNBymAzsbbiJ2mUc5eqrn
        fqAxXB6Ysdqg==
X-Received: by 2002:a17:906:4c8c:: with SMTP id q12mr11800040eju.254.1629036496510;
        Sun, 15 Aug 2021 07:08:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmOXMQdn/lV07UFN4n3lH5B9FmUnKjIwhknB/xOrcr8kwmEjwwGHrsKwX4X29feraB4eRNZA==
X-Received: by 2002:a17:906:4c8c:: with SMTP id q12mr11800012eju.254.1629036496234;
        Sun, 15 Aug 2021 07:08:16 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i26sm2720381ejh.4.2021.08.15.07.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Aug 2021 07:08:15 -0700 (PDT)
Subject: Re: [PATCH 18/20] Move Intel thermal driver for menlow platform
 driver to intel/ directory to improve readability.
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Alex Hung <alex.hung@canonical.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20210810095832.4234-1-hpa@redhat.com>
 <20210810095832.4234-19-hpa@redhat.com>
 <95801e67-f09e-64f3-abd6-f38a8f1f1d51@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2cc45082-692d-1a0e-cb44-7e2393c95152@redhat.com>
Date:   Sun, 15 Aug 2021 16:08:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <95801e67-f09e-64f3-abd6-f38a8f1f1d51@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/14/21 12:39 PM, Daniel Lezcano wrote:
> On 10/08/2021 11:58, Kate Hsuan wrote:
> 
> 
> Why not move it into drivers/thermal/intel ?

This cleanup is really something which Intel should have been doing
itself, but they have not done that, so now Kate has stepped up to
do this.

Figuring out if there is a better home for each of these drivers
really falls outside of the scope of this. If Intel and specifically
Sujith Thomas, the maintainer for that driver who is in the Cc,
believe that drivers/thermal/intel is a better place then they
can submit a patch for this themselves.

If Intel does that right away, then this patch can be dropped from
Kate's patch-set. Otherwise this can be moved a second time once
someone from Intel gets around to it.

Regards,

Hans




> 
> 
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> ---
>>  drivers/platform/x86/Kconfig                       |  8 --------
>>  drivers/platform/x86/Makefile                      |  2 +-
>>  drivers/platform/x86/intel/Kconfig                 |  1 +
>>  drivers/platform/x86/intel/Makefile                |  2 ++
>>  drivers/platform/x86/intel/menlow/Kconfig          | 14 ++++++++++++++
>>  drivers/platform/x86/intel/menlow/Makefile         |  6 ++++++
>>  .../platform/x86/{ => intel/menlow}/intel_menlow.c |  0
>>  7 files changed, 24 insertions(+), 9 deletions(-)
>>  create mode 100644 drivers/platform/x86/intel/menlow/Kconfig
>>  create mode 100644 drivers/platform/x86/intel/menlow/Makefile
>>  rename drivers/platform/x86/{ => intel/menlow}/intel_menlow.c (100%)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index b9c0d2d97793..50ded236a841 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -632,15 +632,7 @@ config THINKPAD_LMI
>>  
>>  source "drivers/platform/x86/intel/Kconfig"
>>  
>> -config INTEL_MENLOW
>> -	tristate "Thermal Management driver for Intel menlow platform"
>> -	depends on ACPI_THERMAL
>> -	select THERMAL
>> -	help
>> -	  ACPI thermal management enhancement driver on
>> -	  Intel Menlow platform.
>>  
>> -	  If unsure, say N.
>>  
>>  config INTEL_OAKTRAIL
>>  	tristate "Intel Oaktrail Platform Extras"
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index f4c6ced59da1..ea5f5dd3f78a 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -67,7 +67,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>>  obj-$(CONFIG_X86_PLATFORM_DRIVERS_INTEL)		+= intel/
>>  
>>  
>> -obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
>> +
>>  obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
>>  obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
>>  
>> diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
>> index 4efb5ad3e3e1..59c9b602c784 100644
>> --- a/drivers/platform/x86/intel/Kconfig
>> +++ b/drivers/platform/x86/intel/Kconfig
>> @@ -36,6 +36,7 @@ source "drivers/platform/x86/intel/intel_speed_select_if/Kconfig"
>>  source "drivers/platform/x86/intel/turbo_max_3/Kconfig"
>>  source "drivers/platform/x86/intel/uncore_freq/Kconfig"
>>  source "drivers/platform/x86/intel/int0002/Kconfig"
>> +source "drivers/platform/x86/intel/menlow/Kconfig"
>>  
>>  
>>  endif # X86_PLATFORM_DRIVERS_INTEL
>> diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
>> index fe5058c3af18..b2326554bd84 100644
>> --- a/drivers/platform/x86/intel/Makefile
>> +++ b/drivers/platform/x86/intel/Makefile
>> @@ -12,6 +12,7 @@ obj-$(CONFIG_INTEL_HID_EVENT)		+= hid/
>>  obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)	+= wmi/
>>  obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= wmi/
>>  obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= int0002/
>> +obj-$(CONFIG_INTEL_MENLOW)		+= menlow/
>>  
>>  
>>  # Intel PMIC / PMC / P-Unit devices
>> @@ -38,3 +39,4 @@ obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE)	+= intel_speed_select_if/
>>  obj-$(CONFIG_INTEL_TURBO_MAX_3)			+= turbo_max_3/
>>  obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= uncore_freq/
>>  
>> +
>> diff --git a/drivers/platform/x86/intel/menlow/Kconfig b/drivers/platform/x86/intel/menlow/Kconfig
>> new file mode 100644
>> index 000000000000..b2920d259ff7
>> --- /dev/null
>> +++ b/drivers/platform/x86/intel/menlow/Kconfig
>> @@ -0,0 +1,14 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Intel x86 Platform Specific Drivers
>> +#
>> +
>> +config INTEL_MENLOW
>> +	tristate "Thermal Management driver for Intel menlow platform"
>> +	depends on ACPI_THERMAL
>> +	select THERMAL
>> +	help
>> +	  ACPI thermal management enhancement driver on
>> +	  Intel Menlow platform.
>> +
>> +	  If unsure, say N.
>> diff --git a/drivers/platform/x86/intel/menlow/Makefile b/drivers/platform/x86/intel/menlow/Makefile
>> new file mode 100644
>> index 000000000000..0e9fda9bff98
>> --- /dev/null
>> +++ b/drivers/platform/x86/intel/menlow/Makefile
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Intel x86 Platform Specific Drivers
>> +#
>> +
>> +obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
>> diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x86/intel/menlow/intel_menlow.c
>> similarity index 100%
>> rename from drivers/platform/x86/intel_menlow.c
>> rename to drivers/platform/x86/intel/menlow/intel_menlow.c
>>
> 
> 

