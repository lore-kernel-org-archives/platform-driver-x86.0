Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB5F3A9DA6;
	Tue, 31 Mar 2026 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952250; cv=none; b=nHGfEAy4D24b7e7ZqflBT3OSHwG2Hg/+hQz1I9XmvqzdlrgL93eSZ4ebfdefcHjm54XLl2ya3GK37U8Eql5aHxY6NCAjH6TpGobXkxAPfcPsXVlf9+8fK8mnJu/Z6gLAPo71QwW3ByE3NRZvIyem59sprgSHSYLQjnUo9wZzJeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952250; c=relaxed/simple;
	bh=Yno0TLscaaRxbvGQFm2lw7DQt59twvB9OaWADDzHUZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQAwz1NO+GK2WNXkyIuz0vImJmyUpl835UxFLYaYyR3ECg5UiOraV5Hzws8F2Zajqgi+iUnWTIN9nicSgnm12glIE1Xo5tRS+jNn62Z91rVdgs5MJ5AXpqxOvR3UYFzi77nWQWHn3i8E3jwLt5vR8rB4VXyC+M37I1vpferKwd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWR8grh9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWR8grh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774952249; x=1806488249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yno0TLscaaRxbvGQFm2lw7DQt59twvB9OaWADDzHUZA=;
  b=AWR8grh9MEdP3ZK5osNztWlkICRtmKtvSF3PPt70lhvgW+sp1bISpRxC
   2ro7RtqdXJ1C14JwqnrScmBP1GRUGHZNsXEfV2/wtbB28vv9efXkqsaZV
   UWhFO5omgmRZYNVSYqmv/eOSN2EK4pr1nFezoCKAoHQIJrDWwgqgsBjiD
   EtZHowp/nHVmSj2MsNhrkytpMHOs7hQ+0J6gNPmgTWzC9YVOTGavyRf0p
   CcgZnuWkSnjzm8Kp8QuahiIJFbAkp+QkJT5dvrCf93JUjLB79ujL0NJnN
   Ss+smwwH3UuyDAblbNtbXAQsIRiwIAKLDxkuGoC0RuNBeOIa9noST9viG
   g==;
X-CSE-ConnectionGUID: +PtIYP7rQw2AXhKIXWfJEw==
X-CSE-MsgGUID: boBAtLG/QzSTAPa3nL+DKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76073762"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="76073762"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:17:28 -0700
X-CSE-ConnectionGUID: rofqJ3srRoqMMObV0Ed1Bw==
X-CSE-MsgGUID: 7jcFmvu+TR6J4XKG3dzzfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="221459230"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:17:26 -0700
Date: Tue, 31 Mar 2026 13:17:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] platform/x86: int3472: Rename pled to led in LED
 registration code
Message-ID: <acufNGYZReEb8mXn@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260331075204.1567624-1-mnencia@kcore.it>
 <20260331075204.1567624-3-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331075204.1567624-3-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 31, 2026 at 09:52:02AM +0200, Marco Nenciarini wrote:
> Rename the privacy LED type, struct member, and functions from "pled"
> to "led" in preparation for supporting additional LED types beyond
> just the privacy LED.
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> -static int int3472_pled_set(struct led_classdev *led_cdev,
> +static int int3472_led_set(struct led_classdev *led_cdev,
>  			    enum led_brightness brightness)

Second line needs to be fixed as well (indentation).

-- 
With Best Regards,
Andy Shevchenko


