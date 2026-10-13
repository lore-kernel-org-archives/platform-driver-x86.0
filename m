Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9338D519E10;
	Tue, 13 Oct 2026 19:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921147; cv=none; b=saNl8Ca8af2Jqu3R0cJSMQl/6JmaN196VgZb0pPf+frfK9CWFuX4/r39NC8uWhiwNZyrT4ou/Ydkmac0bjRGF0XHQLmpi4iOM7HCHJhtfOXkDOl7Mj3hDcG/i+d9XSk9VCLFx1nhfbW4sV2+rXVEXPsoB4OSXPoDaJCCAowCM+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921147; c=relaxed/simple;
	bh=SMeDeVif0Kp6HSWLfz1gAJamJtmcWFjXPgwb6diL8o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agcPp1jfFpTfJFmeysndrQzvEtFZo42GqUu16EC8TQWOvCjEVHX686VW0yDVRbPGKH2OL6ttucp1GV53lexuPBxNd6TDVKuaoGlmalNjEfylrSnA5f9a8axonqXmCggxGtUpNHNaEl/PDH+nqO/LJRlafM/wlxkiBC1ipa4KXRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ne/fzR9p; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ne/fzR9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791921145; x=1823457145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SMeDeVif0Kp6HSWLfz1gAJamJtmcWFjXPgwb6diL8o4=;
  b=ne/fzR9pQ4mjvfCnw454gVmd7bF1/UFtXf+StxoTJlHfn6CeeEuXmHKV
   863TlqhH7YWH10NB8cJnJiYu9eX/RSteWSi9mHVE+a2OCbBgl/iWtDjye
   kIoX9fqrTqft0v37leH/1U/pOY1U52ZHE2Mkn88M5uExrgFPOsSlCFp5S
   XY99eI/CPSc7I4VyvoTBB1qWJTytA6DkSgpUpKlBXDH0InmEJCFd+35bh
   o+66vErA9ZgWazzpz9APsx9pjOtWgWlR9c977rqLW6HwgfoIeN2qMnbR9
   VWF9+JCXv/UaMaBAAXJtTOjuHLJ6Ajys0xpSWkrVkxKalfuyO4Lyd1elS
   g==;
X-CSE-ConnectionGUID: Ero0FfbiQ6W6WA2H+5uHKg==
X-CSE-MsgGUID: sxfIFzHyR4WWrM8FeHIB4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="668645"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="668645"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:52:25 -0700
X-CSE-ConnectionGUID: 3By2UcNJQ4qm6NSdvM+oJg==
X-CSE-MsgGUID: sp9WI9OASF2c5X+npR1N3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1255399"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:52:23 -0700
Date: Tue, 13 Oct 2026 22:52:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 17/20] platform/x86/intel/tpmi: Use scnprintf() to
 build the debugfs names
Message-ID: <as6L9HHCImFtGNS_@ashevche-desk.local>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20261013192935.2243291-18-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013192935.2243291-18-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 13, 2026 at 12:29:32PM -0700, Kuppuswamy Sathyanarayanan wrote:
> The kernel has both snprintf() and scnprintf() for formatting into a
> fixed size buffer. The preference is to settle on scnprintf() and stop
> adding snprintf() users, so that only one of the two remains in use.
> 
> Convert the two callers in tpmi_dbgfs_register(). Neither of them looks
> at the return value, so the difference in what the two functions return
> does not matter here.
> 
> No functional change intended.

Okay with me, after a small discussion in previous review rounds.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


