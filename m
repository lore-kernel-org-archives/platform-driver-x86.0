Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BA8C83F12
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Aug 2023 08:49:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjH1ItD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Aug 2023 04:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjH1Isb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Aug 2023 04:48:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C45E5
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 01:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693212469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZIR24c3vPFcM6K3A8B2/DkgNIDGAMx2+kAdxcC9gh4E=;
        b=LzXG3/Wp3Y3AIBqcpQfE4uejo5HxA0+ZXfs+hcfaVuHxr9VCUlebb8KUtuaiFgPDJ6zW1I
        b6LUrV0yuXQx9HreDdAKMLowWnWU/yL0XJCe/HO7zAAOIZKIEqwx1M6Yfgb0CyXyXDEyZk
        B+4yP6EHtfirCrStuWPgQwY+pJA93Z4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-GmvpBhlPO06rl4V8xq-qeQ-1; Mon, 28 Aug 2023 04:47:48 -0400
X-MC-Unique: GmvpBhlPO06rl4V8xq-qeQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9a5944adecbso118023366b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 01:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693212467; x=1693817267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIR24c3vPFcM6K3A8B2/DkgNIDGAMx2+kAdxcC9gh4E=;
        b=TPj6mVErwlfmzcSaI0qYqu4O4PctE2gro0qirYfyrE+PEK0zy5pRVHDYYCoqhzI3oM
         e38oZvvKT7LoHABrQhUYE8mzRbwhps6CQgXybGKKMOFkmu5EXkfCaaTinUyLwQuJKKmK
         KZ1uw2og4eJnCGU62qDyqq7hxU3qXRg8zGmvXl5ZCCEoTYrQXm4zsFURYnCVZ9iInxTM
         3m7je9grqteoVGg/tpC4icjJnMTfOYELt8GRRpAXLRXCcIgtQEeRlO8BzOpp+W4KgSNR
         xB0QeaOyGhIv1+bsi207TkfNmnR3qGiEGCojywWt/eiIXhyPdv/yeyKMCl48smpFlQK/
         sDIA==
X-Gm-Message-State: AOJu0Yy5M3KGtyF7zQo7ygZ+pwwcgI3HfrV0+nHMwcxdUxtYMPyMs8RJ
        zwZw+ZsxQRskfCIbDIXZ2mbjKUk6Tcr2qWkZFtKrzsUqiWAlrd0PPQCoRgoMKX0X+LA3NzH36PA
        CTfBCMuR81wJTRqZJsziHt2Poz+g3wNNUPw==
X-Received: by 2002:a17:906:cc18:b0:99b:f58d:1c49 with SMTP id ml24-20020a170906cc1800b0099bf58d1c49mr20763411ejb.53.1693212467014;
        Mon, 28 Aug 2023 01:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkTC5xnIKk0N3MdNfyiHpci75qoN00vzCyHDZIGHZnB1ajcjllQWI5ZWfCvdmkdWSPW39g2Q==
X-Received: by 2002:a17:906:cc18:b0:99b:f58d:1c49 with SMTP id ml24-20020a170906cc1800b0099bf58d1c49mr20763403ejb.53.1693212466772;
        Mon, 28 Aug 2023 01:47:46 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f23-20020a1709067f9700b0098748422178sm4378345ejr.56.2023.08.28.01.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 01:47:45 -0700 (PDT)
Message-ID: <34fe4306-5628-f46d-e89e-1d77d59f9c87@redhat.com>
Date:   Mon, 28 Aug 2023 10:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86/amd/pmc: Fix build error with randconfig
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
References: <20230826161213.3180194-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230826161213.3180194-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/26/23 18:12, Shyam Sundar S K wrote:
> on x86_64:
> 
> CONFIG_SUSPEND is not set
> CONFIG_PM is not set
> 
> this leads to build failure of the AMD PMC driver. Add a 'depends on'
> in the Kconfig.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/lkml/5181685c-29d8-22a4-a2d7-682f26e2e031@infradead.org/
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Note everything under drivers/platform/x86/ (1) already is only build if CONFIG_X86 is set,
so there is no need for the depends on X86 part of this patch. I've dropped this while
merging the fix.

1) with the exception of the p2sb code

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
> 
> based on 'linux-next'
> 
>  drivers/platform/x86/amd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index d9685aef0887..383ae4c1df00 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -8,6 +8,7 @@ source "drivers/platform/x86/amd/pmf/Kconfig"
>  config AMD_PMC
>  	tristate "AMD SoC PMC driver"
>  	depends on ACPI && PCI && RTC_CLASS && AMD_NB
> +	depends on X86 && SUSPEND
>  	select SERIO
>  	help
>  	  The driver provides support for AMD Power Management Controller

