Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE411C5496;
	Fri, 20 Dec 2024 11:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694103; cv=none; b=RpXBs5v8KR8xM9GesGizKit0TY5IcCt/G4a2iH9MCFnULVkoUnA5+IX/QZ1/Z+1k5dGvZECBZnYdrXYi9JBfgwwnKyagjlfFcltregEXhFeedhpMSkGLRL9F5yjcw7f6zHVCT2yMQYU+lX8R5z0va56ub+oudv4scL/MLMvnPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694103; c=relaxed/simple;
	bh=5MsnSsET0edgLhFavXks5WFqDDaUgqWQIIz6aq0Aw1o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kbtnGWDZpNlVQRViprMBDPVNFIcd6LC9unkv/KLfy8Pb+3p6lVSr2R2XA+w9XXbFjWbEgGzNrts0k41PJNVYaDygkbc+yt7FWYlDyvAFCjCH1SdBlhr1hG7a91/hMJvJ3WoiYwyaQbxOZoghAXTn6V5jIYg2fnnHadri3NIN9vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arxJVh9O; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arxJVh9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734694102; x=1766230102;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5MsnSsET0edgLhFavXks5WFqDDaUgqWQIIz6aq0Aw1o=;
  b=arxJVh9OiOmT1e1SVpCTt0NrxYpglETJ3mPQ8MkgX366HcTb1Edcq1pm
   7Y+r6gbCB3MQD1FtlMBPbSFtleAMyHgZ+1MT/ne1ixMHNRLinTK5y6nSO
   PVRUnKcwcuDE3yrth3bttMC/z48+bv8PYYZOKhS3rNpOiKjNff4lcUx/b
   2mAQF19iJE9wgr9eLLswlNj2u9TFlkqD+ves4iQO4ENhMC4bvsQEeNoZb
   b1ATdcIWwhlgStEwNy3CSgQhxPUJ9fSKqJx5GIG1Z+j2joHTRVMqPfUnZ
   JBtK0RVTCFQih4cd6W7pci4cKPUIEKq3lYcNPUHWHdGbrzy1VIMIzSuAW
   g==;
X-CSE-ConnectionGUID: 7sWdfXCHS6eh8TM3ktWFkA==
X-CSE-MsgGUID: FN2mMmZhRIGuZDebzWBbtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45846058"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45846058"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 03:28:20 -0800
X-CSE-ConnectionGUID: YRM6UorjRcGhCLw4hIF57Q==
X-CSE-MsgGUID: wCu5WD+dTWiSxOU2cQQYRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99315628"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.160])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 03:28:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Dec 2024 13:28:14 +0200 (EET)
To: Dmitry Kandybka <d.kandybka@gmail.com>
cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    lvc-project@linuxtesting.org
Subject: Re: [PATCH] platform/x86/intel: pmc: fix ltr decode in
 pmc_core_ltr_show()
In-Reply-To: <20241219232045.51792-1-d.kandybka@gmail.com>
Message-ID: <d4be773d-a2fe-686c-8769-800a309e5783@linux.intel.com>
References: <20241219232045.51792-1-d.kandybka@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Dec 2024, Dmitry Kandybka wrote:

> In pmc_core_ltr_show(), promote 'val' to 'u64' to avoid possible integer
> overflow. Values (10 bit) are multiplied by the scale, the result of
> expression is in a range from 1 to 34,326,183,936 which is bigger then
> UINT32_MAX. Compile tested only.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Kandybka <d.kandybka@gmail.com>
> ---
>  drivers/platform/x86/intel/pmc/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 3e7f99ac8c94..f06ba9636b03 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -660,12 +660,12 @@ static int pmc_core_ltr_show(struct seq_file *s, void *unused)
>  			if (FIELD_GET(LTR_REQ_NONSNOOP, ltr_raw_data)) {
>  				scale = FIELD_GET(LTR_DECODED_SCALE, nonsnoop_ltr);
>  				val = FIELD_GET(LTR_DECODED_VAL, nonsnoop_ltr);
> -				decoded_non_snoop_ltr = val * convert_ltr_scale(scale);
> +				decoded_non_snoop_ltr = (u64)val * convert_ltr_scale(scale);
>  			}
>  			if (FIELD_GET(LTR_REQ_SNOOP, ltr_raw_data)) {
>  				scale = FIELD_GET(LTR_DECODED_SCALE, snoop_ltr);
>  				val = FIELD_GET(LTR_DECODED_VAL, snoop_ltr);
> -				decoded_snoop_ltr = val * convert_ltr_scale(scale);
> +				decoded_snoop_ltr = (u64)val * convert_ltr_scale(scale);

Please change val to u64 instead so casting won't be necessary.

-- 
 i.

