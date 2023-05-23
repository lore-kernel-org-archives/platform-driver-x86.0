Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FE2C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 May 2023 11:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236616AbjEWLKI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 May 2023 07:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236163AbjEWLKH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 07:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FEA196
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 04:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684840161;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dpq73DY3Q6Vvrg4NdhEibDQtlEcBu/1qSSW1eGUxOMY=;
        b=BR5E/sYaCYveT2a3X14Tb7Uvy60yy8JobyY/woiVigimXhB5xxvrMxeE69XyQwqsDmW5jd
        OWZ+cvqTrc2vF9nlHLby4Yj/kz9gVMcrvufBtufZi7WUtFO3nfbB5rk/qU8Lbf4pttqFHp
        0NAwMOgOPKHPOuXzCLhJ/Xz78NrUodA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-O0xSvDhgOS6Sv--oThq9jw-1; Tue, 23 May 2023 07:09:20 -0400
X-MC-Unique: O0xSvDhgOS6Sv--oThq9jw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50ddef368e4so827391a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 04:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684840159; x=1687432159;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpq73DY3Q6Vvrg4NdhEibDQtlEcBu/1qSSW1eGUxOMY=;
        b=VDhvNggtv1Z3XJkwxFMK7ATPPHF5kS3+iCRVI1Xst07S+ut5lg4CDcuFbi5ZVS4L2M
         xcsHICHi2BU/KkSCgjEqjicgTFzfNiuipcwffMSyxNzIBCUzHQMF8irXriIf7nWxLP0f
         M+x9hv9xLUbFq9/J9xMmWnxNVFwL2rdMZDa05ZDe6px1lMFDAaP3gvkLOxIFxDRklkNS
         LQYJWP1PRNX3lL3k3Ov/5Y35yr6c9E35a8KEqZG3mfJ7zBHIFlv0F14M/TvLNuNUaBFl
         bWBE8/ejx5+hbvaGEuknRMzWPKUmQeVDREHJ2Vo9ctVLYU4eF//adfHevPwyyuZPiamd
         QmCQ==
X-Gm-Message-State: AC+VfDzRCNhpU0XeIo/n4NLvI4PQNKik5JR9VIjrVCvRAZGx+igs7R43
        R1IV//7okyBTs6IweOjY+B+Nui74gUW43eTLE2ahlK1zZnbroomZne2A7xhgZ8H7fkHgcXhWwxE
        q4ymXXeMHPIL6sMl/ps3i6QdqwbqEWOYz9Q==
X-Received: by 2002:a50:fb16:0:b0:510:d9b3:11fb with SMTP id d22-20020a50fb16000000b00510d9b311fbmr10425653edq.40.1684840159553;
        Tue, 23 May 2023 04:09:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6/bqhX0SXcSkrTg+pV9u1/MOymwq7M9EgUEfMocHwAdw1BVcz9nMYMWkPB9zze5choPoq94g==
X-Received: by 2002:a50:fb16:0:b0:510:d9b3:11fb with SMTP id d22-20020a50fb16000000b00510d9b311fbmr10425639edq.40.1684840159295;
        Tue, 23 May 2023 04:09:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z17-20020aa7cf91000000b004c2158e87e6sm4032154edx.97.2023.05.23.04.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 04:09:18 -0700 (PDT)
Message-ID: <c27655d4-a679-0a62-54db-494601f40f7d@redhat.com>
Date:   Tue, 23 May 2023 13:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86: lenovo-yogabook: add I2C dependency
Content-Language: en-US, nl
To:     Arnd Bergmann <arnd@kernel.org>, Mark Gross <markgross@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230519082606.375471-1-arnd@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230519082606.375471-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Arnd,

On 5/19/23 10:25, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The added platform_driver support fails to link when I2C core support is
> not rechable:
> 
> x86_64-linux-ld: drivers/platform/x86/lenovo-yogabook.o: in function `yogabook_pdev_probe':
> lenovo-yogabook.c:(.text+0x5a5): undefined reference to `i2c_bus_type'
> 
> Add a Kconfig dependency to enforce a working configuration.
> 
> Fixes: 6df1523fa0b7 ("platform/x86: lenovo-yogabook: Add platform driver support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you I have pushed this to pdx86/for-next now.

Regards,

Hans



> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9fe974d5f645..63637ea99c2f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -125,6 +125,7 @@ config YOGABOOK
>  	tristate "Lenovo Yoga Book tablet key driver"
>  	depends on ACPI_WMI
>  	depends on INPUT
> +	depends on I2C
>  	select LEDS_CLASS
>  	select NEW_LEDS
>  	help

