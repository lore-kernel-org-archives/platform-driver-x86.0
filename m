Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26084219FB;
	Wed, 25 Mar 2026 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462168; cv=pass; b=CL1Y0vJFuM3oGvMWkTX2nSIVk6+t73i7aHpSnQq27fK5TQrwLX+WhZGA0Jx/PYg7SPnvokozzpzXdGqZ1mJrEsEhZt2O5Qkxl66XUnDotzfwlOU8UUsJ5n6aAzA3fz/X5u0SE5EHwUY/NZR554SgfBbM5yvMP+N+RrD/uAv61OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462168; c=relaxed/simple;
	bh=u+fx9D+kuRuBb3xDX3seJM3Q0CNdhskme3rSN0xcK9U=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hB+n//sD7CUkkQO0g++vPER3ez2sw9HIj1Ip9B6gmfcveS/RqNViAd4P5EwsHbCjIaiUCrgmTlYky0ZaJ0OAVZdCCuZd1O6J4HshhNKyKczSWFXrfQz1Pnz8wBDVTlxtq2HHMtDaWKytOlG4Wn83E85kusXRanrgYHQX1sR/GDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ee6AqT1r; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ee6AqT1r"
ARC-Seal: i=1; a=rsa-sha256; t=1774462154; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k3AV0eycT/+zGhM0JhhCMmj0zUSSpzfIuCfCnqW0mQbSwxjVnRODKmO9/fhVoxhF/wYehTD7YJaumgKwEUh2mxrwiJmcLz8BrjJ9KzMf0rV5ja/HR/ZD5d/326peYB9dxi4BH7JRQVxlonZPv4XGQu93vTiF+hKq4OuofAUGGRY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774462154; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SHSeQR0lfaejuXMTKkkswBw9kqje5XABXgIc9k8AMOs=; 
	b=IKI4ReKqXNhWfBQyvLgexJiS9b1P0MXzAfRZq1u33EOSYFU8EOaVj7oxdqnVW9mh6lQyRAiQu6ctFeHS62HYY7dKHnF2v3yNfuhmXxou+U5lk6M5IgAXz1n3a1Sw8nBYAhwVEzFL9bF0+YpBOjTPVp3WTwLXSdJIcWpH0JJMmGo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774462154;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=SHSeQR0lfaejuXMTKkkswBw9kqje5XABXgIc9k8AMOs=;
	b=ee6AqT1rMmLHhYFCwwUslVJeB1VBVvCWZm8e9E7ueyFrmRYAz2Jgzcal6rNm1QuP
	RHDyrBxoXHwdZRZYHEdXgd2dmoqQbAS4qv5Ux3DV3PmxGiuLkJ9psWdAeC078uX3kQT
	+TSJnddjZl8XqQ3dDqGaKg/b7wnfhMaGSZx1uh3n5VJcgKtDthTMwUjVqQ+i7rUi+oi
	peewxVAZnNWBrDV3wJ0E+PxZuOPoIx0zGDAnPWFr971QuXv6r3q5Ja6Qy3Iiy6IIy0H
	OXP1SWXcbIDLIe64Sa1Q0tk1JHS+qRTu6R6sZ1XBjME8Q88VOon6Jit6rqHCjAUw0ga
	73UBUb/kNg==
Received: by mx.zohomail.com with SMTPS id 1774462152395397.5489803253463;
	Wed, 25 Mar 2026 11:09:12 -0700 (PDT)
Message-ID: <d9b552f06cd32111308ecb8371792cf331c5e6eb.camel@rong.moe>
Subject: Re: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324221032.1333636-9-derekjohn.clark@gmail.com>
References: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
	 <20260324221032.1333636-9-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2026 02:03:13 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-03-24 at 22:10 +0000, Derek J. Clark wrote:
