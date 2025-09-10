Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8850F239E65
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Sep 2025 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757500311; cv=none; b=KQMQ76pLqR2Tg4HMGYl4YaMDZVTxn+vAM8+ZBc+UaYOaQT3QzN2/OJEWGBNrTzO3OkzzPOw+kGdIQVpN3t3RXTVoJDGTf7hy3I97Yi4Fed25aLsyWe+D9oE6Iqyp2YwcQTU35K3Bo0RH7eSXyJz9+NMzOll+MBw3b+/vLp8ZLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757500311; c=relaxed/simple;
	bh=pPLnocAZJ3iQOCTIuhqZQb7Pb0LPKM1i14LyDkgpjJk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RJrOGXh0lZ5Pb9DHLxJjiBuOwIcGl3F1hdkv+zoJFbMedcJNVM5F9zVkcRyJXq2H++9nfrUs1Mmv8MtG1Iz/FYxuPi9+WBz1qXX1lIvDuOVmJ5sHkGqTKqb7k3G7rgSnydIqK2dVGWjMwQ/O6hgFPZuT60649G0e6BShayFFCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T35ry8e/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T35ry8e/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757500310; x=1789036310;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pPLnocAZJ3iQOCTIuhqZQb7Pb0LPKM1i14LyDkgpjJk=;
  b=T35ry8e/K1Mdwp+fWZrBWmJ87YHKZW/lxZNbnx7qW+8nozbbyUE0fD7W
   ZrWKd34QN+FGZuvQK1wsEGdjFuQ29OFmZspCSTsjQUzFQ3Li0V7WrlM7A
   t6nGNnA+TgwKqCcQdiw72+sfZwcp3QEIvKB/KBdig21pzrcGXv00kEaKK
   zJwjperxTFmrPGkLt/YyJR/yS7DLkzjfAM4PL3sRffljVjgVUaTye06gr
   YJboiF+rbe8RiiHgcpjD6EAP4W188OAw3eZpkXLITbuDeen0Fy7yFFOTQ
   nSCHyckuSmJpw3BH5IxkLtIrbpEKJbFDC9Vny0cSq/OM0qksS/49oMoMh
   g==;
X-CSE-ConnectionGUID: gnT7X0sKSB6gMwaiJA7/ig==
X-CSE-MsgGUID: BCiULIeQR5CCB04fMSScFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77413050"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="77413050"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:31:49 -0700
X-CSE-ConnectionGUID: IE0wcd/JTqaseO4puoNsZg==
X-CSE-MsgGUID: fUlgBf+/RQS3uhYndNb9Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="210474791"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:31:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Sep 2025 13:31:42 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, 
    Yijun Shen <Yijun.Shen@dell.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: Re: [PATCH v5 RESEND 6/9] platform/x86/amd/pmf: Add custom BIOS
 input support for AMD_CPU_ID_PS
