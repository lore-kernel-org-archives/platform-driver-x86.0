Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E414226ADC
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770912874; cv=none; b=RLgXqrbMDjCxvDIeGf6Kt3Z0tWi96BxaK8h7Q2DxGJLD0LYc7vKDJ94dhPMsKVGMDykJ8qMW+IEYeayvtrGm1+bJ7HxJGyyoxQRMWLstJZJiSAWM1QXhc00HytiK/BlZ5KVHirm55VHYCSauSw+fHmsUoTTM6fcezRLB+Z6LDjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770912874; c=relaxed/simple;
	bh=VaV9zlqKmM4FxNMYHbcTg6tvfHqGr1KzZVpHe7kglrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8by8IB0VqifCqye6cCpEZT11e8lOkJs4a42M04I8EoKcDLNA8OETJQnl7jHSD7Bc8Kw4swteXaJAGkmY+YkPe+ybKxsX8kRM2Cr3ChLTfPQjVjvVNvluDuYLcs2RqOLFh8UGELoHT8ElJqfE36IRt2WgmoDX7E8JWb8mkWCn4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlvCYMj1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlvCYMj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770912873; x=1802448873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VaV9zlqKmM4FxNMYHbcTg6tvfHqGr1KzZVpHe7kglrY=;
  b=MlvCYMj1U/puAjwk+372dtMeeKWzJ90aVT376y+znK2BKWFSauoNuLCh
   d7y+pawZpkNF26USqPot1TyqI8Lq6Rmx8Kz4wxnxCFhPLcR7aRKC+vSOb
   elTgYoxnGpKNgpHXIrrQEDVADrCQOSlWMknjB66NG9kyiS09rGRThF83I
   7zXVsOOvqYTFHq6RAptagxMhQvom2IG6oLgfyeOOpXk8cX/O0hydGZsyU
   yRUEM6VjGgsMcUkQ0qs9L5ssHVnOmDTvmjjLbz8uuCC6rz1pVFS6FBd7Z
   SRBg7few+gUjUE/CYKroZ2ACrDfndUvb9RgdCAmBZ4Hec9edInrfQloS4
   Q==;
X-CSE-ConnectionGUID: vPH1xVYJRUW240gEXoqatA==
X-CSE-MsgGUID: Bp/hvzifT7WvWNYUZOzh3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72185371"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="72185371"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 08:14:32 -0800
X-CSE-ConnectionGUID: VEcyF46zSl+6UjcRsxoTIg==
X-CSE-MsgGUID: TiMV9Tv3SsaPOrRmneSItg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="211441276"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.145])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 08:14:30 -0800
Date: Thu, 12 Feb 2026 18:14:28 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aY38ZBTfbf9a7Unw@smile.fi.intel.com>
References: <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
 <aYoOKBMAsTuwHKK0@google.com>
 <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com>
 <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com>
 <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
 <aY2rWc4bfeWqw1Zu@smile.fi.intel.com>
 <aY318Dg9gMU1KFvx@google.com>
 <aY38A8MbctpAgDqS@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY38A8MbctpAgDqS@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 12, 2026 at 06:12:56PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 12, 2026 at 07:49:31AM -0800, Dmitry Torokhov wrote:
> > On Thu, Feb 12, 2026 at 12:28:41PM +0200, Andy Shevchenko wrote:
> > > On Thu, Feb 12, 2026 at 02:01:02AM -0800, Bartosz Golaszewski wrote:
> > > > On Thu, 12 Feb 2026 04:44:05 +0100, Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> said:

...

> > > > +const struct software_node lpc_ich_gpio_swnode = { };
> > > 
> > > (With name, please!)
> > 
> > That we could match against... /duck
> 
> :-)
> No, it's for the /sys/kernel/software_nodes/ to help with debugging, et cetera.

OTOH, if there are more than one of a such controllers in the system...
And it can be found by reading the links that one of them related to
a certain GPIO device. So no insisting on this.

-- 
With Best Regards,
Andy Shevchenko


