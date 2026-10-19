Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24EF3EC802;
	Mon, 19 Oct 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407685; cv=none; b=e2buw4CtENZauNPMt7rEqV6iE2A/Az//Q/dLR7l2BwizAXwrj4LVbGJH5dVKdKvWn3FNS6Zf6cF1e5lLznPpkL5CuLGyUq4N7h71lIpGjfIcmW9CDzkVqFi47WE3xh+1M37B9EZj+olwaJdYfLUZQ23GRfjbI89s3z6o4Kjcfmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407685; c=relaxed/simple;
	bh=LVrB4qZa1EA+Cdk4/EMRz57rgutr3SKn4FNL71ds3Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYE/yiWPSRs8SvBPPx/bNr68XppPk9XYlp9LErjuMhMIDN6ub3+Y66UC2n+ZbxryVPTSrcMGROOt8UkwG3wqLJZNSpuSkjskxQxbXjFD7sY84Qes2j1AafSRO4Fqx1bT0CBmsG5GdjTKuiLmJl90LR3tIjbrt6ERn9BXTlGXDl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0Xc6YKK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0Xc6YKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792407684; x=1823943684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LVrB4qZa1EA+Cdk4/EMRz57rgutr3SKn4FNL71ds3Xs=;
  b=j0Xc6YKKwAHdZ5ZIW/fUK3Tee3XswGWH5Q/3j2yWURVHOxM6Bry2pbON
   5f8jllBL0FMmb75Cyk4IiPdVTM337cZzgVhL1d8STIO1dA9tiULK7Jo6i
   Ey8f4q0VtFXBHRwe5kyGO2adS60yD7+x//cBAat5ZqTHlaJED2ODiP3xY
   ppVNe0Tki/hi/B8Zy2Iu1Sk0FGs0CHz04ifNrINtPicGzGORNVVbdVwqF
   GOLc5ky5PGb9PcDWM93imDS3plafquUsIYbGAHutWZUwBpeHCQrUXaOdR
   uZbGAdC1ZAnuztJnWLIkKI9tg6uBxKzS4oVxSSFpHzwFc6jSevdZ3PVIw
   A==;
X-CSE-ConnectionGUID: 7ZLQCebNQD+PhTJHr7Ao1Q==
X-CSE-MsgGUID: uL9rr7LqQIW4l+Fy23CUDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1192668"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1192668"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 04:01:24 -0700
X-CSE-ConnectionGUID: bklTOy3QRDmECvOjkl52uw==
X-CSE-MsgGUID: i+BcRWovTjyj/BTe51oIzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2843806"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 04:01:20 -0700
Date: Mon, 19 Oct 2026 14:01:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Alexander Patrakov <patrakov@gmail.com>,
	Leif Skunberg <diamondback@cohunt.app>,
	Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO
 type to a "avdd" regulator
Message-ID: <atX4fiJt4byuuZEJ@ashevche-desk.local>
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
 <20261016141716.130220-6-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016141716.130220-6-johannes.goede@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 16, 2026 at 04:17:16PM +0200, Hans de Goede wrote:
> Before commit 34e31390a3b9 ("platform/x86: int3472: support the POWER1 GPIO
> type") the int3472/discrete.c code mapped 3 GPIO types to regulators:
> 
> 0x0b INT3472_GPIO_TYPE_POWER_ENABLE -> avdd
> 0x10 INT3472_GPIO_TYPE_AVDD         -> dovdd
> 0x12 INT3472_GPIO_TYPE_HANDSHAKE    -> dvdd
> 
> (with the INT3472_GPIO_TYPE_AVDD define wrongly being named
> INT3472_GPIO_TYPE_DOVDD in the past)
> 
> The OV5678 front camera of the Lenovo Yoga Duet 7 13ITL6 uses the following
> GPIO types:
> 
> 0x0f INT3472_GPIO_TYPE_DOVDD
> 0x10 INT3472_GPIO_TYPE_AVDD
> 0x11 INT3472_GPIO_TYPE_DVDD
> 
> A previous patch in this series maps the DOVDD and DVDD types to "dovdd"
> resp. "dvdd" regulators. This creates a regulator naming conflict on this
> laptop for the old AVDD to "dovdd" mapping.
> 
> This patch fixes this by changing the unfortunate mapping of the AVDD type
> to a "dovdd" regulator by swapping the POWER_ENABLE and AVDD mappings,
> mapping POWER_ENABLE to "dovdd" and AVDD to "avdd".
> 
> This is safe to do because all sensors which may be used with the INT3472
> code are listed in drivers/media/pci/intel/ipu-bridge.c and a manual check
> of all drivers for sensors listed there in current media-committers/next
> has found that all drivers either support all 3 of "dovdd", "avdd" and
> "dvdd" or none of them and enable all 3 of them at the same time. So this
> swap ends up being a no-op.
> 
> With the exception being the new in -next ov05c10 driver which only
> supports "avdd", this is fixed by an earlier patch in this series.
> 
> Note this change does not impact the recent adding of mapping POWER1 to
> a "dvdd" regulator since it does not touch any "dvdd" mappings.

Well found and fixed, thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


