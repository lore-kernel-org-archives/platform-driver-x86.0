Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC720326
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 May 2025 06:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032830; cv=none; b=QH/C5nboorItPevZ0IHFtAVpbZulIfzQ00WYcLiwsXYiJ8krKik+t3JWmvnm/0sHH1fdhJoXl17plDSLAB9r6mKdmBzX8dSvPIp1hl1DalmG52TabllP52tSSNTscGZce5DHdXkcVXLhuOdkbaChs1PWvNgDP0pXUtSOaPq08/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032830; c=relaxed/simple;
	bh=QvSbygpuY+SxhNa7x1aGaiebtBNB7qh1dtebnKmY30A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kL9gkF/qXGNJyudUGK7kZLcAMhAHQzMccX5/Fovl/FChnnlQieGTbvUfnZX/CKm+00V9v5CDcg5suOrzqpy7ta4KyARGPODI7Fn92ordHrvyqgf1iQJwFeCsLqAitFDIHH1gzmiTS1HBa7mVzOC8Od1rM/xcyrl0b5yDVXvYeGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Yy+ZN1O7; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Yy+ZN1O7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747032817;
	bh=QvSbygpuY+SxhNa7x1aGaiebtBNB7qh1dtebnKmY30A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yy+ZN1O71T+h71tTpGceS0fBw9+PbANKm0kU7QtwwgF9PDLXzbReMPQIP0ZsX8huu
	 Kwp465TAg+Vm/BqP7avKt3sVlkEO4PvQIaRy234xDO2gNqMOkDQ0Eo1txNdkY/TMZ+
	 NfWOil+bUo20Ks52u/HX4NbMTaD62DF3YczREtSc=
Date: Mon, 12 May 2025 08:53:36 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jelle van der Waa <jvanderw@redhat.com>
Cc: Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jelle van der Waa <jvanderwaa@redhat.com>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86: ideapad: Expose charge_types
Message-ID: <f667a519-b077-4690-89bc-37cb18b69a2d@t-8ch.de>
References: <20250511113012.9251-1-jvanderw@redhat.com>
 <20250511113012.9251-2-jvanderw@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511113012.9251-2-jvanderw@redhat.com>

