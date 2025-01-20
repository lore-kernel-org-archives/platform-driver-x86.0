Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F901B87EE
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737375161; cv=none; b=QfKwiOaAWKWDqtOoiAkMIN9EvK7R02QulqOk1MEEf9h+SA24f5aJMvK3bDaZRpPU2Y5IzpzaE7+TBAFPKN2ucZf+f+9keXMet2hAFr04TL5FTMcBF7Yj7OqwQmeNFoS+tWUYCQe0gSt+SfTjcVhLwYVWrkFv6YuBI4l64gtQj4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737375161; c=relaxed/simple;
	bh=YE9P2b8sDzbLjuuQuYTwe5DQvsmjNK6tCc6nK5iznNk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SJKZ+OhAUOSUxDTwLQd4ejIarhsf8qo1wjFVt8qeKVTgX9FJt8A/8rADmy7G0ozbHo/yYx2i642one39W6KeDBhjPQWz2ycYds0MyFwTQdpmXKqHlFjcUoj4EZ6YhrucWybY/qQlv4BsuSR9KLbvhsj2JMivhn/fBNULGCrt+js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwiJA5Ki; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwiJA5Ki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737375160; x=1768911160;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YE9P2b8sDzbLjuuQuYTwe5DQvsmjNK6tCc6nK5iznNk=;
  b=iwiJA5KidBUmgAXgMfOyG7HhhL9GLVe0Da0MeyWtbl59tGBu8A+E+y66
   sR25BlPhA0Ts9F8XuWN6NKM3W4yQdZcLoeYRKrBk1DlqW/2Q2kDs7vVHl
   xDBZg+F8EdgvDQp+jT8o70dgL3yZhom5UQ3p5JyMvL5AP2jQKcNilLkWG
   P4cSZpQPKhNGVHL4yJayC7chsTjan2Y06UpUCgMv9aVBcSdN/mD5yyHfH
   lUvDVyVPtUk0gsCB1rgx9NtG8WEFMAUYn/Of/aw7Zv0oAod9chTHndcfB
   2sol6RNleWelvSTui32i2L6EALySAPbITiNbT57VdYcoapZ4W23KgG/NC
   A==;
X-CSE-ConnectionGUID: 1BWxGSVlTByzSXdOcjKNpQ==
X-CSE-MsgGUID: D1VYowioSJOZhAc0+vkffw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37874048"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37874048"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 04:12:40 -0800
X-CSE-ConnectionGUID: /h2mt8euS8GN8Jn3nDmjFw==
X-CSE-MsgGUID: J8v+edxzQ3WHVSehBLm5kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111485464"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 04:12:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 20 Jan 2025 14:12:33 +0200 (EET)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: Daniel Scally <djrscally@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
In-Reply-To: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
Message-ID: <1cf93f61-9285-f2fe-fb92-8fb8a3f44201@linux.intel.com>
References: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Jan 2025, Sakari Ailus wrote:

> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> documentation) but the int3472 indiscriminately provides this as a "reset"
> GPIO to sensor drivers. Take this into account by assigning it as "enable"
> with active high polarity for INT347E devices, i.e. ov7251.
> 

I suggest to mention here that "reset" remains the default.

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


Please add #include for ARRAY_SIZE() and strncmp().

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
> 

-- 
 i.

