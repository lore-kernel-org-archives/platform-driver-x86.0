Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122E923536B
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Apr 2026 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738416; cv=none; b=XaJNmAhitERcWKOF1RqHpYJ62bzoRu9E1YQ0WJh4hdYWqVAxhpVJWa8hWg11w5Ehs/WcsFbiPG6hGmy9zuCn6PD+2J1nhtLBV0uFZ5/Qui4OTKK+beCxqaEaFss7xuDGewaa2CHut3l3SHHOibiFNeMLxJasL3BtzhVhLAgTLUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738416; c=relaxed/simple;
	bh=ekGlGRjE7WMMp2B4COmwutbyT6LCeQVM5j8J0Ykn3nE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=COemktGbUQ38GT2Fupd6XjqYE/mB9qVnrFD2UW0wmbUFa5dNNrqROAkFleY6C3T6OVIz3TRKhCgqaqmeE57l227uV2kTCCLzh1heAoIhDoCaDa6r9X4tEFNdhqTUvVnFr+Bljh3H6RXaBHAO9aJ8o5PBMHd74OnHxVYTcXe7tts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAu46JT0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAu46JT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775738416; x=1807274416;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ekGlGRjE7WMMp2B4COmwutbyT6LCeQVM5j8J0Ykn3nE=;
  b=BAu46JT0Udzx0iMXL0xOo6oQx93sUslMcwhwB6huy/Y3qURKwQg6mHn2
   JZJJHMIHPjk9PeXYUK/U1xBmO4d/CJHbQozDVgfdGGy4f+BVgl1E2UM32
   9vBbd1m0pJx8ISOAU8YvUlBTVIhTX7mtB4/12lde6TaP3fvCUHGZUETrY
   kUTYmimnhe4CPbdA2yGDIac5+2pcpx65TCOL10j1nV/5/iDS8sIWvt5xf
   zGMu/BCf0MlX5xDiFokfh/9l2tC3u9Uo23SjmOqEITAaTVl8OMSNlfzND
   TST1Asgngf4JLHhq1PNENbbdUmuBCwGqlvcgWxD4OXXF0XIQMo7tEWhyR
   g==;
X-CSE-ConnectionGUID: gxXhqEy4SpiawxzgVe2TvQ==
X-CSE-MsgGUID: hH69OTflQESqUMAzTqFTyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87030076"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="87030076"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 05:40:15 -0700
X-CSE-ConnectionGUID: vDPazUt1QgaHlc2KqW5F8g==
X-CSE-MsgGUID: r0G4W7DKRY2qyxVNC03O4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="229011978"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 05:40:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Apr 2026 15:40:08 +0300 (EEST)
To: Brodie Abrew <brodie_abrew@selinc.com>
cc: platform-driver-x86@vger.kernel.org, robert.joslyn@redrectangle.org
Subject: Re: [PATCH] platform/x86: sel3350-platform: Retain LED state on load
 and unload
In-Reply-To: <20260408211859.37226-1-brodie_abrew@selinc.com>
Message-ID: <7bd355c0-b363-94c8-bb4d-fe4acd29798c@linux.intel.com>
References: <20260408211859.37226-1-brodie_abrew@selinc.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Apr 2026, Brodie Abrew wrote:

> When the platform driver is loaded or unloaded, it overwrites the
> existing LED states. This can cause a loss of early boot state when the
> driver loads, andi t can cause the ALARM contact to change state or

andi t -> and it

