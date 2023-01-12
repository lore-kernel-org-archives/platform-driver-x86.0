Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0128FC61DB3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 19:12:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240403AbjALTMt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:12:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240427AbjALTME (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 14:12:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E948713D11
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673549827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=er5gNg/OamJyrVeVfkV3t4NzY28ua5tBpiVj0Z1qzzY=;
        b=ihBpgFvDk8X1mWpKnPlZNqya4xamYyt4+1EC9PxPYG4ImpCcSPtWz/6MPkIMvnNHltiYtv
        MxUXor8hyWJ+SbdJgOavX3z0fep1p9A4nlGFKMGxRjir0IGgr5OMnOBK8eSvg9/yjoA7dn
        4Hy1UeKDBLjsGd5ZEy7sZmqq6jutWRY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-Jj48TcZHOo2MVxkI0pO0xQ-1; Thu, 12 Jan 2023 13:57:05 -0500
X-MC-Unique: Jj48TcZHOo2MVxkI0pO0xQ-1
Received: by mail-ed1-f70.google.com with SMTP id q10-20020a056402518a00b0048e5bc8cb74so12898749edd.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=er5gNg/OamJyrVeVfkV3t4NzY28ua5tBpiVj0Z1qzzY=;
        b=ByxUg/pBiHr5+Z7FNeGfe6raRupxlwSFk6VO/g67EXco0ODxb5E+p8SXZdvZrEUkuu
         7Sk/3eP3iTCrmDs8Bc25AeGSQ5dpY+WyQZnQBLeeUhFt9kroeMw/BCpX7M+q4CRqObjh
         ybNnfRVq08pXHewXq43FDGcGxsguNcjUOx+w9/7MBjhxtOxwxWy2KH8znRbx/5L+CKKH
         M3dMDSNKDYtZnYaq+FKelFeJeOBwHepPtyw/AZXHNWRKuvfdbQ64uRyGeZMjFE75R4q2
         8eWIpRuul687mSJSalLmbXt50kfL5dZqF3CZ80s0xUdRcStjruHKEGHSzCJ9PAosBHAy
         Rw5A==
X-Gm-Message-State: AFqh2kqdcknfVtDgAtGs6Pw8LL1yJWWUpkZ1Pmt6boAZeAXRWVpAl3+E
        Js8lDpAUx3SNICdo/mz3BUCzzL9Nf7FHJYFpUrlKo0agqQlkYiEYuQ4fBiHEx79KvQydKW0Omi3
        3MPAJGAdJjTw6uEEXRBhhE29kCbCq8QXw6A==
X-Received: by 2002:a05:6402:1c95:b0:48b:a29f:4bef with SMTP id cy21-20020a0564021c9500b0048ba29f4befmr39070835edb.6.1673549822180;
        Thu, 12 Jan 2023 10:57:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtG9j7ZcBUCKpiR+dzW1rlTbrZMEr1sFzcP6hMWDdQ2L1CZjfGfWU/MMX8O/FAN/g9IqFTZVw==
X-Received: by 2002:a05:6402:1c95:b0:48b:a29f:4bef with SMTP id cy21-20020a0564021c9500b0048ba29f4befmr39070825edb.6.1673549821975;
        Thu, 12 Jan 2023 10:57:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l15-20020aa7c3cf000000b00467481df198sm7452527edr.48.2023.01.12.10.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 10:57:01 -0800 (PST)
Message-ID: <01dbd065-693b-e5fe-5aaf-d74971d6fe7d@redhat.com>
Date:   Thu, 12 Jan 2023 19:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/1] x86: Support APU5 in PCEngines platform driver
Content-Language: en-US, nl
To:     Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        Enrico Weigelt <info@metux.net>
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230102065447.3447284-1-philipp@redfish-solutions.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230102065447.3447284-1-philipp@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/2/23 07:54, Philip Prindeville wrote:
> From: Philip Prindeville <philipp@redfish-solutions.com>
> 
> PCEngines make a number of SBC. APU5 has 5 mpcie slots + MSATA.
> It also has support for 3x LTE modems with 6x SIM slots (pairs with a
> SIM switch device). Each mpcie slot for modems has a reset GPIO
> 
> To ensure that the naming is sane between APU2-6 the GPIOS are
> renamed to be modem1-reset, modem2-reset, etc. This is significant
> because the slots that can be reset change between APU2 and APU3/4
> 
> GPIO for simswap is moved to the end of the list as it could be dropped
> for APU2 boards (but causes no harm to leave it in, hardware could be
> added to a future rev of the board).
> 
> Structure of the GPIOs for APU5 is extremely similar to APU2-4, but
> many lines are moved around and there are simply more
> modems/resets/sim-swap lines to breakout.
> 
> Also added APU6, which is essentially APU4 with a different ethernet
> interface and SFP cage on eth0.
> 
> Revision history:
> 
> v1: originally titled, "apu6: add apu6 variation to apu2 driver family"
> this dealt only with detecting the APUv6, which is otherwise identical
> to the v4 excepting the SFP cage on eth0.
> 
> v2: at Ed's request, merged with his previous pull-request titled
> "x86: Support APU5 in PCEngines platform driver", and some cleanup
> to that changeset (including dropping the table "apu5_driver_data"
> which did not have a defined type "struct apu_driver_data"), but got
> mistitled when the Subject of that commit got accidentally dropped.
> 
> v3: retitled to match Ed's previous pull-request.
> 
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-x86_64@vger.kernel.org
> Reviewed-by: Andreas Eberlein <foodeas@aeberlein.de>
> Reviewed-by: Paul Spooren <paul@spooren.de>
> Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
> Sighed-off-by: Philip Prindeville <philipp@redfish-solutions.com>

