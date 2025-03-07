Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B8C23959A
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Mar 2025 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364302; cv=none; b=gw0GuexKucUgi0NSQ6s+vFIxnFNYSZS/UmpaDkTxgBN05KQwuDnTjByDiRY7N0eNhAZVZH74Pa8fsPNuBxd4F6BNEPt4hDmQSriNZgLdJnug/SIVCxdkzBSDSZK6MwkO62bD1lSlvGI0h77+AFGs3jHqXt9M5vzD7owz+jRK+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364302; c=relaxed/simple;
	bh=k+cZWqbdC7DJIHFF59DQ6dsW/OFWV4Eud6+0NlH2vAs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XHq5TciKD0R/1SQx9NFQQaRPOcq9CXgDvoZL5WVLaSvVbUbvb/KVRUovzhhzN0SmYH3FMl8JMs4aHof/r///xA2g6leJlUD97gS/sdMSaDW3Y7MHQTPrltkVD2zeuiH1hvXs91iM7Xjr8sntbipOG6Cglo2g0Ygc61TJIL2zRDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8EvC9NV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8EvC9NV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741364301; x=1772900301;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=k+cZWqbdC7DJIHFF59DQ6dsW/OFWV4Eud6+0NlH2vAs=;
  b=F8EvC9NVF+ZcYEfZ4JzVwdvWImbQN2lkcQeYulgYUBYZR5WiRFpp6X8i
   rMf2PymLSJAr1Ub7M9qVyyHUdnZNBYJLlM12M1sQvXCw7FJXsw/mI8QHp
   A+qwgrJ2COHv8PehElyqDdd6fPjw+SuWp6JAJQYxxvPHxfyMBeyBmKyDa
   OQoKBNGjVo4+APyp67sBAzV3mQuMOxCGIAkhl5gHt49mMnIBcgeMPrmtj
   ZAk1Ylzgkq28m6VTuWMCgE8LfW+mTYorFOln/QIYFr87NsoVWC63oypr/
   VtKZ4yD1rwBecPUCcMLcuzqPCJs6b+UqoI238VinZuLmbmWqKF0yBboqq
   Q==;
X-CSE-ConnectionGUID: BokDJIC1SbqVY2wNQJAKdQ==
X-CSE-MsgGUID: UmpvhoZQQ524iZSzwNrvHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53058489"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="53058489"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:18:20 -0800
X-CSE-ConnectionGUID: 0I/7QaftRMOxSgH8FMtabA==
X-CSE-MsgGUID: Vj4oADTJRXSqGPcoji2hHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119354234"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.120])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:18:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 7 Mar 2025 18:18:14 +0200 (EET)
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc: "hdegoede@redhat.com" <hdegoede@redhat.com>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request-2
 for 6.15-rc1
In-Reply-To: <41729ee0b6b11a5d2f3b18a20343c1ceace86dc8.camel@intel.com>
Message-ID: <c8b6b798-300f-60eb-c238-ade4da8cc18b@linux.intel.com>
References: <41729ee0b6b11a5d2f3b18a20343c1ceace86dc8.camel@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Mar 2025, Pandruvada, Srinivas wrote:

> Hi Hans and Ilpo,
> 
> This pull request is based on
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
> review-ilpo-next
> 
> This replaces the previous pull request.
> https://patchwork.kernel.org/project/platform-driver-x86/patch/e884b4d403a650139080366b4b9f7c9d4be78efd.camel@intel.com/
> 
> This pull has fixes for display of die IDs in a single/multi-die system
> after the changes for die_id sysfs from kernel version 6.9 and cross
> compiler build warning.
> 
> The following changes since commit
> 6ad1b2dc0f2a76b23a31fc7a52ed4ec06e4344a3:
> 
>   platform/x86/amd/pmc: Use managed APIs for mutex (2025-03-07 12:17:51
> +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 7dd556365b0ccba1f3c581f4c4747ad88497f496:
> 
>   tools/power/x86/intel-speed-select: v1.22 release (2025-03-07
> 08:00:21 -0800)

Thanks, now pulled.

-- 
 i.

> ----------------------------------------------------------------
> Khem Raj (1):
>       tools/power/x86/intel-speed-select: Prefix header search path
> with sysroot
> 
> Srinivas Pandruvada (4):
>       tools/power/x86/intel-speed-select: Prevent increasing
> MAX_DIE_PER_PACKAGE
>       tools/power/x86/intel-speed-select: Fix the condition to check
> multi die system
>       tools/power/x86/intel-speed-select: Die ID for IO dies
>       tools/power/x86/intel-speed-select: v1.22 release
> 
>  tools/power/x86/intel-speed-select/Makefile       |  2 +-
>  tools/power/x86/intel-speed-select/isst-config.c  | 22
> +++++++++++++++-------
>  tools/power/x86/intel-speed-select/isst-display.c | 11 +++++++++--
>  3 files changed, 25 insertions(+), 10 deletions(-)
> 
> Thanks,
> Srinivas
> 
> 
> 
> 
