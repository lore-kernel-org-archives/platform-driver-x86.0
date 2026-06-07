Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C58528002B
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 20:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780865202; cv=none; b=rbxfeEmKI07KWd2GFeSsgFkPbRdhD8LQR8sSe/Eq3bhL1pTvncJInBoK/nPKmTcCdY7AaNrvSc88gHRAd0wglThch8pxNBV4YYRZWqEKDrD25YxsaO8lR+lScIfXI3gRORD5a6kGfS37pA6EZWBO+R/iCg/JrDmWuciFoYRXbH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780865202; c=relaxed/simple;
	bh=RXbcxR1ULFD/sAevZDhWAeVaSPb+T4stn+KFZEZclIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6n25YX5AAiAKy3qPxRfbUoRNwR0CxnCsMw3gXQvYWdJBk1MqukdhcT6Imh8IOaWNwXFmm0wxIbF5612v6ZponeF3T3dSaLN8YvUZtxx3oruiWeq4ea2R/UTMHqQIXstI1q++wvpZeKR6/ImujrPDA7e1LPdXXovvAFSQhcFa2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ebwNmZFe; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ebwNmZFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780865191; x=1781469991; i=w_armin@gmx.de;
	bh=2nRxuM7cVThyO93G/rPNwqzRaaqMIBlJHnBFqcRlfLQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ebwNmZFe2/8lmEhVsHPRbnkqqK01ZxbUPt883RR9iodSuVE1ehNk6K2qbIyAHpvT
	 DP2CX6SDUeSC7kKjHOfY0/KAO4nfCy9eTX510+jyiRXZok7MOA5GAppbjdUYgh6O1
	 x6qW5KT8H4C2/mKn6fkKgT/VqTC2E1lgaYgE94fh+ZfXctT5hZ29feTS/7baX5rvf
	 uCsLs4W/MFHSp1qwAk+wl/JZ4j2AxFDifS2H3uPGKjuDCbxcQjvbAUKFwIMFpa82q
	 dVfkK24QVwaMhVuYEilv5XyGMY9lsvQOQxUr2+8RtLqWG/28jFOH7J8bDTUBcYfOe
	 gFxEp+LlDLZieBqbTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsIv-1xM6ID41KB-00xvd6; Sun, 07
 Jun 2026 22:46:31 +0200
Message-ID: <97d09dc5-1434-4d64-abd7-8ba465c3891b@gmx.de>
Date: Sun, 7 Jun 2026 22:46:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] platform/x86: add Acer battery control driver
To: Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260531090505.156394-1-jelle@vdwaa.nl>
 <20260531090505.156394-2-jelle@vdwaa.nl>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260531090505.156394-2-jelle@vdwaa.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eUALITUPvXD2HgE6P4qZgrM/l49WgbTrJFRfUEGgAJljbfs6VFQ
 a9DrI73ulNPnvVBCSGjS9E4wDjGDzuKkUXUiAnXche080iVQu31Ju1JBO7NN6/bLi4Ee1qx
 3bvzXtR4lIIru85xuoosuSzm8mhAjDZDIDROlmPt9oluIjnd9J1+xLP4cHjNwBUC8JNEtwK
 uZRZyC6TKccoQDce884gQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KgxJB9q/wsE=;bPmg/IjSU1dIPnPY/wdUZ2IJ3hm
 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

Am 31.05.26 um 11:05 schrieb Jelle van der Waa:

> Some Acer laptops can configure battery related features through Acer
> Care Center on Windows. This driver uses the power supply extension to
> set a battery charge limit and exposes the battery
> temperature.
>
> This driver is based on the existing acer-wmi-battery project on GitHub
> and was tested on an Acer Aspire A315-510P.

Good work, i tested it on my old Aspire notebook (v1 interface) and i can =
confirm
that the temperature reading and DMI whitelist works as intended.

I found a couple of minor issues, once those are addressed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
>
> ---
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
>   drivers/platform/x86/Kconfig            |  12 +
>   drivers/platform/x86/Makefile           |   1 +
>   drivers/platform/x86/acer-wmi-battery.c | 445 ++++++++++++++++++++++++
>   3 files changed, 458 insertions(+)
>   create mode 100644 drivers/platform/x86/acer-wmi-battery.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7a4956088300..ad7474c35d8e 100644
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
> index 000000000000..903a6e762ebd
> --- /dev/null
> +++ b/drivers/platform/x86/acer-wmi-battery.c
> @@ -0,0 +1,445 @@
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

Hi,

when looking at the BMOF content it seems that both field are actually 16-=
bit wide.
Please fix this by using __le16 instead of u8.

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Clas=
s used to control smart battery, Version 2.88"), guid("{79772EC5-04B1-4bfd=
-843C-61E7F77B6CC9}")]
class BatteryControl {
   [key, read] string InstanceName;
   [read] boolean Active;

