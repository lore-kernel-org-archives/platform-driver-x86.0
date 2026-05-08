Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B6F3EDAA7;
	Fri,  8 May 2026 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251976; cv=none; b=EaR7hqmJo6jDdyW/dwFnYXbWG0GIlFiTy7QeGpTllb8S2PSPGrF2qYxxvTH0ZsW9UECWgrgF/N77YdZKeP4Q1QyJgYHPwlnroSSB8706mOagBVGiU7NViV2QhgPJn1q/n+o4BqX9jdUK/Pzk4VLnt23R6bwKBCf4pAWTmqMUYBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251976; c=relaxed/simple;
	bh=V1GKi/tS2mpVwMD1B9zKN7d/8vJ61EoIb13XZ+VYUJc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CdqsAuexjPo8NsT9swiSdThRe+LHEtfdp5x2RMtfi2uJlsMGjlsOEP/OFuUSTfW4Y7uKWMmhLYbQ3IZew89CeRGx/XTEHAwjGSoc4DndUUAyxp4gX2WkI74vzI+IMvQ1PVyFYsSVQBQIoonyTJZJvSE7wc6Ef4y3rhPKNqPxrn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvUEOya6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvUEOya6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778251974; x=1809787974;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=V1GKi/tS2mpVwMD1B9zKN7d/8vJ61EoIb13XZ+VYUJc=;
  b=PvUEOya6LOln7b2wRqq2PMATZ0uarF4y2ROyp1JVGSCZxi/pjWuK28+d
   RHsl7iVOT6Aw6D3t2Lklt+m76UjCfanTT919Mur6+vd/Qf3Wmmn7PfsLn
   iqJ5gWXUila8KjL4TbjNey6h4iaCuE4rVL8XmYTGWO6MsA0320DVaimyP
   P+9mnIIr0NndB9iPSUP1kol9j7KuQZCEFBWzEHoSwzoZWnZLXNDg/8MMA
   RsTVORHXOm0N3bEPrMz4hd3jtsOn7j+1TMf+3kJJWqJIp8DPtiyjjXebX
   DuI0OgYAKRvQm/JFqTrtM+G15ZdQR1FN+akUqJK1t3C+FSn23M8rxvfuv
   g==;
X-CSE-ConnectionGUID: mNT3tn84ScaAJ98ZHKGGPw==
X-CSE-MsgGUID: P+fRu4+pRVK/Xcu+u4yTlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="82842449"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="82842449"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 07:52:53 -0700
X-CSE-ConnectionGUID: 6DS7sYoTQ0CpCyZNEq/rLA==
X-CSE-MsgGUID: TiW/6XNqQM2IHqeFp6R5jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="230388395"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 07:52:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 8 May 2026 17:52:45 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    =?ISO-8859-15?Q?N=EDcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
    marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 13/15] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
In-Reply-To: <20260507180507.912966-14-derekjohn.clark@gmail.com>
Message-ID: <9b51fdc2-5429-9fb8-830b-6e20fd27e3b2@linux.intel.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com> <20260507180507.912966-14-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 May 2026, Derek J. Clark wrote:

