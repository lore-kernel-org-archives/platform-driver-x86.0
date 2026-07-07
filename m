Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA4A2DAFA9
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 07:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410373; cv=none; b=ozy7D9eNOtSWs00gXodQEpgKq82wctDB2GkP2xikfI9L85qcDpQH477774r9r0fB0HauVAOTP531Nwcnnwcsz4GyaVhLn+N9ZZH+rWxk4odoagmzpnBl7vzCC4+spVj2Jvcr6SHt5jeyprT7Oo4/l9fdKLtZwjMmHUUzHqQ+rKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410373; c=relaxed/simple;
	bh=SMhzJOarIf6aALThNo5iuP6LEw86fcTszML7UjEiQ5M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=m7nV87alANHbbDG3iz9pWTHRUNI8lz3Gk+ZPdvOA+se5Nna6n+UNNKyWg6Ew6CPmSVZ+RxPoWOIKMvxdxT7+XUzy+bEceDF2/B6/AStQihMf85Ld5IHeRLbj8o1LqqARsUedWhCqq8XgvdCTMfvylFRhwuwf5lW6AtpfwZL2YOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEWvW0cD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEWvW0cD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783410371; x=1814946371;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SMhzJOarIf6aALThNo5iuP6LEw86fcTszML7UjEiQ5M=;
  b=dEWvW0cDT/UkLIzuwZdM8VZD3Jij3gU6ZdjneHd9QG5jGp8DGx4K1NQL
   ZcItn5TNc9HX61D5MKoZSzdjgGe6H9gDWz5xX8zFNBPQykR3KSCwmmJrE
   RvXuPExWKlPvE4YRcV8cdX/7LH9joKzK0U9B+w8AlWnlCmHVZvLx8H3gC
   kgdMspFJJSZOrI5sFg3NxiED+vynrPeOXcBFaojWRo37P473kIT9r/QmI
   8JvdOIbZF/xZmv8QXD7onHS+TssVxtzn55vmtzYTt0ymfMGaVQVWRsUzD
   3EqDnWfuI7ZcgszbxlMxvhWCu4S1BK08ABgBjJPLy7Xje08OpxHH/1fKp
   A==;
X-CSE-ConnectionGUID: NPQrGBqZRdqffegbQ6g87Q==
X-CSE-MsgGUID: kJCYHJcvRkK6dz9gN31hiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="86599631"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="86599631"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:46:10 -0700
X-CSE-ConnectionGUID: GcXiKjaUSqOFbpN5oO1UhA==
X-CSE-MsgGUID: P0YkyWD6Q0ylkCMqiDO8/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="249940178"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:46:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 10:46:04 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: amd-pmc: Add IP block table for AMD 1Ah
 M80H SoC
In-Reply-To: <20260707054048.69152-1-Shyam-sundar.S-k@amd.com>
Message-ID: <c07417fd-ddd9-e171-de9b-75bdfc66c5b3@linux.intel.com>
References: <20260707054048.69152-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jul 2026, Shyam Sundar S K wrote:

> AMD Family 1Ah, Model 80h has different IP subsystem layout compared to
> previous AMD SoCs. The existing soc15_ip_blk[] does not match the latest
> firmware's DRAM export structure for S0i3 subsystem accounting.

You say "the latest firmware" so what about the cases that have older FW?

> Add soc15_ip_blk_v3[] with the correct SoC IP ordering and wire
> amd_1ah_m80_cpu_info to use it, enabling accurate S0i3 blocking time
> reporting in smu_fw_info.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

-- 
 i.

> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index d50ea62fa2f3..4a5650f1a3a8 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -33,6 +33,28 @@
>  
>  #include "pmc.h"
>  
> +static const struct amd_pmc_bit_map soc15_ip_blk_v3[] = {
> +	{"VDDCR",	BIT(0)},
> +	{"VDDCR_LP",	BIT(1)},
> +	{"LSOCV",	BIT(2)},
> +	{"DISPLAY",	BIT(3)},
> +	{"VCN",		BIT(4)},
> +	{"JPEG",	BIT(5)},
> +	{"UMSCH",	BIT(6)},
> +	{"VPE",		BIT(7)},
> +	{"MPM",		BIT(8)},
> +	{"NPU",		BIT(9)},
> +	{"USB_HC0",	BIT(10)},
> +	{"eUSB_HC0",	BIT(11)},
> +	{"RT0_ADP_HC1", BIT(12)},
> +	{"RT1_ADP_HC1", BIT(13)},
> +	{"RT2_ADP_HC2", BIT(14)},
> +	{"USB4_RT0",	BIT(15)},
> +	{"USB4_RT1",	BIT(16)},
> +	{"USB4-RT2",	BIT(17)},
> +	{"LAPIC",	BIT(18)},
> +};
> +
>  static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
>  	{"DISPLAY",     BIT(0)},
>  	{"CPU",         BIT(1)},
> @@ -159,9 +181,9 @@ static const struct amd_pmc_cpu_info amd_1ah_m80_cpu_info = {
>  	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_80H,
>  	.smu_arg	= AMD_PMC_REGISTER_ARG_1AH_80H,
>  	.smu_rsp	= AMD_PMC_REGISTER_RSP_1AH_80H,
> -	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v3),
>  	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
> -	.ips_ptr	= soc15_ip_blk,
> +	.ips_ptr	= soc15_ip_blk_v3,
>  	.os_hint	= MSG_OS_HINT_RN,
>  };
>  
> 
