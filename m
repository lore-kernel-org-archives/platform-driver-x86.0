Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086704756DD;
	Fri, 16 Oct 2026 11:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149150; cv=none; b=dIiUSUYNU5EQiGex4wBPLAG2EWEozFYe2HYkzxLtZFdRLoyBAix0sH6Cg4/RhIMhfwEf6LBc85jmLAjzCvtcYS5UQjrXRrJhOM1G+pT2rJlbSudxjpMzCRdcUl+FYwDQNk5LUwJo/LQPK0mwghZ7GGloXeb1zbS/KUnO1p/mnHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149150; c=relaxed/simple;
	bh=4VJ2z5A9KKIT6W0gydKidsgD20kaen4w5A0B+vkmkJQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AJJkXHHn5sh4qzumv2rdo7tdflQiuQhXpXrPKcqvYMrHX0m3FYzojehg/+Z280hRxy/i37r+nlVx5ocau+g6Pqr/08U5vxSKmNVW+Qd2lk4cdRjOEUGIAlY9lzgZ9pe8g7MvwmuR9uLf02KHWNva1kmHbFYAU/shcDziLZ+wPYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhWQ1Qc0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhWQ1Qc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792149147; x=1823685147;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4VJ2z5A9KKIT6W0gydKidsgD20kaen4w5A0B+vkmkJQ=;
  b=jhWQ1Qc0QSmp86XmyIZOtkfU4tUHPhFEOwaV8Pa/RgsM3OGH6LeDKEJi
   /o2uBedBTNftaD5BtaToz/ySAQgKUgw2hAprKqolDjATZkm2ogA0LHKDd
   4S/dJ7WeJIGry973PbRCbnCUbDVUQsuoEM3/AJYPO9C1l3UdBIjKgq/3y
   HFWMQBgkilStmPU6Kaa7z8cUrvRtu5OSyZbZCTCry+b0jv2u2+1jJG9AH
   EnQLqilil7yDFUobnriC3c+Sr4dW4q2X2QSZX60JcUGtJFYotN8A90Vdh
   Wm3u32enoFcTyigBZTmSF5TtW7Wk7hLWc4kERzrZHx0yK5Vvkh0mhYuLf
   Q==;
X-CSE-ConnectionGUID: hVO7eo90T8WiR8mGH7zehA==
X-CSE-MsgGUID: CrHW76BiS5SSkfx/VpTa3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="814772"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="814772"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:12:26 -0700
X-CSE-ConnectionGUID: z22QST8jRWu6IMdnIuF33A==
X-CSE-MsgGUID: oRwvTB6jSSKuG39AuXvJjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1880042"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:12:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 Oct 2026 14:12:18 +0300 (EEST)
To: Alex Yeo <alexyeo362@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Kenneth Chan <kenneth.t.chan@gmail.com>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v3] platform/x86: panasonic-laptop: Add platform_profile
 support
In-Reply-To: <20261007190446.38862-1-alexyeo362@gmail.com>
Message-ID: <31bc2c6d-5d06-e278-a701-0bd4138598f9@linux.intel.com>
References: <20261007190446.38862-1-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Oct 2026, Alex Yeo wrote:

