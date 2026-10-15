Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29653B613;
	Thu, 15 Oct 2026 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074557; cv=none; b=WcTTyy6DllRq+AsxGdc8z0oHvDdcofkdGNdpzALjR5pPiZCBnwMG2rM//E7RpfvGCky0mDQE+7qVpp+7n3/tRumo+PjJ/U1ngD7rqkk0Fey6X+u/YRAcm57N4574vXvq4X7ImC55w1YZ+2a5T2O6xw7WvvEUQmzZV8p+x59+Sao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074557; c=relaxed/simple;
	bh=xCv4ojpgNHwC+iuQQbs7roEEOqCfSh0kmXeV9N+dO+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IlKBn+zfO/V5SeF+9W51be4gXi3oiEh10GA3vwgF3Gfn4S2e7XGd8tDs0Gh7dTmK+cnE8ecieuzxcmWiDrlB64R8ULW85E+ysB80cNhjyBnmzi0t9grQNiQnRQ3hmjOBuqm6Huc2ecuTaNmA6rv/HuneVjdPNBs3FxYx9T3kTqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0Oi/MpV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0Oi/MpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792074556; x=1823610556;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=xCv4ojpgNHwC+iuQQbs7roEEOqCfSh0kmXeV9N+dO+0=;
  b=i0Oi/MpV0d4Bwlvm3ORcy6bzGy0twRZ0DoTkH4SskZZEkvzzROoOQp+/
   65qlvS2BuEDNvDpDMn+1YnyjybO8LENqozdW5IdLZh0K+ubi6zrIgOWa5
   eSpR2UVdHIi57RZ+7sPsKvJrjJ84eQjtDfMd8WXd1+LJ9J8l8XjqmvqF2
   9HP3gUwUsxeRQZskffQbh7s25X2PBQSWkDt6HZlsmArPqJWwiVuHRRb3n
   VnMkozvdWFpwqq1DerimWIdRGYdT6Tmr5zRSSZ1WZ/ncKBY+w2l4o78YX
   8gmUc1sFKgQdZDKGN1wsNmtqiaw+SHah4+d3wcIyESOlr2kuD4+MKzmhP
   A==;
X-CSE-ConnectionGUID: 4ld67Gh8Tq+XTctxexNJUw==
X-CSE-MsgGUID: VTsq9nURQUikypBLff071w==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="730437"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="730437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:29:15 -0700
X-CSE-ConnectionGUID: dMWRec0yS0CXUNrccFJd0Q==
X-CSE-MsgGUID: lRGK2zMOQWWEuRtbyvR/tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2063859"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:29:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Huang Wei <huangwei@kylinos.cn>
Cc: mpearson-lenovo@squebb.ca, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261013070740.789934-1-huangwei@kylinos.cn>
References: <20261013070740.789934-1-huangwei@kylinos.cn>
Subject: Re: [PATCH] Revert "platform/x86: thinkpad_acpi: Add X9-14 Gen 1
 to non-standard thermal/fan quirk tables"
Message-Id: <179207454953.13793.3730037660068238393.b4-ty@b4>
Date: Thu, 15 Oct 2026 17:29:09 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 13 Oct 2026 15:07:40 +0800, Huang Wei wrote:

> This reverts commit bb0f3a5d6b9844b70ad696b9470762028f6d86ec.
> 
> Lenovo's firmware team has verified that the X9-14 Gen 1 uses EC
> register offsets that are unique to this platform, rather than the
> shared non-standard ECFW layout of the models already covered by the
> quirk tables. Applying the generic quirk would make the driver read
> the wrong registers and report bogus temperatures. Lenovo is working
> on the correct solution based on an updated EC register specification.
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
[1/1] Revert "platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard thermal/fan quirk tables"
      commit: 8667bd30fd033295b3038ce374c551d1059538ba

--
 i.

