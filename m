Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0F6359FAA
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607267; cv=none; b=YBJ08W229RbgzMRYeBxx0sGIGSCw5tJzFXv9cjf1lKP+ICcswaOOvJwga0WWg45/TSurnHhfQZfXTM1GsW+3GWMzR0IeMyqheurpoaR4y/XLFyL+oSvhxxlc8eT5ChWBHZJF+Ns6Fmaz6w6gUSJm6Cv5Q+KS0Te8nJPfgZ88KgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607267; c=relaxed/simple;
	bh=HT2uVzTry+4qmCm/qz6BUtUtNHQERCaXY3LMrwiJg8s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uYrvqaLCsUx36oIXP+AmS6lvBFXdW0p7iwSG2mC9OTKhUtuh0zjUGOaqYyaNtmq7uACduhpRi0mRIqZCpG7tBBr+tul4ibFewE8YA/+E29d5LXrgNd3LibbZNoyB8PsAYr7Vf5uvV/i4xJdMAKOvxzqnwiTc594vGHbU/6XG1jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhYoI4tc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhYoI4tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769607260; x=1801143260;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HT2uVzTry+4qmCm/qz6BUtUtNHQERCaXY3LMrwiJg8s=;
  b=YhYoI4tc95mgKIxcwxJuPgbIFrMl5KauXkCVNzi+VZkl1bmnTAhyNJDI
   MrufKQxnuDuFSq8EjaF3Dw9lW6Y1VnCDr5zWqbnnu+O+7BAZEfbN7uDgQ
   eWMdXpvrBqftQSQWbfjvNOm1zf4EkjxTkxnyZHUIzPN3Onf3Od8noPq4K
   pDarAF0zNT353eBvd0UYoAC5+aIx6BwLjE1SYj4IG24UALx1VBe5uqIfI
   z84qOlm0Igr/d7bTmE3Js4AoG9duG3z5R04A23irI3bkR6XHd+sXBEFDC
   DedMgMO2vWkXNsa4KGraa6HPhr804IL0zbfQPDY1yntfBy8TcHvoB9OwH
   A==;
X-CSE-ConnectionGUID: aPGOnIhFREa+b5PhND8ABg==
X-CSE-MsgGUID: hSDIX3zCQJ6P1Ai85Qy/eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70016965"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70016965"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:34:15 -0800
X-CSE-ConnectionGUID: TAHGLfVwTNetqs3ATUryVg==
X-CSE-MsgGUID: LBvvj1VnTEOu/QIAeFVf5Q==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:34:13 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Jan 2026 15:34:10 +0200 (EET)
To: Jelle van der Waa <jelle@vdwaa.nl>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Frederik Harwath <frederik@harwath.name>
Subject: Re: [PATCH v2 1/1] platform/x86: add Acer battery control driver
In-Reply-To: <20260125182314.735668-2-jelle@vdwaa.nl>
Message-ID: <a4b12d29-d08e-a86f-2514-3edc2346da94@linux.intel.com>
References: <20260125182314.735668-1-jelle@vdwaa.nl> <20260125182314.735668-2-jelle@vdwaa.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Jan 2026, Jelle van der Waa wrote:

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
>  drivers/platform/x86/Kconfig            |  11 +
>  drivers/platform/x86/Makefile           |   1 +
>  drivers/platform/x86/acer-wmi-battery.c | 355 ++++++++++++++++++++++++
>  3 files changed, 367 insertions(+)
>  create mode 100644 drivers/platform/x86/acer-wmi-battery.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4cb7d97a9fcc..88c11a698fb9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -170,6 +170,17 @@ config ACER_WMI
>  	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  	  here.
>  
> +config ACER_WMI_BATTERY
> +	tristate "Acer WMI Battery"
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
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
> index d25762f7114f..9cf28baff3ae 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>  obj-$(CONFIG_ACERHDF)		+= acerhdf.o
>  obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
> +obj-$(CONFIG_ACER_WMI_BATTERY)	+= acer-wmi-battery.o
>  
>  # AMD
>  obj-y				+= amd/
> diff --git a/drivers/platform/x86/acer-wmi-battery.c b/drivers/platform/x86/acer-wmi-battery.c
> new file mode 100644
> index 000000000000..abb45cfcc6fe
> --- /dev/null
> +++ b/drivers/platform/x86/acer-wmi-battery.c
> @@ -0,0 +1,355 @@
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
> +	u8 uBatteryNo;
> +	u8 uFunctionQuery;
> +	u8 uReserved[2];

All these should be lower-cased.

> +} __packed;
> +
> +struct get_battery_health_control_status_output {
> +	u8 uFunctionList;
> +	u8 uReturn[2];
> +	u8 uFunctionStatus[5];
> +} __packed;
> +
> +struct set_battery_health_control_input {
> +	u8 uBatteryNo;
> +	u8 uFunctionMask;
> +	u8 uFunctionStatus;
> +	u8 uReservedIn[5];
> +} __packed;
> +
> +struct set_battery_health_control_output {
> +	u8 uReturn;
> +	u8 uReservedOut;
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
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	union acpi_object *obj __free(kfree) = output.pointer;
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER)
> +		ret = -EIO;

