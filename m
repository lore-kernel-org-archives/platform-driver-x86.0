Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B121FBF7C
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731493574; cv=none; b=aWdd1cWsV0w6/WJfhO0MhdFCSyEb/LHH0oOiFFeOyAF48hDeOiXHZXnZwY+0KgnjWIrWBpLQ7rZrajGqEN0/yj7TCEAXyAG7XJSVGUAscLzTqUom0DkaYYbX6c1+XKcg7r8v6YmPMWVdYKJqZeI1ycXpwHS27eXAp1jtXtrdL3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731493574; c=relaxed/simple;
	bh=AaWtQezRf5n95+J2LluOVp5nuttkjgQE+VmbqBeG0ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzX5T46i9Jaf42JUa6OOUSv30/7MkBwgkCvDrGitRoEaeEUxrEFuC6Vs4rgeydtboN3nCkaE9kSig4xDlsdHUflMB4X/2f6iskYbRiMuoExbwsqKnwSr/DV/5V+wpS7YVdWHoMDr2xQgzuSfGgECtSrRCHtDg+aA1M/6S0HHpHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjkWT37g; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjkWT37g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731493573; x=1763029573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AaWtQezRf5n95+J2LluOVp5nuttkjgQE+VmbqBeG0ac=;
  b=MjkWT37gIR+QZTjuhUbzLX1b5nK8DpU4egzfYQk28s5R/13hKGF3cUKf
   3uSAk0ZYLpvg4X20LNJ66nhJ6hOyEP/sNh1ydcdxG2C1zA/3UGc2JINpl
   AEbJP5N9fOr1Z8EVmChvjd454OL2g/ixqQca2qpoAmLFRu0iFpA6u5svc
   0PE/Rds8c1w5mziwQovy0qqqhG2nJrcu0xOj/2cUeuxf1a0kAX3nkg2Q2
   t4mghPd74Ya6fioEQcbf1SLWS28r4qEmlHFewucZ6UVmF1/ALAX3ps5KW
   lwyP5Hqe6C/r9eZifzF1cFWVrU+JqvK37Pv+uGpUPoGtYufLefyZ/KJo1
   A==;
X-CSE-ConnectionGUID: MfMHQjzsQG2UbdIxO4cXzg==
X-CSE-MsgGUID: mwVu7wesS3it6J7VT0mS7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30772840"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="30772840"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:26:13 -0800
X-CSE-ConnectionGUID: ltoO5klNQvapAy2LKQFk6w==
X-CSE-MsgGUID: ZN4tFoGBTTS8TLXyEinHkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="111141340"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:26:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tBAZc-0000000EIuX-09ZM;
	Wed, 13 Nov 2024 12:26:08 +0200
Date: Wed, 13 Nov 2024 12:26:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Subject: Re: [PATCH v2 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Message-ID: <ZzR-v4wiKCqRcd6q@smile.fi.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
 <20241112163035.2282499-2-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112163035.2282499-2-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 12, 2024 at 11:30:34AM -0500, Michael J. Ruhl wrote:
> Usage of the telem sysfs file allows for partial reads at
> an offset.
> 
> The current callback method returns the buffer starting
> from offset 0 only.
> 
> Include the requested offset in the callback.
> Update the necessary address calculations with the offset.
> 
> Note: offset addition is moved from the caller to the local
> usage.  For non-callback usage this unchanged behavior.

...

>  int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
> -			void __iomem *addr, u32 count)
> +			void __iomem *addr, loff_t off, u32 count)
>  {
>  	if (cb && cb->read_telem)
> -		return cb->read_telem(pdev, guid, buf, count);
> +		return cb->read_telem(pdev, guid, buf, off, count);

Also possible instead of the below changes is to add here

	addr += off;

>  	if (guid == GUID_SPR_PUNIT)
>  		/* PUNIT on SPR only supports aligned 64-bit read */
> -		return pmt_memcpy64_fromio(buf, addr, count);
> +		return pmt_memcpy64_fromio(buf, addr + off, count);
>  
> -	memcpy_fromio(buf, addr, count);
> +	memcpy_fromio(buf, addr + off, count);
>  
>  	return count;
>  }

-- 
With Best Regards,
Andy Shevchenko


