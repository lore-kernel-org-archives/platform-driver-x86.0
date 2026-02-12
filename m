Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC4F26ADC
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770912777; cv=none; b=PVaJDTv15vSB+ZeGLDp9qvEWgvzof/QLaTABm/GWEMh0bzjtWzOpw1/GTXAe3rWH8TxLne8XU1fcppjA0Ba901tKB+twd0/Ge+c+0GA7x+PtTa9XiBcMYPe87Z1jITtpBVc6t6NhGEWvUoblr+P0/8GO8vj89LgLp5Qm7r6Geeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770912777; c=relaxed/simple;
	bh=ZwKX+bmlpeT4CQAxhH1LHHbhV4NAWl2BSKXjbNJ4u20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii7dU5Y/hkfJ/UtgMiJJnzElyHraRvn8zKEGZdNcDo/GnYI7QcfUUrBiDwg94oDwRyQO4BsQO/Jo6fYTjDdVYGAlh+etao0UriIGVH7UqtCsFn8BNL/z10XF4AqSOj6v4M/uTswLXCMEUS52kYOK6vbf7ykz+BKkKL4lYLMXODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XW6olKJk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XW6olKJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770912776; x=1802448776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZwKX+bmlpeT4CQAxhH1LHHbhV4NAWl2BSKXjbNJ4u20=;
  b=XW6olKJk++ea7GfJYc7hjMWmpDNMBqLjyylvyoLmoEwpwwJqi9Pl3RQQ
   fbFs+bcJ4xvda7QOhnkETGKkhdZnmjM68qHp2SASQJBLe+o7EQJB8O/jt
   2RxPxJIktHIbtqJCMQwFzP+qDesJIInK6BzOYOo15Pv5yk6qOlQTlPnkb
   qhxq+bo2NUrze+G4C4SVWaPEF/wazEwg58V9gZePYNh0rdMqJgwInDwHR
   iPqPeT9jjeSrzZ04oRtxZo8TJUg9hPy6vpNhWTSwGDVWWj0Ct5VG2+lXn
   1/3rm4njB5roe173mTF2uTvd+Jpz/OQOytSpNMv5+GpAGQ79NlQx/oXgF
   g==;
X-CSE-ConnectionGUID: BgU6XDFqTd+0uKhWWpV6Zw==
X-CSE-MsgGUID: 7dmat2AxQ12rWB3nSXIBZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89495451"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="89495451"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 08:12:56 -0800
X-CSE-ConnectionGUID: R+qQGOSBST6eYl8lah39qA==
X-CSE-MsgGUID: 5AS95FQZTT6Qx1QMoq/z0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="212743560"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.145])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 08:12:54 -0800
Date: Thu, 12 Feb 2026 18:12:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aY38A8MbctpAgDqS@smile.fi.intel.com>
References: <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
 <aYoOKBMAsTuwHKK0@google.com>
 <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com>
 <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com>
 <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
 <aY2rWc4bfeWqw1Zu@smile.fi.intel.com>
 <aY318Dg9gMU1KFvx@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY318Dg9gMU1KFvx@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 12, 2026 at 07:49:31AM -0800, Dmitry Torokhov wrote:
> On Thu, Feb 12, 2026 at 12:28:41PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 12, 2026 at 02:01:02AM -0800, Bartosz Golaszewski wrote:
> > > On Thu, 12 Feb 2026 04:44:05 +0100, Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> said:

...

> > > +const struct software_node lpc_ich_gpio_swnode = { };
> > 
> > (With name, please!)
> 
> That we could match against... /duck

:-)
No, it's for the /sys/kernel/software_nodes/ to help with debugging, et cetera.

-- 
With Best Regards,
Andy Shevchenko


