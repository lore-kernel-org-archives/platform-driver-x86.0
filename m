Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BB537D135;
	Mon, 30 Mar 2026 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862600; cv=none; b=WmoBpXx3ymecHYbxwtk3d5OJAojZL0kI/b9y1yWs0Bw1qRlQOK9ZmPtKmOpKYU3SEeplcFaok4fkSCjYByutwWk3FDr/Sw+/aTb0yFiSPECYM/1eSxc8aOzJNnqn3ymftesaBIQQzdgqhinGhQYl2BHUwOKPbDZKPaldYRvC/Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862600; c=relaxed/simple;
	bh=YwSYSgmlS4AVqqgZ+y5wsdZ29w1DX4kfjHjvUlFEhn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMnBKmXf4jhCLyzGq/aFyXzUZh+GdVPcxeKpR/K9fnmW2on71eDyJIBVtgs8cB9WJTuywh2NQ+xcfpf93P9mfxbnw2NVMqs3W1/2wqe4kJ8mBv3qWfs1cmlapEZ/cLD2txzTLYIWg2vct83ecVzaHrSfMDPxGBOZhC1Dvnaehjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7Jfvm7/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7Jfvm7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774862599; x=1806398599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YwSYSgmlS4AVqqgZ+y5wsdZ29w1DX4kfjHjvUlFEhn4=;
  b=F7Jfvm7/Gzp/LWMehh+WJj6Fk+1NAk8yF5eAGC5Hqi1TPfVAuGfM1Gn0
   vdhy1gw8d2+xJqczTBFpUhcC3lvxT2aXcm4FjC6woogt3UzLe50X/Q4Lk
   XqqXAbDv4fuGSn8M3yeYPWI6kDHk1xZntBg223quKYoupByet0xgBvPXO
   SlbQIn4g2Ke0YX0HMZRaXKVYo6fG+oA6+WIdgfU81DV6/SmLCUxEi/EGb
   MvDmBNIZH/RC2+G7Fmwv8hLMTIAjBqYqBJVICtUHS+1jBMuq8C4VgepAW
   h3MQ9iIpNw2lagYH0ndNMe0PmTHETZPIlA3nBlx8sd3VjVGlOsATo3/i1
   w==;
X-CSE-ConnectionGUID: Min2iYSEROSlBqLfB241rw==
X-CSE-MsgGUID: UmRtSh7QRqmw1KIsvTicQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86153166"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86153166"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:23:18 -0700
X-CSE-ConnectionGUID: lt6cWXWMSB+rx+njI3sAzA==
X-CSE-MsgGUID: iZt8IUXrTDi1MiV8RMHbmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="263939743"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:23:16 -0700
Date: Mon, 30 Mar 2026 12:23:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] platform/x86: int3472: Use local variable for LED
 struct access
Message-ID: <acpBARMUy-LOm2N_@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
 <20260327181031.1489365-2-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327181031.1489365-2-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 07:10:28PM +0100, Marco Nenciarini wrote:
> Introduce a local struct int3472_pled pointer in the LED registration
> and unregistration functions to avoid repeatedly dereferencing
> int3472->pled. In the brightness callback, use container_of() to get
> the int3472_pled struct directly instead of going through
> int3472_discrete_device.
> 
> No functional change.

...

>  static int int3472_pled_set(struct led_classdev *led_cdev,
> -				     enum led_brightness brightness)
> +			    enum led_brightness brightness)
>  {
> -	struct int3472_discrete_device *int3472 =
> -		container_of(led_cdev, struct int3472_discrete_device, pled.classdev);
> +	struct int3472_pled *pled = container_of(led_cdev, struct int3472_pled, classdev);

The idea was to call it led from the beginning, currently I don't see how this
reduces a churn I mentioned.

	struct int3472_pled *led = container_of(led_cdev, struct int3472_pled, classdev);

> -	gpiod_set_value_cansleep(int3472->pled.gpio, brightness);
> +	gpiod_set_value_cansleep(pled->gpio, brightness);

	gpiod_set_value_cansleep(led->gpio, brightness);

>  	return 0;

In the next patch it will be only a single line changed (data type on both sides).

>  }

...

>  int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)

Same here.

-- 
With Best Regards,
Andy Shevchenko


