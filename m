Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478083E9C03
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 21:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052086; cv=none; b=plrSG9rKZcq3I79Su6hsjCbGhzUdia0E02RhM9eIj6xVMkkdaBlEMmWCpkxzDxp1cHiZyBLku3etZtUyOK6+8IUz4hAHppPaLjRz7JoHiY80ODwuE8uTOD1L8XmAtm+J8Rd2DBqyXMSAxW4C1QO1zLfNFzqNFlD/G9U91oazWHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052086; c=relaxed/simple;
	bh=uXMOCRVy2/qdqCt+QJys4geZcjPcdBfpDeHmYjTQskk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ag6sMm7kg5zTudrNMF0Z5ZikB+Gb4EIyTJCohQlsuM16mYb4cNHe3iJkfhJtwxb52ZIDsBGrSUbWG6vL9UzQN8kxnKfBIjKFDNAKTMMIYoJkBCrPHIIwetveqJIs8sdMher6RTt1olXeUbcjvwaDG7/gSJCfgqVvzriXgH82vS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=d0P4Xhoa; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="d0P4Xhoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1786052070; x=1786656870; i=w_armin@gmx.de;
	bh=HuwxUBKWG+Rkd8meTRopdcNtpUdZCFb6bkK263UnlBY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=d0P4Xhoaxks5AEseMOKxJb9HByrzXib+tL9f6oY5apucmS3daoKqpywnTjwtNF/N
	 MkZxouZE6XId6L/k6w1cwSAgI9K7vNweggIQ5lNpCabnKH2XVz/YHOpkS+2gdi2x0
	 4lb26V1ZDodJNRuR7UhuYX8tpxDKvjUK+eWbjAQ8OEy/KKh2eWCVu6Qq36hnG0vHJ
	 HzBU6Xo0bp3gZMbaGvP+WRRdrZHikoXdnSe/VeGcSusamkINC6QqJ/dgST5klGtTb
	 5hDp+xl4duNP3aSAIkiUAKLcBfbI0y0TZLE0iy9+gRS4miw8Kzs6SvB9YSM+00YNa
	 FcngU8s9uaJuOhxdag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2E1G-1x2Hwx43CQ-00wHU2; Thu, 06
 Aug 2026 23:34:30 +0200
Message-ID: <bed19bcb-d0aa-4560-aaae-64e30a179adb@gmx.de>
Date: Thu, 6 Aug 2026 23:34:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] platform/x86: add Acer battery control driver
To: Jelle van der Waa <jelle@vdwaa.nl>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260805184645.24542-1-jelle@vdwaa.nl>
 <20260805184645.24542-2-jelle@vdwaa.nl>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260805184645.24542-2-jelle@vdwaa.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gYTBMyoJ/WWwLojtr40or2pxmem7PZPf7ASeXf1hlqPEjkUEd47
 Ua6Fi+9XFXgY9fCKQh4xUavNE/QjKi+8zRSzAZ1dYf38GMYTPrmDjYzQBvsIFmUsHPGBcpO
 Wp4jKbHo9AUMFvIq4LatHrmGdHgnCdqrbdaPz6qw9Gex9vXm+KyhlnteE7dTMPRRYjqV/zK
 JWvV0L4IHIROHVafT+aWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2U0IF7iN+Z4=;InK1Pxo2WRsuvTAUML9nNDOkCtJ
 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
 pAbAlnVxEh31hW0vRaI=

