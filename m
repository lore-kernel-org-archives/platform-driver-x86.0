Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C57C636CC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 12:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjBMMaX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Feb 2023 07:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjBMMaW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 07:30:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306A2115
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 04:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676291375;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NCuGhAHlAIp4gfjiiL3pr/rNs9xoaoQS0Go6MSV+DIw=;
        b=SpJ8yI27wAIm6s6akb5dy8ekPFJBMAwZjJKRzaAZtXDLZ2WfjyQDLcBkTkAMAHnxdlPa0m
        84JT20IrdG1B3m2J6qh4Rd0wSKHYraoN2Sd2s9OXpWiQRJT0m68xQWMCV/YwLBAFSPwDxq
        sItXDAf8218bBE24OkI1nJpGFkmjH64=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-529-jdZvPJ8aMfCSuLMOPQq4Lg-1; Mon, 13 Feb 2023 07:29:34 -0500
X-MC-Unique: jdZvPJ8aMfCSuLMOPQq4Lg-1
Received: by mail-ed1-f71.google.com with SMTP id fd23-20020a056402389700b004aaa054d189so7542964edb.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 04:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCuGhAHlAIp4gfjiiL3pr/rNs9xoaoQS0Go6MSV+DIw=;
        b=cX8w6cRcgNoJVFVtYV1ByB4pcU5A/KQk4lDi+6GG4CtdTUkLzlqCSymrKZkIJdnd/m
         +ghf9R7qZZxkiQglpiPKTXoO7g//k5sf66HSRTNS73ptiT0HxfFC/Tc9FLxuZ6exbxR5
         Kx9b6nb6S+BQutcx4gxe3zt18BHuo77/sH6rg8Kl2Zrs8rAvpJGL2Mz0omFbbNw36qkK
         nSVyXbEwOwGEWkO7EMF8+bAKGdy+mItt/IjmtIR/Pmlr27RnSy/ob+crmP9rYZPG7mxu
         XtpA6+k05jOcUcSLhiIDTtNmHumIkOcj/JaCTEDe8d8pvKcCmOX48pkv1zYCsh2VmDHW
         xPXw==
X-Gm-Message-State: AO0yUKVOnendr9OU8u2rbSU+VI5D8TVsx/GlWOuaQwVWhQsaG8gEES3h
        TWkF1ZQKBqwXd+F8VzSKUZCflrV9CPdW7O6pUIqrCDLKFQ2TaR35t1FCkJGAKGpuc7avqTXdtMY
        7O/ySXdcD0T3GzUUZwU3KD3BoaVxqbmIVOw==
X-Received: by 2002:a50:bace:0:b0:4ac:cf29:1a62 with SMTP id x72-20020a50bace000000b004accf291a62mr1354128ede.33.1676291373206;
        Mon, 13 Feb 2023 04:29:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9ezPnqao2rqUj57uonRA5ScK5AaNeNL3nBzjr7thE6H9mQYwZp6JOKuRskhyDvWzANHDh4dQ==
X-Received: by 2002:a50:bace:0:b0:4ac:cf29:1a62 with SMTP id x72-20020a50bace000000b004accf291a62mr1354118ede.33.1676291373062;
        Mon, 13 Feb 2023 04:29:33 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s6-20020a50d486000000b004aab36ad060sm6554660edi.92.2023.02.13.04.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 04:29:32 -0800 (PST)
Message-ID: <af351cb5-b4a9-9223-7fee-e1e7238f2585@redhat.com>
Date:   Mon, 13 Feb 2023 13:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86/amd/pmf: Add depends on CONFIG_POWER_SUPPLY
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
References: <20230213121457.1764463-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230213121457.1764463-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/13/23 13:14, Shyam Sundar S K wrote:
> It is reported that amd_pmf driver is missing "depends on" for
> CONFIG_POWER_SUPPLY causing the following build error.
> 
> ld: drivers/platform/x86/amd/pmf/core.o: in function `amd_pmf_remove':
> core.c:(.text+0x10): undefined reference to `power_supply_unreg_notifier'
> ld: drivers/platform/x86/amd/pmf/core.o: in function `amd_pmf_probe':
> core.c:(.text+0x38f): undefined reference to `power_supply_reg_notifier'
> make[1]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
> make: *** [Makefile:1248: vmlinux] Error 2
> 
> Add this to the Kconfig file.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217028
> Fixes: c5258d39fc4c ("platform/x86/amd/pmf: Add helper routine to update SPS thermals")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

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
>  drivers/platform/x86/amd/pmf/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index c375498c4071..6d89528c3177 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -6,6 +6,7 @@
>  config AMD_PMF
>  	tristate "AMD Platform Management Framework"
>  	depends on ACPI && PCI
> +	depends on POWER_SUPPLY
>  	select ACPI_PLATFORM_PROFILE
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.

