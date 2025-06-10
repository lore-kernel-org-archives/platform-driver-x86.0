Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10192327A7
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571027; cv=none; b=QoEZdo6WCAs5bnvCyDwFfgOqfPb8cEag44xTH0g4PX/biTY7KnVXoVnJ8wQ6sgP4k2HBn6ek4ty26XYvpPW38RfVq5vL4tIx1mxs7G5Mw1SXNURCQTu3JyQ7x/JYXirbpyU38UtDocwA3lZQGycXUqOwAWQot8YdYC/+KXH7Ho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571027; c=relaxed/simple;
	bh=e+O4bMT58b8+xWRfctaQ7qZ6vcj0nWCsgj8Kqvc8+W8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=c43t6rGyZzCfSpNalkcNcwOablbnandjADwHGCJlnnHkgbWCiNo4Crz7goUWvWZGA5SAZRhydy1cQJQtTLs3Jk5q1KFJBZkziIwTrb1dmZxnoaxmuv6I4KHExkfr5dzMc6HQuvvEvGyMiqueWzFu01oCh7RzNCzBYtsqRsNkVRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bObcPYr4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bObcPYr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749571025; x=1781107025;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=e+O4bMT58b8+xWRfctaQ7qZ6vcj0nWCsgj8Kqvc8+W8=;
  b=bObcPYr4NDCZMhAU4T4PIRclkLZfd+lzhwHHMwMov4dctf7xQS++kFiP
   4kSn2UQwf2v5A0BFCG7bEMf/7MfVX+qZCVg/TeUKMcPsVLv+7U8e9RClw
   HcL4DKuzRa0uGsAm/2Z32P6uDzyE5+mjlwBG5Wns6kdRJ11kR9R8XSN8H
   fe2QvlVArhALV5eiQUYPf1wnmvJizYTz1o/26NtEuVZzmYF4KpFC0ttM3
   /ymzAiIBSdiKr00pnIQfwcn+UbQeC4BnrpE0ZE9jABCjFW6WVDCccuHxl
   xSjRjnMQcgeOTZ/ftTCwgvUXtmk9E5Gtppsj4Xj1N+5Z+cUEmH8XgNPhl
   Q==;
X-CSE-ConnectionGUID: avalRo3sT4y2Rh4RGBcJiQ==
X-CSE-MsgGUID: sm+hDERfRTCYIJKYG8V17A==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51834228"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51834228"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 08:57:04 -0700
X-CSE-ConnectionGUID: gtnG2UVmT2qRddUpM111uw==
X-CSE-MsgGUID: NSa2qQTjQVK4y8+JXfj8hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="147252502"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 08:57:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Jun 2025 18:56:58 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH 07/10] platform/x86/amd/pmf: Use amd_pmf_update_bios_inputs()
 helper
In-Reply-To: <20250509072654.713629-8-Shyam-sundar.S-k@amd.com>
Message-ID: <d4b5df6e-912d-8925-51d2-5f8da4ca5e64@linux.intel.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com> <20250509072654.713629-8-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 May 2025, Shyam Sundar S K wrote:

> Use amd_pmf_update_bios_inputs() helper function to update the custom
> BIOS inputs.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/spc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index be6ffb823efc..0cd50d342b11 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -125,15 +125,12 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  		&in->ev_info.bios_input3, &in->ev_info.bios_input4, &in->ev_info.bios_input5,
>  		&in->ev_info.bios_input6, &in->ev_info.bios_input7, &in->ev_info.bios_input8,
>  		&in->ev_info.bios_input9, &in->ev_info.bios_input10};
> -	int i;
>  
>  	if (!(pdev->req.pending_req || pdev->req1.pending_req))
>  		return;
>  
> -	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> -		if (pdev->req.pending_req & custom_bios_inputs[i].bit_mask)
> -			*bios_inputs[i] = pdev->req.custom_policy[i];
> -	}
> +	amd_pmf_update_bios_inputs(pdev, bios_inputs, custom_bios_inputs, pdev->req.pending_req,
> +				   pdev->req.custom_policy);

Why is this in own patch and not in the one introducing 
amd_pmf_update_bios_inputs() ?

>  	if (pdev->smart_pc_enabled && pdev->pmf_if_version == PMF_IF_V1 &&
>  	    is_apmf_bios_input_notifications_supported(pdev)) {
> 

-- 
 i.

