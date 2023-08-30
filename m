Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC639C83F01
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243235AbjH3SrL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244509AbjH3NPn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Aug 2023 09:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AD1137
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693401291;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lP5a4CGoL1GuVDAsyC/hpiFpJSmcUBrYbHJlw7q1lZo=;
        b=JDmHHRIbqb26wYMyPloHKnWqDmt7JXMO/NO7FX/1B8yI3XddsO4AgTmA7iFWQNyWo4Cqhq
        GVPFDxc+r5uHVOq29zLz15fQaZ51e4G6ESYW8Pk/Vky7b+h4ZhqTVcLGqnVyXWzljrMq9I
        0MW6pAfsuipWp7v/Wux2ZAEiAE9T38c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654--ggF-ly7O3qBFjeYvNWq6g-1; Wed, 30 Aug 2023 09:14:50 -0400
X-MC-Unique: -ggF-ly7O3qBFjeYvNWq6g-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-51bef8bb689so1273766a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 06:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401288; x=1694006088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lP5a4CGoL1GuVDAsyC/hpiFpJSmcUBrYbHJlw7q1lZo=;
        b=Kw+eLZbeHsXslQyYhRLApi0iCEUbm9l6zjB8NIrujnyZz8JpK3bUoE8u2NvEFQFxD0
         BdphnX96zq5vDJUYxalzZcGmIC2ZFVMMJJWsgdw2wWwvno/T3Nkmr2a12ttMUSFzkix3
         7FOXAkNSiSvz5q3hiPH4NvGoI2O76hwgfx4m0wMg29SqXA7WdweyXtuG+lyrMkt01VeQ
         CPyvv0qssefWTqn/t13ZF+iv6TNqPPclst38sK3CcDC3PBbQ4h7GPOCoLrhVipgrR90L
         BfeavM8sbLb/k0Bp26Rcx5LAmbhhhM/X5so2YrRQz/4DWTatbpUmPP2PAsc7t6I68wJM
         qsyw==
X-Gm-Message-State: AOJu0Yy74Fs5y93L38EBiAEsC1da9drJ/FUvKW9etIo3zveV+xGwedsN
        tsLLdPNdXNuD19YY8rmhlIcFGGCGMV0PJvF91U4qx/itig6B9Q4vCSDEdF0j129BuVLtXjY2tjd
        B6ac9SJrdvp4TD8yI/yAaqB6JTpKSIIRR5mm/tl4CGA==
X-Received: by 2002:a50:ee8e:0:b0:522:4764:8baa with SMTP id f14-20020a50ee8e000000b0052247648baamr2691580edr.12.1693401288588;
        Wed, 30 Aug 2023 06:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh/afixJi8lRGGEOre6wLTRpOs6xL2ck9cJQH4w5xBcYhh8gO8hTskCJlm+kr1G5DURfUv/w==
X-Received: by 2002:a50:ee8e:0:b0:522:4764:8baa with SMTP id f14-20020a50ee8e000000b0052247648baamr2691562edr.12.1693401288268;
        Wed, 30 Aug 2023 06:14:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e5-20020a056402088500b0052a48f4065esm6742048edy.39.2023.08.30.06.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 06:14:47 -0700 (PDT)
Message-ID: <ef0ebf50-35a7-b3f9-2209-2a0a8cc265d2@redhat.com>
Date:   Wed, 30 Aug 2023 15:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH platform-next 1/1] platform/x86: mlx-platform: Add
 dependency on PCI to Kconfig
Content-Language: en-US, nl
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     ilpo.jarvinen@linux.intel.com, rdunlap@infradead.org,
        platform-driver-x86@vger.kernel.org
References: <20230829133748.58208-1-vadimp@nvidia.com>
 <20230829133748.58208-2-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230829133748.58208-2-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/29/23 15:37, Vadim Pasternak wrote:
> Add dependency on PCI to avoid 'mlx-platform' compilation error in case
> CONFIG_PCI is not set.
> 
> Failed on i386:
> CONFIG_ACPI=y
> CONFIG_ISA=y
> 
> Error In function 'mlxplat_pci_fpga_device_init':
> implicit declaration of function 'pci_request_region':
>  6204 |         err = pci_request_region(pci_dev, 0, res_name);
>       |               ^~~~~~~~~~~~~~~~~~
>       |               pci_request_regions
> 
> Fixes: 1316e0af2dc0 ("platform: mellanox: mlx-platform: Introduce ACPI init flow")
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
>  drivers/platform/x86/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index a43db6731f34..2a1070543391 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -965,8 +965,7 @@ config SERIAL_MULTI_INSTANTIATE
>  
>  config MLX_PLATFORM
>  	tristate "Mellanox Technologies platform support"
> -	depends on ACPI
> -	depends on I2C
> +	depends on ACPI && I2C && PCI
>  	select REGMAP
>  	help
>  	  This option enables system support for the Mellanox Technologies

