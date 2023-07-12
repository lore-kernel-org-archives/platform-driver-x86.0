Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6E0EB64DA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Jul 2023 15:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjGLPsH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Jul 2023 11:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233857AbjGLPsG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2023 11:48:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5505EFB
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689176840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6PNVcE7lVmOJ5tQkeEuNoo3cjKXe2G0NG2ds34MvcRw=;
        b=Mn4L5KSIv8clFo3B71qHq58bb59MfoQMCIIw7ZQxt1HOMkBc85kM993+0hGJXGY9Fk51rk
        SKmUaN6u+s53+y+OZlx1JhTdAVlb+vXDtLjZ0eQOK1ZSi61SSSxv4/tkFp0q5pJKmvXyef
        gVhOUaofHpm9Fm5Ss06cs+kpH3HmuBM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-b36Fo1LZP9qm3VKry51Vtg-1; Wed, 12 Jul 2023 11:47:19 -0400
X-MC-Unique: b36Fo1LZP9qm3VKry51Vtg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a34e35f57so406288066b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 08:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689176837; x=1691768837;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PNVcE7lVmOJ5tQkeEuNoo3cjKXe2G0NG2ds34MvcRw=;
        b=fI/Q9WyDUpGx4MnXfgKTSuIj+qE2WhoM7tyBc12f/hBwTym6LWpVN2HCg1+2zerFFY
         nGM9lebYUlJlc8rQlrEZyUDW+XZHd1791eGW03yNVWDm9xWEg2zDD0PmwWLPqXbGXuWR
         CX4v6f3lzazDjwtkU87/QKjpgpsu59teV/BohV6v7CsUSuh9gFnHVn2h1+Z9jElJXlJl
         1RdKGqLkGdb81zrZSJL/jJTB3orb/xF538+mesySMEN/A8xJY6VA0kVlHJpaPBsEYUG5
         K8C+w5ITZT/ObFvJan9Dcxf4e3/h/EWbP1IRvo8uWUcmkPGTpcBUhWNBV/wjC9wpULqr
         HW7g==
X-Gm-Message-State: ABy/qLbHqccjus/wHTGlkeHwe5f698iVtR2Z1pRRSQUsBzz30MRACjgM
        vEmbKw4nXNkJCNimyzhGhWeDm3nhpOQhj2rtvMpQzzrEkYeOQlnAK5Urs11W3V72EJfJMJeGw3r
        kgLQu5uhF/EbQQscT2OK3pXgnTNQIY0ABO0JMz6SCKw==
X-Received: by 2002:a17:906:74d8:b0:988:57b4:2853 with SMTP id z24-20020a17090674d800b0098857b42853mr22133982ejl.25.1689176837501;
        Wed, 12 Jul 2023 08:47:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHAl5ABybL3hQ/0cqPNZU+aaPBm/j6qNH9oVSdMa4Ey4DA69lVzomIJ6gnOzLE5UsSZXROzOA==
X-Received: by 2002:a17:906:74d8:b0:988:57b4:2853 with SMTP id z24-20020a17090674d800b0098857b42853mr22133965ejl.25.1689176837126;
        Wed, 12 Jul 2023 08:47:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id se18-20020a170906ce5200b0099329b3ab67sm2713716ejb.71.2023.07.12.08.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 08:47:16 -0700 (PDT)
Message-ID: <d9583475-c7b6-0bb7-a66f-03cf7dfcca33@redhat.com>
Date:   Wed, 12 Jul 2023 17:47:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: Add SEL-3350 platform driver
Content-Language: en-US, nl
To:     Robert Joslyn <robert.joslyn@redrectangle.org>,
        platform-driver-x86@vger.kernel.org
References: <20230701040240.550813-1-robert.joslyn@redrectangle.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230701040240.550813-1-robert.joslyn@redrectangle.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/1/23 06:02, Robert Joslyn wrote:
> Add a driver for Schweitzer Engineering Laboratories SEL-3350 computers
> front LEDs and power supplies. LED and power supply status is provided
> by the Intel SoC GPIO.
> 
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  drivers/platform/x86/Kconfig            |  16 ++
>  drivers/platform/x86/Makefile           |   3 +
>  drivers/platform/x86/sel3350-platform.c | 254 ++++++++++++++++++++++++
>  3 files changed, 273 insertions(+)
>  create mode 100644 drivers/platform/x86/sel3350-platform.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 49c2c4cd8d00..d464038d6ce5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1094,6 +1094,22 @@ config WINMATE_FM07_KEYS
>  	  buttons below the display. This module adds an input device
>  	  that delivers key events when these buttons are pressed.
>  
> +config SEL3350_PLATFORM
> +	tristate "SEL-3350 LEDs and power supplies"
> +	depends on ACPI
> +	select POWER_SUPPLY
> +	select GPIOLIB

