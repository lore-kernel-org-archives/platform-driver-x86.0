Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E574C2D94B5
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jan 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692050; cv=none; b=CWMQfpv6AX1O/XauHzsa95vagg21DDrsIhRThZz/pX8sy+jI9I0PIO1XINlPaj3U/9+r5i4TMEpK5RJJFekz8aOie1EtlToK2OZoBuadiPFnweQOfZUxymHm2hOfBNPPaldTGSUztIAoNW7kln89gcd/Mqg1JFhMHLQJ2LucZnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692050; c=relaxed/simple;
	bh=5N7Tq36Mj1eqg9y7YB0Wn4513jvorZSgqVoS0H2ONP0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=f51cqlIkAbNVcy/HJvewZt0AzKJBDfcEzECUjnDD7aomSuVQLbaYVyEq3ef4kpK2R41n88uR+xzY/BJ9ltRXyt2nFMrBGKtkmQKM6fk/HBoAoeI2HlImjSUjmzhjaVck1R2du0B7M3EVoYGfG0xTyAbkbo1sKdcTTTPf1DZGi1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRq9AKlm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRq9AKlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767692048; x=1799228048;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5N7Tq36Mj1eqg9y7YB0Wn4513jvorZSgqVoS0H2ONP0=;
  b=TRq9AKlm0SBrJVcZf6AgAN2htVuYgDBBzmemlcnIy8GRwd6aAyCGu4I5
   94VJcBDofx3W7G1UYB6DbFtEypskqBOZpvaDeY820TACZAkMzRvEs9zHq
   oeo7iNqwNdKKqVre/yBP2g510TEaKMrc9LHOtWRTn4fHZujJ17q+PeL6R
   ZnFR+NyjPEe8ubqkxn+yV65xqp0ORUKvyaxxjn+UkQrchg0n/YWvbewCF
   gHSYLRflTzbW70gB2n4wU09xzd7piXk6dNkgudp9zJX0woV5K30GjEk4P
   JcI6kvTapxMi91sm6D8Y4JldOt3A1EXrmBPQhxi+OGhGaUvzcyOKXbBa+
   A==;
X-CSE-ConnectionGUID: bHj/J2ECTPCR5Cu2dZS8Hg==
X-CSE-MsgGUID: MCL7nvt+QI+8hC0/OtH86Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68963413"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68963413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 01:34:05 -0800
X-CSE-ConnectionGUID: yPWn3Ik9SlCvgguOf0EYrg==
X-CSE-MsgGUID: heJJMo9ASLCJWUXubEU5ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="203076458"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.6])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 01:34:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Jan 2026 11:34:00 +0200 (EET)
To: Jelle van der Waa <jelle@vdwaa.nl>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Frederik Harwath <frederik@harwath.name>
Subject: Re: [PATCH 1/1] platform/x86: add Acer battery control driver
In-Reply-To: <20260105171024.227758-2-jelle@vdwaa.nl>
Message-ID: <ed106e77-ef3f-4789-d0be-6c16f6405004@linux.intel.com>
References: <20260105171024.227758-1-jelle@vdwaa.nl> <20260105171024.227758-2-jelle@vdwaa.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Jan 2026, Jelle van der Waa wrote:

> Some Acer laptops can configure battery related features through Acer
> Care Center on Windows. This driver uses the power supply extension to
> set a battery charge limit and exposes the battery
> temperature.
> 
> This driver is based on the existing acer-wmi-battery project on GitHub
> and was tested on an Acer Aspire A315-510P.
> 
> Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
> ---
>  drivers/platform/x86/Kconfig            |  12 +
>  drivers/platform/x86/Makefile           |   1 +
>  drivers/platform/x86/acer-wmi-battery.c | 345 ++++++++++++++++++++++++
>  3 files changed, 358 insertions(+)
>  create mode 100644 drivers/platform/x86/acer-wmi-battery.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4cb7d97a9fcc..b3de6a2827e8 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -170,6 +170,18 @@ config ACER_WMI
>  	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  	  here.
>  
> +config ACER_WMI_BATTERY
> +	tristate "Acer WMI Battery"
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
> +	depends on HWMON
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
> index 000000000000..fffa521cde27
> --- /dev/null
> +++ b/drivers/platform/x86/acer-wmi-battery.c
> @@ -0,0 +1,345 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * acer-wmi-battery.c: Acer battery health control driver
> + *
> + * This is a driver for the WMI battery health control interface found
> + * on some Acer laptops.  This interface allows to enable/disable a
> + * battery charge limit ("health mode") and exposes the battery temperature.
> + *
> + * Based on acer-wmi-battery https://github.com/frederik-h/acer-wmi-battery/

