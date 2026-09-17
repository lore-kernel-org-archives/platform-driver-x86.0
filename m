Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B84D6C52;
	Thu, 17 Sep 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656357; cv=none; b=Q+8QL97FFsYgUbM7/vr7yEN2KTYfJTGaIqz8hRVMrLlLX9ide/qFgwtn6jaouuXW5CDaFrlODfvYbSe/mRVKlwEMyXT8SzNCq6X9pyyUt/s+6i9iFYERqjodUJCawqjXvajT8bwSRqbZ5vyEcnHp1GRp/KjdQT+2EsGfhbC/oZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656357; c=relaxed/simple;
	bh=AbFLVqZUm01boXAMPJprBCgUc2rWswJdGaRacaBJkfE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M6F4kAwHVPYovaZr/ariuUot7sWPueYMWoN+3p2nbQd43thLKiaf3HYFQHJtXVsS70b8+LBBKwkPyFyACb8rv4SpDvVw91JLv5qb4ocZYxBgXiLGvIXkYXOv5Zupe864hIblD5OTtAtkM4JsTpOTStIo/rhGP1Qq2HfxCzhcdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzxTN7YL; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzxTN7YL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789656346; x=1821192346;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AbFLVqZUm01boXAMPJprBCgUc2rWswJdGaRacaBJkfE=;
  b=NzxTN7YLTMXf/h1+ql0komuAetb9k/D9u0l+sxvoq7IvZnIuACXCgrSo
   LB5o0lJfLUqmiDaqkjxZH1S4uQ3JKJ5h3g9HNdQf92GeifP0+5Tq0xKWK
   Gj39n7JjxnE7qHc6UtrQiH76SvN8VxHYO3guj3cpmbjrv7DVpbZs0oL7v
   fO7LUoHt1819sG6vx0bpXeRM0XduK14igWm521dm231koZDel+z63nexH
   yqM9zZIBKfJ57HT4ClYmjeQ2gaZL+gvA84bEF89tRgBkSxu9NKph0Y5ZU
   X1aza5CDPu9BlwelfAUz6u/0se2kpKy1jt/ipMeq6GfPjvWMvRR1bqIdH
   g==;
X-CSE-ConnectionGUID: PTGE6bvzQGaz6howAz5nQw==
X-CSE-MsgGUID: 9u2VxJVFQrCPu+//4t+fzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="595697"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="595697"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:45:41 -0700
X-CSE-ConnectionGUID: MogMzXT2TtCOhG65NoZ1cA==
X-CSE-MsgGUID: CtTedmjdQXWRAghVUTQ+mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2022609"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:45:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 17:45:36 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] platform/x86: uniwill-laptop: Enable kb backlight
 and lightbar for TUXEDO
In-Reply-To: <20260822003012.851574-2-wse@tuxedocomputers.com>
Message-ID: <1bf299f1-6b97-db97-3bdf-7c0b41999022@linux.intel.com>
References: <20260822003012.851574-1-wse@tuxedocomputers.com> <20260822003012.851574-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Aug 2026, Werner Sembach wrote:

> Enable EC controlled keyboard backlight across the board for TUXEDO
> devices.
> 
> This has split up the device descriptors even more, so the "featureset"
> naming scheme was dropped in favor of a "generalized board_name" naming
> scheme.
> 
> Also Stellaris and Polaris Gen3 are now identified by product_sku to split
> them up.
> 
> Also some TUXEDO devices with lightbar still had the support missing. This
> patch completes the list in this point.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Hi,

Could this change be split such that mechanical large-scale changes such 
as descriptor renames are done in own patch?

-- 
 i.

