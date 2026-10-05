Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304004CE68B;
	Mon,  5 Oct 2026 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216796; cv=none; b=Gb05jMTai4bLJmpMdzKCTuA/g0GjPtIRQs3Lg69qdOw64V1VAzhDTAnU5E7UTt+zIv/4oCf2D75mzsgM0EQxmSF+lM2IVZ6e3XF1H9RCgnyZZ98I4ff9Wi5r5JuMLW0ut3xJoBOXPtVuWRc4qpCbVbFEEze2gVLOkk9r5PWQ9oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216796; c=relaxed/simple;
	bh=BFlN/PToxk/VE3NAsLPMCQk/ZwFNCF0eI1+lJT3olCw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fbJD7iWcDg0BZOdv8v3xOKzUsQCWTyMYoUFs7diwy08UXxXEtlcAFiRtnhQ7XgseQpRRSGhYRWBP0Tug2GmtI5kwE/3HBs01hnnBHBNB91KwePePmt8lfwlaTIz8PhhLJS7ghRRoC75WDdr9eCkzipLTAbxSv7nQSDrY/zbFYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePKN/B3p; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePKN/B3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791216787; x=1822752787;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BFlN/PToxk/VE3NAsLPMCQk/ZwFNCF0eI1+lJT3olCw=;
  b=ePKN/B3pwsdH+16Rha7S4k+PY/HKURyNvKnltNP1UVVLyPMS3c+8HoCm
   M1eMFfMCEzWDj9/Wp+4eJRgaleeeiTn1CQ/1y1h7rhwDMMUUt/uydwFHX
   t4K5SlJrtke/FD+ykh+/iO9hv20Ycof+F45l1Eo7M20qBmSXIeQRceo9x
   c3zgXwVInzaosL5MuDV9tK1AUmZei+Ht3+5gdymMnBdbAAI2x6GJldDyP
   ZBWshzepzqNgZ3WRRPJUOF0jMNDMswH4oX8bTD4DkWQFWa9APhUNQrCRp
   nwMOICFNOQM2u0todxvF6xTUMTNWO3u2NampZOiXeXilTOQqeOZsaz/Yo
   Q==;
X-CSE-ConnectionGUID: a7ujNOV6RISWv+6ue8zSqw==
X-CSE-MsgGUID: J3GSHCW9RiWxQJ+E3uBDMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="113674018"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="113674018"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:13:00 -0700
X-CSE-ConnectionGUID: 2rsNQYrFTt68HLg51nvPOA==
X-CSE-MsgGUID: I73lUMGdRWKM9VCecwn1zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276402590"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:12:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Oct 2026 19:12:54 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] platform/x86: uniwill-laptop: Report correct lightbar
 brightness
In-Reply-To: <20260905130138.6814-2-W_Armin@gmx.de>
Message-ID: <3e9a0a1d-5358-2a2a-808f-be6e7eb46bd0@linux.intel.com>
References: <20260905130138.6814-1-W_Armin@gmx.de> <20260905130138.6814-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Sep 2026, Armin Wolf wrote:

