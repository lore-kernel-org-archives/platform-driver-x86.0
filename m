Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014537;
	b=urpfYDGqV3aRUKR23f79atUws1g+/Ghq169N8SMj3gFf/R3PGTpIaC8riyu0EnAdHkxV
	 eRM7K2QNSQz5Xyx+lov5WfQ+4q+f2HfFctIkf3iaWUIadB/4ESRaPGAoa+dYRLe/AuOYV
	 THRN+4A916bWiQWqBhKZt3pyJ/RStj//XN2XiIaezM9hiC86G6G/7N49HCnjiNIKCBreV
	 seqG+I61l+KU2xI4yFf3Rkleo3QPfUhhq4WxfGH2K01Ba+nrk8CfGeFEgF9CI332uUr46
	 8bBE1gs6aQ0fTeL4n4NjKb6IwvI8clxyFA9Iv+38mCVqT22HUZyFpk4AdEDvBznfeqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014537;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=4OHQMJPWNrup3nZD389mB7Xj/VDf0cJ21as2/m6SjP4=;
	b=YmaqzjGTqAksdhWYWHSCtzjmAAsYYkKGIPVeMO3fTx3aSK0d5JAW1k2v2qkbPv6x9vEL
	 0wom4n1J0zYDN/wqVhTCpqLCaIxDF9Fpab+sCQJ2XIowPpzn7wr0qGwA8kXUW2POJANyq
	 qZVh7D80JDZKE4ZAopwc7pwfyUphP16SJflBANw2bzMN5x/zvIE+0g4wALM6lP+O6fEGE
	 l0rvhZCsDN7xc/uYCrKd79hcVbWu1sm4iJ7yZiQl1fvd4sdVuyq/INs0Bl0EOkaFmiDrR
	 vEuEoq1jvAM4Ge1BexWwGLu35+9omQNqQNNpaCd+TGyR1ABHskCaRzFOEta+EI8p6vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WwYtr+Ir;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6BB60A2601
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 15:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6BB60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WwYtr+Ir
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795014536; x=1826550536;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=T8g3WsiauLpzOp1PZOJgt4uUn9r1xHbsmVc7CFgOJZM=;
  b=WwYtr+IrysZIGxG3Cf0bRhvPzQAmbZZSLsJOivHnDmVRFihHDkmgf5Eo
   2OPVrPKbzmrDj6QzUs/BVxFI1s6LxlPxgDEOv/MRSGbpvTmYLr+bBUoFo
   4si8B3gKYiFAh8ScMOk5B32o0PKPeMoVfpmDUEm7ypNuITGAQh9FyUc0p
   2VokwE9VZV/3uuno7/7BqoC22+UR/eGNWCJHUSpyuOpwNk94WFnVziP7R
   eZoAJ7zvaQrueXbthaggudiF7P4jpQrcYYtMDOSEPSZL3X2fSNY/LPmCE
   EvqoBn3ybgHoesYsGspz6Xp5+5axa+IBxy4YPxoO/1gOlFSQkZA3rTzIx
   A==;
X-CSE-ConnectionGUID: OeXmXI7yTJGJhbfZrcRWUg==
X-CSE-MsgGUID: 2uqsuWwaT2ePiCsWlxxMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3714012"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3714012"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 07:08:51 -0800
X-CSE-ConnectionGUID: GtX/v5PAQi6GLEjs4iYHuA==
X-CSE-MsgGUID: WJJiBxgHR+CnuKbF7CGpCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12099487"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.239])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 07:08:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Nov 2026 17:08:45 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, 
    Mario Limonciello <superm1@kernel.org>
Subject: Re: [PATCH v3 10/10] platform/x86/amd/pmf: Add extended custom BIOS
 inputs for 1AH_M80H
In-Reply-To: <20261118143034.3566684-11-Shyam-sundar.S-k@amd.com>
Message-ID: <437433e4-378e-0fb3-5614-66955187f81a@linux.intel.com>
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com> <20261118143034.3566684-11-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Nov 2026, Shyam Sundar S K wrote:

