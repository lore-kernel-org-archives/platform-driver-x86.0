Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFE4C4707F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 09:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55D5C613D1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 09:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235636AbhE0JOL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 05:14:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37312 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235632AbhE0JOK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 05:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622106757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1jPR7s3E82JHijWbKhwg4oaQkpkoYHUtNbwhtKmpujY=;
        b=GTS2gu6KVOh35i+NbUsmUlCSC1yGTJWoB+ejXPSHljxnVrB0LLtqb/uj/gBTCJRPT4uNmO
        JeYNR7uxCm/aDDrklptaEryCUECK4/piaUwS722OwZ/wnfeLlTYtr11OJBYBwq/Vr1Ih7v
        Fm2aL8X6kStfIpoVZXtPSN1p3M8cz2I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-j3JPWnw8NGGbpFvrIj6QaA-1; Thu, 27 May 2021 05:12:35 -0400
X-MC-Unique: j3JPWnw8NGGbpFvrIj6QaA-1
Received: by mail-ej1-f70.google.com with SMTP id r20-20020a170906c294b02903e0626b3387so1405553ejz.16
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 02:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1jPR7s3E82JHijWbKhwg4oaQkpkoYHUtNbwhtKmpujY=;
        b=jRwcsG2jUXJEn+c6dp2r3XdIjeoDibzsXOaWntwjDgqMmXoqW04jbQ5Cp/skDYdJ1n
         /PtooT0mAQ8HC+DGutzM2inDpf/1dK+YaGXjY5NSuCj1kq2pIRGf2QHFyPyvCkYwg1Js
         ubAfV5KuwDKeh1cCQ5zqkslbkshqWgfJm2t1KvPlygjcja/JD/g5S36tF+gm7eUrvdmd
         Wpura0uZbGVvd94RtWxUJV+36plkp5/epoKN9nhp75YkUpKm5rNoZJvSlpgPYxCdghDN
         rSg4q2CSOXZYCAMXtUgQixFkcvIz6ICcD5bqNHliNU8k541FKBemcM6CVk/6C1DY1O9U
         K9XA==
X-Gm-Message-State: AOAM533kykmau9ukNzDQIlOUJ/18nIE34oKNELzgTAdAj2ds4nBtjry/
        02ZE0o1c+e8hlZXmA5M52JVdKKQPySWnz7aHQF2LnlmdXs8RZWixlhlc7tCuE6tzvVLvrceNvWM
        x6+QFC71aghodUTlp/Vjy0dzMzVQfeiUCT6w4XcYVpKhrHFWjT87VTaZYq7iYpr0SCilrEugola
        lblSObDZQEmw==
X-Received: by 2002:a17:907:1c0f:: with SMTP id nc15mr2842231ejc.27.1622106754482;
        Thu, 27 May 2021 02:12:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtuUUXQh2LbhPK+uCdUUY99RLo9Hkc2TrohICPqLBITQYHQCCfL9uoBQ3O7shy/cb9HFcyEw==
X-Received: by 2002:a17:907:1c0f:: with SMTP id nc15mr2842211ejc.27.1622106754254;
        Thu, 27 May 2021 02:12:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c7sm725960ede.37.2021.05.27.02.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 02:12:33 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] platform/x86: firmware_attributes_class: Create
 helper file for handling firmware-attributes class registration events
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     andy.shevchenko@gmail.com, prasanth.ksr@dell.com,
        divya.bharathi@dell.com, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20210526201447.3686-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e5d5dc1e-98be-72a3-1264-7f647edc007f@redhat.com>
Date:   Thu, 27 May 2021 11:12:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526201447.3686-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark, Andy,

Overall this looks pretty good. There are a few very small issues
remaining, but they are so small that I've decided to fix them up
and merge this into my review-hans branch with the issues fixed up.

I plan to let this sit in review-hans a bit longer then usual to
give you (Mark) a chance to check out the changes and ack them
and to give Andy the time to check if his review remarks were
addressed to his liking.

I've put remarks inline / below about the few things which
I've fixed up in this patch. I'll also reply to patch 3/3
with the fixups which I've done there.

On 5/26/21 10:14 PM, Mark Pearson wrote:
> This will be used by the Dell and Lenovo WMI management drivers to
> prevent both drivers being active.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Changes in v2:
>  - This is a new file requested as part of the review of the proposed
> think_lmi.c driver. Labeling as V2 to keep series consistent
> 
> Changes in v3:
>  - Set default in Kconfig, and removed help text
>  - Allow multiple modules to register with module. Change API names to
>     better reflect this.
> 
> Changes in v4:
>  - version bump for consistency in series
> 
>  drivers/platform/x86/Kconfig                  |  4 ++
>  drivers/platform/x86/Makefile                 |  1 +
>  .../platform/x86/firmware_attributes_class.c  | 53 +++++++++++++++++++
>  .../platform/x86/firmware_attributes_class.h  | 13 +++++
>  4 files changed, 71 insertions(+)
>  create mode 100644 drivers/platform/x86/firmware_attributes_class.c
>  create mode 100644 drivers/platform/x86/firmware_attributes_class.h
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2714f7c38..57da8352d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1076,6 +1076,10 @@ config TOUCHSCREEN_DMI
>  	  the OS-image for the device. This option supplies the missing info.
>  	  Enable this for x86 tablets with Silead or Chipone touchscreens.
>  
> +config FW_ATTR_CLASS
> +	tristate "Firmware attributes class helper module"

This should be just "	tristate" adding a string after the "tristate"
makes this user selectable, I've dropped the string.

> +	default n
> +
>  config INTEL_IMR
>  	bool "Intel Isolated Memory Region support"
>  	depends on X86_INTEL_QUARK && IOSF_MBI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index dcc8cdb95..147573f69 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -115,6 +115,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
>  obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
>  obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
> +obj-$(CONFIG_FW_ATTR_CLASS)             += firmware_attributes_class.o

This was using spaces instead of tabs for indent before the += and
it did not apply because of the "platform/x86: Rename hp-wireless to wireless-hotkey"
patch in review-hans.


>  # Intel uncore drivers
>  obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
> new file mode 100644
> index 000000000..31393ce4d
> --- /dev/null
> +++ b/drivers/platform/x86/firmware_attributes_class.c

This file had a couple of trailing empty lines which I've stripped.

> --- /dev/null
> +++ b/drivers/platform/x86/firmware_attributes_class.h

Idem, and also the same for think-lmi.c from patch 3/3.

Regards,

Hans

