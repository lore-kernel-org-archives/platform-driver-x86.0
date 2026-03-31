Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522463A9623;
	Tue, 31 Mar 2026 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954143; cv=none; b=C8+VZOFpfL3/KwzsDYp+dHhTtcGYQp6kYGiCqe92viCRBDa+46Jt37AjAFQINdBOQ99rWZdwoHq5lirooOT0qhr2M1VSHpgsr0yfy5jcztRTPhclsrMmBsXQSq5tHyMoIbKnwgn4HVs+LMlCIuO+9EoizvY/DkBPEGYP1is7seU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954143; c=relaxed/simple;
	bh=AqF0NP1y7opTlXPUQ/fxNR5RFhP8sFQ6vGpoCTpDv4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGrct8LCHnuQMSv4a1E9bqm6TE32v5TLhqpBq8Xe/FeKX8GW6tGuiCGe9lrgfhXMUUpr7GbxprDFekDEvVmT5PF396X1hxZUctuH1hI46aHqR31wQDGXmxJ32Ry3oiCMvjjftfsagLgas+wvS8sUPedjXoMAWiZRYwiDYj0RGMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2EIzF/e; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2EIzF/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774954142; x=1806490142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AqF0NP1y7opTlXPUQ/fxNR5RFhP8sFQ6vGpoCTpDv4s=;
  b=C2EIzF/eEYqCWauf1o7ov1k3i5xqSW22/nyverXIM9T3YPAEHerCGljY
   rHO1J3Eq16F/+lb7cFtboBNZXtwbUUwl8mjIQkmjnfP57V4uRh1Cpovaw
   e/vmU5FKc+GMKZ/MLsT7IVYt95csOcXMo9i/5qh7TVMEnFowrvmIctaOK
   EONQSlWW6MJwQuX9M1r3rTrqBAPm7D0SFlwpDpqmL3ZLgw0+qr4Ncm0Nm
   e1+gArPCiRlC5gX4Du9nQ10sf3ix8damZfLs/5ZI8+G5Ltz44Exlyna0V
   x8/e9UZAxha+ZHTSJQTcT21eTmc/P1hz4NAZmz339TyWMzXvtTzCyBet6
   g==;
X-CSE-ConnectionGUID: 7Z1YLZsLQpuuKdWaj6p1+g==
X-CSE-MsgGUID: BjV6S0TrQEuDBi+Y84AekQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86657709"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86657709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:49:01 -0700
X-CSE-ConnectionGUID: cJ3JGwBYTLC1H80NGvMlnA==
X-CSE-MsgGUID: 3yKvc5HUQByz7/VA5rtxcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226581712"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:48:59 -0700
Date: Tue, 31 Mar 2026 13:48:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/4] platform/x86: int3472: Add support for GPIO type
 0x02 (IR flood LED)
Message-ID: <acummWToi_YcxBf9@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260331075204.1567624-1-mnencia@kcore.it>
 <20260331075204.1567624-5-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331075204.1567624-5-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 31, 2026 at 09:52:04AM +0200, Marco Nenciarini wrote:
> Add support for GPIO type 0x02, which controls an IR flood LED used
> for face authentication on some laptops (e.g. Dell Pro Max 16 Premium).
> 
> Without this patch, the kernel logs "GPIO type 0x02 unknown; the sensor
> may not work" and IR sensors paired with a flood LED cannot function.
> 
> The flood LED is registered through the LED subsystem like the existing
> privacy LED. Unlike the privacy LED, it does not have a lookup entry
> since there is no consumer driver expecting it via led_get().
> 
> To support multiple LEDs per INT3472 device, convert the single led
> struct member to an array with a counter.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


