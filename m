Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1D2D595B
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458170; cv=none; b=YnWI5Ka9q4K2f23sNBEYSSPD0seXOMMthJwyxvPAMLRL14XOt+F2I+69dSlEBauWS5UtO9ro5Z+KUjeP1Oy8kf8zaaATyyMvXueSJRLjpq6pV1L1GP+wd5sGwP0lIZ54Z6GMFh4PoGMcdrj8bKVOFwxSndqQBMBo+/MzlBAewWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458170; c=relaxed/simple;
	bh=LrQxt7ZP+4/FeafGzuGw2JjD0U+xQAWvzJHPHVGkMPY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lUXV/mxioq/9VlIK4Gv6e4qkx/Zs5/vR+QgV4R9jxLAmBJtfH/p1qeFJ8E9/7tGmEPmoFx/J24xO8BACgnrrWoDwKJNmSVznNsL2bl2CctUAiHIRv8TbGQcVyFDR2Idx1Jv4aNsIDZD4+CbAzLrFgJ3TpiXBXgSbkFlYv0sCwvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hk5Vbdf8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hk5Vbdf8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779458169; x=1810994169;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LrQxt7ZP+4/FeafGzuGw2JjD0U+xQAWvzJHPHVGkMPY=;
  b=hk5Vbdf8boZ7Mx4DT17PCPVerFsDgbcJ9BTyrWzZTTQLLUGGqo79XJb+
   xohkiyEcNsAOyEzjscNGDgQyGrsSYp3p6dUrBHJ34r7l6GzYNzImziToi
   GdFKsjEHLOJ7g6H8hHlj747dDO+hAVAAhkRRlq3cZGo8+EkFqVfr1/FDJ
   Ecua/5pmhsUFDTv/bxhCXSdR/A30zWWJLBMh7IzOcb1HmxZjheMCosbQA
   /Dipalrhlh/d3PpFPQXb9xJQflWDCvxQ60527EUl13nsSUzOV/CFDs6QW
   cQBwVrFher1gAQBOsKdC7FMUtOXVPRzB83BMmAlgsrbQ2xawoAgjZa4bs
   g==;
X-CSE-ConnectionGUID: HVjx9E1RSui4d+n4wb7sRA==
X-CSE-MsgGUID: W2PpEr/QRM6s9bfhNd7XSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="97809540"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="97809540"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:56:08 -0700
X-CSE-ConnectionGUID: v5qNQPxQQ8Wm1S39aDnhaA==
X-CSE-MsgGUID: zTwDZ+E2QSSMphNxEzoeUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="239886592"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:56:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 16:56:02 +0300 (EEST)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Radhey Kalra <radheykalra901@gmail.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 3/4] platform/x86: hp-wmi: Skip zero GPU RPM rows for
 fan speed delta
In-Reply-To: <ag8QsXGZziywo0SX@archlinux>
Message-ID: <e977eab9-a578-9946-866d-f96e9da9cf7a@linux.intel.com>
References: <20260521133351.1512718-1-radheykalra901@gmail.com> <20260521133351.1512718-4-radheykalra901@gmail.com> <ag8QsXGZziywo0SX@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, Krishna Chomal wrote:

> On Thu, May 21, 2026 at 07:03:50PM +0530, Radhey Kalra wrote:
> > Some Victus fan tables start with a CPU RPM value while the GPU RPM
> > field is zero. On board 8A3D the first row is cpu=23, gpu=0, noise=25,
> > followed by cpu=24, gpu=22, noise=26.
> > 
> > Derive gpu_delta from the first row that contains a non-zero GPU RPM
> > instead of unconditionally using row 0.
> 
> I agree, this is essential for fan-control to work sensibly. But I just
> want to give Ilpo Jarvinen a quick heads-up because this would likely
> cause conflict with foobisdweik's patch [1], as they would (probably)
> remove gpu_delta in v2 [2]
> 
> [1]:
> https://lore.kernel.org/platform-driver-x86/20260513193916.84673-3-dweikmferris@gmail.com
> [2]: https://lore.kernel.org/platform-driver-x86/ag2DCOGyCt7MBUL6@archlinux

Okay, so we can work on the other parts and postpone the gpu_delta part to 
that other series. It would be nice if Radhey could test with that GPU fan 
patch once the next version of it is posted.


FYI, sashiko seems to find a few potential corner case issues unrelated to 
this series:

https://sashiko.dev/#/patchset/20260521133351.1512718-1-radheykalra901%40gmail.com

(Mainly to make Krishna aware of them but I certainly wouldn't mind if
somebody else has time to tackle them). But please don't take every 
sashiko's (AI) claim as the perfect truth, it just isn't always right.


-- 
 i.