   [WmiMethodId(19), Implemented, read, write, Description("Get battery In=
formation Interface.")] void GetBattInfoInterface([in] uint32 uBatteryInfo=
Index, [in] uint32 uBatteryNo, [out] uint32 uReturn);
   [WmiMethodId(20), Implemented, read, write, Description("Get Battery He=
alth Control Status.")] void GetBatteryHealthControlStatus([in] uint8 uBat=
teryNo, [in] uint8 uFunctionQuery, [in] uint8 uReserved[2], [out] uint8 uF=
unctionList, [out] uint8 uReturn[2], [out] uint8 uFunctionStatus[5]);
   [WmiMethodId(21), Implemented, read, write, Description("Set Battery He=
alth Control.")] void SetBatteryHealthControl([in] uint8 uBatteryNo, [in] =
uint8 uFunctionMask, [in] uint8 uFunctionStatus, [in] uint8 uReservedIn[5]=
, [out] uint16 uReturn, [out] uint16 uReservedOut);
   [WmiMethodId(22), Implemented, read, write, Description("Get Battery Fu=
nction Data.")] void GetBatteryFunctionData([in] uint8 uFunctionMask, [in]=
 uint8 uReservedIn[3], [out] uint8 uReturnCode[2], [out] uint8 uBACStartTi=
me[2], [out] uint8 uBACStopTime[2], [out] uint8 uBACStatus, [out] uint8 uR=
eservedOut[9]);
   [WmiMethodId(23), Implemented, read, write, Description("Set Battery Fu=
nction Data.")] void SetBatteryFunctionData([in] uint8 uFunctionMask, [in]=
 uint8 uBACSwitch, [in] uint8 uReservedIn[6], [out] uint16 uReturnCode, [o=
ut] uint8 uReservedOut[2]);
};

I suggest you write a tiny bit of documentation under Documentation/wmi/de=
vices/ using this MOF description.
This way future developers can better understand the WMI interface used by=
 this driver.

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
> +
> +static int acer_wmi_battery_get_information(struct acer_wmi_battery_dat=
a *data,
> +					    u32 index, u32 battery, u32 *result)
> +{
> +	u32 args[2] =3D { index, battery };
> +	struct wmi_buffer input =3D { .length =3D sizeof(args), .data =3D args=
 };
> +	struct wmi_buffer output =3D { 0 };

Nit: You do not need to initialize the output buffer, this is being done b=
y the WMI driver core
itself.

> +	int ret;
> +
> +	ret =3D wmidev_invoke_method(data->wdev, 0, 19, &input, &output, sizeo=
f(u32));

Nit: Replace sizeof(u32) with sizeof(*result).

> +	if (ret)
> +		return ret;
> +
> +	*result =3D get_unaligned_le32(output.data);
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
> +	struct wmi_buffer output =3D { 0 };

Nit: Same issue as above.

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
> +	int ret;
> +
> +	ret =3D wmidev_invoke_procedure(data->wdev, 0, 21, &input);
> +	if (ret)
> +		return ret;

The BMOF content suggest that the WMI method does return (currently unused=
) data.
Please ensure that we actually receive this data because failing WMI metho=
d sometimes
signal failure by returning not enough output data.

(You only have to verify that you received at least sizeof(struct set_batt=
ery_health_control_output)
bytes, but i would be very happy if you could find out the value of the "r=
et" field inside
struct set_battery_health_control_output used to indicate success)

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

Nit: Please put an empty line here.

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
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-510P")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-24PT")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-44P")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-59")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-59")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-510P")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A715-42G")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-57")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-58")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN517-54")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN517-54")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Predator PHN16-71")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SF314-34")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SF314-43")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFE16-44")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFG16-72")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFX14-71G")
> +		}
> +	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFX16-61G")
> +		}
> +	},
> +	{}
> +};
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
> +	.set_property		=3D acer_battery_ext_property_set,

Populating the .set_property callback when no writable properties are pres=
ent is unnecessary, please remove.

> +	.property_is_writeable	=3D acer_battery_ext_property_is_writeable,
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
> +	int r;
> +
> +	if (dmi_check_system(acer_wmi_battery_health_mode_table))

Maybe you could add a "force" module parameter using:

static bool force;
module_param_unsafe(force, bool, 0);
MODULE_PARM_DESC(force, "Enable health mode control without checking for s=
upported devices\n");

This way users can optionally override the whitelist for testing new noteb=
ook models.

> +		health_mode =3D true;
> +	else
> +		health_mode =3D false;
> +
> +	r =3D wmi_driver_register(&acer_wmi_battery_driver);
> +	if (r)
> +		return r;
> +
> +	return r;

Nit: Please use "ret" instead of "r".

Thanks,
Armin Wolf

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
