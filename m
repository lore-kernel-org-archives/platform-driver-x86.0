Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF2A38F628
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356971; cv=none; b=KzzgPbIDfREIx9ZXIMFoOizwDKr1MgoGmLVHRTtlcaDNcsBqiObi9bTU9ZeAMjOvjTvqTcakwxUuk9MbQ67dCGqHw+gbra76s+HTDOK6/XuiiwVstOwVPnGGWzxitg0To1uaBRMxbXuml1nK/hbLYmpn6SfLAqu4ilvf42FOUwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356971; c=relaxed/simple;
	bh=jX2ALnVbQtpMQRb+IOuN0AmDqRuOh/wXk8LqpJvW8EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DW0z/haYhWGm0Y8CdKdGBXy3/0t1Ak5sgJ4MTGMiaKiv6IAA92odEa+V81A+Fl9VrGzfQvBFNhBQEOJzOroZuF5wsKlFHKQ3Fgt4SNW5kkbqT+hN6gvjAvXeCWXrhM6BQtferOOCsSQ9xmkmpYeRKXxFizNys63N48FjvhBLxRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJYOF7nw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJYOF7nw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774356970; x=1805892970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jX2ALnVbQtpMQRb+IOuN0AmDqRuOh/wXk8LqpJvW8EI=;
  b=PJYOF7nwLpw6Ma+Y3i8x2s2EzG+FW74CwlPCTnqKFh30cAorVU6wezBt
   6mDMzj/vm6q2VmUZN/uVx15Vew+b4I1GT69I+Vx8qIkT3PwrdzjcgHSu5
   8uZCLascRgwmyR/COZSn4KJNkyR3hPnaAJj/7C/rraRIyOVy2QJEjH2fn
   +wsyNTJlU7t7QaS3ldFzzCsVpO3Dn1Oe/EL6t/3l1djCgDFIVnhsF9V8i
   qzWk7cgjiqnThSRhAtYFkXiHhjB4sTxevQIk1FzSAGV/xDZEdFziAN3rc
   EFmEs617MCu5vH0Lv5grpTrm2MYr6bhGVDlf6OtCthmB7rPhg8RuO8HAe
   g==;
X-CSE-ConnectionGUID: Ks81sUUATEuOYWi/IHWoAg==
X-CSE-MsgGUID: nPDKPQHLT0+yhD0+ZpGepQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="85986822"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="85986822"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:56:09 -0700
X-CSE-ConnectionGUID: V6tS0S4WS7ih+gkqTEBXbQ==
X-CSE-MsgGUID: q26V4aE5R6yxqktTh1SPjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="221002052"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:56:08 -0700
Date: Tue, 24 Mar 2026 14:56:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: platform-driver-x86@vger.kernel.org, dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com, hdegoede@redhat.com, andy@kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Handle GPIO type 0x02 (strobe)
 as IR  flood LED
Message-ID: <acKJ5W12MFgZWPew@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260323213535.1410678-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323213535.1410678-1-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 10:35:35PM +0100, Marco Nenciarini wrote:
> GPIO type 0x02 (strobe) appears in ACPI tables on recent Intel
> Meteor Lake and Arrow Lake platforms (e.g. Dell Pro Max 14/16) for
> controlling an IR flood LED used by infrared camera sensors. The
> INT3472 discrete driver does not handle this type, logging "GPIO type
> 0x02 unknown; the sensor may not work" and potentially preventing the
> associated sensor slot from initializing cleanly.
> 
> Add support for GPIO type 0x02 by registering it as an LED through
> the existing LED framework, with the name "ir_flood_led" to
> distinguish it from the privacy LED (type 0x0d).
> 
> Rename skl_int3472_register_pled() and skl_int3472_unregister_pled()
> to skl_int3472_register_led() and skl_int3472_unregister_led(). The
> register function takes a name parameter and an optional LED lookup
> con_id. For the privacy LED, "privacy" is passed so sensor drivers
> can discover it via devm_led_get(). For the IR flood LED, NULL is
> passed to register only the LED classdev without a driver lookup,
> since no sensor driver currently consumes it.

This can be improved.

...

> +		case INT3472_GPIO_TYPE_STROBE:
> +			ret = skl_int3472_register_led(int3472, gpio,
> +						       "ir_flood_led",
> +						       NULL);
> +			if (ret)
> +				err_msg = "Failed to register LED\n";
> +
>  			break;
>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> -			ret = skl_int3472_register_pled(int3472, gpio);
> +			ret = skl_int3472_register_led(int3472, gpio,
> +						       "privacy_led",
> +						       "privacy");

Maybe pass the connection ID for a starter (separate prerequisite) and here add
a new LED and new parameter for the lookup instantiation?

>  			if (ret)
>  				err_msg = "Failed to register LED\n";

...

So, this one

> +int skl_int3472_register_led(struct int3472_discrete_device *int3472,
> +			    struct gpio_desc *gpio, const char *led_name,
> +			    const char *lookup_con_id)

Becomes first

int skl_int3472_register_led(struct int3472_discrete_device *int3472,
			    struct gpio_desc *gpio, const char *con_id)

followed by

int skl_int3472_register_led(struct int3472_discrete_device *int3472,
			    struct gpio_desc *gpio, const char *con_id,
			    bool add_lookup)


>  	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
>  	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
> -		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
> +		 "%s::%s", acpi_dev_name(int3472->sensor), led_name);

This will be

		 "%s::%s_led", acpi_dev_name(int3472->sensor), con_id);

...

> -	int3472->pled.lookup.provider = int3472->pled.name;
> -	int3472->pled.lookup.dev_id = int3472->sensor_name;
> -	int3472->pled.lookup.con_id = "privacy";
> -	led_add_lookup(&int3472->pled.lookup);
> +	if (lookup_con_id) {
> +		int3472->pled.lookup.provider = int3472->pled.name;
> +		int3472->pled.lookup.dev_id = int3472->sensor_name;
> +		int3472->pled.lookup.con_id = lookup_con_id;
> +		led_add_lookup(&int3472->pled.lookup);
> +	}
>  
>  	return 0;

And this

	if (!add_lookup)
		return 0;

	int3472->pled.lookup.provider = int3472->pled.name;
	int3472->pled.lookup.dev_id = int3472->sensor_name;
	int3472->pled.lookup.con_id = con_id;
	led_add_lookup(&int3472->pled.lookup);

	return 0;

-- 
With Best Regards,
Andy Shevchenko


