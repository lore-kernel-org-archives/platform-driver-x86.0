Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0234E3B47E3;
	Mon, 30 Mar 2026 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863319; cv=none; b=Wd12r4OwMCpZxTt4y4hbOdlbC1hKHEstsk36wRP17RG97Kjca2CwNl/WaN/QwlGVxnH32v8KMLaWRqWKgh8pUdNwdPjsOidA+E/HmDhXvMciFUCybgrWb5XOZMzT1MUt7q1i2I6xi0jyATb2fdwCs39WiEpVel4e7u5NFvEhars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863319; c=relaxed/simple;
	bh=oPH1PlQQiuHrSa8JnNDeYpQ9VvOp89w81tP0GTuGnGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rl5PkqZS+vUTY7+m0pLveA5sQPCcCyRQNiKj+XOeeNJq0Th9XkAGCnMznc3GVAZdj/T+Odb0x+nYPvDlcg0mh6Bi1850L7BnV1h/OgHDTFTStMB2WscZJt1AC1saNSpep2xv+0nryMun8Sekuuil7FRegI7KUh+7ciIdnqbacBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=es5hfVD4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="es5hfVD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774863318; x=1806399318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oPH1PlQQiuHrSa8JnNDeYpQ9VvOp89w81tP0GTuGnGQ=;
  b=es5hfVD4/bUAdMsA6L7EwQe67kwL9dVoJKTHaar9UZilfSNjA5uj+aCH
   t5E7Hkn3RTIOJARUC2GzUhtcbLJ7QbfvIoPQiZbT6Zsl0UXJQ0lj/64/+
   twRSuBXZgP/pjWN62t+jCiwv2rD/lLtUVXnR0yWPNXcovf3YFwBwr295E
   iBec1442PnNKuFz8LN9EylmPzIp67F8uDIrOULqcnDC8SLg55Nx/Nqm3d
   CRn1YBbtX/am4Gx8PWZWMEIJzB6NuNg0Q5gFGXlQ9UY1IVErMTFdjmG0z
   TtBSY7SgJU3GJw81jsYTJ4LMuQpyRWzhxfvYuePKZgBPr+//td1LCtI7z
   g==;
X-CSE-ConnectionGUID: rSWvpDIeRA6iPBxOcOKQrQ==
X-CSE-MsgGUID: pzfpEk//QCCKBRl/+G4PnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="76041824"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="76041824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:35:17 -0700
X-CSE-ConnectionGUID: OkbI6fPDRbGlvEHtKyJNXw==
X-CSE-MsgGUID: i3qlBNRTQsCybRi+Gj9SnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="219358250"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:35:15 -0700
Date: Mon, 30 Mar 2026 12:35:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe)
Message-ID: <acpD0V9itAcNqpwf@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
 <20260327181031.1489365-5-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327181031.1489365-5-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 07:10:31PM +0100, Marco Nenciarini wrote:
> Add support for GPIO type 0x02, which controls an IR strobe LED used
> for face authentication on some laptops (e.g. Dell Pro Max 16 Premium).
> 
> Without this patch, the kernel logs "GPIO type 0x02 unknown; the sensor
> may not work" and IR sensors paired with a strobe LED cannot function.
> 
> The strobe LED is registered through the LED subsystem like the existing
> privacy LED. Unlike the privacy LED, it does not have a lookup entry
> since there is no consumer driver expecting it via led_get().
> 
> To support multiple LEDs per INT3472 device, convert the single led
> struct member to an array with a counter.

> This GPIO type was previously referred to as "ir_flood" in early
> versions of this patch series. It has been renamed to "strobe" to match
> the GPIO type name used in ACPI _DSM tables and align with common
> camera terminology for IR illuminators.

This paragraph should not be in the commit message, but...

> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
> ---

...rather somewhere here (after '---' line).

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> struct int3472_discrete_device {

>  		struct led_lookup_data lookup;
>  		char name[INT3472_LED_MAX_NAME_LEN];
>  		struct gpio_desc *gpio;
> -	} led;
> +		bool has_lookup;

Do we need it here?

> +	} leds[INT3472_MAX_LEDS];

Can't we simply check this by list_empty() in the removal stage?

*Yes, for that we always need to initialise the list pointers at adding stage.

With that being done, I would rename the parameter to add_lookup.

-- 
With Best Regards,
Andy Shevchenko


