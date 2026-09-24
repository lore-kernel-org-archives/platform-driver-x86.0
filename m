Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FA32264DB;
	Thu, 24 Sep 2026 21:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284655; cv=none; b=hMRJPcpFZvIJkqcdBn/2D5yQ4e2EDmasZ4k4B+7NxRTd/87hwLVIcGEZ7CSBam0ZtyLqtZXQ3JSQlgGLxCMMcKFYZFX7fsmc5ueDSoozndFdIb9XBrfOPpxZA+K0htqGoVJlD3PHCGENF45WkQZQ/8sC8NxK0YwO8iKYeg81JgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284655; c=relaxed/simple;
	bh=4bq6mZbw5T5zSm+f85/RhsZNoM5HIiU8m2jmpqiDYxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuQKV4O0ygCHJwvjy2QgskTINcmBB1bRLzwG+jXUPczWKYhD3ed2UX05hmoK6aIHQ5iWV5HNY9KU7r4rX50nlwVEZgimhK9s/i++s3ALXx1rVBKAEUZHrvUYHsxPe8yOfGmPHOeDRlGSmx/OBbJcVcZP4b6/4rK7IJ7K2Ft/8z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnKIm7ER; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnKIm7ER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790284654; x=1821820654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4bq6mZbw5T5zSm+f85/RhsZNoM5HIiU8m2jmpqiDYxA=;
  b=RnKIm7ERdUtkNq4lcB+HOflsl37DlDmmVnF51lQmFeQd9VIu/4j0RfWq
   jWpz9Cl+qTb+d+SrJiU3SVcs4wEjPavcuZFAzNTlz83VzuEtu9XTuXaQy
   +fz0PD1q2wvSnywr8Mw8geIkgjoF4LJ6NDgvwXMXeua7ApnipsTtsIpQK
   caV22H9Qcq9rRTmu9qbGdHTwIQzTv6fJkl7/OtQY61VP2vYiBMJ7gfCua
   O2Tx9tsfzo2fWTo/s3XYZYSKTLUQ7yVIz9RL6UL3I73miDcLD0z9xfzej
   dAlK7lRhO7mNkM+lMXz9T9Hjd5w0W+gOZaLIeg3Xf3ChJc2u76V0pZ2oI
   Q==;
X-CSE-ConnectionGUID: 0uQDt20tRFG6jsf9hTHvOQ==
X-CSE-MsgGUID: tGq47+61RB6x7BZ6ldkHaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90197658"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90197658"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:17:34 -0700
X-CSE-ConnectionGUID: XgeUjLX6QyuFak7yfVqIrg==
X-CSE-MsgGUID: et2+jYlAQ5yjO1Ffv0WHjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="270629972"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.199])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:17:32 -0700
Date: Fri, 25 Sep 2026 00:17:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/19] platform/x86/intel/tpmi: Declare the loop
 counters in their loops
Message-ID: <arWTaYKQzTpRaR1D@ashevche-desk.local>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260924182342.212709-19-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924182342.212709-19-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 24, 2026 at 11:23:40AM -0700, Kuppuswamy Sathyanarayanan wrote:
> Declare the loop counters in the for statements that use them, so that
> they are scoped to their loops.
> 
> In tpmi_create_device() this also replaces the tmp cursor, which moved
> in step with the counter, with res[i].
> 
> No functional change intended.

...

> -	for (i = 0, tmp = res; i < pfs->pfs_header.num_entries; i++, tmp++) {
> +	for (int i = 0; i < pfs->pfs_header.num_entries; i++) {
>  		u64 entry_size_bytes = pfs->pfs_header.entry_size * sizeof(u32);
>  
> -		tmp->start = pfs->vsec_offset + entry_size_bytes * i;
> -		tmp->end = tmp->start + entry_size_bytes - 1;
> -		tmp->flags = IORESOURCE_MEM;
> +		res[i].start = pfs->vsec_offset + entry_size_bytes * i;
> +		res[i].end = res[i].start + entry_size_bytes - 1;
> +		res[i].flags = IORESOURCE_MEM;

This should really use DEFINE_RES_MEM() instead.

>  	}

...

The rest is fine. So, make a prerequisite patch and rebase this one on top.

-- 
With Best Regards,
Andy Shevchenko


