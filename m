Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8A429B8E6;
	Tue,  6 Jan 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692962; cv=none; b=QEgVqCgNoe/e9l2ZpWq5OeoPghnbezpIbce11mdDZDDrRVcHUdrBiarKzL3CHcbUh4JWPDjLdFuO+LE9GW9nLp0nN38Ha9AGcqwHghtc85/+SZkkhqe/pKe5tYQyMqV0FnlcGnToFJNwUKHMVwFJWv/k7mIRxldTKxiOKBWctmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692962; c=relaxed/simple;
	bh=cj6Xc+9+WqQCp6dTjJnvjTcUNW+/vV7+TyscA3n9Z9M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nAyoQ6AZ+zg/rGIsu5WunH99352NvlT9hxz8G5tWs0t1MEpeAHL0oQjRSJZpXTl5yIATs69+5vsXAfCMa4ORI2xAf/F2KoQWgDvRclcfrvXF8TZE4JQjvy52sJPAYAgddJcx8l6OfUJQL5H0Z//X2oZFtHsAHS7XTYikMEl7tKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLGFEsGE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLGFEsGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767692961; x=1799228961;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cj6Xc+9+WqQCp6dTjJnvjTcUNW+/vV7+TyscA3n9Z9M=;
  b=CLGFEsGEYdbnXyuNFYDz7AyzJlvtXe5c2If+3pKHZKR0Ro4ktlQOXq1w
   gxXHMbRnJqWLuBL9IPaRHO2Xf2GIbUYKuCWD7VKFoopfPMIIKCmT65rrr
   yp2aCIZ54JC5Nzv1dp2qmRY0WP6PPVJPwljqYMg5fTtNvG27SZwAiZpgp
   m5GG3PBUYnTLXQFsdlw6TyVVdbwxngFv3uJz/hIWULPkBfMvjLQKv7uVH
   9Nr+xPMNZ5RKX++KurcRgg+cDpKV1B3B3LMchL0UxlwRPWHce9CwsqscO
   hvk/w+UPwEYzGcArBlL1SHDrKb0oYCsrcHijmSwiZjnGTH1FDkxmkMpJI
   w==;
X-CSE-ConnectionGUID: /Y6hVP6uQQq4RUKtNqofew==
X-CSE-MsgGUID: 77KbALYGTXuSDTjn58w++Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69130880"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="69130880"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 01:49:20 -0800
X-CSE-ConnectionGUID: 79p08VRMRH6OW4K6vF+JoA==
X-CSE-MsgGUID: Xwknt0bESX21LemyY+/Gew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207656252"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.6])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 01:49:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Jan 2026 11:49:13 +0200 (EET)
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: ISST: Check for admin capability for write
 commands
In-Reply-To: <20251229183652.823308-1-srinivas.pandruvada@linux.intel.com>
Message-ID: <b402fa2b-0cc8-d39a-6f35-3680ff54407b@linux.intel.com>
References: <20251229183652.823308-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Dec 2025, Srinivas Pandruvada wrote:

> In some SST deployments, administrators want to allow reading SST
> capabilities for non-root users. This can be achieved by changing file
> permissions for "/dev/isst_interface", but they still want to prevent
> any changes to the SST configuration by non-root users.
> 
> This capability was available before for non-TPMI SST. Extend the same
> capability for TPMI SST by adding a check for CAP_SYS_ADMIN for all
> write commands.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  .../x86/intel/speed_select_if/isst_tpmi_core.c        | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index 47026bb3e1af..a624e0b2991f 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -612,7 +612,7 @@ static long isst_if_core_power_state(void __user *argp)
>  		return -EINVAL;
>  
>  	if (core_power.get_set) {
> -		if (power_domain_info->write_blocked)
> +		if (power_domain_info->write_blocked || !capable(CAP_SYS_ADMIN))

Hi,

This check doesn't exist in my tree, you seem to have mis-submitted this 
independently of the other series that adds the check.

-- 
 i.

>  			return -EPERM;
>  
>  		_write_cp_info("cp_enable", core_power.enable, SST_CP_CONTROL_OFFSET,
> @@ -659,7 +659,7 @@ static long isst_if_clos_param(void __user *argp)
>  		return -EINVAL;
>  
>  	if (clos_param.get_set) {
> -		if (power_domain_info->write_blocked)
> +		if (power_domain_info->write_blocked || !capable(CAP_SYS_ADMIN))
>  			return -EPERM;
>  
>  		_write_cp_info("clos.min_freq", clos_param.min_freq_mhz,
> @@ -751,7 +751,8 @@ static long isst_if_clos_assoc(void __user *argp)
>  
>  		power_domain_info = &sst_inst->power_domain_info[part][punit_id];
>  
> -		if (assoc_cmds.get_set && power_domain_info->write_blocked)
> +		if (assoc_cmds.get_set && (power_domain_info->write_blocked ||
> +					   !capable(CAP_SYS_ADMIN)))
>  			return -EPERM;
>  
>  		offset = SST_CLOS_ASSOC_0_OFFSET +
> @@ -928,7 +929,7 @@ static int isst_if_set_perf_level(void __user *argp)
>  	if (!power_domain_info)
>  		return -EINVAL;
>  
> -	if (power_domain_info->write_blocked)
> +	if (power_domain_info->write_blocked || !capable(CAP_SYS_ADMIN))
>  		return -EPERM;
>  
>  	if (!(power_domain_info->pp_header.allowed_level_mask & BIT(perf_level.level)))
> @@ -988,7 +989,7 @@ static int isst_if_set_perf_feature(void __user *argp)
>  	if (!power_domain_info)
>  		return -EINVAL;
>  
> -	if (power_domain_info->write_blocked)
> +	if (power_domain_info->write_blocked || !capable(CAP_SYS_ADMIN))
>  		return -EPERM;
>  
>  	_write_pp_info("perf_feature", perf_feature.feature, SST_PP_CONTROL_OFFSET,
> 

