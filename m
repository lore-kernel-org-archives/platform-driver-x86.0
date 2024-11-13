Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3D21F80C2
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731493110; cv=none; b=qhync6qaju2nshVPPxH1ftxktot5ATpZnv2l8fkMzc49sAip8DOnmBGO+PKpzBB5ZQbC6OAgwrLiPnVFmT2cIDZ6FCTqtzsdjBaNpTUt+ngGm1zkSFzPdSsVLvupourbHciJpQXBjq9DBh3t0PIec2Pwf1EN9UjRbb4Q8YzwooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731493110; c=relaxed/simple;
	bh=v5661yWz9wc3wPHKGrR8AZfMyTGxk0fT3jZ3Sa/3MFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1ScaCIu7rOueEDeprr21ZOZFJwGmG/FwBqhCqUS1eppcKHlk+dtMgHPrwN8G0ae4fnxaeb3ZLd8S7+pOE0/DMNH14mwQR20NqKdvOEiJ0MSS/JwtxFFybIVb54kDTWbl0mm4bhQTfwG/055Rpjd2iIJ+lLD8ABgr4mKp85gtz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MEN6U2yZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MEN6U2yZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731493109; x=1763029109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v5661yWz9wc3wPHKGrR8AZfMyTGxk0fT3jZ3Sa/3MFA=;
  b=MEN6U2yZ2WkP7JjE+oZYE2kUvvPqADWZCL9KPOvsygPPC80sDca4aHtk
   Nf0qm0W/WK9oAZA7VYmOfDb3EgfeCafqD65qzvJjkWRCtTFw6YORoM4xn
   RlvKCfNXt0AJqc/iowBAZNpVCB6tHryFtWkuDYvwu/efJLD5p80pfaI1G
   SuyIDAvqusbzNYBwj6kvYxiDmbonUa9AZKLlxCYBSR3WgJpga9o+8jkWe
   cAi3nXpeYbnkGQeINjohUXOs0kvC2XAsTzjEKAYFH1pDzFGSPk3DGoCCc
   Hu2hB7f55rImipiHDt/IqXAYLA6DkHDGM+IHT8uXmNCpvAyU0+zuetsob
   g==;
X-CSE-ConnectionGUID: 9k54wUf4QhmhbQiFxB/h+Q==
X-CSE-MsgGUID: 1rpd+I3fSHOWxVekJQ8WyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31260458"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="31260458"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:18:27 -0800
X-CSE-ConnectionGUID: HfR0bpF3SjyeCoEtN69k5Q==
X-CSE-MsgGUID: ylMLyweDR9iEVs1Sxu8ejA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="91870820"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:18:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tBAS6-0000000EInK-2gON;
	Wed, 13 Nov 2024 12:18:22 +0200
Date: Wed, 13 Nov 2024 12:18:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
Message-ID: <ZzR87mVmsy-AHSDF@smile.fi.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> Updates for PMT to support user offsets from the sysfs API.
> 
> Addressed review comments for the Xe driver udpates.

Not sure where the changelog (v1 --> v2) is...

-- 
With Best Regards,
Andy Shevchenko


