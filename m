Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C094EB64DA
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 13:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235213AbjGNNdE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235250AbjGNNdD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 09:33:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F409AAA
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689341535;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A2WmQSqfcJd4nvTEoIvBI10uyYtf5+TFdqRkXu1hZWI=;
        b=V3kW74KdhFnKMkMXFsp6DPKsWcMeit4ODg9sq67nfb6EprBuFUDwiLIFXt4tf8b6SKU70a
        aNZQIw0CWfHK0yxJbqJv98IRVZAT+22rbG9wCFD+aLS1lzgpNNBh4nWizHJTaXJ3zEWMfE
        GJeZ49lXiEEWsh4ylRmpcsv4k+/28pQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-2tzaxAMfPayjhgT3TllTfA-1; Fri, 14 Jul 2023 09:32:14 -0400
X-MC-Unique: 2tzaxAMfPayjhgT3TllTfA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a34e35f57so115348466b.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 06:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689341531; x=1691933531;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2WmQSqfcJd4nvTEoIvBI10uyYtf5+TFdqRkXu1hZWI=;
        b=jeyXFjmBX750YE2IxFohkNjIwa+PJjUrCLZG85TSOBpAZPqdaiYLNjSOaUe5QJCPaP
         8XJAic2YtLOLihz355h1vhRQNFF4VoDOFT262y8+D5v14fx8gGjkJOKQZpRHS7pjEGfK
         lzxh+a8NyhLDoi+x9nJzXHgxvWJ94KRHKfgXRLRwtogkk+J0BmocC2fkE28Ohmv++3AO
         3k70/jMXG6Z1D70E9iBRU2wqYju5aZ4Cka2VPv27jmaQgD+PZ1muIKZ6MFNgRJyuuV9j
         cwKXQGnY6puwW7JDhO9SFJhVbjFnZCo7uoa4EA2agPes3A4u/dnScNPwQk+BWI3Rjbx/
         Ma6A==
X-Gm-Message-State: ABy/qLZpFAnEHDUSN96YFpyZ1hwESncPSSOCdyEXNt4ZWecuFBvEaSVh
        fJ400Q7b59vGRio+H2qGW9gpxOMZq76ojuZb72J7W/JLlGzFenE/LxtPAcelpkhXwYj6O+dArl5
        nyeMqoLkuYrAVf+iSQsSVE/uRDPoijhlpVmkPOiUAYg==
X-Received: by 2002:a17:907:2347:b0:978:8937:19ba with SMTP id we7-20020a170907234700b00978893719bamr4206692ejb.44.1689341531326;
        Fri, 14 Jul 2023 06:32:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHMSa0TxxCB3Rn3Qsaz9HROOjOz69ONPpXOx9Nohm26YAg0t5kAps0Sx4nojAXnue5wLDiBaA==
X-Received: by 2002:a17:907:2347:b0:978:8937:19ba with SMTP id we7-20020a170907234700b00978893719bamr4206681ejb.44.1689341531006;
        Fri, 14 Jul 2023 06:32:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lc16-20020a170906f91000b0096f6a131b9fsm5416937ejb.23.2023.07.14.06.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 06:32:10 -0700 (PDT)
Message-ID: <5c77392e-28fe-b883-2a58-7cce9f63b3c6@redhat.com>
Date:   Fri, 14 Jul 2023 15:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] platform/x86: Add SEL-3350 platform driver
Content-Language: en-US, nl
To:     Robert Joslyn <robert.joslyn@redrectangle.org>,
        platform-driver-x86@vger.kernel.org
References: <20230713035714.807819-1-robert.joslyn@redrectangle.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230713035714.807819-1-robert.joslyn@redrectangle.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/13/23 05:48, Robert Joslyn wrote:
> Add a driver for Schweitzer Engineering Laboratories SEL-3350 computers
> front LEDs and power supplies. LED and power supply status is provided
> by the Intel SoC GPIO.
> 
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
> 
> Changes in v2:
>  - Adjust Kconfig to depend on GPIOLIB rather than select. This required
>    moving PINCTRL_BROXTON to depend on as well to avoid dependency
>    errors.
>  - Move power_supply_config structs to the stack in probe and use one
>    struct for both power supplies
>  - Remove assignement of of_node since it is already NULL

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
>  drivers/platform/x86/Kconfig            |  15 ++
>  drivers/platform/x86/Makefile           |   3 +
>  drivers/platform/x86/sel3350-platform.c | 251 ++++++++++++++++++++++++
>  3 files changed, 269 insertions(+)
>  create mode 100644 drivers/platform/x86/sel3350-platform.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 49c2c4cd8d00..acdc7925e3c2 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1094,6 +1094,21 @@ config WINMATE_FM07_KEYS
>  	  buttons below the display. This module adds an input device
>  	  that delivers key events when these buttons are pressed.
>  
> +config SEL3350_PLATFORM
> +	tristate "SEL-3350 LEDs and power supplies"
> +	depends on ACPI
> +	depends on GPIOLIB
> +	depends on PINCTRL_BROXTON
> +	select POWER_SUPPLY
> +	select NEW_LEDS
> +	select LEDS_CLASS
> +	select LEDS_GPIO
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
> index 000000000000..fa267d0d3778
> --- /dev/null
> +++ b/drivers/platform/x86/sel3350-platform.c
> @@ -0,0 +1,251 @@
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
> +	struct sel3350_power_cfg_data ps_a_cfg_data;
> +	struct sel3350_power_cfg_data ps_b_cfg_data;
> +};
> +
> +static int sel3350_probe(struct platform_device *pdev)
> +{
> +	int rs;
> +	struct sel3350_data *sel3350;
> +	struct power_supply_config ps_cfg = {};
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
> +	ps_cfg.drv_data = &sel3350->ps_a_cfg_data;
> +	sel3350->ps_a = devm_power_supply_register(&pdev->dev,
> +						   &sel3350_ps_a_desc,
> +						   &ps_cfg);
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
> +	ps_cfg.drv_data = &sel3350->ps_b_cfg_data;
> +	sel3350->ps_b = devm_power_supply_register(&pdev->dev,
> +						   &sel3350_ps_b_desc,
> +						   &ps_cfg);
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

