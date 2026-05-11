Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E535F605
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 16:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516130; cv=pass; b=fdePLCqNP9lnTR78rpnETFLzVxS0R7l/j51HUnH4C5l62MzknVvpDr7ghtT6YzI++nd7CX+TFmFD6XB7xuA4jee6af7Kd1j4iBnyBm4TnbBhpHJwSam0isz4umbnXmWYpSQ9k6m/U7PpwDqUqg8eXj2JUHiX4LSzwu91DYJmevo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516130; c=relaxed/simple;
	bh=3A+sq/zoLMrRP2MHLkQpx5sG2MEwopcnFRfudPYUxnw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZRvv8le9wvS9F4b0s9XwKkWyL/siw5vyxsNBI5WWW0J6IoGyfVbv8R5Wtlj6rvNQI56RQYHe+fafLVKIUXETLqA6rkvJktxB7aD5EX3+Fow+uJpQDGlpksU/6z7gQ0Chm4YOvlDoyhDpzz5QO5ThM2lqExSCdNY6b1nhEzyIYg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=mPBdyLQe; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="mPBdyLQe"
ARC-Seal: i=1; a=rsa-sha256; t=1778516118; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BUA4Gt/4AjrsAwr9ITfIIQkzxpOdYIq1p3BcIVKlJAyy2RmV1uOfrYV0cY61vq3+EI+nBFuT8U3AONY51JbcHRbtItM3j+X01x+gMyXUI1FhY3n3UzGVl3+XD01o1w1j9xEms3fpuvriajzJZkwNO0TJFkEL6dnPmOmfXSbs6Xc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778516118; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wVZk6a+//E06xNetlh/f3C8bw/VnUdHLeWxzE/ewi+M=; 
	b=Pdw+YwZXllOGMZ+2yuIwzuyLB0TgcmVAuBRLDq6PlORi6LXCjeT9kXmkaA9kE942bQUuOqMOYXatoOUEoTLSec1ML3fj9zJKOhgNlGdCvrT0j9ZXiPWDUnulLdcpJ3j2+0oEyjKzJU70o46VGQOjxhOazeslzCYvdxh5J0ttQoY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778516118;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=wVZk6a+//E06xNetlh/f3C8bw/VnUdHLeWxzE/ewi+M=;
	b=mPBdyLQetHT9Q3Cpwjq27Ne7hVFrwsHvaZem0KfElrW4uP8LGcIC2t8Pjg2GMxfo
	giyiAxKjtjvfxf2lciFx4+cCpCOsCq3c0/eciigKJ47CyPzUvPMras8oK+K8ji4VpK5
	uwMyszUVS/pamGJRPKUp37ptZZMb+ju2oKBaeMSHVd3QiamEv+fK7NMLkw7+KJc6ZIs
	JI94iXX0ME60xbcOMGj8BnfUVU4wl6MwQPQlbgn1syfz6uhQePnWH0e38Sny6NUK5g1
	lUsWYJYxI1LkFV5CTGvg95gmsbJf6i7gd+9uTkgkNHLXRAamPh07kOj3ovNxzvUzPwp
	IBH+hjyhmg==
Received: by mx.zohomail.com with SMTPS id 1778516117444853.6344451720809;
	Mon, 11 May 2026 09:15:17 -0700 (PDT)
Message-ID: <aefaa595ac8566086002e50fafd4194ceab23f01.camel@rong.moe>
Subject: Re: [PATCH v3 1/1] platform/x86: add Acer battery control driver
From: Rong Zhang <i@rong.moe>
To: Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hansg@kernel.org>, 
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Frederik Harwath
	 <frederik@harwath.name>
In-Reply-To: <20260510185017.316935-2-jelle@vdwaa.nl>
References: <20260510185017.316935-1-jelle@vdwaa.nl>
	 <20260510185017.316935-2-jelle@vdwaa.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:09:33 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Jelle,

On Sun, 2026-05-10 at 20:50 +0200, Jelle van der Waa wrote:
> Some Acer laptops can configure battery related features through Acer
> Care Center on Windows. This driver uses the power supply extension to
> set a battery charge limit
>=20

