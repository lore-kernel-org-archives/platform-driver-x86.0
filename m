Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC2636826D
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Jan 2026 23:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769815488; cv=none; b=udzm/fHnTAK4nwPT/FXc/k7cF+yuulTklKwlkF3rZToU/d2TMJXHdPxM9jrH+cdxA+miefmkwW3bGHgfoj+KvqhUGI/z8WluEm1NzzC+8KOeFlQ8od+pgyWVQjYgTT1/UMATcH1u5jnN5dQl+YdadaNv8pu4IiJxvdFd4+VBC1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769815488; c=relaxed/simple;
	bh=QXNa9SWOwZ60u5uCz3IEnTD3Q21oJZ6VjXuCUq5qBw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5orqIUp5SpeiVwXcTIGonUAaB8xzkUzcS6DyYAp/BKtmOsDOn3YahbtToq8vy3NSi4jpG+ZxdY6t/fGSDiAfDPWIt80KbAx15j3mQWeo/8rJgVMddg5/3ObnIPaibLA1MGHmMl1QawjkWfSCPPxZwJeCcy/UOVhXqYWpKZTQZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=JZv1XXah; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="JZv1XXah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769815479; x=1770420279; i=w_armin@gmx.de;
	bh=Um7U2TrTsfu6//3t8bFdNK1SBzIlTAjHEqMp8hVIFy0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JZv1XXah3H1qS59F6HHUFACvza0pybYtFYTrYl61RdPYNLj7Q36ZiawHWzHlYeaB
	 8ibtAf+jA/fRngeG7cYPiCOwH3Uo3ZBT/v3gUf72PB34XMU/i2J2G072fKsrLUniV
	 9HFU95ouHxK/o/eLgJIl7PgmE3HunYDGOmN8/kwWg7DlroE/ZngmBfWovDZeQOxL2
	 gSY67duouG4H0i28q7cOmrPD+aW3VB+4djtL+Xc3xOqSL988wvA9w6lLuIJqV/zR5
	 IpO8ytdP9ApTO9ocwi0G9Vvrm9z2pEMmIWgSwintfoLzLyMG5rbC/WtbD2iFODm15
	 Ci5tN62t2SCPEI8ZMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.2.84.29] ([212.76.253.94]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiJV6-1wGKWG47yI-00gYEP; Sat, 31
 Jan 2026 00:24:39 +0100
Message-ID: <ca22f9d8-7609-4023-956e-85687a5d5df6@gmx.de>
Date: Sat, 31 Jan 2026 00:24:36 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86: add Acer battery control driver
To: Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260125182314.735668-1-jelle@vdwaa.nl>
 <20260125182314.735668-2-jelle@vdwaa.nl>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260125182314.735668-2-jelle@vdwaa.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S4plZ13XOCvtdn2sW0AWymWON1ljiNk2yuZfDR/LKze9N6jh+eH
 DYVCcKPKfLclrcdwuNribSNgpene1NnWY8weBTDBIybyFjYLMSys1clwzf9gbDfmJ/DR7Ly
 eWJXrJFHTyF1uXc9R6hCtCcjY+NjXkiAlCYDAPc7Yowc/u+W6nJeWtQmEP+Xb9OZD/Op52n
 jf4QiehKASt5eXVT5V2sA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nn6KbUaHKLg=;9pO2fhciNWuPVK+dGR9cXiBlN2u
 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
 mc6rAwNmygW

Am 25.01.26 um 19:23 schrieb Jelle van der Waa:

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
> - Set no_singleton =3D true
> - Implement DMI matching to support laptops with only battery
>    temperature support.
> ---
>   drivers/platform/x86/Kconfig            |  11 +
>   drivers/platform/x86/Makefile           |   1 +
>   drivers/platform/x86/acer-wmi-battery.c | 355 ++++++++++++++++++++++++
>   3 files changed, 367 insertions(+)
>   create mode 100644 drivers/platform/x86/acer-wmi-battery.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4cb7d97a9fcc..88c11a698fb9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -170,6 +170,17 @@ config ACER_WMI
>   	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>   	  here.
>  =20
> +config ACER_WMI_BATTERY
> +	tristate "Acer WMI Battery"
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY

Please also depend on DMI so that dmi_check_system() will always be availa=
ble
when building this driver.

> +	help
> +	  This is a driver for Acer laptops with battery health control. It
> +	  adds charge limit control and battery temperature reporting.
> +
> +	  If you have an ACPI-WMI Battery compatible Acer laptop, say Y or M
> +	  here.
> +
>   source "drivers/platform/x86/amd/Kconfig"
>  =20
>   config ADV_SWBUTTON
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index d25762f7114f..9cf28baff3ae 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_GIGABYTE_WMI)		+=3D gigabyte-wmi.o
>   obj-$(CONFIG_ACERHDF)		+=3D acerhdf.o
>   obj-$(CONFIG_ACER_WIRELESS)	+=3D acer-wireless.o
>   obj-$(CONFIG_ACER_WMI)		+=3D acer-wmi.o
> +obj-$(CONFIG_ACER_WMI_BATTERY)	+=3D acer-wmi-battery.o
>  =20
>   # AMD
>   obj-y				+=3D amd/
> diff --git a/drivers/platform/x86/acer-wmi-battery.c b/drivers/platform/=
x86/acer-wmi-battery.c
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
> + * battery charge limit ("health mode") and exposes the battery tempera=
ture.
> + *
> + * Based on acer-wmi-battery https://github.com/frederik-h/acer-wmi-bat=
tery/
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
> +	HEALTH_MODE =3D 1,
> +	CALIBRATION_MODE =3D 2,
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
> +static int acer_wmi_battery_get_information(struct acer_wmi_battery_dat=
a *data,
> +					    u32 index, u32 battery, u32 *result)
> +{
> +	u32 args[2] =3D { index, battery };
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input =3D { sizeof(args), args };
> +	int ret;
> +
> +	ret =3D wmidev_evaluate_method(data->wdev, 0, 19, &input, &output);
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	union acpi_object *obj __free(kfree) =3D output.pointer;
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type !=3D ACPI_TYPE_BUFFER)
> +		ret =3D -EIO;
> +
> +	if (obj->buffer.length < sizeof(u32)) {
> +		dev_err(&data->wdev->dev, "WMI battery information call returned buff=
er of unexpected length %u\n",
> +			obj->buffer.length);
> +		ret =3D -EINVAL;
> +	}
> +
> +	*result =3D get_unaligned_le32(obj->buffer.pointer);
> +
> +	return ret;
> +}
> +
> +static int acer_wmi_battery_get_health_control_status(struct acer_wmi_b=
attery_data *data,
> +						      bool *health_mode)
> +{
> +	/*
> +	 * Acer Care Center seems to always call the WMI method
> +	 * with fixed parameters. This yields information about
> +	 * the availability and state of both health and
> +	 * calibration mode. The modes probably apply to
> +	 * all batteries of the system.
> +	 */
> +	struct get_battery_health_control_status_input args =3D {
> +		.uBatteryNo =3D ACER_BATTERY_INDEX,
> +		.uFunctionQuery =3D 0x1,
> +		.uReserved =3D { 0x0, 0x0 }
> +	};
> +	struct acpi_buffer input =3D { (acpi_size) sizeof(args), &args };
> +	struct get_battery_health_control_status_output *status_output;
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	int ret;
> +
> +	ret =3D wmidev_evaluate_method(data->wdev, 0, 20, &input, &output);
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	union acpi_object *obj __free(kfree) =3D output.pointer;
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type !=3D ACPI_TYPE_BUFFER)
> +		ret =3D -EIO;
> +
> +	if (obj->buffer.length < 8) {

Better use sizeof(*status_output) here.

> +		dev_err(&data->wdev->dev, "WMI battery status call returned a buffer =
of unexpected length %d\n",
> +			obj->buffer.length);
> +		ret =3D -EINVAL;
> +	}
> +
> +	status_output =3D (struct get_battery_health_control_status_output *)o=
bj->buffer.pointer;
> +
> +	if (health_mode) {
> +		if (status_output->uFunctionList & HEALTH_MODE)
> +			*health_mode =3D status_output->uFunctionStatus[0] > 0;
> +		else
> +			ret =3D -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int acer_wmi_battery_set_battery_health_control(struct acer_wmi_=
battery_data *data,
> +						       u8 function, bool function_status)
> +{
> +	struct set_battery_health_control_input args =3D {
> +		.uBatteryNo =3D ACER_BATTERY_INDEX,
> +		.uFunctionMask =3D function,
> +		.uFunctionStatus =3D function_status ? 1 : 0,
> +		.uReservedIn =3D { 0x0, 0x0, 0x0, 0x0, 0x0 }
> +	};
> +	struct acpi_buffer input =3D { (acpi_size) sizeof(args), &args };
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	int ret;
> +
> +	ret =3D wmidev_evaluate_method(data->wdev, 0, 21, &input, &output);
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	obj =3D output.pointer;
> +
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type !=3D ACPI_TYPE_BUFFER)
> +		ret =3D -EIO;
> +
> +	if (obj->buffer.length < 4) {
> +		dev_err(&data->wdev->dev, "WMI battery status set operation returned =
a buffer of unexpected length %d\n",
> +			obj->buffer.length);
> +		ret =3D -EINVAL;
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
> +	struct acer_wmi_battery_data *data =3D ext_data;
> +	bool health_mode;
> +	u32 value;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		ret =3D acer_wmi_battery_get_health_control_status(data, &health_mode=
);
> +		if (ret)
> +			return ret;
> +
> +		val->intval =3D health_mode
> +			      ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE
> +			      : POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +		break;
> +	case POWER_SUPPLY_PROP_TEMP:
> +		ret =3D acer_wmi_battery_get_information(data, 0x8, ACER_BATTERY_INDE=
X, &value);
> +		if (ret)
> +			return ret;
> +
> +		if (value > U16_MAX)
> +			return -ERANGE;
> +
> +		val->intval =3D value - 2731;
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
> +	struct acer_wmi_battery_data *data =3D ext_data;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		return acer_wmi_battery_set_battery_health_control(data, HEALTH_MODE,
> +				val->intval =3D=3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int acer_battery_ext_property_is_writeable(struct power_supply *=
psy,
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
> +static const struct dmi_system_id acer_wmi_battery_health_mode_table[] =
=3D {
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-510P")
> +		}
> +	},
> +	{}
> +};

I suggest that you perform the DMI check during module initialization. Thi=
s way
the DMI table can be marked as __initconst and does not consume any memory=
 after
anymore after module initialization is complete.

The result of the DMI check could then be stored inside a global variable.

Other than that, the driver seems fine to me.

Thanks,
Armin Wolf

> +
> +static const enum power_supply_property acer_battery_properties_v1[] =
=3D {
> +	POWER_SUPPLY_PROP_TEMP,
> +};
> +
> +static const enum power_supply_property acer_battery_properties_v2[] =
=3D {
> +	POWER_SUPPLY_PROP_TEMP,
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +#define DEFINE_ACER_WMI_POWER_SUPPLY_EXTENSION(_name, _power_supply_pro=
ps)		\
> +	static const struct power_supply_ext _name =3D {					\
> +		.name			=3D DRIVER_NAME,					\
> +		.properties		=3D _power_supply_props,				\
> +		.num_properties		=3D ARRAY_SIZE(_power_supply_props),		\
> +		.charge_types           =3D BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |	=
\
> +					  BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),	\
> +		.get_property		=3D acer_battery_ext_property_get,		\
> +		.set_property		=3D acer_battery_ext_property_set,		\
> +		.property_is_writeable	=3D acer_battery_ext_property_is_writeable,	\
> +	}
> +
> +DEFINE_ACER_WMI_POWER_SUPPLY_EXTENSION(acer_wmi_battery_extension_v1, a=
cer_battery_properties_v1);
> +DEFINE_ACER_WMI_POWER_SUPPLY_EXTENSION(acer_wmi_battery_extension_v2, a=
cer_battery_properties_v2);

Please drop the macro, saving a couple of lines here provides not enough b=
enefit.

> +
> +static int acer_battery_add(struct power_supply *battery, struct acpi_b=
attery_hook *hook)
> +{
> +	struct acer_wmi_battery_data *data =3D container_of(hook, struct acer_=
wmi_battery_data, hook);
> +
> +	return power_supply_register_extension(battery, data->battery_ext,
> +					       &data->wdev->dev, data);
> +}
> +
> +static int acer_battery_remove(struct power_supply *battery, struct acp=
i_battery_hook *hook)
> +{
> +	struct acer_wmi_battery_data *data =3D container_of(hook, struct acer_=
wmi_battery_data, hook);
> +
> +	power_supply_unregister_extension(battery, data->battery_ext);
> +
> +	return 0;
> +}
> +
> +static int acer_wmi_battery_probe(struct wmi_device *wdev, const void *=
context)
> +{
> +	struct acer_wmi_battery_data *data;
> +
> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, data);
> +	data->wdev =3D wdev;
> +	data->features.health_mode =3D dmi_check_system(acer_wmi_battery_healt=
h_mode_table);
> +	data->battery_ext =3D data->features.health_mode
> +			    ? &acer_wmi_battery_extension_v2
> +			    : &acer_wmi_battery_extension_v1;
> +	data->hook.name =3D "Acer Battery Extension";
> +	data->hook.add_battery =3D acer_battery_add;
> +	data->hook.remove_battery =3D acer_battery_remove;
> +
> +	return devm_battery_hook_register(&data->wdev->dev, &data->hook);
> +}
> +
> +static const struct wmi_device_id acer_wmi_battery_id_table[] =3D {
> +	{ ACER_BATTERY_GUID, NULL },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, acer_wmi_battery_id_table);
> +
> +static struct wmi_driver acer_wmi_battery_driver =3D {
> +	.driver =3D {
> +		.name =3D DRIVER_NAME,
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D acer_wmi_battery_id_table,
> +	.probe =3D acer_wmi_battery_probe,
> +	.no_singleton =3D true,
> +};
> +module_wmi_driver(acer_wmi_battery_driver);
> +
> +MODULE_AUTHOR("Frederik Harwath <frederik@harwath.name>");
> +MODULE_AUTHOR("Jelle van der Waa <jelle@vdwaa.nl>");
> +MODULE_DESCRIPTION("Acer battery health control WMI driver");
> +MODULE_LICENSE("GPL");
