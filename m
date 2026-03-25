Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C03DE437
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774447706; cv=none; b=hOzKTiS57PdVz62crZKecCbmjm24z/ZVKC33AGB2U2ra5RvuWjoJicinfUXHWPHHPn8nVT6Bumic9pLGVDNMWg7AGMiU0ZLYAQSDEFOzqrRsd86OnrwmdY+qYMTBO5/wyps3qhRMpXbU6B27D4TVirI0zIhAag+SenjLmET68CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774447706; c=relaxed/simple;
	bh=zoiPE63R+c4kyD1pKuXNEec2Oa+UKuJiufo6WiQc19Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CBjfEg1GM0Y2KJb+mSYS1nM3/4/fhFmFX/m86+8wMCdOINhlPvJBF48n5kOprACMFUboKCqfufH0uV4iTkM0Ld1HxDX6WGSXZn4IPJayfMGUISWfAEVQfT+4tTiU6G1GZ/itXt4/rLAJ9ooZh6iHNa5YvUWt6apRNT4XFURzQfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kbx5lLg+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kbx5lLg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774447703; x=1805983703;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zoiPE63R+c4kyD1pKuXNEec2Oa+UKuJiufo6WiQc19Q=;
  b=Kbx5lLg+g62ppKS+JB4go4reaozr9RYhkpl4q4PNKVZSvBR0OEfQLaUq
   EFSI+nAw+cW7kN+ytLJeKYR2HRA6rMo9bhP/0kYBn8UHL1ezoxt1bfOMa
   Za0t6rNzwXDRFxB6czd9iPZZdc3CRwanJmAWUhjwBkyH+g4MvqA15bryq
   zeOpFITIaOyJQ4J8AlIBJ4H4wyKIuj4vN9xXss601tEaSttS0S4wgF4xX
   ycDt+ibcvld2kQH5fN7FwqEUYn4JyDi40UsW9kkcF/RHbaIu3lJcV0d1b
   xUwwBp9Cfel88ybitnhwG1NGmk9mi8/h5G70sVngrJbfGHJl5m/adBSGI
   A==;
X-CSE-ConnectionGUID: lFgWybJMSD+bR0biO6RZQg==
X-CSE-MsgGUID: O6KuBo6ATx6QTjalY5gmBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75369288"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75369288"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 07:08:03 -0700
X-CSE-ConnectionGUID: kQvwam/mR1SVs/1gmTbv+w==
X-CSE-MsgGUID: 1MiUjhTaQMqBPU04gbL6jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220286743"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 07:08:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 16:07:57 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com, 
    Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 3/7] platform/x86/amd/pmf: Add feature discovery
 support to util interface
In-Reply-To: <20260301131124.1370565-4-Shyam-sundar.S-k@amd.com>
Message-ID: <f0235752-f949-a0a3-36bd-124a42169b58@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Mar 2026, Shyam Sundar S K wrote:

> Add feature discovery capability to the util layer interface, allowing
> userspace tools to query which PMF features are supported and enabled
> on the current platform.
> 
> The following features can now be queried through the
> /dev/amdpmf_interface ioctl:
> *Auto Mode: Automatic power profile switching based on system activity
> *Static Power Slider: User-selectable power profiles
> *Policy Builder (Smart PC): Action based policy management
> *Dynamic Power Slider AC: Adaptive power profiles when on AC power
> *Dynamic Power Slider DC: Adaptive power profiles when on battery

Same comments to the list as to the other patch.

> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/util.c | 33 +++++++++++++++++++++++++++++
>  include/uapi/linux/amd-pmf.h        | 12 ++++++++++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> index 59a125deb6b6..9a14467f412c 100644
> --- a/drivers/platform/x86/amd/pmf/util.c
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -16,6 +16,8 @@
>  
>  #include "pmf.h"
>  
> +#define AMD_PMF_IOCTL_VERSION		0x02
> +
>  /* Convert BIOS input control code to array index (0-9) */
>  static int amd_pmf_get_bios_idx(u32 control_code)
>  {
> @@ -46,6 +48,33 @@ static long long amd_pmf_populate_bios_output(struct amd_pmf_dev *pdev, u32 cont
>  	return pdev->bios_output[idx];
>  }
>  
> +static bool amd_pmf_is_feature_supported(struct amd_pmf_dev *pdev, u32 control_code)
> +{
> +	bool feat;
> +
> +	switch (control_code) {
> +	case IOCTL_FEATURE_AUTO_MODE:
> +		feat = is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE);
> +		break;
> +	case IOCTL_FEATURE_STATIC_POWER_SLIDER:
> +		feat = is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR);
> +		break;
> +	case IOCTL_FEATURE_POLICY_BUILDER:
> +		feat = pdev->smart_pc_enabled;
> +		break;
> +	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC:
> +		feat = is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC);
> +		break;
> +	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC:
> +		feat = is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC);
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return feat;
> +}
> +
>  static long long amd_pmf_device_state(struct ta_pmf_enact_table *in, u32 control_code)
>  {
>  	switch (control_code) {
> @@ -116,6 +145,10 @@ static int amd_pmf_populate_data(struct device *dev, void __user *argp)
>  	case IOCTL_BIOS_OUTPUT_1 ... IOCTL_BIOS_OUTPUT_10:
>  		output.val = amd_pmf_populate_bios_output(pdev, output.control_code);
>  		break;
> +	case IOCTL_FEATURE_AUTO_MODE ... IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC:
> +		output.feature_supported = amd_pmf_is_feature_supported(pdev, output.control_code);
> +		output.feature_version = AMD_PMF_IOCTL_VERSION;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index f93767248169..f34c5d744039 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -70,6 +70,11 @@
>   * @IOCTL_BIOS_OUTPUT_8: Query BIOS output parameter 8
>   * @IOCTL_BIOS_OUTPUT_9: Query BIOS output parameter 9
>   * @IOCTL_BIOS_OUTPUT_10: Query BIOS output parameter 10
> + * @IOCTL_FEATURE_AUTO_MODE: Query if Auto Mode feature is supported
> + * @IOCTL_FEATURE_STATIC_POWER_SLIDER: Query if Static Power Slider is supported
> + * @IOCTL_FEATURE_POLICY_BUILDER: Query if Policy Builder feature is supported
> + * @IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC: Query if Dynamic Power Slider (AC) is supported
> + * @IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC: Query if Dynamic Power Slider (DC) is supported
>   *
>   * These control codes are used with the IOCTL_PMF_POPULATE_DATA ioctl
>   * to specify which metrics data to retrieve from the AMD PMF driver.
> @@ -110,7 +115,12 @@ enum pmf_ioctl_id {
>  	IOCTL_BIOS_OUTPUT_7,
>  	IOCTL_BIOS_OUTPUT_8,
>  	IOCTL_BIOS_OUTPUT_9,
> -	IOCTL_BIOS_OUTPUT_10
> +	IOCTL_BIOS_OUTPUT_10,
> +	IOCTL_FEATURE_AUTO_MODE,
> +	IOCTL_FEATURE_STATIC_POWER_SLIDER,
> +	IOCTL_FEATURE_POLICY_BUILDER,
> +	IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC,
> +	IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC

I'm trying to confirm whether there are some special requirements when 
it comes to trailing commas for uapi headers. If somebody knows for sure 
if trailing commas are safe or not for userspace builds, please chime in.

-- 
 i.

