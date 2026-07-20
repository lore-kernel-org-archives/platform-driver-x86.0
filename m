Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5639A062;
	Mon, 20 Jul 2026 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543335; cv=none; b=ch+KLgaGXM5/Wfi0yo7VZck/Tf/SVUibo1Rp/YNwyRDpjv33QrS/iX+LpZ/eS+PF24pVH0qoj3W2RFs4X+xIsBRFcIroBl8TVMJaGM0j0v+YbNOA04//v1+c73vUztK7j1dgILWMmGZT0OIbSA15I6jp7Jxi5bwnBHDerl4CeGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543335; c=relaxed/simple;
	bh=UNHO54Mg57NQjoH5btZekSPKyQvSpfHgHHl+8OxD2lc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lmOp6PmvhBKrGfq4RLiYZhLtNnaLuoGRn7ayq+22s4ipcNWN7Jn+5ZuaulpgTdthYfINdtuTjUlRRiNqzznN5RV5pVh8OwvqzvFgjO390555D0CGTYUhWu852EC5mMqTmDoGE/4KWscxuYWt927wqik5jojrxXRHEKGWFC/htBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ymf0Wuz3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ymf0Wuz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784543333; x=1816079333;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UNHO54Mg57NQjoH5btZekSPKyQvSpfHgHHl+8OxD2lc=;
  b=Ymf0Wuz3a/DDm3QlUSR14H0OUPgn9N5pYx8sH+vwCEpCbpwYBpZHmXH+
   CJGiAKzO3H078PtiyE7nnYGls3U+yr4zFdldJmxXvgSQjDOxhI9x7q43o
   u40wBeJh5i+0RGu7pauOWZnvirjT+UaDTBRZK/DDvvRwp59CtyJgnQT2o
   dss8NcFO3beTmAPZhNOYaznIKraPEwUVjTnk3ideN8+/kWYjzWveWGIha
   bkpypYORr4mei761ortbW0mruiD97N+/KUv8NOWLxubh1eR+zA/XPzhP5
   AfUa7coVRIDEcLmdvJd2ASVAxqYDN75KynwQ4iTTcYP/P8LbVld8o6Hrn
   Q==;
X-CSE-ConnectionGUID: mHIQx93eQWyxHNx22cE1Ng==
X-CSE-MsgGUID: /l63OtYiRwqFydyph9WUpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="110667987"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="110667987"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 03:28:51 -0700
X-CSE-ConnectionGUID: sBmL7U6OQxG/0kS/1Rkb2Q==
X-CSE-MsgGUID: CUN39C+wSjaSIou8CWMLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="254809576"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 03:28:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 20 Jul 2026 13:28:46 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] platform/x86: uniwill-laptop: Remove single color
 keyboard detection
In-Reply-To: <20260716162531.5744-3-W_Armin@gmx.de>
Message-ID: <52c18172-7c80-c3d8-eccf-d52236c9dbed@linux.intel.com>
References: <20260716162531.5744-1-W_Armin@gmx.de> <20260716162531.5744-3-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jul 2026, Armin Wolf wrote:

> Having a ad-hoc device whitelist inside uniwill_kbd_led_init()
> to work around unreliable KBD_WHITE_ONLY values conflicts with
> the idea of the device descriptor infrastructure.
> 
> Remove the ad-hoc device whitelist and use the device descriptor
> infrastrcture instead.

infrastructure

> 
> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 32 +++++++--------------
>  1 file changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index d27f316800f6..4591ee299a90 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -255,6 +255,7 @@
>  #define FAN_CURVE_LENGTH		5
>  
>  #define EC_ADDR_KBD_STATUS		0x078C
> +/* Unreliable */

Please point out in the comment to the mechanism that was chosen 
to be used instead. A developer 5 years from now will be much happier if 
that information is readily given instead of a single word enigma like 
that. :-)

-- 
 i.

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
