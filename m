Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C1C2EA158;
	Tue, 16 Dec 2025 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892444; cv=none; b=GqyjMaUE6IuMo7UL1j5wK3qd0+pBugGtWetm5ix4LjFMMIYIu57alR3+sBo6Wsmlm+xKrhTSH3ho05urQAPcoSy9TCD5se90tci4tK43atCmrvcOho2kl1Lf8yAHy5jeHbCPZV3nyUZadyPQeYxHrE+ltdF//PrkQFzlDbE+QtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892444; c=relaxed/simple;
	bh=7/99sigoElmXYinPf+ewDy2g9LS+ZnbTYxMuDZVdaHM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IHfxcXyxB73iKLrx/7zuM643lECpj7I5dUU1ojA+yr95FWcuSkprUvqzn4nc9nt/fCPEqHKPN8uzfQMs+hqO0DvJRJHHmUD44Yn7YWQoIRzsPpNQ4eumJIfwG+GG1wks0LdCxd7/Fng3W+Yc+qRud7sc3zRpL+RaiWVrADTGPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mT7H8MgF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mT7H8MgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765892442; x=1797428442;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7/99sigoElmXYinPf+ewDy2g9LS+ZnbTYxMuDZVdaHM=;
  b=mT7H8MgFNc8XGWEZoZGtB8yJdxzBYdIawc3Ygcjs791sPLOtIcZfVndS
   verdCsEVCRNWQbT63JvOut1LYGlFmBsH8vLJshJJEjsHFUB814VTfbfvn
   Gc6trj4Y4A4MxmHb6Me3FcXCnp4jqqgLx14i70ge/Jna7uPB01jrgN4bM
   YOgxOVogqB15Qr3Jjknu98cFBB6WArv2kvZykcYCkgeqrkhmmnstr0Wbd
   oemppCQsOQDYjiKYvkqxoxLHgITUSSNAsHTxYaB7pWtABmQg49R2i0a5B
   hchx7cQpZyuNCvN0a+/ZGyUZCiET+bKWDo9VqfY2ymsSILOh6A6mdwVEL
   g==;
X-CSE-ConnectionGUID: l6rSloXmQHSHqJKDSlPvtg==
X-CSE-MsgGUID: 2BV5JtrGS7OfI9nRKcTNsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67772139"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67772139"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:40:42 -0800
X-CSE-ConnectionGUID: rizfhJKsQ7iquUfTgiVg1g==
X-CSE-MsgGUID: 7GI7SRxNRz6NmSvd9UPCzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197114933"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:40:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Dec 2025 15:40:36 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: uniwill-laptop: Introduce device
 descriptor system
In-Reply-To: <20251204135121.435905-2-wse@tuxedocomputers.com>
Message-ID: <cfe33020-5faa-c780-6d0a-6a6267070983@linux.intel.com>
References: <20251204135121.435905-1-wse@tuxedocomputers.com> <20251204135121.435905-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Dec 2025, Werner Sembach wrote:

