Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF1B192589
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732532535; cv=none; b=nKUTlCCREyP1CNaJaKLwSJ8D4iDClrkX5kjg0Gb+PymV8JYRCVQ0jPVbl+9NlL/Z0njEgAJetY033IF/z0RXcmR8g/luaxXko5maaZCSkn67czTipJMzdTwRA7JBEh9ba2wL2ytYFQy/4zqCojQUouDfz3Stntn7Ip3qHtlZSQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732532535; c=relaxed/simple;
	bh=T5J6n+Zq5amBiDztn/Fef820qzvjDY1gyydNTrqYsOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGAXudaHR28YZdqDXhdE7K213ud4O0KAXaR1vkvwXWPZ2sf+GN2TmPqLGg8oDfKRPAbykYIouYf3wB7CSVKrx69jxytvThiO82h1ImJ0UYfEv2vUoJZva/MWUeFz6Pi748a/SzBB/Xce2s8vbEGt6m7jdQPDNL44omps3eXcwQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUvXmeny; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUvXmeny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732532534; x=1764068534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T5J6n+Zq5amBiDztn/Fef820qzvjDY1gyydNTrqYsOc=;
  b=LUvXmenyEJfmLGnf3fIt6p/NE7i3opBsH0brVfBTplYxUKCSinM35YWb
   8Kxo943sl1DHs8c4DN3LDxAxWl2bHGOH/9T9hIUQvosXr11PZaLqcq9wn
   8low5gI3+jVSvsr1ebNB2+0To1KrPMJhODHlF47xNozQTbjvFqHD1Jb4W
   vc2ygIRV63xedAwdzc1Si65w9zDIMml1rPdu4melojzCFE+shAo5Pk1jL
   nXX/RpY7ENtlpT8Mqjya8gx7LnYqm1NaNjpOXwwJlMg1/pHCUuT59TjE3
   PYnE0h9qYQd19LgdzvLKyQnhFi21l5FiAMmNyi20P+WrI4l+hk5QEhOtP
   w==;
X-CSE-ConnectionGUID: jPS0MUgOSHyOJMf5EyjTLQ==
X-CSE-MsgGUID: cLKm+ceoQfqLB8tjP1IxGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43290778"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43290778"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 03:02:13 -0800
X-CSE-ConnectionGUID: N7vapx4pQaGaXuD3N+uUJg==
X-CSE-MsgGUID: kNY6tsm0SlKZviI2XL3K7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96289854"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 03:02:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tFWr2-00000000iwP-46sZ;
	Mon, 25 Nov 2024 13:02:08 +0200
Date: Mon, 25 Nov 2024 13:02:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com
Subject: Re: [PATCH v2] p2sb: Do not scan and remove the P2SB device when it
 is unhidden
Message-ID: <Z0RZMNQGMrZR8BTj@smile.fi.intel.com>
References: <20241125042326.304780-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125042326.304780-1-shinichiro.kawasaki@wdc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 25, 2024 at 01:23:26PM +0900, Shin'ichiro Kawasaki wrote:
> When drivers access P2SB device resources, it calls p2sb_bar(). Before
> the commit 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls
> during PCI device probe"), p2sb_bar() obtained the resources and then
> called pci_stop_and_remove_bus_device() for clean up. Then the P2SB
> device disappeared. The commit 5913320eb0b3 introduced the P2SB device
> resource cache feature in the boot process. During the resource cache,
> pci_stop_and_remove_bus_device() is called for the P2SB device, then the
> P2SB device disappears regardless of whether p2sb_bar() is called or
> not. Such P2SB device disappearance caused a confusion [1]. To avoid the
> confusion, avoid the pci_stop_and_remove_bus_device() call when the BIOS
> does not hide the P2SB device.
> 
> For that purpose, cache the P2SB device resources only if the P2SB
> device is hidden. When p2sb_cache_resources() is called, check if the
> device is hidden and store the result in the global flag p2sb_hidden.
> Check the flag in p2sb_bar() and if the device is hidden, refer to the
> cached resources. Otherwise, read the resources from the unhidden P2SB
> device.

...

> +static bool p2sb_hidden;

I would call it p2sb_was_hidden or p2sb_hidden_by_bios.

> +	pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
>  	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
> +	pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);

We already pass the devfn_p2sb to that call, perhaps you can simply move these
configuration writes there?

> -	/* Hide the P2SB device, if it was hidden */
> -	if (value & P2SBC_HIDE)
> -		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);


Thinking of how this change is done, I'm wondering if we better split it to
some preliminary refactoring to make it clearer of what's going on on each
step. Note, it's not a problem to have a series of patches to fix something and
it does not rarely occur (I believe Hans had done this many times in the past).

...

> -	cache = &p2sb_resources[PCI_FUNC(devfn)];
> -	if (cache->bus_dev_id != bus->dev.id)
> -		return -ENODEV;
> +	/*
> +	 * If the P2SB device is hidden, refer to the cached resources.
> +	 * Otherwise, read the resources on the fly.
> +	 */
> +	if (p2sb_hidden) {
> +		cache = &p2sb_resources[PCI_FUNC(devfn)];
> +		if (cache->bus_dev_id != bus->dev.id)
> +			return -ENODEV;
>  
> -	if (!p2sb_valid_resource(&cache->res))
> -		return -ENOENT;
> +		if (!p2sb_valid_resource(&cache->res))
> +			return -ENOENT;
>  
> -	memcpy(mem, &cache->res, sizeof(*mem));
> -	return 0;
> +		memcpy(mem, &cache->res, sizeof(*mem));
> +	} else {
> +		pdev = pci_get_slot(bus, devfn);
> +		if (!pdev)
> +			return -ENODEV;
> +
> +		if (p2sb_valid_resource(pci_resource_n(pdev, 0)))
> +			p2sb_read_bar0(pdev, mem);
> +		else
> +			ret = -ENOENT;
> +
> +		pci_dev_put(pdev);
> +	}

Can you split these two branches to two helper functions. In the result it will
look better in my opinion.

-- 
With Best Regards,
Andy Shevchenko


