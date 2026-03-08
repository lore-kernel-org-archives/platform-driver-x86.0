Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B7D14A62B
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 21:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773005220; cv=none; b=CpVTkemKgRk/lPpmOme/jqFIHpb9MPeCGengWJFKqi37nDV+sUJ/NcRQkb5rDwbQSL3rDGRGx5NcktgsyqhoQA8RD6/GGNgwZdba8UmtESr9CDy1cwLl2aYLnfdf1gMXzEyEAX8LTk5sl9fOtTsmuCFb0LD8frFKX3tdwcAuucA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773005220; c=relaxed/simple;
	bh=LT2JYVfwwio9yukv5BoujRoxwxGHGgL+OcLD9muEG0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vv8kFkFqZqvCVs5ndTWAY6szhgWDL0g8Rn/brfOB9bgx37Be0IAq2Clo4fbvdYO5TSxmkqm1Ma5QXl2LgjImRi/ItPTJV/PU5MDXZW+KWsS/hJo3v3f/xRAVYvCYXFYNFJ1sZtvZEcVXX9CjZtZhAfVCQgYQPvANb4xZa5xP4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liE5mvMS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liE5mvMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773005219; x=1804541219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LT2JYVfwwio9yukv5BoujRoxwxGHGgL+OcLD9muEG0M=;
  b=liE5mvMSm3out0/rxKsU1w7M9eEHgePGvqM27hmeccXqJRP2gTVhJiho
   UvxjKRhvU8mJYK66vdlpn6erY/j6GSRMCe/4PEDr8Izxczrn6NA3Ha9TH
   w32pdHPekQsLRUDTBXrsuf4HN0hya/Rf+3rEq2ICJXWUSy96RKdbYdAio
   9/KHNKuPq0Tob2L6aSbdGBsV9/z9jwSDw3cbUuwpK1kIQx3LcT1HE4UlZ
   K+6oR2iVasuf5Z7rNgduA/P9MaMEZGpCmW3AsR/L61f1OIShx8Bi0xL1g
   rvsuQmdf/MvbTCmQ0TUS0qeHlLylP+tnRSxMderutNpp1DH6MaXVwY+pw
   A==;
X-CSE-ConnectionGUID: dSR/58vmTliH4cdWxRQAGA==
X-CSE-MsgGUID: JbWZFFeRTiKWCgsVLJuHJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73949715"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73949715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 14:26:58 -0700
X-CSE-ConnectionGUID: Tm8OxnmRSIiqbUnFiCnUhg==
X-CSE-MsgGUID: XXHxwVlvT1ijfokAYqv/Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218759127"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.83])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 14:26:57 -0700
Date: Sun, 8 Mar 2026 23:26:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: lkundrak@v3.sk, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH] platform/olpc: olpc-xo175-ec: Fix overflow error message
 to print inlen
Message-ID: <aa3pnRIeaXv_QIG5@ashevche-desk.local>
References: <20260307190533.3025563-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307190533.3025563-1-alok.a.tiwari@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Mar 07, 2026 at 11:05:31AM -0800, Alok Tiwari wrote:
> The command length check validates inlen (> 5), but the error message
> incorrectly printed resp_len. Print inlen so the log reflects the
> actual command length.

TBH, I am not sure if this is correct or not. Yes, at the first glance
the logic seems right, but looking at the code one needs a deeper
understanding of the EC communication protocol, especially on this
certain platform to explain the meaning of the error message here.

I leave this to the maintainers and others who know the code and platform
better.

-- 
With Best Regards,
Andy Shevchenko


