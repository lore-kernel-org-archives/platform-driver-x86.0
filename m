Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899EC3876B3;
	Wed, 13 May 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683766; cv=pass; b=sS6KlmAnphTcHzYIya3hxxsifTHJf87K2X+YBanHY4KqzqSl4e0rJ3V5h9lprQPIlWkX0l8fMOnIhKPKLkz1cLr7G/WrfiptVv/lrdf45GHIEJ00iwYyj6LkpiAwNmuI6t5KTjcdSYFL1xUScZmFFQ8HaWQfOwWOzMEHiqx6Vfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683766; c=relaxed/simple;
	bh=XwQlYeYdrWZhMjEk/485fAG7TB44Y02DXiQOVCrMuMs=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bkH7P7rvCCwcQ2fI4TLfJL546Lx1Ue/3jc+uxrj23YSQEh+Yj+nPl3vQPc63aI6P4UB+M0jdra463f4rmeaU0bolQowgTZtSjg1gj/rUYoZb/3DKyBxc+OrqaB2ThUQnyDofYyoDqQ6n0uq4odUE4BoD/plp9uetWs2dLc+4mxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=qe1cs/Kn; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="qe1cs/Kn"
ARC-Seal: i=1; a=rsa-sha256; t=1778683744; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nTyyrmbXJ/L803j6C1XOxDX+CQXzRzNQWxPjjfPbAWcSwIWlq2xr7sbkMrGU0PM5PTWo3YFQAhTQl1lsgEeW8R/CMh1/FAiFig0dwhf8uQ/TRp72+7ejYyteRDdwOjfKQ9LN1Tn+DtHo9JcdlTcEtDiyAde/TnWYKvMJyQRCmg4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778683744; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V6N1bGxH8uDtl5nUo4vQxIvqhmVxjMnY+r533fN4TyY=; 
	b=bhJ1TeMQtLIHLLHREgdoL0P3HtEZqxwc8af+RKybMXN+xhkFQzLpk95iHMeviLy0lvNdtKkTbPrEeR0W1rhPXsTqxF2qOYtpkjFhQQAxzxUj3xt4rv68CITDXeJrYL42GYtBvCz5p4wMc24xDRajhOUDQhSHqSTu2wVV6R2f2zk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778683744;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=V6N1bGxH8uDtl5nUo4vQxIvqhmVxjMnY+r533fN4TyY=;
	b=qe1cs/Knc+aXvALpAwhRMhf5jf13k7vdhEhJGWOTf8bq34waM+VOZKulU1K7C9Ma
	oOcO3aN0TORq5v6AHW5qmVxNJSE2UCzlzeBJq/OLPhjS6G9KMxtfBmaIMjmsNmdvkZz
	pAGUoGCo0AxtghCjsPdMnpMqoF37U2xHhQIPjp8tCaGVja2rliDeWmb+Bv8Z47dVS5/
	ewoXbatEXHSjYdB364F94lpwu25UNFhgcg1KfHgDGSP2sXwkNsYeLcoJtf5EZanOxxj
	aXFmfxrV10lBjHxdsKDze9ZfdIYke9cg+nqIu3MuABfeSF0XJU+frzYOq7T2oq7YB9L
	zg5z5Jx6Lw==
Received: by mx.zohomail.com with SMTPS id 1778683741513116.74994528323077;
	Wed, 13 May 2026 07:49:01 -0700 (PDT)
Message-ID: <0080f9c6da992508ef523afae9a3559a5d8d16eb.camel@rong.moe>
Subject: Re: [PATCH v13 4/7] platform/x86: lenovo-wmi-other: Add WMI
 battery charge limiting
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 "Pierre-Loup A . Griffais"	 <pgriffais@valvesoftware.com>,
 =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"	 <nfraprado@collabora.com>,
 marshall@shzj.cc, hyacinth@shzj.cc, 	platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260512235808.691046-5-derekjohn.clark@gmail.com>
References: <20260512235808.691046-1-derekjohn.clark@gmail.com>
	 <20260512235808.691046-5-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 22:43:50 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-05-12 at 23:58 +0000, Derek J. Clark wrote:
> Add charge_behaviour and charge_types attributes through a power supply
> extension for devices that support WMI based charge enable & disable.
>=20
> Lenovo Legion devices that implement WMI function and capdata ID
> 0x03010001 in their BIOS are able to enable or disable charging at 80%
> through the lenovo-wmi-other interface. Add a charge_types attribute for
> BATX devices to expose this capability with Standard and Long_Life types
> enabled.
>=20
> Additionally, devices that support WMI function and capdata ID 0x03020000
> are able to force discharge of the battery. Expose this capability with
> a charge_behaviour attribute in the power supply extension, with the auto
> and force-discharge behaviors enabled. The GET method for this attribute
> is bugged. After analyzing the DSDT, and some testing, it appears the
> method grabs bit(3) instead of bit(4) from the EC register that stores th=
e
> current status, and will only report if charging has been inhibited or
> not. To work around this, store and report the last setting written to th=
e
> attribute.
>=20
> As some devices only expose one attribute or the other, a bitmask is
> added with a lookup table and some helper macros to select the correct
> configuration for the hardware at runtime.
>=20
> The ideapad_laptop driver provides the charge_types attribute to provide
> similar functionality. When the WMI method is set this can corrupt the
> ACPI method return and cause hardware and driver errors. To avoid
> conflicts between the drivers, we get the acpi_handle and do the same
> check that ideapad_laptop does when it enables the feature. If the
> feature is supported in ideapad_laptop, abort adding the extension from
> lenovo-wmi-other. The ACPI method is more reliable when both are
> present from my testing, so we can prefer that implementation and do
> not need to worry about de-conflicting from inside that driver.
>=20
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v13:
>   - Switch back to charge_types instead of charge_control_end_threshold.
>   - Add helper function to reduce duplicated code when checking support
>     level for a given attribute.
>   - Remove setting priv->bh_registered to false during psy init.
> v12:
>   - Move force_load_psy_ext into its own patch after this.
>   - Use correct type casting for args in new functions.
>   - Remove extra parenthesis.
> v11:
>   - Refactor to use charge_behaviour and charge_control_end_threshold,
>     per the class documentation. The ideapad_laptop driver will be fixed
>     in a separate patch series.
>   - Due to the extensive refactoring, I have removed the reviewed-by
>     tags from Rong and Mark to allow them to recertify the code in its
>     current state.
> v7:
>   - Use devm_battery_hook_register, manually unregister during unbind.
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
>  drivers/platform/x86/lenovo/wmi-other.c   | 391 ++++++++++++++++++++++
>  3 files changed, 393 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index 09b1b055d2e0..b9a5d18caa1e 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -262,6 +262,7 @@ config LENOVO_WMI_GAMEZONE
>  config LENOVO_WMI_TUNING
>  	tristate "Lenovo Other Mode WMI Driver"
>  	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
>  	select HWMON
>  	select FW_ATTR_CLASS
>  	select LENOVO_WMI_CAPDATA
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index a7cfdeaa58f7..a49229cec245 100644
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
> index beb92c7cff25..a423bd563291 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -41,9 +41,12 @@
>  #include <linux/limits.h>
>  #include <linux/module.h>
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
> @@ -75,9 +78,15 @@ enum lwmi_feature_id_gpu {
>  	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D	0x0b,
>  };
> =20
> +enum lwmi_feature_id_psu {
> +	LWMI_FEATURE_ID_PSU_CHARGE_TYPES =3D	0x01,
> +	LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR =3D	0x02,
> +};
> +
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> =20
>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
> +#define LWMI_TYPE_ID_PSU_AC	0x01
> =20
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> @@ -88,10 +97,19 @@ enum lwmi_feature_id_gpu {
> =20
>  #define LWMI_FAN_DIV 100
> =20
> +#define LWMI_CHARGE_BEHAVIOR_DISCHARGE	0x00
> +#define LWMI_CHARGE_BEHAVIOR_AUTO	0x01
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
> @@ -131,6 +149,11 @@ struct lwmi_om_priv {
>  		bool capdata00_collected : 1;
>  		bool capdata_fan_collected : 1;
>  	} fan_flags;
> +
> +	enum power_supply_charge_behaviour charge_behaviour;
> +	const struct power_supply_ext *battery_ext;
> +	struct acpi_battery_hook battery_hook;
> +	bool bh_registered;
>  };
> =20
>  /*
> @@ -557,6 +580,371 @@ static void lwmi_om_fan_info_collect_cd_fan(struct =
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
> + * @ext_data: Pointer to the lwmi_om_priv drvdata
> + * @prop: The property to read
> + * @val: The value to return
> + *
> + * Reads the given value from the power_supply_ext property
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
> +	struct wmi_method_args_32 args =3D {};
> +	u32 retval;
> +	int ret;
> +
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> +		/* Reading from BIOS reads the wrong bit. Use cached value */
> +		val->intval =3D priv->charge_behaviour;
> +		return 0;
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPES,
> +					     LWMI_TYPE_ID_PSU_AC);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
> +				    (u8 *)&args, sizeof(args),
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
> +		dev_err(&priv->wdev->dev, "Got invalid charge limit value: %#x\n", ret=
val);

