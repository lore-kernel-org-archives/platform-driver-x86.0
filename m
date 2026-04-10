Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9005C284B3B
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 04:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795919; cv=none; b=FXXSHmPVQQHOYcTeufWgcq9rrqNMND23AwFR/aUTXhqo340rHiibCO6M15mEuAJREeme/isZnVEqB7ZKVk1lMifkh2Bh+9qwzaiYkj7scWm2DIv/SJuK5x21Hw5MY2Hzna4Yq+lNxhwi0UlLKz70V66Lmjsk4JJQzIXh+AaEFQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795919; c=relaxed/simple;
	bh=8ZkuK7Bl4GC/r7qBV811upZB6bOfHJk8dfuKXo9bEjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/X7NlxS7txxqhKpHLVF0eVlt63t4DFf5vK0/G3nABL5NlkYYqizbuilA3l1k/qbNx1cThX9shpHvH6SoWTvNxomZ5RkK0dXahSxgltCdYFdlk57YbIqcNKiXuQeKAb5y/vunByUddsXQUQrz79H71PSt3aXJmWQroeGpgpqN3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redrectangle.org; spf=pass smtp.mailfrom=redrectangle.org; dkim=pass (2048-bit key) header.d=redrectangle.org header.i=@redrectangle.org header.b=Updz5kol; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redrectangle.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redrectangle.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=redrectangle.org header.i=@redrectangle.org header.b="Updz5kol"
Message-ID: <5e045141-c55b-4d66-a269-0e950e435889@redrectangle.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=key1; t=1775795914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1whui4mWD36m9PttQLI0pbZJFX6mGl4h+qbxZnClXWs=;
	b=Updz5kolfH9wkloA10jXnr27gH68SMhEqd8/G49V2XTuW9a6bc3HADT1EISo9nOGdu5fMA
	h2dEbLw6SoI0c+RuP6Au5POZVLOLza/CuAJidWkiUAoZXBWC/9pJRPR2kDTP3APn/Ej13/
	yg3oBXP0sGvVS2EC+ewkxyGHqVSDbC7AWVmkIy3eHfOkZZjmcupBBelsro9QpyKZlI9jrc
	ITPwH3MtUDkgX6ihJg5nTeRrUGBbCyU7kRFJgo+KgJO3Kb4q4jt2MFyD04HDSFU4jRvzTT
	/ARJ3hdM60vFiASt10C88lo2uOCanvEuj1CJXtAH8KLhCtFoh8eeJ2Cebpn3hQ==
Date: Thu, 9 Apr 2026 21:38:04 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] platform/x86: sel3350-platform: Retain LED state on
 load and unload
To: Brodie Abrew <brodie_abrew@selinc.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <7bd355c0-b363-94c8-bb4d-fe4acd29798c@linux.intel.com>
 <20260409212701.88577-1-brodie_abrew@selinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <20260409212701.88577-1-brodie_abrew@selinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/9/26 14:27, Brodie Abrew wrote:
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
>   drivers/platform/x86/sel3350-platform.c | 138 ++++++++++++++++++------
>   1 file changed, 105 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/sel3350-platform.c b/drivers/platform/x86/sel3350-platform.c
> index 02e2081e2333..7b0dc1d11199 100644
> --- a/drivers/platform/x86/sel3350-platform.c
> +++ b/drivers/platform/x86/sel3350-platform.c
> @@ -9,6 +9,8 @@
>    */
>   
>   #include <linux/acpi.h>
> +#include <linux/array_size.h>
> +#include <linux/err.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/gpio/machine.h>
>   #include <linux/leds.h>
> @@ -30,19 +32,82 @@
>   #define SEL_PS_B_DETECT "sel_ps_b_detect"
>   #define SEL_PS_B_GOOD   "sel_ps_b_good"
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
>   /* LEDs */
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
>   	{ .name = "sel:green:enabled",
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
>   };
>   
>   static const struct gpio_led_platform_data sel3350_leds_pdata = {
> @@ -50,25 +115,6 @@ static const struct gpio_led_platform_data sel3350_leds_pdata = {
>   	.leds = sel3350_leds,
>   };
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
>   static struct gpiod_lookup_table sel3350_gpios_table = {
>   	.dev_id = B2093_GPIO_ACPI_ID ":00",
>   	.table = {
> @@ -76,6 +122,16 @@ static struct gpiod_lookup_table sel3350_gpios_table = {
>   		GPIO_LOOKUP(BXT_NW, 45, SEL_PS_A_GOOD,   GPIO_ACTIVE_LOW),
>   		GPIO_LOOKUP(BXT_NW, 46, SEL_PS_B_DETECT, GPIO_ACTIVE_LOW),
>   		GPIO_LOOKUP(BXT_NW, 47, SEL_PS_B_GOOD,   GPIO_ACTIVE_LOW),
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
>   		{},
>   	}
>   };
> @@ -149,6 +205,7 @@ struct sel3350_data {
>   static int sel3350_probe(struct platform_device *pdev)
>   {
>   	int rs;
> +	int i;
>   	struct sel3350_data *sel3350;
>   	struct power_supply_config ps_cfg = {};
>   
> @@ -158,9 +215,20 @@ static int sel3350_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, sel3350);
>   
> -	gpiod_add_lookup_table(&sel3350_leds_table);
>   	gpiod_add_lookup_table(&sel3350_gpios_table);
>   
> +	for (i = 0; i < ARRAY_SIZE(sel3350_leds); ++i) {
> +		sel3350_leds[i].gpiod = devm_gpiod_get(&pdev->dev,
> +						       sel3350_leds_gpio_names[i],
> +						       GPIOD_ASIS);
> +		if (IS_ERR(sel3350_leds[i].gpiod) ||
> +		    (sel3350_leds[i].gpiod == NULL)) {
> +			rs = -EPROBE_DEFER;
> +			goto err_gpio_loop;
> +		}
> +		gpiod_set_consumer_name(sel3350_leds[i].gpiod, sel3350_leds[i].name);
> +	}
> +
>   	sel3350->leds_pdev = platform_device_register_data(
>   			NULL,
>   			"leds-gpio",
> @@ -209,11 +277,15 @@ static int sel3350_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +err_gpio_loop:
> +	while (i--)
> +		devm_gpiod_put(&pdev->dev, sel3350_leds[i].gpiod);
> +	goto err_platform;
> +
>   err_ps:
>   	platform_device_unregister(sel3350->leds_pdev);
>   err_platform:
>   	gpiod_remove_lookup_table(&sel3350_gpios_table);
> -	gpiod_remove_lookup_table(&sel3350_leds_table);
>   
>   	return rs;
>   }
> @@ -224,7 +296,6 @@ static void sel3350_remove(struct platform_device *pdev)
>   
>   	platform_device_unregister(sel3350->leds_pdev);
>   	gpiod_remove_lookup_table(&sel3350_gpios_table);
> -	gpiod_remove_lookup_table(&sel3350_leds_table);
>   }
>   
>   static const struct acpi_device_id sel3350_device_ids[] = {
> @@ -246,4 +317,5 @@ module_platform_driver(sel3350_platform_driver);
>   MODULE_AUTHOR("Schweitzer Engineering Laboratories");
>   MODULE_DESCRIPTION("SEL-3350 platform driver");
>   MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_ALIAS("platform:sel3350");
>   MODULE_SOFTDEP("pre: pinctrl_broxton leds-gpio");

I've been working with Brodie on this and have tested both v1 and v2 
patches on the SEL-3350 hardware.

Reviewed-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Tested-By: Robert Joslyn <robert.joslyn@redrectangle.org>
