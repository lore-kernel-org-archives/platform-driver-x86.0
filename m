Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407C786252
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 Nov 2024 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462664; cv=none; b=hXssdJmmjQQqWkawoMJ/FSnyjowiOwCBdnLR41PIRaC891vBrf9xoGrT/ceL80ZihsJ5SSvhisiwO5/n8qi+0mMzGDMRGILM59rZI10l+zfqthfA/2m2imvDYKo2P7bDC0xEm74pszK/nCrTJZ+E/mvPPWXNBwotYKhTrfVg9ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462664; c=relaxed/simple;
	bh=//E8v2JYkElT8S736tK/mwUUhSoGSJG/zdP26n7uPGU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hA2Banq9phKBmIGM3ULMHMtegH48en0GFqLUHUfjMEHvovJGvPlBmRwLlsp+z0Qkpl2kLUoCVuCtz/+/xkcKGX0QG1A0Ehu4DxRSHfJMSKUze9QmQ/rBGtefCwhV3FQRGIA3w5D05zH8kZMZlo/SvuY7u6xLPMFAr0PwI6szrSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2uA0Uoa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2uA0Uoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730462662; x=1761998662;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=//E8v2JYkElT8S736tK/mwUUhSoGSJG/zdP26n7uPGU=;
  b=Y2uA0Uoa7fHq4EgNTFrAdpakyaysOt2BYfhUz4Z13ayafOgdo8eSsyZJ
   Ji3t8DC6Zz5FC2DTy5RDuaE8EAS3hyth1lm4N8KZLQuWAPGF0rfE0UUia
   RFhp2THsclNm1j/HqjY7Q2dTw6pQDsmIS50eOGy/HDj66v/p4D8Hkh57p
   1m94O21IQa353fZJsyFD+WgYVRYeATyyKyt1jK9NPVXX9SHL/tJYqBZtP
   UwbDAQgidc3Ga5MQNmegqRdufzjMoV8NrExF+6TJmtK8XACYjwYr8AppA
   4vADui2kVePhbdfPGv4y4nj8du+nPGwkTg2+rnPA0Yd6VM0x2dm5xI5EO
   A==;
X-CSE-ConnectionGUID: 7aXAUBfLSsiy2F1ZssCrZw==
X-CSE-MsgGUID: 5SGG8h1wR+KAyMl+UCTEEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="47710745"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="47710745"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:04:21 -0700
X-CSE-ConnectionGUID: DGTJUeT3Q3CKTRbVxiXbmQ==
X-CSE-MsgGUID: i0JWqD7MTFOBk+f4sYl6Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83070985"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:04:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 1 Nov 2024 14:04:15 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 5/8] platform/x86/amd/pmc: Update IP information
 structure for newer SoCs
In-Reply-To: <20241029155440.3499273-6-Shyam-sundar.S-k@amd.com>
Message-ID: <c31b8002-75bc-2d24-7a07-1bb7d8638e85@linux.intel.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com> <20241029155440.3499273-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Oct 2024, Shyam Sundar S K wrote:

> The latest AMD processors include additional IP blocks that must be turned
> off before transitioning to low power. PMFW provides an interface to
> retrieve debug information from each IP block, which is useful for
> diagnosing issues if the system fails to enter or exit low power states,
> or for profiling which IP block takes more time. Add support for using
> this information within the driver.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 42 ++++++++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index f9900a03391a..0bf4065153da 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -95,6 +95,35 @@ struct amd_pmc_bit_map {
>  	u32 bit_mask;
>  };
>  
> +static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
> +	{"DISPLAY",     BIT(0)},
> +	{"CPU",         BIT(1)},
> +	{"GFX",         BIT(2)},
> +	{"VDD",         BIT(3)},
> +	{"VDD_CCX",     BIT(4)},
> +	{"ACP",         BIT(5)},
> +	{"VCN_0",       BIT(6)},
> +	{"VCN_1",       BIT(7)},
> +	{"ISP",         BIT(8)},
> +	{"NBIO",        BIT(9)},
> +	{"DF",          BIT(10)},
> +	{"USB3_0",      BIT(11)},
> +	{"USB3_1",      BIT(12)},
> +	{"LAPIC",       BIT(13)},
> +	{"USB3_2",      BIT(14)},
> +	{"USB4_RT0",	BIT(15)},
> +	{"USB4_RT1",	BIT(16)},
> +	{"USB4_0",      BIT(17)},
> +	{"USB4_1",      BIT(18)},
> +	{"MPM",         BIT(19)},
> +	{"JPEG_0",      BIT(20)},
> +	{"JPEG_1",      BIT(21)},
> +	{"IPU",         BIT(22)},
> +	{"UMSCH",       BIT(23)},
> +	{"VPE",         BIT(24)},
> +	{}
> +};
> +
>  static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>  	{"DISPLAY",	BIT(0)},
>  	{"CPU",		BIT(1)},
> @@ -170,7 +199,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		dev->num_ips = 22;
> +		if (boot_cpu_data.x86_model == 0x70)
> +			dev->num_ips = 25;
> +		else
> +			dev->num_ips = 22;

Could these use ARRAY_SIZE()? They're related to that array, aren't they?

>  		dev->smu_msg = 0x938;
>  		break;
>  	}
> @@ -338,9 +370,15 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  
>  	seq_puts(s, "\n=== Active time (in us) ===\n");
>  	for (idx = 0 ; idx < dev->num_ips ; idx++) {
> -		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
> +		if (dev->cpu_id == PCI_DEVICE_ID_AMD_1AH_M20H_ROOT &&
> +		    boot_cpu_data.x86_model == 0x70) {
> +			if (soc15_ip_blk_v2[idx].bit_mask & dev->active_ips)
> +				seq_printf(s, "%-8s : %lld\n", soc15_ip_blk_v2[idx].name,
> +					   table.timecondition_notmet_lastcapture[idx]);
> +		} else if (soc15_ip_blk[idx].bit_mask & dev->active_ips) {
>  			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
>  				   table.timecondition_notmet_lastcapture[idx]);
> +		}

Why not have amd_pmc_get_ip_info() prepare a pointer into 'dev' to the 
relevant soc15_ip_blk_v2/soc15_ip_blk rather than trying to pick one here?

>  	}
>  
>  	return 0;
> 

-- 
 i.

