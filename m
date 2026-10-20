Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485548;
	b=qkZC22/gamQjEjGhuDDw+yXQxz5sC2PNsmSU+3ySyo5qs+aLGPQl/TV+eh4JGrvgHVZN
	 EPGzr/SUqSw0m7mT+8UDpsCgvTuPfZX+PAPX55BqIi9x4ky6fYBR/l8wSSvTXnMt2Lgs/
	 ZhIS4truq2UhwS4lzHFaBeI4dWzLTWW0n0LfZY9cMozV/+uQwI+2y+HCapbjZ31SEbffz
	 ITB7IvuDs+WTm8i5tb2eFTttllxKpfNz9/ZvwIEib95pPE/F+Gra3HJDr0tQkzXPAht6Z
	 ZzNX0LybEY7w5nEEyDXyw6xa6p4EQQ71Ty7E0IfcUKT9a6Oc9MOqIDlhNRpLHKUukkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485548;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yujEVqHCh8sJ1pRm/aXBsoE+oiIUhc4FSF92R9K/k7o=;
	b=Aeibxe7WcVWZRPpsVHw3Y7oNTh89xhXKKp/Nw+YntDQ6wAoff/f2RrdiKCjzx9a4A8DM
	 4FvNFM77NCYfbQ4RpuyzAP1NLmXnOEAp3a5rTlAtN/+Hd7pEZlan+0XDPl2sHjY6uEWbW
	 I1UMUPfAm1WAtH3B+QmxRtJg3DGBJcpNHhCOYT3Ov25UNzn9EtN0CO8jQZJ7WotoNlfqt
	 4RJu/FkDyLtIRuXmy+mRjaSVVb7ZYFB7RTY2QzxDTPZne/iyXSydgZzibfeVauvpkafFQ
	 XAiExX+mu/5s8RKQp/SpYz/HPVTvdHtAcDsFGRojZk9eLQBfvyFRM5KSuZxEWK/PIwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b+BWXyO9;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E859606A31B;
	Tue, 20 Oct 2026 08:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E859606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b+BWXyO9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792485547; x=1824021547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mVZT1z04UtmuzFCDbUsT5UIYLYLTh8rsgB6sZZY9nXY=;
  b=b+BWXyO9z9sK3l+SF+fMInaQzFcIzmeRAzc1vemx8yjhnW6b+PJhDnpS
   JCH6iwyLVCuXpQEabRQNt2DPJO1HjuVPzyO6Xefoc8BLRMfk1l5M862SU
   YFMytCMTxu2oDeDtEAcz/gRn5FA9tStWbJqew4I0ECE9knxko/29me0Iv
   noqJ4CJZHuF92r5RSK7F8XXFVIwwJ5zekvhS8JbiEnj1Crc+0OO2SzgKo
   nEuegEQQe8rvvYcb/Mlxn88hTZjMGQsyofG0QM2HCSph/rJ+S2bQWos3+
   VJM5zOcXjbD970c4nzaVfxP+E8R0OyCEZx2+I+PtF+C2uvj5DWHwyfflN
   w==;
X-CSE-ConnectionGUID: YpZ9WuciRtGcpopYu1MgjA==
X-CSE-MsgGUID: 2z0Jv8keQsKqhZADMTkkDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1194226"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1194226"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:39:07 -0700
X-CSE-ConnectionGUID: k7cAPDenR/WQ760LIOMhOQ==
X-CSE-MsgGUID: A8mNRqrdTxma5jvPFwBzJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2745985"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:39:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8863411F7E8;
	Tue, 20 Oct 2026 11:39:01 +0300 (EEST)
Date: Tue, 20 Oct 2026 11:39:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Patrakov <patrakov@gmail.com>
Cc: johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org,
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com,
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: ov5675: Defer the probe until the
 endpoint exists
Message-ID: <atcopTZc6G2c4K2H@kekkonen.localdomain>
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com>
 <20261020015001.15672-2-patrakov@gmail.com>
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
In-Reply-To: <20261020015001.15672-2-patrakov@gmail.com>

Hi Alexander,

On Tue, Oct 20, 2026 at 09:50:00AM +0800, Alexander Patrakov wrote:
> On ACPI systems the sensor's endpoint is a software node which ipu-bridge
> creates when the IPU probes. Nothing orders that before the probe of the
> sensor. If the sensor is first, there is no endpoint yet, parsing it
> fails, and the probe fails for good: the camera is missing until the
> next boot.
> 
> Return -EPROBE_DEFER when there is no endpoint, as ov2740, ov13b10 and,
> since commit 437e1f6a9600 ("media: mt9m114: Return -EPROBE_DEFER if no
> endpoint is found"), mt9m114 do.
> 
> This failure mode was seen once on a Lenovo Yoga Duet 7 13ITL6.
> Reproduction efforts did not succeed.
> 
> Signed-off-by: Alexander Patrakov <patrakov@gmail.com>

This patch is unnecessary as v4l2_fwnode_endpoint_alloc_parse() already
validates the endpoint. Also the comment is redundant.

-- 
Regards,

Sakari Ailus
