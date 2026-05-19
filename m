Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C8320C461
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186836; cv=none; b=QgkPDz7t144qZuS9O0KmlfQXoxHX/dMr2WIJ5Xq+4u9HjToXmhAdjXkCwfEPHyI0tExTKwerOLQT4/NOvgLFNXjpg2bEvgQanH8fSXTz5zd0HbA+/WHRCG1YZgDnV/jIIkvfWLRrn6BGA+Rn9zWaGl9/CONMNrOnhsKbu6eM8dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186836; c=relaxed/simple;
	bh=xJX4kD7t/d7RokBoeVTcF4Arn0j+O/ArAiYn3DZyPr0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mhmq3wrwi+YI4oNO4eCIlAH8F3bWRhPa003IF6XCl0xGfWX7qnlP9fkxDU2cve+RlJAqqFOyGblvA0zWP2X6zXegzMnAhezZKuTXvlJHij1+kBlvsQsIJAQDIdr1Xnt+Neu/CuUldT0y9GpK2t2DtY5cLPqOKtuENrnSqas4oXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIbo+v5F; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIbo+v5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779186835; x=1810722835;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xJX4kD7t/d7RokBoeVTcF4Arn0j+O/ArAiYn3DZyPr0=;
  b=YIbo+v5FPq7X+7Gsoxkd/uqFc8zsrJEQxM5D9/7JtZniU6Sl+R2NVLy7
   XGciou5IEfan8Vv9KCCXrgWnWPNWKCPmtgxBF0U6IGRqL6CZmxjdTKCum
   8s9mkOmtIFLGZ81OkvY4A4zTmUotZCIIqy57dcLLC3vsz7uOgqXUu8nme
   cguKMMJbLECjwUXz4OcNRgbwhsHPBs/uwnqP/QCliFw4Sl+tnx4SFo0r6
   SOSSJ0IFZ2LFPa3VOO9y6H7hv4I3E5tvKFV2gqpJw6RDGJ/TFE2wZpCI7
   5C7HtVgjpSsC/VXfHMaAjnxVgtIdGD5FKww38AvO/+ri7Zys+iDuBtdIB
   Q==;
X-CSE-ConnectionGUID: O0jjnufCTzGx47qNWsaF9A==
X-CSE-MsgGUID: 0SMSVlFNRJCECH66vec1dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97494464"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97494464"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:33:54 -0700
X-CSE-ConnectionGUID: HxyCgws6TeObnn7qirq4Sw==
X-CSE-MsgGUID: YpCWfs/NQpqQZNlbcjnRQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237111648"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:33:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 May 2026 13:33:48 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v4 4/7] platform/x86/amd/pmf: Store commonly used enums
 in the header file
In-Reply-To: <20260507144524.664001-5-Shyam-sundar.S-k@amd.com>
Message-ID: <d61f3f66-abc9-ae24-b471-4238099ed213@linux.intel.com>
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com> <20260507144524.664001-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 May 2026, Shyam Sundar S K wrote:

