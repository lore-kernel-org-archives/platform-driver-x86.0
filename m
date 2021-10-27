Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C61C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 15:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52E8E604E9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 15:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234880AbhJ0PWY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Oct 2021 11:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52569 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235563AbhJ0PWX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 11:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635347997;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WnAJd2zu3sP4Bv7B6mRXH7GVSFWJt1yL+noN4zomYH8=;
        b=IuVB+6nOe5OpZX1arzSLSvLQnFq/TACHoId9jssvlyqr3ljJAgCJTLmUFlJpayBtPWD2N0
        f58wo/N1qOPDqWTekBUAur95GFRyDgJrEGN+GdjInajt/xFK02TNfnBw2i5a0dbgCNZNVt
        fTc0q9WntvawfWgVNeLB9SCp0Q4kOs8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-LZ0sGC4pNjOqwuQnWGe8ww-1; Wed, 27 Oct 2021 11:19:56 -0400
X-MC-Unique: LZ0sGC4pNjOqwuQnWGe8ww-1
Received: by mail-ed1-f71.google.com with SMTP id u17-20020a50d511000000b003daa3828c13so2630511edi.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 08:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WnAJd2zu3sP4Bv7B6mRXH7GVSFWJt1yL+noN4zomYH8=;
        b=sLxrEFqQ/qqbF4EC9jKVkzWvtCavwDC0gTbcgm43T+ITr4wFYpVcA2nl2AP83ykKVr
         2WotnqblRg4WmCTNbkWS1oRHMXRoQSZVcuNyljxlPH5f4gC1QAORyMaVd7QS7GmSiX2c
         K/rFotHM1+Gd/ycGYEzzDiAFDa1BkvK29xZD74OXMBWE+27Y0P7UvlhSSZN+ADeJLznq
         2mdVeQFkACSfMisPo2nl9SULsAI435LKzj5W0yeRIiyEu2tkJgmMY585i+0wsj2zyFmd
         DeYLLGRBthEoNyicdJHssP6KFt5/FWK8sMKyKv4y8D5zR6LpyzuoOJX++G95ETmGLvT5
         SrTQ==
X-Gm-Message-State: AOAM533AyW19Dz5lQ2jSRtVa5eHGeDabH+jPgvw2fglHcvrW86D8PnlR
        ixqLveIXDlkAFs/73HLq8nXF3YRa2RkWvKfO/9n+pp7jkHCFzF/3qXxceatHks9AIcIYoueIZJ+
        5Xr2gdI2BX3ALzwAJ4w5yEo5bmjN3cibXBQ==
X-Received: by 2002:aa7:c405:: with SMTP id j5mr46089749edq.84.1635347994913;
        Wed, 27 Oct 2021 08:19:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/k6Cz51QWJDWMtNHiJFEOcLVcOoOzpJNwuEt67DuDrTYIRagbtDurO8KO2FddptYePBwPFg==
X-Received: by 2002:aa7:c405:: with SMTP id j5mr46089728edq.84.1635347994751;
        Wed, 27 Oct 2021 08:19:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id l22sm118331ejz.10.2021.10.27.08.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 08:19:54 -0700 (PDT)
Message-ID: <e5f4a8e2-e9ca-96ac-e3fc-f2217e3050ee@redhat.com>
Date:   Wed, 27 Oct 2021 17:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 1/3] platform/x86: amd-pmc: Store the pci_dev instance
 inside struct amd_pmc_dev
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20211026184045.2201-1-Sanket.Goswami@amd.com>
 <20211026184045.2201-2-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211026184045.2201-2-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Sanket,

On 10/26/21 20:40, Sanket Goswami wrote:
> Store the root port information in amd_pmc_probe() so that the
> information can be used across multiple routines.
> 
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v3:
> - Address review comments from Hans.
> 
> Changes in v2:
> - Store the rdev info in amd_pmc_probe() as suggested by Hans.
> 
>  drivers/platform/x86/amd-pmc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 678bf6874c63..5d88e55e1ce7 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -121,6 +121,7 @@ struct amd_pmc_dev {
>  	u16 minor;
>  	u16 rev;
>  	struct device *dev;
> +	struct pci_dev *rdev;
>  	struct mutex lock; /* generic mutex lock */
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>  	struct dentry *dbgfs_dir;
> @@ -541,6 +542,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	dev->cpu_id = rdev->device;
> +	dev->rdev = rdev;
>  	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
>  	if (err) {
>  		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);

You are still introducing a leak of the rdev on error-exits here,
there are error-exits here:

        dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
                                    AMD_PMC_MAPPING_SIZE);
        if (!dev->regbase)
                return -ENOMEM;

and here:

        dev->fch_virt_addr = devm_ioremap(dev->dev, fch_phys_addr, FCH_SSC_MAPPING_SIZE);
        if (!dev->fch_virt_addr)
                return -ENOMEM;

Which now also need a pci_dev_put() call before the "return -ENOMEM". Please make
patch 2/3 the first patch in the series and then use goto err_pci_dev_put here.

Note you will also need to deal with setting err, and with these paths not
using pcibios_err_to_errno() ...

Regards,

Hans




> @@ -570,7 +572,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
> -	pci_dev_put(rdev);
>  	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
>  
>  	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
> @@ -604,6 +605,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
>  	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
>  
>  	amd_pmc_dbgfs_unregister(dev);
> +	pci_dev_put(dev->rdev);
>  	mutex_destroy(&dev->lock);
>  	return 0;
>  }
> 

