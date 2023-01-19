Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E2FC004D4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Jan 2023 10:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjASK3s (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:29:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjASK3r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2023 05:29:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E60A4B19A
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 02:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674124142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Pa0ZASnZePqWEE3CEe8VGGBuhp32JSIkl37SOsY5d0=;
        b=PZ51KlnQ/cTWK3dCkW8I2bxtu6468PTAQ2HLvK9NhzvcRW+tVrd0UPzUN+4HRwaDbe6GYn
        fkNe41QRMiLLG24fCsQC6gzcgaaE/JZzBRnEvZsK8ZI0pP4JaI2AgRYyF9Aphd8fAv51VA
        qtNBQYs+2Y61Pc+pztAZbHuAUaxcs7g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-wYo3VjrhOj2gJJxiPKy6tg-1; Thu, 19 Jan 2023 05:29:00 -0500
X-MC-Unique: wYo3VjrhOj2gJJxiPKy6tg-1
Received: by mail-ej1-f69.google.com with SMTP id qw29-20020a1709066a1d00b008725a1034caso1288225ejc.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 02:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Pa0ZASnZePqWEE3CEe8VGGBuhp32JSIkl37SOsY5d0=;
        b=TOIDi/2Mvc1CphXI8bjpoMZOXsvWe8TEVMz7f6meguRhPb1rDTuHpV/E6D+/fyso6c
         buVPGJBTEU9zRSsc+OGpnGGejDDrO+btJSWJut/7Otw6n1vg/Nappx+XVrz4iNEBMIMJ
         o/zVni2Ame3S0GmlosHEQm/Gl61Bjpltn47mVdn/hu+JEkppel/VXJnK2/1lpirzLjup
         CtXRmVkd5Ij4+Om8ARhkSy0HAsFlVKbihHoNkoUrcid7GHpgvimpTLvXeFgTfVc8HBbK
         gLDQtzNbfN3AgyM8NyH5gagTUfamQlfV0PHYsNacNZpDC3/PbZ9jW9Xb4+Lgb2Q/rODt
         +8sw==
X-Gm-Message-State: AFqh2kp0ujGiOvy1Jvhxw5nbUmeADwxEU+AoSnkJWU0lgfAMZ+ODN1jP
        4PTT3RUiwAvBHRslIPiYj5ZguVc5n6HsTJP9mciHFc5pnk35DjPE4XNRux7gR3KH0O4mN6mF6Yv
        G3g8lkzYXtUSlz5EU+T72KdhNsEq0I9DYZQ==
X-Received: by 2002:a17:907:6e2a:b0:871:e9a0:eba7 with SMTP id sd42-20020a1709076e2a00b00871e9a0eba7mr14028977ejc.57.1674124137652;
        Thu, 19 Jan 2023 02:28:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXteM0H0LdTfdTAoVGHKGdBX00OJGoaufn/oE5hDzRonbz8fFruIVe7bmsJsq07keO8rBMtdFw==
X-Received: by 2002:a17:907:6e2a:b0:871:e9a0:eba7 with SMTP id sd42-20020a1709076e2a00b00871e9a0eba7mr14028957ejc.57.1674124137375;
        Thu, 19 Jan 2023 02:28:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mb9-20020a170906eb0900b0084d34eec68esm15031330ejb.213.2023.01.19.02.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 02:28:56 -0800 (PST)
Message-ID: <c5bcbfe0-2e23-c1d4-11de-9cc0f331e797@redhat.com>
Date:   Thu, 19 Jan 2023 11:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/2] x86: Further PCEngines APU4/5/6 cleanup
Content-Language: en-US, nl
To:     Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231140.437040-1-philipp@redfish-solutions.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230113231140.437040-1-philipp@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/14/23 00:11, Philip Prindeville wrote:
> From: Philip Prindeville <philipp@redfish-solutions.com>
> 
> Updated exclusionary warning in leds-apu.c about unsupported models.
> 
> Updated list of supported modules in Kconfig.
> 
> Updated copyright and module aliases to cover more models.
> 
> Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
> Reviewed-by: Paul Spooren <paul@spooren.de>
> ---
>  drivers/leds/leds-apu.c                | 2 +-
>  drivers/platform/x86/Kconfig           | 4 ++--
>  drivers/platform/x86/pcengines-apuv2.c | 5 +++++
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
> index c409b80c236d7182c79944225dd4b9e5d32f0a9f..fb3332863c36241e4b7f75f89213171ec0c0dd04 100644
> --- a/drivers/leds/leds-apu.c
> +++ b/drivers/leds/leds-apu.c
> @@ -183,7 +183,7 @@ static int __init apu_led_init(void)
>  
>  	if (!(dmi_match(DMI_SYS_VENDOR, "PC Engines") &&
>  	      (dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "apu1")))) {
> -		pr_err("No PC Engines APUv1 board detected. For APUv2,3 support, enable CONFIG_PCENGINES_APU2\n");
> +		pr_err("No PC Engines APUv1 board detected. For APUv2,3,4,5,6 support, enable CONFIG_PCENGINES_APU2\n");
>  		return -ENODEV;
>  	}
>  
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 5692385e2d26fed92785488ce1c6e88449c54c78..f930d5dd3efee11fbad4ad9508eb288bb4181bab 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -698,7 +698,7 @@ config XO1_RFKILL
>  	  laptop.
>  
>  config PCENGINES_APU2
> -	tristate "PC Engines APUv2/3 front button and LEDs driver"
> +	tristate "PC Engines APUv2/3/4/5/6 front button and LEDs driver"
>  	depends on INPUT && INPUT_KEYBOARD && GPIOLIB
>  	depends on LEDS_CLASS
>  	select GPIO_AMD_FCH
> @@ -706,7 +706,7 @@ config PCENGINES_APU2
>  	select LEDS_GPIO
>  	help
>  	  This driver provides support for the front button and LEDs on
> -	  PC Engines APUv2/APUv3 board.
> +	  PC Engines APUv2/APUv3/APUv4/APUv5/APUv6 board.
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pcengines-apuv2.
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index 8731564bab62c1e47e99adb6ec23b3de81b09069..bd58d5294f0146088d435f1c9df83eb218b67b0c 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -6,6 +6,7 @@
>   *
>   * Copyright (C) 2018 metux IT consult
>   * Copyright (C) 2022 Ed Wildgoose <lists@wildgooses.com>
> + * Copyright (C) 2022 Philip Prindeville <philipp@redfish-solutions.com>
>   * Author: Enrico Weigelt <info@metux.net>
>   */
>  
> @@ -377,4 +378,8 @@ MODULE_DESCRIPTION("PC Engines APUv2-6 board GPIO/LEDs/keys driver");
>  MODULE_LICENSE("GPL");
>  MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
>  MODULE_ALIAS("platform:pcengines-apuv2");
> +MODULE_ALIAS("platform:pcengines-apuv3");
> +MODULE_ALIAS("platform:pcengines-apuv4");
> +MODULE_ALIAS("platform:pcengines-apuv5");
> +MODULE_ALIAS("platform:pcengines-apuv6");

Rather then add all these, can you drop the first MODULE_ALIAS instead?

The driver auto-loads based on the DMI modaliases and this platform
modalias is not necessary and broken:

1. not necessary since the driver itself creates the platform_device,
   so it is already loaded when the modalias might be used
2. From a quick scan of the code it does not create any platform-devices
   called "platform:pcengines-apuv2"



>  MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds-gpio platform:gpio_keys_polled");

Regards,

Hans