What does it limit? If it limits the charge capacity, ...

>  and exposes the battery
> temperature.
>=20
> This driver is based on the existing acer-wmi-battery project on GitHub
> and was tested on an Acer Aspire A315-510P.
>=20
> Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
>=20
> ---
> v3:
> - Add depends on DMI
> - Rename CamelCase struct member names
> - Simplify returning errors
> - Add comma to non-terminating entries
> - Simplified acer_wmi_battery_set_battery_health_control to acer_wmi_set_=
battery_health_control
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
> - Set no_singleton =3D true
> - Implement DMI matching to support laptops with only battery
>   temperature support.
> ---
>  drivers/platform/x86/Kconfig            |  12 +
>  drivers/platform/x86/Makefile           |   1 +
>  drivers/platform/x86/acer-wmi-battery.c | 347 ++++++++++++++++++++++++
>  3 files changed, 360 insertions(+)
>  create mode 100644 drivers/platform/x86/acer-wmi-battery.c
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2ffa4ecf65b0..2fc23cd2039f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -188,6 +188,18 @@ config ACER_WMI
>  	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  	  here.
> =20
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
> =20
>  config ADV_SWBUTTON
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 872ac3842391..a877acd937cd 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_BITLAND_MIFS_WMI)		+=3D bitland-mifs-wmi.o
>  obj-$(CONFIG_ACERHDF)		+=3D acerhdf.o
>  obj-$(CONFIG_ACER_WIRELESS)	+=3D acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)		+=3D acer-wmi.o
> +obj-$(CONFIG_ACER_WMI_BATTERY)	+=3D acer-wmi-battery.o
> =20
>  # AMD
>  obj-y				+=3D amd/
> diff --git a/drivers/platform/x86/acer-wmi-battery.c b/drivers/platform/x=
86/acer-wmi-battery.c
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
> + * battery charge limit ("health mode") and exposes the battery temperat=
ure.
> + *
> + * Based on acer-wmi-battery https://github.com/frederik-h/acer-wmi-batt=
ery/
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
> +static int acer_wmi_battery_get_information(struct acer_wmi_battery_data=
 *data,
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
> +	if (!obj || obj->type !=3D ACPI_TYPE_BUFFER)
> +		return -EIO;
> +
> +	if (obj->buffer.length < sizeof(u32)) {
> +		dev_err(&data->wdev->dev, "WMI battery information call returned buffe=
r of unexpected length %u\n",
> +			obj->buffer.length);
> +		return -EINVAL;
> +	}
> +
> +	*result =3D get_unaligned_le32(obj->buffer.pointer);
> +
> +	return ret;
> +}
> +
> +static int acer_wmi_battery_get_health_control_status(struct acer_wmi_ba=
ttery_data *data,
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
> +		.battery_no =3D ACER_BATTERY_INDEX,
> +		.function_query =3D 0x1,
> +		.reserved =3D { 0x0, 0x0 },
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
> +	if (!obj || obj->type !=3D ACPI_TYPE_BUFFER)
> +		return -EIO;
> +
> +	if (obj->buffer.length < sizeof(*status_output)) {
> +		dev_err(&data->wdev->dev, "WMI battery status call returned a buffer o=
f unexpected length %d\n",
> +			obj->buffer.length);
> +		return -EINVAL;
> +	}
> +
> +	status_output =3D (struct get_battery_health_control_status_output *)ob=
j->buffer.pointer;
> +
> +	if (health_mode) {
> +		if (!(status_output->function_list & HEALTH_MODE))
> +			return -EINVAL;
> +
> +		*health_mode =3D status_output->function_status[0] > 0;
> +	}
> +
> +	return ret;
> +}
> +
> +static int acer_wmi_battery_set_health_control(struct acer_wmi_battery_d=
ata *data,
> +					       u8 function, bool function_status)
> +{
> +	struct set_battery_health_control_input args =3D {
> +		.battery_no =3D ACER_BATTERY_INDEX,
> +		.function_mask =3D function,
> +		.function_status =3D function_status ? 1 : 0,
> +		.reserved_in =3D { 0x0, 0x0, 0x0, 0x0, 0x0 },
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
> +	if (!obj || obj->type !=3D ACPI_TYPE_BUFFER)
> +		return -EIO;
> +
> +	if (obj->buffer.length < 4) {
> +		dev_err(&data->wdev->dev, "WMI battery status set operation returned a=
 buffer of unexpected length %d\n",
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
> +	struct acer_wmi_battery_data *data =3D ext_data;
> +	bool health_mode;
> +	u32 value;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		ret =3D acer_wmi_battery_get_health_control_status(data, &health_mode)=
;
> +		if (ret)
> +			return ret;
> +
> +		val->intval =3D health_mode ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE
> +					  : POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +		break;
> +	case POWER_SUPPLY_PROP_TEMP:
> +		ret =3D acer_wmi_battery_get_information(data, 0x8, ACER_BATTERY_INDEX=
, &value);
> +		if (ret)
> +			return ret;
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
> +		return acer_wmi_battery_set_health_control(data, HEALTH_MODE,
> +				val->intval =3D=3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int acer_battery_ext_property_is_writeable(struct power_supply *p=
sy,
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
> +
> +static const enum power_supply_property acer_battery_properties_v1[] =3D=
 {
> +	POWER_SUPPLY_PROP_TEMP,
> +};
> +
> +static const enum power_supply_property acer_battery_properties_v2[] =3D=
 {
> +	POWER_SUPPLY_PROP_TEMP,
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +static const struct power_supply_ext acer_wmi_battery_extension_v1 =3D {
> +	.name			=3D DRIVER_NAME,
> +	.properties		=3D acer_battery_properties_v1,
> +	.num_properties		=3D ARRAY_SIZE(acer_battery_properties_v1),
> +	.get_property		=3D acer_battery_ext_property_get,
> +	.set_property		=3D acer_battery_ext_property_set,
> +	.property_is_writeable	=3D acer_battery_ext_property_is_writeable,
> +};
> +
> +static const struct power_supply_ext acer_wmi_battery_extension_v2 =3D {
> +	.name			=3D DRIVER_NAME,
> +	.properties		=3D acer_battery_properties_v2,
> +	.num_properties		=3D ARRAY_SIZE(acer_battery_properties_v2),
> +	.charge_types           =3D BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +				  BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),

I recently learned that POWER_SUPPLY_CHARGE_TYPE_LONGLIFE is not the
correct uapi for charge capacity limit. See
https://lore.kernel.org/r/09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@co=
llabora.com/

Thanks,
Rong

> +	.get_property		=3D acer_battery_ext_property_get,
> +	.set_property		=3D acer_battery_ext_property_set,
> +	.property_is_writeable	=3D acer_battery_ext_property_is_writeable,
> +};
> +
> +static int acer_battery_add(struct power_supply *battery, struct acpi_ba=
ttery_hook *hook)
> +{
> +	struct acer_wmi_battery_data *data =3D container_of(hook, struct acer_w=
mi_battery_data, hook);
> +
> +	return power_supply_register_extension(battery, data->battery_ext,
> +					       &data->wdev->dev, data);
> +}
> +
> +static int acer_battery_remove(struct power_supply *battery, struct acpi=
_battery_hook *hook)
> +{
> +	struct acer_wmi_battery_data *data =3D container_of(hook, struct acer_w=
mi_battery_data, hook);
> +
> +	power_supply_unregister_extension(battery, data->battery_ext);
> +
> +	return 0;
> +}
> +
> +static int acer_wmi_battery_probe(struct wmi_device *wdev, const void *c=
ontext)
> +{
> +	struct acer_wmi_battery_data *data;
> +
> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, data);
> +	data->wdev =3D wdev;
> +	data->features.health_mode =3D dmi_check_system(acer_wmi_battery_health=
_mode_table);
> +	data->battery_ext =3D data->features.health_mode ? &acer_wmi_battery_ex=
tension_v2
> +						       : &acer_wmi_battery_extension_v1;
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
