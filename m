Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630451F78E6;
	Mon, 30 Mar 2026 09:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862817; cv=none; b=XRH23fU8NxnCFpcyAy3fEfOvwgzy+DIYR9USZfE+DiOP6Aegib4CxoQSVu1Hf2UlxjsetaXISh2z+cRzzATJOxTkwbgxgfs4+TRUaYy8BBhWwfuzYQhDpuXDb3aKuA0qu2QS2gbVfVX+o/5UbZtroGMT/AERYlvLiVhQ4hiEvaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862817; c=relaxed/simple;
	bh=2uXJh035Vkq6wRVDGVwbU2SocN6z+OwrFNVY2ij9Q6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqpej69N2Y2Ht5qHiUPdffI0DH6gCIWnU6cJRBM9ZiO5jEARW1mEAm6IQIYcFn58Mra182RYj7ROWIiWHYudqKI4BgTUh9Zxj4hdkxbLwtB0c63nVkt5aYB02C9yCDCG0wGQuc8CQtSHMyLXnL2RznSOaxgjZm5JQQVtHV+qoEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=foQ8HLnG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foQ8HLnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774862816; x=1806398816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2uXJh035Vkq6wRVDGVwbU2SocN6z+OwrFNVY2ij9Q6o=;
  b=foQ8HLnGhIgnwNm2J5YvOTysnLoJrcBX+9TzCof2S1hcba3ORMWEq8m8
   xwS7H5Htf3b855KdWLalkIYM4g/OJIc87hUr4AYwt3Osv2bO1nghmUFEM
   I2xnhxUeZDmtPZQjMsZ1VuZdYxWIoDwxWMO7dzRkp9lNsUAgfSbZrB5Oa
   iErG8ZeCO9OAh9Hp4oyiMmN5dI4UTEpyVExbgXHZ3UQBV3kIKw2j14i13
   cADrcj/Xrynou1/VjJNowmtlu+/TcWf8aAeNpdOWpBGJseyk+UDKGjFfP
   3BlA+2qhe6S1oHex4c7DXbf/Use5j9UumgRrbWl+mVZQw8f0+Hx3BEDyr
   A==;
X-CSE-ConnectionGUID: In9P+COoSci+AUFcx2i9bQ==
X-CSE-MsgGUID: KQU1ljKfTqCavo155gKDWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="74883494"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="74883494"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:26:55 -0700
X-CSE-ConnectionGUID: 05w4rF7zRO6J/xKIUeFSXQ==
X-CSE-MsgGUID: p/uHaYxHS/6ZjqgtKVtBAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="225997246"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:26:53 -0700
Date: Mon, 30 Mar 2026 12:26:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] platform/x86: int3472: Parameterize LED name in
 registration
Message-ID: <acpB21kYn53K2bfz@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
 <20260327181031.1489365-4-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327181031.1489365-4-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 07:10:30PM +0100, Marco Nenciarini wrote:
> Add a name parameter to skl_int3472_register_led() to allow callers
> to specify the LED name suffix instead of hardcoding "privacy". This
> prepares for registering additional LED types with different names.
> 
> No functional change.

...

> -int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
> +int skl_int3472_register_led(struct int3472_discrete_device *int3472,
> +			     struct gpio_desc *gpio, const char *name)

I believe it's better to call it con_id...

>  	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
>  	snprintf(led->name, sizeof(led->name),
> -		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
> +		 "%s::%s_led", acpi_dev_name(int3472->sensor), name);
>  	p = strchr(led->name, ':');
>  	if (p)
>  		*p = '_';

...and replace the actual con_id assignment as well.

-- 
With Best Regards,
Andy Shevchenko


