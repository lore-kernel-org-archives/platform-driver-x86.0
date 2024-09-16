Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC46156641
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Sep 2024 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488341; cv=none; b=ZCNLCs3RODJTeBHcPUHbEeJHdc7oSm/9u3pKOxl1G0kPNqDuNG9LxTdQKko5AaP6phaXk+v+gIHnGEeYc77gEwv5CbehyPbFqx3IqreSj83Zgy0aws5kA2S6cggI+RLPBHZzQxkDWWIcqkNQRx14tui2Mh8TnjOypjGVDTP9h9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488341; c=relaxed/simple;
	bh=WJDjFe3HPQeageS4i7xubJVDX2R8MeAjmwyETfLTNxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pylte1ugcLtppZpbpnSeHum+Kz0erjIL8u6YXncSOz7iz5WUg83uQFq21vtUttRezVBWDqvoqgVjFreVV2DI9KK4C/e1dm4c8Z/kSRORYPZMIN2vfOJ13Eg1IMZKb9Z0vZcTYrZz0y+yD5yGUhj5pMvtbVlQ+3TJJkos4yQGMuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: XWiN2BJ5SLuqCxTqaDy/ow==
X-CSE-MsgGUID: l8VVumj6Sju7HEcTaNTJIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="42824390"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="42824390"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:05:39 -0700
X-CSE-ConnectionGUID: Rfk3pDxxSp+x9x2AQkxMlw==
X-CSE-MsgGUID: 76FHlX4QRi2JlYaOOeNb9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="69335407"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:05:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sqAU3-00000009RwU-3wBL;
	Mon, 16 Sep 2024 15:05:35 +0300
Date: Mon, 16 Sep 2024 15:05:35 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Adjust Xiaomi Pad 2
 bottom bezel touch buttons LED
Message-ID: <ZugfD9O7UqR-Ielp@smile.fi.intel.com>
References: <20240916090255.35548-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916090255.35548-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 16, 2024 at 11:02:55AM +0200, Hans de Goede wrote:
> The "input-events" LED trigger used to turn on the backlight LEDs had to
> be rewritten to use led_trigger_register_simple() + led_trigger_event()
> to fix a serious locking issue.
> 
> This means it no longer supports using blink_brightness to set a per LED
> brightness for the trigger and it no longer sets LED_CORE_SUSPENDRESUME.
> 
> Adjust the MiPad 2 bottom bezel touch buttons LED class device to match:
> 
> 1. Make LED_FULL the maximum brightness to fix the LED brightness
>    being very low when on.
> 2. Set flags = LED_CORE_SUSPENDRESUME.

...

>  #define XIAOMI_MIPAD2_LED_PERIOD_NS		19200
> -#define XIAOMI_MIPAD2_LED_DEFAULT_DUTY		 6000 /* From Android kernel */
> +#define XIAOMI_MIPAD2_LED_MAX_DUTY		 6000 /* From Android kernel */

Perhaps + suffix at the same time? _NS? _US?

...

> -		.duty_cycle = val,
> +		.duty_cycle = XIAOMI_MIPAD2_LED_MAX_DUTY * val / LED_FULL,

I haven't checked, just to be sure there is no overflow and 64-bit div on
32-bit machines...

-- 
With Best Regards,
Andy Shevchenko


