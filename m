Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD8E3A8724;
	Fri, 21 Aug 2026 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301256; cv=none; b=n/YicRhWBqRKNR6+0Dk2qBYNONMbjHRWxQERWs0UtrEB+VkN9OBkOAToVEuMJw94mBBGLo0WwwCbb+pv5dh/m8MR7LHtAoyT6mwyZZPiX6/YIIsFTqkKxF7xFRfXbsqpWUlVqi1EvLh8+N29kUnNRFpidz0HuFg0syYiTw/AaTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301256; c=relaxed/simple;
	bh=8d70piDZG/JBIcVJEYmSjJQwwZtpAqZOYDwgE78uCEI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M8DAr+cZuCCGIFRtbZs5oFg9OfTYPp9oEMHS8x3nHqV0OuuIkfUWLpeBcEGvx8xQiJeELa5jJxguKAH71voZU6aq4o+U7tGNmBnBfZiEdrwIWclT1I1mIBYM0dWeKEb29gsb7t0e+J0AJWsNAjYIIhyU9BZ3/kVcJ9e8ZmmohQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lryiIs+s; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lryiIs+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787301254; x=1818837254;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8d70piDZG/JBIcVJEYmSjJQwwZtpAqZOYDwgE78uCEI=;
  b=lryiIs+saXsfxXvjezMS7C/Bwa79Recq9oks2qnPRVRPEw7aW+uwEsK8
   QtJzHVdI4lT6GwHpw9LDAoGVPmri8YaZnQFu0t7Oq9iOwkd06mO5WbmpI
   YMnNsx5tds12AmFT/LUK+C1dFBcWXm62fuhSIXnq+Skbh4biKdp7xaQut
   0rRCvO46rWwN0AkYXHGFZGre2S0YnZamEEPsaCc1RJ9bu0r0Y2zZ50gzT
   OCsr4w/YflupSKCJTjR8yCZHnJLuah1EFmpgX6ubGx/cawdewp5gX5mBp
   Fs03pWQxLja1RA14+Lt/peEZIgao/ePwMMsfRWA9ne4isuZIk1q5w+gN6
   Q==;
X-CSE-ConnectionGUID: ez9ceHNfRtiaWTO+2oAVKw==
X-CSE-MsgGUID: xvEabnxtT8qNq7bJm7QOhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91526108"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="91526108"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 01:34:14 -0700
X-CSE-ConnectionGUID: AptB7I0iTP6OTOQsGdRxPQ==
X-CSE-MsgGUID: BDGQB8P5Qkqproivcr7daQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="270091862"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.212])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 01:34:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 21 Aug 2026 11:34:06 +0300 (EEST)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: linux-media@vger.kernel.org, Daniel Scally <dan.scally@ideasonboard.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: int3472: Fix uninitialised variable
 warning
In-Reply-To: <20260820205148.2910639-3-sakari.ailus@linux.intel.com>
Message-ID: <ca97b754-795e-e579-8705-9f2e3d66287b@linux.intel.com>
References: <20260820205148.2910639-1-sakari.ailus@linux.intel.com> <20260820205148.2910639-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Aug 2026, Sakari Ailus wrote:

> Fix a smatch warning about uninitialised err_msg variable, by printing the
> error where it is handled.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 21 +++++++++----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 6c729fcfce5d..cf8a58ef963b 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -329,7 +329,6 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	unsigned long gpio_flags;
>  	union acpi_object *obj;
>  	struct gpio_desc *gpio;
> -	const char *err_msg;
>  	const char *con_id;
>  	int ret;
>  
> @@ -375,7 +374,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
>  		if (ret)
> -			err_msg = "Failed to map GPIO pin to sensor\n";
> +			dev_err(int3472->dev, "Failed to map GPIO pin to sensor\n");
>  
>  		break;
>  	case INT3472_GPIO_TYPE_CLK_ENABLE:
> @@ -387,7 +386,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
>  		if (IS_ERR(gpio)) {
>  			ret = PTR_ERR(gpio);
> -			err_msg = "Failed to get GPIO\n";
> +			dev_err(int3472->dev, "Failed to get GPIO\n");
>  			break;
>  		}
>  

ssahiko is not happy about dev_err_probe() -> dev_err() conversion.

> @@ -395,14 +394,14 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  		case INT3472_GPIO_TYPE_CLK_ENABLE:
>  			ret = skl_int3472_register_gpio_clock(int3472, gpio);
>  			if (ret)
> -				err_msg = "Failed to register clock\n";
> +				dev_err(int3472->dev, "Failed to register clock\n");
>  
>  			break;
>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
>  		case INT3472_GPIO_TYPE_STROBE:
>  			ret = skl_int3472_register_led(int3472, gpio, con_id);
>  			if (ret)
> -				err_msg = "Failed to register LED\n";
> +				dev_err(int3472->dev, "Failed to register LED\n");
>  
>  			break;
>  		case INT3472_GPIO_TYPE_POWER_ENABLE:
> @@ -413,7 +412,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
>  							     con_id, second_sensor);
>  			if (ret)
> -				err_msg = "Failed to register regulator\n";
> +				dev_err(int3472->dev, "Failed to register regulator\n");
>  
>  			break;
>  		default: /* Never reached */
> @@ -436,11 +435,11 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	int3472->ngpios++;
>  	ACPI_FREE(obj);

As a general comment to logic in this function, it would be preferrable to 
arrange code such that the error cases inside the switch could just return 
directly.

To realize that, one would need to

1) use __free() for obj

2) handle that ngpios++ earlier; but I'm not even entire sure about ngpios 
correctness and function, it seems to be only used for indexing in
acpi_evaluate_dsm_typed() (successive calls into 
skl_int3472_handle_gpio_resources()?) but then I don't understand why 
the !obj early return does not increment ngpios too.

> -	if (ret < 0)
> -		return dev_err_probe(int3472->dev, ret, err_msg);
> -
> -	/* Tell acpi_dev_get_resources() to not make a copy of the resource */
> -	return 1;
> +	/*
> +	 * Either return an error or tell acpi_dev_get_resources() to not make a
> +	 * copy of the resource.
> +	 */
> +	return ret < 0 ? ret : 1;
>  }
>  
>  int int3472_discrete_parse_crs(struct int3472_discrete_device *int3472)
> 

-- 
 i.

