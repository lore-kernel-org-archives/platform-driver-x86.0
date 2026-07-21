Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5503BCD21;
	Tue, 21 Jul 2026 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623465; cv=none; b=KFB8E6yXZs0LkFKBJj7GpJHSfDmW8GKjVl2GRgnPQVds4JK9zObDQZS2ES/PT+O05Br1LD2U5RXH2XYT8lptcY1lMDwesjGvj2Ss7ghiUXqBeqtSaHe62SsGqVxp8fANxZtLbz3wN5iGEyUnCbYzKK4GMEy2XC9MPRZfLrQXefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623465; c=relaxed/simple;
	bh=W9TEAFu1WR01Q1+hsS6+PnnBIiKJn6K89+gsBu7SVCQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i75jDhwCNMITBIoDOPBFDJ0Z7Q3tRNsh3HoicV6NUGTYFJLo50yMO9ZOlaoX99oeGlqPC7eKyg90BWbL+2yJMs5T6RuiC6/6wbl9LA7wOBWNYgN5+ybGmkkKI0oigZ1GW0+kFtcn3ZNrxW7znP1TpCUfo18hve3pFPRUYVn7xvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cobYaMFj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cobYaMFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784623464; x=1816159464;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=W9TEAFu1WR01Q1+hsS6+PnnBIiKJn6K89+gsBu7SVCQ=;
  b=cobYaMFjDwk7chc+tXtwNDeZZD6Y4jlTCyxzeVvBWl5n98ngkOcbMmrI
   Zf+OrYppbHbq6f4KWm6QOaRpHW+IJEp6Y9JsBHHGy2SytBQOegi11faf+
   w4rM9rPm+LSzdfVntjc5GgW+WJg6QslHnpMzZd+Cl2o4WqlQ7wOICIC2l
   7bK/9N+HQvpU/KyvlJiocqeyrRwFdwQ2OI2WVZ4YBLHbgFtt74tkZTt/W
   LRqPDMiK1kmShnq8BRUACEqLmluGMVicTjW2n8OnHUJt3+sEz6JelhGSk
   Qf1+akbfjstjhewr15398Izs5hzhNcw4CFMOVjelLVKlHuh1NuCtschzE
   w==;
X-CSE-ConnectionGUID: vOn2McNmR121rFoVtULIPg==
X-CSE-MsgGUID: K9zrpd6tTOKkkk06nE+P8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89038162"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="89038162"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 01:44:23 -0700
X-CSE-ConnectionGUID: DAaoYIc4QCWwSLmAYG2TsQ==
X-CSE-MsgGUID: eBL0+Yk3QJ++2Did6QoeXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="255062169"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 01:44:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 11:44:17 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] platform/x86: uniwill-laptop: Remove single color
 keyboard detection
In-Reply-To: <20260720132611.374073-3-W_Armin@gmx.de>
Message-ID: <c1a7a430-642b-462b-1452-14eb54b4e891@linux.intel.com>
References: <20260720132611.374073-1-W_Armin@gmx.de> <20260720132611.374073-3-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Jul 2026, Armin Wolf wrote:

