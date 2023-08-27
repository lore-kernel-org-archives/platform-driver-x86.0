Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC56C83F11
	for <platform-driver-x86@archiver.kernel.org>; Sun, 27 Aug 2023 16:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjH0Qfg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 27 Aug 2023 12:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjH0QfW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 27 Aug 2023 12:35:22 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D69FE
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Aug 2023 09:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=tVXXLF3guhd9AJJ1q12Qb3oecvhZMKfm8n8nYqhZHR0=; b=GKr1Wr5Qe08xvOSqmPG2EoDir3
        xBnesQGTpomzIeti76PhfnRAWGIBMuGNNN5eRLWjDCVShdIa7+8QPXFAxCS3B146proxVsTQ1sjbL
        s/ZlMtjm09z2xtXfaOe2eREFy6+phFlsCvX+VcC9M7ITSaoDQVuTVicnoD4WI+n0mwWoqC+u1cMJK
        DM6EHdYFOHRCr5rD+X3tcDlWj52TuA/rF6VUI8NefAKVFsQH/zdSbcYi3t6Gdr5PchV2McWhdY0hg
        +PnKJu0IeGBb555d14Vbm3Iuo4hfRc5a/yeol8HoXAgrKTfjDAXSSOtY2AjqghzFJo9qFqD8Jrdze
        MxwyvfGA==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qaIjM-008Fhu-0u;
        Sun, 27 Aug 2023 16:35:16 +0000
Message-ID: <d802ef61-d849-bd1a-7a08-4a493be6b79c@infradead.org>
Date:   Sun, 27 Aug 2023 09:35:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] platform/x86/amd/pmc: Fix build error with randconfig
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20230826161213.3180194-1-Shyam-sundar.S-k@amd.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230826161213.3180194-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 8/26/23 09:12, Shyam Sundar S K wrote:
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

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

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

-- 
~Randy
