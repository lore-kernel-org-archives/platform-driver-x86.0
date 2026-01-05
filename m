Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF829DB9A;
	Mon,  5 Jan 2026 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626155; cv=none; b=nOPh+Nj+lA2pVP1XgSuKLHn0lHMdcQibHU3g7SHBFVuR3IrhWEGJwF1MNRKR5JvXMN6id0VwmNI0+AXhBZk7RFD+BrfZMKCoZd3xCNRqwPO6Ur0+5SDmIXRllipT5DvJ+Ug9AC2N4s7MDKG4jpfuFEeuj4iU/CG5rYz9X/2Mg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626155; c=relaxed/simple;
	bh=gMLoDKz2cvfYBEWjPaShuAxnFyEjqUoj2pBB8uyZxFI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YQnsG8VOCxOp7fK8E5toMPC8wXKsmfkZeZHqIE2Q1dWgf9/lfs4LlyCmCeLDxYQJbwlZPAFexevW+LbBn4rK5sZKZytk7+lZ4iHM1ZHq3lbr6xc+OnxJ/twEV09ElsKsTcAdAoJKKiL39KtJzBp/MyoEWVxfxUuaNVb0g4HPPYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWV82RGY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWV82RGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767626154; x=1799162154;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gMLoDKz2cvfYBEWjPaShuAxnFyEjqUoj2pBB8uyZxFI=;
  b=DWV82RGYzpMT+WNUXHrIDSyEUMCLRsoPy9Vlf0YkzswEBMoCZ9tTAXBw
   68N3gBtxofDpQKiDbyzetL+AWZvvCDR8oGPfaxlsx2lVGsShMJZZTtsuV
   i7XeW6beBPZv2fVQ7TRrHmc81dPSTybM3Fv8PTnNHqiMV0rVzepeS3QkY
   rH/Ro38/ONQjaUxcWSQBWJ0imj8N4n00sGwP1KMUNoU2L+pZvmVMmohlv
   vKAp/4TmLlwsCa0eZrkdkT5vo/R4FWUowKJLEhIB9Jsy9kMBtHX9ewjvb
   ftLsOdeUExiKLsgCbpwJ2fMMdweeLoOpfCvKgAps0uPnl7VRIfcZ0y/WI
   w==;
X-CSE-ConnectionGUID: AQGjxhHnTueAFyM9L3Kf3g==
X-CSE-MsgGUID: nTacXrK3ShGayAKdAFhNJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="56552113"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="56552113"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:15:53 -0800
X-CSE-ConnectionGUID: jb6+nXk5TPWmsOy8qrLLLw==
X-CSE-MsgGUID: 11jPP/BnQX2UbeZ2YPbkMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="201533761"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:15:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Jan 2026 17:15:47 +0200 (EET)
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: ISST: Optimize suspend/resume callbacks
In-Reply-To: <20251229183602.823275-1-srinivas.pandruvada@linux.intel.com>
Message-ID: <daa60cbc-5266-374b-d5ee-8295a83764d3@linux.intel.com>
References: <20251229183602.823275-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Dec 2025, Srinivas Pandruvada wrote:

> If SST-CP or SST-PP is not supported then don't store configuration
> during suspend callback and restore during resume callback.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  .../x86/intel/speed_select_if/isst_tpmi_core.c  | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index a624e0b2991f..5c4e1b4c0131 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -1721,6 +1721,9 @@ void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
>  }
>  EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_remove, "INTEL_TPMI_SST");
>  
> +#define SST_PP_CAP_MASK_BIT_CP_ENABLE	0
> +#define SST_PP_CAP_MASK_BIT_PP_ENABLE	1
> +
>  void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
>  {
>  	struct tpmi_sst_struct *tpmi_sst = auxiliary_get_drvdata(auxdev);
> @@ -1741,6 +1744,9 @@ void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
>  		if (!pd_info || !pd_info->sst_base)
>  			continue;
>  
> +		if (!(pd_info->sst_header.cap_mask & BIT(SST_PP_CAP_MASK_BIT_CP_ENABLE)))

Please put BIT() directly in the defines.

-- 
 i.

> +			goto process_pp_suspend;
> +
>  		cp_base = pd_info->sst_base + pd_info->sst_header.cp_offset;
>  
>  		pd_info->saved_sst_cp_control = readq(cp_base + SST_CP_CONTROL_OFFSET);
> @@ -1749,6 +1755,10 @@ void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
>  		memcpy_fromio(pd_info->saved_clos_assocs, cp_base + SST_CLOS_ASSOC_0_OFFSET,
>  			      sizeof(pd_info->saved_clos_assocs));
>  
> +process_pp_suspend:
> +		if (!(pd_info->sst_header.cap_mask & BIT(SST_PP_CAP_MASK_BIT_PP_ENABLE)))
> +			continue;
> +
>  		pd_info->saved_pp_control = readq(pd_info->sst_base +
>  						  pd_info->sst_header.pp_offset +
>  						  SST_PP_CONTROL_OFFSET);
> @@ -1776,6 +1786,9 @@ void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
>  		if (!pd_info || !pd_info->sst_base)
>  			continue;
>  
> +		if (!(pd_info->sst_header.cap_mask & BIT(SST_PP_CAP_MASK_BIT_CP_ENABLE)))
> +			goto process_pp_resume;
> +
>  		cp_base = pd_info->sst_base + pd_info->sst_header.cp_offset;
>  		writeq(pd_info->saved_sst_cp_control, cp_base + SST_CP_CONTROL_OFFSET);
>  		memcpy_toio(cp_base + SST_CLOS_CONFIG_0_OFFSET, pd_info->saved_clos_configs,
> @@ -1783,6 +1796,10 @@ void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
>  		memcpy_toio(cp_base + SST_CLOS_ASSOC_0_OFFSET, pd_info->saved_clos_assocs,
>  			    sizeof(pd_info->saved_clos_assocs));
>  
> +process_pp_resume:
> +		if (!(pd_info->sst_header.cap_mask & BIT(SST_PP_CAP_MASK_BIT_PP_ENABLE)))
> +			continue;
> +
>  		writeq(pd_info->saved_pp_control, power_domain_info->sst_base +
>  		       pd_info->sst_header.pp_offset + SST_PP_CONTROL_OFFSET);
>  	}
> 