> Having a ad-hoc device whitelist inside uniwill_kbd_led_init()
> to work around unreliable KBD_WHITE_ONLY values conflicts with
> the idea of the device descriptor infrastructure.
> 
> Remove the ad-hoc device whitelist and use the device descriptor
> infrastructure instead.
> 
> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 32 +++++++--------------
>  1 file changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index d27f316800f6..7a2eeaec4c96 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -255,6 +255,7 @@
>  #define FAN_CURVE_LENGTH		5
>  
>  #define EC_ADDR_KBD_STATUS		0x078C
> +/* Unreliable on some models, use the device descriptor instead. */
>  #define KBD_WHITE_ONLY			BIT(0)
>  #define KBD_POWER_OFF			BIT(1)
>  #define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
> @@ -400,7 +401,7 @@ struct uniwill_data {
>  	u8 lightbar_max_brightness;
>  	struct led_classdev_mc led_mc_cdev;
>  	struct mc_subled led_mc_subled_info[LED_CHANNELS];
> -	bool single_color_kbd;
> +	bool kbd_led_single_color;
>  	u8 kbd_led_max_brightness;
>  	unsigned int last_kbd_status;
>  	union {
> @@ -426,6 +427,7 @@ struct uniwill_battery_entry {
>  
>  struct uniwill_device_descriptor {
>  	unsigned int features;
> +	bool kbd_led_single_color;
>  	u8 kbd_led_max_brightness;
>  	u8 lightbar_max_brightness;
>  	/* Executed during driver probing */
> @@ -1629,7 +1631,7 @@ static int uniwill_notify_kbd_led(struct uniwill_data *data, int brightness)
>  	struct led_classdev *led_cdev;
>  	int ret;
>  
> -	if (data->single_color_kbd)
> +	if (data->kbd_led_single_color)
>  		led_cdev = &data->kbd_led_cdev;
>  	else
>  		led_cdev = &data->kbd_led_mc_cdev.led_cdev;
> @@ -1858,24 +1860,7 @@ static int uniwill_kbd_led_init(struct uniwill_data *data)
>  	if (ret < 0)
>  		return ret;
>  
> -	switch (data->project_id) {
> -	case PROJECT_ID_PF:
> -	case PROJECT_ID_PF4MU_PF4MN_PF5MU:
> -	case PROJECT_ID_PH4TRX1:
> -	case PROJECT_ID_PH4TUX1:
> -	case PROJECT_ID_PH4TQX1:
> -	case PROJECT_ID_PH6TRX1:
> -	case PROJECT_ID_PH6TQXX:
> -	case PROJECT_ID_PHXAXXX:
> -	case PROJECT_ID_PHXPXXX:
> -		data->single_color_kbd = true;
> -		break;
> -	default:
> -		data->single_color_kbd = regval & KBD_WHITE_ONLY;
> -		break;
> -	}
> -
> -	if (data->single_color_kbd)
> +	if (data->kbd_led_single_color)
>  		return uniwill_white_kbd_led_init(data);
>  
>  	return uniwill_rgb_kbd_led_init(data);
> @@ -2351,6 +2336,7 @@ static int uniwill_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	data->features = device_descriptor.features;
> +	data->kbd_led_single_color = device_descriptor.kbd_led_single_color;
>  	data->kbd_led_max_brightness = device_descriptor.kbd_led_max_brightness;
>  	data->lightbar_max_brightness = device_descriptor.lightbar_max_brightness;
>  
> @@ -2580,7 +2566,7 @@ static int uniwill_resume_kbd_led(struct uniwill_data *data)
>  	if (ret < 0)
>  		return ret;
>  
> -	if (data->single_color_kbd)
> +	if (data->kbd_led_single_color)
>  		return 0;
>  
>  	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_COLOR, RGB_APPLY_COLOR);
> @@ -2687,6 +2673,7 @@ static struct uniwill_device_descriptor machenike_l16p_descriptor __initdata = {
>  		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
>  		    UNIWILL_FEATURE_AC_AUTO_BOOT |
>  		    UNIWILL_FEATURE_USB_POWERSHARE,
> +	.kbd_led_single_color = false,
>  	.kbd_led_max_brightness = 4,
>  };
>  
> @@ -2869,6 +2856,7 @@ static struct uniwill_device_descriptor x4sp4nal_descriptor __initdata = {
>  		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
>  		    UNIWILL_FEATURE_AC_AUTO_BOOT |
>  		    UNIWILL_FEATURE_USB_POWERSHARE,
> +	.kbd_led_single_color = true,
>  	.kbd_led_max_brightness = 2,
>  };
>  
> @@ -3363,6 +3351,8 @@ static int __init uniwill_init(void)
>  	if (force) {
>  		/* Assume that the device supports all features except the charge limit */
>  		device_descriptor.features = UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT;
> +		/* Some models only have a (white) single color keyboard backlight */
> +		device_descriptor.kbd_led_single_color = false;
>  		/* Some models only support 3 brightness levels */
>  		device_descriptor.kbd_led_max_brightness = 4;
>  		/* Some models only support 36 brightness levels per color component */
> 

Hi Armin,

I've applied this series now to the review-ilpo-next branch.
 
You may want to check if you still need/want to store project_id (sashiko
mentioned it's no longer used). If you want it gone, just send another 
patch.

-- 
 i.

