Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2F2C64EC4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 14:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbjCJOjm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 09:39:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbjCJOj3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 09:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27904515C5
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 06:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678459085;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0hWiStKKnODZLc0c+LJVjS6D0rqJy8pHZVi6YDS21Zk=;
        b=JzsT41agdPKK+rz8EOso/RNXwHS2z+2dz6p8NbM3HSIPHEM+6NTpCjoxQCCkfPL+m62c5z
        gVSY7fFoMXoFvckrJxFF5i37Ha2i2Fui57EOfV+BffLws7pO+wXZ78aNbuSCo+rpf/fe86
        c9hDai1fbrMUemdpvf3dn3GefJaVS7o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-hwFS3zmAN6Cl3ySFHF-gBA-1; Fri, 10 Mar 2023 09:38:03 -0500
X-MC-Unique: hwFS3zmAN6Cl3ySFHF-gBA-1
Received: by mail-ed1-f72.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso7883507edu.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 06:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hWiStKKnODZLc0c+LJVjS6D0rqJy8pHZVi6YDS21Zk=;
        b=cDLD8xGOTvJajSZOZY6R1XhX5O920CaGOJIn49CnhOu/2p0LGl6D1kw0MvZMcf3xQB
         CAlmA9C88aoyNnVG2eMtY2kQg1tC0ipeq2HQv+4SQL+cag4+wjw9pcHoiRjYT7Un6UZF
         0IUcVG+59HUXIxvYVqWNc5e2J8MnqnQpi3TdUHZKa5GGxVJ2dCjLoJaCR3LTuIHfSn2w
         hcI/Q5MV7WlSux/trX9w3gUTEAfvmIgzubyvPfJiAtd2TkQt6IqsUtNlO44bfdWdf3M+
         VmHZdg9XrSWNX/KC/OMss9RhGjAHo8y42EVkaFYHZHkv77WYb7BBBz2OtF+PJ35Ny2Rw
         dKPg==
X-Gm-Message-State: AO0yUKUiXIWKKEIctCwj99yevYG5X266agYjPPCumPgPW0lH9NvCGEb2
        yyI+0TDnMynl2Ez3Sdg5559P8xUdFoQ1cD/61sKn3lOaQ4aw4JAgU7YU20FhRvdNyk65bgS0faa
        b5GfxfP8NcyaQSQ5zp46YuyMy6j6hcYdzeA==
X-Received: by 2002:a17:907:a47:b0:8f0:143d:fa4b with SMTP id be7-20020a1709070a4700b008f0143dfa4bmr32523602ejc.7.1678459082790;
        Fri, 10 Mar 2023 06:38:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+h1C6lft3ZKnl0GaWrxBOUoDPN4LcX0k2yuq7Mp3PoZLA+MR2xNozzo6lPAe+0xOuIvCOqww==
X-Received: by 2002:a17:907:a47:b0:8f0:143d:fa4b with SMTP id be7-20020a1709070a4700b008f0143dfa4bmr32523584ejc.7.1678459082554;
        Fri, 10 Mar 2023 06:38:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v10-20020a1709063bca00b008ec4333fd65sm1009504ejf.188.2023.03.10.06.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 06:38:01 -0800 (PST)
Message-ID: <e9ffccaf-d94a-a711-1013-75af46dbfd7b@redhat.com>
Date:   Fri, 10 Mar 2023 15:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: x86-android-tablets: add
 CONFIG_PMIC_OPREGION dependency
To:     Arnd Bergmann <arnd@kernel.org>, Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230310140023.223612-1-arnd@kernel.org>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230310140023.223612-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Arnd,

On 3/10/23 15:00, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added call to intel_soc_pmic_exec_mipi_pmic_seq_element()
> requires that function to be defined:
> 
> x86_64-linux-ld: drivers/platform/x86/x86-android-tablets/lenovo.o: in function `lenovo_yt3_init':
> lenovo.c:(.init.text+0x72): undefined reference to `intel_soc_pmic_exec_mipi_pmic_seq_element'
> x86_64-linux-ld: lenovo.c:(.init.text+0x8b): undefined reference to `intel_soc_pmic_exec_mipi_pmic_seq_element'
> 
> Fixes: 9b1d2662b8c5 ("platform/x86: x86-android-tablets: Add touchscreen support for Lenovo Yoga Tab 3 Pro YT3-X90F")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, but this is a dup with:

https://patchwork.kernel.org/project/platform-driver-x86/patch/20230309094035.18736-1-hdegoede@redhat.com/

I just did not get around to pushing that out to pdx86/for-next yet ...

Regards,

Hans


> ---
>  drivers/platform/x86/x86-android-tablets/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
> index 2b3daca5380b..c31e4df34f80 100644
> --- a/drivers/platform/x86/x86-android-tablets/Kconfig
> +++ b/drivers/platform/x86/x86-android-tablets/Kconfig
> @@ -6,6 +6,7 @@
>  config X86_ANDROID_TABLETS
>  	tristate "X86 Android tablet support"
>  	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
> +	depends on PMIC_OPREGION
>  	help
>  	  X86 tablets which ship with Android as (part of) the factory image
>  	  typically have various problems with their DSDTs. The factory kernels

