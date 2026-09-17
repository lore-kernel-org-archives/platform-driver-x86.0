Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048BE4B66FC;
	Thu, 17 Sep 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644163; cv=none; b=b6ZKELF4/1xgP6mRs7SWX8/rX5ldrdtUqSgXcvhiyvMcZQzivUKp057Rnv5p0dKUE7Nl8rUev42lXYFzB9cKDBmJnbOhKV+ONFffxXS/BX2e3+3p76cQbV91Z9JjkTRu3Bj+JNcL1yvLR36XcALbkLaVvtV02ojTHC83yt57jU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644163; c=relaxed/simple;
	bh=p2MqWyV0JMo1ew/2ZNAyjF2TwMFOGuUxMzjHIo4HBug=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JyO2NNmDzzXawhHIR9RWvZ+3Rgrq+p5aDHIcsIUVSpNVGy6Qpb++xOtxYsXWYBTQAtTP2RPmrFUUHQEiZD76ATR4sFsLnUV/umt6+d5cJE0QYwfSmNQtDtUOsh/vzFaBeOwfy0ExHepi/uTm5nhBlMRIgxQOVKqhZl4irCrA0Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXGoIPX0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXGoIPX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789644157; x=1821180157;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=p2MqWyV0JMo1ew/2ZNAyjF2TwMFOGuUxMzjHIo4HBug=;
  b=aXGoIPX0bpIoEYAkvmxsW1KaEYT8qt/kt/h6MjZYi9nVKGsi1zmHy1w+
   IjEDaALdWMpVEUfNXYKQj3VxAjyIfwEZ+4oYxkqrB4rcrElE41ZlW318Q
   SJqAxDNc0sygmz5tfPD0RkQN+ionIL71BkWCuJHdINYW6AJWQ6fzrIY8/
   O2ewFpjwSmPiEQPZCnZtT2DYY1eTiR5I8QpMH9tNokHiyjftpSmDsg8Xb
   43rguSvn3MwGFTfBQAOuJuzqXiA7M8PLvmdz561wtxS43Em7X2FliTg3X
   xqEgz30DkBX/Omyx8s9NS5v9A1zZfNN6zMfAm+AusEyUQS8d4Bu1G/Dhv
   w==;
X-CSE-ConnectionGUID: VHdULOS2SMG9CphBpP3TEw==
X-CSE-MsgGUID: 2xdIhzRFR0+cs39FjTiTaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89190096"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89190096"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:22:33 -0700
X-CSE-ConnectionGUID: WZvK/kZBR1WSHTBjmbDK3g==
X-CSE-MsgGUID: XDFj4KDCTLe7p721S6DpHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278951413"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:22:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 14:22:27 +0300 (EEST)
To: Shang En Sim <sim@shangen.org>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: add charge_behaviour support for
 Spectre 8C17
In-Reply-To: <20260812062113.27741-1-sim@shangen.org>
Message-ID: <796e20eb-559f-4b7f-18a9-c7c7324dd731@linux.intel.com>
References: <20260812062113.27741-1-sim@shangen.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Aug 2026, Shang En Sim wrote:

