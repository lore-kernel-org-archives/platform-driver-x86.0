Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8B51BD9DB
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732809234; cv=none; b=CNTeM1oIRuNsjBFBsX6iI5I4RQEyW4UsPy6mS1RYw051HkdanOx/6grKR8xeJgo0NjC2o/moMJrpjNzhKubupkI/uSfbj4Bhyi6WJg7UaXzcguJm1UhfGJqffRapfvpTKKkliySBBYkHzJIe2KllrgQG6jImo7wdL809nxOHe1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732809234; c=relaxed/simple;
	bh=vSazuLyPLsEb8ZcbwKvajswM9fz5xz9M1zohiv4bamI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGPHV4gTUyCh+QJBGeTyktCqWH3uld9EnK0gGzQmtTYFOipldMVhXlP0B4U9/D1yL2t0VJmrZK5z2ta2gghetO+InQU0Q7DLwT5Et1RfnsLwliTMtgMRZ+7iKxu8Er4V+XIuQVq+9bzyGjgTtjdt+R3epQBjZ382IIw+rP8nXiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: WavwdXSESWubRUs5KtwXmw==
X-CSE-MsgGUID: M6xwA4m6RdijrRMR0kzsgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36976739"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="36976739"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 07:53:52 -0800
X-CSE-ConnectionGUID: t2iBK/b7QcSBzPudVEdzSQ==
X-CSE-MsgGUID: ksXgzY1XRxGAUbyJoCEwBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="91889395"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 07:53:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tGgpx-00000001yvA-00uY;
	Thu, 28 Nov 2024 17:53:49 +0200
Date: Thu, 28 Nov 2024 17:53:48 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/4] platform/x86: int3472: Fix
 skl_int3472_handle_gpio_resources() return value
Message-ID: <Z0iSDNyNhh3UPAN5@smile.fi.intel.com>
References: <20241128154212.6216-1-hdegoede@redhat.com>
 <20241128154212.6216-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128154212.6216-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 28, 2024 at 04:42:11PM +0100, Hans de Goede wrote:
> The INT3472 code never wants a copy of the ACPI resource to be added
> to the list-head passed to acpi_dev_get_resources().
> 
> Make skl_int3472_handle_gpio_resources() always return -errno or 1
> and drop the now no longer acpi_dev_free_resource_list() call.
> 
> Also update the inaccurate comment about the return value.
> skl_int3472_handle_gpio_resources() was already returning 1 in the case
> of not a GPIO resource or invalid _DSM return and not -EINVAL / -ENODEV
> as the comment claimed.

...

> -	acpi_dev_free_resource_list(&resource_list);

Even though it's better to have this (no-op) call. As people may use the driver
as an example and then make the real leakage somewhere else.

-- 
With Best Regards,
Andy Shevchenko


