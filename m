Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8EB2F2914;
	Mon,  5 Oct 2026 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226330; cv=none; b=DwrONUUqHD+P9JYJODJR5hJG2Jyh0Hvn4W4ILBBlLLCmCxRjjIi6/G03BnRds0PcZtYKYdCiHDXSi1oINfwdnFv8qFjJ/OEAbHMHfKlrsBtJcWIZX59QdGXpraWpNVZB6mvPdnyu+Jq+UGJhvOL7I9MdIVo1gKaCGA7Vo0Q+24g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226330; c=relaxed/simple;
	bh=FH+aeuDp8NdKZ9JBbfqbQJgik5kfQOC/+xAiDlvlp6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KNTVCrFCMNvM8i04x5K1hSRrh1osPw7hNNlercQKx3tW40ZEynX4GRVkGMx8ubniTrPZjGnkGSAWH5EYD/Xlb7q1DPOQAehLGlZbCNgRoATxQlz47opzAzcf7TD0EYkiD7qoluy14Sae6gJGVIGtDJbO5kL28P3vbpU2Vila+ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoXPAdqh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoXPAdqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791226329; x=1822762329;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=FH+aeuDp8NdKZ9JBbfqbQJgik5kfQOC/+xAiDlvlp6c=;
  b=OoXPAdqhEkm5C0AwjW/hFnN39DUCaz8AMeXamsOoceZR//7z8jdl3WGW
   LCI7xJ0qxLA4JbkQCkio5B3xpict+zLl73/hTOM3z1oZEAU+eutkbfoXO
   TgSF+2WDTSYPTbq9dDuijCJ6O7lzx8U+WD5IFYCUgiVM+Hoe8vI6zBTwz
   Ssl6UN1/Q+qKCIvMoPR9MTvgAyceQCuRy82NrElvv+0Gl+wmgGOXTma+7
   UFVFHrR6J+cxAjBVfgXxFMPaL7f2m/LewNiXeB2uRe7m4rdswjnknDRSw
   n036wdqlNf6F3o5d1htamV62F89bM2BA/9qDEEw/R5h3oWYil/tYjQrG5
   Q==;
X-CSE-ConnectionGUID: 2SISAcKkQ5yWzGNnLz/djg==
X-CSE-MsgGUID: Ip91bIyQTmu4DvEJIuLmiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102484875"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="102484875"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:07 -0700
X-CSE-ConnectionGUID: LV4/iba/SMycGmnz/sn5+w==
X-CSE-MsgGUID: r5Lus3iKTlCIWwKoK/0cSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276416128"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hansg@kernel.org>, Nitin Joshi <nitjoshi@gmail.com>, 
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
In-Reply-To: <20260929-thinkpad-acpi-cleanup-v2-0-88e176953a4b@gmail.com>
References: <20260929-thinkpad-acpi-cleanup-v2-0-88e176953a4b@gmail.com>
Subject: Re: [PATCH v2 0/2] platform/x86: thinkpad_acpi: cleanup
 conversions
Message-Id: <179122631942.41716.8252463604518187809.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:51:59 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 29 Sep 2026 21:59:09 -0700, Dmitry Torokhov wrote:

> This series converts thinkpad_acpi resource management to use helpers
> from linux/cleanup.h:
> - Convert conditional mutex lock calls to ACQUIRE() and ACQUIRE_ERR()
> - Use __free(kfree) for local pointer allocations
> 
> Changes in v2:
> - Dropped patch 1 ("convert mutex_lock() to guard(mutex)") as it was
>   already applied upstream.
> - Preserved 0 return value on failure in brightness_get().
> - Fixed auxmac_init() to avoid setting auxmac to "unavailable" before
>   evaluating the MACA ACPI method.
> - Collected Reviewed-by and Tested-by trailers.
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
[1/2] platform/x86: thinkpad_acpi: convert conditional mutex locks to ACQUIRE_ERR()
      commit: 86cab001301c4c65e6763282ca9a477dc1fc4e72
[2/2] platform/x86: thinkpad_acpi: use __free(kfree) for automatic cleanup
      commit: 40da5fbf461e4cefa45aa259b0771449597d3135

--
 i.

