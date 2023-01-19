Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E2BC004D4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Jan 2023 10:23:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbjASKXn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjASKXk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2023 05:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF866E80E
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 02:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674123730;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mYWjHAWg3ixUy8GRW5xPQ8FUsWhzD7K6qBzCCpgK5VY=;
        b=JeNAsUD2pwA+8kJRdufl181/D/u26SWrAS6rp2f1o0zZayYX0NO8altwn1zZyVTXgrAsCb
        lFv5f4cSnN0bO+UQyn4FCLieBkZkYvt/vn/C1hCsyCJ8beLtp7HKaZIVZdRnYoFpkPmcmD
        mMmFSGu5DqED9NyWYUspSVw/jzzkcP0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-410-o2ID882pNgGlZeRGqoszWg-1; Thu, 19 Jan 2023 05:22:08 -0500
X-MC-Unique: o2ID882pNgGlZeRGqoszWg-1
Received: by mail-ed1-f69.google.com with SMTP id y2-20020a056402440200b0049e4d71f5dcso1334388eda.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 02:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYWjHAWg3ixUy8GRW5xPQ8FUsWhzD7K6qBzCCpgK5VY=;
        b=U1W3JCdEt4B2uDr7TuouoooT1cjQqVN31DWaALb18AOJhFcSJbDXRo5Azh34NDN6YZ
         rH+UQa6YpUrWuYzAc1TP3H5cL+PCbjSLJ4wYLCaKe6JK3u+DiPihd+QaaJj00TXkii7G
         eqp6co3eYG7OCrG+x4OevywW8ZWmG1MUJ21eQUDyGcmZiHNP4+ycg1Am0VYMGlbGe10U
         62H5Kkyw25apW9aVHWG11QMXl/Yw4CyEmTa/FpYGZWL36fxUEuS3kzlkyDFcFA3bgDJv
         DRvmS+eVbF9vXhnAKvI8EJcibagBuzDzRghuYLh49e2c7DixnBZMAvW96RzPlhXGRGgu
         WhUw==
X-Gm-Message-State: AFqh2kqGqmwvWYETYu52EFkSI/VLlERizcShAtmKKQ5cuCOLdGU465Fn
        Adqz/xAkHqGBhZNilvx1UEySYgagh7KL7PxlCYRqAXUigOkZa3ZH5o7qG+TxWXYd04Ds9podViU
        RxsNfg84xhX4LU5plnOt9EZIuWq8qBlwf/Q==
X-Received: by 2002:a17:906:299b:b0:84d:4394:e8e with SMTP id x27-20020a170906299b00b0084d43940e8emr10140630eje.41.1674123727542;
        Thu, 19 Jan 2023 02:22:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtoeR6nS95V6iwmaEEvQa+GYYd+yTCTUYdjn05mE5sSbvbwrxt4wY7fe/j/J4SOuetHA5pHrA==
X-Received: by 2002:a17:906:299b:b0:84d:4394:e8e with SMTP id x27-20020a170906299b00b0084d43940e8emr10140611eje.41.1674123727244;
        Thu, 19 Jan 2023 02:22:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g18-20020a1709061c9200b007c1675d2626sm16341287ejh.96.2023.01.19.02.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 02:22:06 -0800 (PST)
Message-ID: <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
Date:   Thu, 19 Jan 2023 11:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: en-US, nl
To:     Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230113231139.436956-1-philipp@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/14/23 00:11, Philip Prindeville wrote:
> From: Philip Prindeville <philipp@redfish-solutions.com>
> 
> PCEngines make a number of SBC. APU5 has 5 mpcie slots + MSATA
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
> Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
> Reviewed-by: Philip Prindeville <philipp@redfish-solutions.com>
> Reviewed-by: Andreas Eberlein <foodeas@aeberlein.de>
> Reviewed-by: Paul Spooren <paul@spooren.de>
> ---
>  drivers/platform/x86/pcengines-apuv2.c | 113 ++++++++++++++++++++++---
>  1 file changed, 99 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index d063d91db9bcbe5ceb2ac641d3105df37651ac4d..8731564bab62c1e47e99adb6ec23b3de81b09069 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -1,10 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  /*
> - * PC-Engines APUv2/APUv3 board platform driver
> + * PC-Engines APUv2-6 board platform driver
>   * for GPIO buttons and LEDs
>   *
>   * Copyright (C) 2018 metux IT consult
> + * Copyright (C) 2022 Ed Wildgoose <lists@wildgooses.com>
>   * Author: Enrico Weigelt <info@metux.net>
>   */
>  
> @@ -22,38 +23,70 @@
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

I don't think this changing of GPIO ordering, or
for that part the changing of the gpio_names from 
"mpcie2_reset" to "modem1-reset" is a good idea.

I'm not entirely sure how these GPIOs are supposed to be
consumed / used by userspace. But since they are not used
directly in this driver I assume userspace is supposed to
use either the (deprecated) sysfs GPIO API or the new ioctl
based GPIO API to toggle say "simswap" if it needs to.

The old sysfs API exclusively uses pin-indexes inside a GPIO
chip to select the pin, so by changing the pin order you
have just broken the userspace API.

And the new ioctl API can use either pin-indexes or GPIO-line-names,
so by changing the names you have also just potentially broken
that.

Please keep the order as is and only use the new names for
the newly added models (so for APU6 I believe).

I guess that means adding a new apu6_gpio_names[]
array for APU6, that is fine.

Note you can still do the "MPCIE2" -> "RESETM1" defines
if you want, to allow reusing the defines and the apu2_gpio_regs[]
array. But in order to not brake uAPI you must:

1. Not change the order of the pins
2. Keep the "mpcie2_reset" and "mpcie3_reset" names for the
   already supported models.

Also can you please split this patch into 2 patches,
1 adding the APU5 support and one adding the APU6 support
(not necessarily in that order) ?

Regards,

Hans


p.s.

About the bounces I'm getting bounces for linux-x86_64@vger.kernel.org
(dropped) but not for Enrico's email.



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
> @@ -61,9 +94,9 @@ static const char * const apu2_gpio_names[] = {
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
> @@ -72,6 +105,40 @@ static const struct amd_fch_gpio_pdata board_apu2 = {
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
> @@ -215,6 +282,24 @@ static const struct dmi_system_id apu_gpio_dmi_table[] __initconst = {
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
> @@ -249,7 +334,7 @@ static int __init apu_board_init(void)
>  
>  	id = dmi_first_match(apu_gpio_dmi_table);
>  	if (!id) {
> -		pr_err("failed to detect APU board via DMI\n");
> +		pr_err("No APU board detected via DMI\n");
>  		return -ENODEV;
>  	}
>  
> @@ -288,7 +373,7 @@ module_init(apu_board_init);
>  module_exit(apu_board_exit);
>  
>  MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
> -MODULE_DESCRIPTION("PC Engines APUv2/APUv3 board GPIO/LEDs/keys driver");
> +MODULE_DESCRIPTION("PC Engines APUv2-6 board GPIO/LEDs/keys driver");
>  MODULE_LICENSE("GPL");
>  MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
>  MODULE_ALIAS("platform:pcengines-apuv2");

