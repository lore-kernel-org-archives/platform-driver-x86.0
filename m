Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440556;
	b=bVfk1TaF+q2cTuuj7KlN7eD5Q+kBZ2VqNQswXFd8Jf3lDhWJf7PIVxENgEl2W9xkgP7u
	 2IBLtyLEijTisgzAVjtTHko3SRtugW6cst9x+xaurKddJt7p5Pe/em5R++msDfl47zYBv
	 wn0k4xu2wHVG6sBC+/QotcW6ntWiJHtxZsDxLJh7D3P1eXDak1oukT4dYLoBBQZKGJM3A
	 clREo53hy+Psk7dZC44LhVVQe2PumtX9a+/nMBXxHbjatV8DlYggNaookkMyRchYMUdC0
	 FwLCrjCETKZnWYh9+7IOFqvrYQmJeGMsyGHNbJlPiUf8VMqVlKGznRpiyBTJ35a7SRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440556;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=4M+kCCPRD/tJhsI7e+ckRprxkIaFig1Cd1fJSTUmv40=;
	b=maCYXJpiZPBEZ91ZLMm9Dd6Io0aIU1ROYXhgIfNcntCp9gL/on0cC9GDooG60Syp6uB2
	 YxGhtfnQF88WEO+DM8QqfB6OFgiEXSbJOrKiLf2eZk1wsLVKWLj8dCsWKlpReq9c04vH2
	 Lxb/vZTA1ONjruRfBmv0Iey0C/yZNHVHewJ+GeKUBeP2uyozxVMk/RL+UU8gnZuN/RMf3
	 yJ3m7DRdncFV/SBQoYlyv+EuE57tq3nagAriWlwPN0xKH5xx9GhUQxTvqWY6DLv4beemg
	 J55jvYcwN8mftygc3VOm0uTjLCsNej96bjLtYs2lX3IlIxarfC3p4dXAsxCn4BsEOng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZjoIO11v;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F2606A31A;
	Mon, 23 Nov 2026 13:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 571F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZjoIO11v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795440556; x=1826976556;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=B1lNJGDGGZyRfnJOknlOlOhGJJoaLh++XtkP/sOhk6c=;
  b=ZjoIO11v57jEFkRNXOgVyblvXf1UR0djm5bDRg6fA3ron7taCw3UV2Gh
   dDLhijoaHnvDZnBzUcU3njUAJ7OmZFcxXS0wX1elbWRK1rChfgxKE+yDa
   WzXhHWXfH4XzStelS23Cgu3ZXBAosco1XYrbd2ZQGz90hyIXBfhbXIdtM
   nyTyFOP0m642td/Cu3oxBbOeOWtDin+BcDf/7acJgPaekFB7a5D829YBO
   WLnfj9P9eDThXx539U5rEPMfK0pmT2CVGrx985p8zOTw31BbSKaY3ofHS
   fAn2gRy99C1aMGNZzedgtxIvF6P3lzTiHhSwRbp5kh6z5nHnz4vyfwtPc
   Q==;
X-CSE-ConnectionGUID: EFCpd7WzSQKNEHxnsXQXoA==
X-CSE-MsgGUID: 3qj9jAMoRtuet6v/+PDr2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4121549"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4121549"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 05:29:15 -0800
X-CSE-ConnectionGUID: ArURMcyXRz+WIPHG8crluA==
X-CSE-MsgGUID: evFlCUAPQQ2ysOJ5V7RQ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="13098881"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 05:29:11 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 15:29:08 +0200 (EET)
To: Alex Yeo <alexyeo362@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Kenneth Chan <kenneth.t.chan@gmail.com>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v4] platform/x86: panasonic-laptop: Add platform_profile
 support
In-Reply-To: <20261025191300.1259541-1-alexyeo362@gmail.com>
Message-ID: <5e490faf-8a52-cd3a-8e29-24b9f0bc0215@linux.intel.com>
References: <20261025191300.1259541-1-alexyeo362@gmail.com>
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

On Mon, 26 Oct 2026, Alex Yeo wrote:

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

Avoid "This patch/implementation/series ..." openings in changelog. Start 
with:

Query the firmware ...

> CUSTOM is returned when the current state is not recognized.
> The set() callback writes the values regardless of what the
> current fan mode and TDP limit is.
> 
>  - Introduce as separate platform_driver


>  - Used DEFINE for driver and platform_profile device name
>  - DMI quirks restrict support to tested models

Drop these 2.

>  - When raising TDP, fan mode is switched first
>  - When limiting TDP, TDP limit is applied first
>  - ACPI handle for the EC device was used as the EC path varies
>    slightly between models.

>  - This device is optional: keep hotkey and everything already
>    loaded if profile driver fails for any reason.
>  - Common fan/power settings are shared by a quirk_default struct to
>    avoid duplication of similar structs.

These two are overly verbose in the current form so try to shorten them.

Write all these on the list without bullets points into normal text.

We generally don't describe algorithms as bullet points, using LLMs will 
easily get you wrong when it comes to this so you need to pay attention.

> Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
> ---
> v4:
>  - Consolidated separate quirk structs for the RZ6, QV9 and SV8 into a
>    quirk_default struct.

Can you send v5 as a proper series. As the other patch was posted into the 
same thread, my tool picks it and not this one.

And why is this still RFC?

> v3: https://lore.kernel.org/platform-driver-x86/20261007190446.38862-1-alexyeo362@gmail.com/
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
>  drivers/platform/x86/panasonic-laptop.c | 373 +++++++++++++++++++++++-
>  2 files changed, 373 insertions(+), 1 deletion(-)
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
> index 19d194ff37ca..e929d2527fb9 100644
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
> @@ -251,6 +284,78 @@ struct pcc_acpi {
>  	u32			sinf[] __counted_by(num_sifr);
>  };
>  
> +struct pcc_profile {
> +	acpi_handle			ec_handle;
> +	const struct pcc_profile_quirk	*quirks;
> +	struct device			*platform_profile_dev;
> +};
> +
> +static struct pcc_profile_quirk quirk_default = {
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
> +		.driver_data = &quirk_default,
> +	},
> +	{
> +		.ident = "Panasonic Corporation CFSV8-2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFSV8-2"),
> +		},
> +		.driver_data = &quirk_default,
> +	},
> +	{
> +		.ident = "Panasonic Corporation CFRZ6-2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFRZ6-2"),
> +		},
> +		.driver_data = &quirk_default,
> +	},
> +	{},
> +};
> +
>  /*
>   * On some Panasonic models the volume up / down / mute keys send duplicate
>   * keypress events over the PS/2 kbd interface, filter these out.
> @@ -1143,4 +1248,270 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
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
> +		/* Both TDP and fan mode should be set */
> +		if (WARN_ON((profile->fan_mode != PCC_FAN_MODE_UNSET) !=
> +			    (profile->tdp_mode != PCC_TDP_MODE_UNSET)))
> +			return -EINVAL;
> +
> +		if (profile->fan_mode == PCC_FAN_MODE_UNSET &&
> +		    profile->tdp_mode == PCC_TDP_MODE_UNSET)
> +			continue;
> +
> +		set_bit(pp_opt, choices);
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

