Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25653349AE6
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Dec 2025 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764874494; cv=none; b=Rux3ZNG9i49iXnM+q1/RVEyrZN0544XvZ14e9C13d7J4kC3OTAmQc2lvpz9sQwSZSm5YnWeOjxeZ2AUfgQUrb4DiioK6ILR6NYTCAFNHVfmlS4WEi+EXYIJOlhgb30klBWIynGpbS6/hA3GR9Bj7mwsaG76iOCrZnvQCrcyLMpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764874494; c=relaxed/simple;
	bh=mSg6xWzvNF457W5U5atzHiN6zduwTYNL3IR6fIDg+xk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=vFszc+2H7qmidnEdlmuRl2EJak6fK6tiAdKA9AB8FhIXl+EBqXPYx1QobTRFv9bm5blYT0jX6v1BMp1zDdNzdSwfDKnRc+g0xG2p23Y4YuFoiHfuRx+VKkhOSrHTdVw8KFz+tzOqJPGT1GfSEXycytTNqxioPME+uOX8ktsRn1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCvN+vCw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCvN+vCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764874491; x=1796410491;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mSg6xWzvNF457W5U5atzHiN6zduwTYNL3IR6fIDg+xk=;
  b=ZCvN+vCw1xVRVq0e12BNi9oLdAcaS35cEFg/e1oXfI2B+88qrqi0WpiA
   JCJ+DXQKp47REu149gnnmuED7+dUAsC/6AsnfhaK4OMIOHgAAZm+H04MF
   mIoJLIsvhKy6hIidzJdVpGH27QoP4xJZIeMnlIDUmwEwIxSvpOBvQzlys
   0+dnrqwm9dAw0GODJ0KtrWi/93sxKi6AeGpkgPGqs3/hHUEi0eb4iblVd
   GCGH0peWaRzkMfiKafzp6flzVgAsZezPQgRQ6r9+rRPGtYwhBHaaYK2v4
   bbnX7Ajvkb7O7T+iXbMf6uTDpYHiN/5YvHQRWOPp4JwjdBnHs5btsknr4
   w==;
X-CSE-ConnectionGUID: 4rWVGrm/TvKwu2SY8+vE7g==
X-CSE-MsgGUID: oiZl8j7hQeupRjGA1uLtQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78015808"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="78015808"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 10:54:51 -0800
X-CSE-ConnectionGUID: ee58VAG7TM2FRqOWE6uDTA==
X-CSE-MsgGUID: Wzfjk1PGQeiFDM9PofiHjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="200190914"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 10:54:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 4 Dec 2025 20:54:47 +0200 (EET)
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc: "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.19-rc1
In-Reply-To: <29f01076610a5467ea64101f1bf7a4c0663e109f.camel@intel.com>
Message-ID: <51880d52-3c37-0447-1c71-8a745990e086@linux.intel.com>
References: <29f01076610a5467ea64101f1bf7a4c0663e109f.camel@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Dec 2025, Pandruvada, Srinivas wrote:

> Hi Ilpo,
> 
> This pull request is based on
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
> for-next
> 
> as of today.
> 
> 
> The following changes since commit
> c36f9d7b2869a003a2f7d6ff2c6bac9e62fd7d68:
> 
>   fs/nls: Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()
> (2025-12-01 11:58:06 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> ad374eb9b33fc4738f21e57658073a04f77d493d:
> 
>   tools/power/x86/intel-speed-select: v1.24 release (2025-12-03
> 08:29:13 -0800)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (3):
>       tools/power/x86/intel-speed-select: Check feature status
>       tools/power/x86/intel-speed-select: Reset isst_turbo_freq_info
> for invalid buckets
>       tools/power/x86/intel-speed-select: v1.24 release
> 
>  tools/power/x86/intel-speed-select/isst-config.c    |  2 +-
>  tools/power/x86/intel-speed-select/isst-core-tpmi.c | 46
> ++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 45 insertions(+), 3 deletions(-)

I've now pulled this.

This one appears correctly also in the patchwork but for some reason the 
earlier PR didn't end up into there at all which made it more likely to be 
missed. I don't know why there's difference.

-- 
 i.

