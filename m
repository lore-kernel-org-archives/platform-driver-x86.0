Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B3437A843;
	Mon, 28 Sep 2026 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597697; cv=none; b=fq/vNvXe0GNSXtZKQ6dOgOVXzyZjNIi2Hv8gUTiR3NV3V/z48nR/GjMXPo3mtrtKvedYuyBFamt0kui37yqfe7Z2EvNIhTZCcfeL56DgxgfGVt/IUhn0QO6J49xzlRVD4O8uEKEWdtnGdZurk1ZjytQ80FLaGx28blHDaZVaHQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597697; c=relaxed/simple;
	bh=Tw3CZkCliOCfLQ1syvy6zxLXShbdpMWWf7IdvtU6FPY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mbCKEluDYnpCPIoDt5NhY1mnbDrK/FXQnWZ9O7FEkzgmptUQX0Yhsn30tgJ+zxVlw3g0luyqIAQdewHTNOfZUVnTVPIv50C0W9QhpV68vCrjfYHlOh1hIAX9OhqbBn62nihlm7R9qfJA3VsRXrhHELuGo6y8cAPBJBi00/hcGi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mqt86eZP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mqt86eZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790597696; x=1822133696;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Tw3CZkCliOCfLQ1syvy6zxLXShbdpMWWf7IdvtU6FPY=;
  b=Mqt86eZP5CqQpu9x0uuWl4+Gs5SyKSTyOLTd0F6t60lTk9wh7T7+47mS
   3vkUghtAO2K07Vpe1F05CO+6CMbZ+G6UJapifcgHNp//T9rd2rtYyEN3S
   4BXgzjmCYsiWkA+f1LEyqHSYXLtbanO4nCf04sOGfUA+aD2XYeU76vq3R
   JFN5siuh5TzTDQKVITCCUiuQIXRKjMShVvRbYgIR9wTba8qVU0x+8xy02
   Ahkf/WAaV/sCXtR4ntp13fbdcYS8zu9niWx+RtIz3XlBEyQ1pbxnhaA66
   A8YBIhPamAmjRHRg06VtJlZZUstKu4b7ea5nLj63za6fOjvMTWrfBt8iP
   Q==;
X-CSE-ConnectionGUID: KQt/lMK5TtGGJMoTwfs5Kg==
X-CSE-MsgGUID: TL8B3poCSKKKD9eqzp1/UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="100627342"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="100627342"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:14:55 -0700
X-CSE-ConnectionGUID: 6a24gDSiTGuMDSTAOfjfcw==
X-CSE-MsgGUID: SyzGaz1QSlqEONsYktBFfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="278235616"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.109])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:14:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 28 Sep 2026 15:14:48 +0300 (EEST)
To: TuteMthCD <matias.civadda2342001@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, W_Armin@gmx.de, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: bitland-mifs-wmi: Fix TM2107 profile
 handling
In-Reply-To: <20260928064918.80526-1-matias.civadda2342001@gmail.com>
Message-ID: <96e4c5f6-cca2-256f-88bb-c9db9dac3dfd@linux.intel.com>
References: <20260928064918.80526-1-matias.civadda2342001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Sep 2026, TuteMthCD wrote:

> On the TIMI Redmi Book Pro 14 2022 (TM2107), the MIFS WMI response uses
> a different layout from the one currently assumed by the driver.
> This causes profile reads to fail or report an incorrect profile.
> 
> The response contains a 30-byte OutData field followed by a 16-bit
> Reserved field. On this model, the profile value is returned in
> OutData[2], while the return code is stored in the trailing 16-bit
> field.
> 
> Selecting the modes in GCommandCenter and reading the WMI response
> on this machine yielded the following values:
> 
> 0: performance
> 1: balanced
> 2: quiet
> 
> Handle this model through DMI-specific driver_data, normalize its
> response layout, and map its profile values correctly. Expose only
> the three supported profiles.
> 
> Require external power for performance mode, including the original
> USB-C charger, matching the behavior observed in GCommandCenter.
> Skip the adapter-type query on this model.
> 
> Build-tested against pdx86/for-next with W=1. Built and tested on
> Linux 7.2.7-zen1-1-zen on a Redmi Book Pro 14 2022 (TM2107).
> Verified profile switching, performance selection with the USB-C
> charger connected, and rejection while running on battery.
> 
> Link: https://lkml.iu.edu/2608.2/00163.html
> Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
> Assisted-by: LLM
> Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>

As mentioned earlier, this sign off is not enough. You should use your 
real name to signoff the patch, not some nick.