Forgot to update the error message?

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
> + * @ext_data: Pointer to the lwmi_om_priv drvdata
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
> +	struct wmi_method_args_32 args =3D {};
> +
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> +		args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR,
> +					     LWMI_TYPE_ID_NONE);
> +		switch (val->intval) {
> +		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> +			args.arg1 =3D LWMI_CHARGE_BEHAVIOR_AUTO;
> +			break;
> +		case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
> +			args.arg1 =3D LWMI_CHARGE_BEHAVIOR_DISCHARGE;
> +			break;
> +		default:
> +			dev_err(&priv->wdev->dev, "Got invalid charge behavior value: %#x\n",
> +				val->intval);
> +			return -EINVAL;
> +		}
> +		priv->charge_behaviour =3D val->intval;
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPES,
> +					     LWMI_TYPE_ID_PSU_AC);
> +		switch (val->intval) {
> +		case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
> +			args.arg1 =3D LWMI_CHARGE_TYPE_LONGLIFE;
> +			break;
> +		case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
> +			args.arg1 =3D LWMI_CHARGE_TYPE_STANDARD;
> +			break;
> +		default:
> +			dev_err(&priv->wdev->dev, "Got invalid charge limit value: %#x\n",
> +				val->intval);

Ditto.

> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(&priv->wdev->dev, "Attempting to set %#010x for property %#x to=
 %#x\n",
> +		args.arg0, prop, args.arg1);
> +
> +	return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> +				     (u8 *)&args, sizeof(args), NULL);
> +}
> +
> +/** lwmi_psy_prop_get_supported() - Gets the support level from capdata =
for a given property
> + * @priv: Pointer to the lwmi_om_priv drvdata
> + * @prop: The power supply property to be evaluated
> + *
> + * Return: capability data support level, or an error
> + */
> +static int lwmi_psy_prop_get_supported(struct lwmi_om_priv *priv, enum p=
ower_supply_property prop)

I'd simply use u32 as the return type and return 0 on error, which
always means "unsupported", otherwise...

> +{
> +	struct capdata00 capdata;
> +	u32 attribute_id;
> +	int ret;
> +
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> +		attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR=
,
> +						LWMI_TYPE_ID_NONE);
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
> +		attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPES,
> +						LWMI_TYPE_ID_PSU_AC);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(&priv->wdev->dev, "Battery charge feature (%#010x) support leve=
l: %#x\n",
> +		attribute_id, capdata.supported);
> +
> +	return capdata.supported;

...this casts u32 to int.

