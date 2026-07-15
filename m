Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20B92BE026;
	Wed, 15 Jul 2026 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128600; cv=none; b=OxKatcg6hTEn5mHUqd9SkNqhbbFgYTQxqram4p5GtwLYMtfa0inV0AOhfHJFUxzG3uA5Y0lgIez7yG/DzT+0lrzo2m/TsFe1xdvkwPugCo0UpA95zQapoBhTYnbBMcVs7QDy0iqcHoFSAHFbxJz6tbcEDfslsjOOFyIzcZuujns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128600; c=relaxed/simple;
	bh=fZbjXxwu5VPQyZC19YSKFXKPs+DxZbqXyoj/EkEJNj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dT5kA8YhhTI8HVTgEZ4S4Fx076qGdbOovzOIOeuOLRo+eEbSMNuzEu9NcmpKbysCoqoZzJxtzJQVx9qSXjevSppSD0cE5HV/Nzzn6O7M5kCw5emJ+wap4aoUXhVgOirCO/1sR5nUCzqR7uaKcyTk/8xLjANA1wYm/wybT3qbegc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=nfJJSSoE; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="nfJJSSoE"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id F38F82FC0065;
	Wed, 15 Jul 2026 17:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1784128594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPkq/jxiXGai7g5mVSOsMP11jmrSM0R2xqkpob6fGn0=;
	b=nfJJSSoEuDsqx/HJdHK2NGxa/ebqeBzllzey5915zn4wIIor8Ll4qnYJL37qtS6ld1u2/e
	/kZtioH9jycCtTeNbM9Syh1R2slzEADmaCWgsQ1O6noqtOIegkURIUJ8aUniUJa3lkA+Co
	LkHcRIABwfA5lGQ8f85447kaopaoZ0k=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <7efb476a-673e-46e3-9845-dcedca76c63a@tuxedocomputers.com>
Date: Wed, 15 Jul 2026 17:16:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform/x86: uniwill-laptop: Remove single color
 keyboard detection
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710223544.49602-1-W_Armin@gmx.de>
 <20260710223544.49602-3-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260710223544.49602-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 11.07.26 um 00:35 schrieb Armin Wolf:
> It turns out that the code for detecting single color keyboards
> might not work correctly on future models. Remove it and use the
> device descriptor instead.
Technically: It already doesn't work reliable on old devices, that's why the 
device list inside the init function was required. This patch is basically to 
move this to the device_descriptor struct that is already present.
>
> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 32 +++++++--------------
>   1 file changed, 11 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index d27f316800f6..4591ee299a90 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -255,6 +255,7 @@
>   #define FAN_CURVE_LENGTH		5
>   
>   #define EC_ADDR_KBD_STATUS		0x078C
> +/* Unreliable */
>   #define KBD_WHITE_ONLY			BIT(0)
>   #define KBD_POWER_OFF			BIT(1)
>   #define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
> @@ -400,7 +401,7 @@ struct uniwill_data {
>   	u8 lightbar_max_brightness;
>   	struct led_classdev_mc led_mc_cdev;
>   	struct mc_subled led_mc_subled_info[LED_CHANNELS];
> -	bool single_color_kbd;
> +	bool kbd_led_single_color;
>   	u8 kbd_led_max_brightness;
>   	unsigned int last_kbd_status;
>   	union {
> @@ -426,6 +427,7 @@ struct uniwill_battery_entry {
>   
>   struct uniwill_device_descriptor {
>   	unsigned int features;
> +	bool kbd_led_single_color;

Why do this as a bool instead of a UNIWILL_FEATURE_* define? We already have 
mutually exclusive UNIWILL_FEATURE_* defines for the charging modes.

Best regards

Werner

>   	u8 kbd_led_max_brightness;
>   	u8 lightbar_max_brightness;
>   	/* Executed during driver probing */
> @@ -1629,7 +1631,7 @@ static int uniwill_notify_kbd_led(struct uniwill_data *data, int brightness)
>   	struct led_classdev *led_cdev;
>   	int ret;
>   
> -	if (data->single_color_kbd)
> +	if (data->kbd_led_single_color)
>   		led_cdev = &data->kbd_led_cdev;
>   	else
>   		led_cdev = &data->kbd_led_mc_cdev.led_cdev;
> @@ -1858,24 +1860,7 @@ static int uniwill_kbd_led_init(struct uniwill_data *data)
>   	if (ret < 0)
>   		return ret;
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
>   		return uniwill_white_kbd_led_init(data);
>   
>   	return uniwill_rgb_kbd_led_init(data);
> @@ -2351,6 +2336,7 @@ static int uniwill_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	data->features = device_descriptor.features;
> +	data->kbd_led_single_color = device_descriptor.kbd_led_single_color;
>   	data->kbd_led_max_brightness = device_descriptor.kbd_led_max_brightness;
>   	data->lightbar_max_brightness = device_descriptor.lightbar_max_brightness;
>   
> @@ -2580,7 +2566,7 @@ static int uniwill_resume_kbd_led(struct uniwill_data *data)
>   	if (ret < 0)
>   		return ret;
>   
> -	if (data->single_color_kbd)
> +	if (data->kbd_led_single_color)
>   		return 0;
>   
>   	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_COLOR, RGB_APPLY_COLOR);
> @@ -2687,6 +2673,7 @@ static struct uniwill_device_descriptor machenike_l16p_descriptor __initdata = {
>   		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
>   		    UNIWILL_FEATURE_AC_AUTO_BOOT |
>   		    UNIWILL_FEATURE_USB_POWERSHARE,
> +	.kbd_led_single_color = false,
>   	.kbd_led_max_brightness = 4,
>   };
>   
> @@ -2869,6 +2856,7 @@ static struct uniwill_device_descriptor x4sp4nal_descriptor __initdata = {
>   		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
>   		    UNIWILL_FEATURE_AC_AUTO_BOOT |
>   		    UNIWILL_FEATURE_USB_POWERSHARE,
> +	.kbd_led_single_color = true,
>   	.kbd_led_max_brightness = 2,
>   };
>   
> @@ -3363,6 +3351,8 @@ static int __init uniwill_init(void)
>   	if (force) {
>   		/* Assume that the device supports all features except the charge limit */
>   		device_descriptor.features = UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT;
> +		/* Some models only have a (white) single color keyboard backlight */
> +		device_descriptor.kbd_led_single_color = false;
>   		/* Some models only support 3 brightness levels */
>   		device_descriptor.kbd_led_max_brightness = 4;
>   		/* Some models only support 36 brightness levels per color component */
