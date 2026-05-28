Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E493E00B4;
	Thu, 28 May 2026 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779966821; cv=none; b=sLNO56Px1nHCmZaCGqhL5JOjkZWbkBrdKklGS81meK/gz4Ofh1m2sqBKIV1p07a8lMUaNFOpmsq62SpeVJUFsHr1Aqd0uCtp4MqjpOqykWsgfBU3dzyH6+3WhETvnosQ7GRKBpQUfV3sUBViQHdKybov1nXyUp4vn3iZmmv3d10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779966821; c=relaxed/simple;
	bh=9ac0MCcDom6eTsuRrcDteSXdpLKoki7qDGtOPYB5KW4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WTDNfX9lyvWZqaPm4Dq4iBtatwDowI1rjnIL6Dhp/Nw7k3QIzajwlmcByrP0yN2MM0h89nR7KRWFLkBOvGpCUJO/dXCbP0mQ15Axrutn288v/KGBGwyybEXNSrHB+3auZw0mKMqtAdpDA14lcNmfng25jIFSTsDiFo2kOAdD6uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiK9C5R6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiK9C5R6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779966819; x=1811502819;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9ac0MCcDom6eTsuRrcDteSXdpLKoki7qDGtOPYB5KW4=;
  b=OiK9C5R6h82NPedQrjvoo6KM0v0zz2RmepJKshxz7zRjwqVpLw87WGyN
   jwjIXjQZHeM9YU9gNcrgXT780DHMODrDxeRTY7zOL1WstfFlySiA8g2Dd
   6NBvLCWCEJsQiSOFVEThyzACzbSQGTjPRZvH3/aI/2ziDkzQz2YSbux26
   ujMaE9Aw24PscDLPeE6RtjFFsYXu55F/HGuhdks8B7PgRK3Fyd0RLiP1r
   ig/nNuHcGVmJyC9eRAooGH8e2Gc1agoEfrhO3jahd+vDN5bNQzjUHP+5t
   EQz3p4SIm0/lTXQViDqV6+OoQhUCFm6XPDXRvjvW/66dehnSXyCg5K3r9
   g==;
X-CSE-ConnectionGUID: 2qCsuYHvToG0lvXE+R1zdA==
X-CSE-MsgGUID: 1vV5ku1CQEyHz+doGscdjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80866971"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80866971"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 04:13:38 -0700
X-CSE-ConnectionGUID: l1hR/3qXTOeHV9Y1X7HEtQ==
X-CSE-MsgGUID: 4eg4GTbBQVKRNvjElo9+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="238100943"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 04:13:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 May 2026 14:13:32 +0300 (EEST)
To: Navon John Lukose <navonjohnlukose@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] platform/x86: hp-wmi: Add charge behaviour support
In-Reply-To: <20260505200222.157144-1-navonjohnlukose@gmail.com>
Message-ID: <21123447-fc86-230e-53f1-3167d8397167@linux.intel.com>
References: <20260505200222.157144-1-navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 May 2026, Navon John Lukose wrote:

> Some HP laptops expose battery charge mode control through the existing
> HP BIOS WMI GUID. On HP board 85C6, command types 0x1f and 0x2b map to
> the ACPI GBCC/GBCO and SBCC/SBCO methods through the WMI command
> dispatcher.
> 
> Expose the mode control through the standard power_supply
> charge_behaviour property using a battery hook and power_supply
> extension. The initial quirk is limited to board 85C6 and still
> requires a successful charge mode read before registering the extension.
> 
> The firmware uses different commands for restoring auto mode and setting
> explicit charge modes, so report the last successfully requested policy
> after seeding it from firmware at probe time. The regular battery status
> continues to report the live charging state.
> 
> Compile the battery hook support only when the ACPI battery driver is
> reachable so non-battery hp-wmi configurations keep building.
> 
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 207 +++++++++++++++++++++++++++++++
>  1 file changed, 207 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index d1cc6e7d176c..b3da64aee4f7 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -35,6 +35,9 @@
>  #include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>

Add an empty line here.

> +#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
> +#include <acpi/battery.h>
> +#endif

I don't think you need to put ifdeffery around an include.

