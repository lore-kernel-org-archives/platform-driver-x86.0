Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571FE35A94E
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482711; cv=none; b=iID80Pusl4/bfGdYJeHuTklzc3gZBQhVB0n1ggRGddWLrrHse+2iNmp4p4C5ZmngsXbjOrKljRs0FuC4LyLXJ0krS3eN1DRG0HrcL6CgQrcLRjyUCRYfd+Cyr5+3w0OUjvZeUA1kwuX8HyKkLhGXFrKNYlN3HHAYFvzGE+4MHKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482711; c=relaxed/simple;
	bh=gZoHF8R53Z+K2rlOcAYfBRmwdG1MveZgLKMkMgNHSJA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XzHYLI7Zu/KcmmRS2krtoxu/8BZMjdyE1mHGL5b0kqI3Iv3Z9NOBIWQ01NDm94/n6pSEY2aaFIbAxcUFahqLDIKBTdf4Ey7d3y2KjtnRbK/48XyCgWyf7A09+BV5YX1gNNS749GksVSJTW5lxSDleuQc8oJQ+PoE6bkEOiJe3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SL4QbHWx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SL4QbHWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763482709; x=1795018709;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gZoHF8R53Z+K2rlOcAYfBRmwdG1MveZgLKMkMgNHSJA=;
  b=SL4QbHWxIxke19zzF9NhyxYZi7p8lrrIoMCNXSeMoXDISd5dUcAvVFsQ
   1M81M9ENM7CI4NRAXz2yo6lKD2Yp3tJKJLpK9da14lU+IUMy74wafcY4l
   LJdu5DNlur1qjdBB0K9FANc4ZwKBa9XEu1gqVLsl7s7fULsEnZr/BBkEQ
   FQjYsBkR1jDYWwa9tiR7mvRW2dTZRIs8N4Ndb3sO4b6sDTm1Vd0sp/bjz
   7enefER6MXWVBnEnhKpyN/9Y5rUeRbG+JFTZof8jH/ibTfp42EMVnYROg
   5qGFLR20k3GhzJEC5vj0eKws1WHwDG8hJKJsAlfy5niGle44YpZoaSVe0
   g==;
X-CSE-ConnectionGUID: QzkYHoR+Tdm+ExK/1bCyEA==
X-CSE-MsgGUID: bhe/XHSUTaSUvhtBu7lzVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64708726"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64708726"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:18:28 -0800
X-CSE-ConnectionGUID: 9KNPP+gfSSeBSas4orQ+6g==
X-CSE-MsgGUID: nTepTMFNR/m8OtVPk/iaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195107973"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:18:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 18:18:22 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v2 2/5] platform/x86/amd/pmf: cache BIOS output values
 for user-space telemetry via util IOCTL
In-Reply-To: <20251111071010.4179492-3-Shyam-sundar.S-k@amd.com>
Message-ID: <6f4f236e-6dab-46ce-ea3f-fb5805d0116b@linux.intel.com>
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com> <20251111071010.4179492-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Nov 2025, Shyam Sundar S K wrote:

> Add a bios_output[] cache to amd_pmf_dev and store the latest values for
> BIOS output policies when applying PMF policies. This enables the AMD PMF
> util layer to expose these BIOS outputs alongside selected thermal and
> power telemetry to user space via /dev/amdpmf_interface and a new IOCTL,
> supporting real-time monitoring tools such as SystemDeck.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |   1 +
>  drivers/platform/x86/amd/pmf/tee-if.c |  10 ++
>  drivers/platform/x86/amd/pmf/util.c   | 140 ++++++++++++++++++++++++++
>  include/uapi/linux/amd-pmf.h          |  48 +++++++++
>  4 files changed, 199 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 3b1aae8a60a5..5880d6fc3afb 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -406,6 +406,7 @@ struct amd_pmf_dev {
>  	struct apmf_sbios_req_v1 req1;
>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>  	bool cb_flag;			     /* To handle first custom BIOS input */
> +	u32 bios_output[10];
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 6e8116bef4f6..8ea309aade95 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -183,42 +183,52 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_1:
> +			dev->bios_output[0] = val;
>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(0), 0);
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_2:
> +			dev->bios_output[1] = val;
>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(1), 1);
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_3:
> +			dev->bios_output[2] = val;
>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(2), 2);
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_4:
> +			dev->bios_output[3] = val;
>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(3), 3);
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_5:
> +			dev->bios_output[4] = val;
>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(4), 4);
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_6:
> +			dev->bios_output[5] = val;
>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(5), 5);
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_7:
> +			dev->bios_output[6] = val;
>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(6), 6);
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_8:
> +			dev->bios_output[7] = val;
>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(7), 7);
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_9:
> +			dev->bios_output[8] = val;
>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(8), 8);
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_10:
> +			dev->bios_output[9] = val;
>  			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(9), 9);
>  			break;

