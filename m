Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E37E39FCE;
	Tue, 24 Feb 2026 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923915; cv=none; b=QigiewGGmr9uvBHd+FdlODA8kcZlhKpX8PZ6w+VUFKudqBfIXkRUL6b5PxwxwlZG+IFkdu1wkwnUzBDL8Fm+dpAlOWmgIPDXHOg7icZo9lnmLbd/J65bYM+Q8VU3vaYzLxRT37miVVQQIv2cn/VTJMlezL3KU467XZyMEv6Rtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923915; c=relaxed/simple;
	bh=iaHpev5o0MRus0qoi17n6V3EJi69uVuiG1O/+bywHqA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nhyUEuX254oBFhoFCE83YWHrPg9LlDH1hN/2hRUdWFPG8I83SKqrsIkmL1ds9Kyq0HgqCpBQF18edjNsrGkAZYEwK9C1RykieKLKCyJwNVmS5pJlbGjH99bhRaPqKVWYV/mkcyrajP3eA51WHmnoWyhsUSHJ6wB1co9k8oM8Gtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhXr3k0r; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhXr3k0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771923914; x=1803459914;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iaHpev5o0MRus0qoi17n6V3EJi69uVuiG1O/+bywHqA=;
  b=AhXr3k0rf78heaNMykcQtkW8F0FOWBpRNApChq7HZNzSdWA1YGS51Yr6
   RanAT+YT/FP8MFZJ+m1Dp85nFXo7OAoYzFwsGfH9gJW1Lro+nByCe37ZV
   MKzarPygoW2eHP85GsjL4zP1wt+wnTCke4PstWOfPyto9blwhA+t72Kv3
   KS3zlEtqA3dKTDsCRjY9KWSLAnMXJUPpBRZgoNZdgAaK/NoyRO/QOiZwM
   wwBWyjOzVcbtOK1c8O2mqowv/rfU/B09cV3IwrmEeGfKwQGEW0uI0VIrE
   a77/gWfIPrfMw6po46yFQem63FNZrAKGX9RTrxIrVGk4/EYzCsDdyZ4Kd
   A==;
X-CSE-ConnectionGUID: LNxeuLAfSnGuRbSE9Lz1BQ==
X-CSE-MsgGUID: DxpUkqM0TKeLaASo7h3y9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72843871"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72843871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:05:13 -0800
X-CSE-ConnectionGUID: ZwdQJdlNQ0y2rHydctB7aw==
X-CSE-MsgGUID: RYSxi196RTuXE9Ykrs1GKw==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.133])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:05:10 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Feb 2026 11:05:06 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting.
In-Reply-To: <20260224043200.2680384-7-derekjohn.clark@gmail.com>
Message-ID: <8376b311-a436-7cc6-b8eb-ffb15bc3349a@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-7-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Feb 2026, Derek J. Clark wrote:

> Add charge-type power supply extension for devices that support WMI based
> charge enable/disable. Lenovo Legion devices that implement function ID
> and capdata 00 ID 0x03010001 are able to enable or disable charging
> through the lenovo-wmi-other interface. The ideapad_laptop driver
> conflicts with this if it can also provide the attribute, so we have to
> get the acpi_handle and check for the same ACPI methods that enable the
> feature in that driver. The ACPI method is more reliable from my testing
> when both are present, so there is no need to modify the ideapad_laptop
> driver instead.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
>  drivers/platform/x86/lenovo/wmi-other.c   | 230 ++++++++++++++++++++++
>  2 files changed, 231 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
> index b7f9ee7b301a..00471551e7d6 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -26,6 +26,7 @@
>  enum lwmi_device_id {
>  	LWMI_DEVICE_ID_CPU = 0x01,
>  	LWMI_DEVICE_ID_GPU = 0x02,
> +	LWMI_DEVICE_ID_PSU = 0x03,
>  	LWMI_DEVICE_ID_FAN = 0x04,
>  };
>  
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index 7f0d5a17b44f..b2daff1b45c2 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -42,9 +42,12 @@
>  #include <linux/module.h>
>  #include <linux/notifier.h>
>  #include <linux/platform_profile.h>
> +#include <linux/power_supply.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
>  
> +#include <acpi/battery.h>
> +
>  #include "wmi-capdata.h"
>  #include "wmi-events.h"
>  #include "wmi-gamezone.h"
> @@ -78,10 +81,17 @@ enum lwmi_feature_id_gpu {
>  	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST = 0x0b,
>  };
>  
> +enum lwmi_feature_id_psu {
> +	LWMI_FEATURE_ID_PSU_INSTANT_MODE = 0x01,
> +	LWMI_FEATURE_ID_PSU_CHARGE_MODE = 0x02,

Align.

> +};
> +
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>  
>  #define LWMI_TYPE_ID_NONE 0x00
>  #define LWMI_TYPE_ID_CROSSLOAD 0x01
> +#define LWMI_TYPE_ID_PSU_AC 0x01
> +#define LWMI_TYPE_ID_PSU_PD 0x02

These should be aligned as well but that will impact more than this patch 
to avoid back and forth changes within the series.

