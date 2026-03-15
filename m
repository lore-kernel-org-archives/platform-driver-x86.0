Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69BB625
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 04:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773548562; cv=pass; b=lRsS+yk12OL9g0BxGEx5sV/AwR5qRjjkA5jPZDoX05xcikbEvBX/UtItZ6n6zJoxYsVYz2CIVDHAa2eKuuwuit1mY/Q0XlgbBfpxNX0cKvz1p9Jt+CgRhCkcjE9x/Qrr1Z56paLmPHf74daDXzEEQFRmRvQ2ieRSLRWiwduM5+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773548562; c=relaxed/simple;
	bh=Ph8s4TsKuwIA/rqSetwX+NV867CrXvCXDW5+NLcCHis=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=e8A06vwQ1DoIgI4MFp3RShx+iJhA4YYFU75da8F5eFcfkEIZQrv9HVB85GTahyrBst1uk0K5v0mSI7M+qDESMI8T1Hucj3ACc13TLQPb7GjS4hCJ6dnSrITZjpLhs5KAsz+MfCjVL0tDLS7n9/RPuLMr+yxbAMiI57NT0nfm2XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=UW3+1Zx6; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="UW3+1Zx6"
ARC-Seal: i=1; a=rsa-sha256; t=1773540329; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WWx9whZuFOz8ILDBhkagqPLe5tgF2ySl5iwiLSkElFUejRSsz24lGb2AIitOo6wt7y339OoR3+G8dEZfln+WWygP0QtIh/RSW3IA1ZLHkhXBL9meKfKu+WabsktZBkWqjNDtbnaC2kMHTuXAnbXFjmQ3RE7PVxboKGjc9ThdYI0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773540329; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gS49IFIoxI324oYhe6CasihM1DhwQU9a6mKEUKX0lDE=; 
	b=hchAXLxYrVt62s0b1bpWY+L180AMRdT3wxJb7DTldnV2AxxAu1JiHQxf80JVZ+NOnFLRx4M+goxHPM4G/WqFcVbRe99oodND2HfhTDDAidDEBk4Rf7EcFhWfzBL6riDqdfVhUBLuIY06hOcPnLt6mtN2WHdjOASN5k8RXEt7edo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773540329;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=gS49IFIoxI324oYhe6CasihM1DhwQU9a6mKEUKX0lDE=;
	b=UW3+1Zx6Ag42IcZt/H2dn5AupVOuTznsIrnbRsJFiM46OVOZBC3yWgqmlH7uPTEl
	YX+X92aBBHicMBf/Uk6WMpjsvU9UeU1f/RjacuuMSw077MJohRnXJXVh2LLDkT2qsgC
	gEbqPtQXQvR1FkyIPWpJpVBpWGhlrf+RlXyTGTADESl/n9+0GasnNrCHHAkJAGmoMFX
	54bCjhh32ztF5t4eXWdh8bBbY38Q4rEjLUrSyrLbJJj8R9qzYgqRXLdtmvWHosnSRAd
	8Hp9tnyzA4d8xotybeEqp6C0Cf2G0PsN9U7/mMfYoePk+qz1bLlLAsxnEkZTryS370Y
	hXwoUrGNxQ==
Received: by mx.zohomail.com with SMTPS id 1773540327849283.64391951749394;
	Sat, 14 Mar 2026 19:05:27 -0700 (PDT)
