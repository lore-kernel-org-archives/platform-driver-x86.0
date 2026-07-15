Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6553749F2;
	Wed, 15 Jul 2026 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128357; cv=none; b=A3u41o7Ts9nxZciAPYjqIoeINpvoLYtdDjtGdYm2Wwq151DkbDcvPbtqLq5X+IITcDs1kbcVc7Hlpzpse6isqzBiZqQ8ahin9L8maSLjnn3n+KC2KOaqfvIsVnOQFg+qdW8JHHSlYoo1eaggujVs7q1qpl/s2Hje20Ys8np0a5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128357; c=relaxed/simple;
	bh=iz/Fi36u3SjC/XQRxdVYpdJ5aaaygwQpCJuQ9dRxWMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctnh8lwa8JO/8Bk0TByjaukOSqBn6ecD4IwqTIlZ9gidgzs0dBTyRhjy+gFRx0sLgOln44qxcGKQh2LvyXPNC8EL257rIZiiNK2GUuP5CxExPR+HvmVeTFz0gzrIo/4mOYf4TPCduzlAyT8SFpzgpOUPdJvnm9QrxRHpKZ9NlKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=lVBEt5FE; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="lVBEt5FE"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id CEF032FC005F;
	Wed, 15 Jul 2026 17:12:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1784128345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRQD1ed802szdYMKBbbDDgPILyFUyetizov3+yUdTE8=;
	b=lVBEt5FEEAEgcUrOoiAH5anMUuUeQ2mMaKsoPdus8zXvLjX/plKa7ex69pN34Ej6IaNC7j
	68Ll48p9Eg11OZ4zz9AqCBj9lNMg+YsilNZgdmQULR7AcSK1eSvuQMH+nRY1ZtpRwe3x7V
	d7OrGDGxea7oZvkhUjezUKuGCaLq7uE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <71c069d2-ad9f-499f-93b4-93c2140b5454@tuxedocomputers.com>
Date: Wed, 15 Jul 2026 17:12:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] platform/x86: uniwill-laptop: Split
 uniwill_kbd_led_init()
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710223544.49602-1-W_Armin@gmx.de>
 <20260710223544.49602-2-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260710223544.49602-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 11.07.26 um 00:35 schrieb Armin Wolf:
> The function uniwill_kbd_led_init() is quite large and doing multiple
> things at once:
> - general hardware initialisation
> - single color keyboard backlight registration
> - RGB keyboard backlight registration
>
> Move the last two things into separate functions to increase the
> maintainability of uniwill_kbd_led_init().
>
> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 123 +++++++++++---------
>   1 file changed, 70 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 310445583832..d27f316800f6 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1733,7 +1733,24 @@ static enum led_brightness uniwill_kbd_led_mc_brightness_get(struct led_classdev
>   	return uniwill_kbd_led_read_brightness(data);
>   }
>   
> -static int uniwill_kbd_led_init(struct uniwill_data *data)
> +static int uniwill_white_kbd_led_init(struct uniwill_data *data)
> +{
> +	struct led_init_data init_data = {
> +		.default_label = "white:" LED_FUNCTION_KBD_BACKLIGHT,
> +		.devicename = DRIVER_NAME,
> +		.devname_mandatory = true,
> +	};
> +
> +	data->kbd_led_cdev.max_brightness = data->kbd_led_max_brightness;
> +	data->kbd_led_cdev.color = LED_COLOR_ID_WHITE;
> +	data->kbd_led_cdev.flags = LED_BRIGHT_HW_CHANGED | LED_REJECT_NAME_CONFLICT;
> +	data->kbd_led_cdev.brightness_set_blocking = uniwill_kbd_led_brightness_set;
> +	data->kbd_led_cdev.brightness_get = uniwill_kbd_led_brightness_get;
> +
> +	return devm_led_classdev_register_ext(data->dev, &data->kbd_led_cdev, &init_data);
> +}
> +
> +static int uniwill_rgb_kbd_led_init(struct uniwill_data *data)
>   {
>   	unsigned int color_indices[KBD_LED_CHANNELS] = {
>   		LED_COLOR_ID_RED,
> @@ -1741,6 +1758,7 @@ static int uniwill_kbd_led_init(struct uniwill_data *data)
>   		LED_COLOR_ID_BLUE,
>   	};
>   	struct led_init_data init_data = {
> +		.default_label = "multicolor:" LED_FUNCTION_KBD_BACKLIGHT,
>   		.devicename = DRIVER_NAME,
>   		.devname_mandatory = true,
>   	};
> @@ -1749,57 +1767,6 @@ static int uniwill_kbd_led_init(struct uniwill_data *data)
>   	unsigned int regval;
>   	int ret;
>   
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
> -		return 0;
> -
> -	ret = regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &regval);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (!(regval & CHINA_MODE)) {
> -		ret = regmap_set_bits(data->regmap, EC_ADDR_BIOS_OEM_2, ENABLE_CHINA_MODE);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> -	ret = regmap_read(data->regmap, EC_ADDR_KBD_STATUS, &regval);
> -	if (ret < 0)
> -		return ret;
> -
> -	regval |= KBD_APPLY;
> -	regval &= ~KBD_POWER_OFF;
> -	ret = regmap_write(data->regmap, EC_ADDR_KBD_STATUS, regval);
> -	if (ret < 0)
> -		return ret;
> -
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
> -	if (data->single_color_kbd) {
> -		init_data.default_label = "white:" LED_FUNCTION_KBD_BACKLIGHT;
> -		data->kbd_led_cdev.max_brightness = data->kbd_led_max_brightness;
> -		data->kbd_led_cdev.color = LED_COLOR_ID_WHITE;
> -		data->kbd_led_cdev.flags = LED_BRIGHT_HW_CHANGED | LED_REJECT_NAME_CONFLICT;
> -		data->kbd_led_cdev.brightness_set_blocking = uniwill_kbd_led_brightness_set;
> -		data->kbd_led_cdev.brightness_get = uniwill_kbd_led_brightness_get;
> -
> -		return devm_led_classdev_register_ext(data->dev, &data->kbd_led_cdev, &init_data);
> -	}
> -
>   	for (int i = 0; i < KBD_LED_CHANNELS; i++) {
>   		data->kbd_led_mc_subled_info[i].color_index = color_indices[i];
>   
> @@ -1851,7 +1818,6 @@ static int uniwill_kbd_led_init(struct uniwill_data *data)
>   	if (ret < 0)
>   		return ret;
>   
> -	init_data.default_label = "multicolor:" LED_FUNCTION_KBD_BACKLIGHT;
>   	data->kbd_led_mc_cdev.led_cdev.max_brightness = data->kbd_led_max_brightness;
>   	data->kbd_led_mc_cdev.led_cdev.color = LED_COLOR_ID_MULTI;
>   	data->kbd_led_mc_cdev.led_cdev.flags = LED_BRIGHT_HW_CHANGED | LED_REJECT_NAME_CONFLICT;
> @@ -1864,6 +1830,57 @@ static int uniwill_kbd_led_init(struct uniwill_data *data)
>   							 &init_data);
>   }
>   
> +static int uniwill_kbd_led_init(struct uniwill_data *data)
> +{
> +	unsigned int regval;
> +	int ret;
> +
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
> +		return 0;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &regval);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!(regval & CHINA_MODE)) {
> +		ret = regmap_set_bits(data->regmap, EC_ADDR_BIOS_OEM_2, ENABLE_CHINA_MODE);
> +		if (ret < 0)
> +			return ret;
> +	}

I forgot again what this china mode bit is doing?

But overall:

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

> +
> +	ret = regmap_read(data->regmap, EC_ADDR_KBD_STATUS, &regval);
> +	if (ret < 0)
> +		return ret;
> +
> +	regval |= KBD_APPLY;
> +	regval &= ~KBD_POWER_OFF;
> +	ret = regmap_write(data->regmap, EC_ADDR_KBD_STATUS, regval);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (data->project_id) {
> +	case PROJECT_ID_PF:
> +	case PROJECT_ID_PF4MU_PF4MN_PF5MU:
> +	case PROJECT_ID_PH4TRX1:
> +	case PROJECT_ID_PH4TUX1:
> +	case PROJECT_ID_PH4TQX1:
> +	case PROJECT_ID_PH6TRX1:
> +	case PROJECT_ID_PH6TQXX:
> +	case PROJECT_ID_PHXAXXX:
> +	case PROJECT_ID_PHXPXXX:
> +		data->single_color_kbd = true;
> +		break;
> +	default:
> +		data->single_color_kbd = regval & KBD_WHITE_ONLY;
> +		break;
> +	}
> +
> +	if (data->single_color_kbd)
> +		return uniwill_white_kbd_led_init(data);
> +
> +	return uniwill_rgb_kbd_led_init(data);
> +}
> +
>   static unsigned int uniwill_sanitize_battery_threshold(unsigned int value)
>   {
>   	/* 0 means "charging threshold not active" */
