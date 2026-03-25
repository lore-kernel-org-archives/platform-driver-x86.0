Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C5C3AF64B
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446344; cv=none; b=Qvl7GQLXx7EU9flW+gEtp2JJKWaEZiD5lZJvKZleg+Ts7obmWq6SyT9mXinU/ffZaV9nMAITqA5Iozyr/Zun6rEHifI/2SvhuKRUB9eq7Q6jJofjRHm8u6/RFhK5xaiqYDHdrxfEBIQO3vI3vKQHGx0PdGSsfcyajDsmbzeYvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446344; c=relaxed/simple;
	bh=hjUmSDiK6wSFXDfpSKQHm8vO59ydEjZQ6s1xrg2/X7Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=py2NUwecCZQZAG2BJcXI4bPVxOLMFIxg7gV9bJv7zoZq3hvpppLHBwQrku5W/TE/T21MZTehmIM6IzES9kGrGnFSXIsusSzE20BW2MyYx1y/0Z8X0szXsQhlwDDhaTHRb90RX3TeKM0dFWbjvh+jt0JtujT8xsb6pJ5HGIqH7K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrxjAnlh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrxjAnlh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774446342; x=1805982342;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hjUmSDiK6wSFXDfpSKQHm8vO59ydEjZQ6s1xrg2/X7Q=;
  b=lrxjAnlhitwPA5x+jKUMtFnTvO9EmFCMaC+A4P8NrFi2LzOMnta6fio2
   VrEfdbkwFJkw5DFKkawXkEZZjBPH1NlW9FeCJqufDHrVoINO0nBKL/RC2
   R3v0gYZ17G6BGAa4NwX6s1Ct+h432vAh4t5NnGhm01X3earQOPgkkQLRb
   AxZG1+WXPgjUmpC1gcSQmn7NtI0BFfhPqKt/Fb1t9vAx/nVuGbzHAsu1h
   9dfeoYsxV/5wrtHy/ncWAq0L8z3GI1jWBuMNQXTAH8JgFIF8ZlwHtCo6I
   adKcVjF+PeB1RVR2OPSBEvK2QGJUp4lr8zQEpjcor356ukTJ3RGYzgK6X
   w==;
X-CSE-ConnectionGUID: mulvvK8QTMqBP5QPumeUxQ==
X-CSE-MsgGUID: 1MFv61nuSTKGxVbtcCZDQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79081906"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79081906"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:34:21 -0700
X-CSE-ConnectionGUID: uI6cZ7Y/S5+thfZrdPfpgg==
X-CSE-MsgGUID: RINbHXCZQf2Pd6Q5Ahog2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221797491"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:34:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 15:34:14 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 4/7] platform/x86/amd/pmf: Store commonly used enums
 in the header file
In-Reply-To: <20260301131124.1370565-5-Shyam-sundar.S-k@amd.com>
Message-ID: <8d9ffaa0-ea3c-b685-95f5-1533bf3e3c2b@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Mar 2026, Shyam Sundar S K wrote:

> Relocate commonly used enums from multiple source files into a shared
> header file to simplify code structure, improve readability, and
> enhance maintainability. Also, remove the initialization of the first
> enum member, since it is not needed.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  1 +
>  drivers/platform/x86/amd/pmf/pmf.h            | 22 ------
>  drivers/platform/x86/amd/pmf/spc.c            |  1 +
>  include/linux/amd-pmf-io.h                    |  9 ---
>  include/uapi/linux/amd-pmf.h                  | 74 +++++++++++++++++++
>  5 files changed, 76 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 837d59e7a661..d9751c9ebfe8 100644
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
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 0d879f0fd8e2..f668c0450457 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -681,14 +681,6 @@ enum system_state {
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
> @@ -720,20 +712,6 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
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
> index f48678a23cc7..a40419b5e1b7 100644
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
> index f34c5d744039..00fab9269238 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -32,6 +32,80 @@
>   */
>  #define IOCTL_PMF_POPULATE_DATA		_IOWR(AMD_PMF_IOC_MAGIC, 0x00, struct amd_pmf_ioctl_info)
>  
> +/**
> + * enum laptop_placement - Describes the physical placement of the laptop
> + * @LP_UNKNOWN: Placement cannot be determined
> + * @ON_TABLE: Laptop is placed on a stable surface like a table or desk
> + * @ON_LAP_MOTION: Laptop is on a lap with detected motion
> + * @IN_BAG: Laptop is detected to be inside a bag or case
> + * @OUT_OF_BAG: Laptop has been removed from bag or case
> + * @LP_UNDEFINED: Placement state is undefined
> + *
> + * This enumeration represents the physical placement state of the laptop
> + * as detected by platform sensors. Used for adaptive power management
> + * and thermal policies.
> + */
> +enum laptop_placement {
> +	LP_UNKNOWN,
> +	ON_TABLE,
> +	ON_LAP_MOTION,
> +	IN_BAG,
> +	OUT_OF_BAG,
> +	LP_UNDEFINED,

These look way too generic names to be used in an uapi header, so you'll 
also need to add a prefix.

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
> +
> +/**
> + * enum platform_type - Describes the physical form factor orientation
> + * @PTYPE_UNKNOWN: Platform type cannot be determined
> + * @LID_CLOSE: Laptop lid is closed
> + * @CLAMSHELL: Traditional laptop mode with keyboard and screen
> + * @FLAT: Device is lying flat on a surface
> + * @TENT: Device is in tent mode (keyboard folded back, standing)
> + * @STAND: Device is propped up in stand orientation
> + * @TABLET: Device is in tablet mode with keyboard hidden
> + * @BOOK: Device is in book reading orientation
> + * @PRESENTATION: Device is in presentation mode
> + * @PULL_FWD: Screen is pulled forward towards user
> + * @PTYPE_INVALID: Invalid platform type marker
> + *
> + * This enumeration describes the current physical orientation or form
> + * factor of convertible/2-in-1 devices. Used for optimizing power and
> + * thermal management based on device posture.
> + */
> +enum platform_type {
> +	PTYPE_UNKNOWN,
> +	LID_CLOSE,
> +	CLAMSHELL,
> +	FLAT,
> +	TENT,
> +	STAND,
> +	TABLET,
> +	BOOK,
> +	PRESENTATION,
> +	PULL_FWD,
> +	PTYPE_INVALID = 0xf,

These too are too generic names.

> +};
> +
>  /**
>   * enum pmf_ioctl_id - Control codes for PMF ioctl operations
>   * @IOCTL_POWER_SOURCE: Query current power source (AC/DC)
> 

-- 
 i.