> Add charge_behaviour and charge_control_end_threshold attributes through
> a power supply extension for devices that support WMI based charge enable
> & disable.
> 
> Lenovo Legion devices that implement WMI function and capdata ID
> 0x03010001 in their BIOS are able to enable or disable charging at 80%
> through the lenovo-wmi-other interface. Add a charge_control_end_threshold
> attribute for BATX devices to expose this capability. The GET method for
> this attribute is bugged. After analyzing the DSDT and some testing it
> appears the method grabs bit(3) instead of bit(4) from the EC register
> that stores the current status, and will only report if charging has
> been inhibited or not. To work around this, store and report the last
> setting written to the attribute.
> 
> Additionally, devices that support WMI function and capdata ID 0x03020000
> are able to force discharge of the battery. Expose this capability with
> a charge_behaviour attribute in the power supply extension, with the
> AUTO and FORCE_DISCHARGE behaviors enabled.
> 
> As some devices only expose one attribute or the other, a bitmask is
> added with a lookup table and some helper macros to select the correct
> configuration for the hardware at runtime.
> 
> The ideapad_laptop driver provides the charge_type attribute to provide
> similar functionality. When the WMI method is set this can corrupt the
> ACPI method return and cause hardware and driver errors. To avoid
> conflicts between the drivers, we get the acpi_handle and do the same
> check that ideapad_laptop does when it enables the feature. If the
> feature is supported in ideapad_laptop, abort adding the extension from
> lenovo-wmi-other. The ACPI method is more reliable when both are
> present, from my testing, so we can prefer that implementation and do
> not need to worry about de-conflicting from inside that driver. A new
> module parameter, force_load_psy_ext, is provided to bypass this ACPI
> check, as well as feature supported checks, if desired.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
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
>  drivers/platform/x86/lenovo/wmi-other.c   | 401 ++++++++++++++++++++++
>  3 files changed, 403 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
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
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
> index 891b12ca1db6..e0a30f2c0c87 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -21,6 +21,7 @@
>  enum lwmi_device_id {
>  	LWMI_DEVICE_ID_CPU = 0x01,
>  	LWMI_DEVICE_ID_GPU = 0x02,
> +	LWMI_DEVICE_ID_PSU = 0x03,
>  	LWMI_DEVICE_ID_FAN = 0x04,
>  };
>  
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index fb301c54d26d..4939a71e8fca 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -41,9 +41,12 @@
>  #include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/platform_profile.h>
> +#include <linux/power_supply.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
>  
> +#include <acpi/battery.h>
> +
>  #include "wmi-capdata.h"
>  #include "wmi-events.h"
>  #include "wmi-helpers.h"
> @@ -75,9 +78,15 @@ enum lwmi_feature_id_gpu {
>  	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =	0x0b,
>  };
>  
> +enum lwmi_feature_id_psu {
> +	LWMI_FEATURE_ID_PSU_CHARGE_END_THRESHOLD =	0x01,
> +	LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOR =		0x02,
> +};
> +
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>  
>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
> +#define LWMI_TYPE_ID_PSU_AC	0x01
>  
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> @@ -88,10 +97,19 @@ enum lwmi_feature_id_gpu {
>  
>  #define LWMI_FAN_DIV 100
>  
> +#define LWMI_CHARGE_BEHAVIOR_DISCHARGE	0x00
> +#define LWMI_CHARGE_BEHAVIOR_AUTO	0x01
> +#define LWMI_CHARGE_END_100		0x00
> +#define LWMI_CHARGE_END_80		0x01
> +
>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>  	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
>  
> +#define LWMI_ATTR_ID_PSU(feat, type)			\
> +	lwmi_attr_id(LWMI_DEVICE_ID_PSU, feat,		\
> +		     LWMI_GZ_THERMAL_MODE_NONE, type)
> +
>  #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
>  
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
>  
>  /*
> @@ -555,6 +578,381 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
>  	lwmi_om_hwmon_add(priv);
>  }
>  
> +/* ======== Power Supply Extension (component: lenovo-wmi-capdata 00) ======== */
> +
> +/**
> + * lwmi_psy_ext_get_prop() - Get a power_supply_ext property
> + * @ps: The battery that was extended
> + * @ext: The extension
> + * @ext_data: Pointer to the lwmi_om_priv drvdata
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
> +	struct lwmi_om_priv *priv = ext_data;
> +	struct wmi_method_args_32 args = {};
> +	u32 retval;
> +	int ret;
> +
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> +		/* Reading from BIOS reads the wrong bit. Use cached value */
> +		val->intval = priv->charge_behaviour;
> +		return 0;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_END_THRESHOLD,
> +					     LWMI_TYPE_ID_PSU_AC);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
> +				    (unsigned char *)&args, sizeof(args),
> +				    &retval);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(&priv->wdev->dev, "Got return value %#x for property %#x\n", retval, prop);
> +
> +	switch (retval) {
> +	case LWMI_CHARGE_END_80:
> +		val->intval = 80;
> +		break;
> +	case LWMI_CHARGE_END_100:
> +		val->intval = 100;
> +		break;
> +	default:
> +		dev_err(&priv->wdev->dev, "Got invalid charge limit value: %#x\n", retval);
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
> +	struct lwmi_om_priv *priv = ext_data;
> +	struct wmi_method_args_32 args = {};
> +
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> +		args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOR,
> +					     LWMI_TYPE_ID_NONE);
> +		switch (val->intval) {
> +		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> +			args.arg1 = LWMI_CHARGE_BEHAVIOR_AUTO;
> +			break;
> +		case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
> +			args.arg1 = LWMI_CHARGE_BEHAVIOR_DISCHARGE;
> +			break;
> +		default:
> +			dev_err(&priv->wdev->dev, "Got invalid charge behavior value: %#x\n",
> +				val->intval);
> +			return -EINVAL;
> +		}
> +		priv->charge_behaviour = val->intval;
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_END_THRESHOLD,
> +					     LWMI_TYPE_ID_PSU_AC);
> +		switch (val->intval) {
> +		case 0 ... 80:
> +			args.arg1 = LWMI_CHARGE_END_80;
> +			break;
> +		case 81 ... 100:
> +			args.arg1 = LWMI_CHARGE_END_100;
> +			break;
> +		default:
> +			dev_err(&priv->wdev->dev, "Got invalid charge limit value: %#x\n",
> +				val->intval);
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	dev_dbg(&priv->wdev->dev, "Attempting to set %#010x for property %#x to %#x\n",
> +		args.arg0, prop, args.arg1);
> +
> +	return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> +				     (unsigned char *)&args, sizeof(args), NULL);

