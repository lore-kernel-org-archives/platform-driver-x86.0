Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A7B49365C;
	Tue, 25 Aug 2026 00:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787616087; cv=none; b=RaZqgGppXRD4hJdcYGiJiOB6izc9J1ZOM/txXANkelsOSMYJHWgNnYf/fhmm1eLSYOYAAFZm5LwmR66kn2fE7EouV1Et745DXJvtLO+K5AMrTCfo3/SghTc1dEuarnUUgjIq2ZMJ4eBaa2gmql4wi6N3oTjJ/iO0uaWaXengHTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787616087; c=relaxed/simple;
	bh=gSSLUGiH5Sl2pH0Jbv+ZUlVp3j0m2g/x2Cv4dI583Hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GejvsK8R662f6wJx75gvDlFOYLQp0nak+p3VJE1ziQKC31Ei/toaisECw/ecYkj8YbOL3GGiOwAVmfdpm7HJ0gr8M+HvmsTHrAoPPssQaLMTnSWHBNPJofFVAi7tU3jnUIcTFFtxw5kGRfM1EBTgaTzMyKDgw/+17xFmYJ8spwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XaiwD9O/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XaiwD9O/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787616085; x=1819152085;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gSSLUGiH5Sl2pH0Jbv+ZUlVp3j0m2g/x2Cv4dI583Hw=;
  b=XaiwD9O/iI2W94bCE0OdXlyia05M3PPNinLbJ06che5kYVcMFW+hgGyc
   7L+rwpGLnM2xNEx2k7l5zReALGe4SfnlEJeKszyggQyuKfC/ii7eMWatM
   OG1jPQSCKVea2CNUL/vPPd+rtp9wFBXLlxsBAprx6K9yJUuzKJIO3uTxJ
   1b2BpVRmt8Ccj3e7dODaN/JteZf16DT6tK8Vv46nKK+rIfP3Ip5Hir63N
   sXrjDPerSJ9SpgRkEcqKtuh8JBqmpuXJjhrgohY+H2i3cVLJjy2WuGGtt
   n50EAMt8MwE0f5sNQQvgFob3raPMfuopRppPJf7ldOkuLl1V5WFUeFT9e
   w==;
X-CSE-ConnectionGUID: 9cKTeUvMTra2K5DawizUdA==
X-CSE-MsgGUID: rCG7YDScQaORCz+4Va4nCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98669191"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="98669191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 17:01:24 -0700
X-CSE-ConnectionGUID: EHrzYxBFRXysjmSUTDCVBQ==
X-CSE-MsgGUID: yRvZ1rrXTASKhsbfyYVN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="290663328"
Received: from xpardee-mobl.amr.corp.intel.com (HELO [10.124.48.240]) ([10.124.48.240])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 17:01:24 -0700
Message-ID: <459275dc-64ab-4bf8-b6ef-acf2d33d760d@linux.intel.com>
Date: Mon, 24 Aug 2026 17:01:12 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform/x86/intel/pmc: Add rugged Panther Lake
 support to intel_pmc_core
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David E Box <david.e.box@intel.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260819173804.1184250-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Language: en-US
From: Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <20260819173804.1184250-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Xi Pardee <xi.pardee@linux.intel.com>

On 8/19/2026 10:38 AM, Kuppuswamy Sathyanarayanan wrote:
> From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>
> Add rugged Panther Lake support to intel_pmc_core driver.
>
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>   drivers/platform/x86/intel/pmc/core.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 825ba5fa0bcb..14e186aa15fe 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1849,6 +1849,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
>   	X86_MATCH_VFM(INTEL_ARROWLAKE_U,	&arl_h_pmc_dev),
>   	X86_MATCH_VFM(INTEL_LUNARLAKE_M,	&lnl_pmc_dev),
>   	X86_MATCH_VFM(INTEL_PANTHERLAKE_L,	&ptl_pmc_dev),
> +	X86_MATCH_VFM(INTEL_PANTHERLAKE_R,	&ptl_pmc_dev),
>   	X86_MATCH_VFM(INTEL_WILDCATLAKE_L,	&wcl_pmc_dev),
>   	X86_MATCH_VFM(INTEL_NOVALAKE,		&nvl_s_pmc_dev),
>   	X86_MATCH_VFM(INTEL_NOVALAKE_L,		&nvl_h_pmc_dev),
