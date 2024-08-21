Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4CA1A4B89
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724235359; cv=none; b=NrROMDm33QPPNMhbF0dkerCu/4EDGaIN2kPSEoIk4EXqUajIXJ57vVqS6pwfmzkLulJvb/4LPmzB3lq0I3iquNc3txxn4NhWYr5QUmJVuf4+dIfjWniWAd4hPCNmyTqmyn3EM31U+ys5Ixw1BjRxLrVo5fkhTh/EFJpiIa8U35w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724235359; c=relaxed/simple;
	bh=IlN/n43H93q4BsBIOj84+rGKAlvNp+HNU0WBXpKi+/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBC3tftMpprfBpkjfTVHm9P1NO/gyfhBVF8BytyjyYjr1aDmnMwQzhbo6EDbRq7LCV+p/rndH25HVEYJJEClnyIc7+ZL/gAYQnEmVovIui175xIjWMDQsyGezyjawyA52mZi4ihVxmdw4WaJe6urgcIMwIPkkzeL69q1FQoP3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AelyDrxG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AelyDrxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724235356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lM2gCJ4tKU3J7rraBCJ7GWYbWntSuBDFie44zMlOq8M=;
	b=AelyDrxGVWAoRXd7njV3fz8MaIu4Mi81C3ziX9a1B64fZ7lohMb/G/wXIFJ8HaKDBJFxxb
	VhLoVbkYIeFbgc+VxsdC4jZks19SvUphNz4qU7Jn+U1N6iAMYItXq/7v2OxMKYTSdLooLa
	Y8no0mt3nEcVW8YclF34jKJPGvu+y80=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-Dbsuig9uN3WgMJiAQfsyVg-1; Wed, 21 Aug 2024 06:15:54 -0400
X-MC-Unique: Dbsuig9uN3WgMJiAQfsyVg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8677df5ba1so48384866b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 03:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724235354; x=1724840154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lM2gCJ4tKU3J7rraBCJ7GWYbWntSuBDFie44zMlOq8M=;
        b=dYTkH2sCIwyqCFUiyG9MU0hL9WibxqcXjD+XbTCemleP4mHqy5wLOymdzmwAf0hTkA
         laXK6A6/MUHcASkL3haAwLB+psXGKBZvtwbSbySVtHpZUhBKZvo+D9WJv9p6gyJ/tR5u
         ZLnEoXNtoE5TyltPY/pcw7jtSrWVRQd+YiHeg8vhbdU0eP0sjBBjfBPXZNEnIP729qod
         nPxJ/Pu97ye7xc9lgeCRTWsEWafRWJnwJZa/WjPZ79rqKrpzVOd3ujn2UIka52vBSPpw
         Z+WrV4Kxqw3SiB1GlVdXCBua/zT9LYEOqK9/0S6BYLSuQ/ILf/zAPfyqAH+SAuLtYGup
         YEWw==
X-Forwarded-Encrypted: i=1; AJvYcCVV0kMuJFGXahXcsTeHy8UfPBndkSbmxeNRX432++ZXrXipj2iRiFfRpU9FRXxe0ZPR+GhgTrVGFLJ6Na1fUB+g21Ql@vger.kernel.org
X-Gm-Message-State: AOJu0YycJPeixr/qxSV+Yv5ZFSBNi19oIMQlDljWAKtln7VKUvgLcaUX
	vS85HopjV11W8gfYvfDM04cIwGxkJ3LJQuRktipApRwCxCh0JhBcTOfN1TkWPXNAA9qh2EWoZnL
	BtRWZi76HEDFfY3MKeN1P8cI4kskHpWo3szilq7o8swHqCwFG1MZ0UBaznEOEYd6YrkKyx/E=
X-Received: by 2002:a17:907:1c14:b0:a86:8136:d4b3 with SMTP id a640c23a62f3a-a868136d901mr32087466b.62.1724235353534;
        Wed, 21 Aug 2024 03:15:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT/qQkhpBmfg4ASIyS8Q2s7S8VzqUqF2DH4x3NlDBuUJUXMNM6m6Ar6j8HtLIVYluq0AjlvA==