> ---
> Changes since v1:
> - Rebased on pdx86/for-next.
> - Use a generic DMI table with per-model driver_data.
> - Add the DMI dependency.
> - Normalize the response layout before validating the return code
>   and function ID.
> - Correct the profile mapping using observations from GCommandCenter.
> - Expose only the three supported profiles.
> 
> The previous version was mistakenly based on the commit used by my
> local Linux distribution instead of pdx86/for-next. Sorry for the
> confusion.
> 
> I also collected WMI response data on Windows while switching profiles
> in GCommandCenter. I can share those results if useful.
> 
> v1: https://lore.kernel.org/20260925032001.111062-1-matias.civadda2342001@gmail.com/
> 
>  drivers/platform/x86/Kconfig            |   1 +
>  drivers/platform/x86/bitland-mifs-wmi.c | 135 +++++++++++++++++-------
>  2 files changed, 97 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 45f15f93afa7..e3351ee1dd43 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -116,6 +116,7 @@ config GIGABYTE_WMI
>  config BITLAND_MIFS_WMI
>  	tristate "Bitland MIFS (MiInterface) WMI driver"
>  	depends on ACPI_WMI
> +	depends on DMI
>  	depends on HWMON
>  	depends on INPUT
>  	depends on LEDS_CLASS
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index dd1648b7de77..29e365b54c84 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/dev_printk.h>
>  #include <linux/device.h>
>  #include <linux/device/devres.h>
> +#include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/init.h>
> @@ -131,6 +132,58 @@ struct bitland_mifs_output {
>  	u8 data[28];
>  } __packed;
>  
> +/* TM2107 places the return code after the function ID and payload. */
> +struct bitland_mifs_output_tm2107 {
> +	__le16 function;
> +	u8 data[28];
> +	__le16 return_code;
> +} __packed;
> +
> +struct bitland_mifs_quirks {
> +	const enum platform_profile_option *profiles;
> +	size_t num_profiles;
> +	bool return_code_at_end;
> +	bool skip_ac_type_check;
> +};
> +
> +static const enum platform_profile_option bitland_profiles[] = {
> +	[WMI_PP_BALANCED] = PLATFORM_PROFILE_BALANCED,
> +	[WMI_PP_PERFORMANCE] = PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +	[WMI_PP_QUIET] = PLATFORM_PROFILE_LOW_POWER,
> +	[WMI_PP_FULL_SPEED] = PLATFORM_PROFILE_PERFORMANCE,
> +};
> +
> +/* Values observed after selecting each mode in GCommandCenter. */
> +static const enum platform_profile_option tm2107_profiles[] = {
> +	[0] = PLATFORM_PROFILE_PERFORMANCE,
> +	[1] = PLATFORM_PROFILE_BALANCED,
> +	[2] = PLATFORM_PROFILE_LOW_POWER,
> +};
> +
> +static const struct bitland_mifs_quirks bitland_default_quirks = {
> +	.profiles = bitland_profiles,
> +	.num_profiles = ARRAY_SIZE(bitland_profiles),
> +};

It's bit weird to call normal list of profiles quirks, when this is more 
of a info structure.

