Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5768320A37;
	Fri,  2 Oct 2026 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948179; cv=none; b=MU+dUMl+03iCMYlcS0OeEeCjB83pcv4Ajd7HOs+66lWkj3p3fjVQltOKTT9tZBhsjpAEgPmv3meKPOQ+lDf5klvre7D9paKVPcdzgDQg4/W9U1xxGqUn1dIBR5764oONCzLWFrV7VXHe6kyQMpxWWFVjMDA0ynoe+DGW2DXPnC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948179; c=relaxed/simple;
	bh=oVB4ufbEkYzESgslDpgbjnVym36UXWbMieaHW+tXggU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNPAaB13L6PHCifDCbPsh5NqNTyjsmPueZbXXr8vyqcE+JMZbl2j1UQhskpfmZNB3rZJqAHN5OjESlyZ0gDqyb1UzcAKvAWGLLGcZoMIZBh8wsQzEeOQ+47a4TKxOmYEdiSrHFu587Oeg2V5SKjAxoYQOmAKaOcNxCLVQ+GZzXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3IXYKCh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3IXYKCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790948178; x=1822484178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oVB4ufbEkYzESgslDpgbjnVym36UXWbMieaHW+tXggU=;
  b=Q3IXYKChChT1hcejxoe/kNn0Qhhto29nEQQ9oRR6hS2QPhuLwRO3d+FJ
   lJh6ofJGhTWl5Ba1M5WJVwVLTCBj97H8IxPYb61aZjQoyYUjzHTEk5ANQ
   7KvOAS5OPjeNgun0wgvWpWS7o4DhWkv+h0klNYMZmcpD/4tuudr6LVhVK
   7Nc6u3ewdVx8PG0Kj5O2GFIwJoEspcwgU0tiTpinexPrVyTgP9gFz4Fzt
   YBGrSIrA+vVXX0B1qNwiEPpeq3pFXbdm17P8uXpWVJI5N4Q4OLQAaclbU
   8ePNWxxnLz3J2qqvx4NLWX25xEegBgeM21j6aDOYXxvl//CDV3hZJnRnT
   w==;
X-CSE-ConnectionGUID: Ez22S+EjTjC9PBwG/NUaoQ==
X-CSE-MsgGUID: v8hIsrQrR7ey49waQijUjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="91733172"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="91733172"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 06:36:17 -0700
X-CSE-ConnectionGUID: T37TKfLEQvyRFK8qymIqcg==
X-CSE-MsgGUID: MoRKytjXQq2BppHk0n4mlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="305753277"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 06:36:13 -0700
Date: Fri, 2 Oct 2026 16:36:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net, v.vitovt@gmail.com, dmanresa@gmail.com
Subject: Re: [PATCH v11 4/9] platform/x86: int3472: tps68470: move Windows
 MFD setup below the device-type switch
Message-ID: <ar-zSxE7drHMn7eg@ashevche-desk.local>
References: <20260930214321.600863-1-tchatard@gmail.com>
 <20260930214321.600863-5-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930214321.600863-5-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 30, 2026 at 02:43:16PM -0700, Thierry Chatard wrote:
> The Windows path looks up the board data, builds the tps68470-clk
> platform data and registers the MFD cells; none of this is needed for the
> ChromeOS path, which registers its own cells. Move that handling out of
> the switch and let the ChromeOS case return directly, so the Windows-only
> work is no longer done for ChromeOS and the function reads top to bottom.
> 
> While moving the code, use a local struct device *dev to shorten the many
> &client->dev references, and return -ENODATA (rather than -ENODEV) when no
> board data matches this machine, to distinguish it from a missing device.
> 
> No functional change for either path.

> Assisted-by: Claude Code:claude-opus-4-8

Assisted-by: LLM

> Signed-off-by: Thierry Chatard <tchatard@gmail.com>

...

>  	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
>  	if (IS_ERR(regmap)) {
> -		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
> +		dev_err(dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));

This is unrelated to the patch. It belongs to a separate change.
Same for the similar cases below.

-- 
With Best Regards,
Andy Shevchenko


