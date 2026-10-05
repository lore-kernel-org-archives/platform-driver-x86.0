Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4797A3033D8
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219713; cv=none; b=URXXBKcRhKFWSnJD83ymYIWsXLEQZtEds1apwVsDD3rFHckfJMA75Gp0+ho33t2C1eTm5M55/FNbyT1+10t9YDnRzZ1XST1yef+M3egoO80dSDD0FYd0WXA31/D86ICHHjP1ZDdBXqfSdZHkGTIFmQR5FqrbbZdogQkW6VvnGxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219713; c=relaxed/simple;
	bh=4HUmuSxP1eCWuxJQ4EZpDJ4SjeYe4nFas2Gpp4sjjNs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Dy9O/+u/BRjn+rSpvZCLZa/8Gqux6bv92OGwbeW5G++qrLJuCNgUGIWDVCLMVmymjIigLNNvsfyajrqRxV87/KLgiMfmrtvQ8SETw+pWCnRMEHqFMkyXKLrECGphs7yLQmTLmslzuIgHy3H2DwMVHAGzxRMJX94oe9qsFXW6qFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBdOx0da; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBdOx0da"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791219711; x=1822755711;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4HUmuSxP1eCWuxJQ4EZpDJ4SjeYe4nFas2Gpp4sjjNs=;
  b=kBdOx0dat2G1pryPpcyOYXTObiv6pa42HAKxO4TltBQInlIvFq6VHupe
   lyYQ/hrtku6CWejllZ0FMuUnNV0QDbqmRdrb+Xvl629NVxbkptQ6TgnEU
   46rtr5L46vb78Sqb5l7hezhQdoAx1IWK54C6FP0CwNK+XuWFOHqSoV1z/
   OvhwvhWxFAxVW45W77FmsZasxVpQc/cC3xL7cB29QrmXb855h2cT4JNQT
   VL6HpFCADEhfrgXSP3ESiXCPiy2j6rkAQvDd1BDpTL37C1K13yG8X9SzV
   4j2f08lCBhrvKzdUzoUTacNOU7z3MbiisX3OrdKiIxXdxKDitwlkVXIU3
   A==;
X-CSE-ConnectionGUID: H0FoWnn7TD2JM5Me8dAP+Q==
X-CSE-MsgGUID: TXbeBcDbRSm49djelpUoLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102567122"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="102567122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:01:50 -0700
X-CSE-ConnectionGUID: 2SGYOvOgQmKIOd6f/9jduA==
X-CSE-MsgGUID: 8DR7d5DtSFekBgVicFx7Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="306379754"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:01:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Oct 2026 20:01:45 +0300 (EEST)
To: Lucas Gillard <mirsella1@gmail.com>
cc: platform-driver-x86@vger.kernel.org, jlee@suse.com, 
    Hans de Goede <hansg@kernel.org>, W_Armin@gmx.de
Subject: Re: [PATCH] platform/x86: acer-wmi: support PH317-51 hwmon and kbd
 backlight
In-Reply-To: <6aad63a9.f9180b46.32931.492b@mx.google.com>
Message-ID: <ea6d7395-c70f-9346-fc3f-9465adb5fef1@linux.intel.com>
References: <6aad63a9.f9180b46.32931.492b@mx.google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Sep 2026, Lucas Gillard wrote:

> The Predator Helios 300 PH317-51 (2017) has the Predator gaming WMI
> interface, but an early revision of it. Sensor queries and fan control
> answer; the platform-profile and OC methods (22/23) do not exist. So it
> gets a quirk that turns on HWMON without predator_v4.
> 
> The keyboard backlight has no WMI method behind it on this machine. I
> probed the LED methods (2/4) every way I could and they neither report
> nor change its state. The EC owns it instead, in RAM at 0x30/0x31, the
> same bytes Fn+F9 flips. The read hook reports the live EC value, so the
> Fn key and sysfs never disagree.
> 
> The code is mine, written with help from an AI coding assistant to
> understand the codebase and how this kind of change is usually done;
> this is my first kernel contribution. I verified every behavior
> claimed here myself, on the machine.
> 
> Tested on a PH317-51: both temperatures, both fans, and the light going
> on and off from sysfs.
> 
> Signed-off-by: Lucas Gillard <mirsella1@gmail.com>
> Assisted-by: LLM
> ---
>  drivers/platform/x86/acer-wmi.c | 87 +++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 61ae622..f14b6e4 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -310,6 +310,7 @@ struct hotkey_function_type_aa {
>  #define ACER_CAP_PLATFORM_PROFILE	BIT(10)
>  #define ACER_CAP_HWMON			BIT(11)
>  #define ACER_CAP_PWM			BIT(12)
> +#define ACER_CAP_KBD_BACKLIGHT		BIT(13)
>  
>  /*
>   * Interface type flags
> @@ -359,6 +360,7 @@ struct acer_data {
>  	int mailled;
>  	int threeg;
>  	int brightness;
> +	int kbd_backlight;
>  };
>  
>  struct acer_debug {
> @@ -405,6 +407,8 @@ struct quirk_entry {
>  	u8 gpu_fans;
>  	u8 predator_v4;
>  	u8 pwm;
> +	u8 hwmon;
> +	u8 kbd_backlight;

Can you please base this on my repo where predator_v4 is already split.

>  };
>  
>  static struct quirk_entry *quirks;
> @@ -425,6 +429,12 @@ static void __init set_quirks(void)
>  		interface->capability |= ACER_CAP_PLATFORM_PROFILE |
>  					 ACER_CAP_HWMON;
>  
> +	if (quirks->hwmon)
> +		interface->capability |= ACER_CAP_HWMON;
> +
> +	if (quirks->kbd_backlight)
> +		interface->capability |= ACER_CAP_KBD_BACKLIGHT;
> +
>  	if (quirks->pwm)
>  		interface->capability |= ACER_CAP_PWM;
>  }
> @@ -466,6 +476,12 @@ static struct quirk_entry quirk_acer_predator_ph315_53 = {
>  	.gpu_fans = 1,
>  };
>  
> +/* Firmware lacks the profile/OC methods, so no predator_v4. */
> +static struct quirk_entry quirk_acer_predator_ph317_51 = {
> +	.hwmon = 1,
> +	.kbd_backlight = 1,
> +};
> +
>  static struct quirk_entry quirk_acer_predator_ph16_72 = {
>  	.turbo = 1,
>  	.cpu_fans = 1,
> @@ -671,6 +687,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
>  		},
>  		.driver_data = &quirk_acer_predator_ph315_53,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "Acer Predator PH317-51",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Predator PH317-51"),
> +		},
> +		.driver_data = &quirk_acer_predator_ph317_51,
> +	},
>  	{
>  		.callback = dmi_matched,
>  		.ident = "Acer Predator PHN16-71",
> @@ -1947,6 +1972,45 @@ static void acer_led_exit(void)
>  	led_classdev_unregister(&mail_led);
>  }
>  
> +/*
> + * No WMI method drives the backlight on this model; the EC keeps the
> + * state mirrored in both 0x30 and 0x31, so write both.
> + */
> +static void kbd_led_set(struct led_classdev *led_cdev,
> +			enum led_brightness value)
> +{
> +	value = !!value;

Please make non-enum local variable and do not rely on !! (that relates to 
truth values) but use e.g. elvis operator to explicitly set the value you 
want to write.

> +	ec_write(0x30, value);
> +	ec_write(0x31, value);

Don't use literals but name these with defines.

> +}
> +
> +static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> +{
> +	u8 result;
> +
> +	if (ec_read(0x30, &result))

Ditto.

> +		return LED_OFF;
> +	return (result & 0x1) ? LED_ON : LED_OFF;

Name the literal with a define ?

Extra parenthesis.

> +}
> +
> +static struct led_classdev kbd_led = {
> +	.name = "acer-wmi::kbd_backlight",
> +	.brightness_set = kbd_led_set,
> +	.brightness_get = kbd_led_get,
> +	.max_brightness = 1,
> +};
> +
> +static int acer_kbd_led_init(struct device *dev)
> +{
> +	return led_classdev_register(dev, &kbd_led);
> +}
> +
> +static void acer_kbd_led_exit(void)
> +{
> +	kbd_led_set(&kbd_led, LED_OFF);
> +	led_classdev_unregister(&kbd_led);

I don't see other drivers turning the LED off on unregister (there's just 
one exception that is in this same driver).

> +}
> +
>  /*
>   * Backlight device
>   */
> @@ -2799,8 +2863,15 @@ static int acer_platform_probe(struct platform_device *device)
>  			goto error_hwmon;
>  	}
>  
> +	if (has_cap(ACER_CAP_KBD_BACKLIGHT)) {
> +		err = acer_kbd_led_init(&device->dev);
> +		if (err)
> +			goto error_kbd_backlight;
> +	}
> +
>  	return 0;
>  
> +error_kbd_backlight:
>  error_hwmon:
>  error_platform_profile:
>  	acer_rfkill_exit();
> @@ -2816,6 +2887,8 @@ static int acer_platform_probe(struct platform_device *device)
>  
>  static void acer_platform_remove(struct platform_device *device)
>  {
> +	if (has_cap(ACER_CAP_KBD_BACKLIGHT))
> +		acer_kbd_led_exit();
>  	if (has_cap(ACER_CAP_MAILLED))
>  		acer_led_exit();
>  	if (has_cap(ACER_CAP_BRIGHTNESS))
> @@ -2844,6 +2917,14 @@ static int acer_suspend(struct device *dev)
>  		data->brightness = value;
>  	}
>  
> +	if (has_cap(ACER_CAP_KBD_BACKLIGHT)) {
> +		u8 state;
> +
> +		if (!ec_read(0x30, &state))
> +			data->kbd_backlight = state & 0x1;

Use the same defines here as well.

> +		kbd_led_set(&kbd_led, LED_OFF);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -2860,6 +2941,9 @@ static int acer_resume(struct device *dev)
>  	if (has_cap(ACER_CAP_BRIGHTNESS))
>  		set_u32(data->brightness, ACER_CAP_BRIGHTNESS);
>  
> +	if (has_cap(ACER_CAP_KBD_BACKLIGHT))
> +		kbd_led_set(&kbd_led, data->kbd_backlight);
> +
>  	if (acer_wmi_accel_dev)
>  		acer_gsensor_init();
>  
> @@ -2881,6 +2965,9 @@ static void acer_platform_shutdown(struct platform_device *device)
>  
>  	if (has_cap(ACER_CAP_MAILLED))
>  		set_u32(LED_OFF, ACER_CAP_MAILLED);
> +
> +	if (has_cap(ACER_CAP_KBD_BACKLIGHT))
> +		kbd_led_set(&kbd_led, LED_OFF);
>  }
>  
>  static struct platform_driver acer_platform_driver = {
> 

-- 
 i.

