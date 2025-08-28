Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA7423BF8F
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Aug 2025 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756395380; cv=none; b=b2yv03PGl/Oa6vkpdrA1rQ4giyui9veESPMXCmgTUvsxMwHOsRNgexKOLrTSFd9HSWxvkrnq16usQvpa9SdX/cp89sFCchEMixpOTavaX70X7dRJDpxS/a1IAbtdxijs/Qm9SYkF7faUG0c2646xYLF5JOaj6js4/r1NhiS3ZCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756395380; c=relaxed/simple;
	bh=za4qbtg3NQ9fdHE2H3bWDf06wO+2H9JZsAkpaoPsi3E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dXNy/Rw2qEh8OY9/c3pNFeONN+YKZUO00V3R/4hPs0g3bHW3dbOtDxNgyg9b/AV1MMXkTtwZGULVqiz/zK8HXdO49qhDmaG+F/ao657Q1DM22kMV6nBCLggfly+ZT2qRtcNEcZ/Y5gD4eqwbI2qjZguQuncVXQAOBx3WJV7mG5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5KKuGKe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5KKuGKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756395379; x=1787931379;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=za4qbtg3NQ9fdHE2H3bWDf06wO+2H9JZsAkpaoPsi3E=;
  b=U5KKuGKev+pf9ZdPpEhh88jdEfMAwW6bN/vByiNl6eiZBY24Fb880wD0
   MKhOH4atfbKHBic3+pOgGDkFcauxmix5qG+6qdYSxMo5yl0Sw6tMCPnct
   8pHWTCXQ/QoJvXa6dt4WKtCry2X3BU19rP+wTOqb2BoI1OgN95Sy0zZeM
   YWls69eadDwT0KESBGAemUntBfgsIRarvGxVP7lNYq9wZKeth/Hu08VfE
   MSMRjIWSext6fFfaPICz2qliBnCyzsFioxIbog5JbeAsCjJpYUOCS9CVT
   FDSRFOX5KJ3oc3eFelUjkJG+j5lHwJCar76NQgQU83X9f4EjjwmeKdSPI
   A==;
X-CSE-ConnectionGUID: pmTzNfa1RtWF14bLNScr4A==
X-CSE-MsgGUID: EE5T4bfJTkmukdSs1KWFNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58595642"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58595642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 08:36:19 -0700
X-CSE-ConnectionGUID: K7xFVQz/STC3AqDZKgpNUg==
X-CSE-MsgGUID: tL6rl8CITQKuqM4DYXZ74Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169663781"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 08:36:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 Aug 2025 18:36:13 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, 
    Yijun Shen <Yijun.Shen@dell.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: Re: [PATCH v4 5/9] platform/x86/amd/pmf: Add helper to verify BIOS
 input notifications are enable/disable
In-Reply-To: <20250820115011.1448026-6-Shyam-sundar.S-k@amd.com>
Message-ID: <a07e799d-9830-1bfe-8c9c-b821e69df58c@linux.intel.com>
References: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com> <20250820115011.1448026-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Aug 2025, Shyam Sundar S K wrote:

> Implement a helper function to check if BIOS input notifications are
> enabled or disabled.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 17 +++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index f75f7ecd8cd9..4982311ac045 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -161,6 +161,11 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
>  	return !!(pdev->supported_func & BIT(index - 1));
>  }
>  
> +int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev)
> +{
> +	return !!(pdev->notifications & CUSTOM_BIOS_INPUT_BITS);
> +}
> +
>  int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
>  				       struct amd_pmf_apts_granular_output *data, u32 apts_idx)
>  {
> @@ -385,6 +390,7 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
>  
>  	pdev->pmf_if_version = output.version;
>  
> +	pdev->notifications =  output.notification_mask;
>  	return 0;
>  }
>  
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index f5e874b10f0f..b705461a6ff8 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -118,6 +118,8 @@ struct cookie_header {
>  #define PMF_IF_V2		2
>  
>  #define APTS_MAX_STATES		16
> +#define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
> +

Extra empty line.

>  /* APTS PMF BIOS Interface */
>  struct amd_pmf_apts_output {
> @@ -377,6 +379,7 @@ struct amd_pmf_dev {
>  	struct resource *res;
>  	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
>  	struct mutex cb_mutex;
> +	u32 notifications;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> @@ -641,6 +644,19 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
>  	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(14)},
>  };
>  
> +static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
> +	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(7)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(8)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT3",     BIT(9)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT4",     BIT(10)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT5",     BIT(11)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT6",     BIT(12)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT7",     BIT(13)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT8",     BIT(14)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT9",     BIT(15)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(16)},
> +};
> +
>  enum platform_type {
>  	PTYPE_UNKNOWN = 0,
>  	LID_CLOSE,
> @@ -792,6 +808,7 @@ int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
>  int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
>  int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
>  u32 fixp_q88_fromint(u32 val);
> +int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> 

-- 
 i.

