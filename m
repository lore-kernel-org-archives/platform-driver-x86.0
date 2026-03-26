Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E19389119;
	Thu, 26 Mar 2026 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521977; cv=none; b=aHbS2RCVWxzwPA+1W2aIvBUXORsxrdaMP3L3UHNhVSwBUT4F+gTRt90KuxrB8cwHwwcEFW7r8FDs5JdtzOL/qvtc8+yr1MmGe06790WH6zcFjQFJ30FjzwkEnHvgjYu6Zlt0+b7+huF/IyvGDk76iAupArQL0fpzrUMqcoE4isw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521977; c=relaxed/simple;
	bh=tmy3UByPQjQRH3gjJw8IYn/Hw29oOw0injRAjiFtHno=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R26xXKEwazLeaI7kUw4MrzIizDIzD3fOjuaLBbKuhrWky3hda133PDQg623SSRzGUj/hoH3IkLFbOgNOF2yXP0Gt9C4Yazi1F5uvY0RAyJzvN3sVD9HkRP3lvicndWyT+gHj/tMym8DU8zzKylVgkzZLtQ6gmTEQ0WQLX0CwiAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=av9RDrFd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="av9RDrFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774521975; x=1806057975;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tmy3UByPQjQRH3gjJw8IYn/Hw29oOw0injRAjiFtHno=;
  b=av9RDrFdXCPTuPMhuZiRm5qEuCQFtCdp+eLG+NNSBMAbP46nJlEi27rC
   YFse5J0R8vQaK+GyBff09yJNHkR5fZT7ov2U3ynCiG915gatZ/Cw11dk0
   WIuu4Gg8aFhNLRavOL3PoVSXRfWGCAtc267IWKyqOiNvvPD4rxG5ZaWkM
   4gnUONYelEcSnIgrxhnKwbLC0gYNz6sXaHcGb3AMwB1140bSwnErOfJeK
   PDY9FQaCL1NTHlazKTQGenj6ssMUuG5/PajlXrty6jGpsFE1rQur4nJF1
   9uPYQ/JYHOoVkQFhXC/LuNL6Hd41g92BQqNg8jWWIVT9LcxHy+/nYrk31
   g==;
X-CSE-ConnectionGUID: nPL+ct2oQ/2nPCIF8vUK1A==
X-CSE-MsgGUID: +H1AiBoBSHmb+bq2N7GU8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86950200"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="86950200"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:46:15 -0700
X-CSE-ConnectionGUID: s4CZ4TTiTZilr4EKIKiHeQ==
X-CSE-MsgGUID: W1ak9amoQEm6gPrtEkS1MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="221661373"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:46:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Mar 2026 12:46:08 +0200 (EET)
To: Marco Nenciarini <mnencia@kcore.it>
cc: Daniel Scally <dan.scally@ideasonboard.com>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe LED)
In-Reply-To: <1834b9729482d629c1d2d28443b88323cbae2764.1774477895.git.mnencia@kcore.it>
Message-ID: <07897a49-b2f8-0a5a-e653-eaf4a14a1a13@linux.intel.com>
References: <ab0URIrzZPsYjWrM@spark.kcore.it> <cover.1774477895.git.mnencia@kcore.it> <1834b9729482d629c1d2d28443b88323cbae2764.1774477895.git.mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Mar 2026, Marco Nenciarini wrote:

> Some ACPI INT3472 devices include a GPIO with DSM type 0x02, used for
> IR flood (strobe) illumination. This GPIO type was previously
> unhandled, resulting in the following warning during probe:
> 
>   int3472-discrete INT3472:00: GPIO type 0x02 is not currently
>   supported
> 
> Add INT3472_GPIO_TYPE_STROBE (0x02) handling that registers the GPIO
> as an LED class device via skl_int3472_register_led(). An enum
> int3472_led_type parameter controls both the LED name suffix and
> whether a lookup is registered for the sensor driver. Unlike the
> privacy LED, the strobe LED is not consumed by the sensor driver, so
> no LED lookup is registered.
> 
> To support devices that have both a privacy and a strobe LED, the
> single struct int3472_led member is replaced with an array and the
> container_of in the brightness callback now references the int3472_led
> struct directly.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
> ---
> Changes in v3:
> - Use enum int3472_led_type to control name and lookup behavior
> - Convert single LED member to array for multi-LED support
> - Add default: return -EINVAL for safety
> 
>  drivers/platform/x86/intel/int3472/discrete.c | 18 ++++-
>  drivers/platform/x86/intel/int3472/led.c      | 74 +++++++++++++------
>  include/linux/platform_data/x86/int3472.h     | 17 ++++-
>  3 files changed, 80 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index cb24763..0cffd13 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -207,6 +207,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*con_id = "powerdown";
>  		*gpio_flags = GPIO_ACTIVE_LOW;
>  		break;
> +	case INT3472_GPIO_TYPE_STROBE:
> +		*con_id = "strobe";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> +		break;
>  	case INT3472_GPIO_TYPE_CLK_ENABLE:
>  		*con_id = "clk-enable";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -248,6 +252,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   *
>   * 0x00 Reset
>   * 0x01 Power down
> + * 0x02 Strobe (IR flood LED)
>   * 0x0b Power enable
>   * 0x0c Clock enable
>   * 0x0d Privacy LED
> @@ -329,6 +334,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  			err_msg = "Failed to map GPIO pin to sensor\n";
>  
>  		break;
> +	case INT3472_GPIO_TYPE_STROBE:
>  	case INT3472_GPIO_TYPE_CLK_ENABLE:
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
> @@ -348,7 +354,15 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  			break;
>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> -			ret = skl_int3472_register_led(int3472, gpio);
> +			ret = skl_int3472_register_led(int3472, gpio,
> +						       INT3472_LED_TYPE_PRIVACY);
> +			if (ret)
> +				err_msg = "Failed to register LED\n";
> +
> +			break;
> +		case INT3472_GPIO_TYPE_STROBE:
> +			ret = skl_int3472_register_led(int3472, gpio,
> +						       INT3472_LED_TYPE_STROBE);
>  			if (ret)
>  				err_msg = "Failed to register LED\n";
>  
> @@ -422,7 +436,7 @@ void int3472_discrete_cleanup(struct int3472_discrete_device *int3472)
>  	gpiod_remove_lookup_table(&int3472->gpios);
>  
>  	skl_int3472_unregister_clock(int3472);
> -	skl_int3472_unregister_led(int3472);
> +	skl_int3472_unregister_leds(int3472);
>  	skl_int3472_unregister_regulator(int3472);
>  }
>  EXPORT_SYMBOL_NS_GPL(int3472_discrete_cleanup, "INTEL_INT3472_DISCRETE");
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> index 8b26929..de475db 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -9,53 +9,79 @@
>  static int int3472_led_set(struct led_classdev *led_cdev,
>  			   enum led_brightness brightness)
>  {
> -	struct int3472_discrete_device *int3472 =
> -		container_of(led_cdev, struct int3472_discrete_device, led.classdev);
> +	struct int3472_led *led =
> +		container_of(led_cdev, struct int3472_led, classdev);
>  
> -	gpiod_set_value_cansleep(int3472->led.gpio, brightness);
> +	gpiod_set_value_cansleep(led->gpio, brightness);
>  	return 0;
>  }
>  
>  int skl_int3472_register_led(struct int3472_discrete_device *int3472,
> -			     struct gpio_desc *gpio)
> +			     struct gpio_desc *gpio,
> +			     enum int3472_led_type type)
>  {
> +	struct int3472_led *led;
> +	const char *name_suffix;
> +	bool add_lookup;
>  	char *p;
>  	int ret;
>  
> -	if (int3472->led.classdev.dev)
> -		return -EBUSY;
> +	if (int3472->n_leds >= INT3472_MAX_LEDS)
> +		return -ENOSPC;
>  
> -	int3472->led.gpio = gpio;
> +	switch (type) {
> +	case INT3472_LED_TYPE_PRIVACY:
> +		name_suffix = "privacy";
> +		add_lookup = true;
> +		break;
> +	case INT3472_LED_TYPE_STROBE:
> +		name_suffix = "strobe";
> +		add_lookup = false;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	led = &int3472->leds[int3472->n_leds];
> +	led->gpio = gpio;
>  
>  	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
> -	snprintf(int3472->led.name, sizeof(int3472->led.name),
> -		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
> -	p = strchr(int3472->led.name, ':');
> +	snprintf(led->name, sizeof(led->name),
> +		 "%s::%s_led", acpi_dev_name(int3472->sensor), name_suffix);
> +	p = strchr(led->name, ':');
>  	if (p)
>  		*p = '_';
>  
> -	int3472->led.classdev.name = int3472->led.name;
> -	int3472->led.classdev.max_brightness = 1;
> -	int3472->led.classdev.brightness_set_blocking = int3472_led_set;
> +	led->classdev.name = led->name;
> +	led->classdev.max_brightness = 1;
> +	led->classdev.brightness_set_blocking = int3472_led_set;
>  
> -	ret = led_classdev_register(int3472->dev, &int3472->led.classdev);
> +	ret = led_classdev_register(int3472->dev, &led->classdev);
>  	if (ret)
>  		return ret;

Could all these int3472->led. => led-> conversion be made in a separate 
patch as well? I think it would reduce churn making the actual changes in 
this patch stand out better.

>  
> -	int3472->led.lookup.provider = int3472->led.name;
> -	int3472->led.lookup.dev_id = int3472->sensor_name;
> -	int3472->led.lookup.con_id = "privacy";
> -	led_add_lookup(&int3472->led.lookup);
> +	if (add_lookup) {
> +		led->lookup.provider = led->name;
> +		led->lookup.dev_id = int3472->sensor_name;
> +		led->lookup.con_id = name_suffix;
> +		led_add_lookup(&led->lookup);
> +		led->has_lookup = true;
> +	}>  
> +	int3472->n_leds++;
>  	return 0;
>  }
>  
> -void skl_int3472_unregister_led(struct int3472_discrete_device *int3472)
> +void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472)
>  {
> -	if (IS_ERR_OR_NULL(int3472->led.classdev.dev))
> -		return;
> +	unsigned int i;
> +
> +	for (i = 0; i < int3472->n_leds; i++) {
> +		struct int3472_led *led = &int3472->leds[i];
>  
> -	led_remove_lookup(&int3472->led.lookup);
> -	led_classdev_unregister(&int3472->led.classdev);
> -	gpiod_put(int3472->led.gpio);
> +		if (led->has_lookup)
> +			led_remove_lookup(&led->lookup);
> +		led_classdev_unregister(&led->classdev);
> +		gpiod_put(led->gpio);
> +	}
>  }
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index 7af6731..9893711 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -23,6 +23,7 @@
>  /* PMIC GPIO Types */
>  #define INT3472_GPIO_TYPE_RESET					0x00
>  #define INT3472_GPIO_TYPE_POWERDOWN				0x01
> +#define INT3472_GPIO_TYPE_STROBE				0x02
>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> @@ -49,6 +50,7 @@
>  #define GPIO_REGULATOR_OFF_ON_DELAY				(2 * USEC_PER_MSEC)
>  
>  #define INT3472_LED_MAX_NAME_LEN				32
> +#define INT3472_MAX_LEDS					2
>  
>  #define CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET			86
>  
> @@ -68,6 +70,11 @@
>  #define to_int3472_device(clk)					\
>  	container_of(clk, struct int3472_discrete_device, clock)
>  
> +enum int3472_led_type {
> +	INT3472_LED_TYPE_PRIVACY,
> +	INT3472_LED_TYPE_STROBE,
> +};
> +
>  struct acpi_device;
>  struct dmi_system_id;
>  struct i2c_client;
> @@ -126,7 +133,9 @@ struct int3472_discrete_device {
>  		struct led_lookup_data lookup;
>  		char name[INT3472_LED_MAX_NAME_LEN];
>  		struct gpio_desc *gpio;
> -	} led;
> +		bool has_lookup;
> +	} leds[INT3472_MAX_LEDS];
> +	unsigned int n_leds;
>  
>  	struct int3472_discrete_quirks quirks;
>  
> @@ -160,7 +169,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  				   const char *second_sensor);
>  void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
>  
> -int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
> -void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
> +int skl_int3472_register_led(struct int3472_discrete_device *int3472,
> +			     struct gpio_desc *gpio,
> +			     enum int3472_led_type type);
> +void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472);
>  
>  #endif
> 

-- 
 i.

