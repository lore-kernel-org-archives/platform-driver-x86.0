Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150F819CC0A
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 Nov 2024 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463094; cv=none; b=L8svRzzr6YOA1g4XKMynWkI+r2SAYaJldWkGKwLLQlsndEMqe8qbT2EOz2NtZyg7PTcgmdiBnHPN7HIatvf8pNhLH22aMa/Soack+P8Zd6bb/YvAlk9UOUq1cuXRtYWALRugPKYjEPjiI601pXCxyw5RwBTNq+jIcbhpyGWm9bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463094; c=relaxed/simple;
	bh=pvSoi3PocIyYMrqd3NpDDd0mS78WTxyD+YJnq0g3uS0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZG2aGDZ/G7IfDsZJIxlZXUe8kul6jQl1L3Sb6bpz1ZODeRX6vbLm2aJEkpOI6b1wnDyT6epcYPHGku4XeACrumSAD/hVW8Unx42oHOcOxFlj87ftD5BaVL+v3Rd1K9ocAiiHQkwbgJCQ75X+jDZ851nGwO945rTSq4+foAi+okk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfVtNUMC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfVtNUMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730463092; x=1761999092;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pvSoi3PocIyYMrqd3NpDDd0mS78WTxyD+YJnq0g3uS0=;
  b=DfVtNUMCAdYWtCi4NsiORTMqZZxYrqXsPG++D/GDobf9fQWbZ+gqnf1S
   1xMvgrGwQR1osfS4V1LgW+NdUVXiXrlLZbED9VVPpRSm+2HRv5PShjbCc
   FJt4RNAn1/7eue6HRQCbdwE1oNdbGBU6NzWzoqoXntr/XnPPVxzDRef99
   CiFM1+unrQXJdVjiSW/qL1U5kzpJRH1wdcMRQMToAgXbsSKzI6aj2Js38
   BYPbMcZB1fdh3fPMyyQndfZQ6zq93NpuRoyPsP+SQdJpFx2+1BhcqM8I0
   oRQcXtOudteLPcyaLZlPXXqZkcBfmuK3fKGpgxLVtF5tnIfRQxoSHvD5/
   Q==;
X-CSE-ConnectionGUID: tNoHjZlrRQ+LMwL7M9BjKA==
X-CSE-MsgGUID: MPUztEVvQi+04YXLoTrFTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30440534"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="30440534"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:11:32 -0700
X-CSE-ConnectionGUID: TpVaSwI9QOy05quUWUmUDQ==
X-CSE-MsgGUID: Q9Cys2BqQzCqCjotRtD69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="87487494"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:11:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 1 Nov 2024 14:11:26 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 7/8] platform/x86/amd/pmc: Add STB support for AMD
 Desktop variants
In-Reply-To: <20241029155440.3499273-8-Shyam-sundar.S-k@amd.com>
Message-ID: <f16a0977-0f3b-cdee-880e-fdffc69ac84b@linux.intel.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com> <20241029155440.3499273-8-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Oct 2024, Shyam Sundar S K wrote:

> Previously, AMD's Ryzen Desktop SoCs did not include support for STB.
> However, to accommodate this recent change, PMFW has implemented a new
> message port pair mechanism for handling messages, arguments, and
> responses, specifically designed for distinguishing from Mobile SoCs.
> Therefore, it is necessary to update the driver to properly handle this
> incoming change.
> 
> Add a new function amd_stb_update_args() to simply the arguments that
> needs to be passed between S2D supported Mobile SoCs vs Desktop SoCs.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/mp1_stb.c | 31 +++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 917c111b31c9..6a3cfcbb614e 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -36,6 +36,11 @@
>  #define AMD_S2D_REGISTER_RESPONSE	0xA80
>  #define AMD_S2D_REGISTER_ARGUMENT	0xA88
>  
> +/* STB S2D(Spill to DRAM) message port offset for 44h model */

Add space before (

I know there might be some older ones lying around with the incorrect 
spacing but lets not add any new ones.

> +#define AMD_GNR_REGISTER_MESSAGE	0x524
> +#define AMD_GNR_REGISTER_RESPONSE	0x570
> +#define AMD_GNR_REGISTER_ARGUMENT	0xA40
> +
>  static bool enable_stb;
>  module_param(enable_stb, bool, 0644);
>  MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> @@ -239,12 +244,31 @@ static const struct file_operations amd_stb_debugfs_fops_v2 = {
>  	.release = amd_stb_debugfs_release_v2,
>  };
>  
> +static void amd_stb_update_args(struct amd_pmc_dev *dev)
> +{
> +	if (cpu_feature_enabled(X86_FEATURE_ZEN5))
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x44:
> +			dev->stb_arg.msg = AMD_GNR_REGISTER_MESSAGE;
> +			dev->stb_arg.arg = AMD_GNR_REGISTER_ARGUMENT;
> +			dev->stb_arg.resp = AMD_GNR_REGISTER_RESPONSE;
> +			return;

default branch missing.

> +	}

Eh? That's a weird indentation for sure. :-)

Both levels of this nested construct need braces, please.

-- 
 i.

> +
> +	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;
> +	dev->stb_arg.arg = AMD_S2D_REGISTER_ARGUMENT;
> +	dev->stb_arg.resp = AMD_S2D_REGISTER_RESPONSE;
> +}
> +
>  static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
>  {
>  	switch (dev->cpu_id) {
>  	case AMD_CPU_ID_YC:
>  	case AMD_CPU_ID_CB:
> -		dev->stb_arg.s2d_msg_id = 0xBE;
> +		if (boot_cpu_data.x86_model == 0x44)
> +			dev->stb_arg.s2d_msg_id = 0x9B;
> +		else
> +			dev->stb_arg.s2d_msg_id = 0xBE;
>  		break;
>  	case AMD_CPU_ID_PS:
>  		dev->stb_arg.s2d_msg_id = 0x85;
> @@ -260,10 +284,7 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
>  		return false;
>  	}
>  
> -	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;
> -	dev->stb_arg.arg = AMD_S2D_REGISTER_ARGUMENT;
> -	dev->stb_arg.resp = AMD_S2D_REGISTER_RESPONSE;
> -
> +	amd_stb_update_args(dev);
>  	return true;
>  }
>  
> 

