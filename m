Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662722EB87B;
	Fri, 27 Mar 2026 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606518; cv=none; b=ppvvkDjSDxeugvdLauqSYIaN4omJe5bzZlkqcMPqYwirEXqZUn2JbIVoaXlgfJ5i5HJ1h/Xvs5pU9biOMcAayaj7+4Jh3p54aVkk770zbHbJqaNYIyqzD/qXHSWrTknQlnN0gjZWq4qOh62mawj59P6lA0vi4/dQrjLyngld9hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606518; c=relaxed/simple;
	bh=d8L9ObaAVMHoN2qnNqqI8fGJQrJGlg3oIkgTm9xHT7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6izW5RNL3P+iz1vsYk5tvCJ8oDpHqpZl29GDbKJN0cQhQbVg7eRRnozwyRFeqZ1Adaoft2Os0qg/VQZGX4XnpfDCpdAHw+nmFz+92lO4GGdQBZBGgg4C68jj6X1FYo0FkvGXTpLwA7g8OVyrPPfivXD+/X/qT+4Qx7DjPQ7U6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kd+iWkGu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kd+iWkGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774606518; x=1806142518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d8L9ObaAVMHoN2qnNqqI8fGJQrJGlg3oIkgTm9xHT7Y=;
  b=kd+iWkGuQyqhthYLT7viYCrO8orUdlH21DBnNzO+McU5YTtbZlcLw1yR
   lqNiMJ09wGDY8fg+F6hL9lEUquK68K8mhWS0NsNAGAB6Px/9oatCMptnd
   bxVsEcF6aLsNHN9d2VGLNYZTb+8fSdzfWy1gZT5VYcIwThGOCQabCgaL/
   +UJeKgQzuF2dJwR2PdVtooN0ftj85zjXcGvvY3OULA8fuMjWqoTsbudLh
   CU8OJ4zMG9Vq4asxyCINDJYdnzBEcg+sg1cCrpQQMI2m0soy4LmyItTY4
   4gB8fHKPUTedqtcAfrml+aXrcJZoN2WDQKJrvaUhu+HplRhX3d4V0AdUS
   w==;
X-CSE-ConnectionGUID: pAohB0wXR2mUbaNkQPb7Tw==
X-CSE-MsgGUID: qQFhP7WQRSyhEgY51XdtvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75644228"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75644228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:15:16 -0700
X-CSE-ConnectionGUID: rqIkLZHFSfSbU8TvMMTk+Q==
X-CSE-MsgGUID: oc3lpwHqQeqkuNwxRuJ/1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="220878427"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:15:14 -0700
Date: Fri, 27 Mar 2026 12:15:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] platform/x86: int3472: Use local variable for LED
 struct access
Message-ID: <acZYr08hbXzT1_Dn@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327090753.1481453-1-mnencia@kcore.it>
 <20260327090753.1481453-3-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327090753.1481453-3-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 10:07:51AM +0100, Marco Nenciarini wrote:
> Introduce a local struct int3472_led pointer in the LED registration
> and unregistration functions to avoid repeatedly dereferencing
> int3472->led. In the brightness callback, use container_of to get the

container_of()

> int3472_led struct directly instead of going through
> int3472_discrete_device.
> 
> No functional change.

...

>  static int int3472_led_set(struct led_classdev *led_cdev,
> -				     enum led_brightness brightness)
> +			   enum led_brightness brightness)
>  {
> -	struct int3472_discrete_device *int3472 =
> -		container_of(led_cdev, struct int3472_discrete_device, led.classdev);
> +	struct int3472_led *led =
> +		container_of(led_cdev, struct int3472_led, classdev);

Now it can be a single line

	struct int3472_led *led = container_of(led_cdev, struct int3472_led, classdev);

(the original code span to 85 characters, this line is 87, which is fine
 I believe).


> -	gpiod_set_value_cansleep(int3472->led.gpio, brightness);
> +	gpiod_set_value_cansleep(led->gpio, brightness);
>  	return 0;
>  }

...

>  int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
>  {
> +	struct int3472_led *led = &int3472->led;

Okay, make this patch going first, before renaming, so you will have the local
variable already be converted:

	struct int3472_led *led = &int3472->pled;

This will reduce a lot of churn in both patches.

-- 
With Best Regards,
Andy Shevchenko


