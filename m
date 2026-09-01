Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBAE3CF200;
	Tue,  1 Sep 2026 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258262; cv=none; b=uw0yQbIjSRvyoK5KlozZn98V979zkCTDjAeHfIaqdIvjtI9Eyhf5a0tco1oDvsliMnc3N1hmUYf+wZDzVgtu7ewuyqCGb5/LbFn6ye0RF+LF/py8A+5U06QtRYkAp6vM0NqnlpzBaUbAGv3PXqSrmHO2BEN6Y8kFBJqUK/Axxvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258262; c=relaxed/simple;
	bh=cGW1WXJrvVzJ/S1ck1iQRsXFKZYSE8rJYD1Iqr5ZDF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0Ju3KZAlZggTDjg7ixk1umaZtAMS0csjQn1HHBMj6ly8gxneT97eF7NHhhzKejqCOnDpDebqrPs3ETT2vBvQTfUhMNAjwgz5Hct9/hD55C9mmECnTZrEE7S9Em6SFsY6kqP46/1I7pyMMqnOZptm5Gt53rkKjfy4xtQQ0Py3RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGNhqOhC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGNhqOhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788258260; x=1819794260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cGW1WXJrvVzJ/S1ck1iQRsXFKZYSE8rJYD1Iqr5ZDF8=;
  b=YGNhqOhCzhRjqgBblvQSmA/R+W5Bl19KEYYRxmyGl5QdAm5IZ7ZrbXyt
   chc73y+V1DvSsfS2E0SSnq2644oiNilrAICq4eRf2j7ZCtCHjXwfIcyH4
   iB+ljB5bNjbCNk34q/o74RFyftFW1J9g29udHe8gZ5jNhjwLMkE65l+Sq
   Wh3rm/1M3ewHmEBTyBSkiNXoh+nTh1P7I2joT9iIRl/koJLC7as5nNPnx
   ECIhdJ+YSDgGeF4ooDYQXTd+71aKmboAoXuGniB7XtIzUxZDPOct+wlS/
   4vNdeILAOz5M2PhT9dFVCIxzM+SOo9vTZZ7wXlLVEtmEhdCCxk8s+Ofdo
   w==;
X-CSE-ConnectionGUID: ZlDi+bLIQj2pDEEEkkJRPQ==
X-CSE-MsgGUID: RFgIzWTgSYyBYVd6MwPOpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99283105"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="99283105"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:24:20 -0700
X-CSE-ConnectionGUID: +2Jv+uXXS1yHS5Ny15/jrQ==
X-CSE-MsgGUID: mYFy3lSqQZCabYSgKUTGUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="270997919"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.216])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:24:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C851A121BD8;
	Tue, 01 Sep 2026 13:24:14 +0300 (EEST)
Date: Tue, 1 Sep 2026 13:24:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sahan Nissanka <adee.sahan@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, dan.scally@ideasonboard.com,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@cdrolet.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Add TPS68470 board data for
 Dell 7320 Detachable
Message-ID: <apanzqDR-4UbJZ5F@kekkonen.localdomain>
References: <20260816070108.9308-1-adee.sahan@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816070108.9308-1-adee.sahan@gmail.com>

Hi Sahan,

Thanks for the patch.