>  
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> @@ -92,10 +102,17 @@ enum lwmi_feature_id_gpu {
>  
>  #define LWMI_FAN_DIV 100
>  
> +#define LWMI_CHARGE_MODE_ENABLED	0x00
> +#define LWMI_CHARGE_MODE_DISABLED	0x01
> +
>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>  	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
>  
> +#define LWMI_ATTR_ID_PSU(feat, type)		\
> +	LWMI_ATTR_ID(LWMI_DEVICE_ID_PSU, feat,		\
> +		     LWMI_GZ_THERMAL_MODE_NONE, type)
> +
>  #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
>  
> @@ -137,6 +154,8 @@ struct lwmi_om_priv {
>  		bool capdata00_collected : 1;
>  		bool capdata_fan_collected : 1;
>  	} fan_flags;
> +
> +	struct acpi_battery_hook battery_hook;
>  };
>  
>  /*
> @@ -561,6 +580,216 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
>  	lwmi_om_hwmon_add(priv);
>  }
>  
> +/* ======== Power Supply Extension (component: lenovo-wmi-capdata 00) ======== */
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
> +	struct lwmi_om_priv *priv = ext_data;
> +	struct wmi_method_args_32 args;
> +	u32 retval;
> +	int ret;
> +
> +	args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MODE, LWMI_TYPE_ID_PSU_AC);
> +
> +	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
> +				    (unsigned char *)&args, sizeof(args),
> +				    &retval);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(&priv->wdev->dev, "Got return value %x for property %x\n", retval, prop);
> +
> +	if (retval == LWMI_CHARGE_MODE_DISABLED)
> +		val->intval = POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
> +	else
> +		val->intval = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
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
> +	struct lwmi_om_priv *priv = ext_data;
> +	struct wmi_method_args_32 args;
> +
> +	args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MODE, LWMI_TYPE_ID_PSU_AC);
> +	if (val->intval == POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)
> +		args.arg1 = LWMI_CHARGE_MODE_DISABLED;
> +	else
> +		args.arg1 = LWMI_CHARGE_MODE_ENABLED;
> +
> +	dev_dbg(&priv->wdev->dev, "Attempting to set %#08x for property %x to %x\n",
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
> +	struct lwmi_om_priv *priv = ext_data;
> +	struct capdata00 capdata;
> +	u32 attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MODE, LWMI_TYPE_ID_PSU_AC);
> +	int ret;
> +
> +	ret = lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
> +	if (ret)
> +		return false;
> +
> +	dev_dbg(&priv->wdev->dev, "Battery charge mode (%#08x) support level: %x\n",

IIRC, 0x should be included into the length of of the field, so perhaps 
%#10x for full u32 but it's long time ago I've used that formatting for 
anything so I might be wrong.

> +		attribute_id, capdata.supported);
> +
> +	return capdata.supported;
> +}
> +
> +static const enum power_supply_property lwmi_psy_ext_props[] = {
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +static const struct power_supply_ext lwmi_psy_ext = {
> +	.name			= LWMI_OM_SYSFS_NAME,
> +	.properties		= lwmi_psy_ext_props,
> +	.num_properties		= ARRAY_SIZE(lwmi_psy_ext_props),
> +	.charge_types		= (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
> +	.get_property		= lwmi_psy_ext_get_prop,
> +	.set_property		= lwmi_psy_ext_set_prop,
> +	.property_is_writeable	= lwmi_psy_prop_is_writeable,
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
> +	return power_supply_register_extension(battery, &lwmi_psy_ext, &priv->wdev->dev, priv);
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
> + * Checks if the ideapad_laptop driver is going to manage charge_type first,
> + * then if not, hooks the battery to our WMI methods.
> + *
> + * Return: AE_CTRL_TERMINATE if found, AE_OK if not found.
> + */
> +static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
> +				   void *context, void **retval)
> +{
> +	if (!handle)
> +		return AE_OK;
> +
> +	acpi_handle *ahand = context;

Please don't declare variable mid-function (except cleanup.h related 
variables which is why it had to be allowed so compiler won't anymore 
complain about it).

> +	*ahand = handle;
> +
> +	return AE_CTRL_TERMINATE;
> +}
> +
> +/**
> + * lwmi_om_ps_ext_init() - Hooks power supply extension to device battery
> + * @priv: Driver private data
> + *
> + * Checks if the ideapad_laptop driver is going to manage charge_type first,
> + * then if not, hooks the battery to our WMI methods.
> + */
> +static void lwmi_om_ps_ext_init(struct lwmi_om_priv *priv)
> +{
> +	static const char * const ideapad_hid = "VPC2004";
> +	acpi_handle handle = NULL;
> +	int ret;
> +
> +	/* Deconflict ideapad_laptop driver */
> +	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
> +	if (ret)
> +		return;
> +
> +	if (!handle)
> +		return;
> +
> +	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
> +		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device.\n");
> +		return;
> +	}
> +
> +	/* Add battery hooks */
> +	priv->battery_hook.add_battery	= lwmi_add_battery,
> +	priv->battery_hook.remove_battery	= lwmi_remove_battery,
> +	priv->battery_hook.name		= "Lenovo WMI Other Battery Extension",

????

Use semicolons to separate statements.

And those tabs look odd too (not even aligning the lines), I'd prefer 
just using just normal single space as aligning with tabs will cause 
churn if adding new fields that need adjusting alignment of all the 
members.

> +
> +	ret = devm_battery_hook_register(&priv->wdev->dev, &priv->battery_hook);
> +	if (ret)
> +		dev_err(&priv->wdev->dev, "Error during battery hook: %i\n", ret);
> +}
> +
>  /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
>  
>  struct tunable_attr_01 {
> @@ -1325,6 +1554,7 @@ static int lwmi_om_master_bind(struct device *dev)
>  		return -ENODEV;
>  
>  	lwmi_om_fan_info_collect_cd00(priv);
> +	lwmi_om_ps_ext_init(priv);
>  
>  	return lwmi_om_fw_attr_add(priv);
>  }
> 

-- 
 i.

