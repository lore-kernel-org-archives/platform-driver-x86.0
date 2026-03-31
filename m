Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46603287259;
	Tue, 31 Mar 2026 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952764; cv=none; b=eOQu7i03NtGkHz59ILOWN6uJEB3RABOYjOJQXA4b4wEC4eV2BAhtFoVM/X56MN9xUO/nd8DQqrBo/GafSoPwb0ikkfn/RPx0MZs5nn3cdsMLxyvaM2LLml/SK8OCzq9cfLKcMTL6e47WAjSbOmqLszIwmyd6/n36tPWxcw8xBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952764; c=relaxed/simple;
	bh=a5mbb/WIdVDs1chxpACG5RhMX8gvLR94eiNR7tDMopM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYxg0QXZhRWSNwzFX/Knd/tPX6KATKdnlbLP+MCGYdAQP+AyXG+6bM8GuyQf5VRmeIHzfPnRt9j7Ike8tuUbULQYUc74CzSvUGZutUn22n4XXlNx0nNtsSlgtMD3juKDU2kql9tUDHiYQkc46EcCp4IGTqEHjpk57wKZDDTblvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUPMT+Qv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUPMT+Qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774952763; x=1806488763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a5mbb/WIdVDs1chxpACG5RhMX8gvLR94eiNR7tDMopM=;
  b=cUPMT+QvXAG0gEWVBRxOWRECkN9HRVV+uFlAYkGqm/R5i8wDTMVWVIrv
   z/i4OK9K3PNe/s/XTMjHdwfon776NGqTI/D2EPN1wYrIz7gc0UArVPbuP
   ElmH4RO0l39ce0P1zrtJGdCMf11FgegraMOVtRBsCVPAxO+tKf+GdUabb
   jH4ZGo6vFh3KCrZKYXPLW/NSOGNmWeIF3+YLD69MbyNePoAO2h3TPUsSa
   c0gxws3XWClItOoSSyhaXoOZjScKrOYgqDB8fsUn+Auosil4mRe0niAAY
   NEHAwwo5R/h+QqIwHJ8qAcTeWEYz5eCnhssHROY+NzROf0bbC+KOFD6Dh
   w==;
X-CSE-ConnectionGUID: c6LZHjR5TIqANuNTvxZLjA==
X-CSE-MsgGUID: aWEdCxi2S1eACBFBPoQCAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87037275"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="87037275"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:26:03 -0700
X-CSE-ConnectionGUID: hj7JK3GPTE2B/hgISVSF/g==
X-CSE-MsgGUID: lTgsgeCcTHW73vMd+7lm6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="221925853"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:26:01 -0700
Date: Tue, 31 Mar 2026 13:25:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] platform/x86: int3472: Add support for GPIO type
 0x02 (IR flood LED)
Message-ID: <acuhNhX4-vFaE94G@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260331075204.1567624-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331075204.1567624-1-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 31, 2026 at 09:52:00AM +0200, Marco Nenciarini wrote:
> Add support for INT3472 GPIO type 0x02 which controls an IR flood LED
> used for face authentication on some laptops (e.g. Dell Pro Max 16
> Premium). Without this, the kernel logs "GPIO type 0x02 unknown; the
> sensor may not work" and IR sensors paired with a flood LED cannot
> function.
> 
> The series first refactors the existing LED code (patches 1-3), then
> adds the new IR flood LED type with multi-LED support (patch 4).

Almost. A few cosmetic changes and I'm glad to see it's done.

Also please note, when sending a new version make sure it starts a new email
thread (no In-Reply-To should be filled by the cover letter).

-- 
With Best Regards,
Andy Shevchenko