On Sun, Aug 16, 2026 at 05:01:03PM +1000, Sahan Nissanka wrote:
> The Dell Latitude 7320 Detachable has two MIPI cameras behind an Intel
> IPU6, both powered by a TPS68470 PMIC. Without board data the PMIC
> driver fails:
> 
>   int3472-tps68470 i2c-INT3472:07: error -ENODEV: No board-data found
>   for this model
> 
> and because the sensors declare an ACPI _DEP on the control logic they
> are never enumerated at all - no i2c client is created for either of
> them, so nothing can bind them.
> 
> Add board data for the front sensor, which ACPI describes as OVTI5678.
> Reset is on tps68470-gpio 5, active low. There is no powerdown pin.
> 
> On its own this patch clears the -ENODEV, registers the seven rails and
> the reset lookup, and lets the two i2c clients be created. No sensor
> driver binds yet: ov5675 does not recognise the OVTI5678 ACPI id, and
> that is a separate change to a different subsystem which this patch does
> not depend on.
> 
> The reset line was established by making the probe fail rather than by
> observing that the camera works: held physically low the sensor does not
> identify, held high it does, and driving tps68470-gpio 3 has no effect
> either way. That distinction matters here, because the sensor probes
> with no pin assignment at all - the line sits released by default - so a
> wrong mapping is invisible in normal operation. Charles Drolet found
> this and ran the control test; it has since been reproduced on a second
> Latitude 7320 Detachable, three trials per condition, which also
> confirms the board data describes the model rather than one machine.
> 
> The individual supply assignment could not be determined. The sensor's
> i2c bus only responds when VSIO, AUX1 and AUX2 are all enabled together,
> so no experiment here distinguishes which rail feeds avdd, dvdd or
> dovdd, and the voltages suggest these rails act as enables for
> regulators further down rather than as the supplies themselves. What is
> established is that this set of rails must be enabled: with the
> conventional ANA/CORE/VSIO mapping the sensor does not respond at all.
> 
> The rails that have no consumers are given their own regulator_init_data
> rather than borrowing the Dell 7212's. They hold identical values today,
> but sharing them couples two unrelated machines: the 7212 has a second
> camera that is not registered yet, and adding it would mean giving those
> structures consumer supplies, which this board would then silently
> inherit.
> 
> Note the control logic here enumerates as INT3472:07, not :05 as on the
> other Dell models in this file. The board data lookup matches on DMI and
> device name, so this has to be exact. Note also that a Dell Latitude
> 7320 laptop exists which is a different machine without an IPU6, hence
> "detachable" throughout.
> 
> The rear OVTI8856 sensor shares this PMIC. It is left out deliberately:
> it needs changes to ov8856 beyond board data, and it exhibits a suspend
> regression that the front sensor does not, so it belongs in its own
> patch.

The commit message is too big, please keep only the essentials.

We'll also need a driver for the ov5678 and I believe that requires the
Common Raw Sensor Model patches so it'll still take a while.

> 
> Co-developed-by: Charles Drolet <linux@cdrolet.dev>
> Signed-off-by: Charles Drolet <linux@cdrolet.dev>
> Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
> ---
> Rebased onto v7.2-rc7; v1 was generated against v7.0, before the MSI
> Prestige AI+ Evo and Intel NVL entries landed in this file.
> 
> Changes since v1 [1]:
>  - Reset is on tps68470-gpio 5, not 3. Established by holding the line low
>    and making the probe fail, with gpio 3 driven as a control; reproduced
>    on a second Latitude 7320 Detachable, three trials per condition, which
>    also shows the board data describes the model and not one machine.
>  - Dropped the powerdown lookup rather than correcting it. ov5675.c only
>    ever requests "reset", so no "powerdown" con_id was ever looked up.
>  - Dropped the CLDB C0W4=3 corroboration from the commit message. It
>    agreed with the wrong pin.
>  - Rewrote the supply paragraph. v1 claimed the rail assignment was
>    confirmed on hardware; it is not determinable here, because the
>    sensor's i2c bus only responds when VSIO, AUX1 and AUX2 are all
>    enabled together. What is established is that this set of rails must
>    be enabled, not which one feeds which supply.
>  - Gave the consumerless rails their own regulator_init_data instead of
>    sharing the Dell 7212's. The values are identical today, but the 7212
>    has a second camera that is not registered yet; adding it would mean
>    giving those structures consumer supplies, which this board would then
>    silently inherit. Suggested by Charles Drolet.
>  - Declared VIO always_on at VSIO's voltage, as the Surface Go entry does,
>    rather than valid_ops_mask = REGULATOR_CHANGE_STATUS as inherited from
>    the 7212 in v1. This corrects the description, not the behaviour: VIO
>    is registered with tps68470_always_on_reg_ops, which implements neither
>    .enable nor .disable, so v1 declared a capability the ops do not
>    provide and the rail is on either way. Confirmed on hardware - VIO
>    comes up with use_count 1 and no sysfs "state" attribute, which is the
>    always_on signature and not seen on the other six rails.
>  - Named everything dell_7320_detachable_* rather than after the sensor.
>    A product may carry several sensors, the same sensor may be wired
>    differently elsewhere, and a Dell Latitude 7320 laptop exists which is
>    a different machine without an IPU6. Also suggested by Charles Drolet.
>  - Added Co-developed-by/Signed-off-by for Charles Drolet, who found the
>    reset line and ran the control test. He also booted an earlier draft of
>    this patch on v7.2-rc7, applied by hand, and confirmed the -ENODEV is
>    gone with no other effect; the VIO change below postdates that test.
>  - Sent standalone. Patches 2/3 and 3/3 of the v1 series are held pending
>    the discussion on 2/3 [2] about non-Bayer output and the metadata
>    series; this patch does not depend on them.
> 
> No tps68470_gpio_swnode: the daisy-chain-enable property exists to put
> GPIOs 1 and 2 into input mode for the PMIC's i2c pass-through, which this
> machine does not use - both sensors are direct ACPI i2c clients.
> 
> [1] https://lore.kernel.org/all/20260809042540.15849-1-adee.sahan@gmail.com/
> [2] https://lore.kernel.org/all/anmHRjxruBaYQRaC@kekkonen.localdomain/
> 
>  .../x86/intel/int3472/tps68470_board_data.c   | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index c535424..2312c26 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -369,6 +369,102 @@ static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata =
>  	},
>  };
>  
> +/* Settings for Dell Latitude 7320 Detachable */
> +
> +static struct regulator_consumer_supply dell_7320_detachable_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("avdd", "i2c-OVTI5678:00"),
> +};
> +
> +static struct regulator_consumer_supply dell_7320_detachable_aux1_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI5678:00"),
> +};
> +
> +static struct regulator_consumer_supply dell_7320_detachable_aux2_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI5678:00"),
> +};
> +
> +static const struct regulator_init_data dell_7320_detachable_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +};
> +
> +static const struct regulator_init_data dell_7320_detachable_ana_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +};
> +
> +static const struct regulator_init_data dell_7320_detachable_vcm_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},