In-Reply-To: <20250901110140.2519072-7-Shyam-sundar.S-k@amd.com>
Message-ID: <2ba64be3-34c8-b9e5-549a-8548571168c2@linux.intel.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com> <20250901110140.2519072-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Sep 2025, Shyam Sundar S K wrote:

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
>  drivers/platform/x86/amd/pmf/acpi.c | 58 ++++++++++++++++++++++++++---
>  drivers/platform/x86/amd/pmf/pmf.h  | 22 +++++++++++
>  drivers/platform/x86/amd/pmf/spc.c  | 36 +++++++++++++++---
>  3 files changed, 105 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 4982311ac045..41c34c26ceec 100644
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
> @@ -427,6 +444,11 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
>  }
>  
> +static apmf_event_handler_t apmf_event_handlers[] = {
> +	[PMF_IF_V1] = apmf_event_handler_v1,
> +	[PMF_IF_V2] = apmf_event_handler_v2,
> +};
> +
>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>  {
>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> @@ -446,13 +468,26 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>  		apmf_event_handler(ahandle, 0, pmf_dev);
>  	}
>  
> -	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2) {
> +	if (!pmf_dev->smart_pc_enabled)
> +		return -EINVAL;

Hi,

Is this change okay? Previously this function returned 0 in this case.

-- 
 i.

> +
> +	switch (pmf_dev->pmf_if_version) {
> +	case PMF_IF_V1:
> +		if (!is_apmf_bios_input_notifications_supported(pmf_dev))
> +			break;
> +		fallthrough;
> +	case PMF_IF_V2:
>  		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
> -						     apmf_event_handler_v2, pmf_dev);
> +				apmf_event_handlers[pmf_dev->pmf_if_version], pmf_dev);
>  		if (ACPI_FAILURE(status)) {
> -			dev_err(pmf_dev->dev, "failed to install notify handler for custom BIOS inputs\n");
> +			dev_err(pmf_dev->dev,
> +				"failed to install notify handler v%d for custom BIOS inputs\n",
> +				pmf_dev->pmf_if_version);
>  			return -ENODEV;
>  		}
> +		break;
> +	default:
> +		break;
>  	}
>  
>  	return 0;
> @@ -506,8 +541,21 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS))
>  		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler);
>  
> -	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2)
> -		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v2);
> +	if (!pmf_dev->smart_pc_enabled)
> +		return;
> +
> +	switch (pmf_dev->pmf_if_version) {
> +	case PMF_IF_V1:
> +		if (!is_apmf_bios_input_notifications_supported(pmf_dev))
> +			break;
> +		fallthrough;
> +	case PMF_IF_V2:
> +		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
> +					   apmf_event_handlers[pmf_dev->pmf_if_version]);
> +		break;
> +	default:
> +		break;
> +	}
>  }
>  
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 6ddd1a6e9115..647993e94674 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -120,6 +120,8 @@ struct cookie_header {
>  #define APTS_MAX_STATES		16
>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>  
> +typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
> +
>  /* APTS PMF BIOS Interface */
>  struct amd_pmf_apts_output {
>  	u16 table_version;
> @@ -187,6 +189,24 @@ struct apmf_sbios_req {
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
> @@ -379,6 +399,7 @@ struct amd_pmf_dev {
>  	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
>  	struct mutex cb_mutex;
>  	u32 notifications;
> +	struct apmf_sbios_req_v1 req1;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> @@ -835,6 +856,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
> +int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req);
>  int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
>  
>  void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 06b7760b2a8b..1b612e79a3d8 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -132,22 +132,46 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
>  	}
>  }
>  
> +static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req,
> +				       const struct amd_pmf_pb_bitmap *inputs,
> +				       const u32 *custom_policy, struct ta_pmf_enact_table *in)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> +		if (!(pending_req & inputs[i].bit_mask))
> +			continue;
> +		amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
> +	}
> +}
> +
>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  					   struct ta_pmf_enact_table *in)
>  {
> -	unsigned int i;
> +	if (!(pdev->req.pending_req || pdev->req1.pending_req))
> +		return;
>  
> -	if (!pdev->req.pending_req)
> +	if (!pdev->smart_pc_enabled)
>  		return;
>  
> -	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> -		if (!(pdev->req.pending_req & custom_bios_inputs[i].bit_mask))
> -			continue;
> -		amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
> +	switch (pdev->pmf_if_version) {
> +	case PMF_IF_V1:
> +		if (!is_apmf_bios_input_notifications_supported(pdev))
> +			return;
> +		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
> +					   pdev->req1.custom_policy, in);
> +		break;
> +	case PMF_IF_V2:
> +		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
> +					   pdev->req.custom_policy, in);
> +		break;
> +	default:
> +		break;
>  	}
>  
>  	/* Clear pending requests after handling */
>  	memset(&pdev->req, 0, sizeof(pdev->req));
> +	memset(&pdev->req1, 0, sizeof(pdev->req1));
>  }
>  
>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
> 
