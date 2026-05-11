Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A83D35E947;
	Mon, 11 May 2026 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518431; cv=none; b=tEZzOCgcZZgE/GGgy+ahDu0B6Sz5UI0CxG4mjq4m6egBrwowAZHuzE6HVN4rIMZL0rUtj5fn1QnFM9P4HEOw04gGjWMNb1EL1PzHEbz+RXwchOLfsbpwX6GoY9hda0ltdOKR96vID0SbdwXGdcsBLWzvsBO+ymXhVTQbVaLMkkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518431; c=relaxed/simple;
	bh=viy/h+32eGPIHKRW/f37aOnNZ2XayIXC0YYWtUPysGs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WMzG9ZIoYcoGdtGMPZ1h/5E/y4XIpiO4y1sAzUrAVXI2o9JeWiE9HDbyjpowiIKzCgY363uSwUxd/JBaV5BFEd8iA9x7nqm8bG/8kZKB+2RW9Fj/apapARXpikyZd2yFGHtwEdI0wySQd4SqkNq8QgIU69JXjvnsV4spx5EBqJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAZBBOhF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAZBBOhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778518430; x=1810054430;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=viy/h+32eGPIHKRW/f37aOnNZ2XayIXC0YYWtUPysGs=;
  b=lAZBBOhFswKoTItn3mCyMYNP2PlTfUDvhfJ7ADPD2JqQdVfU24Kw/I4H
   cgLBwL2LhBMn/cz+a91N4935p79KL/8TdnE/yC9xvGLkNmNKzk4xBWmrY
   c2DadwFncHjAx5J5MwdtFLtpjoKtlDJ4vGi2TylqUxTkqqLyjQAnSw/mr
   mzkW/EM2RRUGqiMRvfTm4WkH/wBoby/vSy60Sg7ursj9HuBOuvJa6z/ys
   hif70DrVZbusaQFVGT/jpRL7x/KZvrCavE6xS91YYnPlQFyYNARUJSRl/
   lBcp+IZZAG5p9UXfDMh6c7b2EYxawAJXp2o0dDIpk89q+k2XUF0DUtk5q
   Q==;
X-CSE-ConnectionGUID: IPAg41/ITt+S9PlZXC5jWQ==
X-CSE-MsgGUID: t1yeePY2T9aJdPecA/FEnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90879018"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="90879018"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 09:53:50 -0700
X-CSE-ConnectionGUID: uLYYIvI2REymMqEtZrG/4g==
X-CSE-MsgGUID: dE2gJPw+Qcqmo1jgFbCitA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="231114909"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 09:53:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 19:53:43 +0300 (EEST)
To: Donjuanplatinum <donplat@barrensea.org>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: tuxedo-laptop: Add MECHREVO WUJIE Series
 keyboard backlight
In-Reply-To: <20260509181905.9060-1-donplat@barrensea.org>
Message-ID: <8b6f3855-005a-2cdb-37fa-d2e8d2c3df80@linux.intel.com>
References: <20260509181905.9060-1-donplat@barrensea.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 10 May 2026, Donjuanplatinum wrote:

> Add support for the RGB keyboard backlight found on the MECHREVO WUJIE
> Series laptop (WUJIE Series-X5SP4NAG), which uses the same
> Clevo/Tongfang EC platform as supported TUXEDO devices.
> 
> The keyboard backlight is controlled from three EC registers for the RGB
> color channels (EC_ADDR_RGB_{RED,GREEN,BLUE}) and EC_ADDR_KBD_STATUS
> for the global brightness level.  The EC firmware encodes the brightness

One space is enough.

