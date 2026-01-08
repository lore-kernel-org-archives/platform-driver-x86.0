Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97FB4E379B
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880264; cv=none; b=ouMMOLSobYFIEnlLv5lHt2D8Ws9C+W1xId4QXG61QJdYISbYhCTwqCPOElJzvFy+6llrI/jx8tFtRA+hu2e9OSigJMqY1WNi3ok7iDG84ZlF+iWCEdnyOcQ9VN//UvnXt8fz9XWAfk6uuQgIrepkAbtSTOIdj4FH3sZTx/nrouI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880264; c=relaxed/simple;
	bh=tgnKxf2jBfbtutWPQahWjnKKvZN7fMkfQJ/GNQ5jyi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxalxiyWT/VZ+CWkR0oGSEh3hIOKteVPSB3nBVr6S6Za1sjl8rYpFBEbkDs9UCkwRfPtJhoGk1+t+ZWh3kwuNlxTPfDdmsi6CkJ9InJYS+nBuCpdcyQP9iOcUqoC6QYaskkSUd2zgRQZ9JdVvdAZ19ts/kAZOs/LFnAhQ6OQnDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ku+1Eep4; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ku+1Eep4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767880247; x=1768485047; i=w_armin@gmx.de;
	bh=eaEd07F19Q9wLAlPmbxo4iuG9DD3B4SFP7/IaPYYoko=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ku+1Eep4LP7TrtSTeIotfS797b8GAHj1QonXm1jFDf9dd2D/kOqmBHEAOi8VsNQV
	 89Rqmqs/EMG/BsQRZcHf9qRt+k7p1HVIXoDZVwSl1exRH42dj5nkpE65rjk60XWpU
	 Ge/JISAIFAoawg9aqIwXIXlLU8YVP2Mzk4P9HBAvRpzKVJdjxVNavN/1UITMU/IKF
	 ItBxQQ09+aAOKBQF7EtIdbIjPFBulIN8AIIz3IM02h+jAn9joUeRgtzFsSu59TL7y
	 xqVumnYgfwNElXSrQHAY8OXsA1fV8zvhlgxIJDhExpoJ8LQzXIApov1OfB6uLlKvb
	 BNpT7x0Gqagw4BM7DA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.90.225] ([141.76.8.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWRVb-1vNe3x2Mg7-00WERd; Thu, 08
 Jan 2026 14:50:47 +0100
Message-ID: <263a3aae-2edc-4219-af93-65e7a53ba399@gmx.de>
Date: Thu, 8 Jan 2026 14:50:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: add Acer battery control driver
To: Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260105171024.227758-1-jelle@vdwaa.nl>
 <20260105171024.227758-2-jelle@vdwaa.nl>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260105171024.227758-2-jelle@vdwaa.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4DjgTiHhCz3nX0TSjJMbQPjSwIOWJrpbYNVpUEAWAHjD3yKDQ8U
 i8tkwS+Ry23I5MsLwyYqV6Bad7Uf0U4Mekpo1TtKzGzBsrXfFiyivc3Io7AsKdn/5p3b2Ki
 4ershOLNHmTweVtc+kljuYIyC27qlCBP0ufjNgEUzgc3FoJ95bSBCuKFfTmdyi47rguoSxw
 FMyJdUydrAVVOUrl6wVCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sgGMC8twaYE=;o2yExIi1Z1FY+6Dr9x5M1We2yD6
 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
 zFbnuLzwnKP6eM/E3xjl0YkhVxs9rTjiA==

Am 05.01.26 um 18:10 schrieb Jelle van der Waa:

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
>   drivers/platform/x86/Kconfig            |  12 +
>   drivers/platform/x86/Makefile           |   1 +
>   drivers/platform/x86/acer-wmi-battery.c | 345 ++++++++++++++++++++++++
>   3 files changed, 358 insertions(+)
>   create mode 100644 drivers/platform/x86/acer-wmi-battery.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4cb7d97a9fcc..b3de6a2827e8 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -170,6 +170,18 @@ config ACER_WMI
>   	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>   	  here.
>  =20
> +config ACER_WMI_BATTERY
> +	tristate "Acer WMI Battery"
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
> +	depends on HWMON

Hi,

why do you need this HWMON dependency here? AFAIK you are not using any pa=
rts
of the hwmon API, so please remove this.

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
> + * battery charge limit ("health mode") and exposes the battery tempera=
ture.
> + *
> + * Based on acer-wmi-battery https://github.com/frederik-h/acer-wmi-bat=
tery/
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

Please use underscores instead of camel case.

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
> +enum battery_mode { HEALTH_MODE =3D 1, CALIBRATION_MODE =3D 2 };
> +
> +struct acer_wmi_battery_data {
> +	struct acpi_battery_hook hook;
> +	struct wmi_device *wdev;
> +};
> +
> +static int acer_wmi_battery_get_information(struct acer_wmi_battery_dat=
a *data,
> +					    u32 index, u32 battery, u32 *result)
> +{
> +	u32 args[2] =3D { index, battery };
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input =3D { sizeof(args), args };
> +	union acpi_object *obj;
> +	int ret;
> +
> +	ret =3D wmi_evaluate_method(ACER_BATTERY_GUID, 0, 19, &input, &output)=
;

Please use wmidev_evaluate_method() instead of the decprecated GUID-based =
interface.

> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	obj =3D output.pointer;
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +		ret =3D -EIO;
> +		goto out_free_obj;
> +	}
> +
> +	if (obj->buffer.length !=3D sizeof(u32)) {

Please also accept oversized ACPI buffers to emulate the behavior of the W=
indows WMI-ACPI driver.

> +		dev_err(&data->wdev->dev, "WMI battery information call returned buff=
er of unexpected length %u\n",
> +			obj->buffer.length);
> +		ret =3D -EINVAL;
> +		goto out_free_obj;
> +	}
> +
> +	*result =3D get_unaligned_le32(obj->buffer.pointer);
> +
> +out_free_obj:
> +	kfree(obj);
> +	return ret;
> +}
> +
> +static int acer_wmi_battery_get_health_control_status(struct acer_wmi_b=
attery_data *data,
> +							      s8 *health_mode)

Please run checkpatch --strict over this source file and fix any issues.

> +{
> +	/*
> +	 * Acer Care Center seems to always call the WMI method
> +	 * with fixed parameters. This yields information about
> +	 * the availability and state of both health and
> +	 * calibration mode. The modes probably apply to
> +	 * all batteries of the system.
> +	 */
> +	struct get_battery_health_control_status_input params =3D {
> +		.uBatteryNo =3D ACER_BATTERY_INDEX,
> +		.uFunctionQuery =3D 0x1,

Maybe use a define for that?

> +		.uReserved =3D { 0x0, 0x0 }
> +	};
> +	struct acpi_buffer input =3D {
> +		sizeof(struct get_battery_health_control_status_input), &params

Please use sizeof(params).

> +	};
> +	struct get_battery_health_control_status_output status_output;
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	int ret;
> +
> +	ret =3D wmi_evaluate_method(ACER_BATTERY_GUID, 0, 20, &input, &output)=
;

Please use wmidev_evaluate_method().

> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	obj =3D output.pointer;
> +	if (!obj)
> +		return -EIO;
> +	else if (obj->type !=3D ACPI_TYPE_BUFFER) {

The "else" is pointless here, please remove.

> +		ret =3D -EIO;
> +		goto out_free_obj;
> +	}
> +
> +	status_output =3D *((struct get_battery_health_control_status_output *=
)
> +			obj->buffer.pointer);
> +	if (obj->buffer.length !=3D 8) {

Please do the size check first before assigning status_output (keep the pr=
evious comment regarding oversized buffers in mind).
Also please turn status_output into a pointer so that you can avoid a copy=
 operation.

> +		dev_err(&data->wdev->dev, "WMI battery status call returned a buffer =
of unexpected length %d\n",
> +			obj->buffer.length);
> +		ret =3D -EINVAL;
> +		goto out_free_obj;
> +	}
> +
> +	if (health_mode)
> +		*health_mode =3D status_output.uFunctionList & HEALTH_MODE ?
> +					  status_output.uFunctionStatus[0] > 0 :
> +					  -1;
> +
> +out_free_obj:
> +	kfree(obj);
> +	return ret;
> +}
> +
> +static int set_battery_health_control(struct acer_wmi_battery_data *dat=
a,
> +					      u8 function, bool function_status)
> +{
> +	struct set_battery_health_control_input params =3D {
> +		.uBatteryNo =3D ACER_BATTERY_INDEX,
> +		.uFunctionMask =3D function,
> +		.uFunctionStatus =3D (u8)function_status,
> +		.uReservedIn =3D { 0x0, 0x0, 0x0, 0x0, 0x0 }
> +	};
> +	struct acpi_buffer input =3D {
> +		sizeof(struct set_battery_health_control_input),
> +		&params,
> +	};
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	int ret;
> +
> +	ret =3D wmi_evaluate_method(ACER_BATTERY_GUID, 0, 21, &input, &output)=
;

Please use wmidev_evaluate_method().

> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	obj =3D output.pointer;
> +
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +		ret =3D -EIO;
> +		goto out_free_obj;
> +	}
> +
> +	if (obj->buffer.length !=3D 4) {

Please also accept oversized buffers. By the way, what is the usage of the=
 return value?

> +		dev_err(&data->wdev->dev, "WMI battery status set operation returned =
a buffer of unexpected length %d\n",
> +			obj->buffer.length);
> +		ret =3D -EINVAL;
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
> +	struct acer_wmi_battery_data *data =3D ext_data;
> +	s8 health_mode;
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
> +		if (health_mode < 0)
> +			return -EINVAL;
> +
> +		val->intval =3D health_mode ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE :
> +				POWER_SUPPLY_CHARGE_TYPE_STANDARD;
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
> +					       const struct power_supply_ext *ext,
> +					       void *ext_data,
> +					       enum power_supply_property psp,
> +					       const union power_supply_propval *val)
> +{
> +	struct acer_wmi_battery_data *data =3D ext_data;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		return set_battery_health_control(data, HEALTH_MODE,
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
> +	case POWER_SUPPLY_PROP_TEMP:
> +		return false;

Nitpick: Only return true for charge_types and return false for everything=
 else.

> +	default:
> +		return true;
> +	}
> +}
> +
> +static const enum power_supply_property acer_battery_properties[] =3D {
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,

I own a Acer notebook that only supports the temperature sensor, not the h=
ealth mode feature.
You can detect this by looking at the embedded WMI binary MOF data, but we=
 currently have no
in-kernel parser for this.

I am working on adding support for the binary MOF data, but for now i sugg=
est that you use a
DMI whitelist before enabling access to the health mode feature.

> +	POWER_SUPPLY_PROP_TEMP,
> +};
> +
> +static const struct power_supply_ext acer_wmi_battery_extension =3D {
> +	.name			=3D "acer_laptop",

Could you please use "acer_wmi_battery" (or DRIVER_NAME) instead? This wou=
ld prevent any future name conflicts
with other drivers for Acer notebooks.

> +	.properties		=3D acer_battery_properties,
> +	.num_properties		=3D ARRAY_SIZE(acer_battery_properties),
> +	.charge_types           =3D (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
> +	.get_property		=3D acer_battery_ext_property_get,
> +	.set_property		=3D acer_battery_ext_property_set,
> +	.property_is_writeable	=3D acer_battery_ext_property_is_writeable,
> +};
> +
> +static int acer_battery_add(struct power_supply *battery, struct acpi_b=
attery_hook *hook)
> +{
> +	struct acer_wmi_battery_data *data =3D container_of(hook, struct acer_=
wmi_battery_data, hook);
> +
> +	return power_supply_register_extension(battery, &acer_wmi_battery_exte=
nsion,
> +					       &data->wdev->dev, data);
> +}
> +
> +static int acer_battery_remove(struct power_supply *battery, struct acp=
i_battery_hook *hook)
> +{
> +	power_supply_unregister_extension(battery, &acer_wmi_battery_extension=
);
> +
> +	return 0;
> +}
> +
> +static int acer_wmi_battery_battery_add(struct acer_wmi_battery_data *d=
ata)
> +{
> +	data->hook.name =3D "Acer Battery Extension";
> +	data->hook.add_battery =3D acer_battery_add;
> +	data->hook.remove_battery =3D acer_battery_remove;
> +
> +	return devm_battery_hook_register(&data->wdev->dev, &data->hook);
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
> +
> +	return acer_wmi_battery_battery_add(data);

Nitpick: Please fold this function into the caller.

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

Please also set .no_singleton to signal that this driver can be instantiat=
ed multiple times.

Thanks,
Armin Wolf

> +};
> +module_wmi_driver(acer_wmi_battery_driver);
> +
> +MODULE_AUTHOR("Frederik Harwath <frederik@harwath.name>");
> +MODULE_AUTHOR("Jelle van der Waa <jelle@vdwaa.nl>");
> +MODULE_DESCRIPTION("Acer battery health control WMI driver");
> +MODULE_LICENSE("GPL");
