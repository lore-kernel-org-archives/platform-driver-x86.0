Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4F3A1A42
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456510; cv=none; b=lZLqYqLIRsxEWuHEZ4lFjr1Vw2+CRQjKiTf87qa8Z6ybxGiqqQExVmlQOFJdF+XRyonBmNGUUMOPEqAynf1jEG3fHQ6fDsYm1OOOdEUlLxfnOK8AIcqIb9+IwN/xUioc4agw+95x5/aPiMXxxfvH+GKdyMuLawJd0Xby442ZE6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456510; c=relaxed/simple;
	bh=iIanEIVca0msEajJmhUWsQ0lqFcxbtbvoheYg44Um/Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=smCgHd0BN26mRDTygkmgucXowxnpbNgjf7EjIEyvJ+HMnRBYlth3UgA4uGNBXcPKPf6VkEU7beeNVy3M5obgtzMJDWBQgMAQRhYUrvHglS0DiK2qICkImwgC5R4s5RhZRZ6tXeCcAhyLHgeoIKskCWRXiOlXUuwe4M3lSLL94ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3r0L5vs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3r0L5vs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779456509; x=1810992509;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iIanEIVca0msEajJmhUWsQ0lqFcxbtbvoheYg44Um/Y=;
  b=R3r0L5vs3ByJ3xOQ4/XW8CbKcRWrgv5dxNA736t+0eqNVmnXpEN4EAtf
   MWp6hYa7OYCDjwCqeHx5yZ0iUtwKyT94jppC+Taq1VdGI8OhmnlI9qS+q
   9eQliAvD9z2/HAWnXo9P+uh/Lg5q1aZ40AY73lJuGmvMbY/6BnykvtkOI
   FYaw/PfbvY53DTOB1G2y+yIk0fl91KHV2kr6Y8zmWbXsJEkkBV2joLEHa
   ESsB4UexoDpUIqgDPzKY29Re7AbV53FuoN7V0uyu3Sf+q09a2Lb14L7wO
   Vr2yDp/Ha+yt7Wl26ZLPiENB3emEG5/FiqZXvEKhfbA5s8846bXUPrYZg
   A==;
X-CSE-ConnectionGUID: oG56XIv0RPGH+I2NbXI68g==
X-CSE-MsgGUID: gMTsj7EjTVeLJxo+FAxPGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80236699"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80236699"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:28:28 -0700
X-CSE-ConnectionGUID: KdXBIMJKS9O+x5E0XGKjAA==
X-CSE-MsgGUID: PJzAZE3nSCOUMbh0cwpAsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="241143323"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:28:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 16:28:23 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v5 2/8] platform/x86/amd/pmf: store BIOS output values
 for user-space metrics via util IOCTL
In-Reply-To: <20260520185424.770772-3-Shyam-sundar.S-k@amd.com>
Message-ID: <a5ed6736-a854-d219-a6b5-29f55542221e@linux.intel.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com> <20260520185424.770772-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, Shyam Sundar S K wrote:

> Add a bios_output[] to amd_pmf_dev struct and store the latest values for
> BIOS output policies when applying PMF policies. This enables the AMD PMF
> util layer to expose these BIOS outputs alongside selected thermal and
> power metrics to user space via /dev/amdpmf_interface and a new IOCTL,
> supporting real-time monitoring tools such as SystemDeck.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  2 ++
>  drivers/platform/x86/amd/pmf/tee-if.c | 11 ++++++++++-
>  include/uapi/linux/amd-pmf.h          |  1 +
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 6f61076a9386..ffe74ebc46f8 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -130,6 +130,7 @@ struct cookie_header {
>  #define GET_CMD		true
>  
>  #define METRICS_TABLE_ID	7
> +#define BIOS_OUTPUT_MAX		10
>  
>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>  
> @@ -442,6 +443,7 @@ struct amd_pmf_dev {
>  	struct pmf_cbi_ring_buffer cbi_buf;
>  	struct mutex cbi_mutex;		     /* Protects ring buffer access */
>  	struct mutex metrics_mutex;
> +	u32 bios_output[BIOS_OUTPUT_MAX];
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 7ccd93f506b2..be8062c6691d 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -8,7 +8,9 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/array_size.h>
>  #include <linux/debugfs.h>
> +#include <linux/dev_printk.h>
>  #include <linux/tee_drv.h>
>  #include <linux/uuid.h>
>  #include "pmf.h"
> @@ -98,10 +100,17 @@ static int amd_pmf_get_bios_output_idx(u32 action_idx)
>  static void amd_pmf_update_bios_output(struct amd_pmf_dev *pdev, struct ta_pmf_action *action)
>  {
>  	u32 bios_idx;
> +	int ret;
>  
>  	bios_idx = amd_pmf_get_bios_output_idx(action->action_index);
> +	if (bios_idx >= ARRAY_SIZE(pdev->bios_output)) {

amd_pmf_get_bios_output_idx() can return -EINVAL but it is never checked 
(a pre-existing problem) and value is directly going to an unsigned type 
(noted by sashiko).

> +		dev_warn(pdev->dev, "BIOS output index %u out of bounds\n", bios_idx);
> +		return;
> +	}
>  
> -	amd_pmf_smartpc_apply_bios_output(pdev, action->value, BIT(bios_idx), bios_idx);
> +	ret = amd_pmf_smartpc_apply_bios_output(pdev, action->value, BIT(bios_idx), bios_idx);
> +	if (!ret)
> +		pdev->bios_output[bios_idx] = action->value;
>  }
>  
>  static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index c7099e7f463f..d29a4abe1145 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -55,6 +55,7 @@ struct amd_pmf_info {
>  
>  	/* BIOS parameters */
>  	__u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
> +	__u32 bios_output[AMD_PMF_BIOS_PARAMS_MAX];
>  };
>  
>  #endif /* _UAPI_LINUX_AMD_PMF_H */
> 

-- 
 i.

