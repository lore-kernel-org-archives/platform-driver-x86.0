Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB4DC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 12:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6509360F58
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 12:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237321AbhHQMVI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Aug 2021 08:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40327 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236165AbhHQMVH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Aug 2021 08:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629202833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WCWwKgC8vUsuE2WE9PyNVC6D7ecItWbGxz5ws2wCHCE=;
        b=U32vq/8vIvZPpsat+375ezdQefm7Vak1Lo3Axw6JMpYGSYdIpMNAFoMiYI/8A4rZm4TkRH
        sTR0WdnQGeKvHqwaDwlvx3w87ShsjlfjxfOiTgS18ghjAW5mgbsQaNFSstmfGjj2Q+YTNd
        BFvd/avnp7nUfbdpdkcAAMkArsh/QAU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-LA-MtAJmN0SnHMufi-E48g-1; Tue, 17 Aug 2021 08:20:32 -0400
X-MC-Unique: LA-MtAJmN0SnHMufi-E48g-1
Received: by mail-ej1-f71.google.com with SMTP id v19-20020a170906b013b02905b2f1bbf8f3so5914054ejy.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Aug 2021 05:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WCWwKgC8vUsuE2WE9PyNVC6D7ecItWbGxz5ws2wCHCE=;
        b=iwK2UjKz1a0iF4kUhy8KplLoho+CA34nqQHv4S2X+wCpXGauGbIg64M/2AAaVmZRcL
         2y2E2XGlKEJHj9mtFUt0M62MjqktChORyVi7L7vuv3G1kzzy8YzD/uh9ryxhZrXLPmDJ
         sI5qmvS0fxOAUShFUDRBqKGXqJ3tKATdR6eSENB7fSL7m6nOwsw8aqfZX/79jUrPkNDH
         w6JT9jWVlI1I+Rrwb6qMVDn+EsEUMiH4rlyGBjFNRPQTWh0dAo2OEf7PxxJE52oyAQFe
         dwjYtwD8u71SV9/KOa8KUpHzVmy8n5LZF710OXWACS2RspkYWfDMMJ2+Ndz9jbx4WvkV
         bcXw==
X-Gm-Message-State: AOAM531sqcCWxlK/532Vz2UeYWdaETbkksBq4XY9KoDSb4gF543H51+j
        lXvVMLb04EkbUwSrHxysZRm8RFsxufta/6z1KFjOj3ldYxrQBEf6YNdjY4iue+tYSD9H8nPlFmd
        K+yamoh+6dH2dty74LgY5+55MpoSraepvcp6nCvS/5Jij4GO86o47hvOhDbNap2Ov29OLeRwxCU
        s2UFk938+W8g==
X-Received: by 2002:a05:6402:202:: with SMTP id t2mr3896512edv.116.1629202830924;
        Tue, 17 Aug 2021 05:20:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfibEi13rdYKjmR2wH9W3qnvKvw18KjDU95pwjXi8K1iXWhRDD7mNrmC0DlsP2FBPlov84Xw==
X-Received: by 2002:a05:6402:202:: with SMTP id t2mr3896495edv.116.1629202830763;
        Tue, 17 Aug 2021 05:20:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cq12sm862402edb.43.2021.08.17.05.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 05:20:30 -0700 (PDT)
Subject: Re: [PATCH] thermal/drivers/intel: Move intel_menlow to thermal
 drivers
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        rui.zhang@intel.com, daniel.lezcano@linaro.org, hpa@redhat.com,
        mgross@linux.intel.com, alex.hung@canonical.com,
        sujith.thomas@intel.com, andriy.shevchenko@linux.intel.com
Cc:     linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20210816035356.1955982-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <84a22ffa-9369-6da4-9bb9-67113174519e@redhat.com>
Date:   Tue, 17 Aug 2021 14:20:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816035356.1955982-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/16/21 5:53 AM, Srinivas Pandruvada wrote:
> Moved drivers/platform/x86/intel_menlow.c to drivers/thermal/intel.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