unsigned char * is for real "text", u8 * is the correct type for anything 
that is binary data.

I've apparently missed it earlier and you don't necessarily need to fix 
this in the context of this series (I'd prefer to finally be able to move 
on from this series) but the distinction between two types is good to keep 
in mind.

> +}
> +
> +/**
> + * lwmi_psy_prop_is_suppported() - Determine if the property is supported
> + * @priv: Pointer to the lwmi_om_priv drvdata
> + * @prop: The power supply property to be evaluated
> + *
> + * Checks capdata 00 to determine if the property is supported.
> + *
> + * Return: true if readable, or false
> + */
> +static bool lwmi_psy_prop_is_supported(struct lwmi_om_priv *priv, enum power_supply_property prop)
> +{
> +	struct capdata00 capdata;
> +	u32 attribute_id;
> +	int ret;
> +
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> +		attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOR,
> +						LWMI_TYPE_ID_NONE);
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_END_THRESHOLD,
> +						LWMI_TYPE_ID_PSU_AC);
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	ret = lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
> +	if (ret)
> +		return false;
> +
> +	dev_dbg(&priv->wdev->dev, "Battery charge feature (%#010x) support level: %#x\n",
> +		attribute_id, capdata.supported);
> +
> +	return ((capdata.supported & LWMI_SUPP_VALID) && (capdata.supported & LWMI_SUPP_GET));

The outer parenthesis seem unnecessary.

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
> +	struct lwmi_om_priv *priv = ext_data;
> +	struct capdata00 capdata;
> +	u32 attribute_id;
> +	int ret;
> +
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> +		attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOR,
> +						LWMI_TYPE_ID_NONE);
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_END_THRESHOLD,
> +						LWMI_TYPE_ID_PSU_AC);
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	ret = lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
> +	if (ret)
> +		return false;
> +
> +	return !!(capdata.supported & LWMI_SUPP_SET);
> +}
> +
> +static const enum power_supply_property lwmi_psy_ext_props_all[] = {
> +	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const enum power_supply_property lwmi_psy_ext_props_threshold[] = {
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const enum power_supply_property lwmi_psy_ext_props_behaviour[] = {
> +	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> +};
> +
> +#define DEFINE_LWMI_POWER_SUPPLY_EXTENSION(_name, _props, _behaviours)	\
> +	static const struct power_supply_ext _name = {			\
> +		.name			= LWMI_OM_SYSFS_NAME,		\
> +		.properties		= _props,			\
> +		.num_properties		= ARRAY_SIZE(_props),		\
> +		.charge_behaviours	= _behaviours,			\
> +		.get_property		= lwmi_psy_ext_get_prop,	\
> +		.set_property		= lwmi_psy_ext_set_prop,	\
> +		.property_is_writeable	= lwmi_psy_prop_is_writeable,	\
> +	}
> +
> +#define LWMI_CHARGE_BEHAVIOURS (BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) | \
> +				BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE))
> +
> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_all, lwmi_psy_ext_props_all,
> +				   LWMI_CHARGE_BEHAVIOURS);
> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_threshold,
> +				   lwmi_psy_ext_props_threshold, 0);
> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_behaviour,
> +				   lwmi_psy_ext_props_behaviour,
> +				   LWMI_CHARGE_BEHAVIOURS);
> +
> +#define LWMI_PSY_PROP_BEHAVIOUR BIT(0)
> +#define LWMI_PSY_PROP_THRESHOLD BIT(1)
> +
> +static const struct power_supply_ext *lwmi_psy_exts[] = {
> +	[LWMI_PSY_PROP_BEHAVIOUR] =				&lwmi_psy_ext_behaviour,
> +	[LWMI_PSY_PROP_THRESHOLD] =				&lwmi_psy_ext_threshold,
> +	[LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_THRESHOLD] =	&lwmi_psy_ext_all,
> +};
> +
> +/**
> + * lwmi_add_battery() - Connect the power_supply_ext
> + * @battery: The battery to extend
> + * @hook: The driver hook used to extend the battery
> + *
> + * Return: 0 on success, or an error.
> + */
> +static int lwmi_add_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct lwmi_om_priv *priv = container_of(hook, struct lwmi_om_priv, battery_hook);
> +
> +	return power_supply_register_extension(battery, priv->battery_ext, &priv->wdev->dev, priv);
> +}
> +
> +/**
> + * lwmi_remove_battery() - Disconnect the power_supply_ext
> + * @battery: The battery that was extended
> + * @hook: The driver hook used to extend the battery
> + *
> + * Return: 0 on success, or an error.
> + */
> +static int lwmi_remove_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct lwmi_om_priv *priv = container_of(hook, struct lwmi_om_priv, battery_hook);
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
> + * Checks if the ideapad_laptop driver is going to manage charge_type first,
> + * then if not, hooks the battery to our WMI methods.
> + *
> + * Return: AE_CTRL_TERMINATE if found, AE_OK if not found.
> + */
> +static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
> +				   void *context, void **retval)
> +{
> +	acpi_handle *ahand = context;
> +
> +	if (!handle)
> +		return AE_OK;
> +
> +	*ahand = handle;
> +
> +	return AE_CTRL_TERMINATE;
> +}
> +
> +static bool force_load_psy_ext;
> +module_param(force_load_psy_ext, bool, 0444);
> +MODULE_PARM_DESC(force_load_psy_ext,
> +	"This option will skip checking if the ideapad_laptop driver will conflict "
> +	"with adding an extension to set the battery charge type. It is recommended "
> +	"to blacklist the ideapad driver before using this option.");

