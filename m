Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BAA32C8B
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2026 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064960; cv=none; b=hSSSrqxi73j2CrPXQONf/ei8mmGTpMjpe0RIljly6unTCbDH7DQhU2MkhwJ3dX9hexDF/QfQS8fGubWM0OCSjL49vcATRE4YpCKeXpP1msYEnPg/tL/zgiQUceKAtVCma9upfR/5dWjZSGpk/9vV3cEoV84tlV14IMvAH+xgLOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064960; c=relaxed/simple;
	bh=eE9ShQzlRG6HyJ84l5d1okrayHZyfpR5OMng6/GOLo4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a9/BEFQ21+um4LhMXsee+k+PMe6EsUJa53NAHyW4kdQM1To3RS0qkyUoKbo0e2q/1MsDvgMxpFr531p1q0Rn+LECJ6dOlnAoM8DA/KhclETpnU0OZYycHmhMTc/jFFcUqIYnit5bMpb2YQhP5HPfcnHWKCM/rU12EbI8YHkaPVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grozbgb+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grozbgb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778064958; x=1809600958;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eE9ShQzlRG6HyJ84l5d1okrayHZyfpR5OMng6/GOLo4=;
  b=grozbgb+d+NJXOJA16xsPcgP5ekZ+20kBx2IODiLOsTqXWsjd1qQZFQr
   vvhnLzGIVsgxiks10P7aYYg07PjM018iIB6iKgILidYuGbc8gevJ/IzdU
   EFdbf8Y411888CbTDLRZng5qgAOwZQj5U4ZerHvtFJavjKz4X6pMBCbsd
   5IjIPkM8g96qVavs9/xxG7j/KHoR3NgfqJRrJeuIHoodBzKg5BwQsZDJO
   ZScNlLvgV5m9CiO+WxpMtLNXW85SU0oz7qwH+pxy2448fxRswGLzpZfUg
   C4Mn0ObPR1H+a+mQ/8OMRzuWlfVcmh79Wd2K+4vxm69lgoUa2WpdlrPqe
   g==;
X-CSE-ConnectionGUID: 7ZarFNCHQpCtAWQ5AI4lrQ==
X-CSE-MsgGUID: y1Xk0s71RseDwxIZgz2EXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82861107"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="82861107"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:55:58 -0700
X-CSE-ConnectionGUID: UhuXmWUmSmi5GWRVxdg0mA==
X-CSE-MsgGUID: nCfjT4biQ7ix1Ho81o/8fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259803951"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.231])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:55:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 May 2026 13:55:50 +0300 (EEST)
To: Brodie Abrew <brodie_abrew@selinc.com>
cc: platform-driver-x86@vger.kernel.org, robert.joslyn@redrectangle.org
Subject: Re: [PATCH v2] platform/x86: sel3350-platform: Retain LED state on
 load and unload
In-Reply-To: <20260409212701.88577-1-brodie_abrew@selinc.com>
Message-ID: <65829704-a7b8-208a-255c-6d4586b75772@linux.intel.com>
References: <7bd355c0-b363-94c8-bb4d-fe4acd29798c@linux.intel.com> <20260409212701.88577-1-brodie_abrew@selinc.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Apr 2026, Brodie Abrew wrote:

