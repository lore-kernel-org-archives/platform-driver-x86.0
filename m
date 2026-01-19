Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A70531A7E1
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jan 2026 17:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768843022; cv=none; b=pET8tRR5J35MudNAAKQHwsMMs4D/JcJ5s1Ak5PUYXyjBeMafMnA0y7s1byKyBkT37NeatUwi9ZEDKAw8ziKMTU2vZuY0FlRbqbz6AhOLUW7TskmxqmTc2BI4L+bJJP4cug87pVcwoICta1Mr6F5NR2e9I0B+kso79EuSqQKYBD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768843022; c=relaxed/simple;
	bh=850qbRuBbBdaw4ijSQS91DiOznEZRZNKN3AuEuwXUT8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IschVv8oo2W1IyHh5JOsBzkNe0L97F/9/V4XFRZqPIf13w1Mzl9jhwkNmTeK00jp2Q3FHUcgQI4y+tNyIXa2o8QnwEX2nNueT5U3J4XkevG3Jbouz6HAVgGDM7Hpgc7iCA73G0BL0sOzHBj9a0gXvpfyM36yog/gdCN5DjqzuKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mB8f/oGu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mB8f/oGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768843021; x=1800379021;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=850qbRuBbBdaw4ijSQS91DiOznEZRZNKN3AuEuwXUT8=;
  b=mB8f/oGuD+3tFf9Cfwp9CYRlHk8Qa2qFDCQvfkU+6RRMnA9XEDorkAer
   w6loenQkiVaLABOS65uxX+kKnRrE2GDLApdxRxEC2D/FFQH7Ajdoth0Yv
   jlQUg6Wvku0/vGLCSTq2qECvyK7j+I8MOSV0Uek2e14iCsp0mXhw8OOo3
   zoFZiATMVGA8kSo4+DXXxIcNlR8Awt/whczYmYEjYmNtnib5/LcGkUqx8
   JsN72QoE09hDpSZfa42ek8BA4JgCZEiEk3apD372Ja5LlKTN16qQ0qk9J
   S9JADzYj7DO2mwTap6KJ39GT4yXm883jpWGk88wQEuIIS8uoqPYYuIMK6
   g==;
X-CSE-ConnectionGUID: J1RM6jQ+QGqCd6h0h5KT7A==
X-CSE-MsgGUID: lHJMXk0AQaK6YCek5zpJrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69258002"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69258002"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 09:17:01 -0800
X-CSE-ConnectionGUID: 47D97J8wSn6qvvx2OMVfEA==
X-CSE-MsgGUID: 2ldoa+0FSt+/5QohvOIrWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210045508"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.93])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 09:16:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Jan 2026 19:16:55 +0200 (EET)
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc: "hansg@kernel.org" <hansg@kernel.org>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.20-rc1
In-Reply-To: <ffe8dca9514f0ddc1135840644b0986b48972cd0.camel@intel.com>
Message-ID: <ddabf3f0-030d-37bc-4fb2-8fb6169b14d5@linux.intel.com>
References: <ffe8dca9514f0ddc1135840644b0986b48972cd0.camel@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 17 Jan 2026, Pandruvada, Srinivas wrote:

> Hi Ilpo,
> 
> This pull request is based on
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
> for-next
> as of today.
> 
> The following changes since commit
> 8ca7515d3c76a8b629f703ff8301a75f503bcc50:
> 
>   platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
> (2026-01-15 14:27:25 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 6142b726e6e64870ab0c7ffb158bffa141f83bb6:
> 
>   tools/power/x86/intel-speed-select: v1.25 release (2026-01-16
> 16:03:21 -0800)
> 
> ----------------------------------------------------------------
> Khem Raj (1):
>       tools/power/x86/intel-speed-select: Use pkg-config for libnl-3.0
> detection
> 
> Malaya Kumar Rout (1):
>       tools/power/x86/intel-speed-select: Fix file descriptor leak in
> isolate_cpus()
> 
> Srinivas Pandruvada (2):
>       tools/power/x86/intel-speed-select: Allow non root users
>       tools/power/x86/intel-speed-select: v1.25 release
> 
>  tools/power/x86/intel-speed-select/Makefile      |  8 +++++++-
>  tools/power/x86/intel-speed-select/isst-config.c | 43
> ++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 47 insertions(+), 4 deletions(-)

Thanks, pulled into the review-ilpo-next branch.

-- 
 i.