Message-ID: <df37fc895fab7702bcf0cfd0db6c65eb6cb3b2e3.camel@rong.moe>
Subject: Re: [PATCH v4 8/8] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260312031032.3467565-9-derekjohn.clark@gmail.com>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
	 <20260312031032.3467565-9-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Mar 2026 10:00:20 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Thu, 2026-03-12 at 03:10 +0000, Derek J. Clark wrote:
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
> v4:
>   - Remove unused defines.
>   - Disambiguate charging defines by renaming them to be more consistent
>     with the kernel modes they represent.
>   - Add module parameter to ignore ACPI checks.
>   - Don't fail if the ACPI handle isn't found, skip the ACPI check
>     instead.
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
>  drivers/platform/x86/lenovo/wmi-other.c   | 234 +++++++++++++++++++++-
>  2 files changed, 234 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index 196481b1ce17..cc0d1c176c2f 100644
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
> index 61ac9bee352f..cab9ae6bd811 100644
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
> @@ -79,10 +82,12 @@ enum lwmi_feature_id_gpu {
>  	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D	0x0b,
>  };
> =20
> -#define LWMI_FEATURE_ID_FAN_RPM 0x03
> +#define LWMI_FEATURE_ID_FAN_RPM		0x03
> +#define LWMI_FEATURE_ID_PSU_CHARGE_TYPE	0x01
> =20
>  #define LWMI_TYPE_ID_NONE	0x00
>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
> +#define LWMI_TYPE_ID_PSU_AC	0x01
> =20
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> @@ -93,6 +98,9 @@ enum lwmi_feature_id_gpu {
> =20
>  #define LWMI_FAN_DIV 100
> =20
> +#define LWMI_CHARGE_TYPE_STANDARD	0x00
> +#define LWMI_CHARGE_TYPE_LONGLIFE	0x01
> +
>  /**
>   * lwmi_attr_id() - Formats a capability data attribute ID
>   * @dev_id: The u8 corresponding to the device ID.
> @@ -114,6 +122,10 @@ static u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mo=
de_id, u8 type_id)
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
> @@ -155,6 +167,8 @@ struct lwmi_om_priv {
>  		bool capdata00_collected : 1;
>  		bool capdata_fan_collected : 1;
>  	} fan_flags;
> +
> +	struct acpi_battery_hook battery_hook;
>  };
> =20
>  /*
> @@ -579,6 +593,223 @@ static void lwmi_om_fan_info_collect_cd_fan(struct =
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
> +	dev_dbg(&priv->wdev->dev, "Got return value %x for property %x\n", retv=
al, prop);

%#x

> +
> +	if (retval =3D=3D LWMI_CHARGE_TYPE_LONGLIFE)
> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
> +	else
> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;

I'd suggest using a switch statement here with a default path to
dev_err() unexpected retval.

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
> +	if (val->intval =3D=3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)
> +		args.arg1 =3D LWMI_CHARGE_TYPE_LONGLIFE;
> +	else
> +		args.arg1 =3D LWMI_CHARGE_TYPE_STANDARD;

Ditto.

> +
> +	dev_dbg(&priv->wdev->dev, "Attempting to set %#08x for property %x to %=
x\n",

%#010x and %#x

> +		args.arg0, prop, args.arg1);
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
> +	dev_dbg(&priv->wdev->dev, "Battery charge mode (%#08x) support level: %=
x\n",

Ditto.

> +		attribute_id, capdata.supported);
> +
> +	return capdata.supported;
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

Update Kconfig with `depends on ACPI_BATTERY' like other drivers did.

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
> +{
> +	static const char * const ideapad_hid =3D "VPC2004";
> +	acpi_handle handle =3D NULL;
> +	int ret;
> +
> +	/* Deconflict ideapad_laptop driver */
> +	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);

Skip it in the force_load_psy_ext=3DY case.=20

> +	if (ret)
> +		return;
> +
> +	if (handle && !force_load_psy_ext) {
> +		if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")=
) {

Connect them with `&&' to prevent unnecessary indents and...

> +			dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for =
device.\n");

...line length exceeding 100.

Thanks,
Rong

> +			return;
> +		}
> +	}
> +
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
> @@ -1334,6 +1565,7 @@ static int lwmi_om_master_bind(struct device *dev)
>  		return -ENODEV;
> =20
>  	lwmi_om_fan_info_collect_cd00(priv);
> +	lwmi_om_ps_ext_init(priv);
> =20
>  	return lwmi_om_fw_attr_add(priv);
>  }