Add an empty line here.

> + * Copyright (C) 2022-2025  Frederik Harwath <frederik@harwath.name>
> + */
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/power_supply.h>
> +#include <linux/version.h>
> +#include <linux/wmi.h>
> +#include <linux/unaligned.h>

Always use alphabetical order within each block of includes (such as 
those under linux/).

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

+ types.h

> +} __packed;

__packed needs #include.

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
> +enum battery_mode { HEALTH_MODE = 1, CALIBRATION_MODE = 2 };

Do we expect to ever extend this list? If yes, put them on separate lines 
and add the trailing comma.

Are these BIT() or values of a field, you seem to use HEALTH_MODE with & 
down below which sounds like BIT()?

> +
> +struct acer_wmi_battery_data {
> +	struct acpi_battery_hook hook;
> +	struct wmi_device *wdev;
> +};
> +
> +static int acer_wmi_battery_get_information(struct acer_wmi_battery_data *data,
> +					    u32 index, u32 battery, u32 *result)
> +{
> +	u32 args[2] = { index, battery };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input = { sizeof(args), args };
> +	union acpi_object *obj;
> +	int ret;
> +
> +	ret = wmi_evaluate_method(ACER_BATTERY_GUID, 0, 19, &input, &output);
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	obj = output.pointer;
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		ret = -EIO;
> +		goto out_free_obj;
> +	}
> +
> +	if (obj->buffer.length != sizeof(u32)) {
> +		dev_err(&data->wdev->dev, "WMI battery information call returned buffer of unexpected length %u\n",
> +			obj->buffer.length);
> +		ret = -EINVAL;
> +		goto out_free_obj;
> +	}
> +
> +	*result = get_unaligned_le32(obj->buffer.pointer);
> +
> +out_free_obj:
> +	kfree(obj);

Please use cleanup.h instead of goto + label. Remember to declare var at 
the site, not in the variable declarations block.

> +	return ret;
> +}
> +
> +static int acer_wmi_battery_get_health_control_status(struct acer_wmi_battery_data *data,
> +							      s8 *health_mode)
> +{
> +	/*
> +	 * Acer Care Center seems to always call the WMI method
> +	 * with fixed parameters. This yields information about
> +	 * the availability and state of both health and
> +	 * calibration mode. The modes probably apply to
> +	 * all batteries of the system.
> +	 */
> +	struct get_battery_health_control_status_input params = {
> +		.uBatteryNo = ACER_BATTERY_INDEX,
> +		.uFunctionQuery = 0x1,
> +		.uReserved = { 0x0, 0x0 }
> +	};
> +	struct acpi_buffer input = {
> +		sizeof(struct get_battery_health_control_status_input), &params
> +	};
> +	struct get_battery_health_control_status_output status_output;
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	int ret;
> +
> +	ret = wmi_evaluate_method(ACER_BATTERY_GUID, 0, 20, &input, &output);
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	obj = output.pointer;
> +	if (!obj)
> +		return -EIO;
> +	else if (obj->type != ACPI_TYPE_BUFFER) {
> +		ret = -EIO;
> +		goto out_free_obj;
> +	}
> +
> +	status_output = *((struct get_battery_health_control_status_output *)
> +			obj->buffer.pointer);
> +	if (obj->buffer.length != 8) {
> +		dev_err(&data->wdev->dev, "WMI battery status call returned a buffer of unexpected length %d\n",
> +			obj->buffer.length);
> +		ret = -EINVAL;
> +		goto out_free_obj;
> +	}
> +
> +	if (health_mode)
> +		*health_mode = status_output.uFunctionList & HEALTH_MODE ?
> +					  status_output.uFunctionStatus[0] > 0 :
> +					  -1;

Please use braces for multiline blocks.

> +
> +out_free_obj:
> +	kfree(obj);

cleanup.h, please change all of these.

> +	return ret;
> +}
> +
> +static int set_battery_health_control(struct acer_wmi_battery_data *data,

Missing prefix.

> +					      u8 function, bool function_status)
> +{
> +	struct set_battery_health_control_input params = {
> +		.uBatteryNo = ACER_BATTERY_INDEX,
> +		.uFunctionMask = function,
> +		.uFunctionStatus = (u8)function_status,

Use ? : instead of relying C's bool -> u8 conversion.

> +		.uReservedIn = { 0x0, 0x0, 0x0, 0x0, 0x0 }
> +	};
> +	struct acpi_buffer input = {
> +		sizeof(struct set_battery_health_control_input),
> +		&params,

Previouslly you had these on the same line, it would be nice to use 
consistent style.

> +	};
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	int ret;
> +
> +	ret = wmi_evaluate_method(ACER_BATTERY_GUID, 0, 21, &input, &output);
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	obj = output.pointer;
> +
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		ret = -EIO;
> +		goto out_free_obj;
> +	}
> +
> +	if (obj->buffer.length != 4) {
> +		dev_err(&data->wdev->dev, "WMI battery status set operation returned a buffer of unexpected length %d\n",
> +			obj->buffer.length);
> +		ret = -EINVAL;
> +		goto out_free_obj;
> +	}
> +
> +out_free_obj:
> +	kfree(obj);
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
> +	s8 health_mode;
> +	u32 value;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		ret = acer_wmi_battery_get_health_control_status(data, &health_mode);
> +		if (ret)
> +			return ret;
> +
> +		if (health_mode < 0)
> +			return -EINVAL;