> When the platform driver is loaded or unloaded, it overwrites the
> existing LED states. This can cause a loss of early boot state when the
> driver loads, and it can cause the ALARM contact to change state or
> flicker.
> 
> Explicitly retain the existing LED state to prevent overwriting on
> driver load and unload.
> 
> Signed-off-by: Brodie Abrew <brodie_abrew@selinc.com>
> ---
> V1 -> V2: Fixed code style, added includes, and fixed other reviewer comments
> 
>  drivers/platform/x86/sel3350-platform.c | 138 ++++++++++++++++++------
>  1 file changed, 105 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/sel3350-platform.c b/drivers/platform/x86/sel3350-platform.c
> index 02e2081e2333..7b0dc1d11199 100644
> --- a/drivers/platform/x86/sel3350-platform.c
> +++ b/drivers/platform/x86/sel3350-platform.c
> @@ -9,6 +9,8 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
> +#include <linux/err.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/leds.h>
> @@ -30,19 +32,82 @@
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
> +	  .retain_state_shutdown = 1,
> +	},
> +	{ .name = "sel:green:aux2",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1,
> +	},
> +	{ .name = "sel:green:aux3",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1,
> +	},
> +	{ .name = "sel:green:aux4",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1,
> +	},
> +	{ .name = "sel:red:alarm",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1,
> +	},
>  	{ .name = "sel:green:enabled",
> -	  .default_state = LEDS_GPIO_DEFSTATE_ON },
> -	{ .name = "sel:red:aux1" },
> -	{ .name = "sel:red:aux2" },
> -	{ .name = "sel:red:aux3" },
> -	{ .name = "sel:red:aux4" },
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1,
> +	},
> +	{ .name = "sel:red:aux1",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1,
> +	},
> +	{ .name = "sel:red:aux2",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1,
> +	},
> +	{ .name = "sel:red:aux3",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1,
> +	},
> +	{ .name = "sel:red:aux4",
> +	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
> +	  .retain_state_suspended = 1,
> +	  .retain_state_shutdown = 1,
> +	},
>  };
>  
>  static const struct gpio_led_platform_data sel3350_leds_pdata = {
> @@ -50,25 +115,6 @@ static const struct gpio_led_platform_data sel3350_leds_pdata = {
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
> @@ -76,6 +122,16 @@ static struct gpiod_lookup_table sel3350_gpios_table = {
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
> @@ -149,6 +205,7 @@ struct sel3350_data {
>  static int sel3350_probe(struct platform_device *pdev)
>  {
>  	int rs;
> +	int i;
>  	struct sel3350_data *sel3350;
>  	struct power_supply_config ps_cfg = {};
>  
> @@ -158,9 +215,20 @@ static int sel3350_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, sel3350);
>  
> -	gpiod_add_lookup_table(&sel3350_leds_table);
>  	gpiod_add_lookup_table(&sel3350_gpios_table);
>  
> +	for (i = 0; i < ARRAY_SIZE(sel3350_leds); ++i) {
> +		sel3350_leds[i].gpiod = devm_gpiod_get(&pdev->dev,
> +						       sel3350_leds_gpio_names[i],
> +						       GPIOD_ASIS);
> +		if (IS_ERR(sel3350_leds[i].gpiod) ||
> +		    (sel3350_leds[i].gpiod == NULL)) {

IS_ERR_OR_NULL()

> +			rs = -EPROBE_DEFER;
> +			goto err_gpio_loop;
> +		}
> +		gpiod_set_consumer_name(sel3350_leds[i].gpiod, sel3350_leds[i].name);
> +	}
> +
>  	sel3350->leds_pdev = platform_device_register_data(
>  			NULL,
>  			"leds-gpio",
> @@ -209,11 +277,15 @@ static int sel3350_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +err_gpio_loop:
> +	while (i--)
> +		devm_gpiod_put(&pdev->dev, sel3350_leds[i].gpiod);
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
> @@ -224,7 +296,6 @@ static void sel3350_remove(struct platform_device *pdev)
>  
>  	platform_device_unregister(sel3350->leds_pdev);
>  	gpiod_remove_lookup_table(&sel3350_gpios_table);
> -	gpiod_remove_lookup_table(&sel3350_leds_table);
>  }
>  
>  static const struct acpi_device_id sel3350_device_ids[] = {
> @@ -246,4 +317,5 @@ module_platform_driver(sel3350_platform_driver);
>  MODULE_AUTHOR("Schweitzer Engineering Laboratories");
>  MODULE_DESCRIPTION("SEL-3350 platform driver");
>  MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_ALIAS("platform:sel3350");

How is this related to preserving led states on load/unload??

-- 
 i.

