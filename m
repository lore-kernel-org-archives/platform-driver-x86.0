Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD558231858;
	Wed, 26 Nov 2025 21:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764191692; cv=none; b=HQUpznoh6t93TCfL3kt62moB5rpBVub0roe9/wfJn+lf+WKOg7wTCUQuqWPITmjIua4CBDjJQm9rz2Bm7icU+bit+0nkqfOAHYMJ9jWqAb3g911CtE1d0dUggDyrdZ/mnnb2b3YNbQToM4En+1ulylB9+0iYa/alnC0+1f7zmDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764191692; c=relaxed/simple;
	bh=q1epT1EF6lz5F7r3rUHRFuu22mgWRoFS+MuXbXHq3Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdQrZnav/lqjPwc3EuIoT5j5lGQhN+F6moyVWCa1OafxBRRGOnY5Ua0mrcKKBEZ2JzU2fO8wGL7lq/SS+/chCWbQGCAgwYdO4thAxeOHBux3GJZKVaBYvrEIu6aHACWIzRS+9Xs1liZzzbOts1fZLL/zheCcDecGcyoG3V8GmdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQZXZPs4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQZXZPs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764191691; x=1795727691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q1epT1EF6lz5F7r3rUHRFuu22mgWRoFS+MuXbXHq3Cg=;
  b=MQZXZPs4b8QeuT8vC9V28aR13RGXxUCXviD5xeqYdhF2+Q5vgrPwlpqD
   NCzpz7eWysfXRWQ1CqrfnDEcOMHVflLXGspQsyqMDhMqKFPcCjPv2aD9H
   OqiPw1KkOl+LjV0+Sn0NZgBb6OzFMhRngi/T/rGPh7W+hySarJgeA85nt
   HXDhppN1oibahZ6UvXxSM7+qIXaRDaLvFHmsAGd+0Mq72FfXvsveUoT//
   pqA7qLPZRt7UgPyKOuk95V805w8xbAqkqTR1ZjZiXvnew7ophZ1ETksu5
   ns1lyrrKl4w1W3NGqzwHEgZcHyHY3V9wiNN248JF3NOSu6KkjjGUDAY9U
   A==;
X-CSE-ConnectionGUID: Dxia0mT1S9yh0rIeaPbCuQ==
X-CSE-MsgGUID: yBdqo3PNRdql8f+DhfglSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77712607"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="77712607"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:14:50 -0800
X-CSE-ConnectionGUID: 9PHmTYvgTsymtKyV8frMbA==
X-CSE-MsgGUID: XCRqQ7m3SNeJ0wl1h2ewiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192953969"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:14:48 -0800
Date: Wed, 26 Nov 2025 23:14:46 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/nls: Fix inconsistency between utf8_to_utf32() and
 utf32_to_utf8()
Message-ID: <aSdtxhgmFsjqERvl@smile.fi.intel.com>
References: <20251126204355.337191-1-W_Armin@gmx.de>
 <aSdtinICsqilW22N@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSdtinICsqilW22N@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 11:13:50PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 26, 2025 at 09:43:55PM +0100, Armin Wolf wrote:
> > After commit 25524b619029 ("fs/nls: Fix utf16 to utf8 conversion"),
> > the return values of utf8_to_utf32() and utf32_to_utf8() are
> > inconsistent when encountering an error: utf8_to_utf32() returns -1,
> > while utf32_to_utf8() returns errno codes. Fix this inconsistency
> > by modifying utf8_to_utf32() to return errno codes as well.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> Thanks!

Note, you might need a Fixes tag as the original one was marked as Fixes.

-- 
With Best Regards,
Andy Shevchenko


