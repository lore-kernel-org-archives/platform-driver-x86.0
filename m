Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8622221ADC5
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Aug 2025 15:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756395354; cv=none; b=GQPuYov2nHw/AWjSlWgUrKutKUZp/2ITnjLhqNSbi9sTwQb01qtq+Xqx16CviRVcYGzWMYK7tbjwCTMOWtPM+HLJBbafGjyWvQAvTwzoi+FpsRBP9/FScvDET0DV94rypfRCc/Ud8pA578cGhJIEagq+hDb9smk/teJJBLoTees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756395354; c=relaxed/simple;
	bh=A0Xk+LZcHeHkln3GYoQ0EIOpjgxSif0LKziOL42oN/Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HspXz8mqVJPZff4CUfUaAUQWm1vt/kqKANgVbSrmDgm+nqApAYWWpcXMdRDdQefcOLxLmByhCqppHrI02EGSwNQwmVZG8CMNOeGGqaAOslQ/1O+u6LQAZKl7x3oVZCp56G0DPTHG/B2XhGYFuPg6HEiA/xzaJ00VmA5wZuqKsEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoXugULU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoXugULU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756395353; x=1787931353;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=A0Xk+LZcHeHkln3GYoQ0EIOpjgxSif0LKziOL42oN/Q=;
  b=YoXugULUYgnZqoJ+KjW9lGte/17GDiyKXaDAGKqs/Kw3dCRGEeDo399h
   irgCSl5omMsgig0nQxR62p+d9aeAbAKTUWVGxPlOgdToie6cyCMsLfb5v
   OKvdQhwJUmzZBTvYwDaIVqcsplAAUA/GOlYqBVaqMAyQG0NZ9SBd1QY1u
   6n3HLh1HmP/x0q/rHRd5EGD2fxYDgOszH1oTALNkuupgj9GM4OgV+7XA7
   14Y/YKDsNv4a6Wk3ktRAQUU1R0EVjRNfgG0zjBuUtGDziASN5GH+I8/xg
   zVY872nFw1CZyoCaS2N9tTaOCbOCL7j9RfV6Wiig9a1AoCi3fO1Z8mu1V
   g==;
X-CSE-ConnectionGUID: 5nAsd5HjTi2OODp5y7pheQ==
X-CSE-MsgGUID: nrdBq5nfQ6q4+g6FY4e16w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58595594"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58595594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 08:35:52 -0700
X-CSE-ConnectionGUID: lctZ2E5dQ1iUfqlUW/VEpw==
X-CSE-MsgGUID: ti1mccK9R1mqCrhVCPm3JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169663687"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 08:35:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 Aug 2025 18:35:45 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, 
    Yijun Shen <Yijun.Shen@dell.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: Re: [PATCH v4 6/9] platform/x86/amd/pmf: Add custom BIOS input
 support for AMD_CPU_ID_PS
In-Reply-To: <20250820115011.1448026-7-Shyam-sundar.S-k@amd.com>
Message-ID: <3b312b78-4637-c591-fa27-abfd1ab67e66@linux.intel.com>
References: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com> <20250820115011.1448026-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Aug 2025, Shyam Sundar S K wrote:

> The PMF ACPI Specification (APMF) has been revised to version 1.3 to allow
> for additional custom BIOS inputs, enabling OEMs to have more precise
> thermal management of the system. This update includes adding support to
> the driver using the new data structure received from the BIOS through the
> existing APMF interfaces.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 33 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 20 +++++++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c  | 29 +++++++++++++++++++------
>  3 files changed, 75 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 4982311ac045..4b8529c9bdd4 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -320,6 +320,11 @@ int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
>  }
>  
> +int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
> +}
> +
>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
>  {
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
> @@ -338,6 +343,18 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>  		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
>  }
>  
> +static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
> +{
> +	struct amd_pmf_dev *pmf_dev = data;
> +	int ret;
> +
> +	guard(mutex)(&pmf_dev->cb_mutex);
> +
> +	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
> +	if (ret)
> +		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
> +}
> +
>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>  {
>  	struct amd_pmf_dev *pmf_dev = data;
> @@ -446,6 +463,17 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>  		apmf_event_handler(ahandle, 0, pmf_dev);
>  	}
>  
> +	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V1 &&
> +	    is_apmf_bios_input_notifications_supported(pmf_dev)) {
> +		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
> +						     apmf_event_handler_v1, pmf_dev);
> +		if (ACPI_FAILURE(status)) {
> +			dev_err(pmf_dev->dev,
> +				"failed to install notify handler v1 for custom BIOS inputs\n");
> +			return -ENODEV;
> +		}
> +	}
> +
>  	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2) {
>  		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
>  						     apmf_event_handler_v2, pmf_dev);
> @@ -508,6 +536,11 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  
>  	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2)
>  		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v2);
> +
> +	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V1 &&
> +	    is_apmf_bios_input_notifications_supported(pmf_dev)) {
> +		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v1);
> +	}

