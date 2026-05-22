Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DA33BFAD3
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456685; cv=none; b=PsFITieYwuMPb5/0FuerWkaItY/FYscXyIuI5GZxlZhvvLVMqMdDpthSy7ZXndPChU8YZM6cIG9pwiHORGmgcupiRRtOl0aYiU/la80b8OsjgSq4O82gYm955RxdW4xAG4HN4NSXDYwXcZ9x3uvYzocHkOAg5g4PQkO5x4ZP9y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456685; c=relaxed/simple;
	bh=DBPoXBN/f+hWoDdlM9BtrKxa1U/kBdCiRCgJ/8IwwAs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=D54dsQ280kLhf83283xZ6srhuO49L7g5mx7FnKixdDRBICXU/vv9vX5iQ2Jod7YzYz2DdcR55NNUGfFQSJoXmQiiq4loz44VOhF0WmG3n9ABaFrh2xtZd++TKt6Yk9fYsznexuFYoSqWjUzlb473PaSAKOguMyZayZGH9Q478tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAT1twp+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAT1twp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779456684; x=1810992684;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DBPoXBN/f+hWoDdlM9BtrKxa1U/kBdCiRCgJ/8IwwAs=;
  b=GAT1twp+QWJOItGF3A+zDtyWpzG3WI+yFgvfq4Y6FCg3pFWdvNZC7SDz
   7UTmH7uxdKXFOFvg6jMFAXVeddXabQK8j05MjS14geeJxmKq7X/7LGiUq
   op5VRa0lyk/wS2+2ZyRj5SE0o3HNdlsAjGIPFsqu/47l18T9W78Zoxqxz
   +P30U8DeY1+BqNJ8p3W/c079EH3AsIUkD0hejgYtYF6HFm3wnylkhtCP5
   yV5MTEANdCRIIp1A3ug3+HRJGNqkzMN9WvXg5U2XCh1Zx8RIc1wXkY2qM
   0fLREQsV2ROurICQBsH6WGCa3RMklsK90TNzTyw2e76/lUkvjRL4UsExB
   Q==;
X-CSE-ConnectionGUID: VYZ4yWoDTAqf/WpnGcPrsw==
X-CSE-MsgGUID: GQO9A1N1Rzm8UP2hX5jnAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91777994"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91777994"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:31:23 -0700
X-CSE-ConnectionGUID: 3rautNRoQn2aoPPE6jwkNA==
X-CSE-MsgGUID: 2Cl+QQ66TMi/nhtsAmsSRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245189445"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:31:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 16:31:17 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v5 4/8] platform/x86/amd/pmf: Store commonly used enums
 in the header file
In-Reply-To: <20260520185424.770772-5-Shyam-sundar.S-k@amd.com>
Message-ID: <d70105e2-a827-6782-4e46-e795a2f1a839@linux.intel.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com> <20260520185424.770772-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, Shyam Sundar S K wrote:

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
>  drivers/platform/x86/amd/pmf/spc.c            | 37 +++++-----
>  include/linux/amd-pmf-io.h                    |  9 ---
>  include/uapi/linux/amd-pmf.h                  | 74 +++++++++++++++++++
>  5 files changed, 100 insertions(+), 55 deletions(-)
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
> index f48678a23cc7..05998946d1bd 100644
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
> @@ -60,11 +61,11 @@ static const char *laptop_placement_as_str(u16 device_state)
>  static const char *ta_slider_as_str(unsigned int state)
>  {
>  	switch (state) {
> -	case TA_BEST_PERFORMANCE:
> +	case AMD_PMF_TA_BEST_PERFORMANCE:
>  		return "PERFORMANCE";
> -	case TA_BETTER_PERFORMANCE:
> +	case AMD_PMF_TA_BETTER_PERFORMANCE:
>  		return "BALANCED";
> -	case TA_BEST_BATTERY:
> +	case AMD_PMF_TA_BEST_BATTERY:
>  		return "POWER_SAVER";
>  	default:
>  		return "Unknown TA Slider State";
> @@ -287,14 +288,14 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	switch (dev->current_profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
>  	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> -		val = TA_BEST_PERFORMANCE;
> +		val = AMD_PMF_TA_BEST_PERFORMANCE;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		val = TA_BETTER_PERFORMANCE;
> +		val = AMD_PMF_TA_BETTER_PERFORMANCE;
>  		break;
>  	case PLATFORM_PROFILE_LOW_POWER:
>  	case PLATFORM_PROFILE_QUIET:
> -		val = TA_BEST_BATTERY;
> +		val = AMD_PMF_TA_BEST_BATTERY;
>  		break;
>  	default:
>  		dev_err(dev->dev, "Unknown Platform Profile.\n");
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
> index 38ab5362fe62..54baf015e4c1 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -41,6 +41,80 @@
>  #define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
>  #define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
>  
> +/**
> + * enum laptop_placement - Describes the physical placement of the laptop

Please match these with the names in the code.

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
> +enum amd_pmf_laptop_placement {
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
> + * @AMD_PMF_TA_BEST_BATTERY: Maximum battery savings, minimal performance
> + * @AMD_PMF_TA_BETTER_BATTERY: Balanced towards battery life
> + * @AMD_PMF_TA_BETTER_PERFORMANCE: Balanced towards performance
> + * @AMD_PMF_TA_BEST_PERFORMANCE: Maximum performance, higher power consumption
> + * @AMD_PMF_TA_MAX: Sentinel value indicating maximum enum value
> + *
> + * This enumeration defines the power slider positions used by the
> + * AMD PMF Trusted Application for dynamic power management decisions.
> + * These correspond to the Windows power slider UI positions.
> + */
> +enum amd_pmf_ta_slider {
> +	AMD_PMF_TA_BEST_BATTERY,
> +	AMD_PMF_TA_BETTER_BATTERY,
> +	AMD_PMF_TA_BETTER_PERFORMANCE,
> +	AMD_PMF_TA_BEST_PERFORMANCE,
> +	AMD_PMF_TA_MAX,
> +};
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
> +enum amd_pmf_platform_type {
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

