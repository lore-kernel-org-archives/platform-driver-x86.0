Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D86739EF1C
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779361140; cv=none; b=u+WdxJKJ9uzuABbs2zSMSsHGJNS6+8FkWipe+oOmjMs/X4hoDdeX8Dud2bQytrtlqYpMqEXTxTXrmyLGSXT+jcw3jPtpyZzUPTWDjQ7NgcrY/Llz2nkpe2HRGxbUO86j0zL2u3wOD6FGmS+2FRqhz65Z6Gx0YBRe5AIR75ITrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779361140; c=relaxed/simple;
	bh=BKTu3BLCmIXL8+8iEkOiYAksz/DkfshWNeWIzc5msmM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T89FZmhK1vCsG8G+VIPgL5LEAbFinCgLF4qLXBBUPPJM3ApQQlP/gG7HbNFoeD7dN+7crWiAVYrXO/GtWebhsWrIw59gWuuk55DGoIkyd6k+GiS3lcDaIPTSw4YNH4GXnuSydSZd1nl/47etKaPQU3zjhyqM/+u4Y6cSa0A78Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcwitDHF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcwitDHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779361138; x=1810897138;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BKTu3BLCmIXL8+8iEkOiYAksz/DkfshWNeWIzc5msmM=;
  b=gcwitDHFVpF5SADcYcpcCYnDwEDiLQlZakEVbgEBpKwSW/Jqz2v/d2wg
   6IXaAiSMOUgCeCTJwP6jKJamJLWLc3623fbtoTyo2O/X5sxh+REh0LTPq
   3Cc+1pk15uSMv9F9wVVOtGh88iXwFBSAmk8+SJr2C2BH6lKM6Gph5jWvk
   U9+CcaJDTcYtymU8na4AhPUOoTWs/L6Hi68iVqH3iDwAkF5x25yt+u8Cd
   KH2lyf0WjmbHXtSPLufpQGqe5k02rtFcW5jWzfL2+OVTEdLcokARF2tRF
   fXs8a2P0AMxotD3NE0NKVANq2jjsGg9XJ6/934P/1IOVR7smjBI6rRJqk
   A==;
X-CSE-ConnectionGUID: zX677rQGRZir1QXawWVWUg==
X-CSE-MsgGUID: iQBQiyIISZaYwZxMOnKu4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80310355"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80310355"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 03:58:58 -0700
X-CSE-ConnectionGUID: BHo4KGHcSWO+gT42v5feIQ==
X-CSE-MsgGUID: V2puL1aVTNeonVoK7yOoww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="244782846"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.98])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 03:58:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 21 May 2026 13:58:51 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v5 6/8] platform/x86/amd/pmf: Implement util layer ioctl
 handler
In-Reply-To: <20260520185424.770772-7-Shyam-sundar.S-k@amd.com>
Message-ID: <22cddbea-3aab-cda5-7c66-9386889f1102@linux.intel.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com> <20260520185424.770772-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, Shyam Sundar S K wrote:

