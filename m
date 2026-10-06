Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0B63DBD41;
	Tue,  6 Oct 2026 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280204; cv=none; b=rez5XJiiSNREJVB91ouI0VENHz0Znfc+dNsRnTeE1TTKLO19W/2sPLWKqKUroHLxudGtL+TgX9sUH6RmO3/RPKjSQpErOxwrcwc0bVVwrmhy/bu7N45OCl91IeZLXrsI8vDdjnn+3YjXNutXmJgyCO8Zv7ulaWCQRUUUjLySKD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280204; c=relaxed/simple;
	bh=86cPkb5v1hgD09TQp59QHaTt5akUvbR5kpSJKQzs+6Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=htU4t+OifM+FEjmIQon0uL8uWzwP9DVC/ByWZHIcVtOxdfMUs5rcgdjn4AY5yXaPohJyt8P8fpj/knZfQCC3IHJY2fAukaeaXyLJ+PVlr5Xobbx/9D3T7RT4cVe32UeCtTnUAHNvyGfVUWbaDZtbkndoxdjMosQjrJtm/cbd4gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0y4FX9U; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0y4FX9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791280201; x=1822816201;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=86cPkb5v1hgD09TQp59QHaTt5akUvbR5kpSJKQzs+6Y=;
  b=J0y4FX9UvMx+7Up9EB81aFH2XsPMT2WXM2p73MZeNWrfIwUQmAYs4Geh
   eegkfUTLCPX5H6IwxNhgSrINlgLke+Dm/wKrOWt/neL30BgNYMfBfhGFI
   h1NxZb8G9jwsGRi4MJkaKzJSLqVFCYZRNItj42jL9H7VRr2+vMUYUPD4A
   fXng5X6bL+2n8DArfz03iLDYApuzs9cgBx4izU/tk4rcYEoVCfvt1freR
   c+pWcsxzRvn5rbaNd5AymOuiBui8no5ATqHmnHDC2xkXG/kJYaO3oe8qh
   oirl//0fnYJ/X9b/hmUqVSXCTlnk0S0B1yZl4lFKuy1F4UvIiucjwF5Wt
   Q==;
X-CSE-ConnectionGUID: qGLtl5NXR1OJhCI39vgv/g==
X-CSE-MsgGUID: rlTu9xvjS32uUJMxdqOm4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="3696"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="3696"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:50:00 -0700
X-CSE-ConnectionGUID: aXcwMIR2QfyUA/x3lCnJNQ==
X-CSE-MsgGUID: dn20gEgXS2C9upo/e7EveA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303378489"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:49:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Oct 2026 12:49:53 +0300 (EEST)
To: Alex Yeo <alexyeo362@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Kenneth Chan <kenneth.t.chan@gmail.com>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2] platform/x86: panasonic-laptop: Add platform_profile
 support
In-Reply-To: <20261006085021.853827-1-alexyeo362@gmail.com>
Message-ID: <de93474c-8d00-0382-bd46-e40f850f0bb9@linux.intel.com>
References: <20261006085021.853827-1-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Oct 2026, Alex Yeo wrote:

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
>  - Missing includes such as sysfs.h were added based on previous
>    feedback.
>  - When raising TDP, fan mode is switched first
>  - When limiting TDP, TDP limit is applied first
>  - ACPI handle for the EC device was used as the EC path varies
>    slightly between models.
>  - This device is optional: keep hotkey and everything already
>    loaded if profile driver fails for any reason.
> 
> Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
> ---
> v1: https://lore.kernel.org/platform-driver-x86/20260805180544.1134916-1-alexyeo362@gmail.com
> 
> v2:
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
>  drivers/platform/x86/panasonic-laptop.c | 398 +++++++++++++++++++++++-
>  2 files changed, 398 insertions(+), 1 deletion(-)
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
> index 19d194ff37ca..b6b4a9fc9841 100644
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
> @@ -130,9 +134,12 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
> +#include <linux/printk.h>
>  #include <linux/seq_file.h>
>  #include <linux/serio.h>
>  #include <linux/slab.h>
> +#include <linux/sysfs.h>

Thanks for the update.

I no longer recall if I suggested adding sysfs.h in the earlier review 
but I cannot now seem to locate anything that would be directly related to 
sysfs in this patch.