return -EIO; ?

IMO, you could do:

	if (!obj || obj->type != ACPI_TYPE_BUFFER)
		return -EIO;

> +
> +	if (obj->buffer.length < sizeof(u32)) {
> +		dev_err(&data->wdev->dev, "WMI battery information call returned buffer of unexpected length %u\n",
> +			obj->buffer.length);

Add include.

> +		ret = -EINVAL;

return -EINVAL; ?

These seem to be a common pattern in your functions so please check them 
all.

> +	}
> +
> +	*result = get_unaligned_le32(obj->buffer.pointer);

Are these pointers directly compatible? I think sparse with endianness 
checking enabled will complain about passing obj->buffer.pointer directly 
here.

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
> +		.uBatteryNo = ACER_BATTERY_INDEX,
> +		.uFunctionQuery = 0x1,
> +		.uReserved = { 0x0, 0x0 }

Add the comma to any non-terminating entry.

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
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER)
> +		ret = -EIO;
> +
> +	if (obj->buffer.length < 8) {
> +		dev_err(&data->wdev->dev, "WMI battery status call returned a buffer of unexpected length %d\n",
> +			obj->buffer.length);
> +		ret = -EINVAL;
> +	}
> +
> +	status_output = (struct get_battery_health_control_status_output *)obj->buffer.pointer;
> +
> +	if (health_mode) {
> +		if (status_output->uFunctionList & HEALTH_MODE)
> +			*health_mode = status_output->uFunctionStatus[0] > 0;
> +		else
> +			ret = -EINVAL;

return right here.

I suggest you reverse the if logic and return the error first and remove 
else entirely.

> +	}
> +
> +	return ret;
> +}
> +
> +static int acer_wmi_battery_set_battery_health_control(struct acer_wmi_battery_data *data,
> +						       u8 function, bool function_status)
> +{
> +	struct set_battery_health_control_input args = {
> +		.uBatteryNo = ACER_BATTERY_INDEX,
> +		.uFunctionMask = function,
> +		.uFunctionStatus = function_status ? 1 : 0,
> +		.uReservedIn = { 0x0, 0x0, 0x0, 0x0, 0x0 }
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
> +
> +	if (!obj)

Remove the empty line between these two, as this is kind of "error 
handling".

> +		return -EIO;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER)
> +		ret = -EIO;
> +
> +	if (obj->buffer.length < 4) {
> +		dev_err(&data->wdev->dev, "WMI battery status set operation returned a buffer of unexpected length %d\n",
> +			obj->buffer.length);
> +		ret = -EINVAL;
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
> +		val->intval = health_mode
> +			      ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE
> +			      : POWER_SUPPLY_CHARGE_TYPE_STANDARD;

		val->intval = health_mode ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE
					  : POWER_SUPPLY_CHARGE_TYPE_STANDARD;

> +		break;
> +	case POWER_SUPPLY_PROP_TEMP:
> +		ret = acer_wmi_battery_get_information(data, 0x8, ACER_BATTERY_INDEX, &value);
> +		if (ret)
> +			return ret;
> +
> +		if (value > U16_MAX)

This is still error handling for the call so remove the empty line.

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
> +		return acer_wmi_battery_set_battery_health_control(data, HEALTH_MODE,

You seem to like very verbose function names, this even has "battery" 
twice :-). It would likely make the code slightly easier to read if you 
would try to make them shorter.

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
> +#define DEFINE_ACER_WMI_POWER_SUPPLY_EXTENSION(_name, _power_supply_props)		\
> +	static const struct power_supply_ext _name = {					\
> +		.name			= DRIVER_NAME,					\
> +		.properties		= _power_supply_props,				\
> +		.num_properties		= ARRAY_SIZE(_power_supply_props),		\
> +		.charge_types           = BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |	\
> +					  BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),	\
> +		.get_property		= acer_battery_ext_property_get,		\
> +		.set_property		= acer_battery_ext_property_set,		\
> +		.property_is_writeable	= acer_battery_ext_property_is_writeable,	\
> +	}
> +
> +DEFINE_ACER_WMI_POWER_SUPPLY_EXTENSION(acer_wmi_battery_extension_v1, acer_battery_properties_v1);
> +DEFINE_ACER_WMI_POWER_SUPPLY_EXTENSION(acer_wmi_battery_extension_v2, acer_battery_properties_v2);
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
> +	data->battery_ext = data->features.health_mode
> +			    ? &acer_wmi_battery_extension_v2
> +			    : &acer_wmi_battery_extension_v1;
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

-- 
 i.