> Relocate commonly used enums from multiple source files into a shared
> header file to simplify code structure, improve readability, and
> enhance maintainability. Also, remove the initialization of the first
> enum member, since it is not needed.
> 
> Add the AMD_PMF_ prefix to the laptop_placement and platform_type enums
> since these names are overly generic for inclusion in a UAPI header
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 13 ++--
>  drivers/platform/x86/amd/pmf/pmf.h            | 22 ------
>  drivers/platform/x86/amd/pmf/spc.c            | 25 ++++---
>  include/linux/amd-pmf-io.h                    |  9 ---
>  include/uapi/linux/amd-pmf.h                  | 74 +++++++++++++++++++
>  5 files changed, 94 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 837d59e7a661..8ac44368a37d 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> @@ -7,6 +7,7 @@
>   *
>   * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>   */
> +#include <linux/amd-pmf.h>
>  #include <linux/amd-pmf-io.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/iopoll.h>
> @@ -102,20 +103,20 @@ static int amd_sfh_mode_info(u32 *platform_type, u32 *laptop_placement)
>  	*platform_type = mode.op_mode.devicemode;
>  
>  	if (mode.op_mode.ontablestate == 1) {
> -		*laptop_placement = ON_TABLE;
> +		*laptop_placement = AMD_PMF_ON_TABLE;
>  	} else if (mode.op_mode.ontablestate == 2) {
> -		*laptop_placement = ON_LAP_MOTION;
> +		*laptop_placement = AMD_PMF_ON_LAP_MOTION;
>  	} else if (mode.op_mode.inbagstate == 1) {
> -		*laptop_placement = IN_BAG;
> +		*laptop_placement = AMD_PMF_IN_BAG;
>  	} else if (mode.op_mode.outbagstate == 1) {
> -		*laptop_placement = OUT_OF_BAG;
> +		*laptop_placement = AMD_PMF_OUT_OF_BAG;
>  	} else if (mode.op_mode.ontablestate == 0 || mode.op_mode.inbagstate == 0 ||
>  		 mode.op_mode.outbagstate == 0) {
> -		*laptop_placement = LP_UNKNOWN;
> +		*laptop_placement = AMD_PMF_LP_UNKNOWN;
>  		pr_warn_once("Unknown laptop placement\n");
>  	} else if (mode.op_mode.ontablestate == 3 || mode.op_mode.inbagstate == 3 ||
>  		 mode.op_mode.outbagstate == 3) {
> -		*laptop_placement = LP_UNDEFINED;
> +		*laptop_placement = AMD_PMF_LP_UNDEFINED;
>  		pr_warn_once("Undefined laptop placement\n");
>  	}
>  
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index ffe74ebc46f8..269c0a4b1cae 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -682,14 +682,6 @@ enum system_state {
>  	SYSTEM_STATE_MAX,
>  };
>  
> -enum ta_slider {
> -	TA_BEST_BATTERY,
> -	TA_BETTER_BATTERY,
> -	TA_BETTER_PERFORMANCE,
> -	TA_BEST_PERFORMANCE,
> -	TA_MAX,
> -};
> -
>  struct amd_pmf_pb_bitmap {
>  	const char *name;
>  	u32 bit_mask;
> @@ -721,20 +713,6 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
>  	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(16)},
>  };
>  
> -enum platform_type {
> -	PTYPE_UNKNOWN = 0,
> -	LID_CLOSE,
> -	CLAMSHELL,
> -	FLAT,
> -	TENT,
> -	STAND,
> -	TABLET,
> -	BOOK,
> -	PRESENTATION,
> -	PULL_FWD,
> -	PTYPE_INVALID = 0xf,
> -};
> -
>  /* Command ids for TA communication */
>  enum ta_pmf_command {
>  	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index f48678a23cc7..cbfdf3256fb6 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <acpi/button.h>
> +#include <linux/amd-pmf.h>
>  #include <linux/amd-pmf-io.h>
>  #include <linux/cleanup.h>
>  #include <linux/power_supply.h>
> @@ -20,21 +21,21 @@
>  static const char *platform_type_as_str(u16 platform_type)
>  {
>  	switch (platform_type) {
> -	case CLAMSHELL:
> +	case AMD_PMF_CLAMSHELL:
>  		return "CLAMSHELL";
> -	case FLAT:
> +	case AMD_PMF_FLAT:
>  		return "FLAT";
> -	case TENT:
> +	case AMD_PMF_TENT:
>  		return "TENT";
> -	case STAND:
> +	case AMD_PMF_STAND:
>  		return "STAND";
> -	case TABLET:
> +	case AMD_PMF_TABLET:
>  		return "TABLET";
> -	case BOOK:
> +	case AMD_PMF_BOOK:
>  		return "BOOK";
> -	case PRESENTATION:
> +	case AMD_PMF_PRESENTATION:
>  		return "PRESENTATION";
> -	case PULL_FWD:
> +	case AMD_PMF_PULL_FWD:
>  		return "PULL_FWD";
>  	default:
>  		return "UNKNOWN";
> @@ -44,13 +45,13 @@ static const char *platform_type_as_str(u16 platform_type)
>  static const char *laptop_placement_as_str(u16 device_state)
>  {
>  	switch (device_state) {
> -	case ON_TABLE:
> +	case AMD_PMF_ON_TABLE:
>  		return "ON_TABLE";
> -	case ON_LAP_MOTION:
> +	case AMD_PMF_ON_LAP_MOTION:
>  		return "ON_LAP_MOTION";
> -	case IN_BAG:
> +	case AMD_PMF_IN_BAG:
>  		return "IN_BAG";
> -	case OUT_OF_BAG:
> +	case AMD_PMF_OUT_OF_BAG:
>  		return "OUT_OF_BAG";
>  	default:
>  		return "UNKNOWN";
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index 55198d2875cc..e014d4ce5a20 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -52,15 +52,6 @@ struct amd_sfh_info {
>  	u32 laptop_placement;
>  };
>  
> -enum laptop_placement {
> -	LP_UNKNOWN = 0,
> -	ON_TABLE,
> -	ON_LAP_MOTION,
> -	IN_BAG,
> -	OUT_OF_BAG,
> -	LP_UNDEFINED,
> -};
> -
>  /**
>   * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
>   * @npuclk_freq: NPU clock frequency [MHz]
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index 0fe68e21ee5b..8bd2fdee6ef0 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -41,6 +41,80 @@
>  #define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
>  #define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
>  
> +/**
> + * enum laptop_placement - Describes the physical placement of the laptop
> + * @AMD_PMF_LP_UNKNOWN: Placement cannot be determined
> + * @AMD_PMF_ON_TABLE: Laptop is placed on a stable surface like a table or desk
> + * @AMD_PMF_ON_LAP_MOTION: Laptop is on a lap with detected motion
> + * @AMD_PMF_IN_BAG: Laptop is detected to be inside a bag or case
> + * @AMD_PMF_OUT_OF_BAG: Laptop has been removed from bag or case
> + * @AMD_PMF_LP_UNDEFINED: Placement state is undefined
> + *
> + * This enumeration represents the physical placement state of the laptop
> + * as detected by platform sensors. Used for adaptive power management
> + * and thermal policies.
> + */
> +enum laptop_placement {

Too generic name, please check anything going to uapi has specific enough 
names so that the namespace collisions are not going to be a problem.

> +	AMD_PMF_LP_UNKNOWN,
> +	AMD_PMF_ON_TABLE,
> +	AMD_PMF_ON_LAP_MOTION,
> +	AMD_PMF_IN_BAG,
> +	AMD_PMF_OUT_OF_BAG,
> +	AMD_PMF_LP_UNDEFINED,
> +};
> +
> +/**
> + * enum ta_slider - Trusted Application power slider positions
> + * @TA_BEST_BATTERY: Maximum battery savings, minimal performance
> + * @TA_BETTER_BATTERY: Balanced towards battery life
> + * @TA_BETTER_PERFORMANCE: Balanced towards performance
> + * @TA_BEST_PERFORMANCE: Maximum performance, higher power consumption
> + * @TA_MAX: Sentinel value indicating maximum enum value
> + *
> + * This enumeration defines the power slider positions used by the
> + * AMD PMF Trusted Application for dynamic power management decisions.
> + * These correspond to the Windows power slider UI positions.
> + */
> +enum ta_slider {
> +	TA_BEST_BATTERY,
> +	TA_BETTER_BATTERY,
> +	TA_BETTER_PERFORMANCE,
> +	TA_BEST_PERFORMANCE,
> +	TA_MAX,
> +};

Not sure if even this should have AMD_PMF prefix or not.

> +
> +/**
> + * enum platform_type - Describes the physical form factor orientation
> + * @AMD_PMF_PTYPE_UNKNOWN: Platform type cannot be determined
> + * @AMD_PMF_LID_CLOSE: Laptop lid is closed
> + * @AMD_PMF_CLAMSHELL: Traditional laptop mode with keyboard and screen
> + * @AMD_PMF_FLAT: Device is lying flat on a surface
> + * @AMD_PMF_TENT: Device is in tent mode (keyboard folded back, standing)
> + * @AMD_PMF_STAND: Device is propped up in stand orientation
> + * @AMD_PMF_TABLET: Device is in tablet mode with keyboard hidden
> + * @AMD_PMF_BOOK: Device is in book reading orientation
> + * @AMD_PMF_PRESENTATION: Device is in presentation mode
> + * @AMD_PMF_PULL_FWD: Screen is pulled forward towards user
> + * @AMD_PMF_PTYPE_INVALID: Invalid platform type marker
> + *
> + * This enumeration describes the current physical orientation or form
> + * factor of convertible/2-in-1 devices. Used for optimizing power and
> + * thermal management based on device posture.
> + */
> +enum platform_type {
> +	AMD_PMF_PTYPE_UNKNOWN,
> +	AMD_PMF_LID_CLOSE,
> +	AMD_PMF_CLAMSHELL,
> +	AMD_PMF_FLAT,
> +	AMD_PMF_TENT,
> +	AMD_PMF_STAND,
> +	AMD_PMF_TABLET,
> +	AMD_PMF_BOOK,
> +	AMD_PMF_PRESENTATION,
> +	AMD_PMF_PULL_FWD,
> +	AMD_PMF_PTYPE_INVALID = 0xf,
> +};
> +
>  struct amd_pmf_info {
>  	__u64 size;
>  
> 

-- 
 i.