> flicker.
> 
> Explicitly retain the existing LED state to prevent overwriting on
> driver load and unload.
> 
> Signed-off-by: Brodie Abrew <brodie_abrew@selinc.com>
> ---
>  drivers/platform/x86/sel3350-platform.c | 128 ++++++++++++++++++------
>  1 file changed, 95 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/sel3350-platform.c b/drivers/platform/x86/sel3350-platform.c
> index 02e2081e2333..08f40268891f 100644
> --- a/drivers/platform/x86/sel3350-platform.c
> +++ b/drivers/platform/x86/sel3350-platform.c
> @@ -30,19 +30,72 @@
>  #define SEL_PS_B_DETECT "sel_ps_b_detect"
>  #define SEL_PS_B_GOOD   "sel_ps_b_good"
>  
> +#define AUX_LED_GRN1        "sel_aux_led_grn1"
> +#define AUX_LED_GRN2        "sel_aux_led_grn2"
> +#define AUX_LED_GRN3        "sel_aux_led_grn3"
> +#define AUX_LED_GRN4        "sel_aux_led_grn4"
> +#define ALARM_STATE_USER    "sel_alarm_state_user"
> +#define ENABLE_STATE_USER   "sel_enable_state_user"
> +#define AUX_LED_RED1        "sel_aux_led_red1"
> +#define AUX_LED_RED2        "sel_aux_led_red2"
> +#define AUX_LED_RED3        "sel_aux_led_red3"
> +#define AUX_LED_RED4        "sel_aux_led_red4"
> +
> +static const char *const sel3350_leds_gpio_names[] = {
> +	AUX_LED_GRN1,
> +	AUX_LED_GRN2,
> +	AUX_LED_GRN3,
> +	AUX_LED_GRN4,
> +	ALARM_STATE_USER,
> +	ENABLE_STATE_USER,
> +	AUX_LED_RED1,
> +	AUX_LED_RED2,
> +	AUX_LED_RED3,
> +	AUX_LED_RED4,
> +};
> +
>  /* LEDs */
> -static const struct gpio_led sel3350_leds[] = {
> -	{ .name = "sel:green:aux1" },
> -	{ .name = "sel:green:aux2" },
> -	{ .name = "sel:green:aux3" },
> -	{ .name = "sel:green:aux4" },
> -	{ .name = "sel:red:alarm" },
> +static struct gpio_led sel3350_leds[] = {
> +	{ .name = "sel:green:aux1",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1 },
> +	{ .name = "sel:green:aux2",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1 },
> +	{ .name = "sel:green:aux3",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1 },
> +	{ .name = "sel:green:aux4",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1 },
> +	{ .name = "sel:red:alarm",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1 },
>  	{ .name = "sel:green:enabled",
> -	  .default_state = LEDS_GPIO_DEFSTATE_ON },
> -	{ .name = "sel:red:aux1" },
> -	{ .name = "sel:red:aux2" },
> -	{ .name = "sel:red:aux3" },
> -	{ .name = "sel:red:aux4" },
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1 },
> +	{ .name = "sel:red:aux1",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1 },
> +	{ .name = "sel:red:aux2",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1 },
> +	{ .name = "sel:red:aux3",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1 },
> +	{ .name = "sel:red:aux4",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1 },

The closing braces should be on own line, and the non-terminating members 
should have comma in the end.

>  };
>  
>  static const struct gpio_led_platform_data sel3350_leds_pdata = {
> @@ -50,25 +103,6 @@ static const struct gpio_led_platform_data sel3350_leds_pdata = {
>  	.leds = sel3350_leds,
>  };
>  
> -/* Map GPIOs to LEDs */
> -static struct gpiod_lookup_table sel3350_leds_table = {
> -	.dev_id = "leds-gpio",
> -	.table = {
> -		GPIO_LOOKUP_IDX(BXT_NW, 49, NULL, 0, GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP_IDX(BXT_NW, 50, NULL, 1, GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP_IDX(BXT_NW, 51, NULL, 2, GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP_IDX(BXT_NW, 52, NULL, 3, GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP_IDX(BXT_W,  20, NULL, 4, GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP_IDX(BXT_W,  21, NULL, 5, GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP_IDX(BXT_SW, 37, NULL, 6, GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP_IDX(BXT_SW, 38, NULL, 7, GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP_IDX(BXT_SW, 39, NULL, 8, GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP_IDX(BXT_SW, 40, NULL, 9, GPIO_ACTIVE_HIGH),
> -		{},
> -	}
> -};
> -
> -/* Map GPIOs to power supplies */
>  static struct gpiod_lookup_table sel3350_gpios_table = {
>  	.dev_id = B2093_GPIO_ACPI_ID ":00",
>  	.table = {
> @@ -76,6 +110,16 @@ static struct gpiod_lookup_table sel3350_gpios_table = {
>  		GPIO_LOOKUP(BXT_NW, 45, SEL_PS_A_GOOD,   GPIO_ACTIVE_LOW),
>  		GPIO_LOOKUP(BXT_NW, 46, SEL_PS_B_DETECT, GPIO_ACTIVE_LOW),
>  		GPIO_LOOKUP(BXT_NW, 47, SEL_PS_B_GOOD,   GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP(BXT_NW, 49, AUX_LED_GRN1, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(BXT_NW, 50, AUX_LED_GRN2, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(BXT_NW, 51, AUX_LED_GRN3, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(BXT_NW, 52, AUX_LED_GRN4, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(BXT_W,  20, ALARM_STATE_USER, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(BXT_W,  21, ENABLE_STATE_USER, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(BXT_SW, 37, AUX_LED_RED1, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(BXT_SW, 38, AUX_LED_RED2, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(BXT_SW, 39, AUX_LED_RED3, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(BXT_SW, 40, AUX_LED_RED4, GPIO_ACTIVE_HIGH),
>  		{},
>  	}
>  };
> @@ -149,6 +193,7 @@ struct sel3350_data {
>  static int sel3350_probe(struct platform_device *pdev)
>  {
>  	int rs;
> +	int i;
>  	struct sel3350_data *sel3350;
>  	struct power_supply_config ps_cfg = {};
>  
> @@ -158,9 +203,19 @@ static int sel3350_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, sel3350);
>  
> -	gpiod_add_lookup_table(&sel3350_leds_table);
>  	gpiod_add_lookup_table(&sel3350_gpios_table);
>  
> +	for (i = 0; i < ARRAY_SIZE(sel3350_leds); ++i) {

Add include for ARRAY_SIZE()

> +		sel3350_leds[i].gpiod = devm_gpiod_get(
> +				&pdev->dev, sel3350_leds_gpio_names[i], GPIOD_ASIS);

Align parameters to (, at least the first one easily fits to the first 
line.

> +		if (IS_ERR(sel3350_leds[i].gpiod) ||

Add include.

> +				(sel3350_leds[i].gpiod == NULL)) {

This is misaligned.

> +			rs = -EPROBE_DEFER;
> +			goto err_gpio_loop;
> +		}
> +		gpiod_set_consumer_name(sel3350_leds[i].gpiod, sel3350_leds[i].name);
> +	}
> +
>  	sel3350->leds_pdev = platform_device_register_data(
>  			NULL,
>  			"leds-gpio",
> @@ -209,11 +264,18 @@ static int sel3350_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +err_gpio_loop:
> +	while (i > 0) {
> +		/* Don't clean up the failed get but do clean up all others */
> +		i--;

There's more concise form for this which is used elsewhere for similar 
loop rollbacks:

	while (i--)

You can leave the comment out.

> +		devm_gpiod_put(&pdev->dev, sel3350_leds[i].gpiod);
> +	}
> +	goto err_platform;
> +
>  err_ps:
>  	platform_device_unregister(sel3350->leds_pdev);
>  err_platform:
>  	gpiod_remove_lookup_table(&sel3350_gpios_table);
> -	gpiod_remove_lookup_table(&sel3350_leds_table);
>  
>  	return rs;
>  }
> @@ -224,7 +286,6 @@ static void sel3350_remove(struct platform_device *pdev)
>  
>  	platform_device_unregister(sel3350->leds_pdev);
>  	gpiod_remove_lookup_table(&sel3350_gpios_table);
> -	gpiod_remove_lookup_table(&sel3350_leds_table);
>  }
>  
>  static const struct acpi_device_id sel3350_device_ids[] = {
> @@ -246,4 +307,5 @@ module_platform_driver(sel3350_platform_driver);
>  MODULE_AUTHOR("Schweitzer Engineering Laboratories");
>  MODULE_DESCRIPTION("SEL-3350 platform driver");
>  MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_ALIAS("platform:sel3350");
>  MODULE_SOFTDEP("pre: pinctrl_broxton leds-gpio");
> 

-- 
 i.

