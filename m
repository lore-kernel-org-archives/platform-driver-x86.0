Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74528155320
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715616264; cv=none; b=Jer6ENwdWibXG7NL29dOJH85Vc1urZpD6cQOSQLcKNK4Pzabtd0lJ0wn4DFY2sr6DCc3JQGStlDpiIRNEUGwevTmI7Y7D29IIWG5Az9rQGo80i1TmW0/6Madx1v7qeX6td7gOGgd1x6HqIYULIOI5ox75sNdiaOmIAAfZfWnOmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715616264; c=relaxed/simple;
	bh=POxhUECEk4p+fEfoqCLRu3JyV7DGIxinC7hljTehiDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rs+nWP2jYmn1QDxD3J0LOZzeS9i5+4LHaGTDSgf5ieFQPn1OA8SrsoCcnTJaK7cD9aOuCv26B5dGU1tggHJVCL+vX4lADK39OwI9gAfIzyORXkFyYPvl7hy2dFQkGxlN4yxYU++6U1YIXnt0/P09FOQiY3Ou4yLUn2YEMxbHxq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: UHD4Av/fTgORM/91/MKMvQ==
X-CSE-MsgGUID: GEuPug4tQFSPReiKAoCr6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22963795"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="22963795"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 09:04:23 -0700
X-CSE-ConnectionGUID: 4g0yhYETSWa+BCrMY6hHNA==
X-CSE-MsgGUID: yigtk7+YQkqkxknCtymgNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="35131657"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 09:04:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s6Y9y-00000007BjQ-3MeF;
	Mon, 13 May 2024 19:04:18 +0300
Date: Mon, 13 May 2024 19:04:18 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	AceLan Kao <acelan.kao@canonical.com>,
	Roman Bogoyev <roman@computercheck.com.au>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86: Add new Dell UART backlight driver
Message-ID: <ZkI6Aqj02tC5PVE2@smile.fi.intel.com>
References: <20240513111552.44880-1-hdegoede@redhat.com>
 <20240513111552.44880-2-hdegoede@redhat.com>
 <ZkIOa6jo47CqgxGK@smile.fi.intel.com>
 <d4c9a9c6-da94-4e65-b8b6-80f5618d15d4@redhat.com>
 <ZkIvdZ9Xhs-HiZn0@smile.fi.intel.com>
 <b1880f73-c8f5-4076-bb62-6c9ea620e99e@redhat.com>
 <ZkI1ZecXG0kqzak5@smile.fi.intel.com>
 <7c134976-d70b-9703-c295-4c89c4c07070@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c134976-d70b-9703-c295-4c89c4c07070@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 13, 2024 at 06:54:25PM +0300, Ilpo Järvinen wrote:
> On Mon, 13 May 2024, Andy Shevchenko wrote:
> > On Mon, May 13, 2024 at 05:33:10PM +0200, Hans de Goede wrote:
> > > On 5/13/24 5:19 PM, Andy Shevchenko wrote:
> > > > On Mon, May 13, 2024 at 03:18:10PM +0200, Hans de Goede wrote:
> > > >> On 5/13/24 2:58 PM, Andy Shevchenko wrote:
> > > >>> On Mon, May 13, 2024 at 01:15:50PM +0200, Hans de Goede wrote:
> > 
> > > >>>> +static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
> > > >>>> +				const u8 *cmd, int cmd_len,
> > > >>>> +				u8 *resp, int resp_max_len)
> > > >>>> +{
> > > >>>> +	int ret;
> > > >>>> +
> > > >>>> +	ret = mutex_lock_killable(&dell_bl->mutex);
> > > >>>
> > > >>> Can't be called via cleanup.h?
> > > >>
> > > >> I prefer to have the locking explicit rather then use cleanup.h .
> > > > 
> > > > Hmm... interesting, so you push-back the cleanup.h usage?
> > > 
> > > I'm in favor of the guard(mutex)(&smne_mutex); syntax, but this
> > > is a mutex_lock_killable() for which that does not work AFAIK.
> > > 
> > > So in this case AFAICT we would need to use the cleanup stuff manually
> > > and in that case I believe that in that case just sticking with
> > > the current code is better.
> > 
> > There is scoped_cond_guard().
> > But there is no DEFINE_GUARD_COND() for mutex_lock_killable().
> 
> Is there a way to return the original error code with scoped_cond_guard() 
> or does that it force overriding the original return value with a 
> hard-coded one provided by the caller which seems a step backwards?

Yeah, that's also a downside. Perhaps you can reply to the original thread
about this. But it seems it was developed for boolean type of functions w/o
thinking a lot about returned values.

-- 
With Best Regards,
Andy Shevchenko