> Expose firmware thermal and power management policies via the
> platform_profile interface.
> 
> Supported and tested models:
>  - CF-RZ6 (2016)
>  - CF-SV8 (2019)
>  - CF-QV9 (2020)
>  - CF-SR4 (2024)
> 
> Firmware fan operating mode and the TDP limit switch are mapped onto
> the Linux platform_profile ABI.
> 
> This implementation queries the firmware for every get().
> CUSTOM is returned when the current state is not recognized.
> The set() callback writes the values regardless of what the
> current fan mode and TDP limit is.
> 
>  - Introduce as separate platform_driver
>  - Used DEFINE for driver and platform_profile device name
>  - DMI quirks restrict support to tested models
>  - When raising TDP, fan mode is switched first
>  - When limiting TDP, TDP limit is applied first
>  - ACPI handle for the EC device was used as the EC path varies
>    slightly between models.
>  - This device is optional: keep hotkey and everything already
>    loaded if profile driver fails for any reason.
> 
> Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
> ---
> v3:
>  - Removed sysfs.h import
>  - Refactored platform profile probe function to use a different pattern
>    (check warn_on, continue on double unset, then set)
> 
> v2: https://lore.kernel.org/platform-driver-x86/20261006085021.853827-1-alexyeo362@gmail.com/
>  - Refactored code to use its own platform_driver
>  - Removed DEFINE_FREE and its corresponding __free as its addition
>    in this module is inappropriate
>  - Removed pr_fmt line as its addition to this patch is inappropriate
>  - Added DMI check during __init to prevent attempt of platform profile
>    device loading on unsupported hardware
>  - Fixed use of enums as truth values by adding explicit comparisons
>  - Added *profile_pdev to keep track of new platform_driver
>  - Removed extra spaces in the quirk definitions
>  - Added helper function for calling EC methods for simplicity
>  - Use ARRAY_SIZE() for for loops and added include for array_size.h
>  - Refactored pcc_profile to be a pointer in platform profile set
>    function
>  - Use WARN_ON() when a malformed quirk is detected in the platform
>    profile probe function
>  - Avoid use of status as variable name if not acpi_status
>  - Added Kconfig line for ACPI_PLATFORM_PROFILE
>  - Removed bool .use_platform_profiles from the quirks struct as it is
>    no longer needed as a result of the platform_driver being separate.
>  - Moved DMI quirk matching in probe function before devm_kzalloc of
>    driver struct
> 
> v1: https://lore.kernel.org/platform-driver-x86/20260805180544.1134916-1-alexyeo362@gmail.com/
> 
> This RFC patch adds support for mapping firmware thermal and CPU power
> operating policy to platform_profile for Panasonic Let's Note laptops.
> This originally started as a hwmon and thermal patch, but further
> analysis had revealed that these are firmware power and thermal
> policies as opposed to fan control.
> 
> Panasonic firmware exposes firmware operating policy through two
> methods:
>  - Fan cooling policy (active/passive)
>  - Processor TDP limit (capped/uncapped)
> 
> At boot, firmware defaults to an active cooling policy with the
> CPU TDP capped. Vendor drivers / DPTF normally unlocks this on
> Windows.
> 
> These 2 methods map to 4 possible distinct states. Only states that
> correspond to the platform_profile ABI are mapped and exposed as
> choices. Unmapped states will be returned as "custom" by the driver.
> 
> I have tested the following models:
>  - CF-RZ6 (2016)
>  - CF-SV8 (2019)
>  - CF-QV9 (2020)
>  - CF-SR4 (2024)
> 
> State to platform_profile mapping:
> 
>  Profile                         | Fan Mode  | TDP
> +--------------------------------+-----------+------------+
>  PLATFORM_PROFILE_COOL (SR4 only)| Active    | Locked
>  PLATFORM_PROFILE_BALANCED       | Active    | Locked
>  PLATFORM_PROFILE_QUIET          | Passive   | Locked
>  PLATFORM_PROFILE_PERFORMANCE    | Active    | Unlocked
>  CUSTOM (unmapped on all)        | Passive   | Unlocked
> 
> Across all of them, the fan and TDP modes are toggled by the same ACPI
> methods. However, there is a slight variation in its interpretation based
> on testing results.
> 
> These methods are normally called by the DPTF/IPF _OSC handshake.
> Depending on the capability bits, the firmware will alter its thermal
> and power policy.
> 
> \_SB.IETM Implementation A:
>  - CF-RZ6 (2016)
>  - CF-SV8 (2019)
> 
> \_SB.IETM Implementation B:
>  - CF-QV9 (2020)
>  - CF-SR4 (2024)
> 
> Models belonging to the same group share what appears to be identical
> AML code for the _OSC.
> 
> This patch only exposes the ability to read and set these firmware
> toggles. The get() callback queries current firmware state and returns
> the mapped platform_profile. The set() callback sets the target state
> regardless of current state.
> 
> Proposed mappings in this patch are defined in the quirks struct.
> Activation of platform_profile is gated by DMI checks.
> 
> For every model except the SR4, only balanced and performance profiles
> are defined. This is because the aggressive fan paired with the locked
> TDP on the SR4 more appropriately correspond to the cool profile.
> 
> Test results for the proposed mappings are below.
> 
> Test results:
> ================
> (CPU PkgWatt: peak / sustained)
> (Sysbench CPU: all available threads)
> 
> CF-RZ6: (i5-7Y57, Startup default: Balanced)
> 
>  Platform Profile |  CPU PkgWatt    |  Sysbench CPU  | Stress Temp (CPU)
> +-----------------+-----------------+----------------+-------------------+
>  BALANCED         |  10.0W / 9.0W   |    19712       |   57C
>  PERFORMANCE      |  18.9W / 14.9W  |    29132       |   72C
> 
> CF-SV8: (i5-8365U, Startup default: Balanced)
> 
>  Platform Profile |  CPU PkgWatt     |  Sysbench CPU  | Stress Temp (CPU)
> +-----------------+------------------+----------------+-------------------+
>  BALANCED         |  9.9W  / 9.9W    |    44695       |   58C
>  PERFORMANCE      |  29.0W / 19.9W   |    71747       |   81C
> 
> CF-QV9: (i5-10310U, Startup default: Balanced)
> 
>  Platform Profile |  CPU PkgWatt     |  Sysbench CPU  | Stress Temp (CPU)
> +-----------------+------------------+----------------+-------------------+
>  BALANCED         |  10.0W / 9.9W    |    46545       |   59C
>  PERFORMANCE      |  18.9W / 14.9W   |    57416       |   70C
> 
> CF-SR4: (i5-1345U, Startup default: Cool)
> 
>  Platform Profile |  CPU PkgWatt     |  Sysbench CPU  | Stress Temp (CPU)
> +-----------------+------------------+----------------+-------------------+
>  COOL             |  12.0W / 12.0W   |    177139      |   66C
>  QUIET            |  12.0W / 12.0W   |    176315      |   73C-75C
>  PERFORMANCE      |  29.6W / 21.3W   |    247602      |   98C-100C
> 
> CF-SR4 Notes:
>  - QUIET: downclock/throttle at 75C, no increase in package_throttle_count
>  - PERFORMANCE: stable boost clock, package_throttle_count increase
> 
> 
> Other notes:
> ===============
> 
> Additional notes about thermald:
> During testing, I have observed that running thermald for the first time
> since boot will trigger an _OSC negotiation that will unlock CPU TDP for
> new models (IETM Implementation B). Once thermald is running, exits or
> runs again, these bits were not observed to change again during testing.
> 
> Running thermald on older models (IETM Implementation A) does not touch
> the fan curve or TDP mode setting.
> 
> Suspend: observed to not alter the values set prior to suspend
> 
>  drivers/platform/x86/Kconfig            |   1 +
>  drivers/platform/x86/panasonic-laptop.c | 399 +++++++++++++++++++++++-
>  2 files changed, 399 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 957034f39e4e..571c09152310 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -820,6 +820,7 @@ config PANASONIC_LAPTOP
>  	depends on ACPI_VIDEO=n || ACPI_VIDEO
>  	depends on SERIO_I8042 || SERIO_I8042 = n
>  	select INPUT_SPARSEKMAP
> +	select ACPI_PLATFORM_PROFILE
>  	help
>  	  This driver adds support for access to backlight control and hotkeys
>  	  on Panasonic Let's Note laptops.
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index 19d194ff37ca..c4b13a3554e3 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -120,9 +120,13 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
>  #include <linux/backlight.h>
>  #include <linux/bits.h>
>  #include <linux/ctype.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
>  #include <linux/i8042.h>
>  #include <linux/init.h>
>  #include <linux/input.h>
> @@ -130,6 +134,8 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
> +#include <linux/printk.h>
>  #include <linux/seq_file.h>
>  #include <linux/serio.h>
>  #include <linux/slab.h>
> @@ -158,10 +164,37 @@ MODULE_LICENSE("GPL");
>  #define ECO_MODE_OFF		0x00
>  #define ECO_MODE_ON		0x80
>  
> +#define PCC_ACPI_FAN_ACTIVE_MODE	0x00
> +#define PCC_ACPI_FAN_PASSIVE_MODE	0x01
> +#define PCC_ACPI_TDP_LIMIT_ON		0x01
> +#define PCC_ACPI_TDP_LIMIT_OFF		0x00
> +
>  #define ACPI_PCC_DRIVER_NAME	"Panasonic Laptop Support"
> +#define PROFILE_PCC_DRIVER_NAME	"panasonic-platform-profile"
>  
>  #define ACPI_PCC_INPUT_PHYS	"panasonic/hkey0"
>  
> +enum pcc_profile_fan_mode {
> +	PCC_FAN_MODE_UNSET = 0,
> +	PCC_FAN_MODE_ACTIVE,
> +	PCC_FAN_MODE_PASSIVE,
> +};
> +
> +enum pcc_profile_tdp_mode {
> +	PCC_TDP_MODE_UNSET = 0,
> +	PCC_TDP_MODE_LOCKED,
> +	PCC_TDP_MODE_UNLOCKED,
> +};
> +
> +struct pcc_platform_profile {
> +	enum pcc_profile_fan_mode fan_mode;
> +	enum pcc_profile_tdp_mode tdp_mode;
> +};
> +
> +struct pcc_profile_quirk {
> +	struct pcc_platform_profile platform_profiles[PLATFORM_PROFILE_LAST];
> +};
> +
>  /* LCD_TYPEs: 0 = Normal, 1 = Semi-transparent
>     ECO_MODEs: 0x03 = off, 0x83 = on
>  */
> @@ -251,6 +284,104 @@ struct pcc_acpi {
>  	u32			sinf[] __counted_by(num_sifr);
>  };
>  
> +struct pcc_profile {
> +	acpi_handle			ec_handle;
> +	const struct pcc_profile_quirk	*quirks;
> +	struct device			*platform_profile_dev;
> +};
> +
> +static struct pcc_profile_quirk quirk_cf_sr4 = {
> +	.platform_profiles = {
> +		[PLATFORM_PROFILE_QUIET] = {
> +			.fan_mode = PCC_FAN_MODE_PASSIVE,
> +			.tdp_mode = PCC_TDP_MODE_LOCKED,
> +		},
> +		[PLATFORM_PROFILE_COOL] = {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_LOCKED,
> +		},
> +		[PLATFORM_PROFILE_PERFORMANCE] = {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
> +		},
> +	},
> +};
> +
> +static struct pcc_profile_quirk quirk_cf_qv9 = {
> +	.platform_profiles = {
> +		[PLATFORM_PROFILE_BALANCED] = {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_LOCKED,
> +		},
> +		[PLATFORM_PROFILE_PERFORMANCE] = {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
> +		},
> +	},
> +};
> +
> +static struct pcc_profile_quirk quirk_cf_sv8 = {
> +	.platform_profiles = {
> +		[PLATFORM_PROFILE_BALANCED] = {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_LOCKED,
> +		},
> +		[PLATFORM_PROFILE_PERFORMANCE] = {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
> +		},
> +	},
> +};
> +
> +static struct pcc_profile_quirk quirk_cf_rz6 = {
> +	.platform_profiles = {
> +		[PLATFORM_PROFILE_BALANCED] = {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_LOCKED,
> +		},
> +		[PLATFORM_PROFILE_PERFORMANCE] = {
> +			.fan_mode = PCC_FAN_MODE_ACTIVE,
> +			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
> +		},
> +	},
> +};

Multiple of these look exact duplicates. In such cases, we try to reuse 
the same struct even if we cannot then exactly match the name with the 
model.

> +static const struct dmi_system_id pcc_profile_quirks[] = {
> +	{
> +		.ident = "Panasonic Connect Co., Ltd. CFSR4-1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Connect Co., Ltd."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFSR4-1"),
> +		},
> +		.driver_data = &quirk_cf_sr4,
> +	},
> +	{
> +		.ident = "Panasonic Corporation CFQV9-1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFQV9-1"),
> +		},
> +		.driver_data = &quirk_cf_qv9,
> +	},
> +	{
> +		.ident = "Panasonic Corporation CFSV8-2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFSV8-2"),
> +		},
> +		.driver_data = &quirk_cf_sv8,
> +	},
> +	{
> +		.ident = "Panasonic Corporation CFRZ6-2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFRZ6-2"),
> +		},
> +		.driver_data = &quirk_cf_rz6,
> +	},
> +	{},
> +};

-- 
 i.