> in KBD_BRIGHTNESS (bits [7:5] of EC_ADDR_KBD_STATUS) as a 3-bit field,
> but only responds correctly to levels 0-4; writing values 5-7 causes the
> EC to immediately reset the backlight to level 0.  This behaviour was
> identified by observing that the Windows driver (MECHREVO Center2)
> stores only values in the range [0, 4] for both AC and DC brightness, and
> confirmed on hardware by testing that brightness recovers after the write
> sequence is corrected.  KBD_MAX_BRIGHTNESS_LEVEL enforces this limit and
> documents the reason, so future contributors do not reintroduce the bug.
> 
> The backlight is exposed as a multicolor LED class device with the
> "kbd_backlight" function.  Feature detection is performed at probe time
> by reading the RGB_KEYBOARD capability bit from EC_ADDR_SUPPORT_2, so
> the keyboard LED is only registered when the EC reports it as present.
> 
> Signed-off-by: Donjuanplatinum <donplat@barrensea.org>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 153 ++++++++++++++++++++
>  1 file changed, 153 insertions(+)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 945df5092..e0986542a 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -230,6 +230,17 @@
>  #define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
>  #define KBD_APPLY			BIT(4)
>  #define KBD_BRIGHTNESS			GENMASK(7, 5)
> +/*
> + * The EC brightness field (KBD_BRIGHTNESS, bits [7:5] of EC_ADDR_KBD_STATUS)
> + * is a 3-bit value but the EC firmware only responds correctly to levels 0-4.
> + * Writing values 5-7 causes the EC to reset the backlight to level 0.
> + *
> + * This limit has only been verified on the MECHREVO WUJIE Series. If other
> + * devices with RGB keyboard support (UNIWILL_FEATURE_KBD_BACKLIGHT) are added
> + * in the future and have a different valid range, this constant should be moved
> + * into struct uniwill_device_descriptor as a per-device field.
> + */
> +#define KBD_MAX_BRIGHTNESS_LEVEL	4
>  
>  #define EC_ADDR_FAN_CTRL		0x078E
>  #define FAN3P5				BIT(1)
> @@ -327,6 +338,7 @@
>  #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
>  #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
>  #define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
> +#define UNIWILL_FEATURE_KBD_BACKLIGHT		BIT(11)
>  
>  enum usb_c_power_priority_options {
>  	USB_C_POWER_PRIORITY_CHARGING = 0,
> @@ -348,6 +360,9 @@ struct uniwill_data {
>  	struct mutex led_lock;		/* Protects writes to the lightbar registers */
>  	struct led_classdev_mc led_mc_cdev;
>  	struct mc_subled led_mc_subled_info[LED_CHANNELS];
> +	struct mutex kbd_led_lock;	/* Protects writes to keyboard LED registers */
> +	struct led_classdev_mc kbd_led_mc_cdev;
> +	struct mc_subled kbd_led_mc_subled_info[LED_CHANNELS];
>  	struct mutex input_lock;	/* Protects input sequence during notify */
>  	struct input_dev *input_device;
>  	struct notifier_block nb;
> @@ -538,6 +553,10 @@ static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
>  	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>  	case EC_ADDR_CTGP_DB_DB_OFFSET:
>  	case EC_ADDR_USB_C_POWER_PRIORITY:
> +	case EC_ADDR_RGB_RED:
> +	case EC_ADDR_RGB_GREEN:
> +	case EC_ADDR_RGB_BLUE:
> +	case EC_ADDR_KBD_STATUS:
>  		return true;
>  	default:
>  		return false;
> @@ -577,6 +596,11 @@ static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
>  	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>  	case EC_ADDR_CTGP_DB_DB_OFFSET:
>  	case EC_ADDR_USB_C_POWER_PRIORITY:
> +	case EC_ADDR_SUPPORT_2:
> +	case EC_ADDR_RGB_RED:
> +	case EC_ADDR_RGB_GREEN:
> +	case EC_ADDR_RGB_BLUE:
> +	case EC_ADDR_KBD_STATUS:
>  		return true;
>  	default:
>  		return false;
> @@ -1223,6 +1247,119 @@ static int uniwill_hwmon_init(struct uniwill_data *data)
>  	return PTR_ERR_OR_ZERO(hdev);
>  }
>  
> +static const unsigned int uniwill_kbd_led_channel_to_reg[LED_CHANNELS] = {
> +	EC_ADDR_RGB_RED,
> +	EC_ADDR_RGB_GREEN,
> +	EC_ADDR_RGB_BLUE,
> +};
> +
> +static int uniwill_kbd_led_brightness_set(struct led_classdev *led_cdev,
> +					 enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *led_mc_cdev = lcdev_to_mccdev(led_cdev);
> +	struct uniwill_data *data = container_of(led_mc_cdev, struct uniwill_data, kbd_led_mc_cdev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = led_mc_calc_color_components(led_mc_cdev, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&data->kbd_led_lock);
> +
> +	for (int i = 0; i < LED_CHANNELS; i++) {
> +		value = min(LED_MAX_BRIGHTNESS, data->kbd_led_mc_subled_info[i].brightness);
> +		ret = regmap_write(data->regmap, uniwill_kbd_led_channel_to_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	value = FIELD_PREP(KBD_BRIGHTNESS,
> +			   DIV_ROUND_CLOSEST(brightness * KBD_MAX_BRIGHTNESS_LEVEL,

Please add include for DIV_ROUND_CLOSEST().

> +					     LED_MAX_BRIGHTNESS)) | KBD_APPLY;
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_KBD_STATUS,
> +				 KBD_BRIGHTNESS | KBD_APPLY, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_COLOR, RGB_APPLY_COLOR);
> +}
> +
> +static int uniwill_kbd_led_probe(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!(value & RGB_KEYBOARD))
> +		return 0;
> +
> +	data->features |= UNIWILL_FEATURE_KBD_BACKLIGHT;
> +
> +	return 0;
> +}
> +
> +static int uniwill_kbd_led_init(struct uniwill_data *data)
> +{
> +	struct led_init_data init_data = {
> +		.devicename = DRIVER_NAME,
> +		.default_label = "multicolor:" LED_FUNCTION_KBD_BACKLIGHT,
> +		.devname_mandatory = true,
> +	};
> +	const unsigned int color_indices[3] = {
> +		LED_COLOR_ID_RED,
> +		LED_COLOR_ID_GREEN,
> +		LED_COLOR_ID_BLUE,
> +	};
> +	unsigned int value;
> +	int ret;
> +
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_KBD_BACKLIGHT))
> +		return 0;
> +
> +	ret = devm_mutex_init(data->dev, &data->kbd_led_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->kbd_led_mc_cdev.led_cdev.color = LED_COLOR_ID_MULTI;
> +	data->kbd_led_mc_cdev.led_cdev.max_brightness = LED_MAX_BRIGHTNESS;
> +	data->kbd_led_mc_cdev.led_cdev.flags = LED_REJECT_NAME_CONFLICT;
> +	data->kbd_led_mc_cdev.led_cdev.brightness_set_blocking = uniwill_kbd_led_brightness_set;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_KBD_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->kbd_led_mc_cdev.led_cdev.brightness =
> +		DIV_ROUND_CLOSEST(FIELD_GET(KBD_BRIGHTNESS, value) * LED_MAX_BRIGHTNESS,
> +				  KBD_MAX_BRIGHTNESS_LEVEL);
> +
> +	for (int i = 0; i < LED_CHANNELS; i++) {
> +		data->kbd_led_mc_subled_info[i].color_index = color_indices[i];
> +
> +		ret = regmap_read(data->regmap, uniwill_kbd_led_channel_to_reg[i], &value);
> +		if (ret < 0)
> +			return ret;
> +
> +		value = min(LED_MAX_BRIGHTNESS, value);
> +		ret = regmap_write(data->regmap, uniwill_kbd_led_channel_to_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +
> +		data->kbd_led_mc_subled_info[i].intensity = value;
> +		data->kbd_led_mc_subled_info[i].channel = i;
> +	}
> +
> +	data->kbd_led_mc_cdev.subled_info = data->kbd_led_mc_subled_info;
> +	data->kbd_led_mc_cdev.num_colors = LED_CHANNELS;
> +
> +	return devm_led_classdev_multicolor_register_ext(data->dev, &data->kbd_led_mc_cdev,
> +							 &init_data);
> +}
> +
>  static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS] = {
>  	EC_ADDR_LIGHTBAR_BAT_RED,
>  	EC_ADDR_LIGHTBAR_BAT_GREEN,
> @@ -1654,6 +1791,10 @@ static int uniwill_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +	ret = uniwill_kbd_led_probe(data);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = uniwill_battery_init(data);
>  	if (ret < 0)
>  		return ret;
> @@ -1662,6 +1803,10 @@ static int uniwill_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> +	ret = uniwill_kbd_led_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = uniwill_hwmon_init(data);
>  	if (ret < 0)
>  		return ret;
> @@ -2193,6 +2338,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  		},
>  		.driver_data = &tux_featureset_3_nvidia_descriptor,
>  	},
> +	{
> +		.ident = "MECHREVO WUJIE Series",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
> +		},
> +		.driver_data = &tux_featureset_3_descriptor,
> +	},
>  	{
>  		.ident = "TUXEDO Polaris 15 Gen1 AMD",
>  		.matches = {
> 

-- 
 i.

