Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEF43ECBF3;
	Tue, 31 Mar 2026 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952422; cv=none; b=lQ8x0PuhTm935EB8HLCxxWecdk/n5oLPz/FijWkURKPQ4Nb67FqC+bi5hskdtvVQj4r7znNVbp3yo78eu1nQhdWpzIVrySvd/WbfoWshMr7+Qt46+007U44XxjviynMlYytIcB0KiQDFgLkqeFrt6tKczOI+5OP/gNjuuA5I6hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952422; c=relaxed/simple;
	bh=ZzItOQBlnZvxTtKWm4szK7VyAjLpqSE8lEFgdvnPU3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuQ61y54ov1ZROHK55HswYEuZY/M5yBsYi14ahOPkrcvSlbdJBVXGy8ApvWHLTlST+M6Y0D52YKf3CWGPh6QY+GbrpdErwUA7L7FN+ec+Ar9bXtIDWko8zbaJw86+2l1qpXOyijmykZ5qAWhWhdzSstbci269/yQC+Dj7u5E2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I86COmSB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I86COmSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774952420; x=1806488420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZzItOQBlnZvxTtKWm4szK7VyAjLpqSE8lEFgdvnPU3U=;
  b=I86COmSBNj7H8coIvu3ViZxaJYUNIk5Jbgj+BuZurwQUEnavJ0b730Ro
   n/gmt6BKTpJXMjWurE5vWjq1Fv6S3Z01GOcUkCL3VtQ0EN8aihyTrfDgy
   Je6KQc7ZONP5SMEUn21t3q8oOVMiC0dYu+xYJwrCrwGV7iWVvJfeVvNLa
   vUKYZGg3Ff3WGSkcST1dINf3haax3Ma6nsVb27WF/cVonQsTEg2LjM9Kw
   bNcGv3ZZi+Odj4iXu6BMAYfKBebVW9/ckIuyQDV/PXW6S3TvigrZgKqKK
   /fs6Uo86Ty3sowIjLidvAXZII1zA8GMbi0N6/7diGYGH/52N4uvpb+CVd
   Q==;
X-CSE-ConnectionGUID: MhPiMz4QTIquljWgQPgoUg==
X-CSE-MsgGUID: 1shYbtJiRUe6cNYxebPh0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75978710"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75978710"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:20:20 -0700
X-CSE-ConnectionGUID: jeJ4nzC6TVKbdN7v742emA==
X-CSE-MsgGUID: DqIn6OIhSIOPSgSd9leVUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="231146404"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:20:17 -0700
Date: Tue, 31 Mar 2026 13:20:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] platform/x86: int3472: Parameterize LED con_id in
 registration
Message-ID: <acuf3kX7-i6bADfU@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260331075204.1567624-1-mnencia@kcore.it>
 <20260331075204.1567624-4-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331075204.1567624-4-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 31, 2026 at 09:52:03AM +0200, Marco Nenciarini wrote:
> Add a con_id parameter to skl_int3472_register_led() to allow callers
> to specify both the LED name suffix and lookup con_id instead of
> hardcoding "privacy". This prepares for registering additional LED
> types with different names.
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> -int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
> +int skl_int3472_register_led(struct int3472_discrete_device *int3472,
> +			     struct gpio_desc *gpio, const char *con_id);

No need to wrap the line, actually with comma it becomes shorter by 1 character.

int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
			     const char *con_id);

...

Speaking of this, maybe in the first patch you can simply move the enum to the
same line instead of dragging it here and there.

-- 
With Best Regards,
Andy Shevchenko


