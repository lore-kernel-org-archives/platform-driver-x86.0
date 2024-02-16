Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B9D145B03
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708118662; cv=none; b=ULxZfYkn9edZu64lk6qasY+QlC0wixcWc5i1yWCoB6i+GRP/KbKAuF+9aOHsAoMVIHXz1f88tLDWb6J3c62+FqDqWr/DNj35AdVihIv4b0f1UprtrzL4WUqwfDB5Q2LSp4Htz0GD9MGTYkjibzaY552kpBtyXUUr21eirN/QTJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708118662; c=relaxed/simple;
	bh=r5rndyUd99ED6WYzQy0Y9CHi8qOKNBnPUZrEGrmCiN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dj9GJtS8WbMqliL9qwdzEcrtSxY0SMXRuvFqs4BiM6jqGnwIk9n5u0ejHjH94i8pKEvJ1NQjFFaVjaNBDGUXEZ36Ky7NZd5El4gMVo8xXKw0aXwm4u5BQxAduAtDpHA6pTyALIMRyTc2++sNixy22yfa6Yr//G7j/0CvJiJzZdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="13665885"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="13665885"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 13:24:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="935899957"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="935899957"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 13:24:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rb5gt-00000005BJ7-3FwG;
	Fri, 16 Feb 2024 23:24:15 +0200
Date: Fri, 16 Feb 2024 23:24:15 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/4] platform/x86: Add new get_serdev_controller() helper
Message-ID: <Zc_Sf73kfss-c2TD@smile.fi.intel.com>
References: <20240216201721.239791-1-hdegoede@redhat.com>
 <20240216201721.239791-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216201721.239791-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 16, 2024 at 09:17:19PM +0100, Hans de Goede wrote:
> In some cases UART attached devices which require an in kernel driver,
> e.g. UART attached Bluetooth HCIs are described in the ACPI tables
> by an ACPI device with a broken or missing UartSerialBusV2() resource.
> 
> This causes the kernel to create a /dev/ttyS# char-device for the UART
> instead of creating an in kernel serdev-controller + serdev-device pair
> for the in kernel driver.
> 
> The quirk handling in acpi_quirk_skip_serdev_enumeration() makes the kernel
> create a serdev-controller device for these UARTs instead of a /dev/ttyS#.
> 
> Instantiating the actual serdev-device to bind to is up to pdx86 code,
> so far this was handled by the x86-android-tablets code. But since
> commit b286f4e87e32 ("serial: core: Move tty and serdev to be children of
> serial core port device") the serdev-controller device has moved in the
> device hierarchy from (e.g.) /sys/devices/pci0000:00/8086228A:00/serial0 to
> /sys/devices/pci0000:00/8086228A:00/8086228A:00:0/8086228A:00:0.0/serial0 .
> 
> This makes this a bit trickier to do and another driver is in the works
> which will also need this functionality.
> 
> Add a new helper to get the serdev-controller device, so that the new
> code for this can be shared.

The above doesn't explain why the new code is h-file.

...

> +#include <linux/acpi.h>

+ err.h

> +#include <linux/device.h>
> +#include <linux/printk.h>

+ sprintf.h
+ string.h

-- 
With Best Regards,
Andy Shevchenko


