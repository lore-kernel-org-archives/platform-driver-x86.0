Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5740EC636D7
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 16:14:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjBJQOI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 11:14:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbjBJQNt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 11:13:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240971B552
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676045583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NitvGIVmtCGdtK4e3hCaRDRoUP9N0qyct+Wt53Ooibg=;
        b=ZLSPzJMSUHxRQFHCqfNnG8364gCjhSzHIZzI0Ve+A2qgU1r/L3UA2k9JFkUeXVhyQ1w7gl
        WMHuXnHOG2/gsClP6aQinrfya3YxIFeLBo5jotYoTPWArE+s64puGj3XVitFmg1/S2QFAJ
        iAE+zFdQMjFV3N05Hlk93zrfpjnO+SE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-yWI0SslqMJ2H-iLlVR-ZoQ-1; Fri, 10 Feb 2023 11:13:02 -0500
X-MC-Unique: yWI0SslqMJ2H-iLlVR-ZoQ-1
Received: by mail-ej1-f69.google.com with SMTP id fy3-20020a1709069f0300b008a69400909fso3854886ejc.7
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NitvGIVmtCGdtK4e3hCaRDRoUP9N0qyct+Wt53Ooibg=;
        b=QHUosU8eRN7hPbL41eGSMgkF4R6FXOAulA2sA0uHzRJ02YFbX8abkhjZ2cKgPRRUj/
         nL3Ku3hLVq2GBMfo5sf4V43HxqZFoTNFoDYV5Q9OENJt1K2vqPVvk/aGmjV/8AgsbG+N
         ZNoDs/R6dd1824o6EVgS7obzGCvFo+6sRSncNheVFz3Mkm01Kg7elF06HAUO8Lz1Oe+x
         xplXy3peDXKj+SySQgWTMsPi85r1QHxZ3UvNOUxwkfx+/YnPaddzl19aQtrhcqJR7Gt5
         Iy9fVppZ8Guk+hOn8JD4Z+jPvsJtYHpJO61+gfTx7/eywUj9VR0jZDnOkUvRbA4ESPR8
         +Jtw==
X-Gm-Message-State: AO0yUKVnxWPq8nV6zmA/cK5aZda+L312F1FwaWI77cK0QD7sOhz0oaIL
        162baA0hq5E7w4LFboZWZXLnXVl941Gkz6CxPIFLgVmIqe0jNTdoSW5KYEj3UOMV7+q98Gp93//
        fdw9sm+kipqHNfZ3dbBtpjgoUKDAFx1OSCQ==
X-Received: by 2002:a17:906:1e8a:b0:870:6554:92ac with SMTP id e10-20020a1709061e8a00b00870655492acmr14804259ejj.18.1676045581035;
        Fri, 10 Feb 2023 08:13:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8hAhx38R4lRnN0INGPOv9WONSN2liSQMfWSG6A5B/EUiM768qjOXvYv/ftWYu9UUPGghqrbg==
X-Received: by 2002:a17:906:1e8a:b0:870:6554:92ac with SMTP id e10-20020a1709061e8a00b00870655492acmr14804245ejj.18.1676045580880;
        Fri, 10 Feb 2023 08:13:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709066a8b00b0087f68a2681bsm2591215ejr.96.2023.02.10.08.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 08:13:00 -0800 (PST)
Message-ID: <c64cd8f8-a441-0fa6-2c78-fa80a937311e@redhat.com>
Date:   Fri, 10 Feb 2023 17:12:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: int3472/discrete: add LEDS_CLASS dependency
Content-Language: en-US, nl
To:     Arnd Bergmann <arnd@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230208163658.2129009-1-arnd@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230208163658.2129009-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/8/23 17:36, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> int3472 now fails to link when the LED support is disabled:
> 
> x86_64-linux-ld: drivers/platform/x86/intel/int3472/led.o: in function `skl_int3472_register_pled':
> led.c:(.text+0xf4): undefined reference to `led_classdev_register_ext'
> x86_64-linux-ld: led.c:(.text+0x131): undefined reference to `led_add_lookup'
> x86_64-linux-ld: drivers/platform/x86/intel/int3472/led.o: in function `skl_int3472_unregister_pled':
> led.c:(.text+0x16b): undefined reference to `led_remove_lookup'
> x86_64-linux-ld: led.c:(.text+0x177): undefined reference to `led_classdev_unregister'
> 
> Add an explicit Kconfig dependency.
> 
> Fixes: 5ae20a8050d0 ("platform/x86: int3472/discrete: Create a LED class device for the privacy LED")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you for your patch, I've applied this to the pdx86/for-next
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next

Regards,

Hans




> ---
>  drivers/platform/x86/intel/int3472/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/Kconfig b/drivers/platform/x86/intel/int3472/Kconfig
> index 62e5d4cf9ee5..17ae997f93ea 100644
> --- a/drivers/platform/x86/intel/int3472/Kconfig
> +++ b/drivers/platform/x86/intel/int3472/Kconfig
> @@ -4,6 +4,7 @@ config INTEL_SKL_INT3472
>  	depends on COMMON_CLK
>  	depends on I2C
>  	depends on GPIOLIB
> +	depends on LEDS_CLASS
>  	depends on REGULATOR
>  	select MFD_CORE
>  	select REGMAP_I2C

