Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2382B9C3
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716398453; cv=none; b=UQz5NVyNVywWTtMd72KyX+iC5k1id522DfmnIDlLzzIhSOFGKtx+94bBMjFO2WhTnV96O3+oIP5cF95rarl3qcCWAowns6NOqIclj0rXwdOeWpPu+WteKqAkGk6Nc+plNBEpt9pJhtSFnN8AY2E7XK+s7yNzbwZxxhItIRjZK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716398453; c=relaxed/simple;
	bh=rjIklaQ9jNqKmt7Ql3DVeOzhg6T4lsy/QOr6yn1zp2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWPT7L4C26s/aP16VrdBoWQv9REphHWRxyQbNHAwAPpQkllaR0kSXib7XZ4GSzl4iyHk2uREA7ebNQCjbZENAB2d3poqpOb6XE05bqgqHjf5oNs7J7uEHYSY3Z5+MGLQeonporU9e0Lk1xWcxZLFdxDGT06d7APTheITZzFi0Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 7T2AuugWTxGTzQob/h1Lkg==
X-CSE-MsgGUID: rKzkJCFKR5KppQd1PKPytQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12786463"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="12786463"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 10:20:51 -0700
X-CSE-ConnectionGUID: ajQCYjFhSH6kUEktQdYDvw==
X-CSE-MsgGUID: XgDRPOVjTo66VxyxP5YgpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="33824070"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 10:20:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s9pdv-0000000A3Mp-3z54;
	Wed, 22 May 2024 20:20:47 +0300
Date: Wed, 22 May 2024 20:20:47 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Gregor Riepl <onitake@gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
Message-ID: <Zk4pbyKX7yDNPjgf@smile.fi.intel.com>
References: <20240522164807.28936-1-hdegoede@redhat.com>
 <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 22, 2024 at 08:19:07PM +0300, Andy Shevchenko wrote:
> On Wed, May 22, 2024 at 06:48:07PM +0200, Hans de Goede wrote:

...

> > +			ret = kstrtou32(value, 10, &u32val);

One more thing, why to limit to the decimal only?
Should be up to user to choose. And some properties (now or in the future)
actually might benefit from being able to be entered in hexadecimal form.

> > +			if (ret)
> > +				return ret;

-- 
With Best Regards,
Andy Shevchenko


