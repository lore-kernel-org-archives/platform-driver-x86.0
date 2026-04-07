Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BD13A75AA
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556989; cv=none; b=K7vzNPCNC/6Gvv68Pz5l1RGPOnM8GBVd0Ti+Wm/fwrQHjDyyaDAIO0+TccuGgzB4FQZZrkFrIBY7H1UZeB/AJWFc4kmFOyokE02ePa8ns4qNS1T3r14RuMa6q5Y8cmYE13CSpt75NYWiQI2lRx9hpUawoCUG1WF74AlGAlplCSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556989; c=relaxed/simple;
	bh=PVDtUCyByFfXr1QC6rzmOKBig7jRYBdu8BXT8oraV1k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tfCaXKw4/v7RyvP/OmffE7TdX6G3Y+1BIq1f8hKzNyhSbSuI3jADY+zX4RmJQ8P4/YR36fK1RGVD6eYyyqLPpQpybkXUhI5MyygKO/82rkJWV0bl8NXcDhx/cdk3NrevyyZRpUTuIgFlyGYntT9NqNyAkvZ5442o8exOlz/m+SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHslVwIL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHslVwIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775556988; x=1807092988;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PVDtUCyByFfXr1QC6rzmOKBig7jRYBdu8BXT8oraV1k=;
  b=bHslVwILLaSHMWtATVuTCTNYInfSqlIKRnOMHfRfvsKsZIOefEZnSY9s
   DxARaRGKcos0J0ypB+uE22tiowCht9FTLYJ3QwVynnALJ5v1pkMrPJutt
   rkDVjRIiH+cGNwAqekzJi4x65vTXWqITnzshqZHAzQxsqDmsnoa5yngWm
   mCwz9K4MDGZxpetMrhMjuUFVUkUBqPjvQZPs8lYPUl6NCvWW8Z6PVbogw
   k+uNFkLzKHLIIUgC2cxgmlwh7/dOEJ3UxJtp7HJ4imsx5o5c/VglnDmxX
   m/upVyKwwz6tEwnwvJBBDOxtF+47MEJCQ06SSMG+EXG5PX0X8xS3wVIfp
   A==;
X-CSE-ConnectionGUID: oz+bPAHZSMGjKZgliN/ZFA==
X-CSE-MsgGUID: qZF6nfU+QGiw7hu8bJLbVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76706394"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76706394"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 03:16:28 -0700
X-CSE-ConnectionGUID: /P9In6zASmWafSpO98fycg==
X-CSE-MsgGUID: X3MK7ntgQtun3FJmkFaJ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="224940668"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 03:16:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 13:16:22 +0300 (EEST)
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc: "hansg@kernel.org" <hansg@kernel.org>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 7.1-rc1
In-Reply-To: <0b288f7a7024f896a1699ac3609c7da39c588d03.camel@intel.com>
Message-ID: <afc67127-2a3e-4f6b-78e3-54d392bca6d7@linux.intel.com>
References: <0b288f7a7024f896a1699ac3609c7da39c588d03.camel@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 5 Apr 2026, Pandruvada, Srinivas wrote:

> Hi Ilpo,
> 
> This pull request is based on
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
> for-next
> as of today
> 
> 
> The following changes since commit
> 8e0a2fc68ec369f2b6755994da1d318d0898a9d9:
> 
>   platform/x86/intel/tpmi: Use 32 bit aligned address for debugfs mem
> write (2026-03-31 18:45:11 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> ee69d9e32bdb0044b9444f1ae12107ff8b5ff95f:
> 
>   tools/power/x86/intel-speed-select: v1.26 release (2026-04-05
> 11:54:25 -0700)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (2):
>       tools/power/x86/intel-speed-select: Avoid current base freq as
> maximum
>       tools/power/x86/intel-speed-select: v1.26 release
> 
> Zhang Rui (4):
>       tools/power/x86/intel-speed-select: Fix cpu extended family ID
> decoding
>       tools/power/x86/intel-speed-select: Fix some program return value
>       tools/power/x86/intel-speed-select: Print Version info when
> Incompatible API version is detected
>       tools/power/x86/intel-speed-select: Fix output when running on
> unsupported CLX platforms
> 
>  tools/power/x86/intel-speed-select/isst-config.c | 41
> ++++++++++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 17 deletions(-)
> 
> Thanks,
> Srinivas
> 

Pulled to the review-ilpo-next branch. Thanks.

-- 
 i.

