Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1329B8E8
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770624488; cv=none; b=EIlAjvR/k2RF0pzmP5yk80KGMWQkQbDVn6mzqt1i8U2L090RW9/N2ANkbFnBEE7wYlAY7zDK2bkW0CMaL5ZccMFJw1F/lcQaM06qT0ZOdueOrENjQddJDaok/jQ06A/EhGwlTHkHHkpA7v2yq7ek29r0ny/PF8g/KVPFsQMPyjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770624488; c=relaxed/simple;
	bh=AKDfCnPAjjvuiVRTFRSVXBTYNwpjHj5ekeUbkD3j2dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvcpH5gKYGLdpruFgrOiUwTt1bICvJKXPtoAAwSVRyWqeHebyPK6yukEqd4wp5v/ovQTw8pXTn2z04tWyd5f0lePSbJkxBIwSYjiDwJOS1NzUBFKsBERVV6V53oFsirC6MQXesK1x7h2atC/k0/q5SLWv1f6jHK+LATMwOhLGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+KWyabD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+KWyabD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770624489; x=1802160489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AKDfCnPAjjvuiVRTFRSVXBTYNwpjHj5ekeUbkD3j2dE=;
  b=U+KWyabDC/8kntd/UDdEewmiJMr6HCBc7xXeTD798MyIB4DaPiz1mVTk
   LYf0iEfZSMzXgSszRnwEy3Q1HLLP92VUH/GI/TBA6W8u+Z9Fl2FNXteA7
   eXhF/z2UwAjM35YGGwG8TdyBIBsmb2vefpU3AdsN88zlCyauV8TrAjkVu
   9tzmL48a1a4fTaqFMnXhjFETuagAMCMvzCYFy9+n8dNTDmWfiZFkMRV6v
   VsnBLhJldjbP3Ev0npzqNXM4XJ6fqCRmMVBv8emgMs5JI4mmlggHiDApD
   /OXOmcT/DuZ0ksns159ZlfLjA3KESKM9pNsOjiaYScxrmk3L5f0fUCTRK
   w==;
X-CSE-ConnectionGUID: BlTQ5CzxRmC7ChWQ1MPRxg==
X-CSE-MsgGUID: +sSTHAUzQyu18zQmBRCxMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71770546"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="71770546"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 00:08:08 -0800
X-CSE-ConnectionGUID: j0zsRcB2StuTNVGalnLaEA==
X-CSE-MsgGUID: 5RWahCoyS3m/nfAKaO1QIw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.128])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 00:08:06 -0800
Date: Mon, 9 Feb 2026 10:08:04 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yauhen Kharuzhy <jekhor@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aYmV5Axyfo76D19T@smile.fi.intel.com>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYkdKfP5fg6iywgr@jekhomev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

+Cc: Bart.

On Mon, Feb 09, 2026 at 01:32:57AM +0200, Yauhen Kharuzhy wrote:
> On Sat, Sep 20, 2025 at 10:06:54PM +0200, Hans de Goede wrote:

> > Now that gpiolib supports software nodes to describe GPIOs, switch the
> > driver away from using GPIO lookup tables for Goodix touchscreens to
> > using PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.
> > 
> > Since the tablets are using either Baytrail or Cherryview GPIO
> > controllers x86_dev_info structure has been extended to carry gpiochip
> > type information so that the code can instantiate correct set of
> > software nodes representing the GPIO chip.
> 
> Hi, it seems that the mechanism for looking up GPIOs using software
> node names is broken now (checked on next-20260503) by commit
> e5d527be7e6984882306b49c067f1fec18920735 "gpio: swnode: don't use the swnode's name as the key for GPIO lookup".
> 
> As I understand, some of the issues caused by it were addressed in the
> series [1], but not for the x86-android-tablets driver. Now any GPIO
> belonging to SoC's gpiochips cannot be found by drivers. For example,
> for the Lenovo YB1-X90F keyboard touchpad:
> 
> [   27.297279] i2c i2c-goodix_ts: bus: 'i2c': __driver_probe_device: matched device with driver Goodix-TS
> [   27.297285] i2c i2c-goodix_ts: bus: 'i2c': really_probe: probing driver Goodix-TS with device
> [   27.297291] Goodix-TS i2c-goodix_ts: no default pinctrl state
> [   27.297330] Goodix-TS i2c-goodix_ts: supply AVDD28 not found, using dummy regulator
> [   27.297359] device: 'regulator:regulator.0--i2c:i2c-goodix_ts': device_add
> [   27.297454] devices_kset: Moving i2c-goodix_ts to end of list
> [   27.297459] PM: Moving i2c:i2c-goodix_ts to end of list
> [   27.297463] Goodix-TS i2c-goodix_ts: Linked as a consumer to regulator.0
> [   27.297472] Goodix-TS i2c-goodix_ts: supply VDDIO not found, using dummy regulator
> [   27.297492] Goodix-TS i2c-goodix_ts: using swnode 'node11' for 'irq' GPIO lookup
> [   27.297505] Goodix-TS i2c-goodix_ts: No GPIO consumer irq found
> [   27.297511] Goodix-TS i2c-goodix_ts: error -EPROBE_DEFER: Failed to get irq GPIO
> [   27.297552] Goodix-TS i2c-goodix_ts: Dropping the link to regulator.0
> [   27.297558] device: 'regulator:regulator.0--i2c:i2c-goodix_ts': device_unregister
> [   27.297612] Goodix-TS i2c-goodix_ts: Driver Goodix-TS requests probe deferral
> [   27.297624] i2c i2c-goodix_ts: Added to deferred list
> 
> Could somebody advise on how to fix this, or does a fix already exist? I am
> not familiar with the swnode/fwnode framework but can do some investigation to
> resolve this.
> 
> 1. https://lore.kernel.org/linux-sound/20251120-reset-gpios-swnodes-v7-0-a100493a0f4b@linaro.org/

-- 
With Best Regards,
Andy Shevchenko


