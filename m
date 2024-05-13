Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ACF5695
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715615086; cv=none; b=enV5GzU2jhiANcSBTbnIgEzNGiK/nHZcqRrLhSQb8Og+BwnrTU7zh5bbxxUJ2HzaqB3o6OBGf4dQ5DpG8+ie2gO7kJ3WJdg9dyImvFUWv3RBnH4g98BP8RPN7QoHgskGLoSWTfNY1APqC8BtwnqE9tRNJdDJCAJsMM7wpJKzhGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715615086; c=relaxed/simple;
	bh=TyTtoFYC2iTKKB+J8nJPbpnSRdManeSDXfupej0wYnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHF1urjRov6M/9YP2RIPHaLMmea3JHrV7LbnDdGjXg+j4Aw5Fx7Axa+G5KE5x+4PrPtqA+r1oFuA/T/xpbrxOQinfU1w5Wmd7SM8YrQxm5Iy/wB0qkk2xqpMZjI58di6KZsVzex3Mix2FUHRUWGU7PMaU8tfCC/4wYi/JL44KcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: Y/TRrprvTY6pcrN8lC5lvQ==
X-CSE-MsgGUID: Dp1N4eIZSLisQ1+p7HVk2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22132811"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="22132811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:44:43 -0700
X-CSE-ConnectionGUID: EVYJw4kMSIKNl7kyXjDGOQ==
X-CSE-MsgGUID: BsURu5UPQyqHVPCCUOe8gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="35128599"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:44:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s6Xqv-00000007BO3-3lTy;
	Mon, 13 May 2024 18:44:37 +0300
Date: Mon, 13 May 2024 18:44:37 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	AceLan Kao <acelan.kao@canonical.com>,
	Roman Bogoyev <roman@computercheck.com.au>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86: Add new Dell UART backlight driver
Message-ID: <ZkI1ZecXG0kqzak5@smile.fi.intel.com>
References: <20240513111552.44880-1-hdegoede@redhat.com>
 <20240513111552.44880-2-hdegoede@redhat.com>
 <ZkIOa6jo47CqgxGK@smile.fi.intel.com>
 <d4c9a9c6-da94-4e65-b8b6-80f5618d15d4@redhat.com>
 <ZkIvdZ9Xhs-HiZn0@smile.fi.intel.com>
 <b1880f73-c8f5-4076-bb62-6c9ea620e99e@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1880f73-c8f5-4076-bb62-6c9ea620e99e@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 13, 2024 at 05:33:10PM +0200, Hans de Goede wrote:
> On 5/13/24 5:19 PM, Andy Shevchenko wrote:
> > On Mon, May 13, 2024 at 03:18:10PM +0200, Hans de Goede wrote:
> >> On 5/13/24 2:58 PM, Andy Shevchenko wrote:
> >>> On Mon, May 13, 2024 at 01:15:50PM +0200, Hans de Goede wrote:

...

> >>>> +static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
> >>>> +				const u8 *cmd, int cmd_len,
> >>>> +				u8 *resp, int resp_max_len)
> >>>> +{
> >>>> +	int ret;
> >>>> +
> >>>> +	ret = mutex_lock_killable(&dell_bl->mutex);
> >>>
> >>> Can't be called via cleanup.h?
> >>
> >> I prefer to have the locking explicit rather then use cleanup.h .
> > 
> > Hmm... interesting, so you push-back the cleanup.h usage?
> 
> I'm in favor of the guard(mutex)(&smne_mutex); syntax, but this
> is a mutex_lock_killable() for which that does not work AFAIK.
> 
> So in this case AFAICT we would need to use the cleanup stuff manually
> and in that case I believe that in that case just sticking with
> the current code is better.

There is scoped_cond_guard().
But there is no DEFINE_GUARD_COND() for mutex_lock_killable().

...

> >>>> +	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
> >>>
> >>> I would be on the safest side, i.e. not trusting that it will be NUL-terminated
> >>> string, hence something like %*pE?
> >>
> >> Right, this is why the existing dev_dbg() already passes a precision and we do
> >> want to actually stop if there is a 0 there, which %pE does not do.
> > 
> > I'm talking about the opposite, when it might go over the boundary.
> 
> AFAIK the way the precision is used in the current code limits things to at max the boundary,
> stopping earlier if a 0 is encountered earlier.

Indeed, I refreshed my memory about %.*s.

So, the only part left is the potential terminal sequences appear in
the message.

-- 
With Best Regards,
Andy Shevchenko


