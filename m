Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90073769E5;
	Thu, 16 Jul 2026 16:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219342; cv=none; b=KttTPVRV9ljb6xcsR7Pcq+p38qSB9eMLpy9rE2yQy3cznK+sCb8c/Knldyz0KlHFQPYw/nLllltcruNKotBC310AyzHgjXpNNTKw0wceEgtdxOcTdtjUZSaseLYK47GUwjVi3REEDqtvHbRw7Yyz4eABgKa+i6qtcyJuoQ+2ITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219342; c=relaxed/simple;
	bh=fTSkV3vNvEK54NcrzPjkDS7SCUgiR4JfpvnuR6xW2a8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rw6ynkj7VNzA/qpm7Kewhz0sw93+lAaRHPHhG9MN4mB4N1vn13PbpRTGNlZD1tuubXJ3I3GsP5GRH10UoZx9Tm5qdkDtygi5hWupa2nstpRof7R0hYQOVk9XLD0h7raPcOVE2eSrtQdLuGFIX/R/g+rhwfSc8x3JmipcD5cA1NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=XLmTmUG+; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XLmTmUG+"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 82B3C2FC0071;
	Thu, 16 Jul 2026 18:28:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1784219336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHhjkXyig0aI573ACQf4Bn14zHZBz9l6q1WjyOueJ9s=;
	b=XLmTmUG+dLtfNFBMczmKqj7oBNxsxt55FkA9m98VOqTNUANf6Hll2gF8xyX8+lDAzTyK9Y
	ELEh/xTxULwVZod5sVVCDX/vMVTshtB0LGTX9+Efs3A7nO76dzxVstpE9CWEC9xdnZoTQo
	bA/0Bw0MTg5snT12lB6CXk5WOxVUk9c=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <08baae66-b484-49d0-bce4-78622d5f1ea2@tuxedocomputers.com>
Date: Thu, 16 Jul 2026 18:28:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] platform/x86: uniwill-laptop: Remove single color
 keyboard detection
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260716162531.5744-1-W_Armin@gmx.de>
 <20260716162531.5744-3-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260716162531.5744-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 16.07.26 um 18:25 schrieb Armin Wolf:
> Having a ad-hoc device whitelist inside uniwill_kbd_led_init()
> to work around unreliable KBD_WHITE_ONLY values conflicts with
> the idea of the device descriptor infrastructure.
>
> Remove the ad-hoc device whitelist and use the device descriptor
> infrastrcture instead.
>
> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

lgtm

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

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
