Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE80C6FA8F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Aug 2023 21:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238122AbjH2V7G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Aug 2023 17:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238992AbjH2V7B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Aug 2023 17:59:01 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED978194
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Aug 2023 14:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=p8y0zTBzmSbV+WByrTCUyBo2sJ9HCyWtaGewNGLoumA=; b=1g2819h2YY58VMAGyGRWMUUHJO
        ePnlGIUiZ+NU+T8D7ZdThTZlzcd5Hl88W8gPqmtLsGehQJ8B4JXWDLv4J0lehp29mzSwgHh/gqLIW
        bZHD0JH3f8Ldq4ReaB/Hj4it7UdaIbHNWyadcoG4dUZwX2WepdC05FnheWXCmgFLnXvIC3kc0L3RR
        WK9zGzQ9qqzwKdoOOVoLmoQbYCMgr4QM5NdjfGisggvi5hzv9Rz9G9ADOylH+eO03izbfGim8W9g6
        vLWvoHb9Jl+iWmuABi2j29uLRrVi5wsU0d0p8GZiEORVh9nHJiQd8OSNbO+8leecplVnljkbdW6Jx
        Yw20/3Dg==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qb6jf-00CLpE-1t;
        Tue, 29 Aug 2023 21:58:55 +0000
Message-ID: <2859a98d-9e60-c4fd-2f8a-6b7b6d107634@infradead.org>
Date:   Tue, 29 Aug 2023 14:58:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH platform-next 1/1] platform/x86: mlx-platform: Add
 dependency on PCI to Kconfig
To:     Vadim Pasternak <vadimp@nvidia.com>, hdegoede@redhat.com
Cc:     ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20230829133748.58208-1-vadimp@nvidia.com>
 <20230829133748.58208-2-vadimp@nvidia.com>
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230829133748.58208-2-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 8/29/23 06:37, Vadim Pasternak wrote:
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


Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

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

-- 
~Randy