Am 05.08.26 um 20:46 schrieb Jelle van der Waa:

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
> v5:
> - Add Acer WMI Battery Interface documentation
> - Drop unneeded wmi_buffer output initialisation
> - Drop get_unaligned_le32, as wmi core returns aligned data
> - Derive temperature divider contsant from <linux/units.h> defines
> - Add trailing commas to any non-terminating entry in DMI match table
> - Remove duplicate DMI entry from DMI match table
> - Update set_battery_health_control_output members to be __le16 not u8
>    as WMI data suggests
> - Replace sizeof(u32) with sizeof(*result)
> - Add an empty line between if statements in POWER_SUPPLY_PROP_TEMP case
> - Drop unneeded .set_property callback in acer_wmi_battery_extension_v1
> - Introduce a force module parameter for easier testing of new notebook
>    models
> - Use "ret" instead of "r"
> - Check the "uReturn" value of SetBatteryHealthControl
> v4:
> - Add additional DMI ids from https://github.com/frederik-h/acer-wmi-bat=
tery/blob/main/MODELS.md
>    cross checked with DMI ids found in https://github.com/linuxhw/DMI
> - Move DMI matching to __init and make the DMI table __initconst
> - Port to the new wmidev_invoke_* API
> v3:
> - Add depends on DMI
> - Rename CamelCase struct member names
> - Simplify returning errors
> - Add comma to non-terminating entries
> - Simplified acer_wmi_battery_set_battery_health_control to acer_wmi_set=
_battery_health_control
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
>    temperature support.
> ---
>   .../wmi/devices/acer-wmi-battery.rst          |  70 +++
>   drivers/platform/x86/Kconfig                  |  12 +
>   drivers/platform/x86/Makefile                 |   1 +
>   drivers/platform/x86/acer-wmi-battery.c       | 449 ++++++++++++++++++
>   4 files changed, 532 insertions(+)
>   create mode 100644 Documentation/wmi/devices/acer-wmi-battery.rst
>   create mode 100644 drivers/platform/x86/acer-wmi-battery.c
>
> diff --git a/Documentation/wmi/devices/acer-wmi-battery.rst b/Documentat=
ion/wmi/devices/acer-wmi-battery.rst
> new file mode 100644
> index 000000000000..8aa3e1334490
> --- /dev/null
> +++ b/Documentation/wmi/devices/acer-wmi-battery.rst
> @@ -0,0 +1,70 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +Acer WMI Battery interface driver (acer-wmi-battery)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Some Acer laptops support setting battery charge control limits and all=
ow a
> +user to calibrate their battery.
> +
> +WMI interface description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +The WMI interface description can be decoded from the embedded binary M=
OF (bmof)
> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"Class used to control smart battery, Version 2.88"), guid("{79772EC5-04B1=
-4bfd-843C-61E7F77B6CC9}")]
> +  class BatteryControl {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(19), Implemented, read, write, Description("Get batter=
y Information Interface.")] void GetBattInfoInterface([in] uint32 uBattery=
InfoIndex, [in] uint32 uBatteryNo, [out] uint32 uReturn);
> +    [WmiMethodId(20), Implemented, read, write, Description("Get Batter=
y Health Control Status.")] void GetBatteryHealthControlStatus([in] uint8 =
uBatteryNo, [in] uint8 uFunctionQuery, [in] uint8 uReserved[2], [out] uint=
8 uFunctionList, [out] uint8 uReturn[2], [out] uint8 uFunctionStatus[5]);
> +    [WmiMethodId(21), Implemented, read, write, Description("Set Batter=
y Health Control.")] void SetBatteryHealthControl([in] uint8 uBatteryNo, [=
in] uint8 uFunctionMask, [in] uint8 uFunctionStatus, [in] uint8 uReservedI=
n[5], [out] uint16 uReturn, [out] uint16 uReservedOut);
> +    [WmiMethodId(22), Implemented, read, write, Description("Get Batter=
y Function Data.")] void GetBatteryFunctionData([in] uint8 uFunctionMask, =
[in] uint8 uReservedIn[3], [out] uint8 uReturnCode[2], [out] uint8 uBACSta=
rtTime[2], [out] uint8 uBACStopTime[2], [out] uint8 uBACStatus, [out] uint=
8 uReservedOut[9]);
> +    [WmiMethodId(23), Implemented, read, write, Description("Set Batter=
y Function Data.")] void SetBatteryFunctionData([in] uint8 uFunctionMask, =
[in] uint8 uBACSwitch, [in] uint8 uReservedIn[6], [out] uint16 uReturnCode=
, [out] uint8 uReservedOut[2]);
> +  };
> +
> +For all methods the ``uBatteryNo`` is always ``0x1``, there are no know=
n Acer
> +laptop models with two batteries.
> +
> +WMI method GetBatteryInfoInterface()
> +------------------------------------
> +
> +Returns additional battery information, the data seems to be based on t=
he
> +"Smart Battery Data Specification". The only known value for
> +``uBatteryInfoIndex`` is ``0x8``, the battery temperature.
> +
> +WMI method GetBatteryHealthControlStatus()
> +------------------------------------------
> +
> +This interface does not exist on all Acer laptops, it returns whether b=
attery
> +charge limiting or calibration mode is enabled.
> +
> +When calling this method, ``uFunctionList`` is a bitmask with known val=
ues:
> +
> ++--------------------+------------------------------------+
> +| Value              | Description                        |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| 0x01               | Health mode supported              |
> ++--------------------+------------------------------------+
> +| 0x02               | Calibration mode supported         |
> ++--------------------+------------------------------------+
> +
> +``uFunctionStatus`` is a 5 byte array known elements are ``0`` for heal=
th mode
> +and ``1`` for calibration mode. A non-zero value means the mode is enab=
led.
> +
> +WMI method SetBatteryHealthControl()
> +------------------------------------
> +
> +This interface does not exist on all Acer laptops, it enables battery
> +charge limiting or battery calibration.
> +
> +The argument ``uFunctionMask`` is known to accept either ``0x01`` for s=
etting
> +health mode or ``0x02`` for calibration mode; other values are unknown.
> +``uFunctionStatus`` is an uint8 value, a non-zero value enables the giv=
en mode.
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index b54b5212b204..d4a8294df5e1 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -189,6 +189,18 @@ config ACER_WMI
>   	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>   	  here.
>  =20
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
>   source "drivers/platform/x86/amd/Kconfig"
>  =20
>   config ADV_SWBUTTON
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 872ac3842391..a877acd937cd 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_BITLAND_MIFS_WMI)		+=3D bitland-mifs-wmi.=
o
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
> index 000000000000..6163ee021ffb
> --- /dev/null
> +++ b/drivers/platform/x86/acer-wmi-battery.c
> @@ -0,0 +1,449 @@
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
> +#include <linux/units.h>
> +#include <linux/version.h>
> +#include <linux/wmi.h>

Hi,

please also add a include of linux/byteorder/generic.h

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
> +static bool force;
> +module_param_unsafe(force, bool, 0);
> +MODULE_PARM_DESC(force, "Enable health mode control without checking fo=
r supported devices\n");
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
> +	__le16 ret;
> +	__le16 reserved_out;
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
> +};
> +
> +bool health_mode;

This variable should be made static and marked as __ro_after_init.

> +
> +static int acer_wmi_battery_get_information(struct acer_wmi_battery_dat=
a *data,
> +					    u32 index, u32 battery, u32 *result)
> +{
> +	u32 args[2] =3D { index, battery };
> +	struct wmi_buffer input =3D { .length =3D sizeof(args), .data =3D args=
 };
> +	struct wmi_buffer output;
> +	int ret;
> +
> +	ret =3D wmidev_invoke_method(data->wdev, 0, 19, &input, &output, sizeo=
f(*result));
> +	if (ret)
> +		return ret;
> +
> +	*result =3D *(u32 *)output.data;

Please use __le32 here and convert the output data to u32 using le32_to_cp=
up().

> +	kfree(output.data);
> +
> +	return 0;
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
> +		.battery_no =3D ACER_BATTERY_INDEX,
> +		.function_query =3D 0x1,
> +		.reserved =3D { 0x0, 0x0 },
> +	};
> +	struct wmi_buffer input =3D { .length =3D sizeof(args), .data =3D &arg=
s };
> +	struct wmi_buffer output;
> +	int ret;
> +
> +	ret =3D wmidev_invoke_method(data->wdev, 0, 20, &input, &output,
> +				   sizeof(struct get_battery_health_control_status_output));
> +	if (ret)
> +		return ret;
> +
> +	struct get_battery_health_control_status_output *status_output __free(=
kfree) =3D output.data;
> +
> +	if (health_mode) {

health_mode is always non-NULL, so please remove this unnecessary if-state=
ment.

> +		if (!(status_output->function_list & HEALTH_MODE))
> +			return -EINVAL;
> +
> +		*health_mode =3D status_output->function_status[0] > 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int acer_wmi_battery_set_health_control(struct acer_wmi_battery_=
data *data,
> +					       u8 function, bool function_status)
> +{
> +	struct set_battery_health_control_input args =3D {
> +		.battery_no =3D ACER_BATTERY_INDEX,
> +		.function_mask =3D function,
> +		.function_status =3D function_status ? 1 : 0,
> +		.reserved_in =3D { 0x0, 0x0, 0x0, 0x0, 0x0 },
> +	};
> +	struct wmi_buffer input =3D { .length =3D sizeof(args), .data =3D &arg=
s };
> +	struct wmi_buffer output;
> +	int ret;
> +
> +	ret =3D wmidev_invoke_method(data->wdev, 0, 21, &input, &output,
> +				   sizeof(struct set_battery_health_control_output));
> +	if (ret)
> +		return ret;
> +
> +	struct set_battery_health_control_output *status_output __free(kfree) =
=3D output.data;
> +	if (le16_to_cpu(status_output->ret) !=3D 0)
> +		return -EIO;
> +
> +	return 0;
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
> +		val->intval =3D health_mode ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE
> +					  : POWER_SUPPLY_CHARGE_TYPE_STANDARD;
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
> +		val->intval =3D value + ABSOLUTE_ZERO_MILLICELSIUS / MILLIDEGREE_PER_=
DECIDEGREE;
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
__initconst =3D {
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-510P"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-24PT"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-44P"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-59"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-59"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A715-42G"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-57"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-58"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN517-54"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN517-54"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Predator PHN16-71"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SF314-34"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SF314-43"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFE16-44"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFG16-72"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFX14-71G"),
> +		},
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFX16-61G"),
> +		},
> +	},
> +	{}
> +};