Why doesn't acer_wmi_battery_get_health_control_status() return -EINVAL 
directlu but does this odd s8 trickery?

> +
> +		val->intval = health_mode ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE :
> +				POWER_SUPPLY_CHARGE_TYPE_STANDARD;

Please align this properly.

> +		break;
> +	case POWER_SUPPLY_PROP_TEMP:
> +		ret = acer_wmi_battery_get_information(data, 0x8, ACER_BATTERY_INDEX, &value);
> +		if (ret)
> +			return ret;
> +
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
> +					       const struct power_supply_ext *ext,
> +					       void *ext_data,
> +					       enum power_supply_property psp,
> +					       const union power_supply_propval *val)
> +{
> +	struct acer_wmi_battery_data *data = ext_data;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		return set_battery_health_control(data, HEALTH_MODE,
> +				val->intval == POWER_SUPPLY_CHARGE_TYPE_LONGLIFE);

There's quite big leap from POWER_SUPPLY_CHARGE_TYPE_LONGLIFE to something 
called "function_status". Is this perhaps a (argument) naming issue?

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
> +	case POWER_SUPPLY_PROP_TEMP:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static const enum power_supply_property acer_battery_properties[] = {
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +	POWER_SUPPLY_PROP_TEMP,
> +};
> +
> +static const struct power_supply_ext acer_wmi_battery_extension = {
> +	.name			= "acer_laptop",
> +	.properties		= acer_battery_properties,
> +	.num_properties		= ARRAY_SIZE(acer_battery_properties),
> +	.charge_types           = (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),

Aren't parenthesis unnecessary in this contruct?

> +	.get_property		= acer_battery_ext_property_get,
> +	.set_property		= acer_battery_ext_property_set,
> +	.property_is_writeable	= acer_battery_ext_property_is_writeable,
> +};
> +
> +static int acer_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct acer_wmi_battery_data *data = container_of(hook, struct acer_wmi_battery_data, hook);
> +
> +	return power_supply_register_extension(battery, &acer_wmi_battery_extension,
> +					       &data->wdev->dev, data);
> +}
> +
> +static int acer_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	power_supply_unregister_extension(battery, &acer_wmi_battery_extension);
> +
> +	return 0;
> +}
> +
> +static int acer_wmi_battery_battery_add(struct acer_wmi_battery_data *data)
> +{
> +	data->hook.name = "Acer Battery Extension";
> +	data->hook.add_battery = acer_battery_add;
> +	data->hook.remove_battery = acer_battery_remove;
> +
> +	return devm_battery_hook_register(&data->wdev->dev, &data->hook);
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
> +
> +	return acer_wmi_battery_battery_add(data);
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