There's quite much overlap here and in the other similar case above so I 
think the better structure would be:

	if (!pmf_dev->smart_pc_enabled)
		return;

	switch (pmf_dev->pmf_if_version) {
		case PMF_IF_V1:
			if (!is_apmf_bios_input_notifications_supported(pmf_dev))
				break;
			fallthough;
		case PMF_IF_V2:
			acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
						   apmf_event_handlers[pmf_dev->pmf_if_version]);
			break;

		default:
			break;
	}

(While the v2 conversion could be made in own patch, I think these seem 
isolated enough that diff should be clean enough without a separate 
conversion patch.)

>  }
>  
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index b705461a6ff8..54bd33104ded 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -188,6 +188,24 @@ struct apmf_sbios_req {
>  	u8 skin_temp_hs2;
>  } __packed;
>  
> +/* As per APMF spec 1.3 */
> +struct apmf_sbios_req_v1 {
> +	u16 size;
> +	u32 pending_req;
> +	u8 rsvd;
> +	u8 cql_event;
> +	u8 amt_event;
> +	u32 fppt;
> +	u32 sppt;
> +	u32 sppt_apu_only;
> +	u32 spl;
> +	u32 stt_min_limit;
> +	u8 skin_temp_apu;
> +	u8 skin_temp_hs2;
> +	u8 enable_cnqf;
> +	u32 custom_policy[10];
> +} __packed;
> +
>  struct apmf_sbios_req_v2 {
>  	u16 size;
>  	u32 pending_req;
> @@ -380,6 +398,7 @@ struct amd_pmf_dev {
>  	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
>  	struct mutex cb_mutex;
>  	u32 notifications;
> +	struct apmf_sbios_req_v1 req1;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> @@ -836,6 +855,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
> +int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req);
>  int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
>  
>  void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 06b7760b2a8b..f50cfd37b480 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -132,22 +132,37 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
>  	}
>  }
>  
> -static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
> -					   struct ta_pmf_enact_table *in)
> +static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req,
> +				       const struct amd_pmf_pb_bitmap *inputs,
> +				       const u32 *custom_policy, struct ta_pmf_enact_table *in)
>  {
> -	unsigned int i;
> -
> -	if (!pdev->req.pending_req)
> -		return;
> +	int i;

Why this change? Generally, it's preferred to have 0...n counting for loop 
iterators as unsigned int.

>  
>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> -		if (!(pdev->req.pending_req & custom_bios_inputs[i].bit_mask))
> +		if (!(pending_req & inputs[i].bit_mask))
>  			continue;
>  		amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
>  	}
> +}
> +
> +static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
> +					   struct ta_pmf_enact_table *in)
> +{
> +	if (!(pdev->req.pending_req || pdev->req1.pending_req))
> +		return;
> +
> +	if (pdev->smart_pc_enabled && pdev->pmf_if_version == PMF_IF_V1 &&
> +	    is_apmf_bios_input_notifications_supported(pdev)) {
> +		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
> +					   pdev->req1.custom_policy, in);
> +	} else {

Here you're not checking PMF_IF_V2, is that omission intentional?

This too would be better as switch.

> +		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
> +					   pdev->req.custom_policy, in);
> +	}
>  
>  	/* Clear pending requests after handling */
>  	memset(&pdev->req, 0, sizeof(pdev->req));
> +	memset(&pdev->req1, 0, sizeof(pdev->req1));
>  }
>  
>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
> 

-- 
 i.

