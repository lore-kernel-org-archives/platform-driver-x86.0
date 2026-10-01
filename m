Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036623B7B7A;
	Thu,  1 Oct 2026 18:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878162; cv=none; b=ktkvawGFCmirBpkn55dlxfQLmXhvjGCsZPYPNR2kjFPvBUntBWZTMwHO2eQmFgcehs3cNMAryx8GesIlxxXj0nVnUIRbKD4LBfCkGZgJfkjpGW8lSuwm/K5iH9UZqMrsPr6cgYcfuoVvhfRtS+oMwg5eXJCsR2EHt5fwuI/P1Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878162; c=relaxed/simple;
	bh=IYuK6YAms+4kFmsbw+S5vuVJXL+sdI0R9kmmnkuRFqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxEcVAA1rJ/ZxBrxNEFDsjzeG58umKntPiUuHVp2PZV97p04b135w/A43HV0WMPDULMwb/jTfau0ipfxLzEe+eQiyg5PPysJctvyhU2wYd1k26gQyS2tAO49JVoWKYtekRzoLalQsgdQIXN2KBCVY3dFftLHsTyDsiu5D+ZjFAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIx/d4jX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIx/d4jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790878160; x=1822414160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IYuK6YAms+4kFmsbw+S5vuVJXL+sdI0R9kmmnkuRFqM=;
  b=OIx/d4jXT6yXOeAnoClGg0tsOChCaO928DDObQvhVZ4wha5BwfY/YikJ
   4V70cZJ6ndkDob0Of6KLkS3L9wSMC26PCxhKWwC919+nB4ynw3ep+DXdl
   N0KvbQ4Zd7lrfUoRTl0KN37lLoVeQDsQb3ApsYcuFPSPF122n+MVhvMjJ
   jeJsM3K0eVeVId3TBhDTfQPsAUWB839lMNXjM1urCJMt58Sa1dSOUBcr1
   5KS+gWXvgo03+M99RaMd0FsZhWGt3JdY2OUWQDONOGiG7bLDo+aE/ovaG
   hRp+agYu5L/UF1oow4C3qCoyZEVz/7Nz8O0H4eEXsy92yWGH7rweFpTEj
   w==;
X-CSE-ConnectionGUID: /LKDm+eESfCCE5e3aonVuw==
X-CSE-MsgGUID: 8WfGCCXeTE6UVdqHpMQF/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90505927"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90505927"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:09:19 -0700
X-CSE-ConnectionGUID: DXl+d7HWS5etwLq22oI+6g==
X-CSE-MsgGUID: OD0jrt1FTG+GKs+DUhwbgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="279359370"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:09:17 -0700
Date: Thu, 1 Oct 2026 21:09:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 18/20] platform/x86/intel/tpmi: Use DEFINE_RES_MEM()
 for the feature resources
Message-ID: <ar6hyp0E7VdwEEut@ashevche-desk.local>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260930172918.743656-19-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930172918.743656-19-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 30, 2026 at 10:29:15AM -0700, Kuppuswamy Sathyanarayanan wrote:
> tpmi_create_device() fills in each feature resource field by field,
> deriving the end from the start and setting IORESOURCE_MEM by hand.
> That is what DEFINE_RES_MEM() exists for, so use it.
> 
> The resources come from kzalloc_flex(), so the fields the macro sets
> that the open coded version left alone, name and desc, were already
> zero.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


