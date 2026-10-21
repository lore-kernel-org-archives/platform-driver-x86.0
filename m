Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583946;
	b=dLp1K/pUTKaR7V6dQoePyW/R0DPYiLc0J/f+GaX4UiffHe/40fV4UNiZKdBR2kV91SFI
	 Yi7C1UY9VgyLwkh9nzqqKgX1P53HyHLl5IzfTOlD+gdfofUmXhIKvYz0De1OZsXcDATc8
	 at7ELCsumajfkJjYdm+B6WUCS9EbhOf9ytlgphzbiRPL8vrlaUQt5Rd2+nZepfkjgUvNR
	 IXKaOvPrGHzUWL51abWiWv8q0a3vrFyE2VrkR1rDcQH8EQQqS0jZLmJ4fhSd88ZDQEOkV
	 Agy4zQn8nhAzl6lD5gEg6H3A01GBWinBR/hkqbYPZDtAOfqU4Ov5/ecqZx+FeRtk7BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583946;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=H6C+5eh5vGwBM/10OYh4NNtFYRRLWym1ZJVvrsSNH44=;
	b=1mbSBSgBwqLf1i64/oQtRZ89dghQh9nvqhqUX0iy0hAGA1wIe6F7asTFb4jXcwzFnvkO
	 B8rEDnF1qdWltedZGmiTJP8fyffzoCvchUo3ktl4GDh1G3GD2WHkgjlcbNyN9ThtlZBOR
	 5qedi5XehQ8kWeRJjjR52Wdp5mTmb5oEVLIMG9dn06SN2L1TbvK+yYyXiDxH2/mLwEgiB
	 z1pEssxoUoSy6/ZTWihPM8nhmzCpZtGD3q2TTdBFwvzJcoI+IQD4G+uRqXO3VYKAzsZFW
	 ZPk3MECaKNZGTlS+UwedClPquK+P0/kfAWGvTaVlnC046mCANZ8fIKGBwo9qnr0Pi8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H+DfoH3h;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA7606A319
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 11:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2FA7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H+DfoH3h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792583946; x=1824119946;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vto4ugAX7JTHOE8BG/dY9cIcVPw1O22GT0XiEwpaU5o=;
  b=H+DfoH3hJB5HBAGHb/p3kWUSuSeKisMKOK7FCGWbx/sSw9LKr2lOENI5
   YCeVmhnn0C1IuLfdWV+GPBSlYPidl6dggSHemUwgmf406ygP3dWO5SJMr
   LTWec8cFwItmj76/FdQMcajk9xUA4VZD6ijvPQbR5Ih/JIGKbXrCDXdiC
   gSc8lYJPdhIwgmoPopWY2EBbN704Tf5IUxD5rbEhS6+RXim0djy5Snw2V
   UIlcQowpxciZrSJuIVJQ8yX6C7rV05x53lkv1aICTdugGfVfmzhSPGf81
   2RZ6/lTCluHmD6bemBf1aBzpwU9MskvUZFMELOkGzBy9PZayaXDa69gXB
   g==;
X-CSE-ConnectionGUID: P6e2UIO1TmywAAY/7OM8xg==
X-CSE-MsgGUID: /8f6iOECS0+gjSWv6nD57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1194192"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1194192"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:59:06 -0700
X-CSE-ConnectionGUID: i6MoOwJLTuyEvdavzvV96g==
X-CSE-MsgGUID: 1j/EmNH1Q9OvTlA4C33m9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3399839"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:59:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Oct 2026 14:58:57 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH 2/8] platform/x86/amd/pmf: Add 1AH_M80H static slider
 support
In-Reply-To: <20261011100554.1841309-3-Shyam-sundar.S-k@amd.com>
Message-ID: <e420b4b4-67c5-a725-3c5d-3eabf86844e3@linux.intel.com>
References: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com> <20261011100554.1841309-3-Shyam-sundar.S-k@amd.com>
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

On Sun, 11 Oct 2026, Shyam Sundar S K wrote:

> 1AH_M80H follows APMF specification 2.03, which changes the APTS table
> layout and uses a different set of SMU message IDs to program the
> static slider power limits.
> 
> Add the new APTS table structures and use them on 1AH_M80H to read the
> slider defaults from the BIOS and to program them with the new SMU
> message IDs. Other platforms keep using the existing path.
> 
> If reading the APTS defaults fails, return the error from
> amd_pmf_init_sps() and do not register the power source notifier, so
> that zeroed limits are never sent to the SMU on a power source change.
> 
> Key changes include:
>  - Add the 1AH_M80H SMU message IDs for SPPT, FPPT and STT limits
>  - Add struct amd_pmf_apts_output_v2 as per APMF 2.03
>  - Add amd_pmf_load_apts_defaults_sps_v3() and amd_pmf_update_slider_v3()
>  - Register the power source notifier only when SPS init succeeds
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 10 ++--
>  drivers/platform/x86/amd/pmf/pmf.h  | 45 +++++++++++++++
>  drivers/platform/x86/amd/pmf/sps.c  | 88 ++++++++++++++++++++++++++++-
>  3 files changed, 137 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 96e37eb56591..f7df72d3076b 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -356,10 +356,12 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  	/* Enable Static Slider */
>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR) ||
>  	    is_apmf_func_supported(dev, APMF_FUNC_OS_POWER_SLIDER_UPDATE)) {
> -		amd_pmf_init_sps(dev);
> -		dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
> -		power_supply_reg_notifier(&dev->pwr_src_notifier);
> -		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
> +		ret = amd_pmf_init_sps(dev);
> +		if (!ret) {
> +			dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
> +			power_supply_reg_notifier(&dev->pwr_src_notifier);
> +			dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
> +		}
>  	}
>  
>  	if (smart_pc_support) {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index b29c5192d878..73d981b25b38 100644
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
> +	struct amd_pmf_apts_output_v2 val[APTS_MAX_STATES];
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
> index b0031afae33b..8aea73722d4c 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -8,11 +8,16 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
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
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
>  static const char *slider_v2_as_str(unsigned int state)
> @@ -97,6 +102,27 @@ static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v
>  	pr_debug("Static Slider APTS state index data - END\n");
>  }
>  
> +static void amd_pmf_dump_apts_sps_defaults_v2(struct amd_pmf_apts_granular_v2 *info)
> +{
> +	int i;
> +
> +	pr_debug("Static Slider APTS index default v2 values data - BEGIN\n");
> +
> +	for (i = 0; i < APTS_MAX_STATES; i++) {

These should be better with ARRAY_SIZE().

> +		pr_debug("Table Version[%d] = %u\n", i, info->val[i].table_version);

Why is it called "val" if we iterate over it until we reach something 
called "max states"?

> +		pr_debug("Fan Index[%d] = %u\n", i, info->val[i].fan_table_idx);
> +		pr_debug("PMF Slow PPT[%d] = %u\n", i, info->val[i].pmf_slow_ppt);
> +		pr_debug("PPT PMF APU[%d] = %u\n", i, info->val[i].ppt_pmf_apu_only);
> +		pr_debug("STT Min[%d] = %u\n", i, info->val[i].stt_min_limit);
> +		pr_debug("STT APU[%d] = %u\n", i, info->val[i].stt_skin_temp_limit_apu);
> +		pr_debug("STT HS2[%d] = %u\n", i, info->val[i].stt_skin_temp_limit_hs2);
> +		pr_debug("PMF Fast PPT[%d] = %u\n", i, info->val[i].pmf_fast_ppt);
> +		pr_debug("PPT Fast PMF APU[%d] = %u\n", i, info->val[i].ppt_fast_pmf_apu_only);
> +	}
> +
> +	pr_debug("Static Slider APTS index default v2 values data - END\n");
> +}
> +
>  static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info)
>  {
>  	int i;
> @@ -119,8 +145,31 @@ static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info)
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
> +
> +	for (i = 0; i < APTS_MAX_STATES; i++) {
> +		ret = apts_get_static_slider_granular_v3(pdev, &output, i);
> +		if (ret) {
> +			dev_err(pdev->dev, "Failed to read APTS v2 defaults: %d\n", ret);
> +			return ret;
> +		}
> +
> +		apts_config_store_v2.val[i] = output.val;
> +	}
> +
> +	amd_pmf_dump_apts_sps_defaults_v2(&apts_config_store_v2);
> +
> +	return 0;
> +}
> +
>  static void amd_pmf_load_apts_defaults_sps_v2(struct amd_pmf_dev *pdev)
>  {
>  	struct amd_pmf_apts_granular_output output;
> @@ -190,6 +239,30 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>  	amd_pmf_dump_sps_defaults(&config_store);
>  }
>  
> +static void amd_pmf_update_slider_v3(struct amd_pmf_dev *dev, int idx)
> +{
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_SPM, SET_CMD,
> +			 apts_config_store_v2.val[idx].pmf_slow_ppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_APU_ONLY, SET_CMD,
> +			 apts_config_store_v2.val[idx].ppt_pmf_apu_only, NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_MIN_LIMIT, SET_CMD,
> +			 apts_config_store_v2.val[idx].stt_min_limit, NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_APU, SET_CMD,
> +			 fixp_q88_fromint(apts_config_store_v2.val[idx].stt_skin_temp_limit_apu),
> +			 NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_HS2, SET_CMD,
> +			 fixp_q88_fromint(apts_config_store_v2.val[idx].stt_skin_temp_limit_hs2),
> +			 NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_SPM, SET_CMD,
> +			 apts_config_store_v2.val[idx].pmf_fast_ppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_APU_ONLY, SET_CMD,
> +			 apts_config_store_v2.val[idx].ppt_fast_pmf_apu_only, NULL);
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX) &&
> +	    apts_config_store_v2.val[idx].fan_table_idx != FAN_INDEX_AUTO)
> +		apmf_update_fan_idx(dev, true, apts_config_store_v2.val[idx].fan_table_idx);
> +}
> +
>  static void amd_pmf_update_slider_v2(struct amd_pmf_dev *dev, int idx)
>  {
>  	amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, apts_config_store.val[idx].pmf_ppt, NULL);
> @@ -264,7 +337,10 @@ static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_
>  		return -EINVAL;
>  	}
>  
> -	amd_pmf_update_slider_v2(pdev, index);
> +	if (is_amd_pmf_1ah_m80h(pdev))
> +		amd_pmf_update_slider_v3(pdev, index);
> +	else
> +		amd_pmf_update_slider_v2(pdev, index);
>  
>  	return 0;
>  }
> @@ -418,12 +494,20 @@ static const struct platform_profile_ops amd_pmf_profile_ops = {
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
>  		}
> 

-- 
 i.

