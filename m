Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4F532255F
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601581; cv=none; b=rEo6DnMt7IJ4IwnGbS2maIs3yky//zPvezVvX90jp/kNqlHO3CHn0RK40Mj5jfcNYNwQkOdUvUbzmA2+NXBFnVEaju3ylN/0E7mVsd6jbhKFNSXEVB9sI/wJdDlNiNshdqPvO1T8jS6zevsNb2E2Prou87wCCf/jsQxm5FGAgPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601581; c=relaxed/simple;
	bh=rwjnyvos+wwbQMXCtxzw6Ho7Nc/nQdYys4wORa2KXUU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FxTZ/qS4dddU+SHDR7IW8SX1yMiZyxC4ekTJSNKktPbQ+8eQCG8sSjBj+NSs3zkq4Q713Mtfs1xTUgaBu9jjGnqEsIZMzkNpeUO2M98yTX80efX3hGTlwfUvzYa1o/pbbFvaDvpcMoWIqV2N1YusGH7COwoJWb86xllsotOBZps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5lCpSTX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5lCpSTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755601580; x=1787137580;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rwjnyvos+wwbQMXCtxzw6Ho7Nc/nQdYys4wORa2KXUU=;
  b=S5lCpSTXogzbOnGWR07EEkV73FLECFwWHbCP3lY27PkQ+/ElZqQAP2Yl
   RTCLWtsucgULyRpru4nCzne8cm+PuCa6t/jHyr9LOLeL9pQhfwhxlAKXT
   jwfykCWzRjN64xv4zMM401xzurNDdtvLxpxqCC0kEau7fdRElJxARDUQW
   N5hTQXV7NVp3QAULimeC1bWr4jExRI4Edn34jyNvfxR3QXDtDu3x/DuE6
   IMnzX+1INZ1YzcNq4rSsIL2Ch77zRRWZ2cqY2/8znFTNOWWBPS48Krt2a
   b1cV8dhKJuw3e+wHs0pYwK8y4eP9qVIVtaXadsomZMu1yU0maxvIep2+a
   w==;
X-CSE-ConnectionGUID: o7nHr5UTR+S9hhEj9TAuYw==
X-CSE-MsgGUID: 4Kv6DJDATAWjq6+wI1GWNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68444537"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="68444537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:06:19 -0700
X-CSE-ConnectionGUID: THwu/FZzS+yERsWlGVAREg==
X-CSE-MsgGUID: wHwI7DqyQAOLrOQmrsfVWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168223791"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:06:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 14:06:13 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH v3 2/9] platform/x86/amd/pmf: Fix the custom bios input
 handling mechanism
In-Reply-To: <20250723064121.2051232-3-Shyam-sundar.S-k@amd.com>
Message-ID: <0f057e4f-621c-5b96-fd84-f88e3ecc99a5@linux.intel.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com> <20250723064121.2051232-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Shyam Sundar S K wrote:

> Originally, the 'amd_pmf_get_custom_bios_inputs()' function was written
> under the assumption that the BIOS would only send a single pending
> request for the driver to process. However, following OEM enablement, it
> became clear that multiple pending requests for custom BIOS inputs might
> be sent at the same time, a scenario that the current code logic does not
> support when it comes to handling multiple custom BIOS inputs.
> 
> To address this, the code logic needs to be improved to not only manage
> multiple simultaneous custom BIOS inputs but also to ensure it is scalable
> for future additional inputs.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h | 15 ++++++------
>  drivers/platform/x86/amd/pmf/spc.c | 37 +++++++++++++++++++++---------
>  2 files changed, 33 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 1a5a8d70c360..79defe2c91e6 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -623,14 +623,14 @@ enum ta_slider {
>  	TA_MAX,
>  };
>  
> -enum apmf_smartpc_custom_bios_inputs {
> -	APMF_SMARTPC_CUSTOM_BIOS_INPUT1,
> -	APMF_SMARTPC_CUSTOM_BIOS_INPUT2,
> +struct amd_pmf_pb_bitmap {
> +	const char *name;
> +	u32 bit_mask;
>  };
>  
> -enum apmf_preq_smartpc {
> -	NOTIFY_CUSTOM_BIOS_INPUT1 = 5,
> -	NOTIFY_CUSTOM_BIOS_INPUT2,
> +static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
> +	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
>  };
>  
>  enum platform_type {
> @@ -690,8 +690,7 @@ struct ta_pmf_condition_info {
>  	u32 power_slider;
>  	u32 lid_state;
>  	bool user_present;
> -	u32 bios_input1;
> -	u32 bios_input2;
> +	u32 bios_input_1[2];
>  	u32 monitor_count;
>  	u32 rsvd2[2];
>  	u32 bat_design;
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 1d90f9382024..3e3f5a2473bc 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -90,29 +90,44 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
>  	dev_dbg(dev->dev, "Laptop placement: %s\n",
>  		laptop_placement_as_str(in->ev_info.device_state));
> -	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
> -	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
> +	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input_1[0]);
> +	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input_1[1]);

Please convert this to loop + helper in this patch, not in the next one.

>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
>  #else
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
>  #endif
>  
> +/*
> + * This helper function sets the appropriate BIOS input value in the TA enact
> + * table based on the provided index. We need this approach because the custom
> + * BIOS input array is not continuous, due to the existing TA structure layout.
> + */
> +static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int index, u32 value)
> +{
> +	switch (index) {
> +	case 0:

case 1:

(these can use the same code)

> +		in->ev_info.bios_input_1[index] = value;
> +		break;
> +	case 1:
> +		in->ev_info.bios_input_1[index] = value;
> +		break;

...And remove this duplicated case.

> +	default:
> +		return;
> +	}
> +}
> +
>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  					   struct ta_pmf_enact_table *in)
>  {
> +	int i;

unsigned int

> +
>  	if (!pdev->req.pending_req)
>  		return;
>  
> -	switch (pdev->req.pending_req) {
> -	case BIT(NOTIFY_CUSTOM_BIOS_INPUT1):
> -		in->ev_info.bios_input1 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT1];
> -		break;
> -	case BIT(NOTIFY_CUSTOM_BIOS_INPUT2):
> -		in->ev_info.bios_input2 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT2];
> -		break;
> -	default:
> -		dev_dbg(pdev->dev, "Invalid preq for BIOS input: 0x%x\n", pdev->req.pending_req);
> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> +		if (pdev->req.pending_req & custom_bios_inputs[i].bit_mask)

Reverse logic + continue.

> +			amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);

This approach will definitely look better in the end, thanks for doing 
the conversion. :-)

-- 
 i.