Duplicating that n times doesn't look nice...

>  		}
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> index 97a626bac034..bfb30117a5af 100644
> --- a/drivers/platform/x86/amd/pmf/util.c
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -17,6 +17,143 @@
>  
>  #define AMD_PMF_FEATURE_VERSION         0x02
>  
> +static int amd_pmf_get_metrics_data(struct device *dev, void __user *argp)
> +{
> +	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_table *in = NULL;
> +	struct amd_pmf_metrics_key output;
> +	struct amd_pmf_dev *pdev;
> +
> +	pdev = amd_pmf_get_handle();
> +	if (!pdev)
> +		return -EINVAL;
> +
> +	memset(pdev->shbuf, 0, pdev->policy_sz);
> +	ta_sm = pdev->shbuf;
> +	in = &ta_sm->pmf_input.enact_table;
> +
> +	if (copy_from_user(&output, argp, sizeof(output)))
> +		return -EFAULT;
> +
> +	switch (output.control_code) {
> +	case IOCTL_POWER_SOURCE:
> +		output.val = in->ev_info.power_source;
> +		break;
> +	case IOCTL_POWER_SLIDER_POSITION:
> +		output.val = in->ev_info.power_slider;
> +		break;
> +	case IOCTL_PLATFORM_TYPE:
> +		output.val = in->ev_info.platform_type;
> +		break;
> +	case IOCTL_LAPTOP_PLACEMENT:
> +		output.val = in->ev_info.device_state;
> +		break;
> +	case IOCTL_LID_STATE:
> +		output.val = in->ev_info.lid_state;
> +		break;
> +	case IOCTL_SKIN_TEMP:
> +		output.val = in->ev_info.skin_temperature / 100;
> +		break;
> +	case IOCTL_USER_PRESENCE:
> +		output.val = in->ev_info.user_present;
> +		break;
> +	case IOCTL_BATTERY_PERCENTAGE:
> +		output.val = in->ev_info.bat_percentage;
> +		break;
> +	case IOCTL_BIOS_INPUT_1:
> +		output.val = in->ev_info.bios_input_1[0];
> +		break;
> +	case IOCTL_BIOS_INPUT_2:
> +		output.val = in->ev_info.bios_input_1[1];
> +		break;
> +	case IOCTL_BIOS_INPUT_3:
> +		output.val = in->ev_info.bios_input_2[0];
> +		break;
> +	case IOCTL_BIOS_INPUT_4:
> +		output.val = in->ev_info.bios_input_2[1];
> +		break;
> +	case IOCTL_BIOS_INPUT_5:
> +		output.val = in->ev_info.bios_input_2[2];
> +		break;
> +	case IOCTL_BIOS_INPUT_6:
> +		output.val = in->ev_info.bios_input_2[3];
> +		break;
> +	case IOCTL_BIOS_INPUT_7:
> +		output.val = in->ev_info.bios_input_2[4];
> +		break;
> +	case IOCTL_BIOS_INPUT_8:
> +		output.val = in->ev_info.bios_input_2[5];
> +		break;
> +	case IOCTL_BIOS_INPUT_9:
> +		output.val = in->ev_info.bios_input_2[6];
> +		break;
> +	case IOCTL_BIOS_INPUT_10:
> +		output.val = in->ev_info.bios_input_2[7];
> +		break;
> +	case IOCTL_GFX_WORKLOAD:
> +		output.val = in->ev_info.gfx_busy;
> +		break;
> +	case IOCTL_DESIGNED_BATTERY_CAPACITY:
> +		output.val = in->ev_info.bat_design;
> +		break;
> +	case IOCTL_FULLY_CHARGED_BATTERY_CAPACITY:
> +		output.val = in->ev_info.full_charge_capacity;
> +		break;

We do have other interfaces to expose e.g., battery information.

I'm far from convinced ioctl is a great idea here anyway.

> +	case IOCTL_BATTERY_DRAIN_RATE:
> +		output.val = in->ev_info.drain_rate;
> +		break;
> +	case IOCTL_AMBIENT_LIGHT:
> +		output.val = in->ev_info.ambient_light;
> +		break;
> +	case IOCTL_AVG_C0_RES:
> +		output.val = in->ev_info.avg_c0residency;
> +		break;
> +	case IOCTL_MAX_C0_RES:
> +		output.val = in->ev_info.max_c0residency;
> +		break;
> +	case IOCTL_SOCKET_POWER:
> +		output.val = in->ev_info.socket_power;
> +		break;
> +	case IOCTL_BIOS_OUTPUT_1:
> +		output.val = pdev->bios_output[0];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_2:
> +		output.val = pdev->bios_output[1];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_3:
> +		output.val = pdev->bios_output[2];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_4:
> +		output.val = pdev->bios_output[3];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_5:
> +		output.val = pdev->bios_output[4];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_6:
> +		output.val = pdev->bios_output[5];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_7:
> +		output.val = pdev->bios_output[6];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_8:
> +		output.val = pdev->bios_output[7];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_9:
> +		output.val = pdev->bios_output[8];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_10:
> +		output.val = pdev->bios_output[9];
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (copy_to_user(argp, &output, sizeof(output)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>  static int amd_pmf_get_feature_status(void __user *argp, unsigned long feat_id)
>  {
>  	struct amd_pmf_feature_support info = {0};
> @@ -56,6 +193,7 @@ static int amd_pmf_get_feature_status(void __user *argp, unsigned long feat_id)
>  
>  static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
> +	struct device *dev = filp->private_data;
>  	void __user *argp = (void __user *)arg;
>  	struct amd_pmf_feature_support output;
>  
> @@ -65,6 +203,8 @@ static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long
>  	switch (cmd) {
>  	case IOCTL_PMF_QUERY_FEATURE_SUPPORT:
>  		return amd_pmf_get_feature_status(argp, output.feature_id);
> +	case IOCTL_PMF_GET_METRICS_DATA:
> +		return amd_pmf_get_metrics_data(dev, argp);
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index 2147240c2bb1..bbc45c6fc113 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -9,6 +9,7 @@
>  
>  #define IOCTL_PMF_QUERY_FEATURE_SUPPORT  _IOWR(AMD_PMF_IOC_MAGIC, 0x00, \
>  					       struct amd_pmf_feature_support)
> +#define IOCTL_PMF_GET_METRICS_DATA	_IOWR(AMD_PMF_IOC_MAGIC, 0x26, struct amd_pmf_metrics_key)
>  
>  /* AMD PMF Feature IDs */
>  #define PMF_FEATURE_AUTO_MODE			0
> @@ -17,6 +18,53 @@
>  #define PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC	5
>  #define PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC	6
>  
> +enum pmf_metrics_id {
> +	IOCTL_POWER_SOURCE,
> +	IOCTL_POWER_SLIDER_POSITION,
> +	IOCTL_PLATFORM_TYPE,
> +	IOCTL_LAPTOP_PLACEMENT,
> +	IOCTL_LID_STATE,
> +	IOCTL_HETERO_STATE,
> +	IOCTL_SKIN_TEMP,
> +	IOCTL_USER_PRESENCE,
> +	IOCTL_DISPLAY_NUM,
> +	IOCTL_BATTERY_PERCENTAGE,
> +	IOCTL_BIOS_INPUT_1,
> +	IOCTL_BIOS_INPUT_2,
> +	IOCTL_BIOS_INPUT_3,
> +	IOCTL_BIOS_INPUT_4,
> +	IOCTL_BIOS_INPUT_5,
> +	IOCTL_BIOS_INPUT_6,
> +	IOCTL_BIOS_INPUT_7,
> +	IOCTL_BIOS_INPUT_8,
> +	IOCTL_BIOS_INPUT_9,
> +	IOCTL_BIOS_INPUT_10,
> +	IOCTL_GFX_WORKLOAD,
> +	IOCTL_DESIGNED_BATTERY_CAPACITY = 24,
> +	IOCTL_FULLY_CHARGED_BATTERY_CAPACITY,
> +	IOCTL_BATTERY_DRAIN_RATE,
> +	IOCTL_AMBIENT_LIGHT = 29,
> +	IOCTL_AVG_C0_RES = 36,
> +	IOCTL_MAX_C0_RES,
> +	IOCTL_SOCKET_POWER = 50,
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
> +	IOCTL_BIOS_OUTPUT_10,
> +};
> +
> +struct amd_pmf_metrics_key {
> +	enum pmf_metrics_id control_code; /* In */
> +	long long val; /* Out */

Comments should be aligned.

> +};
> +
>  struct amd_pmf_feature_support {
>  	bool feature_supported; /* Out */
>  	unsigned long feature_version; /* Out */
> 

-- 
 i.