>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>  MODULE_DESCRIPTION("HP laptop WMI driver");
> @@ -309,7 +312,9 @@ enum hp_wmi_commandtype {
>  	HPWMI_HOTKEY_QUERY		= 0x0c,
>  	HPWMI_FEATURE2_QUERY		= 0x0d,
>  	HPWMI_WIRELESS2_QUERY		= 0x1b,
> +	HPWMI_BATTERY_CHARGE_CONTROL	= 0x1f,
>  	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
> +	HPWMI_BATTERY_CHARGE_MODE	= 0x2b,
>  	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
>  	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
>  };
> @@ -378,6 +383,22 @@ enum hp_wireless2_bits {
>  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
>  #define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
>  
> +#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
> +#define HPWMI_CHARGE_BEHAVIOURS \
> +	(BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) | \
> +	 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE) | \
> +	 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE))
> +
> +#define HPWMI_CHARGE_MODE_AUTO			0x0000
> +#define HPWMI_CHARGE_MODE_FORCE_DISCHARGE	0x0200
> +#define HPWMI_CHARGE_MODE_INHIBIT		0x0500
> +
> +#define HPWMI_CHARGE_MODE_READ_AUTO		0x00
> +#define HPWMI_CHARGE_MODE_READ_FORCE_DISCHARGE	0x02
> +#define HPWMI_CHARGE_MODE_READ_INHIBIT		0x04
> +#define HPWMI_CHARGE_MODE_READ_INHIBIT_EXT	0x06

I tried to figure out if some of these would warrant using BIT() or 
GENMASK()+FIELD_PREP() but was left unsure.

> +#endif
> +
>  struct bios_rfkill2_device_state {
>  	u8 radio_type;
>  	u8 bus_type;
> @@ -465,6 +486,18 @@ static const char * const tablet_chassis_types[] = {
>  	"32"  /* Detachable */
>  };
>  
> +#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
> +static const struct dmi_system_id hp_wmi_charge_control_quirks[] __initconst = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +			DMI_MATCH(DMI_BOARD_NAME, "85C6"),
> +		},
> +	},
> +	{}
> +};
> +#endif
> +
>  #define DEVICE_MODE_TABLET	0x06
>  
>  #define CPU_FAN 0
> @@ -694,6 +727,176 @@ static int hp_wmi_read_int(int query)
>  	return val;
>  }
>  
> +#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
> +static DEFINE_MUTEX(hp_wmi_charge_lock);
> +static enum power_supply_charge_behaviour hp_wmi_charge_behaviour =
> +	POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
> +
> +static enum power_supply_charge_behaviour hp_wmi_charge_mode_to_behaviour(int mode)
> +{
> +	switch (mode) {
> +	case HPWMI_CHARGE_MODE_READ_FORCE_DISCHARGE:
> +		return POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE;
> +	case HPWMI_CHARGE_MODE_READ_INHIBIT:
> +	case HPWMI_CHARGE_MODE_READ_INHIBIT_EXT:
> +		return POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
> +	case HPWMI_CHARGE_MODE_READ_AUTO:
> +	default:
> +		return POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
> +	}
> +}
> +
> +static int hp_wmi_charge_mode_read(void)
> +{
> +	int val = 0, ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_BATTERY_CHARGE_MODE, HPWMI_READ,
> +				   &val, zero_if_sup(val), sizeof(val));
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;

These would be simpler to read if you split the if () to two.