> Earlier platforms support up to 10 custom BIOS inputs through the APMF
> SBIOS requests function. APMF 2.03 extends this to 20 inputs on
> 1AH_M80H: the SBIOS request structure gets a second set of 10 values,
> and inputs 11-20 have their own notification bits (16-25).
> 
> Add the APMF 2.03 SBIOS request structure and use it on 1AH_M80H. Size
> the ring buffer entries and the saved values for 20 inputs. Older
> platforms keep filling only the first 10 entries. Pass inputs 11-20 to
> the TA in the bios_input_3 fields of the v2 condition table, which were
> reserved until now.
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 32 +++++++++++++----
>  drivers/platform/x86/amd/pmf/pmf.h  | 54 +++++++++++++++++++++++++++--
>  drivers/platform/x86/amd/pmf/spc.c  | 11 +++---
>  3 files changed, 83 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 20e9603d5c08..4305dfe81c11 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -288,11 +288,18 @@ static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
>  		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>  			rb->data[rb->head].val[i] = pmf_dev->req.custom_policy[i];
>  		rb->data[rb->head].preq = pmf_dev->req.pending_req;
>  		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++)
> +			rb->data[rb->head].val[i] =
> +				(i < BIOS_INPUTS_MAX) ?
> +				pmf_dev->req_ext.custom_policy[i] :
> +				pmf_dev->req_ext.custom_policy_ext[i - BIOS_INPUTS_MAX];

Puuh... Please have this selection done in some simple get function like 
in some of the other cases. How disjoint we're going to end up with 
these... :-/

-- 
 i.