> HP Spectre x360 16-aa0xxx (board 8C17) exposes battery charge mode control
> through WMI command 0x2b (GBCO/SBCO). Inhibit charge, force discharge, and
> restoring automatic charging all work through that command.
> 
> Unlike some other HP designs that restore automatic charging through WMI
> command 0x1f (SBCC), that path fails on this BIOS. Keep the quirk limited
> to board 8C17 and drive all three behaviours through 0x2b only.
> 
> Expose auto / inhibit-charge / force-discharge through the standard
> power_supply charge_behaviour property. Seed the reported policy from
> GBCO at setup because firmware retains inhibit across reboot. Cache that
> policy afterwards: GBCO also encodes live status, so 0x01 means actively
> charging and 0x02 is ambiguous between force-discharge and running on
> battery alone.
> 
> Observed firmware mapping on this board:
> - write 0x00 -> auto; write 0x02 -> force-discharge; write 0x05 -> inhibit
> - read 0x00/0x01 -> auto (0x01 = actively charging)
> - read 0x02 -> force-discharge (also seen on battery alone)
> - read 0x04/0x05/0x06 -> inhibit
> 
> Tested on HP Spectre x360 16-aa0xxx (board 8C17, BIOS F.16):
> - inhibit stops charging on AC; GBCO reads 0x04
> - force-discharge discharges on AC; GBCO reads 0x02
> - restore-auto via 0x2b mode 0 resumes charging; GBCO reads 0x01
> - inhibit persists across reboot (status Not charging, GBCO 0x04)
> 
> Signed-off-by: Shang En Sim <sim@shangen.org>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 238 +++++++++++++++++++++++++++++++
>  1 file changed, 238 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 3c737ef38..1f9d11427 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -15,6 +15,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/array_size.h>
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/compiler_attributes.h>
> @@ -39,6 +40,8 @@
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  
> +#include <acpi/battery.h>
> +
>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>  MODULE_DESCRIPTION("HP laptop WMI driver");
>  MODULE_LICENSE("GPL");
> @@ -392,6 +395,7 @@ enum hp_wmi_commandtype {
>  	HPWMI_FEATURE2_QUERY		= 0x0d,
>  	HPWMI_WIRELESS2_QUERY		= 0x1b,
>  	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
> +	HPWMI_BATTERY_CHARGE_MODE	= 0x2b,
>  	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
>  	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
>  	HPWMI_GRAPHICS_MUX_QUERY	= 0x52,
> @@ -461,6 +465,29 @@ enum hp_wireless2_bits {
>  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
>  #define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
>  
> +#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
> +#define HPWMI_CHARGE_BEHAVIOURS \
> +	(BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) | \
> +	 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE) | \
> +	 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE))
> +
> +/*
> + * SBCO reads the requested mode from bits 15:8 of the input value.
> + * GBCO returns literal status values in bits 7:0.
> + */
> +#define HPWMI_CHARGE_MODE_MASK			GENMASK(15, 8)
> +#define HPWMI_CHARGE_MODE_AUTO			0x00
> +#define HPWMI_CHARGE_MODE_FORCE_DISCHARGE	0x02
> +#define HPWMI_CHARGE_MODE_INHIBIT		0x05
> +
> +#define HPWMI_CHARGE_MODE_READ_AUTO		0x00
> +#define HPWMI_CHARGE_MODE_READ_CHARGING		0x01
> +#define HPWMI_CHARGE_MODE_READ_FORCE_DISCHARGE	0x02
> +#define HPWMI_CHARGE_MODE_READ_INHIBIT		0x04
> +#define HPWMI_CHARGE_MODE_READ_INHIBIT_SHPM	0x05
> +#define HPWMI_CHARGE_MODE_READ_INHIBIT_EXT	0x06
> +#endif
> +
>  struct bios_rfkill2_device_state {
>  	u8 radio_type;
>  	u8 bus_type;
> @@ -548,6 +575,19 @@ static const char * const tablet_chassis_types[] = {
>  	"32"  /* Detachable */
>  };
>  
> +#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
> +static const struct dmi_system_id hp_wmi_charge_control_quirks[] __initconst = {
> +	{
> +		/* HP Spectre x360 16-aa0xxx */
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +			DMI_MATCH(DMI_BOARD_NAME, "8C17"),
> +		},
> +	},
> +	{}
> +};
> +#endif
> +
>  #define DEVICE_MODE_TABLET	0x06
>  
>  #define CPU_FAN 0
> @@ -777,6 +817,200 @@ static int hp_wmi_read_int(int query)
>  	return val;
>  }
>  
> +#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
> +/* Protects hp_wmi_charge_behaviour */
> +static DEFINE_MUTEX(hp_wmi_charge_lock);
> +static enum power_supply_charge_behaviour hp_wmi_charge_behaviour =
> +	POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
> +
> +static int hp_wmi_charge_mode_to_behaviour(int mode,
> +					   enum power_supply_charge_behaviour *behaviour)
> +{
> +	switch (mode) {
> +	case HPWMI_CHARGE_MODE_READ_AUTO:
> +	case HPWMI_CHARGE_MODE_READ_CHARGING:
> +		/*
> +		 * GBCO 0x01 reports active charging, rather than a separate
> +		 * charge policy. Treat it as automatic charging.
> +		 */
> +		*behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
> +		return 0;
> +	case HPWMI_CHARGE_MODE_READ_FORCE_DISCHARGE:
> +		/*
> +		 * Firmware also returns 0x02 while running on battery alone.
> +		 * Treat it as force-discharge so a persisted AC policy is not
> +		 * lost across reboot.
> +		 */
> +		*behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE;
> +		return 0;
> +	case HPWMI_CHARGE_MODE_READ_INHIBIT:
> +	case HPWMI_CHARGE_MODE_READ_INHIBIT_SHPM:
> +	case HPWMI_CHARGE_MODE_READ_INHIBIT_EXT:
> +		*behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int hp_wmi_charge_mode_read(void)
> +{
> +	int val = 0, ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_BATTERY_CHARGE_MODE, HPWMI_READ,
> +				   &val, zero_if_sup(val), sizeof(val));
> +	if (ret < 0)
> +		return ret;
> +	if (ret > 0)
> +		return -EINVAL;
> +
> +	return val & 0xff;

Hi,

Thanks for the patch.

Can the mask literal be named with a define (and make define use 
GENMASK()) and FIELD_GET() be used here?

> +}
> +
> +static int hp_wmi_charge_mode_write(u32 mode)
> +{
> +	int ret;
> +
> +	mode = FIELD_PREP(HPWMI_CHARGE_MODE_MASK, mode);
> +	ret = hp_wmi_perform_query(HPWMI_BATTERY_CHARGE_MODE, HPWMI_WRITE,
> +				   &mode, sizeof(mode), 0);
> +	if (ret < 0)
> +		return ret;
> +	if (ret > 0)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int hp_wmi_charge_set_behaviour(enum power_supply_charge_behaviour behaviour)
> +{
> +	int ret;
> +
> +	guard(mutex)(&hp_wmi_charge_lock);
> +
> +	switch (behaviour) {
> +	case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> +		ret = hp_wmi_charge_mode_write(HPWMI_CHARGE_MODE_AUTO);
> +		break;
> +	case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
> +		ret = hp_wmi_charge_mode_write(HPWMI_CHARGE_MODE_INHIBIT);
> +		break;
> +	case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
> +		ret = hp_wmi_charge_mode_write(HPWMI_CHARGE_MODE_FORCE_DISCHARGE);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
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
> +	.name			= "HP WMI charge control",
> +	.add_battery		= hp_wmi_charge_add_battery,
> +	.remove_battery		= hp_wmi_charge_remove_battery,
> +};
> +
> +static int __init hp_wmi_charge_control_setup(struct device *dev)
> +{
> +	enum power_supply_charge_behaviour behaviour;
> +	int ret;
> +
> +	if (!dmi_check_system(hp_wmi_charge_control_quirks))
> +		return 0;
> +
> +	/*
> +	 * Firmware retains inhibit across reboot, so seed from GBCO rather
> +	 * than assuming auto.
> +	 */
> +	ret = hp_wmi_charge_mode_read();
> +	if (ret < 0)
> +		return 0;
> +
> +	ret = hp_wmi_charge_mode_to_behaviour(ret, &behaviour);
> +	if (ret)
> +		return 0;
> +
> +	scoped_guard(mutex, &hp_wmi_charge_lock)
> +		hp_wmi_charge_behaviour = behaviour;
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
> @@ -2528,6 +2762,10 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  	if (err < 0)
>  		return err;
>  
> +	err = hp_wmi_charge_control_setup(&device->dev);
> +	if (err)
> +		return err;

Sashiko found out there's a pre-existing issue in hp_wmi_hwmon_init() not 
properly cancelling work on error, and now with this adding more error 
returns, the same problem occurs in them as well.

So I think it would be useful to preceed this change with another patch
that converts INIT_DELAYED_WORK() in hp_wmi_hwmon_init() into 
devm_delayed_work_autocancel() so we don't end up adding into that 
problem here but fix it instead.

-- 
 i.

