Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ED529A9C3
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650580; cv=none; b=k4aCaxFTI9HIYR3ZuDGmN4MgWZVJALiOHD9rmPYpKJi/Mcd7f6ZGCHXK1xNcrHUZo6plNbea9apldff4d0lRTXydxQP4I4R6j1qzB5RvLG0kJT5g7XBQHrE0mXCPRM1MOdAphWgof9ni3K8eIdSgSvp83hHq0y+O4V9yxKGAumI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650580; c=relaxed/simple;
	bh=1TYnMOgczOhF3B24434+hgNXGvrkZKy3oORPu4/5vd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDEhA7oyOnCJfk3KbfyccndzTigWzx81zW2KW3jtqywXTfG8o5dFQnL+zaAYQG2a1SoeGnrr0pmYC8r62b/D9G3GphSP/TPtqBWw7M+PrShAqdaLX5+KZEDqy5ZB8F0CyC26AO+E0WZJxH90jFAuEAP14DQOZvk0mYdpyyDjqug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMx2JxUi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMx2JxUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770650580; x=1802186580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1TYnMOgczOhF3B24434+hgNXGvrkZKy3oORPu4/5vd4=;
  b=DMx2JxUiXAssDQSaBGHGUAOqLwdYhfmvgmsmef10t9DkA9MOkJTq+q5X
   qEZnrML8QDeNBBqlcpCWeg0SIzK9PFl9MyLK7ooAVO6bP0VjwQaLrFkxF
   5xXsgJW7tJWpKcVyukMOZf1fQ6Jxsy205+e+fUrzK1IWPKSU+NrhseYA4
   vVYbpRDxuc/Yxb7Oh2BQBdGokbji1FV7sdF3sJnKHEhQldWfbx7wZBxu3
   bF064Sacf7UUhwtVF9wRTj+rBtDK5qCFsMBb3X1R5Uz2OCIafzCypdCdh
   miJZMuNzy2k2KypzpaaUl+GJX1+/mEx7wgKlRu/uMjAiKBx7BGyyGRiRs
   A==;
X-CSE-ConnectionGUID: 7VeS0/F9TBaRDiFcxxX0lw==
X-CSE-MsgGUID: QUKkDRIMRdKBG2+GbYWg2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83203917"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="83203917"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:23:00 -0800
X-CSE-ConnectionGUID: 8PqHQmrMTTyCj8M2JGs21w==
X-CSE-MsgGUID: E1BBc5LzR2eYdlRaE8sMWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211226486"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.128])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:22:57 -0800
Date: Mon, 9 Feb 2026 17:22:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aYn7z_J0jEOktGt8@smile.fi.intel.com>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <aYnqY4KPq2Gqj3Dv@google.com>
 <a38ad0ec-e72b-4667-bd5b-f12bf147016e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a38ad0ec-e72b-4667-bd5b-f12bf147016e@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

+ Cc: Aaro for N770 case.

On Mon, Feb 09, 2026 at 04:13:26PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 9, 2026, at 15:41, Dmitry Torokhov wrote:
> > On Mon, Feb 09, 2026 at 03:00:40PM +0100, Hans de Goede wrote:
> >> On 9-Feb-26 12:52, Bartosz Golaszewski wrote:
> >> > On Mon, 9 Feb 2026 09:08:04 +0100, Andy Shevchenko <andriy.shevchenko@intel.com> said:
> >
> > I think the hardest breakages are here:
> >
> > arch/arm/mach-omap1/board-nokia770.c
> > arch/arm/mach-pxa/gumstix.c
> > arch/arm/mach-pxa/spitz.c
> > arch/arm/mach-tegra/board-paz00.c
> >
> > If we check out at nokia, it uses drivers/gpio/gpio-omap.c. As far as I
> > can see it does not even have a fwnode assigned: it either does not have
> > parent or its parent is a platform device instantiated by the driver
> > itself and does not have a firmware node associated with it.
> 
> I've been meaning to drop support for mach-pxa board files including
> gumstix and spitz for a while, I should probably just do it sooner
> than later.
> 
> I don't know why paz00.c still contains the fwnode entries, I believe
> that should have been converted to a device node in
> arch/arm/boot/dts/nvidia/tegra20-paz00.dts after d64c732dfc9e
> ("net: rfkill: gpio: add DT support").

-- 
With Best Regards,
Andy Shevchenko


