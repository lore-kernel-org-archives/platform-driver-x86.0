Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D515819ADB0
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732798764; cv=none; b=O4SmxrYgjQS8UX9RIVsEAgWwL5EF8NCOBi7Fl4G06d3SPLT39Q6CkuUedVu4UWsk7UN2lkBminGVQMv+m8x1l2aa3A+jFuMiQJ7q0Ssmnj0AxjFs5YCIPptd5iAo33e3R23BGZ8qSkRmpSZlcTa2NPyVJsPyQHANCm/hFP+TXm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732798764; c=relaxed/simple;
	bh=JrFwq4pGen+xim5dCwsNMrvwX0g/P9TupQM22TdTO10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7yFGwZsILLTeMUY6OA4CZWZGBQGXknEcF9SufTpTAdh8jlc5bDye4TSs5YnajYmg1zC0W2ZhYSzBo7W1TGQ+npw+Vb/yBjk0SugisKJenZZsDI4Vc44bznxHDcAgMxAIikB6YXnu+mluZ0P0vks9clUsCgZVnipg8kzc0tMWT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHUF3Bpe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHUF3Bpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732798763; x=1764334763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JrFwq4pGen+xim5dCwsNMrvwX0g/P9TupQM22TdTO10=;
  b=gHUF3BpeXRFPUzujMIj/ZAievkQBP/cKNx2MN+MYwupogH8NVeIHJrqg
   cWlrgoElyS0hdlbo8Z/4bo6MelfOZcihFo26kEBbCMKAxmihcAY/kgxjE
   jV4afp/jbx8ooefa87aqukvOuiXGDpWb6YRnJxleEOWytt2ILvLRQsBtv
   c49PZCD1L0EF6F6U8JWN01+xzG1M8ASzL+zoB2bmgdeg7izQy+cmLI761
   v7LtYQP2cGU8XBOLDHMOFbfco1ahx4PCvgTBT851/jLvs3aJux0mLJr4X
   fA7k+IpNsOImZS+bpPziNW5gkMPK6/dr4RWSIEmVqQaNVCaV1Pi49JnIp
   A==;
X-CSE-ConnectionGUID: 1GNq/ieXSaOFHi/caVtRLQ==
X-CSE-MsgGUID: SKDlzJQyRqmrQ75YhA0AyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33172698"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="33172698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 04:59:23 -0800
X-CSE-ConnectionGUID: sH4ZHrBWQ7aLwAZjuu++Iw==
X-CSE-MsgGUID: 2OcgzXZsQQ2/4gHgCiuV2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92038262"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 04:59:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tGe74-00000001vZr-1Qqn;
	Thu, 28 Nov 2024 14:59:18 +0200
Date: Thu, 28 Nov 2024 14:59:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"danielwa@cisco.com" <danielwa@cisco.com>
Subject: Re: [PATCH v3 4/4] p2sb: Do not scan and remove the P2SB device when
 it is unhidden
Message-ID: <Z0hpJu95bzEq9E8f@smile.fi.intel.com>
References: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
 <20241127060055.357498-5-shinichiro.kawasaki@wdc.com>
 <9606e49a-0a8a-450c-bece-a834df8ea480@redhat.com>
 <24wfa4ytdy5brrtflstsnwfspq4eqontuqqwqk4xbeeal67ppi@mcb2amxhhdtd>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24wfa4ytdy5brrtflstsnwfspq4eqontuqqwqk4xbeeal67ppi@mcb2amxhhdtd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 28, 2024 at 12:26:05AM +0000, Shinichiro Kawasaki wrote:
> On Nov 27, 2024 / 10:55, Hans de Goede wrote:
> > On 27-Nov-24 7:00 AM, Shin'ichiro Kawasaki wrote:

[...]

> > > +	if (p2sb_hidden_by_bios)
> > > +		ret = p2sb_scan_and_cache(bus, devfn_p2sb);
> > 
> > ret will be returned uninitialized now when p2sb_hidden_by_bios is false,
> > so this patch also needs to initialize ret to 0 when declaring it.
> 
> Ah, right. Will fix it in v4. I compile tested with KCFLAGS=-Wall and expected
> it would catch such mistakes, but it didn't. I found that -Wmaybe-uninitialized
> does the check. Will use this check for my future patches.

Just use what kernel Kbuild provides already to you with carefully selected
warnings, i.e.

	`make W=1 ...`

without any need to hack KCFLAGS or anything else.

FYI, the above mentioned warning is included in level 1 of Linux kernel Kbuild
W facility. But if you want much more, there are level 2 and IIRC 3, but I'm
not sure.

-- 
With Best Regards,
Andy Shevchenko