> +		rb->data[rb->head].preq = pmf_dev->req_ext.pending_req;
> +		break;
>  	default:
>  		return;
>  	}
> @@ -322,13 +329,24 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>  
>  	guard(mutex)(&pmf_dev->cb_mutex);
>  
> -	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
> -	if (ret) {
> -		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
> -		return;
> -	}
> +	if (is_amd_pmf_1ah_m80h(pmf_dev)) {
> +		ret = apmf_get_sbios_requests_v2_ext(pmf_dev, &pmf_dev->req_ext);
> +		if (ret) {
> +			dev_err(pmf_dev->dev, "Failed to get v2 ext SBIOS requests: %d\n", ret);
> +			return;
> +		}
>  
> -	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
> +		dev_dbg(pmf_dev->dev, "Pending request v2 ext (preq): 0x%x\n",
> +			pmf_dev->req_ext.pending_req);
> +	} else {
> +		ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
> +		if (ret) {
> +			dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
> +			return;
> +		}
> +
> +		dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
> +	}
>  
>  	amd_pmf_handle_early_preq(pmf_dev);
>  
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index a3b8e11b65a0..29f3dd8c06f2 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -165,6 +165,7 @@ struct cookie_header {
>  #define APTS_MAX_STATES		16
>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>  #define BIOS_INPUTS_MAX		10
> +#define BIOS_INPUTS_EXT_MAX	20
>  #define CUSTOM_BIOS_INPUT_RING_ENTRIES	64	/* Must be power of two for CIRC_* macros */
>  
>  /* amd_pmf_send_cmd() set/get */
> @@ -314,6 +315,21 @@ struct apmf_sbios_req_v2 {
>  	u32 custom_policy[BIOS_INPUTS_MAX];
>  } __packed;
>  
> +/* As per APMF 2.03 */
> +struct apmf_sbios_req_v2_ext {
> +	u16 size;
> +	u32 pending_req;
> +	u8 rsvd;
> +	u32 ppt_pmf;
> +	u32 ppt_pmf_apu_only;
> +	u32 stt_min_limit;
> +	u8 skin_temp_apu;
> +	u8 skin_temp_hs2;
> +	u32 custom_policy[BIOS_INPUTS_MAX];	/* inputs 1-10 */
> +	u8 asm_lite_ctrl;
> +	u32 custom_policy_ext[BIOS_INPUTS_MAX];	/* inputs 11-20 */
> +} __packed;
> +
>  struct apmf_fan_idx {
>  	u16 size;
>  	u8 fan_ctl_mode;
> @@ -643,7 +659,7 @@ enum power_modes_v2 {
>  };
>  
>  struct pmf_bios_inputs_prev {
> -	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
> +	u32 custom_bios_inputs[BIOS_INPUTS_EXT_MAX];
>  };
>  
>  /**
> @@ -652,7 +668,7 @@ struct pmf_bios_inputs_prev {
>   * @preq: Pending request value associated with this event
>   */
>  struct pmf_bios_input_entry {
> -	u32 val[BIOS_INPUTS_MAX];
> +	u32 val[BIOS_INPUTS_EXT_MAX];
>  	u32 preq;
>  };
>  
> @@ -750,6 +766,7 @@ struct amd_pmf_dev {
>  	const struct amd_pmf_ta_ops *ta_ops;
>  	struct amd_pmf_metrics_v3 smartpc_prev_metrics;	/* Smart PC delta baseline */
>  	bool smartpc_metrics_have_prev;
> +	struct apmf_sbios_req_v2_ext req_ext;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> @@ -1019,6 +1036,29 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
>  	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(16)},
>  };
>  
> +static const struct amd_pmf_pb_bitmap custom_bios_inputs_ext[] __used = {
> +	{"NOTIFY_CUSTOM_BIOS_INPUT1",  BIT(5)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT2",  BIT(6)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT3",  BIT(7)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT4",  BIT(8)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT5",  BIT(9)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT6",  BIT(10)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT7",  BIT(11)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT8",  BIT(12)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT9",  BIT(13)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT10", BIT(14)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT11", BIT(16)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT12", BIT(17)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT13", BIT(18)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT14", BIT(19)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT15", BIT(20)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT16", BIT(21)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT17", BIT(22)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT18", BIT(23)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT19", BIT(24)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT20", BIT(25)},
> +};
> +
>  /* Command ids for TA communication */
>  enum ta_pmf_command {
>  	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
> @@ -1208,7 +1248,7 @@ struct ta_pmf_condition_info_v2 {
>  	u32 workload_class;
>  	u32 video_enc_sessions;
>  	u32 video_dec_sessions;
> -	u32 rsvd[10];
> +	u32 bios_input_3[10];
>  };
>  
>  struct ta_pmf_enact_table_v2 {
> @@ -1416,6 +1456,12 @@ static inline int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_a
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
>  }
>  
> +static inline int apmf_get_sbios_requests_v2_ext(struct amd_pmf_dev *pdev,
> +						 struct apmf_sbios_req_v2_ext *req)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
> +}
> +
>  static inline int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev,
>  					     struct apmf_sbios_req_v2 *req)
>  {
> @@ -1484,6 +1530,8 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs_v2(struct ta_pmf_enact_table
>  		return in->ev_info.bios_input_1[index];
>  	case 2 ... 9:
>  		return in->ev_info.bios_input_2[index - 2];
> +	case 10 ... 19:
> +		return in->ev_info.bios_input_3[index - 10];
>  	default:
>  		return 0;
>  	}
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 35538732259a..ff80ee9048b7 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -53,7 +53,7 @@ void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_tabl
>  		amd_pmf_get_platform_type(in->ev_info.platform_type));
>  	dev_dbg(dev->dev, "Laptop placement: %s\n",
>  		amd_pmf_get_laptop_placement(in->ev_info.device_state));
> -	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++)
>  		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
>  			amd_pmf_get_ta_custom_bios_inputs_v2(in, i));
>  	dev_dbg(dev->dev, "==== TA v2 inputs END ====\n");
> @@ -100,6 +100,9 @@ static void amd_pmf_set_ta_custom_bios_input_v2(struct ta_pmf_enact_table_v2 *in
>  	case 2 ... 9:
>  		in->ev_info.bios_input_2[index - 2] = value;
>  		break;
> +	case 10 ... 19:
> +		in->ev_info.bios_input_3[index - 10] = value;
> +		break;
>  	}
>  }
>  
> @@ -128,8 +131,8 @@ static void amd_pmf_update_bios_inputs_v2(struct amd_pmf_dev *pdev,
>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> -		if (!(data->preq & custom_bios_inputs[i].bit_mask))
> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++) {
> +		if (!(data->preq & custom_bios_inputs_ext[i].bit_mask))
>  			continue;
>  		amd_pmf_set_ta_custom_bios_input_v2(in, i, data->val[i]);
>  		pdev->cb_prev.custom_bios_inputs[i] = data->val[i];
> @@ -160,7 +163,7 @@ static void amd_pmf_get_custom_bios_inputs_v2(struct amd_pmf_dev *pdev,
>  
>  	guard(mutex)(&pdev->cbi_mutex);
>  
> -	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++)
>  		amd_pmf_set_ta_custom_bios_input_v2(in, i, pdev->cb_prev.custom_bios_inputs[i]);
>  
>  	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0)
> 
