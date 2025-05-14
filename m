Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A187274672
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 May 2025 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227761; cv=none; b=OlSYFyFy3KFgw3ksw25noDW27yyKn1JOF0NyWkW5OORCm/cxctcIv6OSeNWFRCykkYVuDUH8EndgHc1a83hupZxCynnLTId3iqLP4lUOojx1lV99P4h12KJSwMM4KW4IXd/RZSGqAgJIS1r543ld+CDjfDQGbWEp2EhO1cIdCTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227761; c=relaxed/simple;
	bh=ncA3q3Xi5r3iQe5/b6bYr7W3Fgq+klqnmqS6aCXE7I4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BU1McFzHbLb/OyxPTieH9HuopmybwuGFLGW3I4mt62u/Z6HMULJsNUDAJyGh+Cw2MF37ot4d3Ik/PcABt63C3jw2Gm+VmRYajYZjn3P1NB2jvFVF2JayrHxYpKNvyQvHiVa30P0yWsYC3dzfXiqUwA6xSqBM/2V8ETXWzGoK5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMYGejJE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMYGejJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747227759; x=1778763759;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ncA3q3Xi5r3iQe5/b6bYr7W3Fgq+klqnmqS6aCXE7I4=;
  b=RMYGejJEjw0OGB4TqBDJTka+bbuAdEMfzjrlvXg8buZN7RdulLC6Qy4c
   ff7W5GKihU7VaKK7IGw0hWAcR9DdmKOcVGGUaOp2+Al+ds97skYdcmJ42
   LyWAwW4qLiBn+IiuFHjHP2S0DhU4KfvLGPwJArPuwy+Tt/tvtdFk2X2uV
   3AkFvDK5mnveFafjoO8TdpdTjAZZWwC/CY8HAq//DSke1pAV2x1+PIFgm
   IGw28Y2f7SWmna+MwNBBPMtx6Psnl/srPt0BzYMa4freLFo95J7dk4Mdx
   ++rq7gt3cMQV0hic+ou9P9Gu5FRIepM14Fl0kai6eIyzsDlOF+SufqchY
   w==;
X-CSE-ConnectionGUID: UCMY/DIaRhyJpMCfN+VKdA==
X-CSE-MsgGUID: QS8nku46TMa21UNVmTsZjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59780567"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="59780567"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 06:02:35 -0700
X-CSE-ConnectionGUID: Bcto/hFwT8CQxYl/H0kLjw==
X-CSE-MsgGUID: 7OpC2mAdQmeVdizlGHQIcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="168975086"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.231])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 06:02:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 May 2025 16:02:27 +0300 (EEST)
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc: "hdegoede@redhat.com" <hdegoede@redhat.com>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.16-rc1
In-Reply-To: <f3f874fd1a505396ded7fc35856dd3386e44d0a6.camel@intel.com>
Message-ID: <9a395011-090a-3b8b-ee78-fe33a7d06951@linux.intel.com>
References: <f3f874fd1a505396ded7fc35856dd3386e44d0a6.camel@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 May 2025, Pandruvada, Srinivas wrote:

> Hi Hans and Ilpo,
> 
> This pull request is based on
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
> review-ilpo-next
>
> This has changes for SST-PP revision 2 support and uncore frequency
> update for new generations of CPUs.
> 
> The following changes since commit
> 83579675331059689e2869bf752ca9e17fadbd82:
> 
>   platform/x86: portwell-ec: Add GPIO and WDT driver for Portwell EC
> (2025-05-08 17:37:58 +0300)

Thanks Srinivas,

I've applied these now.

In the future, preferrably please try to base PRs on the for-next branch 
as review-ilpo-next is quite volatile an I do rewrite commits there on 
relatively low bar. When you base something on review-ilpo-next, you 
effectively end up tying my hands to keep those commits in 
review-ilpo-next (or the PR needs to be rebased/respun).

-- 
 i.

> 
> are available in the Git repository at: 
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 6dfe26cb1c290fa4b62e6fb8c05209fe5f7adb76:
> 
>   tools/power/x86/intel-speed-select: v1.23 release (2025-05-09
> 11:12:31 -0700)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (3):
>       tools/power/x86/intel-speed-select: Support SST PP revision 2
> fields
>       tools/power/x86/intel-speed-select: Skip uncore frequency update
>       tools/power/x86/intel-speed-select: v1.23 release
> 
>  tools/power/x86/intel-speed-select/isst-config.c    | 15
> +++++++++++++--
>  tools/power/x86/intel-speed-select/isst-core-tpmi.c | 12 ++++++++++++
>  tools/power/x86/intel-speed-select/isst-display.c   | 20
> ++++++++++++++++++++
>  tools/power/x86/intel-speed-select/isst.h           |  3 +++
>  4 files changed, 48 insertions(+), 2 deletions(-)
> 
> Thanks,
> Srinivas
> 
> 