> Implement the ioctl handler for the util layer character device. This
> support adds the actual functionality to populate PMF metrics from the
> TA shared memory buffer and return them to userspace.
> 
> The implementation includes:
> - amd_pmf_populate_data() to extract metrics from TA shared memory
> - amd_pmf_set_ioctl() to handle userspace ioctl requests
> - Size negotiation for forward/backward compatibility
> - Feature-based population of struct fields
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/util.c | 90 ++++++++++++++++++++++++++++-
>  1 file changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> index 0052f0b6a7a5..eb9a02e135a9 100644
> --- a/drivers/platform/x86/amd/pmf/util.c
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -19,9 +19,97 @@
>  static struct amd_pmf_dev *pmf_dev_handle;
>  static DEFINE_MUTEX(pmf_util_lock);
>  
> +static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
> +{
> +	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_table *in = NULL;
> +	int idx;
> +
> +	if (!pdev || !info)
> +		return -EINVAL;
> +
> +	ta_sm = pdev->shbuf;
> +	in = &ta_sm->pmf_input.enact_table;
> +
> +	/* Set size and version */
> +	info->size = sizeof(struct amd_pmf_info);

sizeof(*info)

version ???

> +
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
> +	/* Device States */
> +	info->platform_type = in->ev_info.platform_type;
> +	info->laptop_placement = in->ev_info.device_state;
> +	info->lid_state = in->ev_info.lid_state;
> +	info->user_presence = in->ev_info.user_present;
> +	info->slider_position = in->ev_info.power_slider;
> +
> +	/* Thermal and Power Metrics */
> +	info->power_source = in->ev_info.power_source;
> +	info->skin_temp = in->ev_info.skin_temperature;
> +	info->gfx_busy = in->ev_info.gfx_busy;
> +	info->ambient_light = in->ev_info.ambient_light;
> +	info->avg_c0_residency = in->ev_info.avg_c0residency;
> +	info->max_c0_residency = in->ev_info.max_c0residency;
> +	info->socket_power = in->ev_info.socket_power;

I've no big problem with this, though I seem to now recall Hans also was 
suggesting the in-kernel data would be layouted such that this copy would 
be easier (but please check).

In any case, my plan is to ask Hans to check the next version of this 
series now that it will be hopefully ready/almost ready.

> +	/* Custom BIOS input parameters */
> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++) {
> +		if (idx < 2)
> +			info->bios_input[idx] = in->ev_info.bios_input_1[idx];
> +		else
> +			info->bios_input[idx] = in->ev_info.bios_input_2[idx - 2];

This seems to duplicate amd_pmf_get_ta_custom_bios_inputs().

> +	}
> +
> +	/* BIOS output parameters */
> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
> +		info->bios_output[idx] = pdev->bios_output[idx];
> +
> +	return 0;
> +}
> +
>  static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
> -	return -ENOTTY;
> +	struct amd_pmf_dev *pdev = filp->private_data;
> +	void __user *argp = (void __user *)arg;
> +	struct amd_pmf_info info = {};
> +	size_t copy_size;
> +	__u64 user_size;
> +	int ret;
> +
> +	if (cmd != IOCTL_AMD_PMF_POPULATE_DATA)
> +		return -ENOTTY;
> +
> +	/* First read just the size field from userspace */
> +	if (copy_from_user(&user_size, argp, sizeof(user_size)))
> +		return -EFAULT;

Just an interface though, if features are ever needed as userspace -> 
kernel comminucation channel, it should be handled properly right from 
the start, with -EINVAL being returned for invalid (unknown) values.

This is not meant to say, you must act on this, you have better idea how 
this interface may evolve over the years than I do. But if an ability to 
query a set of features only would be useful at some point, it would be 
beneficial to take account now as we cannot change it later to not break
ABI rules (if userspace passes struct that has only user_size initalized 
and pseudogarbage in ->features, we cannot start to return -EINVAL because 
of that later).

> +	if (user_size & (sizeof(__u64) - 1))

Please use IS_ALIGNED() + check you have the include for it.

I wonder if user_size > sizeof(*info) is a bit dangerous condition and 
should also result in -EFAULT. It result in leaving the rest of the struct 
uninitialized (from userspace's PoV) when userspace and this kernel 
version disagree what's the size of the struct.

> +		return -EINVAL;
> +
> +	guard(mutex)(&pmf_util_lock);
> +	ret = amd_pmf_populate_data(pdev, &info);
> +	if (ret)
> +		return ret;
> +
> +	copy_size = min_t(size_t, user_size, sizeof(struct amd_pmf_info));

sizeof(*info)

> +
> +	/* Set actual size being copied */
> +	info.size = copy_size;
> +
> +	if (copy_to_user(argp, &info, copy_size))
> +		return -EFAULT;
> +
> +	return 0;
>  }
>  
>  static int amd_pmf_open(struct inode *inode, struct file *filp)
> 

-- 
 i.

