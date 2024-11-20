Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C08174EDB
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732110242; cv=none; b=s36SuvRrk2VJvAU+eVZdP84GIugkaqAZrjnntpKVbufgNdzsJmUKkd9uoWMflRpyD4Z1CHFbqYQdkqaAEp/UfBGEqGUyyQ3J/a18PbiBSjmweZbPPqezjbhBjVlxNW+Lkn5Ois2tddE6c5tVZsiKhlSzbIWqTkAdBrHU24bfjM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732110242; c=relaxed/simple;
	bh=Zf/8J5XkQn4lHiYTHSQ5uI4TioMM+sQRCEg4eRgv9ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZx6k8OzfwIIG1EzYFd2LQ9rHG8iOUB72CmIEzYU9Qym6eLg9TDLL5gn7xQ7x6cpxzojWBQ41ba97Cq9vAdR4JeCC8jIaIijsnaz1oZczL/Whl1hC83+SKxOG3cN0DAZYfDLPU4c2OayP9oOtMb17rpjKRZX4nyagP6ZCwN3+kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnW7i3VH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnW7i3VH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732110240; x=1763646240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zf/8J5XkQn4lHiYTHSQ5uI4TioMM+sQRCEg4eRgv9ko=;
  b=mnW7i3VHTYzLmAnb/FjSmsVLVc/4rJA5z2MwUJSpdTn2mokwPgtgfAem
   7r42fmZPtJYU7Bjql+uvRaUBt/xMPVHyFtM+f1LHQ9ZIa5PLG9wFd1mOn
   5YUF3HY8EaPSh3KuOoJ1v7xPtK9jE+ZsFUv3XUZOe2jL14AQBUB6/LyZY
   rWh7wbZyl9rYg9nVPM5lR5mwrNdNEGUdVl/fIgJXgmsIZ1fvkKi9UJPKE
   VCFqdz5k7jMsuENqOqucdAoZ6nHl0jHqQtpEmoz/SVfs9RktGjQUnjhZm
   EWCpvx+9xEQ6O12nJS7x15hFI4BxQeesrcMWTk2h9r+FDRjgPTAFTxoU+
   Q==;
X-CSE-ConnectionGUID: NU02gUr3QdOj0BT6xXHJFA==
X-CSE-MsgGUID: dtDM7tEZT1ybD/osdTNT1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="49595632"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="49595632"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 05:44:00 -0800
X-CSE-ConnectionGUID: Pxwp0r3pQEKF2iI2nzQo2w==
X-CSE-MsgGUID: vv+2yiwUTGGfQCHX27OlPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="89870807"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 05:43:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tDkzr-0000000GirS-3gB2;
	Wed, 20 Nov 2024 15:43:55 +0200
Date: Wed, 20 Nov 2024 15:43:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com
Subject: Re: [PATCH] p2sb: Do not scan and remove the P2SB device when it is
 hidden
Message-ID: <Zz3nm-593xzUw1ZB@smile.fi.intel.com>
References: <20241120064055.245969-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120064055.245969-1-shinichiro.kawasaki@wdc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 20, 2024 at 03:40:55PM +0900, Shin'ichiro Kawasaki wrote:

The subject probably wants to say "unhidden".

> When drivers access P2SB device resources, it calls p2sb_bar() to obtain
> the resources. Before the commit 5913320eb0b3 ("platform/x86: p2sb:
> Allow p2sb_bar() calls during PCI device probe"), p2sb_bar() obtained
> the resources and then called pci_stop_and_remove_bus_device() for clean
> up. Then the P2SB device disappeared even when the BIOS does not hide
> the P2SB device. The commit introduced the P2SB device resource cache
> feature in the boot process. During the resource cache process,
> pci_stop_and_remove_bus_device() is called for the P2SB device, then the
> P2SB device disappears regardless of whether p2sb_bar() is called or
> not. Such P2SB device disappearance caused a confusion [1]. To avoid the
> confusion, avoid the pci_stop_and_remove_bus_device() call when the BIOS
> does not hide the P2SB device.
> 
> For that purpose, add a new helper function p2sb_read_and_cache(), which
> does the same work as p2sb_scan_and_cache() but does not call
> pci_stop_and_remove_bus_device(). These two functions are almost same
> except the device scan and remove. Then make them call the single
> function p2sb_cache_devfn(), which takes the argument "bool scan".
> 
> If the BIOS does not hide the P2SB device, just call
> p2sb_read_and_cache() to cache the resources. If not, do additional
> preparations (lock "rescan remove" for parallel scan, and unhide the
> P2SB device), then call p2sb_scan_and_cache().

Even for the simple read case we have to do that under rescan lock.
Yes, it might be just a theoretical issue, but that's how makes code
robust against possible enumeration changes at boot time.

...

> -static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
> +static int p2sb_cache_devfn(struct pci_bus *bus, unsigned int devfn, bool scan)
>  {
> -	/* Scan the P2SB device and cache its BAR0 */
> -	p2sb_scan_and_cache_devfn(bus, devfn);
> +	/* Scan or read the P2SB device and cache its BAR0 */
> +	__p2sb_cache_devfn(bus, devfn, scan);

Strictly speaking we don't need to cache values when the device is unhidden.
Moreover, the rescan can happen in between and the resource relocation to
another place, which makes cached value invalid.

>  	/* On Goldmont p2sb_bar() also gets called for the SPI controller */
>  	if (devfn == P2SB_DEVFN_GOLDMONT)
> -		p2sb_scan_and_cache_devfn(bus, SPI_DEVFN_GOLDMONT);
> +		__p2sb_cache_devfn(bus, SPI_DEVFN_GOLDMONT, scan);
>  
>  	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
>  		return -ENOENT;

>  	return 0;
>  }

...

> +	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
> +	if ((value & P2SBC_HIDE) != P2SBC_HIDE)
> +		return p2sb_read_and_cache(bus, devfn_p2sb);

This still has to be under rescan lock.

...

> -	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
> -	if (value & P2SBC_HIDE)
> -		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
> -
> +	pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
>  	ret = p2sb_scan_and_cache(bus, devfn_p2sb);

That's why I proposed initially to have a conditional here, but see above,
it looks like the correct approach is to cache values if and only if the BIOS
hides the p2sb.

> -	/* Hide the P2SB device, if it was hidden */
> -	if (value & P2SBC_HIDE)
> -		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
> +	pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
>  
>  	pci_unlock_rescan_remove();

-- 
With Best Regards,
Andy Shevchenko


