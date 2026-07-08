Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A053A1A5D;
	Wed,  8 Jul 2026 20:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541332; cv=none; b=BHtLcoYHmLdZs6cvHGQPYrLIUE01sACkzu43uOK0N3UMnVnraTualxYdLZntrCnf8vMW2abKzmr4yFuAZmu87c2PYzgwQXTI3XticLiXUWnmsulMuQIH3d9SkJswaaHYkhF8vBA9Nxepb7Y4DwlI790WJgRIbsnZItOqODm5riw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541332; c=relaxed/simple;
	bh=juOCBSEgSvZ23H4Jp/YtyEVAXYbMMHg/IA5qKFVxyZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TR/dwcz+6YXbVNiCg5ttT0Qh+zrPUBhDg2RfAbSx408yif4jDowpdOWd+LaeWJElMQrzl3itj53t04FoFDsSv8dyzkcSS7Ro1/bxINuyfLgCLBQ+qxJJnX+X9OSIM6ReqwikHogQD/raOgbTmGJd14oezfhD3MWk3Idt/M4Lj1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=j0spB41w; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="j0spB41w"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 610972FC005F;
	Wed,  8 Jul 2026 22:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1783541324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+jDvFJ9nMbFUvow2lzd87Vo+VXRsdqMKbwUG1W1D+WU=;
	b=j0spB41wqAR7EA8XC1F5y2x2LeJQXRzaRcZgoK2VFkhTa0Lpw35tLCV8o3o/Y9xmUxXFWN
	6DLZwoysMJ+ayQ4UjhbvqiHmoWJRx/ZvargY7WmUtuC3kYaPmfBYgZR3qJh0nG6YAtwZUM
	2AmmJCz4khyC5mEjtFvMyMItWmrLsnY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <df32200d-d966-40fd-b8d4-60c5b7e18822@tuxedocomputers.com>
Date: Wed, 8 Jul 2026 22:08:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] platform/x86: uniwill-laptop: Add lightbar support
 for LAPQC71A/B
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260530170813.10166-1-W_Armin@gmx.de>
 <20260530170813.10166-8-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260530170813.10166-8-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ilpo,

Am 30.05.26 um 19:08 schrieb Armin Wolf:
> The LAPQC71A and LAPQC71B both feature a RGB lightbar with 36
> brightness levels per color component. Extend the device descriptor
> to supply the maximum brightness of the lightbar and whitelist
> both models for UNIWILL_FEATURE_LIGHTBAR.
>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

This patch lost its original attribution by accident (it originally came from 
this RFC from me 
https://lore.kernel.org/all/20260421201103.142403-3-wse@tuxedocomputers.com/)

Since the patch currently is only in for-next can this still be fixed?

Obligatory:

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Best regards,

Werner

> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index d688ffca3b5e..f55b239bd4d1 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -348,7 +348,6 @@
>   #define FAN_TABLE_LENGTH	16
>   
>   #define LED_CHANNELS		3
> -#define LED_MAX_BRIGHTNESS	200
>   
>   #define KBD_LED_CHANNELS	3
>   #define KBD_LED_MAX_INTENSITY	50
> @@ -398,6 +397,7 @@ struct uniwill_data {
>   	struct mutex super_key_lock;	/* Protects the toggling of the super key lock state */
>   	struct list_head batteries;
>   	struct mutex led_lock;		/* Protects writes to the lightbar registers */
> +	u8 lightbar_max_brightness;
>   	struct led_classdev_mc led_mc_cdev;
>   	struct mc_subled led_mc_subled_info[LED_CHANNELS];
>   	bool single_color_kbd;
> @@ -427,6 +427,7 @@ struct uniwill_battery_entry {
>   struct uniwill_device_descriptor {
>   	unsigned int features;
>   	u8 kbd_led_max_brightness;
> +	u8 lightbar_max_brightness;
>   	/* Executed during driver probing */
>   	int (*probe)(struct uniwill_data *data);
>   };
> @@ -1514,7 +1515,7 @@ static int uniwill_led_brightness_set(struct led_classdev *led_cdev, enum led_br
>   
>   	for (int i = 0; i < LED_CHANNELS; i++) {
>   		/* Prevent the brightness values from overflowing */
> -		value = min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brightness);
> +		value = min(data->lightbar_max_brightness, data->led_mc_subled_info[i].brightness);
>   		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
>   		if (ret < 0)
>   			return ret;
> @@ -1583,14 +1584,14 @@ static int uniwill_led_init(struct uniwill_data *data)
>   		return ret;
>   
>   	data->led_mc_cdev.led_cdev.color = LED_COLOR_ID_MULTI;
> -	data->led_mc_cdev.led_cdev.max_brightness = LED_MAX_BRIGHTNESS;
> +	data->led_mc_cdev.led_cdev.max_brightness = data->lightbar_max_brightness;
>   	data->led_mc_cdev.led_cdev.flags = LED_REJECT_NAME_CONFLICT;
>   	data->led_mc_cdev.led_cdev.brightness_set_blocking = uniwill_led_brightness_set;
>   
>   	if (value & LIGHTBAR_S0_OFF)
>   		data->led_mc_cdev.led_cdev.brightness = 0;
>   	else
> -		data->led_mc_cdev.led_cdev.brightness = LED_MAX_BRIGHTNESS;
> +		data->led_mc_cdev.led_cdev.brightness = data->lightbar_max_brightness;
>   
>   	for (int i = 0; i < LED_CHANNELS; i++) {
>   		data->led_mc_subled_info[i].color_index = color_indices[i];
> @@ -1603,7 +1604,7 @@ static int uniwill_led_init(struct uniwill_data *data)
>   		 * Make sure that the initial intensity value is not greater than
>   		 * the maximum brightness.
>   		 */
> -		value = min(LED_MAX_BRIGHTNESS, value);
> +		value = min(data->lightbar_max_brightness, value);
>   		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
>   		if (ret < 0)
>   			return ret;
> @@ -2334,6 +2335,7 @@ static int uniwill_probe(struct platform_device *pdev)
>   
>   	data->features = device_descriptor.features;
>   	data->kbd_led_max_brightness = device_descriptor.kbd_led_max_brightness;
> +	data->lightbar_max_brightness = device_descriptor.lightbar_max_brightness;
>   
>   	/*
>   	 * Some devices might need to perform some device-specific initialization steps
> @@ -2673,11 +2675,13 @@ static struct uniwill_device_descriptor machenike_l16p_descriptor __initdata = {
>   
>   static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __initdata = {
>   	.features = UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_LIGHTBAR |
>   		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>   		    UNIWILL_FEATURE_CPU_TEMP |
>   		    UNIWILL_FEATURE_GPU_TEMP |
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN,
> +	.lightbar_max_brightness = 36,
>   };
>   
>   static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
> @@ -2701,6 +2705,7 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
>   		    UNIWILL_FEATURE_GPU_TEMP |
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN,
> +	.lightbar_max_brightness = 200,
>   };
>   
>   /*
> @@ -3321,6 +3326,8 @@ static int __init uniwill_init(void)
>   		device_descriptor.features = UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT;
>   		/* Some models only support 3 brightness levels */
>   		device_descriptor.kbd_led_max_brightness = 4;
> +		/* Some models only support 36 brightness levels per color component */
> +		device_descriptor.lightbar_max_brightness = 200;
>   		pr_warn("Enabling potentially unsupported features\n");
>   	}
>   
