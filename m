Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182C0224FD
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028724; cv=none; b=ipRMJufnWYqcxykeJc26GCj74qvqMipUJxshuWTsk4hiK/hgiglfFtmpEGt3tkLZcDj3UdKLDZb1gJ3WXFa5WgISQggWkyyHOFdscKhFpFMYt4gQRTsSTL2wAS+xI5FUJAqMBZbC5orvOcb1+hmQ5xrAVZEy17ZL/46G62bTUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028724; c=relaxed/simple;
	bh=oKpEd14LW1GDwrFpJW0j9bqJUDFzwj7hafr8Mn+V3bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zf71RRiT/MTrsedoVGF1Wx3cetXZHekax+5HdOtZ7mpMWuQO2GlHHsUAFpoThxNBJotIHOSD7xY9CC9ZggcS+YdDDUzBDXvSFh5UggXDELO10y3YRbQgmY/ln7zpzZH31OjJ/coFMXwkzb0El3lVsTz/rZqpcXw5ZjH/payxj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: JAZWoUlgR2W4qjOd/3g49Q==
X-CSE-MsgGUID: 9mRS3csfTkulPCopZ/WjxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45302097"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45302097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:25:23 -0700
X-CSE-ConnectionGUID: A0eK6iDkRD6zwu0O/W8OhQ==
X-CSE-MsgGUID: 7KwBMTRrTbOM0Rss53R75w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128270860"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:25:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1lXT-0000000A41B-09zS;
	Mon, 07 Apr 2025 15:25:19 +0300
Date: Mon, 7 Apr 2025 15:25:18 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add Vexia Edu
 Atla 10 tablet 5V data
Message-ID: <Z_PELgOsS6qUUcnq@smile.fi.intel.com>
References: <20250407092017.273124-1-hdegoede@redhat.com>
 <20250407092017.273124-2-hdegoede@redhat.com>
 <Z_Op2fnes11oZCRo@smile.fi.intel.com>
 <9de12c2a-f64a-4804-8347-4462ec663a3e@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9de12c2a-f64a-4804-8347-4462ec663a3e@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 01:22:31PM +0200, Hans de Goede wrote:
> On 7-Apr-25 12:32, Andy Shevchenko wrote:
> > On Mon, Apr 07, 2025 at 11:20:16AM +0200, Hans de Goede wrote:

...

> >> +	{
> >> +		/* Vexia Edu Atla 10 tablet 5V version */
> >> +		.matches = {
> >> +			/* Having all 3 of these not set is somewhat unique */
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
> >> +			DMI_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
> >> +			/* Above strings are too generic, also match on BIOS date */
> >> +			DMI_MATCH(DMI_BIOS_DATE, "05/14/2015"),
> >> +		},
> > 
> > Oh, this is unfortunate matching and quite fragile. Do we have other matching
> > mechanisms in place in addition to this?
> 
> Having both PRODUCT_NAME and BOARD_NAME set to "To be filled by O.E.M." is
> actually pretty rare. Of all the DMI decode's which I've collected only
> 2 other devices have this. Usually at least on of the 2 is set to something
> less generic even if that something is still sometimes not super useful itself
> like "BayTrail".
> 
> So IMHO combined with the BIOS date this should be plenty unique IMHO.

Sounds like a relief to me. Thanks for digging into this!

-- 
With Best Regards,
Andy Shevchenko


