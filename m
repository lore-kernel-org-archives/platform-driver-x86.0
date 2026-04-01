Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4B930E836;
	Wed,  1 Apr 2026 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068679; cv=pass; b=eB5HTVasqlyGiDES4en6otUqSXOD184jLkWyDBL9c2RQgOgkadEaozah3toita/9G/xQZGssNjoXZ3iOLZr6E591VhnoGLOL63CwuuMu8Hw1oa5vpec/rxIj0Zzl8mF5eU57Mc5VY5RIKvF1sgkc6AZaOm5ScbVzZzKWcv6kh8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068679; c=relaxed/simple;
	bh=fKawy/bbcKgu3gDIxAq1jb7QS1KHXA1cGOC+K6d6CAI=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gzTlV8heMVeP3jqBzZrkKQNZ/CetmzVn1HE30rXk4C+UU7IW1akKNksopbvWbud/ujKTBKy1kQYov953ph5F5hrdeRObQb0T/xjfiWvbUa25D2IGz81+rMQ7MHIydOT2Dz54UZbD2m7sHH4C3BjeHAF8++Mc3forYXSF9fsb7uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=B9DrFt4o; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="B9DrFt4o"
ARC-Seal: i=1; a=rsa-sha256; t=1775068667; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FNIds1A6D9nsIufWsNf6MncNR36Tqw4I1anQ/myNmj/pzcP/mYyXOP50xG56Yknw6OCPI2MkK7lK1YlDA35BZzft61ojqnZYoercNzGtn/Q/4XbU6c56Amo9oH2tgbI3l9kEtc4crUHr0bZc86k+ZOKljZHT9erksk8mHWGEaxk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775068667; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rZoG1/dKInLEC52hK2FPge/KrSCCT4HozKnbHvd2KCU=; 
	b=HahGLmoEqe4wPwYovIhBN0QqP7wVjGOLYZIHcucECk3krjUiC4wLQS5LtiKwCtzC895JR6x1g8ztkU60j7B05WkPZeDAshZduNJ5eKJMeqU0iVtwy/VVh9N6t92fRBp/HcvzPf/VEdeMGVF/x9FMq9DZ9jDTiAsC66iczPVTOH8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775068667;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=rZoG1/dKInLEC52hK2FPge/KrSCCT4HozKnbHvd2KCU=;
	b=B9DrFt4oijxFuvazthbhe/BMUuou82uPQ1GQQMZmFqTQjqiNNub7/6P8ubnYD61F
	elefvohTLnaILbibXo3EiEP1lsbhVaneoKx3xS7tEU9OuRH5Cz/H8CeLyj1ir+5BC5u
	7ZhevUDlh7NWVf84yavrZIpzZl1wtRFs0nWYz2q9pi3+YUMUBg0pEmNCK4YBylRQ6Lv
	aOHlUWREyapqFoTNZtFER1INCr3+/SUQQXcwzpJ9S/a245lioK44DD/Fx1Q3cHBXL+O
	CQ4wPXqnsEN29zReJSzSJ6sWV48YAiPcgoiD8h8k/liej11Nb/CW3H6gHCUzqIGa1fq
	H0kGI5PMgw==
Received: by mx.zohomail.com with SMTPS id 1775068665487167.1331418559904;
	Wed, 1 Apr 2026 11:37:45 -0700 (PDT)
