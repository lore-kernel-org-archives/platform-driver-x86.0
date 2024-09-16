Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86B9148310
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Sep 2024 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477610; cv=none; b=ftwTz4+3gk34vWfJJqJldQhdKLs6oycOmVH3CEvbaJ2vC8sEVahg7qLi8nJewCiPgVEKbmpxuuY6HrKeIhmhksTMYGwa7ub0lU4dkI5gAeJBMDce/n/wJ/tix/fHG0zkYzIwa7+iAvAnyB5EWVp0GNa6DZJPCA/8X1SIdnQTISQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477610; c=relaxed/simple;
	bh=fF/+zrl/UjPiwWrI5JtcyVqTJ3MGXi54FCHu5svOJ9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVC4pqx9Jw1sVE0ua5eb4J9UdTJPTe4SinNp9nT8iuMj45Y/fXzSA2AQqXRuOC/CoDjYBjfzrl3fHPESBwyKqj3ooGTxgVZkaaWwVb+HaV4ZFGhEsUso1lfW7fIreU7aL9Hd01UOLUHB8sxQhrR9dzW8zQ/+ReWxeD/Q+pvWRk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NqnoN7U6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NqnoN7U6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726477606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vBVswmjxjfZb1L3NiEV1XhC8VrB3Uina2VTZqqrpk8=;
	b=NqnoN7U6o0y2qg/pcD73MNuVYkyxUuO1XQLm1NYUoOqPYuj5uBh9KjUGmNVyjB1CjP24Ti
	aLTlaVk7O7NzJLelmPqQ76U5wtsOTAWxYN8cIne8DPBRKIAdKW8bFNTNjobnDx6e4dLwgj
	pPE/u8vDjeR0Yqdobh0SMAIswvrBltI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-TxHw02jvNWqGmeF5NRR1Rw-1; Mon, 16 Sep 2024 05:06:44 -0400
X-MC-Unique: TxHw02jvNWqGmeF5NRR1Rw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c251bcb728so2225878a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Sep 2024 02:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726477603; x=1727082403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vBVswmjxjfZb1L3NiEV1XhC8VrB3Uina2VTZqqrpk8=;
        b=fU4Ya71G6Qk7DvVdvM7u/rLopaCJ/AOCdaXVcUZE8igGnuvUzTy7uacFsPC0Fz91Ct
         7fZ3zcAx0EPlLJiPJBfwSWSRe9RZ+9s7DkGsRV1Ymf6bCVCeRB4dvfJiN4AMDNDJz9HA
         SyDwy6hOXOkG3U2gfGb0BFUEdZGE+VBH9GdgULb4LuvE+1l6UPt6jkNC83bPMk3yr14w
         81Q0I0K53+j4pRK6w8hRUMFltByo16DorA2T5fznpm3ChubEnkadhm1vrDL++143tKxR
         NsR+2xGLjcj3HjMWGqaEYgavQICuHT+J5EHwlX2ejJLt00thDNzwC6HX8pCJSn6vAt/E
         0BpQ==
X-Gm-Message-State: AOJu0YwbatIypOemtc0DiKch6vNYNUJZ+mUa8CIE5FM19YEHmimWemRe
	X/Rc6q8RXk48mwVTH0qnEP82V1PP9RPBUPQJ6ux6szpkmvGnz1Pz0XBk61TyUg1IdBwkW1DbwNa
	EGZxZZrsaEP6GNYmC2giKTbmM97X8fI4anWWd6tvBBUk8AH1enoKDaEcqjN5MuFXNmtYw5ZI=
X-Received: by 2002:a05:6402:35d6:b0:5c3:c51b:9bdd with SMTP id 4fb4d7f45d1cf-5c413e1ff03mr10708524a12.18.1726477603193;
        Mon, 16 Sep 2024 02:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRNH8Lwb63Kwx1HNS/9dZ62J1+/oCLqx1RmD9H30rtJCZrhi6T74wOHaVSlCBeC7nKwzHtgw==
X-Received: by 2002:a05:6402:35d6:b0:5c3:c51b:9bdd with SMTP id 4fb4d7f45d1cf-5c413e1ff03mr10708502a12.18.1726477602570;
        Mon, 16 Sep 2024 02:06:42 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.148.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb495a8sm2355133a12.11.2024.09.16.02.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 02:06:42 -0700 (PDT)
Message-ID: <96d3a056-0adb-41c6-b8fe-68f7e75add98@redhat.com>
Date: Mon, 16 Sep 2024 11:06:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Adjust Xiaomi Pad 2
 bottom bezel touch buttons LED
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240916090255.35548-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240916090255.35548-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 9/16/24 11:02 AM, Hans de Goede wrote:
> The "input-events" LED trigger used to turn on the backlight LEDs had to
> be rewritten to use led_trigger_register_simple() + led_trigger_event()
> to fix a serious locking issue.
> 
> This means it no longer supports using blink_brightness to set a per LED
> brightness for the trigger and it no longer sets LED_CORE_SUSPENDRESUME.
> 
> Adjust the MiPad 2 bottom bezel touch buttons LED class device to match:
> 
> 1. Make LED_FULL the maximum brightness to fix the LED brightness
>    being very low when on.
> 2. Set flags = LED_CORE_SUSPENDRESUME.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/x86-android-tablets/other.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index aad7114c43c3..76cce8120bd2 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -670,7 +670,7 @@ static const struct software_node *ktd2026_node_group[] = {
>   * is controlled by the "pwm_soc_lpss_2" PWM output.
>   */
>  #define XIAOMI_MIPAD2_LED_PERIOD_NS		19200
> -#define XIAOMI_MIPAD2_LED_DEFAULT_DUTY		 6000 /* From Android kernel */
> +#define XIAOMI_MIPAD2_LED_MAX_DUTY		 6000 /* From Android kernel */
>  
>  static struct pwm_device *xiaomi_mipad2_led_pwm;
>  
> @@ -679,7 +679,7 @@ static int xiaomi_mipad2_brightness_set(struct led_classdev *led_cdev,
>  {
>  	struct pwm_state state = {
>  		.period = XIAOMI_MIPAD2_LED_PERIOD_NS,
> -		.duty_cycle = val,
> +		.duty_cycle = XIAOMI_MIPAD2_LED_MAX_DUTY * val / LED_FULL,
>  		/* Always set PWM enabled to avoid the pin floating */
>  		.enabled = true,
>  	};
> @@ -701,11 +701,11 @@ static int __init xiaomi_mipad2_init(struct device *dev)
>  		return -ENOMEM;
>  
>  	led_cdev->name = "mipad2:white:touch-buttons-backlight";
> -	led_cdev->max_brightness = XIAOMI_MIPAD2_LED_PERIOD_NS;
> -	/* "input-events" trigger uses blink_brightness */
> -	led_cdev->blink_brightness = XIAOMI_MIPAD2_LED_DEFAULT_DUTY;
> +	led_cdev->max_brightness = LED_FULL;
>  	led_cdev->default_trigger = "input-events";
>  	led_cdev->brightness_set_blocking = xiaomi_mipad2_brightness_set;
> +	/* Turn LED off during suspend */
> +	led_cdev->flags = LED_CORE_SUSPENDRESUME;
>  
>  	ret = devm_led_classdev_register(dev, led_cdev);
>  	if (ret)

