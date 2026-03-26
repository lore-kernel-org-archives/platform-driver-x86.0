Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6256C33F5B5;
	Thu, 26 Mar 2026 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522545; cv=none; b=SP2Q29mj5u94A2L7af0nFzokc1Czkb7wBQqrWKXZno95m8NlEJoaLVhrPNuQSoMrnvWNVwWqxYcXT/cpKY2pf/4oKcvX2jRTp5oD6KuJIRuY8ObohT+KXKuTArveU4DVAccolURG0sZsGgVrVDVrwLrWTOSnwpsxRU5NcgzpcH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522545; c=relaxed/simple;
	bh=L9UECywxnFtnAV87kCRiGM46nY1LZxy7cFrkksNvApc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3L3MQmGfb0xcCFlvBhLhMknIq7P9SEqISGbZ152srWD2hQzqu63MxZVhQr5CrydvhW5eM8Rz8zwVzDbBX7AjGlLd+APlb+aa62syFQmV+Ydp+Zb4bow+fdmE3Lp6s4UsAMx+RbIj5hisKrzyaYILC9bS54Up/vSmabpj9Ubo9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5PlZK/M; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5PlZK/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774522544; x=1806058544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L9UECywxnFtnAV87kCRiGM46nY1LZxy7cFrkksNvApc=;
  b=G5PlZK/Mcmm5pxrlLGaycMU+HYQFauWgwAsb+9WWuKkSYGKOdhP1u/BM
   JtGjCusZz81PlwgH/EIn1zOABtBGQM3jlwuBdIWAPKfrPpibPBulkxQc0
   CvCj2M6UpZedc1OywJfDIt6LGVHOppr0gyzM410yeMj2uNxv//bZRbKzM
   RwirLIdHctdxb7IZO2popB5rltZlQMQZZFQPKBpdc7jl08ERWadl2YNsM
   rzZGMYfveQ5BaR8XwzjGCoAdySOPSYLcgUf0uAf+z3IbuzaqV9IBZZ8+6
   hVUhhIOMH8IxLUFiHDBlmrCsK29eGY5733cUg06ockUL0+Phdk/oiQtPi
   w==;
X-CSE-ConnectionGUID: zO81CmvISMatZ2Dh9RHr2g==
X-CSE-MsgGUID: 1Nqp1O3GTpSCGJ/aZOosWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75772016"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75772016"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:55:44 -0700
X-CSE-ConnectionGUID: 1HVonGyqTaSo+R4YA+D2mg==
X-CSE-MsgGUID: 4Dagxq3gSuy+080+ksupTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="220123487"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:55:42 -0700
Date: Thu, 26 Mar 2026 12:55:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe LED)
Message-ID: <acUQq8IoQWIXOyPE@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <cover.1774477895.git.mnencia@kcore.it>
 <1834b9729482d629c1d2d28443b88323cbae2764.1774477895.git.mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1834b9729482d629c1d2d28443b88323cbae2764.1774477895.git.mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Mar 25, 2026 at 11:38:23PM +0100, Marco Nenciarini wrote:
> Some ACPI INT3472 devices include a GPIO with DSM type 0x02, used for
> IR flood (strobe) illumination. This GPIO type was previously
> unhandled, resulting in the following warning during probe:
> 
>   int3472-discrete INT3472:00: GPIO type 0x02 is not currently
>   supported
> 
> Add INT3472_GPIO_TYPE_STROBE (0x02) handling that registers the GPIO
> as an LED class device via skl_int3472_register_led(). An enum
> int3472_led_type parameter controls both the LED name suffix and
> whether a lookup is registered for the sensor driver. Unlike the
> privacy LED, the strobe LED is not consumed by the sensor driver, so
> no LED lookup is registered.
> 
> To support devices that have both a privacy and a strobe LED, the
> single struct int3472_led member is replaced with an array and the
> container_of in the brightness callback now references the int3472_led
> struct directly.

...

>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> -			ret = skl_int3472_register_led(int3472, gpio);
> +			ret = skl_int3472_register_led(int3472, gpio,
> +						       INT3472_LED_TYPE_PRIVACY);

Split this conversion to yet another separate change. At the end of the day
you should have something like this:

Patch 1: rename pled --> led
Patch 2: Use local led variable instead of dereferencing (as Ilpo asked for)
Patch 3: introduce led type and update API to use it
Patch 4: add IR flood support

> +			if (ret)
> +				err_msg = "Failed to register LED\n";

Move this now to the callee which may add a name/con_id of the led to the error
message.

-- 
With Best Regards,
Andy Shevchenko