Hmm, squashing the 2 patches for APU5 and APU6 support together
really is not helpful. this really should be
a series with 2 separate patches.

Also I would really like to have Enrico's input about this,
IIRC last time this was looked at there were some none trivial
compatibility issues...

Regards,

Hans


> ---
>  drivers/leds/leds-apu.c                |   2 +-
>  drivers/platform/x86/Kconfig           |   4 +-
>  drivers/platform/x86/pcengines-apuv2.c | 118 ++++++++++++++++++++++---
>  3 files changed, 107 insertions(+), 17 deletions(-)
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
> index d063d91db9bcbe5ceb2ac641d3105df37651ac4d..bd58d5294f0146088d435f1c9df83eb218b67b0c 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -1,10 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  /*
> - * PC-Engines APUv2/APUv3 board platform driver
> + * PC-Engines APUv2-6 board platform driver
>   * for GPIO buttons and LEDs
>   *
>   * Copyright (C) 2018 metux IT consult
> + * Copyright (C) 2022 Ed Wildgoose <lists@wildgooses.com>
> + * Copyright (C) 2022 Philip Prindeville <philipp@redfish-solutions.com>
>   * Author: Enrico Weigelt <info@metux.net>
>   */
>  
> @@ -22,38 +24,70 @@
>  #include <linux/platform_data/gpio/gpio-amd-fch.h>
>  
>  /*
> - * NOTE: this driver only supports APUv2/3 - not APUv1, as this one
> + * NOTE: this driver only supports APUv2-6 - not APUv1, as this one
>   * has completely different register layouts.
>   */
>  
> +/*
> + * There are a number of APU variants, with differing features
> + * APU2 has SIM slots 1/2 mapping to mPCIe sockets 1/2
> + * APU3/4 moved SIM slot 1 to mPCIe socket 3, ie logically reversed
> + * However, most APU3/4 have a SIM switch which we default on to reverse
> + * the order and keep physical SIM order matching physical modem order
> + * APU6 is approximately the same as APU4 with different ethernet layout
> + *
> + * APU5 has 3x SIM sockets, all with a SIM switch
> + * several GPIOs are shuffled (see schematic), including MODESW
> + */
> +
>  /* Register mappings */
>  #define APU2_GPIO_REG_LED1		AMD_FCH_GPIO_REG_GPIO57
>  #define APU2_GPIO_REG_LED2		AMD_FCH_GPIO_REG_GPIO58
>  #define APU2_GPIO_REG_LED3		AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
>  #define APU2_GPIO_REG_MODESW		AMD_FCH_GPIO_REG_GPIO32_GE1
>  #define APU2_GPIO_REG_SIMSWAP		AMD_FCH_GPIO_REG_GPIO33_GE2
> -#define APU2_GPIO_REG_MPCIE2		AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
> -#define APU2_GPIO_REG_MPCIE3		AMD_FCH_GPIO_REG_GPIO51
> +#define APU2_GPIO_REG_RESETM1		AMD_FCH_GPIO_REG_GPIO51
> +#define APU2_GPIO_REG_RESETM2		AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
> +
> +#define APU5_GPIO_REG_MODESW		AMT_FCH_GPIO_REG_GEVT22
> +#define APU5_GPIO_REG_SIMSWAP1		AMD_FCH_GPIO_REG_GPIO68
> +#define APU5_GPIO_REG_SIMSWAP2		AMD_FCH_GPIO_REG_GPIO32_GE1
> +#define APU5_GPIO_REG_SIMSWAP3		AMD_FCH_GPIO_REG_GPIO33_GE2
> +#define APU5_GPIO_REG_RESETM1		AMD_FCH_GPIO_REG_GPIO51
> +#define APU5_GPIO_REG_RESETM2		AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
> +#define APU5_GPIO_REG_RESETM3		AMD_FCH_GPIO_REG_GPIO64
>  
>  /* Order in which the GPIO lines are defined in the register list */
>  #define APU2_GPIO_LINE_LED1		0
>  #define APU2_GPIO_LINE_LED2		1
>  #define APU2_GPIO_LINE_LED3		2
>  #define APU2_GPIO_LINE_MODESW		3
> -#define APU2_GPIO_LINE_SIMSWAP		4
> -#define APU2_GPIO_LINE_MPCIE2		5
> -#define APU2_GPIO_LINE_MPCIE3		6
> +#define APU2_GPIO_LINE_RESETM1		4
> +#define APU2_GPIO_LINE_RESETM2		5
> +#define APU2_GPIO_LINE_SIMSWAP		6
> +
> +#define APU5_GPIO_LINE_LED1		0
> +#define APU5_GPIO_LINE_LED2		1
> +#define APU5_GPIO_LINE_LED3		2
> +#define APU5_GPIO_LINE_MODESW		3
> +#define APU5_GPIO_LINE_RESETM1		4
> +#define APU5_GPIO_LINE_RESETM2		5
> +#define APU5_GPIO_LINE_RESETM3		6
> +#define APU5_GPIO_LINE_SIMSWAP1		7
> +#define APU5_GPIO_LINE_SIMSWAP2		8
> +#define APU5_GPIO_LINE_SIMSWAP3		9
>  
> -/* GPIO device */
> +
> +/* GPIO device - APU2/3/4/6 */
>  
>  static int apu2_gpio_regs[] = {
>  	[APU2_GPIO_LINE_LED1]		= APU2_GPIO_REG_LED1,
>  	[APU2_GPIO_LINE_LED2]		= APU2_GPIO_REG_LED2,
>  	[APU2_GPIO_LINE_LED3]		= APU2_GPIO_REG_LED3,
>  	[APU2_GPIO_LINE_MODESW]		= APU2_GPIO_REG_MODESW,
> +	[APU2_GPIO_LINE_RESETM1]	= APU2_GPIO_REG_RESETM1,
> +	[APU2_GPIO_LINE_RESETM2]	= APU2_GPIO_REG_RESETM2,
>  	[APU2_GPIO_LINE_SIMSWAP]	= APU2_GPIO_REG_SIMSWAP,
> -	[APU2_GPIO_LINE_MPCIE2]		= APU2_GPIO_REG_MPCIE2,
> -	[APU2_GPIO_LINE_MPCIE3]		= APU2_GPIO_REG_MPCIE3,
>  };
>  
>  static const char * const apu2_gpio_names[] = {
> @@ -61,9 +95,9 @@ static const char * const apu2_gpio_names[] = {
>  	[APU2_GPIO_LINE_LED2]		= "front-led2",
>  	[APU2_GPIO_LINE_LED3]		= "front-led3",
>  	[APU2_GPIO_LINE_MODESW]		= "front-button",
> +	[APU2_GPIO_LINE_RESETM1]	= "modem1-reset",
> +	[APU2_GPIO_LINE_RESETM2]	= "modem2-reset",
>  	[APU2_GPIO_LINE_SIMSWAP]	= "simswap",
> -	[APU2_GPIO_LINE_MPCIE2]		= "mpcie2_reset",
> -	[APU2_GPIO_LINE_MPCIE3]		= "mpcie3_reset",
>  };
>  
>  static const struct amd_fch_gpio_pdata board_apu2 = {
> @@ -72,6 +106,40 @@ static const struct amd_fch_gpio_pdata board_apu2 = {
>  	.gpio_names	= apu2_gpio_names,
>  };
>  
> +/* GPIO device - APU5 */
> +
> +static int apu5_gpio_regs[] = {
> +	[APU5_GPIO_LINE_LED1]		= APU2_GPIO_REG_LED1,
> +	[APU5_GPIO_LINE_LED2]		= APU2_GPIO_REG_LED2,
> +	[APU5_GPIO_LINE_LED3]		= APU2_GPIO_REG_LED3,
> +	[APU5_GPIO_LINE_MODESW]		= APU5_GPIO_REG_MODESW,
> +	[APU5_GPIO_LINE_RESETM1]	= APU5_GPIO_REG_RESETM1,
> +	[APU5_GPIO_LINE_RESETM2]	= APU5_GPIO_REG_RESETM2,
> +	[APU5_GPIO_LINE_RESETM3]	= APU5_GPIO_REG_RESETM3,
> +	[APU5_GPIO_LINE_SIMSWAP1]	= APU5_GPIO_REG_SIMSWAP1,
> +	[APU5_GPIO_LINE_SIMSWAP2]	= APU5_GPIO_REG_SIMSWAP2,
> +	[APU5_GPIO_LINE_SIMSWAP3]	= APU5_GPIO_REG_SIMSWAP3,
> +};
> +
> +static const char * const apu5_gpio_names[] = {
> +	[APU5_GPIO_LINE_LED1]		= "front-led1",
> +	[APU5_GPIO_LINE_LED2]		= "front-led2",
> +	[APU5_GPIO_LINE_LED3]		= "front-led3",
> +	[APU5_GPIO_LINE_MODESW]		= "front-button",
> +	[APU5_GPIO_LINE_RESETM1]	= "modem1-reset",
> +	[APU5_GPIO_LINE_RESETM2]	= "modem2-reset",
> +	[APU5_GPIO_LINE_RESETM3]	= "modem3-reset",
> +	[APU5_GPIO_LINE_SIMSWAP1]	= "simswap1",
> +	[APU5_GPIO_LINE_SIMSWAP2]	= "simswap2",
> +	[APU5_GPIO_LINE_SIMSWAP3]	= "simswap3",
> +};
> +
> +static const struct amd_fch_gpio_pdata board_apu5 = {
> +	.gpio_num	= ARRAY_SIZE(apu5_gpio_regs),
> +	.gpio_reg	= apu5_gpio_regs,
> +	.gpio_names	= apu5_gpio_names,
> +};
> +
>  /* GPIO LEDs device */
>  
>  static const struct gpio_led apu2_leds[] = {
> @@ -215,6 +283,24 @@ static const struct dmi_system_id apu_gpio_dmi_table[] __initconst = {
>  		},
>  		.driver_data = (void *)&board_apu2,
>  	},
> +	/* APU5 w/ mainline BIOS */
> +	{
> +		.ident		= "apu5",
> +		.matches	= {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "apu5")
> +		},
> +		.driver_data	= (void *)&board_apu5,
> +	},
> +	/* APU6 w/ mainline BIOS */
> +	{
> +		.ident		= "apu6",
> +		.matches	= {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "apu6")
> +		},
> +		.driver_data	= (void *)&board_apu2,
> +	},
>  	{}
>  };
>  
> @@ -249,7 +335,7 @@ static int __init apu_board_init(void)
>  
>  	id = dmi_first_match(apu_gpio_dmi_table);
>  	if (!id) {
> -		pr_err("failed to detect APU board via DMI\n");
> +		pr_err("No APU board detected via DMI\n");
>  		return -ENODEV;
>  	}
>  
> @@ -288,8 +374,12 @@ module_init(apu_board_init);
>  module_exit(apu_board_exit);
>  
>  MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
> -MODULE_DESCRIPTION("PC Engines APUv2/APUv3 board GPIO/LEDs/keys driver");
> +MODULE_DESCRIPTION("PC Engines APUv2-6 board GPIO/LEDs/keys driver");
>  MODULE_LICENSE("GPL");
>  MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
>  MODULE_ALIAS("platform:pcengines-apuv2");
> +MODULE_ALIAS("platform:pcengines-apuv3");
> +MODULE_ALIAS("platform:pcengines-apuv4");
> +MODULE_ALIAS("platform:pcengines-apuv5");
> +MODULE_ALIAS("platform:pcengines-apuv6");
>  MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds-gpio platform:gpio_keys_polled");