> Add charge-type power supply extension for devices that support WMI based
> charge enable/disable.
>=20
> Lenovo Legion devices that implement WMI function and capdata ID
> 0x03010001 in their BIOS are able to enable or disable charging at 80%
> through the lenovo-wmi-other interface. Add a charge_type power supply
> extension to expose this capability to the sysfs.
>=20
> The ideapad_laptop driver can also provide the charge_type attribute. To
> avoid conflicts between the drivers, get the acpi_handle and do the same
> check that ideapad_laptop does when it enables the feature. If the
> feature is supported in ideapad_laptop, abort adding the extension from
> lenovo-wmi-other. The ACPI method is more reliable when both are
> present, from my testing, so we can prefer that implementation and do
> not need to worry about de-conflicting from inside that driver. A new
> module parameter, force_load_psy_ext, is provided to bypass this ACPI
> check, if desired.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v5:
>   - Use switch statement instead of if for battery charge state set/get.
>   - use force_load_psy_ext to skip all ACPI interactions.
>   - Various formatting fixes.
> v4:
>   - Remove unused defines.
>   - Disambiguate charging defines by renaming them to be more consistent
>     with the kernel modes they represent.
>   - Add module parameter to ignore ACPI checks.
>   - Don't fail if the ACPI handle isn't found, skip the ACPI check
>     instead.
> ---
>  drivers/platform/x86/lenovo/Kconfig       |   1 +
>  drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
>  drivers/platform/x86/lenovo/wmi-other.c   | 250 +++++++++++++++++++++-
>  3 files changed, 251 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index f885127b007f..75a8b144b0da 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -263,6 +263,7 @@ config LENOVO_WMI_GAMEZONE
>  config LENOVO_WMI_TUNING
>  	tristate "Lenovo Other Mode WMI Driver"
>  	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
>  	select HWMON
>  	select FW_ATTR_CLASS
>  	select LENOVO_WMI_CAPDATA
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index b026ee30c828..1939401c6c14 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -20,6 +20,7 @@
>  enum lwmi_device_id {
>  	LWMI_DEVICE_ID_CPU =3D 0x01,
>  	LWMI_DEVICE_ID_GPU =3D 0x02,
> +	LWMI_DEVICE_ID_PSU =3D 0x03,
>  	LWMI_DEVICE_ID_FAN =3D 0x04,
>  };
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 11c16857ef97..cef51cded7be 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -43,9 +43,12 @@
>  #include <linux/module.h>
>  #include <linux/notifier.h>
>  #include <linux/platform_profile.h>
> +#include <linux/power_supply.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
> =20
> +#include <acpi/battery.h>
> +
>  #include "wmi-capdata.h"
>  #include "wmi-events.h"
>  #include "wmi-gamezone.h"
> @@ -79,9 +82,11 @@ enum lwmi_feature_id_gpu {
>  	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D	0x0b,
>  };
> =20
> -#define LWMI_FEATURE_ID_FAN_RPM 0x03
> +#define LWMI_FEATURE_ID_FAN_RPM		0x03
> +#define LWMI_FEATURE_ID_PSU_CHARGE_TYPE	0x01
> =20
>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
> +#define LWMI_TYPE_ID_PSU_AC	0x01
> =20
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> @@ -92,10 +97,17 @@ enum lwmi_feature_id_gpu {
> =20
>  #define LWMI_FAN_DIV 100
> =20
> +#define LWMI_CHARGE_TYPE_STANDARD	0x00
> +#define LWMI_CHARGE_TYPE_LONGLIFE	0x01
> +
>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>  	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> =20
> +#define LWMI_ATTR_ID_PSU(feat, type)			\
> +	lwmi_attr_id(LWMI_DEVICE_ID_PSU, feat,		\
> +		     LWMI_GZ_THERMAL_MODE_NONE, type)
> +
>  #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> =20
> @@ -137,6 +149,8 @@ struct lwmi_om_priv {
>  		bool capdata00_collected : 1;
>  		bool capdata_fan_collected : 1;
>  	} fan_flags;
> +
> +	struct acpi_battery_hook battery_hook;
>  };
> =20
>  /*
> @@ -561,6 +575,239 @@ static void lwmi_om_fan_info_collect_cd_fan(struct =
device *dev, struct cd_list *
>  	lwmi_om_hwmon_add(priv);
>  }
> =20
> +/* =3D=3D=3D=3D=3D=3D=3D=3D Power Supply Extension (component: lenovo-wm=
i-capdata 00) =3D=3D=3D=3D=3D=3D=3D=3D */
> +
> +/**
> + * lwmi_psy_ext_get_prop() - Get a power_supply_ext property
> + * @ps: The battery that was extended
> + * @ext: The extension
> + * @ext_data: Pointer the lwmi_om_priv drvdata
> + * @prop: The property to read
> + * @val: The value to return
> + *
> + * Writes the given value to the power_supply_ext property
> + *
> + * Return: 0 on success, or an error
> + */
> +static int lwmi_psy_ext_get_prop(struct power_supply *ps,
> +				 const struct power_supply_ext *ext,
> +				 void *ext_data,
> +				 enum power_supply_property prop,
> +				 union power_supply_propval *val)
> +{
> +	struct lwmi_om_priv *priv =3D ext_data;
> +	struct wmi_method_args_32 args;

Zero-initialize `args'. See my previous reply.

> +	u32 retval;
> +	int ret;
> +
> +	args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, LWMI_TY=
PE_ID_PSU_AC);
> +
> +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
> +				    (unsigned char *)&args, sizeof(args),
> +				    &retval);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(&priv->wdev->dev, "Got return value %x for property %#x\n", ret=
val, prop);

Both should be `%#x'.

> +
> +	switch (retval) {
> +	case LWMI_CHARGE_TYPE_LONGLIFE:
> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
> +		break;
> +	case LWMI_CHARGE_TYPE_STANDARD:
> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +		break;
> +	default:
> +		dev_err(&priv->wdev->dev, "Got invalid charge value: %#x\n", retval);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * lwmi_psy_ext_set_prop() - Set a power_supply_ext property
> + * @ps: The battery that was extended
> + * @ext: The extension
> + * @ext_data: Pointer the lwmi_om_priv drvdata
> + * @prop: The property to write
> + * @val: The value to write
> + *
> + * Writes the given value to the power_supply_ext property
> + *
> + * Return: 0 on success, or an error
> + */
> +static int lwmi_psy_ext_set_prop(struct power_supply *ps,
> +				 const struct power_supply_ext *ext,
> +				 void *ext_data,
> +				 enum power_supply_property prop,
> +				 const union power_supply_propval *val)
> +{
> +	struct lwmi_om_priv *priv =3D ext_data;
> +	struct wmi_method_args_32 args;
> +
> +	args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, LWMI_TY=
PE_ID_PSU_AC);
> +	switch (val->intval) {
> +	case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
> +		args.arg1 =3D LWMI_CHARGE_TYPE_LONGLIFE;
> +		break;
> +	case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
> +		args.arg1 =3D LWMI_CHARGE_TYPE_STANDARD;
> +		break;
> +	default:
> +		dev_err(&priv->wdev->dev, "Got invalid charge value: %#x\n", val->intv=
al);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(&priv->wdev->dev, "Attempting to set %#10x for property %#x to =
%#x\n",
> +		args.arg0, prop, args.arg1);

%#010x

> +
> +	return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> +				     (unsigned char *)&args, sizeof(args), NULL);
> +}
> +
> +/**
> + * lwmi_psy_prop_is_writeable() - Determine if the property is supported
> + * @ps: The battery that was extended
> + * @ext: The extension
> + * @ext_data: Pointer the lwmi_om_priv drvdata
> + * @prop: The property to check
> + *
> + * Checks capdata 00 to determine if the property is supported.
> + *
> + * Return: Support level, or false
> + */
> +static int lwmi_psy_prop_is_writeable(struct power_supply *ps,
> +				      const struct power_supply_ext *ext,
> +				      void *ext_data,
> +				      enum power_supply_property prop)
> +{
> +	struct lwmi_om_priv *priv =3D ext_data;
> +	struct capdata00 capdata;
> +	u32 attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, =
LWMI_TYPE_ID_PSU_AC);
> +	int ret;
> +
> +	ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
> +	if (ret)
> +		return false;
> +
> +	dev_dbg(&priv->wdev->dev, "Battery charge mode (%#10x) support level: %=
#x\n",
> +		attribute_id, capdata.supported);

%#010x

> +
> +	return capdata.supported;

This casts u32 into a *signed* int. I'd suggest:

        return !!(capdata.supported & LWMI_SUPP_SET);

LWMI_SUPP_VALID and LWMI_SUPP_GET should also be checked before
registering the power supply extension. See below.

> +}
> +
> +static const enum power_supply_property lwmi_psy_ext_props[] =3D {
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +static const struct power_supply_ext lwmi_psy_ext =3D {
> +	.name			=3D LWMI_OM_SYSFS_NAME,
> +	.properties		=3D lwmi_psy_ext_props,
> +	.num_properties		=3D ARRAY_SIZE(lwmi_psy_ext_props),
> +	.charge_types		=3D (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
> +	.get_property		=3D lwmi_psy_ext_get_prop,
> +	.set_property		=3D lwmi_psy_ext_set_prop,
> +	.property_is_writeable	=3D lwmi_psy_prop_is_writeable,
> +};
> +
> +/**
> + * lwmi_add_battery() - Connect the power_supply_ext
> + * @battery: The battery to extend
> + * @hook: The driver hook used to extend the battery
> + *
> + * Return: 0 on success, or an error.
> + */
> +static int lwmi_add_battery(struct power_supply *battery, struct acpi_ba=
ttery_hook *hook)
> +{
> +	struct lwmi_om_priv *priv =3D container_of(hook, struct lwmi_om_priv, b=
attery_hook);
> +
> +	return power_supply_register_extension(battery, &lwmi_psy_ext, &priv->w=
dev->dev, priv);
> +}
> +
> +/**
> + * lwmi_remove_battery() - Disconnect the power_supply_ext
> + * @battery: The battery that was extended
> + * @hook: The driver hook used to extend the battery
> + *
> + * Return: 0 on success, or an error.
> + */
> +static int lwmi_remove_battery(struct power_supply *battery, struct acpi=
_battery_hook *hook)
> +{
> +	power_supply_unregister_extension(battery, &lwmi_psy_ext);
> +	return 0;
> +}
> +
> +/**
> + * lwmi_acpi_match() - Attempts to return the ideapad acpi handle
> + * @handle: The ACPI handle that manages battery charging
> + * @lvl: Unused
> + * @context: Void pointer to the acpi_handle object to return
> + * @retval: Unused
> + *
> + * Checks if the ideapad_laptop driver is going to manage charge_type fi=
rst,
> + * then if not, hooks the battery to our WMI methods.
> + *
> + * Return: AE_CTRL_TERMINATE if found, AE_OK if not found.
> + */
> +static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
> +				   void *context, void **retval)
> +{
> +	acpi_handle *ahand =3D context;
> +
> +	if (!handle)
> +		return AE_OK;
> +
> +	*ahand =3D handle;
> +
> +	return AE_CTRL_TERMINATE;
> +}
> +
> +static bool force_load_psy_ext;
> +module_param(force_load_psy_ext, bool, 0444);
> +MODULE_PARM_DESC(force_load_psy_ext,
> +	"This option will skip checking if the ideapad_laptop driver will confl=
ict "
> +	"with adding an extension to set the battery charge type. It is recomme=
nded "
> +	"to blacklist the ideapad driver before using this option.");
> +
> +/**
> + * lwmi_om_ps_ext_init() - Hooks power supply extension to device batter=
y
> + * @priv: Driver private data
> + *
> + * Checks if the ideapad_laptop driver is going to manage charge_type fi=
rst,
> + * then if not, hooks the battery to our WMI methods.
> + */
> +static void lwmi_om_ps_ext_init(struct lwmi_om_priv *priv)

Nitpick: rename it to lwmi_om_psy_ext_init (note the "y") to make naming
consistent.

> +{
> +	static const char * const ideapad_hid =3D "VPC2004";
> +	acpi_handle handle =3D NULL;
> +	int ret;
> +
> +	/* Deconflict ideapad_laptop driver */
> +	if (force_load_psy_ext)
> +		goto load_psy_ext;

Query capdata00 and check against (capdata.supported & LWMI_SUPP_VALID)
&& (capdata.supported & LWMI_SUPP_GET) before continuing. If it's
unsupported or unreadable, no need to register a bogus power supply
extension. force_load_psy_ext should be able to override this too.

> +
> +	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
> +	if (ret)
> +		return;
> +
> +	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle=
, "SBMC")) {
> +		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for d=
evice.\n");

Drop the period at the end of the string.

Thanks,
Rong

> +		return;
> +	}
> +
> +load_psy_ext:
> +	/* Add battery hooks */
> +	priv->battery_hook.add_battery =3D lwmi_add_battery;
> +	priv->battery_hook.remove_battery =3D lwmi_remove_battery;
> +	priv->battery_hook.name =3D "Lenovo WMI Other Battery Extension";
> +
> +	ret =3D devm_battery_hook_register(&priv->wdev->dev, &priv->battery_hoo=
k);
> +	if (ret)
> +		dev_err(&priv->wdev->dev, "Error during battery hook: %i\n", ret);
> +}
> +
>  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capdata=
 01) =3D=3D=3D=3D=3D=3D=3D=3D */
> =20
>  struct tunable_attr_01 {
> @@ -1318,6 +1565,7 @@ static int lwmi_om_master_bind(struct device *dev)
>  		return -ENODEV;
> =20
>  	lwmi_om_fan_info_collect_cd00(priv);
> +	lwmi_om_ps_ext_init(priv);
> =20
>  	return lwmi_om_fw_attr_add(priv);
>  }
