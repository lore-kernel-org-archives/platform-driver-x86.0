Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120452;
	b=DmHqWcQJWMV9ehD6DQyQihaySbL7gKQMg98YSKCrlu+1yql07E/I/uNE/1X/H5wKtYQJ
	 YzyXwbqtHcLUT2nB31OyzFknY33rKIB94m4S3nQBkt3wFFHT0/8gdyOCXOjPQj5Nmgz+1
	 K3S/90MTxjAytFZxfNEfIAcFbDaofnzSS+lQUXU9XzrzZdoRZmmMJ+ibc/Clic0qA5a34
	 4SzcDyeNsXg6nJZkwffiWS9+FJlv/ZoRd3ol70wBUKSfv03dlYqWUG3bezCXeL0o5aODt
	 ZMvUFOmPYcStulO2INjfEIAL1+S9Cqs/9C5cFsrhQO9PZ9nGBM3tupjcYDo//DRpolQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120452;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=LcC9I+RA90w4+HxiFBhw3WISTN7AOJKhjKKc/4C8RWA=;
	b=iZSMKfYVYJuStOUEGUMeFkESWBIZvxqCpIrzWwqWlMUUUznLIDkt/tA53gcU5J4y7IiQ
	 Ylh/pVegNvjcnLGWVhOyY6a5N9h1sxQ9V9UrZ12uXy655uJIKq4zhjz87DCjuX4eCfos4
	 SCf15lq4VJDENiAHgnV95lDC6DnoCNtL/JyvBuMCHDJFfO+rZru2Ps1z2weBCFioEst9/
	 I2l+tJQxkKpgp9OopB0NWSdR1D5PodpgPni1yTzMDW7dgfMRSi7uDjBdneroBD+QI2BaF
	 7Sn35mLlT4fZsl+sOeSFhBQzPVelQ7CEvVuK38zlzJ8ZuYwK1A2DZZCsxPusEU9QpBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Xdwc2aY/";
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261560A6F51
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 20:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7261560A6F51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xdwc2aY/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795120453; x=1826656453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Tz7zpcTShjgRl7cInnCF2+Ir3OfcpWYuoHofnPv44Y=;
  b=Xdwc2aY/IRXs1hYmvmpji7B9j6pqbN5IYlqfLXViaKFY4dM7b3A88S4E
   b1PqMdL9WAevTjRP33Pplw2KdT6N0mD3OSu+VVUcP0kCb/CUIsqDMtQDS
   b8Y0UF/H6iHWCib5tDMrFkHm7kKRjLu9VqtC8jIsVRP9cnpNRA7hmYeYq
   dwmm91oUdMLx8zKU4NMxbx+OzZluz0kRO8f6cN52Eof29/4l+wUSC8jjF
   t30WJgk9d1/cUTcbVeZzPpbYBdQll/235YoRKlDovwcae3mLjEZgHE6aM
   HVi7yGXqzZMHgEKhnbiYScIVJSD0kC+SiUH5FHP6KiUMrsaB/dWG7aIrg
   Q==;
X-CSE-ConnectionGUID: 8EgRtkNDRRqFJTepxQk69w==
X-CSE-MsgGUID: A/iVNm1hQkSDr+AiMT2smA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3982520"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3982520"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:34:12 -0800
X-CSE-ConnectionGUID: C1dPOeAxSoGsARIblv5CZg==
X-CSE-MsgGUID: w/qehlNhS+WH547+NhkZrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10522111"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:34:10 -0800
Date: Thu, 19 Nov 2026 22:34:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 1/4] platform/x86: dell: dcdbas: Actually wait for the
 host control SMI
Message-ID: <av9dP5sFa6J5Bpv4@ashevche-desk.local>
References: <20261118035638.11773-1-rosenp@gmail.com>
 <20261118035638.11773-2-rosenp@gmail.com>
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
In-Reply-To: <20261118035638.11773-2-rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 07:56:35PM -0800, Rosen Penev wrote:
> For SMI types 2 and 3, host_control_smi() writes the command status as
> -1, raises the SMI and then waits for the BIOS to change the status:
> 
> 	while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {
> 
> apm_cmd->status is a plain memory read, and neither outb() nor inb()
> tells the compiler that memory may have changed, so the compiler
> assumes status is still -1. The loop then has no side effects and its
> return value is not used, so it is removed entirely: in the generated
> code, the read of the control port is followed directly by the return.
> The kernel goes on to power off right after raising the host control
> SMI, without waiting for the BIOS to accept it.
> 
> The type 1 wait polls the APM status port instead, in a loop that
> counts down TIMEOUT_USEC_SHORT_SEMA_BLOCKING iterations and relies on
> each inb() taking about a microsecond.
> 
> Convert both waits to readx_poll_timeout_atomic(), using READ_ONCE() for
> the status in memory and inb() for the status port, 1us apart for up to
> TIMEOUT_USEC_SHORT_SEMA_BLOCKING microseconds as the name suggests, and
> return its error. That is -ETIMEDOUT rather than -ETIME, but both
> callers ignore the return value. With the delay plus the port read, the
> type 1 worst-case wait grows from about 10ms to about 20ms, which only
> matters when the BIOS never answers.
> 
> This removes the last users of num_ticks and EXPIRED_TIMER.

Looks good now.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


