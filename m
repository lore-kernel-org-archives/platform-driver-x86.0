Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFA017C219
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732809154; cv=none; b=DAqPbEqrDgNTCAN3DEZJvmSdnicDd07EI/+xaAHd8973PzNmGE4IcF6tg1D/FNnADWdIbYphJqJ9Ou7rLeJQEmLNSkVNI55nSDz6HC466hclCRNa+rSrA1JHxviLfu+og2vpPiPk+BJU66Pwpa308kkW2u9OfWRZcpVUaQzTS9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732809154; c=relaxed/simple;
	bh=vNndAfaxTL+RceLo9+QPy2cR+TT0fP2AIhhuEzeEVx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTYQN6T8V2mks7kDxHdRc6C8yv94/ZSKzyMqheJhXEswbkiB73l0z0hhYaeW6JgXC2JwmvkhsjK3E+9aAWtB28zEk8mmqw5fZmFLw4+i6fkpmrXCR5coimNK53TrBvb/yHUwN1mrONpDvw6EiB6JZCbtwTrFlP2Zr5DSlV7ggbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: P05f6muqQQCJcwAech6MTA==
X-CSE-MsgGUID: aK2oVmwST0y09wwJ7MDT0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32992225"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="32992225"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 07:52:32 -0800
X-CSE-ConnectionGUID: 3VN6u44eQ1CptPeqFG4FOA==
X-CSE-MsgGUID: hSmbkshNQculPJpbtaN7Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92194665"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 07:52:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tGgoe-00000001ytl-0y2S;
	Thu, 28 Nov 2024 17:52:28 +0200
Date: Thu, 28 Nov 2024 17:52:27 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/4] platform/x86: int3472: Drop "pin number mismatch"
 messages
Message-ID: <Z0iRuxcNnPMZptK_@smile.fi.intel.com>
References: <20241128154212.6216-1-hdegoede@redhat.com>
 <20241128154212.6216-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128154212.6216-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 28, 2024 at 04:42:10PM +0100, Hans de Goede wrote:
> It seems that Windows is only using the ACPI GPIO resources and never
> looks at the part of the _DSM return value which encodes the pin number.
> 
> For example on a Terra Pad 1262 v2 the following messages are printend:
> 
> int3472-discrete INT3472:01: reset \_SB.GPI0 pin number mismatch _DSM 103 resource 359
> int3472-discrete INT3472:01: powerdown \_SB.GPI0 pin number mismatch _DSM 207 resource 335
> int3472-discrete INT3472:02: reset \_SB.GPI0 pin number mismatch _DSM 101 resource 357
> 
> Notice for the 2 reset pins that the _DSM value is off by 256, this is
> caused by there only being 8 bits reserved in the _DSM return value for
> the pin-number.
> 
> As for the powerdown pin, testing has shown that the pin-number 335 from
> the ACPI GPIO resource is correct and the _DSM value is bogus.
> 
> Drop the warning about these mismatches since Windows clearly is just
> ignoring the _DSM pin-number so invalid values are too be expected there.

...

> -	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
> -	if (pin != agpio->pin_table[0])
> -		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
> -			 func, agpio->resource_source.string_ptr, pin,
> -			 agpio->pin_table[0]);
> -

Hmm... Perhaps move it to dev_dbg(FW_BUG) ?

-- 
With Best Regards,
Andy Shevchenko