Message-ID: <fd411d1b11ed476a5db492dbb47cebcf5a382b4e.camel@rong.moe>
Subject: Re: [PATCH v6 10/13] platform/x86: lenovo-wmi-other: Add WMI
 battery charge limiting
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260331181208.421552-11-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
	 <20260331181208.421552-11-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Apr 2026 02:32:41 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-03-31 at 18:12 +0000, Derek J. Clark wrote:
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
> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v6:
>   - Check feature flags to determine if the extension should be loaded
>     and if it is writable.
>   - Zero initialize wmi_method_args_32.
>   - Fix formatting.
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
>  drivers/platform/x86/lenovo/wmi-other.c   | 274 +++++++++++++++++++++-
>  3 files changed, 275 insertions(+), 1 deletion(-)
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
> index 891b12ca1db6..e0a30f2c0c87 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -21,6 +21,7 @@
>  enum lwmi_device_id {
>  	LWMI_DEVICE_ID_CPU =3D 0x01,
>  	LWMI_DEVICE_ID_GPU =3D 0x02,
> +	LWMI_DEVICE_ID_PSU =3D 0x03,
>  	LWMI_DEVICE_ID_FAN =3D 0x04,
>  };
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 0366acf04ae5..e0633c42972c 100644
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
>  #include "wmi-helpers.h"
> @@ -78,9 +81,11 @@ enum lwmi_feature_id_gpu {
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
> @@ -91,10 +96,17 @@ enum lwmi_feature_id_gpu {
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
> @@ -136,6 +148,8 @@ struct lwmi_om_priv {
>  		bool capdata00_collected : 1;
>  		bool capdata_fan_collected : 1;
>  	} fan_flags;
> +
> +	struct acpi_battery_hook battery_hook;
>  };
> =20
>  /*
> @@ -560,6 +574,263 @@ static void lwmi_om_fan_info_collect_cd_fan(struct =
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
> +	struct wmi_method_args_32 args =3D { 0x0, 0x0 };
> +	struct lwmi_om_priv *priv =3D ext_data;
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
> +	dev_dbg(&priv->wdev->dev, "Got return value %#x for property %#x\n", re=
tval, prop);
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
> +	struct wmi_method_args_32 args =3D { 0x0, 0x0 };
> +	struct lwmi_om_priv *priv =3D ext_data;
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
> +	dev_dbg(&priv->wdev->dev, "Attempting to set %#010x for property %#x to=
 %#x\n",
> +		args.arg0, prop, args.arg1);
> +
> +	return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> +				     (unsigned char *)&args, sizeof(args), NULL);
> +}
> +
> +/**
> + * lwmi_psy_prop_is_supported() - Determine if the property is supported
> + * @priv: Pointer the lwmi_om_priv drvdata
> + *
> + * Checks capdata 00 to determine if the property is supported.
> + *
> + * Return: true if readable, or false
> + */
> +static bool lwmi_psy_prop_is_supported(struct lwmi_om_priv *priv)
> +{
> +	u32 attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, =
LWMI_TYPE_ID_PSU_AC);
> +	struct capdata00 capdata;
> +	int ret;
> +
> +	ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
> +	if (ret)
> +		return false;
> +
> +	dev_dbg(&priv->wdev->dev, "Battery charge mode (%#010x) support level: =
%#x\n",
> +		attribute_id, capdata.supported);
> +
> +	return ((capdata.supported & LWMI_SUPP_VALID) && (capdata.supported & L=
WMI_SUPP_GET));
> +}
> +
> +/**
> + * lwmi_psy_prop_is_writeable() - Determine if the property is writeable
> + * @ps: The battery that was extended
> + * @ext: The extension
> + * @ext_data: Pointer the lwmi_om_priv drvdata
> + * @prop: The property to check
> + *
> + * Checks capdata 00 to determine if the property is writable.
> + *
> + * Return: true if writable, or false
> + */
> +static int lwmi_psy_prop_is_writeable(struct power_supply *ps,
> +				      const struct power_supply_ext *ext,
> +				      void *ext_data,
> +				      enum power_supply_property prop)
> +{
> +	u32 attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, =
LWMI_TYPE_ID_PSU_AC);
> +	struct lwmi_om_priv *priv =3D ext_data;
> +	struct capdata00 capdata;
> +	int ret;
> +
> +	ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
> +	if (ret)
> +		return false;
> +
> +	return !!(capdata.supported & LWMI_SUPP_SET);
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
> + * lwmi_om_psy_ext_init() - Hooks power supply extension to device batte=
ry
> + * @priv: Driver private data
> + *
> + * Checks if the ideapad_laptop driver is going to manage charge_type fi=
rst,
> + * then if not, hooks the battery to our WMI methods.
> + */
> +static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> +{
> +	static const char * const ideapad_hid =3D "VPC2004";
> +	acpi_handle handle =3D NULL;
> +	int ret;
> +
> +	/* Deconflict ideapad_laptop driver */
> +	if (force_load_psy_ext)
> +		goto load_psy_ext;
> +
> +	if (!lwmi_psy_prop_is_supported(priv))
> +		return;
> +
> +	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
> +	if (ret)
> +		return;
> +
> +	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle=
, "SBMC")) {
> +		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for d=
evice\n");
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

Using devm here ties power_supply_ext's lifecycle to the wmi-other
device instead of the aggregate device, resulting in=C2=A0power_supply_ext
being registered multiple times if components are rebound.

Use plain battery_hook_register() here and emit a call to
battery_hook_unregister() in the unbind callback like the hwmon device.
The registration status should also be tracked by adding a flag to
lwmi_om_priv (or NULLifying some contents of priv->battery_hook if the
registration is skipped or if it's unregistered).

Thanks,
Rong

> +	if (ret)
> +		dev_err(&priv->wdev->dev, "Error during battery hook: %i\n", ret);
> +}
> +
>  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capdata=
 01) =3D=3D=3D=3D=3D=3D=3D=3D */
> =20
>  struct tunable_attr_01 {
> @@ -1317,6 +1588,7 @@ static int lwmi_om_master_bind(struct device *dev)
>  		return -ENODEV;
> =20
>  	lwmi_om_fan_info_collect_cd00(priv);
> +	lwmi_om_psy_ext_init(priv);
> =20
>  	return lwmi_om_fw_attr_add(priv);
>  }
