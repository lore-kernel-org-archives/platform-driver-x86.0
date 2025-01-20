Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C4F1FC8
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 13:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737380386; cv=none; b=YtL0ypU3PoRwLPhIpi/SNfXk8YVrT/YjO54c5VRDgDUuldfruHu9xJlcFP0OxP1N5ZdEJ099/q2yoMB8QmCWEmuFW6UaJSeXhdqpIYbIkzViVKdvU8N+HB0lyKkj1VaRMtk8spjiLT5puPId30QUMTLcLk/XCuAN2qWxHD0bOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737380386; c=relaxed/simple;
	bh=XprefF7dGoxVjNe6NO7BUe8FETbO5SMa/Fe8DToBhxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3zdiGabZxv4Aia2hCf4h1xEtLLZOFbEhyP0W4DKZ1XTX+zzvXMDYibbcm3dCxIAlUscxI7/Vwbm4jXumB3WILisMCNJakpVsiseTIcBlR2os6vetRRqKDPSFZX2ssGdUKyHIfc7UbVtmW4J2ConQ+T+zSM74+o0zJQfxxQXQRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SFx3mjqX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SFx3mjqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOuoaZZ5BUNgd8TyWzqWOtBicYbssHqauRGD5EmpKU4=;
	b=SFx3mjqX4N6fyj5SFvqezKbyJzmnPqAT2w/tJbfw0R26h9L3kg26W1bKAIELEGvULv9jh2
	ZKStH0vQa+gNNqqd4RCRIJWIiG7M5HW0rZxAuyEEHvaSNfj6PlZhVGKjSfeWrqUa7KFRZF
	V9ARkYvmjIKX5VuA/npDLRnQb3IB21Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-CABlwj4fNF29od_bMmCvRw-1; Mon, 20 Jan 2025 08:39:42 -0500
X-MC-Unique: CABlwj4fNF29od_bMmCvRw-1
X-Mimecast-MFC-AGG-ID: CABlwj4fNF29od_bMmCvRw
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d9f2ec86d1so3326153a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 05:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737380381; x=1737985181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOuoaZZ5BUNgd8TyWzqWOtBicYbssHqauRGD5EmpKU4=;
        b=G3YPQkFEwJfn8q7StOOn0Wv9Nu7jqBo1gRkkxOpZmD/Q3U6WPRPSh9AAqluYx+LAK3
         sjxp5P/fdJ5YsU7NgRGtaMq9gMtNYFbt6Ue4q/3ou8BiBKoVJT092BcijZbssQIchG4Q
         z4vgvN2UPzduazS7rud72eNNcN4U8mF5KgfaHwKJ1RZGuNL6ojR/RnepP8N/Fs9iO2lV
         u1TimfmEaRM6oC6lMCdjVCNrbYhoNNXqhtrhIwXO+VZYxO8OTvFtEHR45DHeg86/Qz7Q
         BDF1wRg60HelOjIKnwP8OurbwZ2GddzI1wQ02Y5520CH4sVbQ1DLOhBjKOjBJ9v2tEQ1
         eXVg==
X-Gm-Message-State: AOJu0Yy/unxgA2yHF6dVl6iM44Va5UOlFtGv15IIKVtb2BYlxc9cFpT4
	H2uUrPB/HFyMT4J/N3/2eX9mickhmNZ3O3ihwntvNGfQVjbFEYHKoWULGMzSUrXA7VLoUdFhNEs
	/udt9hoFF6rlvgrGqTG+uTuGd45ldgxhfoFRL+o3htS0PGRzZCwkHV/auaV7vQ6bh8yigsLI=
X-Gm-Gg: ASbGncsxTVXrIurLEO5gYvDzjyvI7HptYJryP5XhcO/yZBkaSEc498/yiZbJ7OD5Mnr
	I7yIlVbfjhEaXGIj9OqtWzu9Bpx567RBpeTdRLtuajSj06ZfM5EPDpSENnAlm8H2mymdsZf2FVG
	ALqKKQLqN6yUEmsPK3okXR2ZSlQJO9tniushRdFdbwjR1VJTAg3THg1In2gaR0EC9bV1I5bBzSJ
	yM54Rjou1SjuqfB24RDzGTnGRlcEU7hs6w1lx/8/FtqaPDZAcI6lb2VBScHdcMOo90dB6QPZpXj
	JzH9fYi2N54p7GhzciJiTMfSjUR3mSrrWx5ra8wwNnKlayS2jbfoxy5m8FDZ8i9c8n7QNwPPwsk
	epRHztrjv7X3Bb/Lx7QaC2BBPL4EX+oUpRcDqkk39XnDp