What is the usecase for this parameter from ordinary user's perspective?

Usually module params are near the top of file (it seems that only a very 
few drivers have one midfile, some had it near the end).

--
 i.

> +
> +/**
> + * lwmi_om_psy_ext_init() - Hooks power supply extension to device battery
> + * @priv: Pointer to the lwmi_om_priv drvdata.
> + *
> + * Checks if the ideapad_laptop driver is going to manage charge attributes first,
> + * then if not, hooks the battery to our WMI methods if they are supported.
> + */
> +static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> +{
> +	static const char * const ideapad_hid = "VPC2004";
> +	acpi_handle handle = NULL;
> +	unsigned int props = 0;
> +	int ret;
> +
> +	priv->bh_registered = false;
> +
> +	/* Deconflict ideapad_laptop driver */
> +	if (force_load_psy_ext) {
> +		props = LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_THRESHOLD;
> +		goto load_psy_ext;
> +	}
> +
> +	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
> +	if (ret)
> +		return;
> +
> +	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
> +		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device\n");
> +		return;
> +	}
> +
> +	if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR))
> +		props |= LWMI_PSY_PROP_BEHAVIOUR;
> +	if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD))
> +		props |= LWMI_PSY_PROP_THRESHOLD;
> +	if (!props)
> +		return;
> +
> +load_psy_ext:
> +	/* Add battery hooks */
> +	priv->battery_ext = lwmi_psy_exts[props];
> +	priv->battery_hook.add_battery = lwmi_add_battery;
> +	priv->battery_hook.remove_battery = lwmi_remove_battery;
> +	priv->battery_hook.name = "Lenovo WMI Other Battery Extension";
> +	priv->bh_registered = true;
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
> +	priv->bh_registered = false;
> +}
> +
>  /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
>  
>  struct tunable_attr_01 {
> @@ -1235,6 +1633,7 @@ static int lwmi_om_master_bind(struct device *dev)
>  	}
>  
>  	lwmi_om_fan_info_collect_cd00(priv);
> +	lwmi_om_psy_ext_init(priv);
>  
>  	lwmi_om_fw_attr_add(priv);
>  
> @@ -1257,6 +1656,8 @@ static void lwmi_om_master_unbind(struct device *dev)
>  
>  	lwmi_om_hwmon_remove(priv);
>  
> +	lwmi_om_psy_remove(priv);
> +
>  	component_unbind_all(dev, NULL);
>  }
>  
> 
