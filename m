Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983A2C28D13
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Aug 2022 22:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbiHSWlK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Aug 2022 18:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiHSWlJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Aug 2022 18:41:09 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E391C10EED3
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Aug 2022 15:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=FhmwHA1ti8OucyiSKvBQfIxWY6ORKHaNFX9oXUQ/eVo=; b=1Nktz7P69hSbLqwvqLxfBtbTsW
        FZYm5GhGpb5K4J/IFJc5Dhpjf6OSTvXmYpI8WzuVvxk9h/emaoFwiozo8u1iGwPW/pRAtnH2aAUms
        4bp1WWc1qYBSjCHbMJKFJHfbcmuSnFq80zHlFzvnjePd/9pPGgLargmfzyWjSPG3dhfMyz5DDqi5t
        jwX9rot85SPU5dwEMck060rozGQOz4VSnV9IvXqBkzQwvNNQ0nQKNvOkbUXXU4Xgl5w0wPUM1F/7E
        piHK3DPyB7RjuJMGoXQMy2Bs2Tvg6Yl61WfspfX+dVWUsvLwLohGy6OEED55qw0VmrkhrxIjWeaIe
        gj6qTV9A==;
Received: from [2601:1c0:6280:3f0::a6b3]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oPAfp-00CzEs-OF; Fri, 19 Aug 2022 22:41:05 +0000
Message-ID: <742ce0ac-bfd4-b056-b0e4-eb43162f56b6@infradead.org>
Date:   Fri, 19 Aug 2022 15:41:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix undefined reference to
 platform_profile
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220819083858.3987590-1-Shyam-sundar.S-k@amd.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220819083858.3987590-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 8/19/22 01:38, Shyam Sundar S K wrote:
> Its reported that amd-pmf driver when built with config which does not
> have ACPI_PLATFORM_PROFILE set/enabled throws a undefined references to
> symbols used.
> 
> ---
> ld: vmlinux.o: in function `amd_pmf_init_sps':
> /work/lnx/next/linux-next-20220818/X64/../drivers/platform/x86/amd/pmf/sps.c:132: undefined reference to `platform_profile_register'
> ld: vmlinux.o: in function `amd_pmf_deinit_sps':
> /work/lnx/next/linux-next-20220818/X64/../drivers/platform/x86/amd/pmf/sps.c:142: undefined reference to `platform_profile_remove'
> ---
> 
> Fix it by adding a "select" to the Kconfig.
> 
> Fixes: da5ce22df5fe ("platform/x86/amd/pmf: Add support for PMF core layer")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
> 
> Based on "review-hans" branch.
> 
>  drivers/platform/x86/amd/pmf/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index e65ffa52229b..c375498c4071 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -6,6 +6,7 @@
>  config AMD_PMF
>  	tristate "AMD Platform Management Framework"
>  	depends on ACPI && PCI
> +	select ACPI_PLATFORM_PROFILE
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.
>  	  The goal is to enhance end user experience by making AMD PCs smarter,

-- 
~Randy