> ---
> V1->V2: No change
> V2->V3: No change
>
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 309 +++++++++++++++-----
>  1 file changed, 233 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 5df3611919ce3..9bdca1da77983 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -645,6 +645,7 @@ static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
>  	case EC_ADDR_BIOS_OEM:
>  	case EC_ADDR_PWM_1:
>  	case EC_ADDR_PWM_2:
> +	case EC_ADDR_SUPPORT_1:
>  	case EC_ADDR_SUPPORT_2:
>  	case EC_ADDR_TRIGGER:
>  	case EC_ADDR_SWITCH_STATUS:
> @@ -684,6 +685,7 @@ static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
>  	case EC_ADDR_BIOS_OEM:
>  	case EC_ADDR_PWM_1:
>  	case EC_ADDR_PWM_2:
> +	case EC_ADDR_SUPPORT_1:
>  	case EC_ADDR_SUPPORT_2:
>  	case EC_ADDR_TRIGGER:
>  	case EC_ADDR_SWITCH_STATUS:
> @@ -2738,35 +2740,47 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
>  	.lightbar_max_brightness = 200,
>  };
>  
> -/*
> - * The featuresets below reflect somewhat chronological changes:
> - * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firmware.
> - * 2 -> 3: UNIWILL_FEATURE_USB_C_POWER_PRIORITY is removed from the EC firmware.
> - * Some devices might divert from this timeline.
> - */
> +static struct uniwill_device_descriptor pfxnuxx_pfxluxx_phxprxx_descriptor __initdata = {
> +	.features = UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color = true,
> +	.kbd_led_max_brightness = 2,
> +};
>  
> -static struct uniwill_device_descriptor tux_featureset_1_descriptor __initdata = {
> +static struct uniwill_device_descriptor gkxmrxx_gkxnpxx_gkxnrxx_descriptor __initdata = {
>  	.features = UNIWILL_FEATURE_FN_LOCK |
>  		    UNIWILL_FEATURE_SUPER_KEY |
>  		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>  		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
>  		    UNIWILL_FEATURE_PRIMARY_FAN |
>  		    UNIWILL_FEATURE_SECONDARY_FAN |
> -		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color = false,
> +	.kbd_led_max_brightness = 4,
>  };
>  
> -static struct uniwill_device_descriptor tux_featureset_1_nvidia_descriptor __initdata = {
> +static struct uniwill_device_descriptor gmxmpxx_descriptor __initdata = {
>  	.features = UNIWILL_FEATURE_FN_LOCK |
>  		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_LIGHTBAR |
>  		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>  		    UNIWILL_FEATURE_CPU_TEMP |
>  		    UNIWILL_FEATURE_GPU_TEMP |
>  		    UNIWILL_FEATURE_PRIMARY_FAN |
>  		    UNIWILL_FEATURE_SECONDARY_FAN |
>  		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> +	.lightbar_max_brightness = 36,
>  };
>  
> -static struct uniwill_device_descriptor tux_featureset_2_nvidia_descriptor __initdata = {
> +static struct uniwill_device_descriptor phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor __initdata = {
>  	.features = UNIWILL_FEATURE_FN_LOCK |
>  		    UNIWILL_FEATURE_SUPER_KEY |
>  		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> @@ -2775,10 +2789,109 @@ static struct uniwill_device_descriptor tux_featureset_2_nvidia_descriptor __ini
>  		    UNIWILL_FEATURE_PRIMARY_FAN |
>  		    UNIWILL_FEATURE_SECONDARY_FAN |
>  		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color = true,
> +	.kbd_led_max_brightness = 2,
> +};
> +
> +static struct uniwill_device_descriptor gmxmgxx_gmxngxx_gmxxgxx_descriptor __initdata = {
> +	.features = UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color = false,
> +	.kbd_led_max_brightness = 4,
> +};
> +
> +static struct uniwill_device_descriptor gmxzgxx_gmxtgxx_pol_descriptor __initdata = {
> +	.features = UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color = false,
> +	.kbd_led_max_brightness = 4,
> +};
> +
> +static struct uniwill_device_descriptor gmxzgxx_gmxtgxx_ste_descriptor __initdata = {
> +	.features = UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_LIGHTBAR |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
>  		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> +	.lightbar_max_brightness = 36,
>  };
>  
> -static struct uniwill_device_descriptor tux_featureset_3_nvidia_descriptor __initdata = {
> +static int gmxrgxx_probe(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SUPPORT_1, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (value & LIGHTBAR) {
> +		data->features |= UNIWILL_FEATURE_LIGHTBAR;
> +		data->lightbar_max_brightness = 36;
> +	}
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (value & RGB_KEYBOARD) {
> +		data->features |= UNIWILL_FEATURE_KEYBOARD_BACKLIGHT;
> +		data->kbd_led_single_color = false;
> +		data->kbd_led_max_brightness = 4;
> +	}
> +
> +	return 0;
> +};
> +
> +static struct uniwill_device_descriptor gmxrgxx_descriptor __initdata = {
> +	.features = UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
> +	.probe = gmxrgxx_probe,
> +};
> +
> +static struct uniwill_device_descriptor gmxagxx_descriptor __initdata = {
> +	.features = UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_LIGHTBAR |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
> +	.lightbar_max_brightness = 36,
> +};
> +
> +static struct uniwill_device_descriptor gmxxgxx_gmxpxxx_descriptor __initdata = {
>  	.features = UNIWILL_FEATURE_FN_LOCK |
>  		    UNIWILL_FEATURE_SUPER_KEY |
>  		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> @@ -2789,7 +2902,7 @@ static struct uniwill_device_descriptor tux_featureset_3_nvidia_descriptor __ini
>  		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
>  };
>  
> -static struct uniwill_device_descriptor tux_featureset_4_descriptor __initdata = {
> +static struct uniwill_device_descriptor gxxhrxx_gxxmrxx_xxxx4nxx_descriptor __initdata = {
>  	.features = UNIWILL_FEATURE_FN_LOCK |
>  		    UNIWILL_FEATURE_SUPER_KEY |
>  		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> @@ -2797,10 +2910,29 @@ static struct uniwill_device_descriptor tux_featureset_4_descriptor __initdata =
>  		    UNIWILL_FEATURE_PRIMARY_FAN |
>  		    UNIWILL_FEATURE_SECONDARY_FAN |
>  		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> -		    UNIWILL_FEATURE_USB_POWERSHARE,
> +		    UNIWILL_FEATURE_USB_POWERSHARE |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color = true,
> +	.kbd_led_max_brightness = 4,
>  };
>  
> -static struct uniwill_device_descriptor tux_featureset_4_nvidia_descriptor __initdata = {
> +static struct uniwill_device_descriptor gmxhgxx_descriptor __initdata = {
> +	.features = UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> +		    UNIWILL_FEATURE_USB_POWERSHARE |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color = false,
> +	.kbd_led_max_brightness = 4,
> +};
> +
> +static struct uniwill_device_descriptor gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor __initdata = {
>  	.features = UNIWILL_FEATURE_FN_LOCK |
>  		    UNIWILL_FEATURE_SUPER_KEY |
>  		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> @@ -2813,7 +2945,7 @@ static struct uniwill_device_descriptor tux_featureset_4_nvidia_descriptor __ini
>  		    UNIWILL_FEATURE_USB_POWERSHARE,
>  };
>  
> -static int phxtxx1_probe(struct uniwill_data *data)
> +static int phxtuxx_phxtrxx_probe(struct uniwill_data *data)
>  {
>  	unsigned int value;
>  	int ret;
> @@ -2828,17 +2960,20 @@ static int phxtxx1_probe(struct uniwill_data *data)
>  	return 0;
>  };
>  
> -static struct uniwill_device_descriptor phxtxx1_descriptor __initdata = {
> +static struct uniwill_device_descriptor phxtuxx_phxtrxx_descriptor __initdata = {
>  	.features = UNIWILL_FEATURE_FN_LOCK |
>  		    UNIWILL_FEATURE_SUPER_KEY |
>  		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>  		    UNIWILL_FEATURE_CPU_TEMP |
>  		    UNIWILL_FEATURE_PRIMARY_FAN |
> -		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> -	.probe = phxtxx1_probe,
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color = true,
> +	.kbd_led_max_brightness = 2,
> +	.probe = phxtuxx_phxtrxx_probe,
>  };
>  
> -static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
> +static int phxarxx_phxaqxx_probe(struct uniwill_data *data)
>  {
>  	unsigned int value;
>  	int ret;
> @@ -2854,22 +2989,28 @@ static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
>  	return 0;
>  };
>  
> -static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __initdata = {
> +static struct uniwill_device_descriptor phxarxx_phxaqxx_descriptor __initdata = {
>  	.features = UNIWILL_FEATURE_FN_LOCK |
>  		    UNIWILL_FEATURE_SUPER_KEY |
>  		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>  		    UNIWILL_FEATURE_CPU_TEMP |
>  		    UNIWILL_FEATURE_PRIMARY_FAN |
>  		    UNIWILL_FEATURE_SECONDARY_FAN |
> -		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> -	.probe = phxarx1_phxaqf1_probe,
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color = true,
> +	.kbd_led_max_brightness = 2,
> +	.probe = phxarxx_phxaqxx_probe,
>  };
>  
> -static struct uniwill_device_descriptor pf5pu1g_descriptor __initdata = {
> +static struct uniwill_device_descriptor pfxpuxx_descriptor __initdata = {
>  	.features = UNIWILL_FEATURE_FN_LOCK |
>  		    UNIWILL_FEATURE_SUPER_KEY |
>  		    UNIWILL_FEATURE_CPU_TEMP |
> -		    UNIWILL_FEATURE_PRIMARY_FAN,
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color = true,
> +	.kbd_led_max_brightness = 2,
>  };
>  
>  static struct uniwill_device_descriptor x4sp4nal_descriptor __initdata = {
> @@ -2964,7 +3105,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
>  		},
> -		.driver_data = &phxtxx1_descriptor,
> +		.driver_data = &phxtuxx_phxtrxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> @@ -2972,7 +3113,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>  		},
> -		.driver_data = &tux_featureset_2_nvidia_descriptor,
> +		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -2980,7 +3121,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>  		},
> -		.driver_data = &phxarx1_phxaqf1_descriptor,
> +		.driver_data = &phxarxx_phxaqxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Book Pro Gen 7",
> @@ -2988,7 +3129,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>  		},
> -		.driver_data = &tux_featureset_2_nvidia_descriptor,
> +		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
> @@ -2996,7 +3137,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
>  		},
> -		.driver_data = &tux_featureset_1_descriptor,
> +		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
> @@ -3004,7 +3145,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>  		},
> -		.driver_data = &tux_featureset_2_nvidia_descriptor,
> +		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -3012,7 +3153,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>  		},
> -		.driver_data = &tux_featureset_2_nvidia_descriptor,
> +		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -3020,7 +3161,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
>  		},
> -		.driver_data = &tux_featureset_4_descriptor,
> +		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
> @@ -3028,7 +3169,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
>  		},
> -		.driver_data = &tux_featureset_4_descriptor,
> +		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -3036,7 +3177,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
>  		},
> -		.driver_data = &tux_featureset_4_descriptor,
> +		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -3044,7 +3185,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
>  		},
> -		.driver_data = &tux_featureset_4_descriptor,
> +		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 15 Gen10 Intel",
> @@ -3052,7 +3193,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
>  		},
> -		.driver_data = &tux_featureset_4_descriptor,
> +		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Max 15 Gen10 AMD",
> @@ -3060,7 +3201,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -3068,7 +3209,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -3076,7 +3217,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Max 15 Gen10 Intel",
> @@ -3084,7 +3225,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO InfinityBook Max 16 Gen10 Intel",
> @@ -3092,7 +3233,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 15 Gen1 AMD",
> @@ -3100,7 +3241,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
>  		},
> -		.driver_data = &tux_featureset_1_nvidia_descriptor,
> +		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 15 Gen1 AMD",
> @@ -3108,7 +3249,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
>  		},
> -		.driver_data = &tux_featureset_1_nvidia_descriptor,
> +		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 17 Gen1 AMD",
> @@ -3116,7 +3257,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
>  		},
> -		.driver_data = &tux_featureset_1_nvidia_descriptor,
> +		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 17 Gen1 AMD",
> @@ -3124,7 +3265,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
>  		},
> -		.driver_data = &tux_featureset_1_nvidia_descriptor,
> +		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 15 Gen1 Intel",
> @@ -3132,7 +3273,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
>  		},
> -		.driver_data = &tux_featureset_1_nvidia_descriptor,
> +		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 15 Gen1 Intel",
> @@ -3140,7 +3281,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
>  		},
> -		.driver_data = &tux_featureset_1_nvidia_descriptor,
> +		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 17 Gen1 Intel",
> @@ -3148,7 +3289,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
>  		},
> -		.driver_data = &tux_featureset_1_nvidia_descriptor,
> +		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 17 Gen1 Intel",
> @@ -3156,7 +3297,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
>  		},
> -		.driver_data = &tux_featureset_1_nvidia_descriptor,
> +		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Trinity 15 Intel Gen1",
> @@ -3164,7 +3305,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
>  		},
> -		.driver_data = &tux_featureset_1_nvidia_descriptor,
> +		.driver_data = &gmxmpxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Trinity 17 Intel Gen1",
> @@ -3172,7 +3313,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
>  		},
> -		.driver_data = &tux_featureset_1_nvidia_descriptor,
> +		.driver_data = &gmxmpxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 15/17 Gen2 AMD",
> @@ -3180,7 +3321,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>  		},
> -		.driver_data = &tux_featureset_2_nvidia_descriptor,
> +		.driver_data = &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -3188,23 +3329,39 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>  		},
> -		.driver_data = &tux_featureset_2_nvidia_descriptor,
> +		.driver_data = &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
> +	},
> +	{
> +		.ident = "TUXEDO Polaris 15/17 Gen3 AMD",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "POLARIS1XA03"),
> +		},
> +		.driver_data = &gmxzgxx_gmxtgxx_pol_descriptor,
> +	},
> +	{
> +		.ident = "TUXEDO Polaris 15/17 Gen3 Intel",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "POLARIS1XI03"),
> +		},
> +		.driver_data = &gmxzgxx_gmxtgxx_pol_descriptor,
>  	},
>  	{
> -		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> +		.ident = "TUXEDO Stellaris 15/17 Gen3 AMD",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> -			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "STELLARIS1XA03"),
>  		},
> -		.driver_data = &tux_featureset_2_nvidia_descriptor,
> +		.driver_data = &gmxzgxx_gmxtgxx_ste_descriptor,
>  	},
>  	{
> -		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> +		.ident = "TUXEDO Stellaris 15/17 Gen3 Intel",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> -			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "STELLARIS1XI03"),
>  		},
> -		.driver_data = &tux_featureset_2_nvidia_descriptor,
> +		.driver_data = &gmxzgxx_gmxtgxx_ste_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -3212,7 +3369,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>  		},
> -		.driver_data = &tux_featureset_3_nvidia_descriptor,
> +		.driver_data = &gmxrgxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -3220,7 +3377,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>  		},
> -		.driver_data = &tux_featureset_3_nvidia_descriptor,
> +		.driver_data = &gmxagxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -3228,7 +3385,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>  		},
> -		.driver_data = &tux_featureset_2_nvidia_descriptor,
> +		.driver_data = &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -3236,7 +3393,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>  		},
> -		.driver_data = &tux_featureset_3_nvidia_descriptor,
> +		.driver_data = &gmxxgxx_gmxpxxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
> @@ -3244,7 +3401,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>  		},
> -		.driver_data = &tux_featureset_3_nvidia_descriptor,
> +		.driver_data = &gmxxgxx_gmxpxxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -3252,7 +3409,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxhgxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 15 Gen6",
> @@ -3260,7 +3417,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -3268,7 +3425,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -3276,7 +3433,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -3284,7 +3441,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -3292,7 +3449,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -3300,7 +3457,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -3308,7 +3465,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>  		},
> -		.driver_data = &tux_featureset_4_nvidia_descriptor,
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Book BA15 Gen10 AMD",
> @@ -3316,7 +3473,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
>  		},
> -		.driver_data = &pf5pu1g_descriptor,
> +		.driver_data = &pfxpuxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Pulse 14 Gen1 AMD",
> @@ -3324,7 +3481,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
>  		},
> -		.driver_data = &tux_featureset_1_descriptor,
> +		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Pulse 15 Gen1 AMD",
> @@ -3332,7 +3489,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
>  		},
> -		.driver_data = &tux_featureset_1_descriptor,
> +		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
>  	},
>  	{
>  		.ident = "TUXEDO Pulse 15 Gen2 AMD",
> @@ -3340,7 +3497,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
>  		},
> -		.driver_data = &tux_featureset_1_descriptor,
> +		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
>  	},
>  	{ }
>  };
> 
