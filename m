Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23E10A1C
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jul 2024 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720425793; cv=none; b=kWRTCWH4K/qpJHwmRR+Qi5X8VWrAuqnJ+LWayraInh/I9eclMnrQ6w5mOXOSznRfbzHXYTMF31b25FDkroD8Luk7cARHvRFO/y4qt1Hw+srN9qqHMO2WDRWvD7ou1GvMspjWdpgT+PaLK3pH/13ZI6bscaonGqB5mExl916HtYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720425793; c=relaxed/simple;
	bh=4cne2lt4t1jIzX97DGRqn7knGV8jGcAuCADTlKeJtvo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=f0+F56gu3Wx4C/gXz54DSji1Y3jm0EasT4tldS2Chf/CUGjAVIlOgQ2T18bNw+u4qE+4FG9HFj6E+SYkWhSSeWvKJAvAYw8Fw/Q0DxSycyrq3UplCHIIoOWXb5MjVjkzX6kkN1J9faa2WQYVGHvJ+/9d44jvBneomfsMmu/pm28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8uN8ruP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8uN8ruP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720425792; x=1751961792;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4cne2lt4t1jIzX97DGRqn7knGV8jGcAuCADTlKeJtvo=;
  b=X8uN8ruPCxTsnMEKouprjbXTUxjmLbGE6OyONZb8ccTPzvvvxuG0nbH5
   7OGQi249Gw1wbbsqKDzFfCklJ3dwW7e+WJNnDRiSpMrJqoSMmDRB9cZve
   PLbQHUZ1+P5PL1AmMPUHusdlT+i/JORZYtXR4CfFE0ZmU/cqA1311mLBQ
   A2tocFc6xDji3rditqxyizoAck5H4qqPrhbcGRALklRzaQax74gR5Gtzr
   LWKUzf+TOBVREwvJztS4qOR7TfEZc1CeHMNqTFaFDzDgMWpBCCZeTDuRd
   p9kXQ4WDujjADwzDkotxKk5U267UNAIzhN9Y24A0lQFodcYa5oUYJzGYV
   Q==;
X-CSE-ConnectionGUID: JJMDPuS2QwiWm/rvtRUGyw==
X-CSE-MsgGUID: kZQ2AYP3SuG6gZ3OdV+MwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17254076"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="17254076"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 01:03:11 -0700
X-CSE-ConnectionGUID: utY94MhJR5+Ohdzz63mEMQ==
X-CSE-MsgGUID: VuVe8gnRRVWiKqs8rQp6uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="52254565"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.115])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 01:03:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jul 2024 11:03:03 +0300 (EEST)
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc: "hdegoede@redhat.com" <hdegoede@redhat.com>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.11-rc1
In-Reply-To: <0aff117b7688cc4c844773600813600b7e58af6b.camel@intel.com>
Message-ID: <22c13bbe-a615-b6a4-b379-e3abdfa4607f@linux.intel.com>
References: <0aff117b7688cc4c844773600813600b7e58af6b.camel@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 7 Jul 2024, Pandruvada, Srinivas wrote:

> Hi Hans/Ilpo,
> 
> One issue was found in last 2 days, which requires update to intel-
> speed-select tool.
>  
> Pull request for Intel Speed Select version v1.20
> Summary of change:
> - Fix setting of TRL MSR after SST-TF is disabled in auto mode. Use
> correct units.
> 
> The base branch for these changes
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> branch: for-next
> 
> The following changes since commit
> cf25477c52123fd18373ea43336e44185f4744c0:
> 
>   Merge branch 'pdx86/platform-drivers-x86-lenovo-c630' into review-
> ilpo (2024-07-06 11:40:29 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 5631717d3ccb569783ccf7e35e478f59f423f90f:
> 
>   tools/power/x86/intel-speed-select: v1.20 release (2024-07-07
> 00:10:36 -0700)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (2):
>       tools/power/x86/intel-speed-select: Set TRL MSR in 100MHz units
>       tools/power/x86/intel-speed-select: v1.20 release
> 
>  tools/power/x86/intel-speed-select/isst-config.c | 2 +-
>  tools/power/x86/intel-speed-select/isst-core.c   | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)

Pulled to review-ilpo branch. Thanks.

-- 
 i.

