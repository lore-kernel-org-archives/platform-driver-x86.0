Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F073CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 15:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF2E660FBF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 15:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234735AbhJ0Pis (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Oct 2021 11:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24774 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232502AbhJ0Pis (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 11:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635348982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WmI4mQhwhZco+U1cd8sX7JD2AJ6SV9Qb/31iD22OknA=;
        b=a+SN+3Y1asySrUMujsGWAVY5s9aCUKR29hg6gcrmLh/8Js9VCRJSfGq++ntOey1Az/X46M
        HIwSOKb8rAt4//g2835H5QcCQGPHyo2OW9PC/m4w37B0ZbeX+OtauA+nZkn2sr/bfhfRyr
        UoxBbJfq1AKVdpVsTk6qaby6iBuGwn8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-EaN-A83-Mi6RZHNtAiym5A-1; Wed, 27 Oct 2021 11:36:21 -0400
X-MC-Unique: EaN-A83-Mi6RZHNtAiym5A-1
Received: by mail-ed1-f71.google.com with SMTP id t18-20020a056402021200b003db9e6b0e57so2687715edv.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 08:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WmI4mQhwhZco+U1cd8sX7JD2AJ6SV9Qb/31iD22OknA=;
        b=ByV8RqhH4uzW+7MQLCsRvptUC4jOWKZE2K8P6DX11L5OVAAiyQccXiWKBVnhMOg84G
         182KYhZTNg2iBLW50K9lbHcldCXKtjV1kDhQfUpIh9suDzN8zolJtWMFI2KfeArFnrFX
         M1UTGWfBDRTJ3SD5ayvl94eYIcUJ3OnKq3ATIYCz4EXa23rQuD/2+bZfLDggwtVGgItV
         4J3XpxuwCWKWnmiC3/RB/oZ8ztZRJ+4DLztibQo5CBYy3NNqQYaQQDsC4nY90kWe1N7A
         I5C1IYSYXGVS3eUmwSyxT15lUV8Pk7+x0NUBgvlT44wVLlLVzzcEs0UzLzymefx+opu0
         5RzQ==
X-Gm-Message-State: AOAM533QxnLgB4YZKd1zwGMziHcshqUGpf4YPVHnxPg38y7xA6+x9hm3
        d0icBMh4Fo2njg7/GvRyZ4MDfnnYcVgqXLZ4tFeNEplXkXb0YpixjcypnmJQ28PmCOEIQNVRRKC
        r9A/LKStVIEAEjkh41A+SzTH4FLJt4Mb+4w==
X-Received: by 2002:a05:6402:1390:: with SMTP id b16mr44568465edv.166.1635348980035;
        Wed, 27 Oct 2021 08:36:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQP0KZADPZs1ZftnArQySL+QSdfPQdHKIPclAHgjAfhPUCQAPLot0CK+9n5le9MsSqzXxY3w==
X-Received: by 2002:a05:6402:1390:: with SMTP id b16mr44568443edv.166.1635348979821;
        Wed, 27 Oct 2021 08:36:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m5sm131338ejc.62.2021.10.27.08.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 08:36:14 -0700 (PDT)
Message-ID: <6b92ad7c-e68d-a464-b78d-58f73bce3d15@redhat.com>
Date:   Wed, 27 Oct 2021 17:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 2/3] platform/x86: amd-pmc: Simplify error handling
 path
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20211026184045.2201-1-Sanket.Goswami@amd.com>
 <20211026184045.2201-3-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211026184045.2201-3-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/21 20:40, Sanket Goswami wrote:
> Handle error-exits in the amd_pmc_probe() so that the code duplication
> is reduced.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v4:
> - No change.
> 
> Changes in v3:
> - No change.
> 
> Changes in v2:
> - No change.
> 
>  drivers/platform/x86/amd-pmc.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 5d88e55e1ce7..50cb65e38d11 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -546,30 +546,24 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
>  	if (err) {
>  		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> -		pci_dev_put(rdev);
> -		return pcibios_err_to_errno(err);

You probably want to add:

		err = pcibios_err_to_errno(err);

here and in the other similar cases.

> +		goto err_pci_dev_put;
>  	}
>  
>  	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
> -	if (err) {
> -		pci_dev_put(rdev);
> -		return pcibios_err_to_errno(err);
> -	}
> +	if (err)
> +		goto err_pci_dev_put;
>  
>  	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
>  
>  	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_HI);
>  	if (err) {
>  		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> -		pci_dev_put(rdev);
> -		return pcibios_err_to_errno(err);
> +		goto err_pci_dev_put;
>  	}
>  
>  	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
> -	if (err) {
> -		pci_dev_put(rdev);
> -		return pcibios_err_to_errno(err);
> -	}
> +	if (err)
> +		goto err_pci_dev_put;
>  
>  	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
>  	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
> @@ -598,6 +592,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmc_dbgfs_register(dev);
>  	return 0;
> +
> +err_pci_dev_put:
> +		pci_dev_put(rdev);
> +		return pcibios_err_to_errno(err);

And change this to just:

		return err;

So that "goto err_pci_dev_put" can also be used for errors which are not
returned by pci_read/write_config_dword() .


>  }
>  
>  static int amd_pmc_remove(struct platform_device *pdev)
> 

Regards,

Hans

