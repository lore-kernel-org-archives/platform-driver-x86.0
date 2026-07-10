Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3324071E2;
	Fri, 10 Jul 2026 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678894; cv=none; b=GUk/qUoTB5dRaeexYazJQkaeTmXmQWoP+5C5SZgdSiDeOHBuRHQ/xoNBnqFA+wrj8MBlqFsxv0F930o1mR/Q72/giB4GrL9vu3r1G5x+x2YtlM6r4GoXeq8fEOFZtH/32SnDAKPFLJLXTML3p2g8+XmOtStmboarXwmo9u6He18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678894; c=relaxed/simple;
	bh=GPrNpFbiOjVmXmmfvLMOKTrjAc+P7OmoanwObGyOv1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pxl/wMb6s9OTEffZJEVNZBPk6oq+RYfeSEMHsJPyEUEa7KqC2434erBu9hZ1UW5VaoNaJ9podNAGsqzltBqMGkLIcumPws6ESt/hCHXVfdbpJFAd+MJJMYIahYgw9q0s+v/G/AAsUpjhzVdeqirRQlphpr11fIVpGLdFxIH1INM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ii2f7YPy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ii2f7YPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783678893; x=1815214893;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=GPrNpFbiOjVmXmmfvLMOKTrjAc+P7OmoanwObGyOv1c=;
  b=ii2f7YPyapD49+ODx8PDVUyB6ghKYdLRZldYmfSLnPbj7d/wDj2hAQEP
   BBRow8zUvOzee6BcOI5jENGweezG7ZPF+L2g+ARVNfyRqsvBevvNCy06I
   YG6kZrTPCG/caBNKRVSzbkSWAzTS/ZDnN2+Mp8wleg+rG3LbNyRtdobXb
   G2KvIExQro1e2kzhoyvsJ9PBr62VgbSqqV5PahAFkSOwOeOEU8Tv2TBDd
   E4oWCzHyHb/cJG/qJW/o/FoAU5WIMmE2Jp/V2FN6UNm3C85J8fNWJxYWL
   hErFJ6o2LXbD97RiNmx+llJtWi0CTGH4/X5W+MBXWjcGlhiiRb7h1FY6W
   Q==;
X-CSE-ConnectionGUID: U953z0GzQFCTfWwjudmSdQ==
X-CSE-MsgGUID: KUJIWaH2QK2BnbzHOhZ1wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95530336"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95530336"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:21:32 -0700
X-CSE-ConnectionGUID: cCxUB50zQEapca3VQhfCzw==
X-CSE-MsgGUID: Xgfw7jIHSQOJpong9v1knA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278091907"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:21:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>, 
 "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260709-halo-leds-v2-plus-v8-1-b34c64277193@amd.com>
References: <20260709-halo-leds-v2-plus-v8-1-b34c64277193@amd.com>
Subject: Re: [PATCH v8] platform/x86/amd: Introduce Halo Box RGB LED driver
Message-Id: <178367887767.11425.6120037003232674614.b4-ty@b4>
Date: Fri, 10 Jul 2026 13:21:17 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 09 Jul 2026 14:58:18 +0800, Yo-Jung Leo Lin (AMD) wrote:

> The Halo Box features an RGB LED light bar that can be controlled
> through WMI methods to display any color combination.
> 
> The driver exposes the LED through the LED multicolor subsystem,
> allowing userspace to control RGB values via sysfs:
>   /sys/class/leds/amd_halo:multicolor:status/multi_intensity
>   /sys/class/leds/amd_halo:multicolor:status/brightness
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
[1/1] platform/x86/amd: Introduce Halo Box RGB LED driver
      commit: 4ed460ce13710f7f2cf22e0c9e66c7add13c7a53

--
 i.

