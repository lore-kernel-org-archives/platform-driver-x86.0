Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383F34D916;
	Thu,  1 Oct 2026 18:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877876; cv=none; b=hEuW7ZkiWRohYH4Y9ZFh1bqa8B5xiDdN2DXe0FDxSYwyzaVgjhqfxSRU3PbqwR5d0gRirQoGtz8mnumR5tzbpeEljBO4IwL2JIRLMsnDOHaPWyjIINNqL9YAP7UcGJW9PPxT1h3stWbdTIcMbtchVWdpW/7pnK19fprDIj1MSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877876; c=relaxed/simple;
	bh=WCB6akuYg2j0onAZt+RA43ZvVaR7ZDsmdQN75nlWPAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijkxx6wLQlM2KLgqySRoKOrrOu7/UUYGQ/7+c2bQR83+hNVdrs5t2SlCtziYV8blZmd3uiFHUqjVSvYdshIr0YKADVuQrMEGbbT3B7vjmIO8vmlkOxMVZx9SVJYM6WB0cozIxnDOm0neUAFu/1TI15qjxLDqJ8RgarOE3enHznk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnNs6Dms; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnNs6Dms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790877873; x=1822413873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WCB6akuYg2j0onAZt+RA43ZvVaR7ZDsmdQN75nlWPAg=;
  b=YnNs6DmsKoaHvvdSQjvArLypWDHBwUcdPmZLOixFy9xkMrJ0ax+JyKe/
   5dAchxwtfpv4fjoQxzLZZSw/3gLNhWaolVafwA8N9DQe7C92o7TY237CI
   eHMjPJ45UdLypxHyngK4rrYBFCcPDFbR5NPHB+D++QKSNPfnVrE2tPTnO
   7BLOTY4hrFfmFlM5nXASbH4JZhpEJ2gq3zjgGcPX/2agxY4TVNhYHS/Sl
   6y9Kz3GpEXV+cieWDeqrBTecblFLHe01TqH5YhEKGspoMGrDRByRcHuYd
   Gj1hklt7fmDExNUPH+ob5zrQoAzksCLdiUK9QqI/zGjj2suCpWRzFr8gr
   w==;
X-CSE-ConnectionGUID: y9GAV0duT+K41CbQjl8xfA==
X-CSE-MsgGUID: oQkpI+3FTMKUE7bHWQl1KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102167268"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="102167268"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:04:28 -0700
X-CSE-ConnectionGUID: Gkman2V/ReipaEM+SJ7nJg==
X-CSE-MsgGUID: mpYh4uF3Ry2CTLAxhlobJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274142973"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:04:26 -0700
Date: Thu, 1 Oct 2026 21:04:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/20] platform/x86/intel/tpmi: Turn
 TPMI_GET_SINGLE_ENTRY_SIZE() into a function
Message-ID: <ar6gp6T-ys4lwXpU@ashevche-desk.local>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260930172918.743656-13-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930172918.743656-13-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 30, 2026 at 10:29:09AM -0700, Kuppuswamy Sathyanarayanan wrote:
> The macro computing a feature instance size has a few problems. Its
> comment says the hardware reports the size in u32 units, but the
> conversion to bytes is spelled as a shift by 2, so the comment and the
> code have to be read together to see that they agree. Its body is a
> single conditional expression wrapped in a statement expression that it
> never needed. And it evaluates its argument twice.
> 
> Make it a plain static function, tpmi_get_single_entry_size(), which
> fixes all three: the conversion becomes a multiply by sizeof(u32), there
> is nothing left to wrap, and the argument is evaluated once and type
> checked.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