> +static const struct bitland_mifs_quirks bitland_tm2107_quirks = {
> +	.profiles = tm2107_profiles,
> +	.num_profiles = ARRAY_SIZE(tm2107_profiles),
> +	.return_code_at_end = true,
> +	.skip_ac_type_check = true,
> +};
> +
> +static const struct dmi_system_id bitland_mifs_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2107"),
> +		},
> +		.driver_data = (void *)&bitland_tm2107_quirks,
> +	},
> +	{}
> +};
> +
>  struct bitland_mifs_event {
>  	u8 event_type;
>  	u8 event_id;
> @@ -154,6 +207,7 @@ struct bitland_fan_notify_data {
>  
>  struct bitland_mifs_wmi_data {
>  	struct wmi_device *wdev;
> +	const struct bitland_mifs_quirks *quirks;
>  	struct mutex lock;		/* Protects WMI calls */
>  	struct led_classdev kbd_led;
>  	struct notifier_block notifier;
> @@ -180,6 +234,17 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
>  
>  	struct bitland_mifs_output *result __free(kfree) = out_buf.data;
>  
> +	if (data->quirks->return_code_at_end) {
> +		const struct bitland_mifs_output_tm2107 *raw = out_buf.data;
> +		struct bitland_mifs_output normalized = {
> +			.return_code = raw->return_code,
> +			.function = raw->function,
> +		};
> +
> +		memcpy(normalized.data, raw->data, sizeof(normalized.data));
> +		*result = normalized;

This still feels hackish. Maybe convert the variations into offsets in the 
info structure. You can still preserve the structs and use offsetof() to 
extra the offset out of them into the info struct.

> +	}
> +
>  	switch (le16_to_cpu(result->return_code)) {
>  	case WMI_RETURN_CODE_SUCCESS:
>  		break;
> @@ -202,6 +267,7 @@ static int laptop_profile_get(struct device *dev,
>  			      enum platform_profile_option *profile)
>  {
>  	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	const struct bitland_mifs_quirks *quirks = data->quirks;
>  	struct bitland_mifs_input input = {
>  		.operation = cpu_to_le16(WMI_METHOD_GET),
>  		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
> @@ -213,22 +279,10 @@ static int laptop_profile_get(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	switch (result.data[0]) {
> -	case WMI_PP_BALANCED:
> -		*profile = PLATFORM_PROFILE_BALANCED;
> -		break;
> -	case WMI_PP_PERFORMANCE:
> -		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> -		break;
> -	case WMI_PP_QUIET:
> -		*profile = PLATFORM_PROFILE_LOW_POWER;
> -		break;
> -	case WMI_PP_FULL_SPEED:
> -		*profile = PLATFORM_PROFILE_PERFORMANCE;
> -		break;
> -	default:
> +	if (result.data[0] >= quirks->num_profiles)
>  		return -EINVAL;
> -	}
> +
> +	*profile = quirks->profiles[result.data[0]];

Just create a local variable for the profile index so you don't need to 
read it twice from data[] and the naming will make the code more readable.

--
 i.

>  	return 0;
>  }
>  
> @@ -241,6 +295,10 @@ static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *da
>  	struct bitland_mifs_output output;
>  	int ret;
>  
> +	/* TM2107 accepts its USB-C charger, without an AC type query. */
> +	if (data->quirks->skip_ac_type_check)
> +		return power_supply_is_system_supplied() > 0 ? 0 : -EOPNOTSUPP;
> +
>  	/* Full-speed/performance mode requires DC power (not USB-C) */
>  	if (!power_supply_is_system_supplied())
>  		return -EOPNOTSUPP;
> @@ -263,47 +321,40 @@ static int laptop_profile_set(struct device *dev,
>  			      enum platform_profile_option profile)
>  {
>  	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	const struct bitland_mifs_quirks *quirks = data->quirks;
>  	struct bitland_mifs_input input = {
>  		.operation = cpu_to_le16(WMI_METHOD_SET),
>  		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
>  	};
> +	size_t i;
>  	int ret;
> -	u8 val;
>  
> -	switch (profile) {
> -	case PLATFORM_PROFILE_LOW_POWER:
> -		val = WMI_PP_QUIET;
> -		break;
> -	case PLATFORM_PROFILE_BALANCED:
> -		val = WMI_PP_BALANCED;
> -		break;
> -	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> -		ret = bitland_check_performance_capability(data);
> -		if (ret)
> -			return ret;
> -		val = WMI_PP_PERFORMANCE;
> -		break;
> -	case PLATFORM_PROFILE_PERFORMANCE:
> +	for (i = 0; i < quirks->num_profiles; i++) {
> +		if (profile == quirks->profiles[i])
> +			break;
> +	}
> +	if (i == quirks->num_profiles)
> +		return -EOPNOTSUPP;
> +
> +	if (profile == PLATFORM_PROFILE_BALANCED_PERFORMANCE ||
> +	    profile == PLATFORM_PROFILE_PERFORMANCE) {
>  		ret = bitland_check_performance_capability(data);
>  		if (ret)
>  			return ret;
> -		val = WMI_PP_FULL_SPEED;
> -		break;
> -	default:
> -		return -EOPNOTSUPP;
>  	}
>  
> -	input.payload[0] = val;
> +	input.payload[0] = i;
>  
>  	return bitland_mifs_wmi_call(data, &input, NULL);
>  }
>  
>  static int platform_profile_probe(void *drvdata, unsigned long *choices)
>  {
> -	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> -	set_bit(PLATFORM_PROFILE_BALANCED, choices);
> -	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> -	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +	struct bitland_mifs_wmi_data *data = drvdata;
> +	size_t i;
> +
> +	for (i = 0; i < data->quirks->num_profiles; i++)
> +		set_bit(data->quirks->profiles[i], choices);
>  
>  	return 0;
>  }
> @@ -659,6 +710,7 @@ static int bitland_notifier_callback(struct notifier_block *nb,
>  static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
>  {
>  	struct bitland_mifs_wmi_data *drv_data;
> +	const struct dmi_system_id *dmi_id;
>  	enum bitland_wmi_device_type dev_type =
>  		(enum bitland_wmi_device_type)(unsigned long)context;
>  	struct led_init_data init_data = {
> @@ -674,6 +726,11 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
>  
>  	drv_data->wdev = wdev;
>  
> +	drv_data->quirks = &bitland_default_quirks;
> +	dmi_id = dmi_first_match(bitland_mifs_dmi_table);
> +	if (dmi_id)
> +		drv_data->quirks = dmi_id->driver_data;
> +
>  	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
>  	if (ret)
>  		return ret;
> 
> base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
> 
