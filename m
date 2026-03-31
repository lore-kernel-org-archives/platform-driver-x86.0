Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70933B6E3;
	Tue, 31 Mar 2026 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983019; cv=none; b=sZIjAKTTgf4qmmOIiJagkN8Jwxwiu5K4KmlFAgW/7FH3n7lxiIgcYgUS7jTL8SV2X89SRTDnsPOnc4bGVp+4lsrtqBKzj5f28mPZiYfDEntshfxRqbUA9Ddjsdz7PAZHTYl4LCVJ4nMAhkh3lKEuldmsqYdL1XKRuJdqJHgxO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983019; c=relaxed/simple;
	bh=XiRf+yfx20cc9EsHaYI8mD+Vhm7tnV60ZhFjKL09rso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8l7XASM4FSjcJRWl+CDTVFllNAQ+pWN3Vuq3SHHp++zKZzA7sKJ/5FBkdwqCEzs0wKd46U5RlfrTEPZkWVsQgmQSJu1GDUkbTZ6rlbahmIPrz4h8pCEUKDH+UzVxEa9Oz+sTfJu5jib2yLPJ5HnmW/eN/eUBTHkifNplAXEHds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRgl2Pqg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRgl2Pqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774983018; x=1806519018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XiRf+yfx20cc9EsHaYI8mD+Vhm7tnV60ZhFjKL09rso=;
  b=kRgl2Pqg481GrQzNLYcNxQ3mbuOAnmZ9woGadU0XO+zNJGXgm6fKysIi
   7yEqRPBnW7RH3wnyXqFjmEdwZPCr95TiqlKc9dc9kvJk2O6SGVvx/0GgX
   bLsR9MSlSB3OBVQvFfM5tzWNyS+xrc9UV0QpR/wJ2zgAW0UniIdUhd6/s
   W3xvvxLEChMbwC5l2/Tk2lPHwBI3+Vi0tRTuNZREiZV2YiaCUfQ5Mb3ym
   vRnL6IaNkXbRMFfe+rz/tIQf5vpNv0jiaIpGMcP/eP0ZsbHAH0BKGWL3i
   oXGA4/Ky0OPxdtd/is89TXPxVh/qVpNKE1/W/LjZSuzgZH9jcano95UmE
   Q==;
X-CSE-ConnectionGUID: 7FoGFMmCSkihtIMFwYV8Xw==
X-CSE-MsgGUID: eJcdIEWXSZaqRfSjYr+PIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79612347"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="79612347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:50:17 -0700
X-CSE-ConnectionGUID: 5PKLpN9NSKm/80DYRnbgXQ==
X-CSE-MsgGUID: uAfVcmvOR0CQaGgq0gbrRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230515939"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:50:14 -0700
Date: Tue, 31 Mar 2026 21:50:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] platform/x86: int3472: Parameterize LED con_id in
 registration
Message-ID: <acwXZJpGnRQ5JSA0@ashevche-desk.local>
References: <20260331134443.1573053-1-mnencia@kcore.it>
 <20260331134443.1573053-4-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331134443.1573053-4-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 31, 2026 at 03:44:42PM +0200, Marco Nenciarini wrote:
> Add a con_id parameter to skl_int3472_register_led() to allow callers
> to specify both the LED name suffix and lookup con_id instead of
> hardcoding "privacy". This prepares for registering additional LED
> types with different names.
> 
> While at it, rename the privacy LED's GPIO con_id from "privacy-led"
> to "privacy" in int3472_get_con_id_and_polarity() and pass it
> directly to skl_int3472_register_led(), reducing churn when adding
> new LED types.
> 
> No functional change.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