(with the 2 acks from the thermal subsys maintainers added)

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  MAINTAINERS                                            |  4 ++--
>  drivers/platform/x86/Kconfig                           | 10 ----------
>  drivers/platform/x86/Makefile                          |  1 -
>  drivers/thermal/intel/Kconfig                          |  9 +++++++++
>  drivers/thermal/intel/Makefile                         |  1 +
>  drivers/{platform/x86 => thermal/intel}/intel_menlow.c |  0
>  6 files changed, 12 insertions(+), 13 deletions(-)
>  rename drivers/{platform/x86 => thermal/intel}/intel_menlow.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd25e4ecf0b9..4231aea31a6f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9459,10 +9459,10 @@ F:	include/linux/mfd/intel-m10-bmc.h
>  
>  INTEL MENLOW THERMAL DRIVER
>  M:	Sujith Thomas <sujith.thomas@intel.com>
> -L:	platform-driver-x86@vger.kernel.org
> +L:	linux-pm@vger.kernel.org
>  S:	Supported
>  W:	https://01.org/linux-acpi
> -F:	drivers/platform/x86/intel_menlow.c
> +F:	drivers/thermal/intel/intel_menlow.c
>  
>  INTEL P-Unit IPC DRIVER
>  M:	Zha Qipeng <qipeng.zha@intel.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d12db6c316ea..da312426b4a5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -720,16 +720,6 @@ config INTEL_INT0002_VGPIO
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called intel_int0002_vgpio.
>  
> -config INTEL_MENLOW
> -	tristate "Thermal Management driver for Intel menlow platform"
> -	depends on ACPI_THERMAL
> -	select THERMAL
> -	help
> -	  ACPI thermal management enhancement driver on
> -	  Intel Menlow platform.
> -
> -	  If unsure, say N.
> -
>  config INTEL_OAKTRAIL
>  	tristate "Intel Oaktrail Platform Extras"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 7ee369aab10d..0d3af23f1186 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -72,7 +72,6 @@ obj-$(CONFIG_INTEL_ATOMISP2_LED)	+= intel_atomisp2_led.o
>  obj-$(CONFIG_INTEL_ATOMISP2_PM)		+= intel_atomisp2_pm.o
>  obj-$(CONFIG_INTEL_HID_EVENT)		+= intel-hid.o
>  obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
> -obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
>  obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
>  obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
>  
> diff --git a/drivers/thermal/intel/Kconfig b/drivers/thermal/intel/Kconfig
> index e4299ca3423c..c83ea5d04a1d 100644
> --- a/drivers/thermal/intel/Kconfig
> +++ b/drivers/thermal/intel/Kconfig
> @@ -90,3 +90,12 @@ config INTEL_TCC_COOLING
>  	  Note that, on different platforms, the behavior might be different
>  	  on how fast the setting takes effect, and how much the CPU frequency
>  	  is reduced.
> +
> +config INTEL_MENLOW
> +	tristate "Thermal Management driver for Intel menlow platform"
> +	depends on ACPI_THERMAL
> +	help
> +	  ACPI thermal management enhancement driver on
> +	  Intel Menlow platform.
> +
> +	  If unsure, say N.
> diff --git a/drivers/thermal/intel/Makefile b/drivers/thermal/intel/Makefile
> index 5ff2afa388f7..960b56268b4a 100644
> --- a/drivers/thermal/intel/Makefile
> +++ b/drivers/thermal/intel/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_INTEL_BXT_PMIC_THERMAL) += intel_bxt_pmic_thermal.o
>  obj-$(CONFIG_INTEL_PCH_THERMAL)	+= intel_pch_thermal.o
>  obj-$(CONFIG_INTEL_TCC_COOLING)	+= intel_tcc_cooling.o
>  obj-$(CONFIG_X86_THERMAL_VECTOR) += therm_throt.o
> +obj-$(CONFIG_INTEL_MENLOW)	+= intel_menlow.o
> diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/thermal/intel/intel_menlow.c
> similarity index 100%
> rename from drivers/platform/x86/intel_menlow.c
> rename to drivers/thermal/intel/intel_menlow.c
> 

