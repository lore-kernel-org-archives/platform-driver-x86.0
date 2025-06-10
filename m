Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C446246BAC
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 16:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572447; cv=none; b=Eg7KD0gZYiv36Kbcwryewhn11MBW1KX2ricHRTGEHx4CrE0dlF5sXSbsGXI2IOX3p5JD2MTkow4B+y/exgw6LeELgRueMGs8M7ehUK5948FxuN/ItK/0bR0ES/6yskYEPgj8AExExdTD0jS5OpHgj3rcjoFucU7RNjpplRtVspI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572447; c=relaxed/simple;
	bh=+tDusi+vTiogrVyMkqhg2CCTWoCL2lyS5C/bpER5L/A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=E2ztJn/0SzHrM2scn3qSyeqnpfcMJCY26YWTriPrKY7Nr9ecFonbWgddRLBpGA6pEYbnGVxZbJq0Mx7ldoxwYj7Gu0TpCQrIKPLSCIiVUtkc40MbRGrxPAv0UI5xJaDUULNTQWINpSbP6iqRZFdnyr7EnYHOBfiZiUE66O4F8VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqI0Y1ul; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqI0Y1ul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749572446; x=1781108446;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+tDusi+vTiogrVyMkqhg2CCTWoCL2lyS5C/bpER5L/A=;
  b=RqI0Y1ulZpMVkZQaLgJ8M6X2Lr/im3sDtJzws2Ejx/B9yTmCSSYc1oaG
   ZQY2DU/oCw265ZgyO3OWkFQkIt2uC+EV5oCoqhj0pN/buBD38PDmQOy2L
   aUbQ+h5MpPnKrNS+sbduUDFxzFJTe1susWufmCIwoMCmTPJ0VogxHNH30
   MfrGrQwuRsiez18qThAoBxhvn1NOmYeueV4DOmQmyp4g9Y6+8FmMHtHtH
   KHZWoZqhSlfQQZp8D9yGqL5l+JSx+Cdce3r6JT8NJ0eIW9GvsWMdIk2eI
   L5BMbcLclPkO8oTt2Vkq3KR1C46rEa79xfg//djzNRgecTzSJ/o4Hngho
   g==;
X-CSE-ConnectionGUID: 1kz+cP53TTWQGV7sER4VDA==
X-CSE-MsgGUID: nVCH0KjZR5SfIpkNwQ4f0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55498249"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="55498249"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 09:19:57 -0700
X-CSE-ConnectionGUID: wXdLFeZUTWK9016muowTNg==
X-CSE-MsgGUID: p4ojga+KTmuGtihUVI/cUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="146787215"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 09:19:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Jun 2025 19:19:49 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH 09/10] platform/x86/amd/pmf: Call enact function sooner
 to process early pending requests
In-Reply-To: <20250509072654.713629-10-Shyam-sundar.S-k@amd.com>
Message-ID: <20e8a15a-0abe-6f14-37f9-d570dcec70b8@linux.intel.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com> <20250509072654.713629-10-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 May 2025, Shyam Sundar S K wrote:

> Call the amd_pmf_invoke_cmd_enact() function to manage early pending
> requests and their associated custom BIOS inputs. Additionally, add a
> return statement for cases of failure.
> 
> The PMF driver will adjust power settings according to custom BIOS inputs
> after assessing the policy conditions.
> 
> Cc: Yijun Shen <Yijun.Shen@dell.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c   | 18 ++++++++++++++++--
>  drivers/platform/x86/amd/pmf/pmf.h    |  2 ++
>  drivers/platform/x86/amd/pmf/tee-if.c |  3 ++-
>  3 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 1521988c1002..a3319ac89fd1 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -339,8 +339,15 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>  	guard(mutex)(&pmf_dev->cb_mutex);
>  
>  	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
> -	if (ret)
> +	if (ret) {
>  		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
> +		return;
> +	}
> +
> +	if (pmf_dev->cb_flag) {
> +		amd_pmf_invoke_cmd_enact(pmf_dev);
> +		pmf_dev->cb_flag = false;
> +	}
>  }
>  
>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
> @@ -351,8 +358,15 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>  	guard(mutex)(&pmf_dev->cb_mutex);
>  
>  	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
> -	if (ret)
> +	if (ret) {
>  		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
> +		return;
> +	}
> +
> +	if (pmf_dev->cb_flag) {
> +		amd_pmf_invoke_cmd_enact(pmf_dev);
> +		pmf_dev->cb_flag = false;
> +	}

Why isn't there another function which can be called by both???

>  }
>  
>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index d9e6467be852..71cc94bdbd32 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -404,6 +404,7 @@ struct amd_pmf_dev {
>  	u32 notifications;
>  	struct apmf_sbios_req_v1 req1;
>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
> +	bool cb_flag; /* To handle first custom BIOS input */

Please more the comment more to right, preferrably align it with the 
previous line.

>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> @@ -891,5 +892,6 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
>  /* Smart PC - TA interfaces */
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
>  
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 679c5bf5faca..249683509635 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -223,7 +223,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	}
>  }
>  
> -static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
> +int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  {
>  	struct ta_pmf_shared_memory *ta_sm = NULL;
>  	struct ta_pmf_enact_result *out = NULL;
> @@ -559,6 +559,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  		switch (ret) {
>  		case TA_PMF_TYPE_SUCCESS:
>  			status = true;
> +			dev->cb_flag = true;
>  			break;
>  		case TA_ERROR_CRYPTO_INVALID_PARAM:
>  		case TA_ERROR_CRYPTO_BIN_TOO_LARGE:
> 

-- 
 i.