> The LED sysfs ABI now allows us to specify the maximum values for the
> global brightness and the color intensity values independently. At the
> same time the maximum brightness value reported for the lightbar (like
> 200) does not match the real value supported by the hardware (1),
> potentially confusing users.
> 
> Report the correct maximum brightness value and only use the intensity
> values for controlling the lightbar color.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 35 ++++++++++-----------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 7a2eeaec4c96..7420e1dd4716 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -398,7 +398,7 @@ struct uniwill_data {
>  	struct mutex super_key_lock;	/* Protects the toggling of the super key lock state */
>  	struct list_head batteries;
>  	struct mutex led_lock;		/* Protects writes to the lightbar registers */
> -	u8 lightbar_max_brightness;
> +	u8 lightbar_max_intensity;
>  	struct led_classdev_mc led_mc_cdev;
>  	struct mc_subled led_mc_subled_info[LED_CHANNELS];
>  	bool kbd_led_single_color;
> @@ -429,7 +429,7 @@ struct uniwill_device_descriptor {
>  	unsigned int features;
>  	bool kbd_led_single_color;
>  	u8 kbd_led_max_brightness;
> -	u8 lightbar_max_brightness;
> +	u8 lightbar_max_intensity;
>  	/* Executed during driver probing */
>  	int (*probe)(struct uniwill_data *data);
>  };
> @@ -1509,20 +1509,16 @@ static int uniwill_led_brightness_set(struct led_classdev *led_cdev, enum led_br
>  	unsigned int value;
>  	int ret;
>  
> -	ret = led_mc_calc_color_components(led_mc_cdev, brightness);
> -	if (ret < 0)
> -		return ret;
> -
>  	guard(mutex)(&data->led_lock);
>  
>  	for (int i = 0; i < LED_CHANNELS; i++) {
> -		/* Prevent the brightness values from overflowing */
> -		value = min(data->lightbar_max_brightness, data->led_mc_subled_info[i].brightness);
> -		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i],
> +				   data->led_mc_subled_info[i].intensity);
>  		if (ret < 0)
>  			return ret;
>  
> -		ret = regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], value);
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i],
> +				   data->led_mc_subled_info[i].intensity);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -1586,14 +1582,14 @@ static int uniwill_led_init(struct uniwill_data *data)
>  		return ret;
>  
>  	data->led_mc_cdev.led_cdev.color = LED_COLOR_ID_MULTI;
> -	data->led_mc_cdev.led_cdev.max_brightness = data->lightbar_max_brightness;
> +	data->led_mc_cdev.led_cdev.max_brightness = 1;
>  	data->led_mc_cdev.led_cdev.flags = LED_REJECT_NAME_CONFLICT;
>  	data->led_mc_cdev.led_cdev.brightness_set_blocking = uniwill_led_brightness_set;
>  
>  	if (value & LIGHTBAR_S0_OFF)
>  		data->led_mc_cdev.led_cdev.brightness = 0;
>  	else
> -		data->led_mc_cdev.led_cdev.brightness = data->lightbar_max_brightness;
> +		data->led_mc_cdev.led_cdev.brightness = 1;
>  
>  	for (int i = 0; i < LED_CHANNELS; i++) {
>  		data->led_mc_subled_info[i].color_index = color_indices[i];
> @@ -1604,9 +1600,9 @@ static int uniwill_led_init(struct uniwill_data *data)
>  
>  		/*
>  		 * Make sure that the initial intensity value is not greater than
> -		 * the maximum brightness.
> +		 * the maximum intensity.
>  		 */
> -		value = min(data->lightbar_max_brightness, value);
> +		value = min(data->lightbar_max_intensity, value);
>  		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
>  		if (ret < 0)
>  			return ret;
> @@ -1616,6 +1612,7 @@ static int uniwill_led_init(struct uniwill_data *data)
>  			return ret;
>  
>  		data->led_mc_subled_info[i].intensity = value;
> +		data->led_mc_subled_info[i].max_intensity = data->lightbar_max_intensity;
>  		data->led_mc_subled_info[i].channel = i;
>  	}
>  
> @@ -2338,7 +2335,7 @@ static int uniwill_probe(struct platform_device *pdev)
>  	data->features = device_descriptor.features;
>  	data->kbd_led_single_color = device_descriptor.kbd_led_single_color;
>  	data->kbd_led_max_brightness = device_descriptor.kbd_led_max_brightness;
> -	data->lightbar_max_brightness = device_descriptor.lightbar_max_brightness;
> +	data->lightbar_max_intensity = device_descriptor.lightbar_max_intensity;
>  
>  	/*
>  	 * Some devices might need to perform some device-specific initialization steps
> @@ -2685,7 +2682,7 @@ static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __initdata
>  		    UNIWILL_FEATURE_GPU_TEMP |
>  		    UNIWILL_FEATURE_PRIMARY_FAN |
>  		    UNIWILL_FEATURE_SECONDARY_FAN,
> -	.lightbar_max_brightness = 36,
> +	.lightbar_max_intensity = 36,
>  };
>  
>  static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
> @@ -2709,7 +2706,7 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
>  		    UNIWILL_FEATURE_GPU_TEMP |
>  		    UNIWILL_FEATURE_PRIMARY_FAN |
>  		    UNIWILL_FEATURE_SECONDARY_FAN,
> -	.lightbar_max_brightness = 200,
> +	.lightbar_max_intensity = 200,
>  };

Can you respin this on top of what's in the review-ilpo-next I think there 
are now more entries to touch after Werner's descriptor splits.

>  /*
> @@ -3355,8 +3352,8 @@ static int __init uniwill_init(void)
>  		device_descriptor.kbd_led_single_color = false;
>  		/* Some models only support 3 brightness levels */
>  		device_descriptor.kbd_led_max_brightness = 4;
> -		/* Some models only support 36 brightness levels per color component */
> -		device_descriptor.lightbar_max_brightness = 200;
> +		/* Some models only support 36 intensity levels per color component */
> +		device_descriptor.lightbar_max_intensity = 200;
>  		pr_warn("Enabling potentially unsupported features\n");
>  	}
>  
> 

-- 
 i.

