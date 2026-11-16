Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829452;
	b=nTWgIpu3oxczioMl6wA6Fi2QetL6KQ8V9YvytRJ0Ts2A/ZFYETN3Sa/yoV8Ppe+mhnqp
	 TAGB8tQYsRzs72qHyoGfrW8rk0ZtzER+GunUSksWt3xuxhw1TaD9gA2AA6maXGWQJcG3R
	 y98W1aqpic5TXDEK+SJi8n5U+p3gOJPQCPDdH7RqlnH5fOJpi8hTNc2uCigvFcKvlz5YK
	 HmAI7cgFQejZ3NbkaiLl6sATze+GAIUR0NEVfXxOZtHOeH/JJHD9SDI81+exYHgeAJ46U
	 tva5Bn95afDHqgzAZoT0cbUQ2QBY4B6ENCX+aSNi/BqVEVY6AZxCmdbSxVNvCCRTa1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829452;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=wQc3ONDOmhN196HHLxLOZ//OUifKXyVnsgHdzILB34c=;
	b=MhcqRZqSd1aHyAEzFbJBct1jrnSrayV4n4R6+kXR04jTJaN1natk/RdYhjikOnfQMdBj
	 zrrrGwF3FZsEFKkfj9ulzE0D8k5G02N+Cw8vSPoS+k473RWwqyCai0satwHBepQBPk+uc
	 96oO7+vy5lTDGaR9DZNI6XuI0SfJSz/Lylz+j5NxfK164APs6kcMXy+5XR2s8ZyhmUdop
	 oH8wQBDdSXM3y9X+4gVKr6JitectlAIuT6v4E785NP3MqFg7ghbT+iBhdhAU9nyn8AzeE
	 j6G4WZDCdGsTWM0qM1uvhk3Syp1V5uP3Ko+3uWUBW/qIf1t4dNYOsEj8/JA55ybBJBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bgRJpdSu;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F094E606A31C;
	Mon, 16 Nov 2026 11:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F094E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bgRJpdSu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794829452; x=1826365452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RqLElGl+ZQryG1ApUI0yEmvc7YsgWVRo5WWN8DmlIh8=;
  b=bgRJpdSujFuAB+Jq1he0idw/I7NvAhut1NjlwgkUbV6Dm42yXLZgYson
   VleaVwL+tQDSjyHKItaQcC41/XOO7zx6JnQWcQnBdDqOPBdeFd8UsrkJn
   zFUhkbu6ANh4Ph5dThBrRBuCPq+0w563PfLxxTDLLnWCzddnGG7FfLMzB
   bKzl3vIQJkzMjWxyy9uEbX9tNOIxNHz30Q5tdmiJp4uR1fSurT8W0FGtA
   CdsHi9HCFK34jFhm0HHn76BQ/Y+qUO9aHqn1SqMj6ASO2BxvQdF0QWp5w
   foW8jSYAIh+CRpRWXH23LlgaOA9x+iR+j81ccUloe0TU5eDERxwAyik6k
   g==;
X-CSE-ConnectionGUID: oQ1tFXL5Rg6OeRFxEqn7Pw==
X-CSE-MsgGUID: s+qKPqpLRZih5xbVfYkllg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3666190"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3666190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:44:12 -0800
X-CSE-ConnectionGUID: ao0jMroGQrusYywVR6gC5A==
X-CSE-MsgGUID: /Lld1Zi+Req3ZoyRkpvTwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9852089"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:44:10 -0800
Date: Mon, 16 Nov 2026 13:44:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] platform/x86: dell: dcdbas: Use
 read_poll_timeout_atomic() for the type 1 SMI
Message-ID: <avrsh_ayr_xM-ocS@ashevche-desk.local>
References: <cover.1794633178.git.rosenp@gmail.com>
 <6380dadbc5d515b4ce0d3322210ac44e4d541200.1794633178.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6380dadbc5d515b4ce0d3322210ac44e4d541200.1794633178.git.rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 10:17:58PM -0800, Rosen Penev wrote:
> For SMI type 1, host_control_smi() polls the APM status port in a loop
> that counts down TIMEOUT_USEC_SHORT_SEMA_BLOCKING iterations and relies
> on each inb() taking about a microsecond. Use
> read_poll_timeout_atomic() with a 1us delay instead, like the type 2
> and 3 path, so the timeout is in microseconds and does not depend on
> how long a port read takes. With the delay plus the port read, the
> worst-case wait grows from about 10ms to about 20ms, which only matters
> when the BIOS never answers.
> 
> This removes the last users of num_ticks and EXPIRED_TIMER.

This should be united with the other patch I mentioned before.

-- 
With Best Regards,
Andy Shevchenko