X-Received: by 2002:a17:907:1c14:b0:a86:8136:d4b3 with SMTP id a640c23a62f3a-a868136d901mr32085666b.62.1724235352977;
        Wed, 21 Aug 2024 03:15:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a866c61bc8esm93717166b.165.2024.08.21.03.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 03:15:52 -0700 (PDT)
Message-ID: <a2366dcc-908e-41e9-875e-529610682dc1@redhat.com>
Date: Wed, 21 Aug 2024 12:15:51 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/platform/geode: switch GPIO buttons and LEDs to
 software properties
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Gross <mgross@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Borislav Petkov <bp@alien8.de>
Cc: linux-geode@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
References: <ZsV6MNS_tUPPSffJ@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZsV6MNS_tUPPSffJ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 8/21/24 7:25 AM, Dmitry Torokhov wrote:
> Convert GPIO-connected buttons and LEDs in Geode boards to software
> nodes/properties, so that support for platform data can be removed from
> gpio-keys driver (which will rely purely on generic device properties
> for configuration).
> 
> To avoid repeating the same data structures over and over and over
> factor them out into a new geode-common.c file.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Question has this been tested on at least 1 affected device ?

Regards,

Hans




> ---
>  arch/x86/Kconfig                       |   6 +
>  arch/x86/platform/geode/Makefile       |   1 +
>  arch/x86/platform/geode/alix.c         |  82 ++---------
>  arch/x86/platform/geode/geode-common.c | 180 +++++++++++++++++++++++++
>  arch/x86/platform/geode/geode-common.h |  21 +++
>  arch/x86/platform/geode/geos.c         |  80 +----------
>  arch/x86/platform/geode/net5501.c      |  69 +---------
>  7 files changed, 230 insertions(+), 209 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 09f8fbcfe000..96b02e813332 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -3073,9 +3073,13 @@ config OLPC_XO15_SCI
>  	   - AC adapter status updates
>  	   - Battery status updates
>  
> +config GEODE_COMMON
> +	bool
> +
>  config ALIX
>  	bool "PCEngines ALIX System Support (LED setup)"
>  	select GPIOLIB
> +	select GEODE_COMMON
>  	help
>  	  This option enables system support for the PCEngines ALIX.
>  	  At present this just sets up LEDs for GPIO control on
> @@ -3090,12 +3094,14 @@ config ALIX
>  config NET5501
>  	bool "Soekris Engineering net5501 System Support (LEDS, GPIO, etc)"
>  	select GPIOLIB
> +	select GEODE_COMMON
>  	help
>  	  This option enables system support for the Soekris Engineering net5501.
>  
>  config GEOS
>  	bool "Traverse Technologies GEOS System Support (LEDS, GPIO, etc)"
>  	select GPIOLIB
> +	select GEODE_COMMON
>  	depends on DMI
>  	help
>  	  This option enables system support for the Traverse Technologies GEOS.
> diff --git a/arch/x86/platform/geode/Makefile b/arch/x86/platform/geode/Makefile
> index a8a6b1dedb01..34b53e97a0ad 100644
> --- a/arch/x86/platform/geode/Makefile
> +++ b/arch/x86/platform/geode/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_GEODE_COMMON)	+= geode-common.o
>  obj-$(CONFIG_ALIX)		+= alix.o
>  obj-$(CONFIG_NET5501)		+= net5501.o
>  obj-$(CONFIG_GEOS)		+= geos.o
> diff --git a/arch/x86/platform/geode/alix.c b/arch/x86/platform/geode/alix.c
> index b39bf3b5e108..be65cd704e21 100644
> --- a/arch/x86/platform/geode/alix.c
> +++ b/arch/x86/platform/geode/alix.c
> @@ -18,15 +18,12 @@
>  #include <linux/io.h>
>  #include <linux/string.h>
>  #include <linux/moduleparam.h>
> -#include <linux/leds.h>
> -#include <linux/platform_device.h>
> -#include <linux/input.h>
> -#include <linux/gpio_keys.h>
> -#include <linux/gpio/machine.h>
>  #include <linux/dmi.h>
>  
>  #include <asm/geode.h>
>  
> +#include "geode-common.h"
> +
>  #define BIOS_SIGNATURE_TINYBIOS		0xf0000
>  #define BIOS_SIGNATURE_COREBOOT		0x500
>  #define BIOS_REGION_SIZE		0x10000
> @@ -41,79 +38,16 @@ module_param(force, bool, 0444);
>  /* FIXME: Award bios is not automatically detected as Alix platform */
>  MODULE_PARM_DESC(force, "Force detection as ALIX.2/ALIX.3 platform");
>  
> -static struct gpio_keys_button alix_gpio_buttons[] = {
> -	{
> -		.code			= KEY_RESTART,
> -		.gpio			= 24,
> -		.active_low		= 1,
> -		.desc			= "Reset button",
> -		.type			= EV_KEY,
> -		.wakeup			= 0,
> -		.debounce_interval	= 100,
> -		.can_disable		= 0,
> -	}
> -};
> -static struct gpio_keys_platform_data alix_buttons_data = {
> -	.buttons			= alix_gpio_buttons,
> -	.nbuttons			= ARRAY_SIZE(alix_gpio_buttons),
> -	.poll_interval			= 20,
> -};
> -
> -static struct platform_device alix_buttons_dev = {
> -	.name				= "gpio-keys-polled",
> -	.id				= 1,
> -	.dev = {
> -		.platform_data		= &alix_buttons_data,
> -	}
> -};
> -
> -static struct gpio_led alix_leds[] = {
> -	{
> -		.name = "alix:1",
> -		.default_trigger = "default-on",
> -	},
> -	{
> -		.name = "alix:2",
> -		.default_trigger = "default-off",
> -	},
> -	{
> -		.name = "alix:3",
> -		.default_trigger = "default-off",
> -	},
> -};
> -
> -static struct gpio_led_platform_data alix_leds_data = {
> -	.num_leds = ARRAY_SIZE(alix_leds),
> -	.leds = alix_leds,
> -};
> -
> -static struct gpiod_lookup_table alix_leds_gpio_table = {
> -	.dev_id = "leds-gpio",
> -	.table = {
> -		/* The Geode GPIOs should be on the CS5535 companion chip */
> -		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP_IDX("cs5535-gpio", 25, NULL, 1, GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP_IDX("cs5535-gpio", 27, NULL, 2, GPIO_ACTIVE_LOW),
> -		{ }
> -	},
> -};
> -
> -static struct platform_device alix_leds_dev = {
> -	.name = "leds-gpio",
> -	.id = -1,
> -	.dev.platform_data = &alix_leds_data,
> -};
> -
> -static struct platform_device *alix_devs[] __initdata = {
> -	&alix_buttons_dev,
> -	&alix_leds_dev,
> +static const struct geode_led alix_leds[] __initconst = {
> +	{ 6, true },
> +	{ 25, false },
> +	{ 27, false },
>  };
>  
>  static void __init register_alix(void)
>  {
> -	/* Setup LED control through leds-gpio driver */
> -	gpiod_add_lookup_table(&alix_leds_gpio_table);
> -	platform_add_devices(alix_devs, ARRAY_SIZE(alix_devs));
> +	geode_create_restart_key(24);
> +	geode_create_leds("alix", alix_leds, ARRAY_SIZE(alix_leds));
>  }
>  
>  static bool __init alix_present(unsigned long bios_phys,
> diff --git a/arch/x86/platform/geode/geode-common.c b/arch/x86/platform/geode/geode-common.c
> new file mode 100644
> index 000000000000..8f365388cfbb
> --- /dev/null
> +++ b/arch/x86/platform/geode/geode-common.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Shared helpers to register GPIO-connected buttons and LEDs
> + * on AMD Geode boards.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/property.h>
> +#include <linux/input.h>
> +#include <linux/leds.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "geode-common.h"
> +
> +const struct software_node geode_gpiochip_node = {
> +	.name = "cs5535-gpio",
> +};
> +
> +static const struct property_entry geode_gpio_keys_props[] = {
> +	PROPERTY_ENTRY_U32("poll-interval", 20),
> +	{ }
> +};
> +
> +static const struct software_node geode_gpio_keys_node = {
> +	.name = "geode-gpio-keys",
> +	.properties = geode_gpio_keys_props,
> +};
> +
> +static struct property_entry geode_restart_key_props[] = {
> +	{ /* Placeholder for GPIO property */ },
> +	PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
> +	PROPERTY_ENTRY_STRING("label", "Reset button"),
> +	PROPERTY_ENTRY_U32("debounce-interval", 100),
> +	{ }
> +};
> +
> +static const struct software_node geode_restart_key_node = {
> +	.parent = &geode_gpio_keys_node,
> +	.properties = geode_restart_key_props,
> +};
> +
> +static const struct software_node *geode_gpio_keys_swnodes[] __initconst = {
> +	&geode_gpiochip_node,
> +	&geode_gpio_keys_node,
> +	&geode_restart_key_node,
> +	NULL
> +};
> +
> +/*
> + * Creates gpio-keys-polled device for the restart key.
> + *
> + * Note that it needs to be called first, before geode_create_leds(),
> + * because it registers gpiochip software node used by both gpio-keys and
> + * leds-gpio devices.
> + */
> +int __init geode_create_restart_key(unsigned int pin)
> +{
> +	struct platform_device_info keys_info = {
> +		.name	= "gpio-keys-polled",
> +		.id	= 1,
> +	};
> +	struct platform_device *pd;
> +	int err;
> +
> +	geode_restart_key_props[0] = PROPERTY_ENTRY_GPIO("gpios",
> +							 &geode_gpiochip_node,
> +							 pin, GPIO_ACTIVE_LOW);
> +
> +	err = software_node_register_node_group(geode_gpio_keys_swnodes);
> +	if (err) {
> +		pr_err("failed to register gpio-keys software nodes: %d\n", err);
> +		return err;
> +	}
> +
> +	keys_info.fwnode = software_node_fwnode(&geode_gpio_keys_node);
> +
> +	pd = platform_device_register_full(&keys_info);
> +	err = PTR_ERR_OR_ZERO(pd);
> +	if (err) {
> +		pr_err("failed to create gpio-keys device: %d\n", err);
> +		software_node_unregister_node_group(geode_gpio_keys_swnodes);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct software_node geode_gpio_leds_node = {
> +	.name = "geode-leds",
> +};
> +
> +#define MAX_LEDS	3
> +
> +int __init geode_create_leds(const char *label, const struct geode_led *leds,
> +			      unsigned int n_leds)
> +{
> +	const struct software_node *group[MAX_LEDS + 2] = { 0 };
> +	struct software_node *swnodes;
> +	struct property_entry *props;
> +	struct platform_device_info led_info = {
> +		.name	= "leds-gpio",
> +		.id	= PLATFORM_DEVID_NONE,
> +	};
> +	struct platform_device *led_dev;
> +	const char *node_name;
> +	int err;
> +	int i;
> +
> +	if (n_leds > MAX_LEDS) {
> +		pr_err("%s: too many LEDs\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	swnodes = kcalloc(n_leds, sizeof(*swnodes), GFP_KERNEL);
> +	if (!swnodes)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Each LED is represented by 3 properties: "gpios",
> +	 * "linux,default-trigger", and am empty terminator.
> +	 */
> +	props = kcalloc(n_leds * 3, sizeof(*props), GFP_KERNEL);
> +	if (!props) {
> +		err = -ENOMEM;
> +		goto err_free_swnodes;
> +	}
> +
> +	group[0] = &geode_gpio_leds_node;
> +	for (i = 0; i < n_leds; i++) {
> +		node_name = kasprintf(GFP_KERNEL, "%s:%d", label, i);
> +		if (!node_name) {
> +			err = -ENOMEM;
> +			goto err_free_names;
> +		}
> +
> +		props[i * 3 + 0] =
> +			PROPERTY_ENTRY_GPIO("gpios", &geode_gpiochip_node,
> +					    leds[i].pin, GPIO_ACTIVE_LOW);
> +		props[i * 3 + 1] =
> +			PROPERTY_ENTRY_STRING("linux,default-trigger",
> +					      leds[i].default_on ?
> +					      "default-on" : "default-off");
> +		/* props[i * 3 + 2] is an empty terminator */
> +
> +		swnodes[i] = SOFTWARE_NODE(node_name, &props[i * 3],
> +					   &geode_gpio_leds_node);
> +		group[i + 1] = &swnodes[i];
> +	}
> +
> +	err = software_node_register_node_group(group);
> +	if (err) {
> +		pr_err("failed to register LED software nodes: %d\n", err);
> +		goto err_free_names;
> +	}
> +
> +	led_info.fwnode = software_node_fwnode(&geode_gpio_leds_node);
> +
> +	led_dev = platform_device_register_full(&led_info);
> +	err = PTR_ERR_OR_ZERO(led_dev);
> +	if (err) {
> +		pr_err("failed to create LED device: %d\n", err);
> +		goto err_unregister_group;
> +	}
> +
> +	return 0;
> +
> +err_unregister_group:
> +	software_node_unregister_node_group(group);
> +err_free_names:
> +	while (--i >= 0)
> +		kfree(swnodes[i].name);
> +	kfree(props);
> +err_free_swnodes:
> +	kfree(swnodes);
> +	return err;
> +}
> +
> +
> diff --git a/arch/x86/platform/geode/geode-common.h b/arch/x86/platform/geode/geode-common.h
> new file mode 100644
> index 000000000000..9e0afd34bfad
> --- /dev/null
> +++ b/arch/x86/platform/geode/geode-common.h
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Shared helpers to register GPIO-connected buttons and LEDs
> + * on AMD Geode boards.
> + */
> +
> +#ifndef __PLATFORM_GEODE_COMMON_H
> +#define __PLATFORM_GEODE_COMMON_H
> +
> +#include <linux/property.h>
> +
> +struct geode_led {
> +	unsigned int pin;
> +	bool default_on;
> +};
> +
> +int geode_create_restart_key(unsigned int pin);
> +int geode_create_leds(const char *label, const struct geode_led *leds,
> +		      unsigned int n_leds);
> +
> +#endif /* __PLATFORM_GEODE_COMMON_H */
> diff --git a/arch/x86/platform/geode/geos.c b/arch/x86/platform/geode/geos.c
> index d263528c90bb..98027fb1ec32 100644
> --- a/arch/x86/platform/geode/geos.c
> +++ b/arch/x86/platform/geode/geos.c
> @@ -16,88 +16,22 @@
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/string.h>
> -#include <linux/leds.h>
> -#include <linux/platform_device.h>
> -#include <linux/input.h>
> -#include <linux/gpio_keys.h>
> -#include <linux/gpio/machine.h>
>  #include <linux/dmi.h>
>  
>  #include <asm/geode.h>
>  
> -static struct gpio_keys_button geos_gpio_buttons[] = {
> -	{
> -		.code = KEY_RESTART,
> -		.gpio = 3,
> -		.active_low = 1,
> -		.desc = "Reset button",
> -		.type = EV_KEY,
> -		.wakeup = 0,
> -		.debounce_interval = 100,
> -		.can_disable = 0,
> -	}
> -};
> -static struct gpio_keys_platform_data geos_buttons_data = {
> -	.buttons = geos_gpio_buttons,
> -	.nbuttons = ARRAY_SIZE(geos_gpio_buttons),
> -	.poll_interval = 20,
> -};
> -
> -static struct platform_device geos_buttons_dev = {
> -	.name = "gpio-keys-polled",
> -	.id = 1,
> -	.dev = {
> -		.platform_data = &geos_buttons_data,
> -	}
> -};
> -
> -static struct gpio_led geos_leds[] = {
> -	{
> -		.name = "geos:1",
> -		.default_trigger = "default-on",
> -	},
> -	{
> -		.name = "geos:2",
> -		.default_trigger = "default-off",
> -	},
> -	{
> -		.name = "geos:3",
> -		.default_trigger = "default-off",
> -	},
> -};
> -
> -static struct gpio_led_platform_data geos_leds_data = {
> -	.num_leds = ARRAY_SIZE(geos_leds),
> -	.leds = geos_leds,
> -};
> -
> -static struct gpiod_lookup_table geos_leds_gpio_table = {
> -	.dev_id = "leds-gpio",
> -	.table = {
> -		/* The Geode GPIOs should be on the CS5535 companion chip */
> -		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP_IDX("cs5535-gpio", 25, NULL, 1, GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP_IDX("cs5535-gpio", 27, NULL, 2, GPIO_ACTIVE_LOW),
> -		{ }
> -	},
> -};
> -
> -static struct platform_device geos_leds_dev = {
> -	.name = "leds-gpio",
> -	.id = -1,
> -	.dev.platform_data = &geos_leds_data,
> -};
> +#include "geode-common.h"
>  
> -static struct platform_device *geos_devs[] __initdata = {
> -	&geos_buttons_dev,
> -	&geos_leds_dev,
> +static const struct geode_led geos_leds[] __initconst = {
> +	{ 6, true },
> +	{ 25, false },
> +	{ 27, false },
>  };
>  
>  static void __init register_geos(void)
>  {
> -	/* Setup LED control through leds-gpio driver */
> -	gpiod_add_lookup_table(&geos_leds_gpio_table);
> -	platform_add_devices(geos_devs, ARRAY_SIZE(geos_devs));
> +	geode_create_restart_key(3);
> +	geode_create_leds("geos", geos_leds, ARRAY_SIZE(geos_leds));
>  }
>  
>  static int __init geos_init(void)
> diff --git a/arch/x86/platform/geode/net5501.c b/arch/x86/platform/geode/net5501.c
> index 558384acd777..c9cee7dea99b 100644
> --- a/arch/x86/platform/geode/net5501.c
> +++ b/arch/x86/platform/geode/net5501.c
> @@ -16,80 +16,25 @@
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/string.h>
> -#include <linux/leds.h>
> -#include <linux/platform_device.h>
>  #include <linux/input.h>
> -#include <linux/gpio_keys.h>
>  #include <linux/gpio/machine.h>
> +#include <linux/gpio/property.h>
>  
>  #include <asm/geode.h>
>  
> +#include "geode-common.h"
> +
>  #define BIOS_REGION_BASE		0xffff0000
>  #define BIOS_REGION_SIZE		0x00010000
>  
> -static struct gpio_keys_button net5501_gpio_buttons[] = {
> -	{
> -		.code = KEY_RESTART,
> -		.gpio = 24,
> -		.active_low = 1,
> -		.desc = "Reset button",
> -		.type = EV_KEY,
> -		.wakeup = 0,
> -		.debounce_interval = 100,
> -		.can_disable = 0,
> -	}
> -};
> -static struct gpio_keys_platform_data net5501_buttons_data = {
> -	.buttons = net5501_gpio_buttons,
> -	.nbuttons = ARRAY_SIZE(net5501_gpio_buttons),
> -	.poll_interval = 20,
> -};
> -
> -static struct platform_device net5501_buttons_dev = {
> -	.name = "gpio-keys-polled",
> -	.id = 1,
> -	.dev = {
> -		.platform_data = &net5501_buttons_data,
> -	}
> -};
> -
> -static struct gpio_led net5501_leds[] = {
> -	{
> -		.name = "net5501:1",
> -		.default_trigger = "default-on",
> -	},
> -};
> -
> -static struct gpio_led_platform_data net5501_leds_data = {
> -	.num_leds = ARRAY_SIZE(net5501_leds),
> -	.leds = net5501_leds,
> -};
> -
> -static struct gpiod_lookup_table net5501_leds_gpio_table = {
> -	.dev_id = "leds-gpio",
> -	.table = {
> -		/* The Geode GPIOs should be on the CS5535 companion chip */
> -		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_HIGH),
> -		{ }
> -	},
> -};
> -
> -static struct platform_device net5501_leds_dev = {
> -	.name = "leds-gpio",
> -	.id = -1,
> -	.dev.platform_data = &net5501_leds_data,
> -};
> -
> -static struct platform_device *net5501_devs[] __initdata = {
> -	&net5501_buttons_dev,
> -	&net5501_leds_dev,
> +static const struct geode_led net5501_leds[] __initconst = {
> +	{ 6, true },
>  };
>  
>  static void __init register_net5501(void)
>  {
> -	/* Setup LED control through leds-gpio driver */
> -	gpiod_add_lookup_table(&net5501_leds_gpio_table);
> -	platform_add_devices(net5501_devs, ARRAY_SIZE(net5501_devs));
> +	geode_create_restart_key(24);
> +	geode_create_leds("net5501", net5501_leds, ARRAY_SIZE(net5501_leds));
>  }
>  
>  struct net5501_board {

