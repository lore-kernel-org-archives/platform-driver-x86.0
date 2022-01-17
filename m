Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14887C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jan 2022 09:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbiAQJiV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jan 2022 04:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31954 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235819AbiAQJiG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jan 2022 04:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642412285;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=87TQKP21MvIUTnFRp1IlMrCnN3l9CJpODRDFyyIfhfE=;
        b=O3AG/Hp9boFNuBmJi10zx0Nu6eE6kqhh7ok4Ci+R4zwbWH0wPSLp2ARelMJ7YVdEHVsWTq
        HqU7pe3bso5zXwg4ZZzz++3O+GOKufAV99H1sVKZ7Gs2Olz8IEscmK0ljaG7poCmeAiy+T
        2fDaSiN03G6/fO1UdCug4dVfgeJ96Fg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-SmvufMu1N5yCYCmEHfeLVQ-1; Mon, 17 Jan 2022 04:38:03 -0500
X-MC-Unique: SmvufMu1N5yCYCmEHfeLVQ-1
Received: by mail-ed1-f69.google.com with SMTP id o10-20020a056402438a00b00403212b6b1aso604480edc.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jan 2022 01:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=87TQKP21MvIUTnFRp1IlMrCnN3l9CJpODRDFyyIfhfE=;
        b=yiZ1rJQAvD7jIzVDa+YEM0O6pX4uADNMexWFHfo4yaEgMajToRQ1pkK2dPPrvoS7vo
         XWSdc1MfH+lAX+t/LayRg6ystpFsYt6HTwrR0F5qDoLoMRPu/wCITUmeWBnMKSNeo2eF
         mzx3jnfg0p+3Qe3PB1ba+5X2R4Rnruo1E4H02QSJizTUGJpjmqUS6tBlx77HI5iWdhBA
         QO0lwqynvSjLZ3U19I+isnbHCTIEoK13kb2ecGsjaN4S9zuBI8ztyy96L09Y2ZAwLh8I
         A8CoKslfmBHAq9VU3QDsfhxo0jKxF+V5Wfy17J1/dc/wGaV5XlWRnAXC3MSlLvVlgFG6
         1Bow==
X-Gm-Message-State: AOAM533SvvekNvBrvDoCrHCdoZr/jWOyTtdWmuTfJYsB/zRHwHlUwoxW
        /AnAxtQ2iSOj7JJJagTD+U/zeHpIjsxzR+bY82QGIQ6mqs6qu8JGh7rhWk0XxZyW6U5BFusunMt
        egWdL4x8cbwMDi51PyR1DV6vKDB5Xd90W1Q==
X-Received: by 2002:a17:906:b286:: with SMTP id q6mr11945525ejz.496.1642412282166;
        Mon, 17 Jan 2022 01:38:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2KK/fmStojUMqn34rE0EHBYoqOqN0OB1KrIqmFJam0AvqPc5evTRU+IpJZucQ2ivN2RAQ+g==
X-Received: by 2002:a17:906:b286:: with SMTP id q6mr11945515ejz.496.1642412281936;
        Mon, 17 Jan 2022 01:38:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id y2sm5686084eda.45.2022.01.17.01.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 01:38:01 -0800 (PST)
Message-ID: <a8bb5224-e77d-fc3e-4619-2ca5f46305a5@redhat.com>
Date:   Mon, 17 Jan 2022 10:38:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/surface: Reinstate platform dependency
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Jarrett Schultz <jaschultz@microsoft.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220115140849.269479-1-geert@linux-m68k.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220115140849.269479-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/15/22 15:08, Geert Uytterhoeven wrote:
> Microsoft Surface platform-specific devices are only present on
> Microsoft Surface platforms, which are currently limited to arm64 and
> x86.  Hence add a dependency on ARM64 || X86, to prevent asking the user
> about drivers for these devices when configuring a kernel for an
> architecture that does not support Microsoft Surface platforms.
> 
> Fixes: 272479928172edf0 ("platform: surface: Propagate ACPI Dependency")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/surface/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
> index 5f0578e25f718f14..463f1ec5c14e9fa9 100644
> --- a/drivers/platform/surface/Kconfig
> +++ b/drivers/platform/surface/Kconfig
> @@ -5,6 +5,7 @@
>  
>  menuconfig SURFACE_PLATFORMS
>  	bool "Microsoft Surface Platform-Specific Device Drivers"
> +	depends on ARM64 || X86 || COMPILE_TEST
>  	default y
>  	help
>  	  Say Y here to get to see options for platform-specific device drivers
> 

