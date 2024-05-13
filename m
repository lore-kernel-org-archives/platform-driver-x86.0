Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941C15E9B
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715613564; cv=none; b=JsTdJ20i6BkAAYdKxEf5JqO6m8JlLKvDo/c88BGX4Lek12daoHgDO0ewnFZM5i6FhYImlUVSW4S0C83yB7NwA8LmVNIDxRVJfUH9Dv9T8RJEnpDz9EEbstYe7894kHLUemnpkzQ00dvf5eRfeSHxDvWqTvQB+joZAExx3LxeN2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715613564; c=relaxed/simple;
	bh=kasFwSyEReLrnQlulmUVSwwXxHqkYTyaoFWORFp7ZNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN5hcYL2rHtZF6ReFpVQajjq3+bsWMuAh+PdoO7FjAm8lIP0SPgKLMLWg67fZAaqfQrW2g0/7MU/crNapA8q2sAgGSHf0h0HWX1t5EwOPglYXzv60yyPnfhrziDdPsWfYJeuCEEMxYobp2xMXOB8RIyhMe6icQJNeXTT21XcSxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: MQ/l+W5uShGlSJtAGuh1ng==
X-CSE-MsgGUID: h6okDPlWTpWQIAL1V0Xrlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11428411"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="11428411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:19:22 -0700
X-CSE-ConnectionGUID: 4t8KRMlpSjSz+IMg5MlqKg==
X-CSE-MsgGUID: 5NEGzGhOT3OeqkhZLYfMFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="61203220"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:19:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s6XSQ-00000007B0T-09o0;
	Mon, 13 May 2024 18:19:18 +0300
Date: Mon, 13 May 2024 18:19:17 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	AceLan Kao <acelan.kao@canonical.com>,
	Roman Bogoyev <roman@computercheck.com.au>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86: Add new Dell UART backlight driver
Message-ID: <ZkIvdZ9Xhs-HiZn0@smile.fi.intel.com>
References: <20240513111552.44880-1-hdegoede@redhat.com>
 <20240513111552.44880-2-hdegoede@redhat.com>
 <ZkIOa6jo47CqgxGK@smile.fi.intel.com>
 <d4c9a9c6-da94-4e65-b8b6-80f5618d15d4@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4c9a9c6-da94-4e65-b8b6-80f5618d15d4@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 13, 2024 at 03:18:10PM +0200, Hans de Goede wrote:
> On 5/13/24 2:58 PM, Andy Shevchenko wrote:
> > On Mon, May 13, 2024 at 01:15:50PM +0200, Hans de Goede wrote:

...

> >> +static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
> >> +				const u8 *cmd, int cmd_len,
> >> +				u8 *resp, int resp_max_len)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret = mutex_lock_killable(&dell_bl->mutex);
> > 
> > Can't be called via cleanup.h?
> 
> I prefer to have the locking explicit rather then use cleanup.h .

Hmm... interesting, so you push-back the cleanup.h usage?

<snip>

> >> +		case RESP_CMD: /* CMD byte */
> >> +			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
> >> +				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
> >> +					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
> >> +				dell_bl->status = -EIO;
> >> +				goto wakeup;
> >> +			}
> >> +			break;
> > 
> > No default case?
> 
> Nope, this checks the validity of the first 2 bytes / the header. The data is not checked.

Why not

		default:
			/* We do not check the data */
			break;

?

...

> >> +	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
> > 
> > I would be on the safest side, i.e. not trusting that it will be NUL-terminated
> > string, hence something like %*pE?
> 
> Right, this is why the existing dev_dbg() already passes a precision and we do
> want to actually stop if there is a 0 there, which %pE does not do.

I'm talking about the opposite, when it might go over the boundary.

-- 
With Best Regards,
Andy Shevchenko


