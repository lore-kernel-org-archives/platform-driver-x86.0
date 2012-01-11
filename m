From: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH 1/1] net5501: platform driver for Soekris Engineering
 net5501 single-board computer
Date: Wed, 11 Jan 2012 02:50:24 -0800
Message-ID: <20120111025024.2ab7c080@debxo>
References: <1325896532-31146-1-git-send-email-philipp@redfish-solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lunge.queued.net ([173.255.254.236]:44007 "EHLO
	lunge.queued.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756874Ab2AKLUT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Jan 2012 06:20:19 -0500
In-Reply-To: <1325896532-31146-1-git-send-email-philipp@redfish-solutions.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philip Prindeville <philipp@redfish-solutions.com>
Cc: platform-driver-x86@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Richard Purdie <rpurdie@rpsys.net>, Ed Wildgoose <kernel@wildgooses.com>, David Woodhouse <dwmw2@infradead.org>, Andrew Morton <akpm@linux-foundation.org>

On Fri,  6 Jan 2012 17:35:32 -0700
Philip Prindeville <philipp@redfish-solutions.com> wrote:

> From: "Philip A. Prindeville" <philipp@redfish-solutions.com>
> 
> Trivial platform driver for Soekris Engineering net5501 single-board
> computer. Probes well-known locations in ROM for BIOS signature to
> confirm correct platform. Registers 1 LED and 1 GPIO-based button
> (typically used for soft reset).
> 
> Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Acked-by: Alessandro Zummo <a.zummo@towertech.it>

Looks fine to me.

Acked-by: Andres Salomon <dilinger@queued.net>

> ---
>  arch/x86/Kconfig                  |    6 ++
>  arch/x86/platform/geode/Makefile  |    1 +
>  arch/x86/platform/geode/net5501.c |  147
> +++++++++++++++++++++++++++++++++++++
> drivers/leds/leds-net5501.c       |   97 ------------------------ 4
> files changed, 154 insertions(+), 97 deletions(-) create mode 100644
> arch/x86/platform/geode/net5501.c delete mode 100644
> drivers/leds/leds-net5501.c
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 90cab6f..b4d1dcf 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2164,6 +2164,12 @@ config ALIX
>  
>  	  Note: You have to set alix.force=1 for boards with Award
> BIOS. 
> +config NET5501
> +	bool "Soekris Engineering net5501 System Support (LEDS,
> GPIO, etc)"
> +	select GPIOLIB
> +	---help---
> +	  This option enables system support for the Soekris
> Engineering net5501. +
>  endif # X86_32
>  
>  config AMD_NB
> diff --git a/arch/x86/platform/geode/Makefile
> b/arch/x86/platform/geode/Makefile index 07c9cd0..246b788 100644
> --- a/arch/x86/platform/geode/Makefile
> +++ b/arch/x86/platform/geode/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_ALIX)		+= alix.o
> +obj-$(CONFIG_NET5501)		+= net5501.o
> diff --git a/arch/x86/platform/geode/net5501.c
> b/arch/x86/platform/geode/net5501.c new file mode 100644
> index 0000000..40b4bd0
> --- /dev/null
> +++ b/arch/x86/platform/geode/net5501.c
> @@ -0,0 +1,147 @@
> +/*
> + * System Specific setup for Soekris net5501
> + * At the moment this means setup of GPIO control of LEDs and buttons
> + * on net5501 boards.
> + *
> + *
> + * Copyright (C) 2008-2009 Tower Technologies
> + * Written by Alessandro Zummo <a.zummo@towertech.it>
> + *
> + * Copyright (C) 2008 Constantin Baranov <const@mimas.ru>
> + * Copyright (C) 2011 Ed Wildgoose <kernel@wildgooses.com>
> + *                and Philip Prindeville
> <philipp@redfish-solutions.com>
> + *
> + * This program is free software; you can redistribute it and/or
> modify
> + * it under the terms of the GNU General Public License version 2
> + * as published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/string.h>
> +#include <linux/leds.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio.h>
> +#include <linux/input.h>
> +#include <linux/gpio_keys.h>
> +
> +#include <asm/geode.h>
> +
> +#define BIOS_REGION_BASE		0xffff0000
> +#define BIOS_REGION_SIZE		0x00010000
> +
> +static struct gpio_keys_button net5501_gpio_buttons[] = {
> +	{
> +		.code = KEY_RESTART,
> +		.gpio = 24,
> +		.active_low = 1,
> +		.desc = "Reset button",
> +		.type = EV_KEY,
> +		.wakeup = 0,
> +		.debounce_interval = 100,
> +		.can_disable = 0,
> +	}
> +};
> +static struct gpio_keys_platform_data net5501_buttons_data = {
> +	.buttons = net5501_gpio_buttons,
> +	.nbuttons = ARRAY_SIZE(net5501_gpio_buttons),
> +	.poll_interval = 20,
> +};
> +
> +static struct platform_device net5501_buttons_dev = {
> +	.name = "gpio-keys-polled",
> +	.id = 1,
> +	.dev = {
> +		.platform_data = &net5501_buttons_data,
> +	}
> +};
> +
> +static struct gpio_led net5501_leds[] = {
> +	{
> +		.name = "net5501:1",
> +		.gpio = 6,
> +		.default_trigger = "default-on",
> +		.active_low = 1,
> +	},
> +};
> +
> +static struct gpio_led_platform_data net5501_leds_data = {
> +	.num_leds = ARRAY_SIZE(net5501_leds),
> +	.leds = net5501_leds,
> +};
> +
> +static struct platform_device net5501_leds_dev = {
> +	.name = "leds-gpio",
> +	.id = -1,
> +	.dev.platform_data = &net5501_leds_data,
> +};
> +
> +static struct __initdata platform_device *net5501_devs[] = {
> +	&net5501_buttons_dev,
> +	&net5501_leds_dev,
> +};
> +
> +static void __init register_net5501(void)
> +{
> +	/* Setup LED control through leds-gpio driver */
> +	platform_add_devices(net5501_devs, ARRAY_SIZE(net5501_devs));
> +}
> +
> +struct net5501_board {
> +	u16	offset;
> +	u16	len;
> +	char	*sig;
> +};
> +
> +static struct net5501_board __initdata boards[] = {
> +	{ 0xb7b, 7, "net5501" },	/* net5501 v1.33/1.33c */
> +	{ 0xb1f, 7, "net5501" },	/* net5501 v1.32i */
> +};
> +
> +static int __init net5501_present(void)
> +{
> +	int i;
> +	unsigned char *rombase, *bios;
> +
> +	rombase = ioremap(BIOS_REGION_BASE, BIOS_REGION_SIZE - 1);
> +	if (!rombase)
> +		printk(KERN_INFO "Soekris net5501 LED driver failed
> to get rombase"); +
> +	bios = rombase + 0x20;	/* null terminated */
> +
> +	if (memcmp(bios, "comBIOS", 7))
> +		goto unmap;
> +
> +	for (i = 0; i < ARRAY_SIZE(boards); i++) {
> +		unsigned char *model = rombase + boards[i].offset;
> +
> +		if (memcmp(model, boards[i].sig, boards[i].len) ==
> 0) {
> +			printk(KERN_INFO "Soekris %s: %s\n", model,
> bios); +
> +			register_net5501();
> +			break;
> +		}
> +	}
> +
> +unmap:
> +	iounmap(rombase);
> +	return 0;
> +}
> +
> +static int __init net5501_init(void)
> +{
> +	if (!is_geode())
> +		return 0;
> +
> +	if (net5501_present())
> +		register_net5501();
> +
> +	return 0;
> +}
> +
> +module_init(net5501_init);
> +
> +MODULE_AUTHOR("Philip Prindeville <philipp@redfish-solutions.com>");
> +MODULE_DESCRIPTION("Soekris net5501 System Setup");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/leds/leds-net5501.c b/drivers/leds/leds-net5501.c
> deleted file mode 100644
> index 0555d47..0000000
> --- a/drivers/leds/leds-net5501.c
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -/*
> - * Soekris board support code
> - *
> - * Copyright (C) 2008-2009 Tower Technologies
> - * Written by Alessandro Zummo <a.zummo@towertech.it>
> - *
> - * This program is free software; you can redistribute it and/or
> modify
> - * it under the terms of the GNU General Public License version 2
> - * as published by the Free Software Foundation.
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/io.h>
> -#include <linux/string.h>
> -#include <linux/leds.h>
> -#include <linux/platform_device.h>
> -#include <linux/gpio.h>
> -#include <linux/module.h>
> -
> -#include <asm/geode.h>
> -
> -static const struct gpio_led net5501_leds[] = {
> -	{
> -		.name = "error",
> -		.gpio = 6,
> -		.default_trigger = "default-on",
> -	},
> -};
> -
> -static struct gpio_led_platform_data net5501_leds_data = {
> -	.num_leds = ARRAY_SIZE(net5501_leds),
> -	.leds = net5501_leds,
> -};
> -
> -static struct platform_device net5501_leds_dev = {
> -	.name = "leds-gpio",
> -	.id = -1,
> -	.dev.platform_data = &net5501_leds_data,
> -};
> -
> -static void __init init_net5501(void)
> -{
> -	platform_device_register(&net5501_leds_dev);
> -}
> -
> -struct soekris_board {
> -	u16	offset;
> -	char	*sig;
> -	u8	len;
> -	void	(*init)(void);
> -};
> -
> -static struct soekris_board __initdata boards[] = {
> -	{ 0xb7b, "net5501", 7, init_net5501 },	/* net5501
> v1.33/1.33c */
> -	{ 0xb1f, "net5501", 7, init_net5501 },	/* net5501
> v1.32i */ -};
> -
> -static int __init soekris_init(void)
> -{
> -	int i;
> -	unsigned char *rombase, *bios;
> -
> -	if (!is_geode())
> -		return 0;
> -
> -	rombase = ioremap(0xffff0000, 0xffff);
> -	if (!rombase) {
> -		printk(KERN_INFO "Soekris net5501 LED driver failed
> to get rombase");
> -		return 0;
> -	}
> -
> -	bios = rombase + 0x20;	/* null terminated */
> -
> -	if (strncmp(bios, "comBIOS", 7))
> -		goto unmap;
> -
> -	for (i = 0; i < ARRAY_SIZE(boards); i++) {
> -		unsigned char *model = rombase + boards[i].offset;
> -
> -		if (strncmp(model, boards[i].sig, boards[i].len) ==
> 0) {
> -			printk(KERN_INFO "Soekris %s: %s\n", model,
> bios); -
> -			if (boards[i].init)
> -				boards[i].init();
> -			break;
> -		}
> -	}
> -
> -unmap:
> -	iounmap(rombase);
> -	return 0;
> -}
> -
> -arch_initcall(soekris_init);
> -
> -MODULE_LICENSE("GPL");