> From: Armin Wolf <W_Armin@gmx.de>
> 
> Future additions to the driver will depend on device-specific
> initialization steps. Extend the DMI-based feature detection system
> to include device descriptors. Each descriptor contains a bitmap of
> supported features and a set of callback for performing
> device-specific initialization.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 168 +++++++++++++++++---
>  1 file changed, 142 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index bd7e63dd51810..01192c32608e5 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -322,6 +322,7 @@ struct uniwill_data {
>  	struct device *dev;
>  	acpi_handle handle;
>  	struct regmap *regmap;
> +	unsigned int features;
>  	struct acpi_battery_hook hook;
>  	unsigned int last_charge_ctrl;
>  	struct mutex battery_lock;	/* Protects the list of currently registered batteries */
> @@ -341,12 +342,21 @@ struct uniwill_battery_entry {
>  	struct power_supply *battery;
>  };
>  
> +struct uniwill_device_descriptor {
> +	unsigned int features;
> +	/* Executed during driver probing */
> +	int (*probe)(struct uniwill_data *data);
> +};
> +
>  static bool force;
>  module_param_unsafe(force, bool, 0);
>  MODULE_PARM_DESC(force, "Force loading without checking for supported devices\n");
>  
> -/* Feature bitmask since the associated registers are not reliable */
> -static unsigned int supported_features;
> +/*
> + * Contains device specific data like the feature bitmap since
> + * the associated registers are not always reliable.
> + */
> +static struct uniwill_device_descriptor device_descriptor __ro_after_init;
>  
>  static const char * const uniwill_temp_labels[] = {
>  	"CPU",
> @@ -411,6 +421,13 @@ static const struct key_entry uniwill_keymap[] = {
>  	{ KE_END }
>  };
>  
> +static inline bool uniwill_device_supports(struct uniwill_data *data,
> +					   unsigned int features_mask,
> +					   unsigned int features)
> +{
> +	return (data->features & features_mask) == features;
> +}
> +
>  static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigned int val)
>  {
>  	union acpi_object params[2] = {
> @@ -799,24 +816,31 @@ static struct attribute *uniwill_attrs[] = {
>  
>  static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +
>  	if (attr == &dev_attr_fn_lock_toggle_enable.attr) {
> -		if (supported_features & UNIWILL_FEATURE_FN_LOCK_TOGGLE)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK_TOGGLE,
> +					    UNIWILL_FEATURE_FN_LOCK_TOGGLE))
>  			return attr->mode;
>  	}
>  
>  	if (attr == &dev_attr_super_key_toggle_enable.attr) {
> -		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
> +					    UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>  			return attr->mode;
>  	}
>  
>  	if (attr == &dev_attr_touchpad_toggle_enable.attr) {
> -		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_TOUCHPAD_TOGGLE,
> +					    UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
>  			return attr->mode;
>  	}
>  
>  	if (attr == &dev_attr_rainbow_animation.attr ||
>  	    attr == &dev_attr_breathing_in_suspend.attr) {
> -		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR,
> +					    UNIWILL_FEATURE_LIGHTBAR))
>  			return attr->mode;
>  	}
>  
> @@ -944,7 +968,8 @@ static int uniwill_hwmon_init(struct uniwill_data *data)
>  {
>  	struct device *hdev;
>  
> -	if (!(supported_features & UNIWILL_FEATURE_HWMON))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_HWMON,
> +				     UNIWILL_FEATURE_HWMON))
>  		return 0;
>  
>  	hdev = devm_hwmon_device_register_with_info(data->dev, "uniwill", data,
> @@ -1019,7 +1044,8 @@ static int uniwill_led_init(struct uniwill_data *data)
>  	unsigned int value;
>  	int ret;
>  
> -	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR,
> +				     UNIWILL_FEATURE_LIGHTBAR))
>  		return 0;
>  
>  	ret = devm_mutex_init(data->dev, &data->led_lock);
> @@ -1232,7 +1258,8 @@ static int uniwill_battery_init(struct uniwill_data *data)
>  {
>  	int ret;
>  
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
> +				     UNIWILL_FEATURE_BATTERY))
>  		return 0;
>  
>  	ret = devm_mutex_init(data->dev, &data->battery_lock);
> @@ -1361,6 +1388,19 @@ static int uniwill_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> +	data->features = device_descriptor.features;
> +
> +	/*
> +	 * Some devices might need to perform some device-specific initialization steps
> +	 * before the supported features are initialized. Because of this we have to call
> +	 * this callback just after the EC itself was initialized.
> +	 */
> +	if (device_descriptor.probe) {
> +		ret = device_descriptor.probe(data);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	ret = uniwill_battery_init(data);
>  	if (ret < 0)
>  		return ret;
> @@ -1385,7 +1425,8 @@ static void uniwill_shutdown(struct platform_device *pdev)
>  
>  static int uniwill_suspend_keyboard(struct uniwill_data *data)
>  {
> -	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
> +				     UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>  		return 0;
>  
>  	/*
> @@ -1397,7 +1438,8 @@ static int uniwill_suspend_keyboard(struct uniwill_data *data)
>  
>  static int uniwill_suspend_battery(struct uniwill_data *data)
>  {
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
> +				     UNIWILL_FEATURE_BATTERY))
>  		return 0;
>  
>  	/*
> @@ -1432,7 +1474,8 @@ static int uniwill_resume_keyboard(struct uniwill_data *data)
>  	unsigned int value;
>  	int ret;
>  
> -	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
> +				     UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>  		return 0;
>  
>  	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> @@ -1448,7 +1491,8 @@ static int uniwill_resume_keyboard(struct uniwill_data *data)
>  
>  static int uniwill_resume_battery(struct uniwill_data *data)
>  {
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
> +				     UNIWILL_FEATURE_BATTERY))
>  		return 0;
>  
>  	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
> @@ -1496,6 +1540,25 @@ static struct platform_driver uniwill_driver = {
>  	.shutdown = uniwill_shutdown,
>  };
>  
> +static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
> +	.features = UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> +		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +		    UNIWILL_FEATURE_BATTERY |
> +		    UNIWILL_FEATURE_HWMON
> +};
> +
> +static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
> +	.features = UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> +		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +		    UNIWILL_FEATURE_LIGHTBAR |
> +		    UNIWILL_FEATURE_BATTERY |
> +		    UNIWILL_FEATURE_HWMON
> +};
> +
> +static struct uniwill_device_descriptor empty_descriptor __initdata = {};
> +
>  static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  	{
>  		.ident = "XMG FUSION 15",
> @@ -1503,6 +1566,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
>  		},
> +		.driver_data = &empty_descriptor,

Hi,

Is there some advantage of having an "empty descriptor" over just NULL 
checking its presence in the code?

>  static int __init uniwill_init(void)
>  {
> +	const struct uniwill_device_descriptor *descriptor;
>  	const struct dmi_system_id *id;
>  	int ret;
>  
> @@ -1880,10 +1984,22 @@ static int __init uniwill_init(void)
>  			return -ENODEV;
>  
>  		/* Assume that the device supports all features */
> -		supported_features = UINT_MAX;
> +		device_descriptor.features = UINT_MAX;
>  		pr_warn("Loading on a potentially unsupported device\n");
>  	} else {
> -		supported_features = (uintptr_t)id->driver_data;
> +		/*
> +		 * Some devices might support additional features depending on
> +		 * the BIOS version/date, so we call this callback to let them
> +		 * modify their device descriptor accordingly.
> +		 */
> +		if (id->callback) {
> +			ret = id->callback(id);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
> +		descriptor = id->driver_data;
> +		device_descriptor = *descriptor;
>  	}
>  
>  	ret = platform_driver_register(&uniwill_driver);
> 

-- 
 i.

