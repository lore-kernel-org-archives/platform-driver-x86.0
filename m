Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3865940EBA9;
	Wed, 15 Jul 2026 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128776; cv=none; b=UO1ynaiaSmL6O0BosDCZccNUKkG4RwT3NzNXI395VkPY7WWs+Omn7t1rLYBq6LqC/UJToK3BuXxvRKs1gt76JSjwVI110yHnFXWR1rNkJzB6tiow6cXPs34Afr/F8IdoUrPFiT0ftwK+Z6WlahpSHesTzJx5qomjYRcyHYGBnzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128776; c=relaxed/simple;
	bh=hgV7vHHe5Z4i1Y71wVyQFwaX3B4GL81fOKHipadu1WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bk4gFFygYpv9Ayv9YGnRnuzabOC5M+WxkMiQv/vznyTmz7oCozyKP/AWdNkZcvp+90KxmlEeftwSQxB7Qs5Q2pALBiQwwu3pXJEv6KSvhTmbzJCVi5WstRFzILqFJbCAHbEmH06EOYL+xc3k54WxTU15oTuB2aOPG7zNejeaia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=YAD1us/C; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="YAD1us/C"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id D01282FC005F;
	Wed, 15 Jul 2026 17:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1784128771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=se1pQrzT0O47uHRnEtsDeb1hdU2eXMWtuv0HK47yLOo=;
	b=YAD1us/C9uk3y6MQL7leSwAvY86W6WHf7ljRfXtEpwgq0GKkNN5KnWLCYjHzF8lKk63BNM
	7DEIails8KQr/wbNzo8/egOJ9ENWLfU8DpeEd4ZtZdCEpYSmjDojeQZKEc6w+8ogAqhG7m
	mO+n2CnrfMH4Gnj8viw2qqp20x/DfnE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <5bb7d5c3-a6d3-458b-b536-ece19c972024@tuxedocomputers.com>
Date: Wed, 15 Jul 2026 17:19:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] platform/x86: uniwill-laptop: Make
 KBD_LED_MAX_INTENSITY configurable
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710223544.49602-1-W_Armin@gmx.de>
 <20260710223544.49602-4-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260710223544.49602-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 11.07.26 um 00:35 schrieb Armin Wolf:
> Some (yet to be enabled) Tuxedo devices have a maximum intensity of
> 200 instead of the default 50. Remove the hardcoded maximum intensity
> and use the device descriptor instead.
>
> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 4591ee299a90..5b8e35bf9a51 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -351,7 +351,6 @@
>   #define LED_CHANNELS		3
>   
>   #define KBD_LED_CHANNELS	3
> -#define KBD_LED_MAX_INTENSITY	50
>   
>   #define UNIWILL_FEATURE_FN_LOCK			BIT(0)
>   #define UNIWILL_FEATURE_SUPER_KEY		BIT(1)
> @@ -403,6 +402,7 @@ struct uniwill_data {
>   	struct mc_subled led_mc_subled_info[LED_CHANNELS];
>   	bool kbd_led_single_color;
>   	u8 kbd_led_max_brightness;
> +	u8 kbd_led_max_intensity;
>   	unsigned int last_kbd_status;
>   	union {
>   		struct {
> @@ -429,6 +429,7 @@ struct uniwill_device_descriptor {
>   	unsigned int features;
>   	bool kbd_led_single_color;
>   	u8 kbd_led_max_brightness;
> +	u8 kbd_led_max_intensity;
>   	u8 lightbar_max_brightness;
>   	/* Executed during driver probing */
>   	int (*probe)(struct uniwill_data *data);
> @@ -1780,8 +1781,8 @@ static int uniwill_rgb_kbd_led_init(struct uniwill_data *data)
>   		 * Make sure that the initial intensity value is not greater than
>   		 * the maximum intensity.
>   		 */
> -		if (regval > KBD_LED_MAX_INTENSITY) {
> -			regval = KBD_LED_MAX_INTENSITY;
> +		if (regval > data->kbd_led_max_intensity) {
> +			regval = data->kbd_led_max_intensity;
>   			ret = regmap_write(data->regmap, uniwill_kbd_led_channel_to_reg[i], regval);
>   			if (ret < 0)
>   				return ret;
> @@ -1793,7 +1794,7 @@ static int uniwill_rgb_kbd_led_init(struct uniwill_data *data)
>   			intensity_all_zeros = false;
>   
>   		data->kbd_led_mc_subled_info[i].intensity = regval;
> -		data->kbd_led_mc_subled_info[i].max_intensity = KBD_LED_MAX_INTENSITY;
> +		data->kbd_led_mc_subled_info[i].max_intensity = data->kbd_led_max_intensity;
>   		data->kbd_led_mc_subled_info[i].channel = i;
>   	}
>   
> @@ -2338,6 +2339,7 @@ static int uniwill_probe(struct platform_device *pdev)
>   	data->features = device_descriptor.features;
>   	data->kbd_led_single_color = device_descriptor.kbd_led_single_color;
>   	data->kbd_led_max_brightness = device_descriptor.kbd_led_max_brightness;
> +	data->kbd_led_max_intensity = device_descriptor.kbd_led_max_intensity;
>   	data->lightbar_max_brightness = device_descriptor.lightbar_max_brightness;
>   
>   	/*
> @@ -2675,6 +2677,7 @@ static struct uniwill_device_descriptor machenike_l16p_descriptor __initdata = {
>   		    UNIWILL_FEATURE_USB_POWERSHARE,
>   	.kbd_led_single_color = false,
>   	.kbd_led_max_brightness = 4,
> +	.kbd_led_max_intensity = 50,
>   };
>   
>   static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __initdata = {
> @@ -2858,6 +2861,7 @@ static struct uniwill_device_descriptor x4sp4nal_descriptor __initdata = {
>   		    UNIWILL_FEATURE_USB_POWERSHARE,
>   	.kbd_led_single_color = true,
>   	.kbd_led_max_brightness = 2,
> +	.kbd_led_max_intensity = 50,
>   };
>   
>   static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
> @@ -3355,6 +3359,7 @@ static int __init uniwill_init(void)
>   		device_descriptor.kbd_led_single_color = false;
>   		/* Some models only support 3 brightness levels */
>   		device_descriptor.kbd_led_max_brightness = 4;
> +		device_descriptor.kbd_led_max_intensity = 50;
>   		/* Some models only support 36 brightness levels per color component */
>   		device_descriptor.lightbar_max_brightness = 200;
>   		pr_warn("Enabling potentially unsupported features\n");

lgtm

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

