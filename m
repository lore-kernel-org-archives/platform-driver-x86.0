Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDFF39C657
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088717; cv=none; b=NfdPGUCIP4srX4r2IZeXdxQ/gIxXHPWJrECajUcHQYKL8NWDKv8VZ0UKNIZh55xvSfvbbE90uk8bNge0YcUyr+KjOUir9CA25n7CGd2FzpC+L4MiNhA0K5SXoAoorlZeG9zX4SBrLaL3MKPfb7Ls7YWEzqYQszv9v4Zs0GZSK8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088717; c=relaxed/simple;
	bh=wxqd7mruE8hJcC8pDWaNObPDI+BJiyAUXhG0jZDx9RY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RUndcgfyeAR1bCE+7ltWa+bPM6fk2PvSfQhNtcdim+eUjHrfxS1jQhMcoS1RMN5vqaFEvafGr25e8AxNUXNdZIOy3NHFANtmFq3YPj24WzsiW/oFfExkSdZH9G8yVgm1+MpYea9Asfs8rr9Ru1yoUcMK9a535EoIEK4OgFZt4fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fj6I0VwX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fj6I0VwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781088716; x=1812624716;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wxqd7mruE8hJcC8pDWaNObPDI+BJiyAUXhG0jZDx9RY=;
  b=Fj6I0VwXByPRpSwHVCymWztuN4EIssfI+Y8exe6CWuMamEfc6KxG9+j4
   7M0lGtMhnGQng6JluO80/rqEELxfB8Z+Cpb9RSTy3VnngeoWdqd6WQp93
   oFnN5UIVfF/kh12/VfK7urWZbeBwWYUp0sq8CnBpx4NfDZIYGgkvwcdQs
   I5mAaAx5Pq9boibm6SI5eoQ3YO/nyKyN++LSSuV+Q/JaOnP9NCpUPAd6t
   MY6P9EJsCz8vfWCsqvth63slqlCApaDDbmVAOEjWJN02SMfaByVU1cJLq
   SjVUG+dL+JmCP1QAAYTP70GzdzxMfqUCqtjgF1RiT2Bo3fpqmCu/dqV6K
   w==;
X-CSE-ConnectionGUID: kxpVjPfWToui6RWJ1tGy4A==
X-CSE-MsgGUID: MZbuvtatQoyZkh4j0BxfOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84447103"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="84447103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:51:56 -0700
X-CSE-ConnectionGUID: lOQLDlOWTHO0QzR8hGM5Zg==
X-CSE-MsgGUID: u7jm+ZZoT0y3hQQBKKzG4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246168149"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:51:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 13:51:50 +0300 (EEST)
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc: "hansg@kernel.org" <hansg@kernel.org>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 7.2-rc1
In-Reply-To: <d155101fd07aacec65d0168f50df8327f3bc3f34.camel@intel.com>
Message-ID: <a9153763-32e1-f6e8-8d19-2cd1afba37ca@linux.intel.com>
References: <d155101fd07aacec65d0168f50df8327f3bc3f34.camel@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Jun 2026, Pandruvada, Srinivas wrote:

> This pull request is based on
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
> for-next
> 
> as of today
> 
> The following changes since commit
> a167ae8eace52dd6c80438b77d92450fe12cd4be:
> 
>   platform/surface: SAM: Add support for Surface Pro 12in (2026-05-28
> 16:40:39 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 607af438e6430893a822964c841a1994b33acccc:
> 
>   tools/power/x86/intel-speed-select: Harden daemon pidfile open (2026-
> 06-02 10:39:45 -0700)
> 
> ----------------------------------------------------------------
> Ali Ahmet MEMIS (1):
>       tools/power/x86/intel-speed-select: Harden daemon pidfile open
> 
>  tools/power/x86/intel-speed-select/isst-daemon.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Pulled to the review-ilpo-next branch. Thank you.

-- 
 i.

