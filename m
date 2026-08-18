Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB947798B;
	Tue, 18 Aug 2026 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062069; cv=none; b=In+G+Af16ne4yyUCUH2ejqi5zxdz5NSrHKhhFoqVT4XpYsUsyi+MjVC8iVu/ATuKc8aGymOPdzQId1dyufM0rXzMyeKU6MFesj5i0z897SlF9tRsscWMEU0gg0238ekj3niloJCP5987kP8RxA2S2lTUESTXkPDpEyCKXWJSjAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062069; c=relaxed/simple;
	bh=LBN+AyXCdMrHAGw8+N6nyUdotw/43OhTr6UbenPhmf0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AdKPuCDCoGzp5GP/f8l9GXUuw6Ma6YsXfx7RqqrP1OIQPvXk9p0QBll/pxF7yC1f9RRvE99fSZc4i0FrsKOcQxhv0EKS31U4ukRwC8j9+JzGExJ68ZBYXQ4WgCqcN9VebvmnJ8rRGgkR7O4Q5+oT3V4THFtWIVQejg/KN/yzsA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiqyryYV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiqyryYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062067; x=1818598067;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=LBN+AyXCdMrHAGw8+N6nyUdotw/43OhTr6UbenPhmf0=;
  b=eiqyryYVWv0V3FbiHju8B1gBH6AtlTiNaeSjCTLQ6kfOBGaB+WcrJ34c
   NuPv1uwf94XAnVTtUH6VbNiuD8jeJUz6DhxUdvy7wOoNTaI7cSiHYbiPJ
   aIX3gPcyOMqB3ch05sqf6rKUuKxpVePuQyQURaSekCCEay31zqz6PwSG+
   NlxGFXU8nRiM+w2B4XR+E9cYLVoEnt7XPmt8nG7Mk0Csb/ezJlDOOS+Iv
   +UyJOO3ZZHe+jMioHBhe4UHqfuelgZH7CL1oDKDVa74WbubmOkA9BP+EV
   CdQTlTACrQSKZuqJz9i4XWA4WOEEDAcAJQLGPOu96IKjT+jGWKsGR9cjy
   Q==;
X-CSE-ConnectionGUID: L6jfOvltSpe3ceIZxi4o9Q==
X-CSE-MsgGUID: UDuQ1DZXQ1ae4OLwUy6Kvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98917751"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98917751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:07:47 -0700
X-CSE-ConnectionGUID: DlHMfPEPSWGzL4g208AUwg==
X-CSE-MsgGUID: gbbT/I3OSL6vAEUo7jWZIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="262609813"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:07:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sammiee5311@gmail.com
In-Reply-To: <20260811221514.3905817-1-srinivas.pandruvada@linux.intel.com>
References: <20260811221514.3905817-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 0/6] platform/x86: ISST: Validate inputs
Message-Id: <178706206091.20251.9244117681260659535.b4-ty@b4>
Date: Tue, 18 Aug 2026 17:07:40 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 11 Aug 2026 15:15:08 -0700, Srinivas Pandruvada wrote:

> This series add all remaining parameter validation in addition to:
> [PATCH 0/2] platform/x86: ISST: Two ioctl input validation fixes
> from HyeongJun An.
> 
> These patches are dependent on this series.
> 
> Similar validation is already done in intel-speed-select tool.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/6] platform/x86: ISST: Validate logical CPU id and clos id
      commit: 437757f6acab26132e270e19110bfa79cbc78b22
[2/6] platform/x86: ISST: Validate max level for set feature
      commit: 63125701c0a525136dc0de1348dbe60ba61fed51
[3/6] platform/x86: ISST: Validate parameter for core power state
      commit: 00eec6df54d7b578d1479269e3f508b8fa3476bd
[4/6] platform/x86: ISST: Validate parameter for frequency and priority
      commit: 6363938b116e5a9f74b76bbf8d9dbb1ad2f7b0cb
[5/6] platform/x86: ISST: Use PP level enable mask
      commit: 7a0033bc39349a6b82050672a8a0928b02395b32
[6/6] platform/x86: ISST: Just allow 2 bits for SST feature enable
      commit: 7bbf743c43cc4e1145b9a578815e025d5df5813e

--
 i.