Please use "depends on GPIOLIB" instead. I know that GPIOLIB is selected in some cases but all the other config snippets in drivers/platform/x86/Kconfig use depends on for GPIOLIB and generally speaking depends on is a lot less likely to cause Kconfig problems (circular dependencies) then select.

> +	select NEW_LEDS
> +	select LEDS_CLASS
> +	select LEDS_GPIO
> +	select PINCTRL
> +	select PINCTRL_BROXTON
> +	help
> +	  Support for LEDs and power supplies on SEL-3350 computers.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called sel3350-platform.
> +
>  endif # X86_PLATFORM_DEVICES
>  
>  config P2SB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 52dfdf574ac2..a1e989ac0d80 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -135,3 +135,6 @@ obj-$(CONFIG_SIEMENS_SIMATIC_IPC)	+= simatic-ipc.o
>  
>  # Winmate
>  obj-$(CONFIG_WINMATE_FM07_KEYS)		+= winmate-fm07-keys.o
> +
> +# SEL
> +obj-$(CONFIG_SEL3350_PLATFORM)		+= sel3350-platform.o
> diff --git a/drivers/platform/x86/sel3350-platform.c b/drivers/platform/x86/sel3350-platform.c
> new file mode 100644
> index 000000000000..0a8341c1f714
> --- /dev/null
> +++ b/drivers/platform/x86/sel3350-platform.c
> @@ -0,0 +1,254 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> +/*
> + * Copyright 2023 Schweitzer Engineering Laboratories, Inc.
> + * 2350 NE Hopkins Court, Pullman, WA 99163 USA
> + *
> + * Platform support for the b2093 mainboard used in SEL-3350 computers.
> + * Consumes GPIO from the SoC to provide standard LED and power supply
> + * devices.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/power_supply.h>
> +
> +/* Broxton communities */
> +#define BXT_NW "INT3452:01"
> +#define BXT_W  "INT3452:02"
> +#define BXT_SW "INT3452:03"
> +
> +#define B2093_GPIO_ACPI_ID "SEL0003"
> +
> +#define SEL_PS_A        "sel_ps_a"
> +#define SEL_PS_A_DETECT "sel_ps_a_detect"
> +#define SEL_PS_A_GOOD   "sel_ps_a_good"
> +#define SEL_PS_B        "sel_ps_b"
> +#define SEL_PS_B_DETECT "sel_ps_b_detect"
> +#define SEL_PS_B_GOOD   "sel_ps_b_good"
> +
> +/* LEDs */
> +static const struct gpio_led sel3350_leds[] = {
> +	{ .name = "sel:green:aux1" },
> +	{ .name = "sel:green:aux2" },
> +	{ .name = "sel:green:aux3" },
> +	{ .name = "sel:green:aux4" },
> +	{ .name = "sel:red:alarm" },
> +	{ .name = "sel:green:enabled",
> +	  .default_state = LEDS_GPIO_DEFSTATE_ON },
> +	{ .name = "sel:red:aux1" },
> +	{ .name = "sel:red:aux2" },
> +	{ .name = "sel:red:aux3" },
> +	{ .name = "sel:red:aux4" },
> +};
> +
> +static const struct gpio_led_platform_data sel3350_leds_pdata = {
> +	.num_leds = ARRAY_SIZE(sel3350_leds),
> +	.leds = sel3350_leds,
> +};
> +
> +/* Map GPIOs to LEDs */
> +static struct gpiod_lookup_table sel3350_leds_table = {
> +	.dev_id = "leds-gpio",
> +	.table = {
> +		GPIO_LOOKUP_IDX(BXT_NW, 49, NULL, 0, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(BXT_NW, 50, NULL, 1, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(BXT_NW, 51, NULL, 2, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(BXT_NW, 52, NULL, 3, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(BXT_W,  20, NULL, 4, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(BXT_W,  21, NULL, 5, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(BXT_SW, 37, NULL, 6, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(BXT_SW, 38, NULL, 7, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(BXT_SW, 39, NULL, 8, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(BXT_SW, 40, NULL, 9, GPIO_ACTIVE_HIGH),
> +		{},
> +	}
> +};
> +
> +/* Map GPIOs to power supplies */
> +static struct gpiod_lookup_table sel3350_gpios_table = {
> +	.dev_id = B2093_GPIO_ACPI_ID ":00",
> +	.table = {
> +		GPIO_LOOKUP(BXT_NW, 44, SEL_PS_A_DETECT, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP(BXT_NW, 45, SEL_PS_A_GOOD,   GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP(BXT_NW, 46, SEL_PS_B_DETECT, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP(BXT_NW, 47, SEL_PS_B_GOOD,   GPIO_ACTIVE_LOW),
> +		{},
> +	}
> +};
> +
> +/* Power Supplies */
> +
> +struct sel3350_power_cfg_data {
> +	struct gpio_desc *ps_detect;
> +	struct gpio_desc *ps_good;
> +};
> +
> +static int sel3350_power_get_property(struct power_supply *psy,
> +				      enum power_supply_property psp,
> +				      union power_supply_propval *val)
> +{
> +	struct sel3350_power_cfg_data *data = power_supply_get_drvdata(psy);
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_HEALTH:
> +		if (gpiod_get_value(data->ps_detect)) {
> +			if (gpiod_get_value(data->ps_good))
> +				val->intval = POWER_SUPPLY_HEALTH_GOOD;
> +			else
> +				val->intval = POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
> +		} else {
> +			val->intval = POWER_SUPPLY_HEALTH_UNKNOWN;
> +		}
> +		break;
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		val->intval = gpiod_get_value(data->ps_detect);
> +		break;
> +	case POWER_SUPPLY_PROP_ONLINE:
> +		val->intval = gpiod_get_value(data->ps_good);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static const enum power_supply_property sel3350_power_properties[] = {
> +	POWER_SUPPLY_PROP_HEALTH,
> +	POWER_SUPPLY_PROP_PRESENT,
> +	POWER_SUPPLY_PROP_ONLINE,
> +};
> +
> +static const struct power_supply_desc sel3350_ps_a_desc = {
> +	.name = SEL_PS_A,
> +	.type = POWER_SUPPLY_TYPE_MAINS,
> +	.properties = sel3350_power_properties,
> +	.num_properties = ARRAY_SIZE(sel3350_power_properties),
> +	.get_property = sel3350_power_get_property,
> +};
> +
> +static const struct power_supply_desc sel3350_ps_b_desc = {
> +	.name = SEL_PS_B,
> +	.type = POWER_SUPPLY_TYPE_MAINS,
> +	.properties = sel3350_power_properties,
> +	.num_properties = ARRAY_SIZE(sel3350_power_properties),
> +	.get_property = sel3350_power_get_property,
> +};
> +
> +struct sel3350_data {
> +	struct platform_device *leds_pdev;
> +	struct power_supply *ps_a;
> +	struct power_supply *ps_b;
> +	struct power_supply_config ps_a_cfg;
> +	struct power_supply_config ps_b_cfg;

struct power_supply_config is only used while
power_supply_register() is running, so you can
just use a single struct power_supply_config on
the stack in sel3350_probe():
 
	struct power_supply_config psy_cfg = {};
 

Set psy_cfg.drv_data before registering,
update drv_data and then register the 2nd psy.


> +	struct sel3350_power_cfg_data ps_a_cfg_data;
> +	struct sel3350_power_cfg_data ps_b_cfg_data;
> +};
> +
> +static int sel3350_probe(struct platform_device *pdev)
> +{
> +	int rs;
> +	struct sel3350_data *sel3350;
> +
> +	sel3350 = devm_kzalloc(&pdev->dev, sizeof(struct sel3350_data), GFP_KERNEL);
> +	if (!sel3350)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, sel3350);
> +
> +	gpiod_add_lookup_table(&sel3350_leds_table);
> +	gpiod_add_lookup_table(&sel3350_gpios_table);
> +
> +	sel3350->leds_pdev = platform_device_register_data(
> +			NULL,
> +			"leds-gpio",
> +			PLATFORM_DEVID_NONE,
> +			&sel3350_leds_pdata,
> +			sizeof(sel3350_leds_pdata));
> +	if (IS_ERR(sel3350->leds_pdev)) {
> +		rs = PTR_ERR(sel3350->leds_pdev);
> +		dev_err(&pdev->dev, "Failed registering platform device: %d\n", rs);
> +		goto err_platform;
> +	}
> +
> +	/* Power Supply A */
> +	sel3350->ps_a_cfg_data.ps_detect = devm_gpiod_get(&pdev->dev,
> +							  SEL_PS_A_DETECT,
> +							  GPIOD_IN);
> +	sel3350->ps_a_cfg_data.ps_good = devm_gpiod_get(&pdev->dev,
> +							SEL_PS_A_GOOD,
> +							GPIOD_IN);
> +	sel3350->ps_a_cfg.drv_data = &sel3350->ps_a_cfg_data;
> +	sel3350->ps_a_cfg.of_node = pdev->dev.of_node;

of_node is going to be NULL for an ACPI instantiated pdev on x86.
so no need for this.

> +	sel3350->ps_a = devm_power_supply_register(&pdev->dev,
> +						   &sel3350_ps_a_desc,
> +						   &sel3350->ps_a_cfg);
> +	if (IS_ERR(sel3350->ps_a)) {
> +		rs = PTR_ERR(sel3350->ps_a);
> +		dev_err(&pdev->dev, "Failed registering power supply A: %d\n", rs);
> +		goto err_ps;
> +	}
> +
> +	/* Power Supply B */
> +	sel3350->ps_b_cfg_data.ps_detect = devm_gpiod_get(&pdev->dev,
> +							  SEL_PS_B_DETECT,
> +							  GPIOD_IN);
> +	sel3350->ps_b_cfg_data.ps_good = devm_gpiod_get(&pdev->dev,
> +							SEL_PS_B_GOOD,
> +							GPIOD_IN);
> +	sel3350->ps_b_cfg.drv_data = &sel3350->ps_b_cfg_data;
> +	sel3350->ps_b_cfg.of_node = pdev->dev.of_node;

Same.

> +	sel3350->ps_b = devm_power_supply_register(&pdev->dev,
> +						   &sel3350_ps_b_desc,
> +						   &sel3350->ps_b_cfg);
> +	if (IS_ERR(sel3350->ps_b)) {
> +		rs = PTR_ERR(sel3350->ps_b);
> +		dev_err(&pdev->dev, "Failed registering power supply B: %d\n", rs);
> +		goto err_ps;
> +	}
> +
> +	return 0;
> +
> +err_ps:
> +	platform_device_unregister(sel3350->leds_pdev);
> +err_platform:
> +	gpiod_remove_lookup_table(&sel3350_gpios_table);
> +	gpiod_remove_lookup_table(&sel3350_leds_table);
> +
> +	return rs;
> +}
> +
> +static int sel3350_remove(struct platform_device *pdev)
> +{
> +	struct sel3350_data *sel3350 = platform_get_drvdata(pdev);
> +
> +	platform_device_unregister(sel3350->leds_pdev);
> +	gpiod_remove_lookup_table(&sel3350_gpios_table);
> +	gpiod_remove_lookup_table(&sel3350_leds_table);
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id sel3350_device_ids[] = {
> +	{ B2093_GPIO_ACPI_ID, 0 },
> +	{ "", 0 },
> +};
> +MODULE_DEVICE_TABLE(acpi, sel3350_device_ids);
> +
> +static struct platform_driver sel3350_platform_driver = {
> +	.probe = sel3350_probe,
> +	.remove = sel3350_remove,
> +	.driver = {
> +		.name = "sel3350-platform",
> +		.acpi_match_table = sel3350_device_ids,
> +	},
> +};
> +module_platform_driver(sel3350_platform_driver);
> +
> +MODULE_AUTHOR("Schweitzer Engineering Laboratories");
> +MODULE_DESCRIPTION("SEL-3350 platform driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_SOFTDEP("pre: pinctrl_broxton leds-gpio");

Other then those few small remarks this looks good to me.

Regards,

Hans




