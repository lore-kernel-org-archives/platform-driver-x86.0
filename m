Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0063D9DCC
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774447726; cv=none; b=iI5putcJ7a3ygNMc+KPB0xoE8wK5y9k+R2JAm74C+abs2i8Py6SuqJj1GjV4NF1cW4gvOIBOZF6NZ6WND3XTD5qY/wo1stCif+ZPEPCdCO5yjoSU45MxqVnjNwYK4a6QgCLztAuSVqLdPn6H00hRMOVb2PLBgrfdsl591unAAWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774447726; c=relaxed/simple;
	bh=i69Qd87T55aFCCEbLOJB1kHCwc/g27gPZ3M1T/yq+YQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OECHmi1fmAPLBJwoczz7foW984p4hkHLcPOq62JR6+COLOFmfkS2lFUDOJRjc67CnuHtaoLRwPeYIGOi6wUNt4SU3zFjGhNvWV79rOKMZ5o4eAKDP+I3wRqnClBjySFL+7UBHwr9NdFZknVjXzVMyRNza4iJWhxlR4/W22EMaxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3NG08Yz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3NG08Yz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774447725; x=1805983725;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=i69Qd87T55aFCCEbLOJB1kHCwc/g27gPZ3M1T/yq+YQ=;
  b=H3NG08YzLJfOWXtTwY/o0YrcWYvnHdrYxeCG91qqSLpyoEzZEbzm/Pky
   Jln9LgYrGoZctKOJlnLE7pCBHnwdY42bJ4Uj2xYyxqpvtOpiI8bCwAq/q
   7U3UhyzlpaffoTHDh1mMv0FiXmOAnKQfooQiPvzTAquAJ8qc2vNGut0ZL
   uXhJCNGcKQ7lmqTAOVgcRJlMu6ODPJPOpa3zhij9coK6Q4WOQE3lwOOYt
   t2Qvsd7xwX8Y8nIRbr4jAHKwU6qBbWbXWPreFETK/Bl0/ATHzWKkv+bdq
   UHcwWA2HfATB2n4FEBctDUNl9mJGsqC57Sr/p0mqU+kbmw/zfIw4GqONh
   A==;
X-CSE-ConnectionGUID: iyBUkZNwSnanK2EARIKxDA==
X-CSE-MsgGUID: llL9MRwZTla9HL2X/UfFAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="63033600"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="63033600"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 07:08:44 -0700
X-CSE-ConnectionGUID: W0nvqljYRvCpqR3FySzjAQ==
X-CSE-MsgGUID: TOP/Cm/pRRS7IUTkV/R9uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224646374"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 07:08:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 16:08:38 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 2/7] platform/x86/amd/pmf: cache BIOS output values
 for user-space metrics via util IOCTL
In-Reply-To: <20260301131124.1370565-3-Shyam-sundar.S-k@amd.com>
Message-ID: <91669d3d-00f7-b360-6a9d-dc79952dae0e@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Mar 2026, Shyam Sundar S K wrote:

> Add a bios_output[] cache to amd_pmf_dev and store the latest values for
> BIOS output policies when applying PMF policies. This enables the AMD PMF
> util layer to expose these BIOS outputs alongside selected thermal and
> power metrics to user space via /dev/amdpmf_interface and a new IOCTL,
> supporting real-time monitoring tools such as SystemDeck.
> 
> The bios_output array is initialized to zero during device probe, and
> bounds checking is added to prevent potential buffer overflows when
> caching values.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c   |  3 +++
>  drivers/platform/x86/amd/pmf/pmf.h    |  1 +
>  drivers/platform/x86/amd/pmf/tee-if.c |  9 ++++++++-
>  drivers/platform/x86/amd/pmf/util.c   | 15 +++++++++++++++
>  include/uapi/linux/amd-pmf.h          | 22 +++++++++++++++++++++-
>  5 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 919d02f30aae..b5cab7c937ce 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -634,6 +634,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  
>  	pmf_device = dev->dev;
>  
> +	/* Initialize BIOS output cache for util layer */
> +	memset(dev->bios_output, 0, sizeof(dev->bios_output));

You allocate dev with devm_kzalloc() so why is this necessary?