X-Received: by 2002:a05:6402:518a:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5db7d2f5ec0mr34213892a12.13.1737380380683;
        Mon, 20 Jan 2025 05:39:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlZtCi5Qwziv2cyCkbIcUywdcPQhwVZ8pUfJKPjEc1snjQ0YFL/MVidcrzBYROOPsPz308UQ==
X-Received: by 2002:a05:6402:518a:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5db7d2f5ec0mr34213827a12.13.1737380380282;
        Mon, 20 Jan 2025 05:39:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f224e0sm617948766b.112.2025.01.20.05.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 05:39:39 -0800 (PST)
Message-ID: <06b5f424-52a5-4397-9d37-cbb628b98bb8@redhat.com>
Date: Mon, 20 Jan 2025 14:39:39 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 20-Jan-25 11:17 AM, Sakari Ailus wrote:
> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> documentation) but the int3472 indiscriminately provides this as a "reset"
> GPIO to sensor drivers. Take this into account by assigning it as "enable"
> with active high polarity for INT347E devices, i.e. ov7251.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Sorry but no this won't fly. If we go this route the amount of
quirk code in the int3472 driver is going to get out of control.

Since you are matching this mapping on the sensor-type, this
should be handled in sensor specific code, IOW in the sensor driver.

Also see my reply on the linux-media list here:

https://lore.kernel.org/linux-media/0a0b765e-b342-4433-9c6c-07da78f0f63b@redhat.com/

Sorry but I have to hard nack this. There has to be some line
where the pdx86 glue code stops bending over backwards and
where some of the burden of supporting more then just devicetree
moves to the sensor drivers.

*especially* since this mapping is going to be different per sensor-driver,
with there being *no consistency at all* in the GPIO/pin names used in
the sensor drivers just looking at drivers/media/i2c/ov*.c I see all of:

"enable"
"powerdown"
"pwdn"
"reset"
"resetb"
"Camera power"
"Camera reset"

being used. Given this total lack of consistent pin naming this really
needs to be fixed in the sensor drivers.

Not to mention the fact that the "reset" used by the ACPI tables is
easily more correct for the ov7251 then the "enable" the driver
currently expects given that the datasheet lists the pin as:

XSHUTDOWN input reset (active low with internal pull down resistor)

I don't see any "enable" in there were as the datasheet does say
"reset".

Regards,

Hans






> ---
> since v1:
> 
> - Fixed device name string.
> 
>  drivers/platform/x86/intel/int3472/discrete.c | 45 ++++++++++++++++---
>  1 file changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index d881b2cfcdfc..6404ef1eb4a7 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -122,13 +122,47 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
>  	return desc;
>  }
>  
> -static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
> +/**
> + * struct int3472_reset_gpio_map - Map "reset" GPIO to whatever is expected by
> + * the sensor driver (as in DT bindings)
> + * @devname: The name of the device without the instance number e.g. i2c-INT347E
> + * @func: The function, e.g. "enable"
> + * @polarity: GPIO_ACTIVE_{HIGH,LOW}
> + */
> +static const struct int3472_reset_gpio_map {
> +	const char *devname;
> +	const char *func;
> +	unsigned int polarity;
> +} int3472_reset_gpio_map[] = {
> +	{ "i2c-INT347E", "enable", GPIO_ACTIVE_HIGH },
> +};
> +
> +static void int3472_get_func_and_polarity(const char *sensor_name, u8 type,
> +					  const char **func, u32 *polarity)
>  {
>  	switch (type) {
> -	case INT3472_GPIO_TYPE_RESET:
> -		*func = "reset";
> -		*polarity = GPIO_ACTIVE_LOW;
> +	case INT3472_GPIO_TYPE_RESET: {
> +		const struct int3472_reset_gpio_map *map = NULL;
> +		unsigned int i;
> +
> +		for (i = 0; i < ARRAY_SIZE(int3472_reset_gpio_map); i++) {
> +			if (strncmp(sensor_name, int3472_reset_gpio_map[i].devname,
> +				    strlen(int3472_reset_gpio_map[i].devname)))
> +				continue;
> +
> +			map = &int3472_reset_gpio_map[i];
> +			break;
> +		}
> +
> +		if (map) {
> +			*func = map->func;
> +			*polarity = map->polarity;
> +		} else {
> +			*func = "reset";
> +			*polarity = GPIO_ACTIVE_LOW;
> +		}
>  		break;
> +	}
>  	case INT3472_GPIO_TYPE_POWERDOWN:
>  		*func = "powerdown";
>  		*polarity = GPIO_ACTIVE_LOW;
> @@ -217,7 +251,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
>  
> -	int3472_get_func_and_polarity(type, &func, &polarity);
> +	int3472_get_func_and_polarity(int3472->sensor_name, type, &func,
> +				      &polarity);
>  
>  	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
>  	if (pin != agpio->pin_table[0])