There are no consumers for these three. Are they needed?

> +};
> +
> +/* Ensure the always-on VIO regulator has the same voltage as VSIO */
> +static const struct regulator_init_data dell_7320_detachable_vio_reg_init_data = {

See
<URL:https://lore.kernel.org/linux-media/20260831160754.9857-6-tchatard@gmail.com/>.

> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.always_on = 1,
> +	},
> +};
> +
> +static const struct regulator_init_data dell_7320_detachable_vsio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(dell_7320_detachable_vsio_consumer_supplies),
> +	.consumer_supplies = dell_7320_detachable_vsio_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data dell_7320_detachable_aux1_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1213200,
> +		.max_uV = 1213200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(dell_7320_detachable_aux1_consumer_supplies),
> +	.consumer_supplies = dell_7320_detachable_aux1_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data dell_7320_detachable_aux2_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(dell_7320_detachable_aux2_consumer_supplies),
> +	.consumer_supplies = dell_7320_detachable_aux2_consumer_supplies,
> +};
> +
> +static const struct tps68470_regulator_platform_data dell_7320_detachable_tps68470_pdata = {
> +	.reg_init_data = {
> +		[TPS68470_CORE] = &dell_7320_detachable_core_reg_init_data,
> +		[TPS68470_ANA]  = &dell_7320_detachable_ana_reg_init_data,
> +		[TPS68470_VCM]  = &dell_7320_detachable_vcm_reg_init_data,
> +		[TPS68470_VIO]  = &dell_7320_detachable_vio_reg_init_data,
> +		[TPS68470_VSIO] = &dell_7320_detachable_vsio_reg_init_data,
> +		[TPS68470_AUX1] = &dell_7320_detachable_aux1_reg_init_data,
> +		[TPS68470_AUX2] = &dell_7320_detachable_aux2_reg_init_data,
> +	},
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios = {
>  	.dev_id = "i2c-INT347A:00",
>  	.table = {
> @@ -411,6 +507,14 @@ static struct gpiod_lookup_table intel_nvl_tps68470_gpios = {
>  	}
>  };
>  
> +static struct gpiod_lookup_table dell_7320_detachable_gpios = {
> +	.dev_id = "i2c-OVTI5678:00",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 5, "reset", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>  static const struct property_entry int3472_tps68470_daisy_chain_gpio_props[] = {
>  	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
>  	{ }
> @@ -469,6 +573,15 @@ static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data =
>  	},
>  };
>  
> +static const struct int3472_tps68470_board_data dell_7320_detachable_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:07",
> +	.tps68470_regulator_pdata = &dell_7320_detachable_tps68470_pdata,
> +	.n_gpiod_lookups = 1,
> +	.tps68470_gpio_lookup_tables = {
> +		&dell_7320_detachable_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -529,6 +642,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&intel_nvl_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7320 Detachable"),
> +		},
> +		.driver_data = (void *)&dell_7320_detachable_tps68470_board_data,
> +	},
>  	{ }
>  };
>  
> 
> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> -- 
> 2.53.0
> 

-- 
Sakari Ailus
