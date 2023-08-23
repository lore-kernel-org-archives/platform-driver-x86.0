Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAD8EE4993
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Aug 2023 11:14:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbjHWLOl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Aug 2023 07:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjHWLOl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Aug 2023 07:14:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BAAE46
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Aug 2023 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692789224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=43tRU/wRYdcjhp+J+HpMghVPRkj+ONqZxRd5CROsgxE=;
        b=S2ApUHm+Qq0zZmtCoPpZ+8DboUnnHQBnklGKH6Eb9llf2sijNLW3GxgGsWvluX7OS99mXM
        3PL6iof1AA1D78WR3+rk5f5dtwTA/omKVu54YNWEpvkpujRnW8pCo2dcniur2C+1Oyxwzo
        duAR+/zE35blBfap9lwrbZ5kiF7RZgA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-dQdyvqeFPX-AeHQcc0iu8w-1; Wed, 23 Aug 2023 07:13:42 -0400
X-MC-Unique: dQdyvqeFPX-AeHQcc0iu8w-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-978a991c3f5so416125666b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Aug 2023 04:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692789222; x=1693394022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43tRU/wRYdcjhp+J+HpMghVPRkj+ONqZxRd5CROsgxE=;
        b=ZViycQ4o7ynI059tkHcU4Hibf12Sf7/KQ92NpCNMPiFDIQOUQ2SJd/E6kHNaJG2ZkK
         djDIiIPUNglORwFkAUCwo9sX0VxN5aTfCY/qkTD88fO11AQ0pEgT7AmN4wqKL3IXmVr5
         4Wbpn5wjT73/JN7ZJJkTxQ0VSA2Cnc9inDyq48CFmwiCHDx0BTdbALu81qsVgUS5yuud
         Zsma3I29qJPQE+OzGO318XDvOBIAuyVMH6k9WHvj0MKQbpZBi22Hrgk6vozRBQrdboti
         zCT2EHz5pWMJoJGjoxg2NI2FQbQjk2jfYzkwKKjceK//y17h1dljgn1jTdnWi5UwpY06
         1Akw==
X-Gm-Message-State: AOJu0YzrvcaMC4u0uDHxS9Z7NIjeZJprv7f+f5XXj5yYZvFMdJpTgmSG
        wm5ETcMFbRJV6+eugPDLsOHXwzxRwO74UPIpAWYRTe6cMox7p//Jb2GEBxba8TIX5WbXyTB7Bbc
        hw03R2LYurgGXy5nfOssi4pCt5WkTixWb0Q==
X-Received: by 2002:a17:906:8a73:b0:99b:fdbb:3203 with SMTP id hy19-20020a1709068a7300b0099bfdbb3203mr10152787ejc.3.1692789221874;
        Wed, 23 Aug 2023 04:13:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbTM2F7gmT+vfXv+60aw7Lip21IC7NbjFNVD1g2PYOOv+qNAv1t1Lat4gDQPfRtJCuM9QMtg==
X-Received: by 2002:a17:906:8a73:b0:99b:fdbb:3203 with SMTP id hy19-20020a1709068a7300b0099bfdbb3203mr10152771ejc.3.1692789221549;
        Wed, 23 Aug 2023 04:13:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709062a9200b00992ca779f42sm9679696eje.97.2023.08.23.04.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 04:13:41 -0700 (PDT)
Message-ID: <e2b3e6f1-8093-ee35-3694-6041ece318e7@redhat.com>
Date:   Wed, 23 Aug 2023 13:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH platform-next 1/1] platform/x86: mlx-platform: Fix 0-DAY
 CI warning
Content-Language: en-US, nl
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20230823075038.7129-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230823075038.7129-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/23/23 09:50, Vadim Pasternak wrote:
> Fix 0-DAY CI warning: unused variable 'mlxplat_acpi_table'.
> 
> Add dependency on "ACPI" to Kconfig file.
> Remove "ACPI_PTR", use plain assignment to 'mlxplat_acpi_table'.
> 
> Fixes: e2185e8f37ef ("platform: mellanox: mlx-platform: Introduce ACPI init flow")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308231011.pa9xg8sF-lkp@intel.com/
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/Kconfig        | 1 +
>  drivers/platform/x86/mlx-platform.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 06b9a5ae5a63..a43db6731f34 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -965,6 +965,7 @@ config SERIAL_MULTI_INSTANTIATE
>  
>  config MLX_PLATFORM
>  	tristate "Mellanox Technologies platform support"
> +	depends on ACPI
>  	depends on I2C
>  	select REGMAP
>  	help
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 44f107965832..3d96dbf79a72 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -6629,7 +6629,7 @@ MODULE_DEVICE_TABLE(acpi, mlxplat_acpi_table);
>  static struct platform_driver mlxplat_driver = {
>  	.driver		= {
>  		.name	= "mlxplat",
> -		.acpi_match_table = ACPI_PTR(mlxplat_acpi_table),
> +		.acpi_match_table = mlxplat_acpi_table,
>  		.probe_type = PROBE_FORCE_SYNCHRONOUS,
>  	},
>  	.probe		= mlxplat_probe,

