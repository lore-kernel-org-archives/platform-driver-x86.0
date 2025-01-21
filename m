Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B41BB6BC
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737452570; cv=none; b=Je9U9CuquysXpjHl9J8rMwQGdIAjPZRCym64aqVWMdtUIPCGyJBmvBTjtafovd+Yuiu+6nXacO5caCuExw2XFwW2V9suMh5EgQLAPwM7eOYoqBSmJSDLaUOdsmInU7fYnQM0RrALx6vsZWiH3auIj3tLoUWj3eCK3On4n1AO8ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737452570; c=relaxed/simple;
	bh=21xOrVuioCUmjRShl4l1jwVAvr6KebiC2Pdsp7t6dyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAAV/3kK4hlWTbkSPq6mDhwSRa6v5kfqgiLkquTi8/+Bmwyp6UyoxVziaOAR7Ce6daT8A/wQ7yw64s2SSxSaWW6qoBiRHvRnXnkZsFb4ZGf2DLr2qaVxaR4g/fNE6EfW0E0eP7eOJNiFfAPV2Ftr0sqvVKh0bmc4tuoHJU/sEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X4CnaA+k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X4CnaA+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737452567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/y5UJRsHNQnYWKdqLrE92AemoH1tDrMMNEvtUeZBHBo=;
	b=X4CnaA+kkwj0/fH4V3b1K/PBKf8oBSZdY+Icu7e3wdeToL+W8OqS2aN33KsVujscAut9uc
	qaKiIRIx84QqjbzGcGPVnLy2tEyfYvAeAglP8hh30MEeplwo9zyJ9fCDEOEB1faVDlSwNt
	Vzl089Ns0Hj8brke4kQoRslPM/K0+ho=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-j33zRXqiM2WeEjn5Z_Ucrw-1; Tue, 21 Jan 2025 04:42:45 -0500
X-MC-Unique: j33zRXqiM2WeEjn5Z_Ucrw-1
X-Mimecast-MFC-AGG-ID: j33zRXqiM2WeEjn5Z_Ucrw
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa67855b3deso465252066b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2025 01:42:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737452563; x=1738057363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/y5UJRsHNQnYWKdqLrE92AemoH1tDrMMNEvtUeZBHBo=;
        b=KHUsR3e6FZx+ZcrwElimdFFBMqXiOvA4AVZ2v/XasnfTRADfLfpkGK8rPBDq7EIF74
         hYiz5XKPrYDgXdgFbKiASWdB6xEpaALnL+x6zE9fVMY7Y2R7/VH9CC86R4Mo+PgFk/CC
         7tAEMLyQ60O8E7X5MMbICzbFbVYY7IyePtP2oYR7uP4VloChtZ8yKK9HeaqzsGLOsSjb
         5HL0EK3hezemnKeK7HfNJSRab3+nvBDMlKUhxrpgKEuYWZizCczMNn2tu2N3x0CHIYp2
         mV2gU+mJ80pSUSa85FxAXMSjnB78QWJ473gcKpaOibh/2FtcvCuXaPF6av72L/2+9mEj
         kdVQ==
X-Gm-Message-State: AOJu0YxeghxEM0EqglBTKRUnlhLwVBspmXQbdddSNB6OesjQ5tKnRn+H
	onQGaQTRKshHUgobvjoiAzkJduk9Dg2F3VoQCR/o2S/XWsuOCpByjnIYSYoFHMeK5cM3KAai8ZC
	UgPRiovtqYYApcLmY7JDb7VhfZWk77H56nu1JMc0MZlIwnqb0h7fs+3EOOrCxcb37s0dNaGxQ3e
	02KyC6EA==
X-Gm-Gg: ASbGncvsTA2POkMzecP3kR2LawW9dVYCeViV1naxFX+KaAp5UJwRUTwUTHGwTnSC2J7
	KWc+6o7wtNqw29nwF0dNGGFflAcbe4gK3ygddyuiFFFkmP9UfmEBG/8VlK1xTM8T2crfJ6Hsvc3
	VRaZxc8iqU6/0O/cowOGVjuFadZipXm0u7CqMEm6NxvbKQ95ZjmpFpiC7wmfnuN1bCoRudUk7NE
	+vc89UlU3tVObYXL1n4NUglqevvH48q9Do9d2c4j7TbmLHiTR65mm/EawlwMHQOAAlWZIhS8Zee
	HTEo32AoY9kme3l1s1BzAilE44wB5xi/csAw0czr35oBOt1MrKQTCmuEmufZNGkPIpFRgTRbLIF
	edfnFovMKBtuFyb4YGh2+8Cyl7+ipImQT8Yg6j4O9MhZ3
X-Received: by 2002:a17:907:969f:b0:aa6:6885:e2f0 with SMTP id a640c23a62f3a-ab38b44d488mr1660435966b.46.1737452563304;
        Tue, 21 Jan 2025 01:42:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWpj5WyMObR6zduaekaeWiJJIselMGPRn+F8wEwVJIP9GLmcmnexUYhxxBhx26W9xNIlDXaA==
X-Received: by 2002:a17:907:969f:b0:aa6:6885:e2f0 with SMTP id a640c23a62f3a-ab38b44d488mr1660433466b.46.1737452562834;
        Tue, 21 Jan 2025 01:42:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab63eb956ffsm83295866b.74.2025.01.21.01.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 01:42:42 -0800 (PST)
Message-ID: <94978806-e077-4f45-a1a1-f4dd0cf07fad@redhat.com>
Date: Tue, 21 Jan 2025 10:42:41 +0100
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

Instead of using a devname match this should be changed to using
proper ACPI HID matching.

Instead of passing int3472->sensor_name as extra argument to
int3472_get_func_and_polarity(), pass int3472->sensor which
is a "struct acpi_device *" and then use e.g. :

	acpi_dev_hid_uid_match(int3472->sensor, "INT347E", NULL)

but then with the new sensor function argument

> +	const char *func;
> +	unsigned int polarity;
> +} int3472_reset_gpio_map[] = {
> +	{ "i2c-INT347E", "enable", GPIO_ACTIVE_HIGH },
> +};

Rather then having a mechanism for just the reset pin, I would prefer
to be able to remap any type to any type.

So I would like to see this struct changed to e.g. :

static struct int3472_gpio_map {
	const char *hid;
	u8 type_from;
	u8 type_to;
	const char *func;
	unsigned int polarity;
};

static const struct int3472_gpio_map[] = {
	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, "enable", GPIO_ACTIVE_HIGH },
};

> +
> +static void int3472_get_func_and_polarity(const char *sensor_name, u8 type,

And change type to a * here ("u8 *type) so that its contents can be
overwritten by the mapping code

> +					  const char **func, u32 *polarity)

So the new function prototype would become:

static void int3472_get_func_and_polarity(struct acpi_device *sensor, u8 *type,
					  const char **func, u32 *polarity)


>  {

and do the for loop here before the (now) "switch (*type)":

	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
		if (*type != int3472_reset_gpio_map[i].type_from ||
		    !acpi_dev_hid_uid_match(sensor, int3472_reset_gpio_map[i].hid, NULL))
			continue;

		*type = int3472_reset_gpio_map[i].type_to;
		*func = int3472_reset_gpio_map[i].func;
		*polarity = int3472_reset_gpio_map[i].polarity;
		return;
	}

This should give us a lot more flexibility for future mappings.

Regards,

Hans




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