> +
>  	err = amd_pmf_cdev_register(dev);
>  	if (err)
>  		dev_warn(dev->dev, "failed to register util interface: %d\n", err);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 6f61076a9386..0d879f0fd8e2 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -442,6 +442,7 @@ struct amd_pmf_dev {
>  	struct pmf_cbi_ring_buffer cbi_buf;
>  	struct mutex cbi_mutex;		     /* Protects ring buffer access */
>  	struct mutex metrics_mutex;
> +	u32 bios_output[10];
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 7ccd93f506b2..f749115bf970 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -98,10 +98,17 @@ static int amd_pmf_get_bios_output_idx(u32 action_idx)
>  static void amd_pmf_update_bios_output(struct amd_pmf_dev *pdev, struct ta_pmf_action *action)
>  {
>  	u32 bios_idx;
> +	int ret;
>  
>  	bios_idx = amd_pmf_get_bios_output_idx(action->action_index);
> +	if (bios_idx >= ARRAY_SIZE(pdev->bios_output)) {

Add include.

> +		dev_warn(pdev->dev, "BIOS output index %u out of bounds\n", bios_idx);

Add include.

> +		return;
> +	}
>  
> -	amd_pmf_smartpc_apply_bios_output(pdev, action->value, BIT(bios_idx), bios_idx);
> +	ret = amd_pmf_smartpc_apply_bios_output(pdev, action->value, BIT(bios_idx), bios_idx);

Somewhat unrelated to the change here, the include for BIT() is also 
missing (linux/bits.h). But I don't mind if you stick its addition into 
this patch since you're anyway touching this line.

> +	if (!ret)
> +		pdev->bios_output[bios_idx] = action->value;
>  }
>  
>  static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> index c6837caa44e0..59a125deb6b6 100644
> --- a/drivers/platform/x86/amd/pmf/util.c
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -22,6 +22,9 @@ static int amd_pmf_get_bios_idx(u32 control_code)
>  	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
>  		return control_code - IOCTL_BIOS_INPUT_1;
>  
> +	if (control_code >= IOCTL_BIOS_OUTPUT_1 && control_code <= IOCTL_BIOS_OUTPUT_10)
> +		return control_code - IOCTL_BIOS_OUTPUT_1;
> +
>  	return -EINVAL;
>  }
>  
> @@ -34,6 +37,15 @@ static long long amd_pmf_populate_bios_input(struct ta_pmf_enact_table *in, u32
>  	return (idx < 2) ? in->ev_info.bios_input_1[idx] : in->ev_info.bios_input_2[idx - 2];
>  }
>  
> +static long long amd_pmf_populate_bios_output(struct amd_pmf_dev *pdev, u32 control_code)
> +{
> +	u32 idx;
> +
> +	idx = amd_pmf_get_bios_idx(control_code);
> +
> +	return pdev->bios_output[idx];
> +}
> +
>  static long long amd_pmf_device_state(struct ta_pmf_enact_table *in, u32 control_code)
>  {
>  	switch (control_code) {
> @@ -101,6 +113,9 @@ static int amd_pmf_populate_data(struct device *dev, void __user *argp)
>  	case IOCTL_SOCKET_POWER:
>  		output.val = in->ev_info.socket_power;
>  		break;
> +	case IOCTL_BIOS_OUTPUT_1 ... IOCTL_BIOS_OUTPUT_10:
> +		output.val = amd_pmf_populate_bios_output(pdev, output.control_code);
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index d29431c67eaa..f93767248169 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -60,6 +60,16 @@
>   * @IOCTL_MAX_C0_RES: Query maximum C0 residency
>   * @IOCTL_SOCKET_POWER: Query current socket power consumption
>   * @IOCTL_TA_BIN_VER: Query Trusted Application binary version
> + * @IOCTL_BIOS_OUTPUT_1: Query BIOS output parameter 1
> + * @IOCTL_BIOS_OUTPUT_2: Query BIOS output parameter 2
> + * @IOCTL_BIOS_OUTPUT_3: Query BIOS output parameter 3
> + * @IOCTL_BIOS_OUTPUT_4: Query BIOS output parameter 4
> + * @IOCTL_BIOS_OUTPUT_5: Query BIOS output parameter 5
> + * @IOCTL_BIOS_OUTPUT_6: Query BIOS output parameter 6
> + * @IOCTL_BIOS_OUTPUT_7: Query BIOS output parameter 7
> + * @IOCTL_BIOS_OUTPUT_8: Query BIOS output parameter 8
> + * @IOCTL_BIOS_OUTPUT_9: Query BIOS output parameter 9
> + * @IOCTL_BIOS_OUTPUT_10: Query BIOS output parameter 10
>   *
>   * These control codes are used with the IOCTL_PMF_POPULATE_DATA ioctl
>   * to specify which metrics data to retrieve from the AMD PMF driver.
> @@ -90,7 +100,17 @@ enum pmf_ioctl_id {
>  	IOCTL_AVG_C0_RES = 36,
>  	IOCTL_MAX_C0_RES,
>  	IOCTL_SOCKET_POWER = 50,
> -	IOCTL_TA_BIN_VER
> +	IOCTL_TA_BIN_VER,
> +	IOCTL_BIOS_OUTPUT_1,
> +	IOCTL_BIOS_OUTPUT_2,
> +	IOCTL_BIOS_OUTPUT_3,
> +	IOCTL_BIOS_OUTPUT_4,
> +	IOCTL_BIOS_OUTPUT_5,
> +	IOCTL_BIOS_OUTPUT_6,
> +	IOCTL_BIOS_OUTPUT_7,
> +	IOCTL_BIOS_OUTPUT_8,
> +	IOCTL_BIOS_OUTPUT_9,
> +	IOCTL_BIOS_OUTPUT_10
>  };
>  
>  /**
> 

-- 
 i.

