Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEE9322DB8
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 11:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602440; cv=none; b=dyDEe1Q+krsHMllPHGCTOqyCNIKc5xZtlMp++7OPXaTra6LNbPqH/lEPv+rrmc43n3+Udr93X/3RAY/EpTRW54eV7OcYSCsdArnLBQ00COmveDjF7YX20F1sBvfY9fPEkYmDf3ggIdYUoUeHaRflE1QeXUfL5q6unOwCDYzK4Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602440; c=relaxed/simple;
	bh=7ZJ1XggBNSWW3M4M76ZsPuk2/GMRw7ifaLBm9iNUX28=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ubpfUdftVlJUhnVK/4DHHFnORXV5FEVwJ5XHLXjahIKYM7Yko0jXZVlFPCzhfEC6HiHvOwPWrRmf2co8tiz1HQbroOZsEN+hWSMLBlVN8ZJTqBL8DXHB+ac9vxqWyErZ3T9iOKh5qVnI6hvajXTJLOhD3FWGLg175OhBywgVSHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KprUgpV3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KprUgpV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755602439; x=1787138439;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7ZJ1XggBNSWW3M4M76ZsPuk2/GMRw7ifaLBm9iNUX28=;
  b=KprUgpV3GQ7sVscgOLksA4y0VX5cualSDGSXUNt7Z/sY3STlrB5dRP4N
   aeawkLPrOuZJhcfYWnmLBWbAdOgcQ6AW6dKJ6DWJmOc6qRI1IOTq1edWc
   +IZn3Tisx3VigtEND8qGg0fN2uxdENPVBcpgvnhsCGhfOME9bkomsRr1c
   jPCA2xK1prDzVPmoLm1iCaL9BnGeQfhJnc/R4GBFYYqPm9LDlTqdjYxDI
   9tCyak0aD0Q7KLSfdpvDnBMZDsu8IytP2EYrOj+xw3UqUur+hrxSw7614
   hz8U7c3gQL3pxKYEW5nDZSJKOLFnEwtc2VtxLFXbiQjicejHNrV2dmmob
   Q==;
X-CSE-ConnectionGUID: 8G+ZctAOQgStkqQRvZnm9w==
X-CSE-MsgGUID: dsXIkE2ISHWxfXSEObyKAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="45415407"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="45415407"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:20:38 -0700
X-CSE-ConnectionGUID: c46ogkYFQZyQuaVgm6e0rg==
X-CSE-MsgGUID: jtvAdns9TKeOERSIjItrXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167782329"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:20:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 14:20:32 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH v3 8/9] platform/x86/amd/pmf: Call enact function sooner
 to process early pending requests
In-Reply-To: <20250723064121.2051232-9-Shyam-sundar.S-k@amd.com>
Message-ID: <ec6d6d81-a574-ee08-a62c-7672769bdfab@linux.intel.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com> <20250723064121.2051232-9-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Shyam Sundar S K wrote:

> Call the amd_pmf_invoke_cmd_enact() function to manage early pending
> requests and their associated custom BIOS inputs. Additionally, add a
> return statement for cases of failure.

No return statements are added into amd_pmf_invoke_cmd_enact() ??

> The PMF driver will adjust power settings according to custom BIOS inputs
> after assessing the policy conditions.
> 
> Additionally, add a new common routine amd_pmf_handle_early_preq() to
> handle early bios pending requests for both v1 and v2 variants.
> 
> Cc: Yijun Shen <Yijun.Shen@dell.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c   | 21 +++++++++++++++++++--
>  drivers/platform/x86/amd/pmf/pmf.h    |  2 ++
>  drivers/platform/x86/amd/pmf/tee-if.c |  6 ++++--
>  3 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 4b8529c9bdd4..7f95a8b6c1a7 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -331,6 +331,15 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>  									 req, sizeof(*req));
>  }
>  
> +static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
> +{
> +	if (!pdev->cb_flag)
> +		return;
> +
> +	amd_pmf_invoke_cmd_enact(pdev);
> +	pdev->cb_flag = false;
> +}
> +
>  static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>  {
>  	struct amd_pmf_dev *pmf_dev = data;
> @@ -339,8 +348,12 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>  	guard(mutex)(&pmf_dev->cb_mutex);
>  
>  	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
> -	if (ret)
> +	if (ret) {
>  		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
> +		return;
> +	}
> +
> +	amd_pmf_handle_early_preq(pmf_dev);
>  }
>  
>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
> @@ -351,8 +364,12 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>  	guard(mutex)(&pmf_dev->cb_mutex);
>  
>  	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
> -	if (ret)
> +	if (ret) {
>  		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
> +		return;
> +	}
> +
> +	amd_pmf_handle_early_preq(pmf_dev);
>  }
>  
>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index c1b2bcc22acf..5a86a71a9a70 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -406,6 +406,7 @@ struct amd_pmf_dev {
>  	u32 notifications;
>  	struct apmf_sbios_req_v1 req1;
>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
> +	bool cb_flag;			     /* To handle first custom BIOS input */
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> @@ -886,5 +887,6 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
>  /* Smart PC - TA interfaces */
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
>  
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index b29f92183b2a..6e8116bef4f6 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -225,7 +225,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	}
>  }
>  
> -static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
> +int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  {
>  	struct ta_pmf_shared_memory *ta_sm = NULL;
>  	struct ta_pmf_enact_result *out = NULL;
> @@ -577,8 +577,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  		ret = amd_pmf_start_policy_engine(dev);
>  		dev_dbg(dev->dev, "start policy engine ret: %d\n", ret);
>  		status = ret == TA_PMF_TYPE_SUCCESS;
> -		if (status)
> +		if (status) {
> +			dev->cb_flag = true;
>  			break;
> +		}
>  		amd_pmf_tee_deinit(dev);
>  	}
>  
> 

-- 
 i.