>  #include <linux/types.h>
>  #include <linux/uaccess.h>
>  #include <acpi/video.h>
> @@ -158,10 +165,37 @@ MODULE_LICENSE("GPL");
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
> @@ -251,6 +285,104 @@ struct pcc_acpi {
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
> +
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
> +
>  /*
>   * On some Panasonic models the volume up / down / mute keys send duplicate
>   * keypress events over the PS/2 kbd interface, filter these out.
> @@ -1143,4 +1275,268 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
>  	kfree(pcc);
>  }
>  
> -module_platform_driver(acpi_pcc_driver);
> +static int pcc_profile_fan_mode_get(struct pcc_profile *pcc, enum pcc_profile_fan_mode *fan_mode)
> +{
> +	unsigned long long state;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_integer(pcc->ec_handle, "CEFM", NULL, &state);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("cannot get fan mode via CEFM\n");
> +		return -EIO;
> +	}
> +
> +	if (state == PCC_ACPI_FAN_ACTIVE_MODE)
> +		*fan_mode = PCC_FAN_MODE_ACTIVE;
> +	else if (state == PCC_ACPI_FAN_PASSIVE_MODE)
> +		*fan_mode = PCC_FAN_MODE_PASSIVE;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int pcc_profile_tdp_mode_get(struct pcc_profile *pcc, enum pcc_profile_tdp_mode *tdp_mode)
> +{
> +	unsigned long long state;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_integer(pcc->ec_handle, "EPLE", NULL,
> +				       &state);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("cannot read power limit using EPLE\n");
> +		return -EIO;
> +	}
> +
> +	if (state == PCC_ACPI_TDP_LIMIT_ON)
> +		*tdp_mode = PCC_TDP_MODE_LOCKED;
> +	else if (state == PCC_ACPI_TDP_LIMIT_OFF)
> +		*tdp_mode = PCC_TDP_MODE_UNLOCKED;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int pcc_profile_ec_execute(struct pcc_profile *pcc, char *method, u64 arg)
> +{
> +	acpi_status status;
> +
> +	status = acpi_execute_simple_method(pcc->ec_handle, method, arg);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("failed to execute EC method %s\n", method);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pcc_profile_fan_mode_set(struct pcc_profile *pcc, enum pcc_profile_fan_mode fan_mode)
> +{
> +	switch (fan_mode) {
> +	case PCC_FAN_MODE_ACTIVE:
> +		return pcc_profile_ec_execute(pcc, "SEFM", PCC_ACPI_FAN_ACTIVE_MODE);
> +	case PCC_FAN_MODE_PASSIVE:
> +		return pcc_profile_ec_execute(pcc, "SEFM", PCC_ACPI_FAN_PASSIVE_MODE);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int pcc_profile_tdp_mode_set(struct pcc_profile *pcc, enum pcc_profile_tdp_mode tdp_mode)
> +{
> +	switch (tdp_mode) {
> +	case PCC_TDP_MODE_LOCKED:
> +		return pcc_profile_ec_execute(pcc, "SEPL", PCC_ACPI_TDP_LIMIT_ON);
> +	case PCC_TDP_MODE_UNLOCKED:
> +		return pcc_profile_ec_execute(pcc, "SEPL", PCC_ACPI_TDP_LIMIT_OFF);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int pcc_profile_platform_profile_get(struct device *dev,
> +					    enum platform_profile_option *profile)
> +{
> +	struct pcc_profile *pcc = dev_get_drvdata(dev);
> +	enum platform_profile_option pp_opt;
> +	enum pcc_profile_fan_mode fan_mode;
> +	enum pcc_profile_tdp_mode tdp_mode;
> +	int err;
> +
> +	err = pcc_profile_fan_mode_get(pcc, &fan_mode);
> +	if (err)
> +		return err;
> +
> +	err = pcc_profile_tdp_mode_get(pcc, &tdp_mode);
> +	if (err)
> +		return err;
> +
> +	for (pp_opt = 0; pp_opt < ARRAY_SIZE(pcc->quirks->platform_profiles); pp_opt++) {
> +		const struct pcc_platform_profile *pcc_profile =
> +			&pcc->quirks->platform_profiles[pp_opt];
> +
> +		if (tdp_mode == pcc_profile->tdp_mode &&
> +		    fan_mode == pcc_profile->fan_mode) {
> +			*profile = pp_opt;
> +			return 0;
> +		}
> +	}
> +
> +	*profile = PLATFORM_PROFILE_CUSTOM;
> +	return 0;
> +}
> +
> +static int pcc_profile_platform_profile_set_profile(struct pcc_profile *pcc,
> +						    enum pcc_profile_fan_mode fan_mode,
> +						    enum pcc_profile_tdp_mode tdp_mode)
> +{
> +	int err;
> +
> +	switch (tdp_mode) {
> +	case PCC_TDP_MODE_UNLOCKED:
> +		err = pcc_profile_fan_mode_set(pcc, fan_mode);
> +		if (err)
> +			return err;
> +
> +		return pcc_profile_tdp_mode_set(pcc, tdp_mode);
> +	case PCC_TDP_MODE_LOCKED:
> +		err = pcc_profile_tdp_mode_set(pcc, tdp_mode);
> +		if (err)
> +			return err;
> +
> +		return pcc_profile_fan_mode_set(pcc, fan_mode);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int pcc_profile_platform_profile_set(struct device *dev,
> +					    enum platform_profile_option profile)
> +{
> +	struct pcc_profile *pcc = dev_get_drvdata(dev);
> +	const struct pcc_platform_profile *pcc_profile = &pcc->quirks->platform_profiles[profile];
> +
> +	return pcc_profile_platform_profile_set_profile(pcc,
> +						pcc_profile->fan_mode,
> +						pcc_profile->tdp_mode);
> +}
> +
> +static int pcc_profile_platform_profile_probe(void *drvdata, unsigned long *choices)
> +{
> +	enum platform_profile_option pp_opt;
> +	struct pcc_profile *pcc = drvdata;
> +
> +	for (pp_opt = 0; pp_opt < ARRAY_SIZE(pcc->quirks->platform_profiles); pp_opt++) {
> +		const struct pcc_platform_profile *profile =
> +			&pcc->quirks->platform_profiles[pp_opt];
> +
> +		if (profile->fan_mode != PCC_FAN_MODE_UNSET &&
> +		    profile->tdp_mode != PCC_TDP_MODE_UNSET) {
> +			set_bit(pp_opt, choices);
> +		} else if (WARN_ON(profile->fan_mode != PCC_FAN_MODE_UNSET ||
> +				   profile->tdp_mode != PCC_TDP_MODE_UNSET)) {
> +			/* Both TDP and fan mode should be set */
> +			return -EINVAL;
> +		}

