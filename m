Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013428;
	b=jvbAkSZ/hpMco7dzKMkeuJg324mOzwYYsUZ8if9sieTmoykj84h814H5GFB9a8CbBpn1
	 2BaWcWz2fKP+8gqRRltmSzEnsPC3pbdUDHTlGvf2l2IYUxN34/ZsEaNmC4zDx5Iz7/hci
	 KzgLpsp1tabYncFfaESInXjKW5BVgEbv4mWFLU33NppNai3Qnv2NviP9EomMpu1mZ/Cqf
	 NCve5hG7o2CaS0aZN3wbNPGrmgWlH+JkWEImfnmiJUuhFzTk44Ju4yA2Wxx3yPBIr+de6
	 G0JiGLtWFj5XLrg4c+5RRYETNQTrB686y3XGO08QyIDnFd0oDdHuHVKdVqP+DTpfuHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013428;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=ewZUhdD52nMyxhQ+NOKeDvCUqIzzEasd+VSYZ6THydc=;
	b=bQdIkyeb7YvrEvpejibrxAbgtyDhIYOASel33iPQKT6i84t//IFbxW6OlEkqhacbqrMR
	 oIad0tYJ4fZWxADoI6FyimoRF+i7Ha2QJk6yPiVE3IXoMhmh2dp3BkOHmfL/aNlvngpY3
	 NuBMHbktGqZy3zpGPjvbHSXAk8KgFR9+/FLUwok5epxiVrd8lM0FN24wzo7lMUrYgLj8O
	 e0Fvdg6wYpvkgdsQIiuu8MuHs1c0PCDpQVFDamQEcNQrC33tgPmpxsgFIQLwxKu7Rifvg
	 d6XSqvKoaKZt7X7QIMzW3N9sO+GJSmq0pZaju6CHlHr3Q4vTyY1i12TKGKzD53dYkoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fEEkzxG2;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B90606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fEEkzxG2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795013427; x=1826549427;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Cs+WxZxLHztL9pfvO75gwIRvgGeUWbUfwmIgNmReP9w=;
  b=fEEkzxG21+mLfrQMKpnP3Yd/nGDmxpq9KLmy19MiKwe+ZThHFVdEfenE
   Dg+KN729oGmPCT1+s6Jb24eqC/5VGZ72G5ULvR1pRRsdqPdfE9jOjiHx4
   uFQNkRsZGdu7G5NtRE5TBBncHUPdPRI8jkuv1R+lhfporWqBcVhSLymHJ
   pIsp4HRM7DE4l7HYIM1AyAx93gGTBfYX2eIt9hAJb7huurUrtLfL5yk/m
   7XaU4SK0YeI4ZMNVCpFo0LoS6EOxwJWijV/F4jUS0VaQg+QfeWYpyY9V0
   v6FwXWn50EpERKM20DX8WafdRJIbRMy5PG/DvfTGwKq6i0wm8dIf/nqnM
   Q==;
X-CSE-ConnectionGUID: 5mhMCXI3RLqYGmjbVIEBaA==
X-CSE-MsgGUID: 3zBaN1caQk+OgK+YanRKRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3816773"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3816773"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 06:50:27 -0800
X-CSE-ConnectionGUID: sKw52pyKT4+e7wLH4qrEag==
X-CSE-MsgGUID: W0nZ3kwXQmG7nLEn/+W3IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10523050"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.239])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 06:50:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Nov 2026 16:50:20 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, 
    Mario Limonciello <superm1@kernel.org>
Subject: Re: [PATCH v3 02/10] platform/x86/amd/pmf: Add 1AH_M80H static slider
 support
In-Reply-To: <20261118143034.3566684-3-Shyam-sundar.S-k@amd.com>
Message-ID: <09e5c2c3-507e-095e-35ae-5374c04fb07b@linux.intel.com>
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com> <20261118143034.3566684-3-Shyam-sundar.S-k@amd.com>
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

