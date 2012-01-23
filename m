From: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH v2 1/1] alix2: supplement driver to include GPIO button
 support
Date: Mon, 23 Jan 2012 03:09:39 -0800
Message-ID: <20120123030939.2e8582e6@debxo>
References: <1325896470-31094-1-git-send-email-philipp@redfish-solutions.com>
	<1326524710-5024-1-git-send-email-philipp@redfish-solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lunge.queued.net ([173.255.254.236]:60342 "EHLO
	lunge.queued.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752773Ab2AWLQh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Jan 2012 06:16:37 -0500
In-Reply-To: <1326524710-5024-1-git-send-email-philipp@redfish-solutions.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philip Prindeville <philipp@redfish-solutions.com>
Cc: platform-driver-x86@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Richard Purdie <rpurdie@rpsys.net>, Ed Wildgoose <kernel@wildgooses.com>, David Woodhouse <dwmw2@infradead.org>, Andrew Morton <akpm@linux-foundation.org>

On Sat, 14 Jan 2012 00:05:10 -0700
Philip Prindeville <philipp@redfish-solutions.com> wrote:

> From: "Philip A. Prindeville" <philipp@redfish-solutions.com>
> 
> GPIO 24 is used in reference designs as a soft-reset button, and
> the alix2 is no exception. Add it as a gpio-button.
> 
> Use symbolic values to describe BIOS addresses.
> 
> Record the model number.
> 
> Redux: address Andres' review comments; make the model number
> exported; add support for DMI detection of the board and manufacturer.
> 
> Signed-off-by: Philip A. Prindeville <philipp@redfish-solutions.com>
> Acked-by: Ed Wildgoose <kernel@wildgooses.com>
> Acked-by: Andres Salomon <dilinger@queued.net>

I didn't Ack this.  I acked your other patch (the net5501 one).  Please
don't add people's Acked-by unless they've responded to your specific
patch with an "Acked-by: ...". 




> ---
>  arch/x86/platform/geode/alix.c |   80
> +++++++++++++++++++++++++++++++++++++-- 1 files changed, 75
> insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/platform/geode/alix.c
> b/arch/x86/platform/geode/alix.c index dc5f1d3..e01f58b 100644
> --- a/arch/x86/platform/geode/alix.c
> +++ b/arch/x86/platform/geode/alix.c
> @@ -6,6 +6,7 @@
>   *
>   * Copyright (C) 2008 Constantin Baranov <const@mimas.ru>
>   * Copyright (C) 2011 Ed Wildgoose <kernel@wildgooses.com>
> + *                and Philip Prindeville
> <philipp@redfish-solutions.com> *
>   * TODO: There are large similarities with leds-net5501.c
>   * by Alessandro Zummo <a.zummo@towertech.it>
> @@ -24,14 +25,52 @@
>  #include <linux/leds.h>
>  #include <linux/platform_device.h>
>  #include <linux/gpio.h>
> +#include <linux/input.h>
> +#include <linux/gpio_keys.h>
> +#ifdef CONFIG_DMI
> +#include <linux/dmi.h>
> +#endif

The #ifdef is unnecessary, please drop it.


>  
>  #include <asm/geode.h>
>  
> +#define BIOS_SIGNATURE_TINYBIOS		0xf0000
> +#define BIOS_SIGNATURE_COREBOOT		0x500
> +#define BIOS_REGION_SIZE		0x10000
> +
> +int alix_model;
> +EXPORT_SYMBOL(alix_model);
> +
>  static bool force = 0;
>  module_param(force, bool, 0444);
>  /* FIXME: Award bios is not automatically detected as Alix platform
> */ MODULE_PARM_DESC(force, "Force detection as ALIX.2/ALIX.3
> platform"); 
> +static struct gpio_keys_button alix_gpio_buttons[] = {
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
> +static struct gpio_keys_platform_data alix_buttons_data = {
> +	.buttons = alix_gpio_buttons,
> +	.nbuttons = ARRAY_SIZE(alix_gpio_buttons),
> +	.poll_interval = 20,
> +};
> +
> +static struct platform_device alix_buttons_dev = {
> +	.name = "gpio-keys-polled",
> +	.id = 1,
> +	.dev = {
> +		.platform_data = &alix_buttons_data,
> +	}
> +};
> +
>  static struct gpio_led alix_leds[] = {
>  	{
>  		.name = "alix:1",
> @@ -64,17 +103,22 @@ static struct platform_device alix_leds_dev = {
>  	.dev.platform_data = &alix_leds_data,
>  };
>  
> +static struct __initdata platform_device *alix_devs[] = {
> +	&alix_buttons_dev,
> +	&alix_leds_dev,
> +};
> +
>  static void __init register_alix(void)
>  {
>  	/* Setup LED control through leds-gpio driver */
> -	platform_device_register(&alix_leds_dev);
> +	platform_add_devices(alix_devs, ARRAY_SIZE(alix_devs));
>  }
>  
>  static int __init alix_present(unsigned long bios_phys,
>  				const char *alix_sig,
>  				size_t alix_sig_len)
>  {
> -	const size_t bios_len = 0x00010000;
> +	const size_t bios_len = BIOS_REGION_SIZE;
>  	const char *bios_virt;
>  	const char *scan_end;
>  	const char *p;
> @@ -109,7 +153,9 @@ static int __init alix_present(unsigned long
> bios_phys, *a = '\0';
>  
>  		tail = p + alix_sig_len;
> -		if ((tail[0] == '2' || tail[0] == '3')) {
> +		if ((tail[0] == '2' || tail[0] == '3' || tail[0] ==
> '6')) {
> +			alix_model = tail[0] - '0';
> +

You never explained the point of this 'alix_model' (previously just
'model') stuff.  It gets set by the driver, but is never used
anywhere.  Does something actually make use of it?  If not, please
remove unnecessary code.


>  			printk(KERN_INFO
>  			       "%s: system is recognized as
> \"%s\"\n", KBUILD_MODNAME, name);
> @@ -120,6 +166,29 @@ static int __init alix_present(unsigned long
> bios_phys, return 0;
>  }
>  
> +static int __init alix_present_dmi(void)
> +{
> +	char *vendor, *product;
> +
> +#ifdef CONFIG_DMI
> +	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> +	if (vendor && !strcmp(vendor, "PC Engines")) {

This #ifdef should also be unnecessary.  If CONFIG_DMI is unset,
dmi_get_system_info will be defined to return NULL.


> +		product = dmi_get_system_info(DMI_PRODUCT_NAME);
> +		if (product && (!strcmp(product, "ALIX.2D")
> +			     || !strcmp(product, "ALIX.6"))) {
> +			alix_model = product[5] - '0';
> +
> +			printk(KERN_INFO "%s: system is recognized
> as \"%s %s\"\n",
> +			       KBUILD_MODNAME, vendor, product);
> +
> +			return 1;

Perhaps return true here?  And change the type to 'bool' instead of
'int'.

> +		}
> +	}
> +#endif
> +
> +	return 0;
> +}
> +
>  static int __init alix_init(void)
>  {
>  	const char tinybios_sig[] = "PC Engines ALIX.";
> @@ -128,8 +197,9 @@ static int __init alix_init(void)
>  	if (!is_geode())
>  		return 0;
>  
> -	if (alix_present(0xf0000, tinybios_sig, sizeof(tinybios_sig)
> - 1) ||
> -	    alix_present(0x500, coreboot_sig, sizeof(coreboot_sig) -
> 1))
> +	if (alix_present(BIOS_SIGNATURE_TINYBIOS, tinybios_sig,
> sizeof(tinybios_sig) - 1) ||
> +	    alix_present(BIOS_SIGNATURE_COREBOOT, coreboot_sig,
> sizeof(coreboot_sig) - 1) ||
> +	    alix_present_dmi())
>  		register_alix();
>  
>  	return 0;