First check the error and return.

Then check double UNSET case and use continue.

Lastly, else is no longer needed for the set_bit() in the remaining cases.

> +	}
> +
> +	return 0;
> +}
> +
> +static const struct platform_profile_ops pcc_platform_profile_ops = {
> +	.probe = pcc_profile_platform_profile_probe,
> +	.profile_get = pcc_profile_platform_profile_get,
> +	.profile_set = pcc_profile_platform_profile_set,
> +};
> +
> +static int pcc_profile_driver_probe(struct platform_device *pdev)
> +{
> +	const struct dmi_system_id *dmi_id;
> +	struct acpi_device *ec_adev;
> +	struct pcc_profile *pcc;
> +
> +	dmi_id = dmi_first_match(pcc_profile_quirks);
> +	if (!dmi_id)
> +		return -ENODEV;
> +
> +	pcc = devm_kzalloc(&pdev->dev, sizeof(*pcc), GFP_KERNEL);
> +	if (!pcc)
> +		return -ENOMEM;
> +
> +	ec_adev = acpi_dev_get_first_match_dev("PNP0C09", NULL, -1);
> +	if (!ec_adev)
> +		return -ENODEV;
> +
> +	pcc->ec_handle = ec_adev->handle;
> +	acpi_dev_put(ec_adev);
> +
> +	pcc->quirks = dmi_id->driver_data;
> +
> +	pcc->platform_profile_dev =
> +		devm_platform_profile_register(&pdev->dev,
> +					       PROFILE_PCC_DRIVER_NAME,
> +					       pcc,
> +					       &pcc_platform_profile_ops);
> +	if (IS_ERR(pcc->platform_profile_dev)) {
> +		return dev_err_probe(&pdev->dev,
> +				     PTR_ERR(pcc->platform_profile_dev),
> +				     "failed to register platform profiles\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver profile_pcc_driver = {
> +	.probe = pcc_profile_driver_probe,
> +	.driver = {
> +		.name = PROFILE_PCC_DRIVER_NAME,
> +	},
> +};
> +
> +static struct platform_device *profile_pdev;
> +
> +static int __init panasonic_module_init(void)
> +{
> +	int err;
> +
> +	err = platform_driver_register(&acpi_pcc_driver);
> +	if (err)
> +		return err;
> +
> +	if (!dmi_check_system(pcc_profile_quirks))
> +		return 0;
> +
> +	err = platform_driver_register(&profile_pcc_driver);
> +	if (err) {
> +		pr_warn("failed to register profile driver: %d\n", err);
> +		return 0;
> +	}
> +
> +	profile_pdev = platform_device_register_simple(PROFILE_PCC_DRIVER_NAME,
> +						       PLATFORM_DEVID_NONE,
> +						       NULL, 0);
> +	if (IS_ERR(profile_pdev)) {
> +		err = PTR_ERR(profile_pdev);
> +		pr_warn("failed to register profile device: %d\n", err);
> +
> +		profile_pdev = NULL;
> +		platform_driver_unregister(&profile_pcc_driver);
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit panasonic_module_exit(void)
> +{
> +	if (profile_pdev) {
> +		platform_device_unregister(profile_pdev);
> +		platform_driver_unregister(&profile_pcc_driver);
> +	}
> +
> +	platform_driver_unregister(&acpi_pcc_driver);
> +}
> +
> +module_init(panasonic_module_init);
> +module_exit(panasonic_module_exit);
> 

-- 
 i.

