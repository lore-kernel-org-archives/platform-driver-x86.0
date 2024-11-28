Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1119F416
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732809115; cv=none; b=MLhGSqxO5rYcZm2wDt9HB/duI3is/TxYTYCRz0CmTTC+Jqorj7e8wSHsuLKKCS6bfYcA2LQInNSjJu8wa+ZXQO3HElm14uqM/IL4NC5Rb8F35h4eGG7XO5lfGE6Tl3rGGwByB/RqZp3CG+BsM++R8KlXlPkNYk2rbrvVpByPL3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732809115; c=relaxed/simple;
	bh=+HBoi8oxGmdqf+zk7JdgZCTPeJtAiyseawSi+2LA0Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyuC5zvs8H1sYzE+npq00/xCyAlUzNmIrY/MOxmg4rE740+SeuK7SRRavCG7NYsDnAcGlS61lC/2+j6IbEHR/dA0+4GNgRTc/8tfgomBraXachC5HgogsCMghxpovyLWS/hLh7yngJyICCBPU6JtBlx5he7qNJ0dNhzeEg1GxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: fbEHk8RrRgmzGV/hlk7xDw==
X-CSE-MsgGUID: Jz0FR0igRZuTLqxvYw6uGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44424501"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="44424501"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 07:51:53 -0800
X-CSE-ConnectionGUID: CLOJiKJoSWq36lMUIk22Zw==
X-CSE-MsgGUID: 5TVPghRBQv6askTr7779Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92654170"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 07:51:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tGgo1-00000001ysX-1VEE;
	Thu, 28 Nov 2024 17:51:49 +0200
Date: Thu, 28 Nov 2024 17:51:49 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/4] platform/x86: int3472: Check for adev == NULL
Message-ID: <Z0iRlZPFYItHIV7_@smile.fi.intel.com>
References: <20241128154212.6216-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128154212.6216-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 28, 2024 at 04:42:09PM +0100, Hans de Goede wrote:
> Not all devices have an ACPI companion fwnode, so adev might be NULL. This
> can e.g. (theoretically) happen when a user manually binds one of
> the int3472 drivers to another i2c/platform device through sysfs.
> 
> Add a check for adev not being set and return -ENODEV in that case.

But what kind of "bad thing" can happen in such cases?
If none, why this change?

-- 
With Best Regards,
Andy Shevchenko


