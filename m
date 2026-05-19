Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCC623393E
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186685; cv=none; b=rE2zjNApLZd8C90YYqth6tHLidcKRIZWvE/QX6QiA7xt3+t6FWni/Tnjo7KfIwerQtOeCCFDBmIGsVPZfoWmDZHIQAGPtbd846qpM/oZuvOW/ITncyt4ReHMK1R17CduahhS7PCJpIie5RnRu/ajWAhtXoWjWWwBITAyQq+8L9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186685; c=relaxed/simple;
	bh=hsVi4NxBklOWVUachhBjeUd4YO1fwK/8JZuC3ga8gqw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bwCVihC/PP2cRYR5y4iYArItQY8W/Q5NAMjxVEjwmXJ9WcpJrS1+9Wi0URYJ49WbW+oIW79Bqz3T1v7SCit+hn2g7yLmjJ8Q0wwQsHEka2HfTpNosyZUNDCLOWUxKZIk0aPmXC7Fqjd9FsU8OprlDIxSCLGSJKeX/mLMINzKTJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/C3wHgc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/C3wHgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779186684; x=1810722684;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hsVi4NxBklOWVUachhBjeUd4YO1fwK/8JZuC3ga8gqw=;
  b=a/C3wHgc5mGcT6PgG9fKq//cCHWepQeRkiBrB9mCs7+ALvRzHqbDlmfy
   bTcQJ2g/QA5urMa4yxdOr/lYP0BHgH0vpg5D3KEks9TY/ZhhhNyw4ZQqn
   4i9613sUFAT7fVsrxGde3StUdaCg+Up50buUHiN6IwGM77K9yvsYoG2vq
   e15TeelwZQjM0FxrGOZKIhvqdVDGjVH1+h6yd9omw/PLA0LjjQOR5K5YU
   +73lRgvh1Yo+b8LPGQ9Ceb3pqJHMMFFcXOaMty56qinQT3ssMe/hwc3rX
   EvuMThp2Dy2Obh+D2YfrALGes3txPu0lXKgK512uvrrgi4wB6IwG3tekS
   Q==;
X-CSE-ConnectionGUID: I+jXFukSSLaui6fKYKdtgA==
X-CSE-MsgGUID: eKSibrN4QkuOlwpDVpQgUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97494178"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97494178"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:31:24 -0700
X-CSE-ConnectionGUID: R9G1SgLDRmuvz8H4xCfu+Q==
X-CSE-MsgGUID: VfSsPHLDTTKNo3Z8cdcQCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237110507"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:31:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 May 2026 13:31:17 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v4 3/7] platform/x86/amd/pmf: Add feature discovery
 support to util interface
In-Reply-To: <20260507144524.664001-4-Shyam-sundar.S-k@amd.com>
Message-ID: <738ed51c-4ff3-8c65-da02-9f6a80db66a0@linux.intel.com>
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com> <20260507144524.664001-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 May 2026, Shyam Sundar S K wrote:

> Add feature discovery capability to the util layer interface, allowing
> userspace tools to query which PMF features are supported and enabled
> on the current platform.
> 
> The following features can now be queried through the
> /dev/amdpmf_interface ioctl:
> *  Auto Mode: Automatic power profile switching based on system activity
> *  Static Power Slider: User-selectable power profiles
> *  Policy Builder (Smart PC): Action based policy management
> *  Dynamic Power Slider AC: Adaptive power profiles when on AC power
> *  Dynamic Power Slider DC: Adaptive power profiles when on battery
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/util.c | 12 ++++++++++++
>  include/uapi/linux/amd-pmf.h        | 10 ++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> index 3a30fd4f063f..c96e6b3fef53 100644
> --- a/drivers/platform/x86/amd/pmf/util.c
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -34,6 +34,18 @@ static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *
>  	/* Set size and version */
>  	info->size = sizeof(struct amd_pmf_info);
>  
> +	/* PMF Feature support flags */
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
> +		info->features_supported |= AMD_PMF_FEAT_AUTO_MODE;
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +		info->features_supported |= AMD_PMF_FEAT_STATIC_POWER_SLIDER;
> +	if (pdev->smart_pc_enabled)
> +		info->features_supported |= AMD_PMF_FEAT_POLICY_BUILDER;
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
> +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
> +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
> +
>  	/* Device States */
>  	info->platform_type = in->ev_info.platform_type;
>  	info->laptop_placement = in->ev_info.device_state;
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index 54b5cf08f3fb..0fe68e21ee5b 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -34,6 +34,13 @@
>  
>  #define AMD_PMF_BIOS_PARAMS_MAX		10
>  
> +/* AMD PMF feature flags - bitmask indicating supported features */
> +#define AMD_PMF_FEAT_AUTO_MODE			BIT(0)
> +#define AMD_PMF_FEAT_STATIC_POWER_SLIDER	BIT(1)
> +#define AMD_PMF_FEAT_POLICY_BUILDER		BIT(2)
> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
> +
>  struct amd_pmf_info {
>  	__u64 size;
>  
> @@ -57,6 +64,9 @@ struct amd_pmf_info {
>  	__u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
>  	__u32 bios_output[AMD_PMF_BIOS_PARAMS_MAX];
>  
> +	/* Feature info */
> +	__u32 features_supported;

Would it be better to place this right after the size?

I don't know if the features actually impact interpretation of any of the 
existing fields in this struct but I can envision it one day containing 
information how to interpret one of the fields (whether the field is valid 
or not). As such, it feel better to make sure it's always available 
regardless of the size kernel<->userspace transfers across.

-- 
 i.

