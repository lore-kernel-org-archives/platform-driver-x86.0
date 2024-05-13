Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977157CA7
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715615145; cv=none; b=JBdHSR5Mld47a8ox4hhtTOs4Z4piudQ3KuDFOBOuGZnCtgphOBn58J+Iv9nCUOFpH6YULIe5nayX0+yzXmKKslo51p0ig3sTqkkPB+Ieb5V7arXuIm0ak/1in6PuHDDH82ipAjasPFKKTPb9vDcg2Gz6fTPHImg/CWhjiUeAiqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715615145; c=relaxed/simple;
	bh=bwyAzaF04wu5/+nsqKm5c7Sc/9ubZsHctyougQMEPVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ob8YikgqufGsSyk7HY/9S55aevnr9hCr2RT5f89VhItXD33cmohIQBgkn67P37rpXP2Zgv6PBr3LNp0tGzBQDDwXBILzr6JnTHm0xC1vbCP0i63NggFg+0pm3qGKzQXlx8oeVt0BD5t6Uv9WffaOmowXPVU7vkUERzPLYQys6YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: VkyIALn3RqKWkwGGh3qYWw==
X-CSE-MsgGUID: ussdIqWKRH+n7Vq1qGtIMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11377640"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="11377640"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:45:44 -0700
X-CSE-ConnectionGUID: 6ny9XoDAQ1y/QB9Iq8UfZw==
X-CSE-MsgGUID: YWVnRTo+QJWvLcRBnlgUGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="35247745"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:45:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s6Xrv-00000007BPb-1EAG;
	Mon, 13 May 2024 18:45:39 +0300
Date: Mon, 13 May 2024 18:45:39 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	AceLan Kao <acelan.kao@canonical.com>,
	Roman Bogoyev <roman@computercheck.com.au>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86: Add new Dell UART backlight driver
Message-ID: <ZkI1o1Y-1igCxNY-@smile.fi.intel.com>
References: <20240513111552.44880-1-hdegoede@redhat.com>
 <20240513111552.44880-2-hdegoede@redhat.com>
 <ZkIOa6jo47CqgxGK@smile.fi.intel.com>
 <d4c9a9c6-da94-4e65-b8b6-80f5618d15d4@redhat.com>
 <ZkIvdZ9Xhs-HiZn0@smile.fi.intel.com>
 <b1880f73-c8f5-4076-bb62-6c9ea620e99e@redhat.com>
 <ZkI1ZecXG0kqzak5@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkI1ZecXG0kqzak5@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 13, 2024 at 06:44:37PM +0300, Andy Shevchenko wrote:
> On Mon, May 13, 2024 at 05:33:10PM +0200, Hans de Goede wrote:
> > On 5/13/24 5:19 PM, Andy Shevchenko wrote:
> > > On Mon, May 13, 2024 at 03:18:10PM +0200, Hans de Goede wrote:
> > >> On 5/13/24 2:58 PM, Andy Shevchenko wrote:
> > >>> On Mon, May 13, 2024 at 01:15:50PM +0200, Hans de Goede wrote:

...

> > >>>> +	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
> > >>>
> > >>> I would be on the safest side, i.e. not trusting that it will be NUL-terminated
> > >>> string, hence something like %*pE?
> > >>
> > >> Right, this is why the existing dev_dbg() already passes a precision and we do
> > >> want to actually stop if there is a 0 there, which %pE does not do.
> > > 
> > > I'm talking about the opposite, when it might go over the boundary.
> > 
> > AFAIK the way the precision is used in the current code limits things to at max the boundary,
> > stopping earlier if a 0 is encountered earlier.
> 
> Indeed, I refreshed my memory about %.*s.
> 
> So, the only part left is the potential terminal sequences appear in
> the message.

Just for clarity, the %*pE would require strnlen() call to have similar effect.

-- 
With Best Regards,
Andy Shevchenko


