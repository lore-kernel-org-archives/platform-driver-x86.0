Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C963A1E70;
	Tue, 31 Mar 2026 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952181; cv=none; b=b6VXCh7QBvATGyKJ+V2pQEFIJqL2yCmXouJdI+nGPwxCjMe6GV8YgZC8mKYmuQ1QRlAFt+vJwVKw3um8KQR9wqLBoeotYxCdFQ0w1JdTmvt6JeW7yZrBl1zLsPlicRBS56PpW34DscPs/eSvByoQA/MJk2MM1MdzwXlC8Y4280o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952181; c=relaxed/simple;
	bh=GEGhYPu399TlLmttbu87uXsxaar/zHNhHHSyLtN/IRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBbXPfhm6y9TdlzAC04EnK2dmlljDIOrhDFe9dOy9ME2n9+GxaHQge4LOrStFcfoTDJBwunqhglTSwZsVsAbskgFwqx06xYxxf74Ms2hhyDcACPyZMo8tdcg6wRZGHOXqlRKBmfqnO1CUm+R4VW3Qgw4dxxv/U3nI7pCVaIQgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDA8YA8F; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDA8YA8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774952181; x=1806488181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GEGhYPu399TlLmttbu87uXsxaar/zHNhHHSyLtN/IRw=;
  b=hDA8YA8FwcN/iJFilWaz2SmL7cG4aMj3IC8+qGOcLZFrgCSpjMmbxJbT
   yIhyOa0HD5CF2Rft46mqMXFIwtnGYEebdD3nmtOgDAu2KOsxlglId7j0p
   qUDLUznW5gVtdTjmVpgmIOqHn/qO5CbXMUGMA/rAR2BkZMbi9MBo5HU14
   Nma0d/5gC39isla6CAJ/d0C33k8VGbWRnf/I1Eg9CenQCEgS8Oss7R3aM
   j+yiDvRe0Bvph/qapyllh7OSprTt0PoPYlIjvQeMryktnZF203PPhdHJ2
   to8e56CgkFt3AFLzUO1naMJVWDxNVQwNvelnN7T1teYxjrr09RO0WbMeu
   g==;
X-CSE-ConnectionGUID: viPoRa0rQe21ZTNfsjYgcg==
X-CSE-MsgGUID: 1kJE0s06SRykByYVCiuVIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="101416485"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="101416485"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:16:20 -0700
X-CSE-ConnectionGUID: 1RFkAZZzQD2Ba2upJSHlVQ==
X-CSE-MsgGUID: Lgpbsvq8Tx67FJ0rCj1Xow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="225493972"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:16:18 -0700
Date: Tue, 31 Mar 2026 13:16:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/4] platform/x86: int3472: Use local variable for LED
 struct access
Message-ID: <acue76IhAEliZi17@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260331075204.1567624-1-mnencia@kcore.it>
 <20260331075204.1567624-2-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331075204.1567624-2-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 31, 2026 at 09:52:01AM +0200, Marco Nenciarini wrote:
> Introduce a local struct int3472_pled pointer in the LED registration,
> unregistration, and brightness callback functions to avoid repeatedly
> dereferencing int3472->pled. In the brightness callback, use
> container_of() to get the int3472_pled struct directly instead of
> going through int3472_discrete_device.
> 
> No functional change.

...

>  static int int3472_pled_set(struct led_classdev *led_cdev,
> -				     enum led_brightness brightness)
> +			    enum led_brightness brightness)

No need to touch it here as you also need (currently missed) update in the next
patch again.

With this being addressed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