> 1AH_M80H follows APMF specification 2.03, which changes the APTS table
> layout and uses a different set of SMU message IDs to program the
> static slider power limits.
> 
> Add the new APTS table structures and use them on 1AH_M80H to read the
> slider defaults from the BIOS and to program them with the new SMU
> message IDs. Other platforms keep using the existing path.
> 
> If reading the APTS defaults fails, do not program the slider limits on
> 1AH_M80H, so that zeroed limits are never sent to the SMU.
> 
> Key changes include:
>  - Add the 1AH_M80H SMU message IDs for SPPT, FPPT and STT limits
>  - Add struct amd_pmf_apts_output_v2 as per APMF 2.03
>  - Add amd_pmf_load_apts_defaults_sps_v3() and amd_pmf_update_slider_v3()
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h | 45 ++++++++++++++
>  drivers/platform/x86/amd/pmf/sps.c | 97 +++++++++++++++++++++++++++++-
>  2 files changed, 140 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index b29c5192d878..226c3aa50500 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -82,8 +82,15 @@ struct cookie_header {
>  #define SET_PMF_PPT_APU_ONLY   0x26
>  
>  /* Message IDs for 1AH_M80H platform */
> +#define SET_1AH_M80H_STT_MIN_LIMIT		0x06
> +#define SET_1AH_M80H_STT_LIMIT_APU		0x07
> +#define SET_1AH_M80H_STT_LIMIT_HS2		0x08
>  #define GET_1AH_M80H_METRICS_TABLE_LOG_SAMPLE	0x0E
>  #define GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR	0x0F
> +#define SET_1AH_M80H_PMF_FPPT_APU_ONLY		0x10
> +#define SET_1AH_M80H_PMF_SPPT_APU_ONLY		0x11
> +#define SET_1AH_M80H_PMF_FPPT_SPM		0x12
> +#define SET_1AH_M80H_PMF_SPPT_SPM		0x13
>  
>  /* OS slider update notification */
>  #define DC_BEST_PERF		0
> @@ -173,11 +180,34 @@ struct amd_pmf_apts_output {
>  	u8 stt_skin_temp_limit_hs2;
>  } __packed;
>  
> +/* As per APMF Spec 2.03 */
> +struct amd_pmf_apts_output_v2 {
> +	u16 table_version;
> +	u32 fan_table_idx;
> +	u32 pmf_slow_ppt;
> +	u32 ppt_pmf_apu_only;
> +	u32 stt_min_limit;
> +	u8 stt_skin_temp_limit_apu;
> +	u8 stt_skin_temp_limit_hs2;
> +	u32 pmf_fast_ppt;
> +	u32 ppt_fast_pmf_apu_only;
> +} __packed;
> +
> +struct amd_pmf_apts_granular_output_v2 {
> +	u16 size;
> +	struct amd_pmf_apts_output_v2 val;
> +} __packed;
> +
>  struct amd_pmf_apts_granular_output {
>  	u16 size;
>  	struct amd_pmf_apts_output val;
>  } __packed;
>  
> +struct amd_pmf_apts_granular_v2 {
> +	u16 size;
> +	struct amd_pmf_apts_output_v2 states[APTS_MAX_STATES];
> +};
> +
>  struct amd_pmf_apts_granular {
>  	u16 size;
>  	struct amd_pmf_apts_output val[APTS_MAX_STATES];
> @@ -1115,6 +1145,11 @@ static inline bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev
>  	}
>  }
>  
> +static inline bool is_amd_pmf_1ah_m80h(struct amd_pmf_dev *pdev)
> +{
> +	return pdev->cpu_id == PCI_DEVICE_ID_AMD_1AH_M80H_ROOT;
> +}
> +
>  /**
>   * fixp_q88_fromint: Convert integer to Q8.8
>   * @val: input value
> @@ -1143,6 +1178,16 @@ const char *amd_pmf_source_as_str(unsigned int state);
>  int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
>  int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
>  
> +static inline int
> +apts_get_static_slider_granular_v3(struct amd_pmf_dev *pdev,
> +				   struct amd_pmf_apts_granular_output_v2 *data, u32 apts_idx)
> +{
> +	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +		return -EINVAL;
> +
> +	return apts_if_call_store_buffer(pdev, apts_idx, data, sizeof(*data));
> +}
> +
>  static inline int
>  apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
>  				   struct amd_pmf_apts_granular_output *data, u32 apts_idx)
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index b0031afae33b..938ce34e7f94 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -8,11 +8,18 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/array_size.h>
> +#include <linux/dev_printk.h>
> +#include <linux/printk.h>
> +#include <linux/string.h>
> +
>  #include "pmf.h"
>  
>  static struct amd_pmf_static_slider_granular_v2 config_store_v2;
>  static struct amd_pmf_static_slider_granular config_store;
>  static struct amd_pmf_apts_granular apts_config_store;
> +static struct amd_pmf_apts_granular_v2 apts_config_store_v2;
> +static bool apts_config_store_v2_valid;
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
>  static const char *slider_v2_as_str(unsigned int state)
> @@ -97,6 +104,27 @@ static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v
>  	pr_debug("Static Slider APTS state index data - END\n");
>  }
>  
> +static void amd_pmf_dump_apts_sps_defaults_v2(struct amd_pmf_apts_granular_v2 *info)
> +{
> +	int i;
> +
> +	pr_debug("Static Slider APTS index default v2 values data - BEGIN\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(info->states); i++) {
> +		pr_debug("Table Version[%d] = %u\n", i, info->states[i].table_version);
> +		pr_debug("Fan Index[%d] = %u\n", i, info->states[i].fan_table_idx);
> +		pr_debug("PMF Slow PPT[%d] = %u\n", i, info->states[i].pmf_slow_ppt);
> +		pr_debug("PPT PMF APU[%d] = %u\n", i, info->states[i].ppt_pmf_apu_only);
> +		pr_debug("STT Min[%d] = %u\n", i, info->states[i].stt_min_limit);
> +		pr_debug("STT APU[%d] = %u\n", i, info->states[i].stt_skin_temp_limit_apu);
> +		pr_debug("STT HS2[%d] = %u\n", i, info->states[i].stt_skin_temp_limit_hs2);
> +		pr_debug("PMF Fast PPT[%d] = %u\n", i, info->states[i].pmf_fast_ppt);
> +		pr_debug("PPT Fast PMF APU[%d] = %u\n", i, info->states[i].ppt_fast_pmf_apu_only);
> +	}
> +
> +	pr_debug("Static Slider APTS index default v2 values data - END\n");
> +}
> +
>  static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info)
>  {
>  	int i;
> @@ -119,8 +147,34 @@ static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info)
>  static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
>  static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data) {}
>  static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info) {}
> +static void amd_pmf_dump_apts_sps_defaults_v2(struct amd_pmf_apts_granular_v2 *info) {}
>  #endif
>  
> +static int amd_pmf_load_apts_defaults_sps_v3(struct amd_pmf_dev *pdev)
> +{
> +	struct amd_pmf_apts_granular_output_v2 output;
> +	int i, ret;
> +
> +	memset(&apts_config_store_v2, 0, sizeof(apts_config_store_v2));
> +	apts_config_store_v2_valid = false;
> +
> +	for (i = 0; i < ARRAY_SIZE(apts_config_store_v2.states); i++) {
> +		ret = apts_get_static_slider_granular_v3(pdev, &output, i);
> +		if (ret) {
> +			dev_err(pdev->dev, "Failed to read APTS v2 defaults: %d\n", ret);
> +			return ret;
> +		}
> +
> +		apts_config_store_v2.states[i] = output.val;
> +	}
> +
> +	apts_config_store_v2_valid = true;
> +
> +	amd_pmf_dump_apts_sps_defaults_v2(&apts_config_store_v2);
> +
> +	return 0;
> +}
> +
>  static void amd_pmf_load_apts_defaults_sps_v2(struct amd_pmf_dev *pdev)
>  {
>  	struct amd_pmf_apts_granular_output output;
> @@ -190,6 +244,30 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>  	amd_pmf_dump_sps_defaults(&config_store);
>  }
>  
> +static void amd_pmf_update_slider_v3(struct amd_pmf_dev *dev, int idx)
> +{
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_SPM, SET_CMD,
> +			 apts_config_store_v2.states[idx].pmf_slow_ppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_APU_ONLY, SET_CMD,
> +			 apts_config_store_v2.states[idx].ppt_pmf_apu_only, NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_MIN_LIMIT, SET_CMD,
> +			 apts_config_store_v2.states[idx].stt_min_limit, NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_APU, SET_CMD,
> +			 fixp_q88_fromint(apts_config_store_v2.states[idx].stt_skin_temp_limit_apu),
> +			 NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_HS2, SET_CMD,
> +			 fixp_q88_fromint(apts_config_store_v2.states[idx].stt_skin_temp_limit_hs2),
> +			 NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_SPM, SET_CMD,
> +			 apts_config_store_v2.states[idx].pmf_fast_ppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_APU_ONLY, SET_CMD,
> +			 apts_config_store_v2.states[idx].ppt_fast_pmf_apu_only, NULL);
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX) &&
> +	    apts_config_store_v2.states[idx].fan_table_idx != FAN_INDEX_AUTO)
> +		apmf_update_fan_idx(dev, true, apts_config_store_v2.states[idx].fan_table_idx);
> +}
> +
>  static void amd_pmf_update_slider_v2(struct amd_pmf_dev *dev, int idx)
>  {
>  	amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, apts_config_store.val[idx].pmf_ppt, NULL);
> @@ -264,7 +342,14 @@ static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_
>  		return -EINVAL;
>  	}
>  
> -	amd_pmf_update_slider_v2(pdev, index);
> +	if (is_amd_pmf_1ah_m80h(pdev)) {
> +		/* Do not send zero limits when the APTS defaults were not read */
> +		if (!apts_config_store_v2_valid)
> +			return -ENODATA;
> +		amd_pmf_update_slider_v3(pdev, index);
> +	} else {
> +		amd_pmf_update_slider_v2(pdev, index);
> +	}
>  
>  	return 0;
>  }
> @@ -418,12 +503,20 @@ static const struct platform_profile_ops amd_pmf_profile_ops = {
>  
>  int amd_pmf_init_sps(struct amd_pmf_dev *dev)
>  {
> +	int ret;
> +
>  	dev->current_profile = PLATFORM_PROFILE_BALANCED;
>  
>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
>  		if (dev->pmf_if_version == PMF_IF_V2) {
>  			amd_pmf_load_defaults_sps_v2(dev);
> -			amd_pmf_load_apts_defaults_sps_v2(dev);
> +			if (is_amd_pmf_1ah_m80h(dev)) {
> +				ret = amd_pmf_load_apts_defaults_sps_v3(dev);
> +				if (ret)
> +					return ret;
> +			} else {
> +				amd_pmf_load_apts_defaults_sps_v2(dev);
> +			}
>  		} else {
>  			amd_pmf_load_defaults_sps(dev);

Wouldn't per version ops make much more sense than this??

-- 
 i.

