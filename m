Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F3318EC7
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500505; cv=none; b=bQPDDCVJK6c2U04fBEwZZur1kD89XcgwdqBdKmYtl8OKEUKN4/3tEw5um40hFAbju4ahibMoOsMiSCU4pxO1BuITTexSU8vCNO3mDcxP+uwn+1/OeY77A4RiX625Q6ooSRaBE0W/ENOepRrnz94dxP+xjjlryAdAMTs6EqIt3Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500505; c=relaxed/simple;
	bh=ep1ywd3oNYn9ZIx9SC7JHxn/4sH/IH0/MCnLJX3l+2U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=er9nwwsbKPdmm1bJAYqwbmWF2BMOFRzLcCbEb4FGduLIKML1qFzqIAFdYCFXcvwCrK0S4tBuIhuMxz5Xxdr5oWVq6OikeaERMZxFfDmQY+vBZMCxM/5e1+Has4Hu+0wkUqTgujg2LD9XV2ptlzMlSlOyoJIqFIMvr1Bjt3roP8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4XrG40f; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4XrG40f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778500504; x=1810036504;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ep1ywd3oNYn9ZIx9SC7JHxn/4sH/IH0/MCnLJX3l+2U=;
  b=Y4XrG40fv/r4ZY6VpwSW8g21t2y1H/2RrEyvVNzJaplr6cR0r1zvJ1Cz
   T3wLCEwDJy3w0yM+ZLoNzvkD7CQnK5JXmnVoL/8K8yPMUWjzMctfCHCL8
   gJjZ+cjqk86eg2ylzB4192j46Au05m4/pblanNjq/kjyl1DOPqbawvVTV
   /p36sDAW9X1nzPJUbu7VqguF8EuA0cQvZHJg7mOo/CdNFdf8RB3W4+i+X
   iM6YqNCwc3mqghDxZ6B1oLxXz/BgQ8RZ4QjnlkyzO2VEZfw0fi6eDp7TG
   Cc1o4niQ1QDD0ArgQX7O+oljdwU91hZAvrm9Mersx0OpJWsX/LmveeTlH
   w==;
X-CSE-ConnectionGUID: RQbS0bCtRCmqd8K+a8jtsQ==
X-CSE-MsgGUID: CgcpLGhgR3GY7MSbJABAZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="82996606"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="82996606"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:55:03 -0700
X-CSE-ConnectionGUID: h4bNbSf6T0m6yyS/yEFH1g==
X-CSE-MsgGUID: durfZaTSSHm2kvpdBgYjmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="267793706"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:55:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 14:54:57 +0300 (EEST)
To: Jelle van der Waa <jelle@vdwaa.nl>
cc: Hans de Goede <hansg@kernel.org>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, 
    Frederik Harwath <frederik@harwath.name>
Subject: Re: [PATCH v3 1/1] platform/x86: add Acer battery control driver
In-Reply-To: <20260510185017.316935-2-jelle@vdwaa.nl>
Message-ID: <a8ff00fa-5b63-776f-5de7-91b7581afd8e@linux.intel.com>
References: <20260510185017.316935-1-jelle@vdwaa.nl> <20260510185017.316935-2-jelle@vdwaa.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 10 May 2026, Jelle van der Waa wrote:

> Some Acer laptops can configure battery related features through Acer
> Care Center on Windows. This driver uses the power supply extension to
> set a battery charge limit and exposes the battery
> temperature.
> 
> This driver is based on the existing acer-wmi-battery project on GitHub
> and was tested on an Acer Aspire A315-510P.
> 
> Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
> 
> ---
> v3:
> - Add depends on DMI
> - Rename CamelCase struct member names
> - Simplify returning errors
> - Add comma to non-terminating entries
> - Simplified acer_wmi_battery_set_battery_health_control to acer_wmi_set_battery_health_control
> - Use sizeof for acpi_object buffer
> - Drop POWER_SUPPLY_EXTENSION macro
> v2:
> - Alphabetically sort linux headers
> - Include headers for types / _packed
> - Use cleanup.h instead of goto + label
> - Add missing prefix for set_battery_health_control
> - General code formatting fixes
> - Remove HWMON dependency in Kconfig
> - Use wmidev_evaluate_method()
> - Accept oversized ACPI buffers
> - Use DRIVER_NAME for battery extension name
> - Set no_singleton = true
> - Implement DMI matching to support laptops with only battery
>   temperature support.
> ---
>  drivers/platform/x86/Kconfig            |  12 +
>  drivers/platform/x86/Makefile           |   1 +
>  drivers/platform/x86/acer-wmi-battery.c | 347 ++++++++++++++++++++++++
>  3 files changed, 360 insertions(+)
>  create mode 100644 drivers/platform/x86/acer-wmi-battery.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2ffa4ecf65b0..2fc23cd2039f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -188,6 +188,18 @@ config ACER_WMI
>  	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  	  here.
>  
> +config ACER_WMI_BATTERY
> +	tristate "Acer WMI Battery"
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
> +	depends on DMI
> +	help
> +	  This is a driver for Acer laptops with battery health control. It
> +	  adds charge limit control and battery temperature reporting.
> +
> +	  If you have an ACPI-WMI Battery compatible Acer laptop, say Y or M
> +	  here.
> +
>  source "drivers/platform/x86/amd/Kconfig"
>  
>  config ADV_SWBUTTON
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 872ac3842391..a877acd937cd 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
>  obj-$(CONFIG_ACERHDF)		+= acerhdf.o
>  obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
> +obj-$(CONFIG_ACER_WMI_BATTERY)	+= acer-wmi-battery.o
>  
>  # AMD
>  obj-y				+= amd/
> diff --git a/drivers/platform/x86/acer-wmi-battery.c b/drivers/platform/x86/acer-wmi-battery.c
> new file mode 100644
> index 000000000000..78005e7a7f55
> --- /dev/null
> +++ b/drivers/platform/x86/acer-wmi-battery.c
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * acer-wmi-battery.c: Acer battery health control driver
> + *
> + * This is a driver for the WMI battery health control interface found
> + * on some Acer laptops.  This interface allows to enable/disable a
> + * battery charge limit ("health mode") and exposes the battery temperature.
> + *
> + * Based on acer-wmi-battery https://github.com/frederik-h/acer-wmi-battery/
> + *
> + * Copyright (C) 2022-2025  Frederik Harwath <frederik@harwath.name>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/compiler_attributes.h>
> +#include <linux/dmi.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/power_supply.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <linux/version.h>
> +#include <linux/wmi.h>
> +
> +#include <acpi/battery.h>
> +
> +#define DRIVER_NAME	"acer-wmi-battery"
> +
> +#define ACER_BATTERY_GUID "79772EC5-04B1-4BFD-843C-61E7F77B6CC9"
> +
> +/*
> + * The Acer OEM software seems to always use this battery index,
> + * so we emulate this behaviour to not confuse the underlying firmware.
> + *
> + * However this also means that we only fully support devices with a
> + * single battery for now.
> + */
> +#define ACER_BATTERY_INDEX	0x1
> +
> +struct get_battery_health_control_status_input {
> +	u8 battery_no;
> +	u8 function_query;
> +	u8 reserved[2];
> +} __packed;
> +
> +struct get_battery_health_control_status_output {
> +	u8 function_list;
> +	u8 ret[2];
> +	u8 function_status[5];
> +} __packed;
> +
> +struct set_battery_health_control_input {
> +	u8 battery_no;
> +	u8 function_mask;
> +	u8 function_status;
> +	u8 reserved_in[5];
> +} __packed;
> +
> +struct set_battery_health_control_output {
> +	u8 ret;
> +	u8 reserved_out;
> +} __packed;
> +
> +enum battery_mode {
> +	HEALTH_MODE = 1,
> +	CALIBRATION_MODE = 2,
> +};
> +
> +struct acer_wmi_battery_data {
> +	struct acpi_battery_hook hook;
> +	struct wmi_device *wdev;
> +	const struct power_supply_ext *battery_ext;
> +	struct {
> +		bool health_mode : 1;
> +	} features;
> +};
> +
> +static int acer_wmi_battery_get_information(struct acer_wmi_battery_data *data,
> +					    u32 index, u32 battery, u32 *result)
> +{
> +	u32 args[2] = { index, battery };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input = { sizeof(args), args };
> +	int ret;
> +
> +	ret = wmidev_evaluate_method(data->wdev, 0, 19, &input, &output);

Hi,

Armin has made improvements to WMI API, and as a result, this interface 
has been deprecated:

/**
 * wmidev_evaluate_method - Evaluate a WMI method (deprecated)


(FYI, there's one fix to the new WMI interface currently only in fixes 
branch which I plan to merge to for-next once the next fixes PR is done, 
in case you end up hitting that issue in the meantime.)

-- 
 i.

> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	union acpi_object *obj __free(kfree) = output.pointer;
> +	if (!obj || obj->type != ACPI_TYPE_BUFFER)
> +		return -EIO;
> +
> +	if (obj->buffer.length < sizeof(u32)) {
> +		dev_err(&data->wdev->dev, "WMI battery information call returned buffer of unexpected length %u\n",
> +			obj->buffer.length);
> +		return -EINVAL;
> +	}
> +
> +	*result = get_unaligned_le32(obj->buffer.pointer);
> +
> +	return ret;
> +}
> +
> +static int acer_wmi_battery_get_health_control_status(struct acer_wmi_battery_data *data,
> +						      bool *health_mode)
> +{
> +	/*
> +	 * Acer Care Center seems to always call the WMI method
> +	 * with fixed parameters. This yields information about
> +	 * the availability and state of both health and
> +	 * calibration mode. The modes probably apply to
> +	 * all batteries of the system.
> +	 */
> +	struct get_battery_health_control_status_input args = {
> +		.battery_no = ACER_BATTERY_INDEX,
> +		.function_query = 0x1,
> +		.reserved = { 0x0, 0x0 },
> +	};
> +	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> +	struct get_battery_health_control_status_output *status_output;
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	int ret;
> +
> +	ret = wmidev_evaluate_method(data->wdev, 0, 20, &input, &output);
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	union acpi_object *obj __free(kfree) = output.pointer;
> +	if (!obj || obj->type != ACPI_TYPE_BUFFER)
> +		return -EIO;
> +
> +	if (obj->buffer.length < sizeof(*status_output)) {
> +		dev_err(&data->wdev->dev, "WMI battery status call returned a buffer of unexpected length %d\n",
> +			obj->buffer.length);
> +		return -EINVAL;
> +	}
> +
> +	status_output = (struct get_battery_health_control_status_output *)obj->buffer.pointer;
> +
> +	if (health_mode) {
> +		if (!(status_output->function_list & HEALTH_MODE))
> +			return -EINVAL;
> +
> +		*health_mode = status_output->function_status[0] > 0;
> +	}
> +
> +	return ret;
> +}
> +
> +static int acer_wmi_battery_set_health_control(struct acer_wmi_battery_data *data,
> +					       u8 function, bool function_status)
> +{
> +	struct set_battery_health_control_input args = {
> +		.battery_no = ACER_BATTERY_INDEX,
> +		.function_mask = function,
> +		.function_status = function_status ? 1 : 0,
> +		.reserved_in = { 0x0, 0x0, 0x0, 0x0, 0x0 },
> +	};
> +	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	int ret;
> +
> +	ret = wmidev_evaluate_method(data->wdev, 0, 21, &input, &output);
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	obj = output.pointer;
> +	if (!obj || obj->type != ACPI_TYPE_BUFFER)
> +		return -EIO;
> +
> +	if (obj->buffer.length < 4) {
> +		dev_err(&data->wdev->dev, "WMI battery status set operation returned a buffer of unexpected length %d\n",
> +			obj->buffer.length);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int acer_battery_ext_property_get(struct power_supply *psy,
> +					 const struct power_supply_ext *ext,
> +					 void *ext_data,
> +					 enum power_supply_property psp,
> +					 union power_supply_propval *val)
> +{
> +	struct acer_wmi_battery_data *data = ext_data;
> +	bool health_mode;
> +	u32 value;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		ret = acer_wmi_battery_get_health_control_status(data, &health_mode);
> +		if (ret)
> +			return ret;
> +
> +		val->intval = health_mode ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE
> +					  : POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +		break;
> +	case POWER_SUPPLY_PROP_TEMP:
> +		ret = acer_wmi_battery_get_information(data, 0x8, ACER_BATTERY_INDEX, &value);
> +		if (ret)
> +			return ret;
> +		if (value > U16_MAX)
> +			return -ERANGE;
> +
> +		val->intval = value - 2731;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int acer_battery_ext_property_set(struct power_supply *psy,
> +					 const struct power_supply_ext *ext,
> +					 void *ext_data,
> +					 enum power_supply_property psp,
> +					 const union power_supply_propval *val)
> +{
> +	struct acer_wmi_battery_data *data = ext_data;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		return acer_wmi_battery_set_health_control(data, HEALTH_MODE,
> +				val->intval == POWER_SUPPLY_CHARGE_TYPE_LONGLIFE);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int acer_battery_ext_property_is_writeable(struct power_supply *psy,
> +						  const struct power_supply_ext *ext,
> +						  void *ext_data,
> +						  enum power_supply_property psp)
> +{
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct dmi_system_id acer_wmi_battery_health_mode_table[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-510P")
> +		}
> +	},
> +	{}
> +};
> +
> +static const enum power_supply_property acer_battery_properties_v1[] = {
> +	POWER_SUPPLY_PROP_TEMP,
> +};
> +
> +static const enum power_supply_property acer_battery_properties_v2[] = {
> +	POWER_SUPPLY_PROP_TEMP,
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +static const struct power_supply_ext acer_wmi_battery_extension_v1 = {
> +	.name			= DRIVER_NAME,
> +	.properties		= acer_battery_properties_v1,
> +	.num_properties		= ARRAY_SIZE(acer_battery_properties_v1),
> +	.get_property		= acer_battery_ext_property_get,
> +	.set_property		= acer_battery_ext_property_set,
> +	.property_is_writeable	= acer_battery_ext_property_is_writeable,
> +};
> +
> +static const struct power_supply_ext acer_wmi_battery_extension_v2 = {
> +	.name			= DRIVER_NAME,
> +	.properties		= acer_battery_properties_v2,
> +	.num_properties		= ARRAY_SIZE(acer_battery_properties_v2),
> +	.charge_types           = BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +				  BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),
> +	.get_property		= acer_battery_ext_property_get,
> +	.set_property		= acer_battery_ext_property_set,
> +	.property_is_writeable	= acer_battery_ext_property_is_writeable,
> +};
> +
> +static int acer_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct acer_wmi_battery_data *data = container_of(hook, struct acer_wmi_battery_data, hook);
> +
> +	return power_supply_register_extension(battery, data->battery_ext,
> +					       &data->wdev->dev, data);
> +}
> +
> +static int acer_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct acer_wmi_battery_data *data = container_of(hook, struct acer_wmi_battery_data, hook);
> +
> +	power_supply_unregister_extension(battery, data->battery_ext);
> +
> +	return 0;
> +}
> +
> +static int acer_wmi_battery_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct acer_wmi_battery_data *data;
> +
> +	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, data);
> +	data->wdev = wdev;
> +	data->features.health_mode = dmi_check_system(acer_wmi_battery_health_mode_table);
> +	data->battery_ext = data->features.health_mode ? &acer_wmi_battery_extension_v2
> +						       : &acer_wmi_battery_extension_v1;
> +	data->hook.name = "Acer Battery Extension";
> +	data->hook.add_battery = acer_battery_add;
> +	data->hook.remove_battery = acer_battery_remove;
> +
> +	return devm_battery_hook_register(&data->wdev->dev, &data->hook);
> +}
> +
> +static const struct wmi_device_id acer_wmi_battery_id_table[] = {
> +	{ ACER_BATTERY_GUID, NULL },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, acer_wmi_battery_id_table);
> +
> +static struct wmi_driver acer_wmi_battery_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = acer_wmi_battery_id_table,
> +	.probe = acer_wmi_battery_probe,
> +	.no_singleton = true,
> +};
> +module_wmi_driver(acer_wmi_battery_driver);
> +
> +MODULE_AUTHOR("Frederik Harwath <frederik@harwath.name>");
> +MODULE_AUTHOR("Jelle van der Waa <jelle@vdwaa.nl>");
> +MODULE_DESCRIPTION("Acer battery health control WMI driver");
> +MODULE_LICENSE("GPL");
> 