> +
> +	return val & 0xff;
> +}
> +
> +static int hp_wmi_charge_write(enum hp_wmi_commandtype query, u32 mode)
> +{
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(query, HPWMI_WRITE, &mode, sizeof(mode), 0);
> +	return ret <= 0 ? ret : -EINVAL;

Here as well.

> +}
> +
> +static int hp_wmi_charge_set_behaviour(enum power_supply_charge_behaviour behaviour)
> +{
> +	int ret;
> +
> +	guard(mutex)(&hp_wmi_charge_lock);
> +
> +	/*
> +	 * HP firmware exposes normal charging through the GBCC/SBCC command
> +	 * pair, while explicit charge modes use the GBCO/SBCO command pair.
> +	 */
> +	switch (behaviour) {
> +	case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> +		ret = hp_wmi_charge_write(HPWMI_BATTERY_CHARGE_CONTROL,
> +					  HPWMI_CHARGE_MODE_AUTO);
> +		break;
> +	case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
> +		ret = hp_wmi_charge_write(HPWMI_BATTERY_CHARGE_MODE,
> +					  HPWMI_CHARGE_MODE_INHIBIT);
> +		break;
> +	case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
> +		ret = hp_wmi_charge_write(HPWMI_BATTERY_CHARGE_MODE,
> +					  HPWMI_CHARGE_MODE_FORCE_DISCHARGE);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * charge_behaviour is the requested policy. The live charging state is
> +	 * still reported by the regular battery status property.
> +	 */
> +	hp_wmi_charge_behaviour = behaviour;
> +
> +	return 0;
> +}
> +
> +static int hp_wmi_charge_get_property(struct power_supply *psy,
> +				      const struct power_supply_ext *ext,
> +				      void *data,
> +				      enum power_supply_property psp,
> +				      union power_supply_propval *val)
> +{
> +	if (psp != POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR)
> +		return -EINVAL;
> +
> +	guard(mutex)(&hp_wmi_charge_lock);
> +	val->intval = hp_wmi_charge_behaviour;
> +
> +	return 0;
> +}
> +
> +static int hp_wmi_charge_set_property(struct power_supply *psy,
> +				      const struct power_supply_ext *ext,
> +				      void *data,
> +				      enum power_supply_property psp,
> +				      const union power_supply_propval *val)
> +{
> +	if (psp != POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR)
> +		return -EINVAL;
> +
> +	return hp_wmi_charge_set_behaviour(val->intval);
> +}
> +
> +static int hp_wmi_charge_property_is_writeable(struct power_supply *psy,
> +					       const struct power_supply_ext *ext,
> +					       void *data,
> +					       enum power_supply_property psp)
> +{
> +	return psp == POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR;
> +}
> +
> +static const enum power_supply_property hp_wmi_charge_properties[] = {
> +	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> +};
> +
> +static const struct power_supply_ext hp_wmi_charge_extension = {
> +	.name			= "hp-wmi-charge-control",
> +	.properties		= hp_wmi_charge_properties,
> +	.num_properties		= ARRAY_SIZE(hp_wmi_charge_properties),
> +	.charge_behaviours	= HPWMI_CHARGE_BEHAVIOURS,
> +	.get_property		= hp_wmi_charge_get_property,
> +	.set_property		= hp_wmi_charge_set_property,
> +	.property_is_writeable	= hp_wmi_charge_property_is_writeable,
> +};
> +
> +static int hp_wmi_charge_add_battery(struct power_supply *battery,
> +				     struct acpi_battery_hook *hook)
> +{
> +	return power_supply_register_extension(battery, &hp_wmi_charge_extension,
> +					       &hp_wmi_platform_dev->dev, NULL);
> +}
> +
> +static int hp_wmi_charge_remove_battery(struct power_supply *battery,
> +					struct acpi_battery_hook *hook)
> +{
> +	power_supply_unregister_extension(battery, &hp_wmi_charge_extension);
> +	return 0;
> +}
> +
> +static struct acpi_battery_hook hp_wmi_charge_battery_hook = {
> +	.name = "HP WMI charge control",
> +	.add_battery = hp_wmi_charge_add_battery,
> +	.remove_battery = hp_wmi_charge_remove_battery,
> +};
> +
> +static int __init hp_wmi_charge_control_setup(struct device *dev)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(hp_wmi_charge_control_quirks))
> +		return 0;
> +
> +	ret = hp_wmi_charge_mode_read();
> +	if (ret < 0)
> +		return 0;
> +
> +	scoped_guard(mutex, &hp_wmi_charge_lock)
> +		hp_wmi_charge_behaviour = hp_wmi_charge_mode_to_behaviour(ret);
> +
> +	return devm_battery_hook_register(dev, &hp_wmi_charge_battery_hook);
> +}
> +#else
> +static int __init hp_wmi_charge_control_setup(struct device *dev)
> +{
> +	return 0;
> +}
> +#endif
> +
>  static int hp_wmi_get_dock_state(void)
>  {
>  	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
> @@ -2284,6 +2487,10 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  	if (err < 0)
>  		return err;
>  
> +	err = hp_wmi_charge_control_setup(&device->dev);
> +	if (err)
> +		return err;
> +
>  	thermal_profile_setup(device);
>  
>  	return 0;
> 

-- 
 i.

