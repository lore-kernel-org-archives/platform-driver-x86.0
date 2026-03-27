Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC60433AD;
	Fri, 27 Mar 2026 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607446; cv=none; b=WrF0Pzv2oCaAWc8Eq7oIMS/wycrg9VRLygakZY8otDhn/09rO9cEE5+FbXkDHHiYeCvOvFsRYLAXVGOuqlLOC1tXRRh8ktfU4cXN7jtlBTfbhaV4xIpMHaTJzcmBTFcJ3j7kY5cjwVCLXCRvqeYoP//bK9bNgtFDxvri1YBCqAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607446; c=relaxed/simple;
	bh=ckQAhr6xF5SNmTPlnJrKlNxGLwgeO6z1/aa13wGvPZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkqkkZggVs2GsWX07o0mH78sPC/cFdDcCMwvV6LwCKucnI1Zl+6Rs6HOIx5Z9/QxeA+/vw9NKNloZKfXS1wg85K1J489hl5xX2+Q9DvB8kW5jYfOFj804XgPZLi/iAkZC7csfmXta4pnt9YwVjLd7lfdX25aHOIZmniKd0DKRkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFDL2CxP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFDL2CxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774607446; x=1806143446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ckQAhr6xF5SNmTPlnJrKlNxGLwgeO6z1/aa13wGvPZc=;
  b=LFDL2CxPUJXW2RoV4PWZrbBHD5fHJzX/+uPhOlZovOe+A7dZXeW8HU/d
   qusZdK/KLT/StpbOBU3qDwu3LOL86Je3vrpUvQRc30h6pZbiAWpTuQ5LD
   k62iKMO+v7QItROkkINJPSsCkae9dQXR4Fhl792PCYONqNVfUPicU2g6q
   ASBthrcx/X5Ux8tUGZ9m1zHJStMdcfGcIB3egkmGKRBtzPRpKVttcBGCF
   RI4dAWe96sZfZy+zCrY4fij4wwQtdrsXJlMS49VPdICeVql9jn7M2YgGD
   T6V0y+R8plKTO5neHcoiqrfeOyq7bJ++SOpiVREik1azBR4OxO+ll32tE
   A==;
X-CSE-ConnectionGUID: C/LR/nCVQYK+ZQ0rVgFGWA==
X-CSE-MsgGUID: gjkRZRAuSVSGNNXJ5Aw69w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85986105"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="85986105"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:30:45 -0700
X-CSE-ConnectionGUID: 1PZS8TJ7Rc6vRYekE4JLpA==
X-CSE-MsgGUID: 1aAFnTfkTcWPsO7hSbZaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="225199654"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:30:42 -0700
Date: Fri, 27 Mar 2026 12:30:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] platform/x86: int3472: Introduce LED type enum
 and multi-LED support
Message-ID: <acZcUOSm4LUA75_d@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327090753.1481453-1-mnencia@kcore.it>
 <20260327090753.1481453-4-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327090753.1481453-4-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 10:07:52AM +0100, Marco Nenciarini wrote:
> Add an enum int3472_led_type to parameterize LED registration, and
> lookup tables to derive the LED name suffix and con_id from the type.
> This replaces the hardcoded "privacy" name and prepares for additional
> LED types.
> 
> Convert the single struct int3472_led member to an array with a
> counter to support devices with multiple LEDs. The LED lookup is now
> conditionally registered based on the con_id lookup table entry, and
> a has_lookup flag tracks whether to remove it during cleanup.

...

> +static const char * const int3472_led_names[] = {
> +	[INT3472_LED_TYPE_PRIVACY] = "privacy",
> +};
> +
> +static const char * const int3472_led_con_ids[] = {
> +	[INT3472_LED_TYPE_PRIVACY] = "privacy",
> +};

But why? Do we expect a deviation in these?

...

> +	if (con_id) {

Too early, we have only up to one led for now and we know what is that.

> +		led->lookup.provider = led->name;
> +		led->lookup.dev_id = int3472->sensor_name;
> +		led->lookup.con_id = con_id;
> +		led_add_lookup(&led->lookup);
> +		led->has_lookup = true;
> +	}

...

> -void skl_int3472_unregister_led(struct int3472_discrete_device *int3472)
> +void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472)
>  {
> -	struct int3472_led *led = &int3472->led;
> +	unsigned int i;
>  
> -	if (IS_ERR_OR_NULL(led->classdev.dev))
> -		return;
> +	for (i = 0; i < int3472->n_leds; i++) {


	for (unsigned int i = 0; i < int3472->n_leds; i++) {

> +		struct int3472_led *led = &int3472->leds[i];
>  
> -	led_remove_lookup(&led->lookup);
> -	led_classdev_unregister(&led->classdev);
> -	gpiod_put(led->gpio);

> +		if (led->has_lookup)

Too early, we know we don't have this right now.

> +			led_remove_lookup(&led->lookup);
> +		led_classdev_unregister(&led->classdev);
> +		gpiod_put(led->gpio);
> +	}
>  }

...

>  #define INT3472_LED_MAX_NAME_LEN				32
> +#define INT3472_MAX_LEDS					2

Too early. It's 1 for now.

-- 
With Best Regards,
Andy Shevchenko