Maybe you could move this whitelist a bit further down, just below acer_wm=
i_battery_module_init()?

Otherwise, the driver looks good to me.

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
> +static const struct power_supply_ext acer_wmi_battery_extension_v1 =3D =
{
> +	.name			=3D DRIVER_NAME,
> +	.properties		=3D acer_battery_properties_v1,
> +	.num_properties		=3D ARRAY_SIZE(acer_battery_properties_v1),
> +	.get_property		=3D acer_battery_ext_property_get,
> +	.property_is_writeable	=3D acer_battery_ext_property_is_writeable,

Please remove this line, as there exist no writable properties in the v1 e=
xtension.
The power supply core should then automatically fall back to read-only.

With those issues being addressed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +};
> +
> +static const struct power_supply_ext acer_wmi_battery_extension_v2 =3D =
{
> +	.name			=3D DRIVER_NAME,
> +	.properties		=3D acer_battery_properties_v2,
> +	.num_properties		=3D ARRAY_SIZE(acer_battery_properties_v2),
> +	.charge_types           =3D BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +				  BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),
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
> +	data->battery_ext =3D health_mode ? &acer_wmi_battery_extension_v2
> +					: &acer_wmi_battery_extension_v1;
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
> +
> +static int __init acer_wmi_battery_module_init(void)
> +{
> +	int ret;
> +
> +	if (dmi_check_system(acer_wmi_battery_health_mode_table) || force)
> +		health_mode =3D true;
> +	else
> +		health_mode =3D false;
> +
> +	ret =3D wmi_driver_register(&acer_wmi_battery_driver);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
> +static void __exit acer_wmi_battery_module_exit(void)
> +{
> +	wmi_driver_unregister(&acer_wmi_battery_driver);
> +}
> +
> +module_init(acer_wmi_battery_module_init);
> +module_exit(acer_wmi_battery_module_exit);
> +
> +MODULE_AUTHOR("Frederik Harwath <frederik@harwath.name>");
> +MODULE_AUTHOR("Jelle van der Waa <jelle@vdwaa.nl>");
> +MODULE_DESCRIPTION("Acer battery health control WMI driver");
> +MODULE_LICENSE("GPL");
