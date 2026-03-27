Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E80633ADA7;
	Fri, 27 Mar 2026 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607650; cv=none; b=fu+OBYEBqcBH3dnJgfIoHwP/N8FfIokgVm/ti2UZrJoZh7N11hM6Lx6qfOH+IDwEvZQPqxiAtqto7DL23R5EYJdahsGKFRevST4Ta0SOEpXk00sh2QmS+pouhmvhgLjqwmJIvMlV0j4se2gknVddwT7NzqC+y0R2tGEVW5Qzwjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607650; c=relaxed/simple;
	bh=ADwYD/22rogQmPqR+5k/LZ+oRUBkvDNBSOqnqvnG8EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSda/qI+YbhvRgiJm+QOw9pQ5QEzBvp2gN+onpqJE2SmB9nb5opYtdmS8kovzzM/VQaps6dls+N4gA9aUDjviLs77MwORTsBxya2Acr6w8kqCGAxzVphLOkJ/8pr3PzBBLCUFw2iMzdFpHpVavV3xYuaH/KzIp32yK07juqLcbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9geTmTL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9geTmTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774607650; x=1806143650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ADwYD/22rogQmPqR+5k/LZ+oRUBkvDNBSOqnqvnG8EI=;
  b=e9geTmTLSeMP4R46Fy0EEvGplWx7usxB2l+TdAicPZ8NFAvXBHr5SBK7
   bTWauRKS43qnCjPm5CoiWcuI1hxU8uKZo4lXIHilIGHjRrcOgPUm0SebG
   8JMfybcyC/n/dHlLAlf976zS2x0xo8e8xHBE5zoPz02+q7JQrL3Fro7Ve
   6m1k9gLM9XwFHb+2QT7qmTFmbpK5h57Q91uqL17mPcwKz1q6CtOCzE6Ra
   SW0XN2Kl1ol9M7mXcUm6TVxaAxseHgQ7XNeTeOojr3Ks/T2kRj2Y3arHE
   kliAfaqT1Yj1RBsqzr8V5pQTfM6GgpiZtBg3lWGz7xxUomWqwjo0xeCOT
   w==;
X-CSE-ConnectionGUID: Z/G7FlaJRFmGmOgUoEQZbw==
X-CSE-MsgGUID: Ifa279/LRi+gL6Pr1pX1CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="93259595"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="93259595"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:34:09 -0700
X-CSE-ConnectionGUID: O4Y98gRDS/KVOAnXZzUZrw==
X-CSE-MsgGUID: 5GNjv6bTRU6KWf4MBKaoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="224321838"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:34:07 -0700
Date: Fri, 27 Mar 2026 12:34:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe LED)
Message-ID: <acZdHFO0GTvCTQ8l@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327090753.1481453-1-mnencia@kcore.it>
 <20260327090753.1481453-5-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327090753.1481453-5-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 10:07:53AM +0100, Marco Nenciarini wrote:
> Some ACPI INT3472 devices include a GPIO with DSM type 0x02, used for
> IR flood (strobe) illumination. This GPIO type was previously
> unhandled, resulting in the following warning during probe:
> 
>   int3472-discrete INT3472:00: GPIO type 0x02 unknown; the sensor
>   may not work
> 
> Add INT3472_GPIO_TYPE_STROBE (0x02) handling that registers the GPIO
> as an LED class device via skl_int3472_register_led(). Unlike the
> privacy LED, the strobe LED is not consumed by the sensor driver, so
> no LED lookup is registered.

...

>  	[INT3472_LED_TYPE_PRIVACY] = "privacy",
> +	[INT3472_LED_TYPE_STROBE]  = "strobe",

This was renamed between the versions. Did I miss explanation "why"?

>  };
>  
>  static const char * const int3472_led_con_ids[] = {
>  	[INT3472_LED_TYPE_PRIVACY] = "privacy",
> +	[INT3472_LED_TYPE_STROBE]  = NULL,
>  };

Not sure if this is better than passing a boolean parameter to the function.

-- 
With Best Regards,
Andy Shevchenko


