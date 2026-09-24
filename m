Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B065414A15;
	Thu, 24 Sep 2026 21:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284758; cv=none; b=pzySkS5ANMV6BJkE8q39S3P10ncdBtFtWaGGSkh+qt+a+VXN8h1wtcxVZnnnMpYd37R+iR1sV4bXyELOaSAnV0BUqw8UfH22k+SyvxuMIhEEcBAegLBoPSyDoh/beA2Vwf8f5QtU9dIZyrE452Q9bJjM9IrcOlLJXHyzehcMjug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284758; c=relaxed/simple;
	bh=jwufRdatKnQK/OvIT3XCWmAShCOpMRWmlGh9j/iTB38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXKyfWoc/2ZibisYyjP7c/IyAA/uQ9LGP0vlbZQ5ofYAnejuNRGg5OrToqcwWkr67TQF6vLhoXtj7oCwfywxVBk0sTk7zkwqudFro1aPrdfjedOzSsUMjHMKe6IKe/zdyvCAr6OCtxo9r8Ek+i6+bc9A188DQN0TOy45iZN0IA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aw2qwZJD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aw2qwZJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790284756; x=1821820756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jwufRdatKnQK/OvIT3XCWmAShCOpMRWmlGh9j/iTB38=;
  b=Aw2qwZJDXwBY6aKOHI07IRlHZ5sGWk6EinGl7BNrFK3K3Zn0AdMRw0V4
   +ZIbPuOnwzFyMXLmTcdXqgTCU1xzQFWrslZbQANhCf4b/TEr6rCzFyyb8
   gW/jyx/Aae3xQJnfx4YwYNa9G8SC+5mj0PX8Hhjl6kNJFWrseXMu/7EyC
   dRIYxK2tWdc4iZpNHmFPum7H3wjBAVKTCVL9RE7MyShbcM4Xh07uGVFSy
   5IUu43zpRo822ho14gi1CURvyLFqE1bw6nuuuwmWZ0BHUtYuS+icfEX2L
   OlgXzvBPXhklLMaPZ+eEM05IapeddowgIb6Bjelo/CYr5KA1Lp3H4nu/6
   g==;
X-CSE-ConnectionGUID: 0nLZyKlCRCuKCFTVMinlyw==
X-CSE-MsgGUID: F1fIapLISUWHnWi+No9FXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91176707"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91176707"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:19:15 -0700
X-CSE-ConnectionGUID: tErHgJX3QK6DNtktH0IE0Q==
X-CSE-MsgGUID: pxxr8hO3TKG5LaMYavvn8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="273706508"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.199])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:19:14 -0700
Date: Fri, 25 Sep 2026 00:19:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/19] platform/x86/intel/tpmi: Describe the device
 creation policy on the function
Message-ID: <arWTz4LQu_7xEZpv@ashevche-desk.local>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260924182342.212709-20-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924182342.212709-20-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 24, 2026 at 11:23:41AM -0700, Kuppuswamy Sathyanarayanan wrote:
> The comment explaining the error policy of tpmi_create_devices() sits
> inside the loop, between the call and the check it describes. Move it
> above the function, where it describes the policy as a whole.
> 
> Also split the check into its two cases, skipping unsupported features
> and failing on any other error, so that each reads on its own.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