Additionally, I think it's meaningless to propagate errno. It can hardly
be tracked as it's anyway converted to false later. If you'd like to
track errors, an additional dev_dbg() should be enough (any error here
is non-fatal so there's no need to use dev_warn() or so on).

Except for these tiny issues, the patch is in a good shape. With them
fixed:

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> +}
> +
> +/**
> + * lwmi_psy_prop_is_supported() - Determine if the property is supported
> + * @priv: Pointer to the lwmi_om_priv drvdata
> + * @prop: The power supply property to be evaluated
> + *
> + * Checks capdata 00 to determine if the property is supported.
> + *
> + * Return: true if readable, or false
> + */
> +static bool lwmi_psy_prop_is_supported(struct lwmi_om_priv *priv, enum p=
ower_supply_property prop)
> +{
> +	int ret;
> +
> +	ret =3D lwmi_psy_prop_get_supported(priv, prop);
> +	if (ret < 0)
> +		return false;
> +
> +	return (ret & LWMI_SUPP_VALID) && (ret & LWMI_SUPP_GET);
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
> +	struct lwmi_om_priv *priv =3D ext_data;
> +	int ret;
> +
> +	ret =3D lwmi_psy_prop_get_supported(priv, prop);
> +	if (ret < 0)
> +		return false;
> +
> +	return !!(ret & LWMI_SUPP_SET);
> +}
> +
> +#define DEFINE_LWMI_POWER_SUPPLY_EXTENSION(_name, _props, _behaviours, _=
types)	\
> +	static const struct power_supply_ext _name =3D {				\
> +		.name			=3D LWMI_OM_SYSFS_NAME,			\
> +		.properties		=3D _props,				\
> +		.num_properties		=3D ARRAY_SIZE(_props),			\
> +		.charge_behaviours	=3D _behaviours,				\
> +		.charge_types		=3D _types,				\
> +		.get_property		=3D lwmi_psy_ext_get_prop,		\
> +		.set_property		=3D lwmi_psy_ext_set_prop,		\
> +		.property_is_writeable	=3D lwmi_psy_prop_is_writeable,		\
> +	}
> +
> +static const enum power_supply_property lwmi_psy_ext_props_all[] =3D {
> +	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +static const enum power_supply_property lwmi_psy_ext_props_types[] =3D {
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +static const enum power_supply_property lwmi_psy_ext_props_behaviour[] =
=3D {
> +	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> +};
> +
> +#define LWMI_CHARGE_BEHAVIOURS (BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) =
| \
> +				BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE))
> +
> +#define LWMI_CHARGE_TYPES (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) | \
> +			   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
> +
> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_all, lwmi_psy_ext_props_=
all,
> +				   LWMI_CHARGE_BEHAVIOURS, LWMI_CHARGE_TYPES);
> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_types, lwmi_psy_ext_prop=
s_types,
> +				   0, LWMI_CHARGE_TYPES);
> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_behaviour, lwmi_psy_ext_=
props_behaviour,
> +				   LWMI_CHARGE_BEHAVIOURS, 0);
> +
> +#define LWMI_PSY_PROP_BEHAVIOUR BIT(0)
> +#define LWMI_PSY_PROP_TYPES BIT(1)
> +
> +static const struct power_supply_ext *lwmi_psy_exts[] =3D {
> +	[LWMI_PSY_PROP_BEHAVIOUR] =3D				&lwmi_psy_ext_behaviour,
> +	[LWMI_PSY_PROP_TYPES] =3D					&lwmi_psy_ext_types,
> +	[LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_TYPES] =3D	&lwmi_psy_ext_all,
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
> +	return power_supply_register_extension(battery, priv->battery_ext, &pri=
v->wdev->dev, priv);
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
> +	struct lwmi_om_priv *priv =3D container_of(hook, struct lwmi_om_priv, b=
attery_hook);
> +
> +	power_supply_unregister_extension(battery, priv->battery_ext);
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
> +/**
> + * lwmi_om_psy_ext_init() - Hooks power supply extension to device batte=
ry
> + * @priv: Pointer to the lwmi_om_priv drvdata.
> + *
> + * Checks if the ideapad_laptop driver is going to manage charge attribu=
tes first,
> + * then if not, hooks the battery to our WMI methods if they are support=
ed.
> + */
> +static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> +{
> +	static const char * const ideapad_hid =3D "VPC2004";
> +	acpi_handle handle =3D NULL;
> +	unsigned int props =3D 0;
> +	int ret;
> +
> +	if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR=
))
> +		props |=3D LWMI_PSY_PROP_BEHAVIOUR;
> +	if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_TYPES))
> +		props |=3D LWMI_PSY_PROP_TYPES;
> +	if (!props)
> +		return;
> +
> +	/* Deconflict ideapad_laptop driver */
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
> +	/* Add battery hooks */
> +	priv->battery_ext =3D lwmi_psy_exts[props];
> +	priv->battery_hook.add_battery =3D lwmi_add_battery;
> +	priv->battery_hook.remove_battery =3D lwmi_remove_battery;
> +	priv->battery_hook.name =3D "Lenovo WMI Other Battery Extension";
> +	priv->bh_registered =3D true;
> +
> +	battery_hook_register(&priv->battery_hook);
> +}
> +
> +/**
> + * lwmi_om_psy_remove() - Unregister battery hook
> + * @priv: Driver private data
> + *
> + * Unregisters the battery hook if applicable.
> + */
> +static void lwmi_om_psy_remove(struct lwmi_om_priv *priv)
> +{
> +	if (!priv->bh_registered)
> +		return;
> +
> +	battery_hook_unregister(&priv->battery_hook);
> +	priv->bh_registered =3D false;
> +}
> +
>  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capdata=
 01) =3D=3D=3D=3D=3D=3D=3D=3D */
> =20
>  struct tunable_attr_01 {
> @@ -1243,6 +1631,7 @@ static int lwmi_om_master_bind(struct device *dev)
>  	}
> =20
>  	lwmi_om_fan_info_collect_cd00(priv);
> +	lwmi_om_psy_ext_init(priv);
> =20
>  	lwmi_om_fw_attr_add(priv);
> =20
> @@ -1265,6 +1654,8 @@ static void lwmi_om_master_unbind(struct device *de=
v)
> =20
>  	lwmi_om_hwmon_remove(priv);
> =20
> +	lwmi_om_psy_remove(priv);
> +
>  	component_unbind_all(dev, NULL);
>  }
> =20