On 2025-05-11 13:30:09+0200, Jelle van der Waa wrote:
> From: Jelle van der Waa <jvanderwaa@redhat.com>
> 
> Some Ideapad models support a battery conservation mode which limits the
> battery charge threshold for longer battery longevity. This is currently
> exposed via a custom conservation_mode attribute in sysfs.
> 
> The newly introduced charge_types sysfs attribute is a standardized
> replacement for laptops with a fixed end charge threshold. Setting it to
> `Long Life` would enable battery conservation mode. The standardized
> user space API would allow applications such as UPower to detect laptops
> which support this battery longevity mode and set it.
> 
> Tested on an Lenovo ideapad U330p.
> 
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
> ---
>  .../ABI/testing/sysfs-platform-ideapad-laptop |   2 +
>  drivers/platform/x86/ideapad-laptop.c         | 126 +++++++++++++++++-
>  2 files changed, 125 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> index 4989ab266682..83eca4c14503 100644
> --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> @@ -32,6 +32,8 @@ Date:		Aug 2017
>  KernelVersion:	4.14
>  Contact:	platform-driver-x86@vger.kernel.org
>  Description:
> +		This interface is deprecated; please use /sys/class/power_supply/*/charge_types.
> +
>  		Controls whether the conservation mode is enabled or not.
>  		This feature limits the maximum battery charge percentage to
>  		around 50-60% in order to prolong the lifetime of the battery.
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index ede483573fe0..fd9127ffd456 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -34,12 +34,17 @@
>  #include <linux/wmi.h>
>  #include "ideapad-laptop.h"
>  
> +#include <linux/power_supply.h>

Other linux/ includes are in the block above.

> +#include <acpi/battery.h>
>  #include <acpi/video.h>
>  
>  #include <dt-bindings/leds/common.h>
>  
>  #define IDEAPAD_RFKILL_DEV_NUM	3
>  
> +#define IDEAPAD_CHARGE_TYPES		(BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD)  | \
> +					 BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
> +
>  enum {
>  	CFG_CAP_BT_BIT       = 16,
>  	CFG_CAP_3G_BIT       = 17,
> @@ -162,6 +167,8 @@ struct ideapad_private {
>  	struct backlight_device *blightdev;
>  	struct ideapad_dytc_priv *dytc;
>  	struct dentry *debug;
> +	struct acpi_battery_hook battery_hook;
> +	struct power_supply *hooked_battery;

hooked_battery is not used.

>  	unsigned long cfg;
>  	unsigned long r_touchpad_val;
>  	struct {
> @@ -589,6 +596,11 @@ static ssize_t camera_power_store(struct device *dev,
>  
>  static DEVICE_ATTR_RW(camera_power);
>  
> +static void show_deprecation_warning(struct device *dev)

show_conservation_mode_deprecation_warning();

> +{
> +	dev_warn_once(dev, "conservation_mode attribute has been deprecated, see charge_types.\n");
> +}
> +
>  static ssize_t conservation_mode_show(struct device *dev,
>  				      struct device_attribute *attr,
>  				      char *buf)
> @@ -597,6 +609,8 @@ static ssize_t conservation_mode_show(struct device *dev,
>  	unsigned long result;
>  	int err;
>  
> +	show_deprecation_warning(dev);
> +
>  	err = eval_gbmd(priv->adev->handle, &result);
>  	if (err)
>  		return err;
> @@ -612,6 +626,8 @@ static ssize_t conservation_mode_store(struct device *dev,
>  	bool state;
>  	int err;
>  
> +	show_deprecation_warning(dev);
> +
>  	err = kstrtobool(buf, &state);
>  	if (err)
>  		return err;
> @@ -1973,10 +1989,99 @@ static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
>  	{}
>  };
>  
> -static void ideapad_check_features(struct ideapad_private *priv)
> +static int ideapad_psy_ext_set_prop(struct power_supply *psy,
> +				       const struct power_supply_ext *ext,
> +				       void *ext_data,
> +				       enum power_supply_property psp,
> +				       const union power_supply_propval *val)
> +{
> +	struct ideapad_private *priv = ext_data;
> +	int err;
> +
> +	if (psp != POWER_SUPPLY_PROP_CHARGE_TYPES)
> +		return -EINVAL;

This check will never trigger. Same below)

> +
> +	err = exec_sbmc(priv->adev->handle,
> +			(val->intval == POWER_SUPPLY_CHARGE_TYPE_LONGLIFE ?
> +			 SBMC_CONSERVATION_ON : SBMC_CONSERVATION_OFF));

No need for braces.
Directly "return exec_sbmc()".

> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int ideapad_psy_ext_get_prop(struct power_supply *psy,
> +				       const struct power_supply_ext *ext,
> +				       void *ext_data,
> +				       enum power_supply_property psp,
> +				       union power_supply_propval *val)
> +{
> +	struct ideapad_private *priv = ext_data;
> +	unsigned long result;
> +	int err;
> +
> +	if (psp != POWER_SUPPLY_PROP_CHARGE_TYPES)
> +		return -EINVAL;
> +
> +	err = eval_gbmd(priv->adev->handle, &result);
> +	if (err)
> +		return err;
> +
> +	if (test_bit(GBMD_CONSERVATION_STATE_BIT, &result))
> +		val->intval = POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
> +	else
> +		val->intval = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +
> +	return 0;
> +}
> +
> +static int ideapad_psy_prop_is_writeable(struct power_supply *psy,
> +					    const struct power_supply_ext *ext,
> +					    void *data,
> +					    enum power_supply_property psp)
> +{
> +	if (psp == POWER_SUPPLY_PROP_CHARGE_TYPES)
> +		return true;

No need for the conditional.

> +
> +	return false;
> +}
> +
> +static const enum power_supply_property ideapad_power_supply_props[] = {
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +static const struct power_supply_ext ideapad_battery_ext = {
> +	.name			= "ideapad",
> +	.properties		= ideapad_power_supply_props,
> +	.num_properties		= ARRAY_SIZE(ideapad_power_supply_props),
> +	.charge_types		= IDEAPAD_CHARGE_TYPES,
> +	.get_property		= ideapad_psy_ext_get_prop,
> +	.set_property		= ideapad_psy_ext_set_prop,
> +	.property_is_writeable	= ideapad_psy_prop_is_writeable,
> +};
> +
> +static int ideapad_battery_add(struct power_supply *battery,
> +			       struct acpi_battery_hook *hook)

No need for the linebreak, the line will be shorter than the one below.

> +{
> +	struct ideapad_private *priv = container_of(hook, struct ideapad_private, battery_hook);
> +
> +	return power_supply_register_extension(battery, &ideapad_battery_ext,
> +					       &priv->platform_device->dev, priv);
> +}
> +
> +static int ideapad_battery_remove(struct power_supply *battery,
> +				  struct acpi_battery_hook *hook)
> +{
> +	power_supply_unregister_extension(battery, &ideapad_battery_ext);
> +
> +	return 0;
> +}
> +
> +static int ideapad_check_features(struct ideapad_private *priv)
>  {
>  	acpi_handle handle = priv->adev->handle;
>  	unsigned long val;
> +	int err;
>  
>  	priv->features.set_fn_lock_led =
>  		set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
> @@ -1991,8 +2096,19 @@ static void ideapad_check_features(struct ideapad_private *priv)
>  	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
>  		priv->features.fan_mode = true;
>  
> -	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"))
> +	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
>  		priv->features.conservation_mode = true;
> +		priv->battery_hook.add_battery = ideapad_battery_add;
> +		priv->battery_hook.remove_battery = ideapad_battery_remove;
> +		priv->battery_hook.name = "Ideapad Battery Extension";
> +
> +		err = devm_battery_hook_register(&priv->platform_device->dev, &priv->battery_hook);
> +		if (err) {
> +			dev_dbg(&priv->platform_device->dev,
> +				"failed to register battery hook: %d\n", err);
> +			return err;

Use dev_err_probe().

> +		}
> +	}
>  
>  	if (acpi_has_method(handle, "DYTC"))
>  		priv->features.dytc = true;
> @@ -2027,6 +2143,8 @@ static void ideapad_check_features(struct ideapad_private *priv)
>  			}
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> @@ -2175,7 +2293,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	ideapad_check_features(priv);
> +	err = ideapad_check_features(priv);
> +	if (err)
> +		return err;
>  
>  	ideapad_debugfs_init(priv);
>  
> -- 
> 2.49.0
> 
> 
