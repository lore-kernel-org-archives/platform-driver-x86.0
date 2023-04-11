Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BB5C76196
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Apr 2023 08:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjDKIat (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Apr 2023 04:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbjDKI3q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Apr 2023 04:29:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60C03A8B
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681201719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=34pN8MN53Iu3Gfy9LUqJsRu3fXLGqvq5XuJfuFCl+/E=;
        b=chidVezm6CdQF6mUg5m0A5Zim0/rw69AVn/mRxoEfyZA2JouSKajNJfbCUpBID2vnumW64
        vDtDTkKqhG3Wb+uPadk3nmetXeHlwisRIBDx2QA2PG7HQ8xrjF92gcoie9zyqwIVXCCFoO
        RGqnjJa5aDpLFqbEBGvBJXTT1dRnzfE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-uGDpUZZGPPGgPbHdERXIMQ-1; Tue, 11 Apr 2023 04:28:38 -0400
X-MC-Unique: uGDpUZZGPPGgPbHdERXIMQ-1
Received: by mail-ej1-f70.google.com with SMTP id ja8-20020a170907988800b0094aa0655f0eso1696791ejc.18
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201717; x=1683793717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34pN8MN53Iu3Gfy9LUqJsRu3fXLGqvq5XuJfuFCl+/E=;
        b=Xh5L0w1YwtdvDPMYwRxLuZbHyvU1myj7eCHX9qCY4d2GDZuxNmYtV36L/yX1Nk1G5O
         M5PgaYWgMO1xtAh2VcTZvu1GpeH6crVPdP0VZ1ap4l10bdoJZQocvpjjLvlUCBH/8jqJ
         kIxMaGZU7L4hZhOD8Yebw6173gH0oNSCuFL5dY5tcA7cm3Ouc18J7D1wQzzxmhZTk8Zo
         0OP1T/7hsVNcoqDnrjgPYtYvRUma6fqzSZ1mP5d+GkJ+irjhc3BGXd2CgZilZPrQv3ms
         DNC0E1qj+OQ/kBYFT/epQkcHht/ebuNtqXtH/mfLHTxvDdAbpiGoXrtqXlhFOROyKR09
         5qjA==
X-Gm-Message-State: AAQBX9fAR3p6Qv4SJyE39TJO8mKgh9QWtzz0Ze0ER3S041AByPUxbt5P
        W10PcOsn2p1Zz7/o98BJ6O1gQQW4iE8BciSjPCbJwYmnEd1183TXpm3p2IafiK5pfMRUHu65wR7
        FUJII6UKC5hO7VYC+ub8J+bpLpTJsNiSaxQ==
X-Received: by 2002:a17:906:d286:b0:94a:5ecb:6ea7 with SMTP id ay6-20020a170906d28600b0094a5ecb6ea7mr1997334ejb.43.1681201716896;
        Tue, 11 Apr 2023 01:28:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350alu4PTdWE1GX6bYy44mK3hM0waXJrDoEMtLGiLGxz621J4QTWxPCWsoq7Zz5KFZHgAdvfJdg==
X-Received: by 2002:a17:906:d286:b0:94a:5ecb:6ea7 with SMTP id ay6-20020a170906d28600b0094a5ecb6ea7mr1997311ejb.43.1681201716572;
        Tue, 11 Apr 2023 01:28:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s18-20020a1709067b9200b00947c42243e4sm5943031ejo.179.2023.04.11.01.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:28:36 -0700 (PDT)
Message-ID: <68000bbf-d3d5-5080-c1b3-aed2c9944e67@redhat.com>
Date:   Tue, 11 Apr 2023 10:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] platform/x86/amd/pmf: Move out of BIOS SMN pair for
 driver probe
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
References: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
 <20230406164807.50969-4-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230406164807.50969-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/6/23 18:48, Shyam Sundar S K wrote:
> The current SMN index used for the driver probe seems to be meant
> for the BIOS pair and there are potential concurrency problems that can
> occur with an inopportune SMI.
> 
> It is been advised to use SMN_INDEX_0 instead of SMN_INDEX_2, which is
> what amd_nb.c provides and this function has protections to ensure that
> only one caller can use it at a time.
> 
> Fixes: da5ce22df5fe ("platform/x86/amd/pmf: Add support for PMF core layer")
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Since this is a fix and since this applies cleanly without
the other 2 debug patches I have merged this into my
review-hans branch now, so that it can be merged by Linus for
6.4-rc1 :

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
>  drivers/platform/x86/amd/pmf/Kconfig |  1 +
>  drivers/platform/x86/amd/pmf/core.c  | 22 +++++-----------------
>  2 files changed, 6 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 7129de0fb9fb..c7cda8bd478c 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -7,6 +7,7 @@ config AMD_PMF
>  	tristate "AMD Platform Management Framework"
>  	depends on ACPI && PCI
>  	depends on POWER_SUPPLY
> +	depends on AMD_NB
>  	select ACPI_PLATFORM_PROFILE
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index da23639071d7..0acc0b622129 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -8,6 +8,7 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <asm/amd_nb.h>
>  #include <linux/debugfs.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> @@ -22,8 +23,6 @@
>  #define AMD_PMF_REGISTER_ARGUMENT	0xA58
>  
>  /* Base address of SMU for mapping physical address to virtual address */
> -#define AMD_PMF_SMU_INDEX_ADDRESS	0xB8
> -#define AMD_PMF_SMU_INDEX_DATA		0xBC
>  #define AMD_PMF_MAPPING_SIZE		0x01000
>  #define AMD_PMF_BASE_ADDR_OFFSET	0x10000
>  #define AMD_PMF_BASE_ADDR_LO		0x13B102E8
> @@ -348,30 +347,19 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	}
>  
>  	dev->cpu_id = rdev->device;
> -	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_LO);
> -	if (err) {
> -		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
> -		pci_dev_put(rdev);
> -		return pcibios_err_to_errno(err);
> -	}
>  
> -	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
> +	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>  	if (err) {
> +		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_LO);
>  		pci_dev_put(rdev);
>  		return pcibios_err_to_errno(err);
>  	}
>  
>  	base_addr_lo = val & AMD_PMF_BASE_ADDR_HI_MASK;
>  
> -	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_HI);
> -	if (err) {
> -		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
> -		pci_dev_put(rdev);
> -		return pcibios_err_to_errno(err);
> -	}
> -
> -	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
> +	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_HI, &val);
>  	if (err) {
> +		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_HI);
>  		pci_dev_put(rdev);
>  		return pcibios_err_to_errno(err);
>  	}

