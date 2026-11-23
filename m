Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442863;
	b=ySxGRt2gUWLsYZvC3MfV4QWJd5rU/GvTUZFAaWbkThd7Zc1dTIZlpUwO9pIerpn474Q/
	 K+SHc10lEqhCd5lclDEdtoGZHYOoxIflUcE8aMt4PyvUor8gu9patE2uYft0VMEJVFall
	 I8kW5odPKHFIbigyl5KqzmzKnoLbte+/r6ajELQk/v708AnZ1Vc0VZiaWhS/X6mcK1+GZ
	 +7/QHYi0A4Iyd56KgoQ2mh+7z2mDRK3uEYFR42r/ehs42bn3nGXieMZnelzp9DnIS16NT
	 JY2dpJfyT/xqCtMis1X7OuTgpXHVGOFKde65REzMLGIKIkbxJ2XYAcrJLu7nI2H3GqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442863;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=S7hupnWlEfeq0j5dXrQhKi95VlHjdCt0iF5z3OyNdms=;
	b=OJTeSt4+g9+2XFdyBN6P/gdBVSeASh7N3tg5NhjAcSk0MwMoMSDF4Qmfhk6KyMO9gf5I
	 5Uc7gsjqfzU6a1H4QLjXejNrwq9/PaVKAHVL5jFl/EndJtr0tj4L8YK6DXpgAQOopiv6f
	 i23uwtV0OZeKLLlooSllV5guRr6eGxh1SJVlS0zcXd23WRV6doLlTnCdQ0/a9zOAU56jk
	 g1qemF9SIuW16cbrBotwH3bK5zTFsJsBEBx5OPsz764kfZG3k/w2s94xyNxR3O0ReGhQi
	 dWejVn2Y0oOxH9geedPRdALsue1111enG+O2OpN/3ROV+ArBRyipKBWQXOgY33evPwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TA277kWj;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BAE606A33D
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 14:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BAE606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TA277kWj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795442862; x=1826978862;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8H1RxkfmvleV9oQRmlABpY5/fMNKHoBMz9vL5KWgUco=;
  b=TA277kWjbEJpVHIw0iRbwFbjTwJ7aMJuCRpKWgiRngTfMLqMPL5m0JAK
   f93RgRbWHPpUsH2VqBO6WxGzsNgrbTqP2/u02okM+ZsZdHauw4Bx5u3Xy
   pR5E9rI5LSZtsPcfHfKCnwjuDsgFHL9SgovhjxxgPjslB858jePPQ/xeN
   C8hhQGTHBpsgB6K0gaetx1EXtAhWDLrFHWeTexuPbF/z9TorA8iG3Ag1a
   NczdwrrSuHvuUtXYnZ8j1OFQWc16aeoh70RamHX9EZcKo1MaRm4UI0JN/
   x8YROHbw6jNkC3vu1XTs4fPkyMo3CsJLOfBmlx1waiVvrkLqjcDAk9zRZ
   A==;
X-CSE-ConnectionGUID: 5ho0tnHqQsef7IDTrUwcDA==
X-CSE-MsgGUID: G0n0Ktx0RX6AjHr9cr2GoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4263251"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4263251"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:04:45 -0800
X-CSE-ConnectionGUID: 3M4hxyczQVaqJYZnjVBekA==
X-CSE-MsgGUID: wLAYWQ1qTC+78Fh5xeVxvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11084280"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:03:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 16:03:21 +0200 (EET)
To: Felix Radensky <fradensky@nvidia.com>
cc: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v3 3/3] platform/mellanox: nvsw-host-spc6:
 Add support for SPC6 air cooled switches
In-Reply-To: <20261020172756.4160946-4-fradensky@nvidia.com>
Message-ID: <7f7a0477-95b1-c2d8-a9ef-6b11b740a51c@linux.intel.com>
References: <20261020172756.4160946-1-fradensky@nvidia.com> <20261020172756.4160946-4-fradensky@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Oct 2026, Felix Radensky wrote:

> Add support for air cooled Ethernet switches based on the Nvidia SPC6
> ASIC. Unlike the liquid cooled systems already supported by the
> driver, these carry their own power supplies and fan drawers.
> 
> They therefore expose a different set of register access attributes:
> power supply presence, AC and DC status and fan drawer presence, in
> place of the coolant leakage detection and power distribution board
> status of the liquid cooled systems. They also come with their own LED
> layout, adding power supply and per fan drawer LEDs, and with fan
> control.
> 
> The CPLD can override the fan PWM and drive the fans at full speed when
> it detects a fan fault. Clear the enable bit for that override through
> the set_reg_default callback, which runs before the fan device is
> registered, leaving the fan speed to the software, as mlx-platform does
> for the earlier generations.
> 
> Describe the system and select its description through the driver_data
> of the matching DMI entry, so that the board data is chosen by the SKU
> that was matched rather than by inspecting DMI again.
> 
> Document the power supply and fan drawer attributes the new system
> exposes, which are not yet covered by
> Documentation/ABI/stable/sysfs-driver-mlxreg-io.
> 
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Please check if sashiko's comment this patch is valid or not.

-- 
 i.

> ---
> 
> v2->v3
> Additional fixes added by Felix:
> - Describe jtag_enable as the single bit it is, as in patch 2.
> - Drop the aux_pwr_cycle attribute, which is not supported on systems
>   with power supply units.
> - Clear the CPLD fan fault override enable bit, so that the fan speed
>   is left to the software. This is done from the board driver through
>   the set_reg_default callback, which the core calls before the fan
>   device is registered.
> 
> Issues reported by the sashiko.dev review:
> - Fix the documented polarity of psu_status. The CPLD reports power
>   supply presence active low, so bit value 0 means the unit is
>   present. psu_ac_status and psu_dc_status share the same
>   description block but are active high, so the polarity is now
>   spelled out per attribute instead of in one sentence covering all
>   three.
> - Fix the documented polarity of fan_status. The CPLD reports fan
>   drawer presence active low, so bit value 0 means the drawer is
>   present, which is what mlxreg_fan_read() already assumes when it
>   reads the same register through .reg_prsnt. The ABI text claimed
>   the opposite.
> - Drop the claim that this system exposes power supply alarm
>   indications from the commit message. The alarm registers are
>   defined and reachable through the register map, but no attribute is
>   described over them.
> - Correct the mode of the pwr_cycle attribute, which was 0244 instead
>   of the 0200 used by the liquid cooled table and documented in the
>   ABI. 0244 denied read access to root while granting it to everyone
>   else on a write only attribute.
> 
> v1->v2
> - No change. The hunk offsets moved because of the include additions
>   in patches 1 and 2.
> 
>  .../ABI/stable/sysfs-driver-mlxreg-io         |  41 ++
>  drivers/platform/mellanox/nvsw-core.c         |  53 ++
>  drivers/platform/mellanox/nvsw-host-spc6.c    | 602 ++++++++++++++++++
>  drivers/platform/mellanox/nvsw.h              |  21 +
>  4 files changed, 717 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index e6128933f343..4c6e5514c59d 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -972,3 +972,44 @@ Description:	These files show the system reset cause. Respectively:
>  		the last reset.
>  
>  		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_status
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_ac_status
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_dc_status
> +Date:		October 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	These files show the state of the system power supply units, one
> +		bit per unit. Respectively: unit presence, unit AC power good
> +		and unit DC power good. In psu_status bit value 0 means the
> +		related unit is present, 1 - otherwise. In psu_ac_status and
> +		psu_dc_status bit value 1 means the related power is good,
> +		0 - otherwise.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/fan_status
> +Date:		October 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	This file shows the presence of the system fan drawers, one bit
> +		per drawer. Bit value 0 means the related drawer is present,
> +		1 - otherwise.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_event
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_ac_event
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_dc_event
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/fan_event
> +Date:		October 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	These files show the sticky indication of a change in the
> +		matching status file: power supply unit presence, power supply
> +		unit AC power, power supply unit DC power and fan drawer
> +		presence. Bit value 1 means the related unit changed its state
> +		since the indication was last cleared. Writing 0 to a bit
> +		clears it.
> +
> +		The files are read/write.
> diff --git a/drivers/platform/mellanox/nvsw-core.c b/drivers/platform/mellanox/nvsw-core.c
> index 8283a2af0f02..bb5c312e098b 100644
> --- a/drivers/platform/mellanox/nvsw-core.c
> +++ b/drivers/platform/mellanox/nvsw-core.c
> @@ -46,6 +46,9 @@ static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
>  	case NVSW_REG_GP5_OFFSET:
>  	case NVSW_REG_GP6_OFFSET:
>  	case NVSW_REG_LED1_OFFSET:
> +	case NVSW_REG_LED2_OFFSET:
> +	case NVSW_REG_LED3_OFFSET:
> +	case NVSW_REG_LED4_OFFSET:
>  	case NVSW_REG_LED5_OFFSET:
>  	case NVSW_REG_LED6_OFFSET:
>  	case NVSW_REG_LED7_OFFSET:
> @@ -72,8 +75,14 @@ static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
>  	case NVSW_REG_VR1_ALERT_MASK_OFFSET:
>  	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
>  	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
> +	case NVSW_REG_PS_AC_2_EVENT_OFFSET:
> +	case NVSW_REG_PS_AC_2_MASK_OFFSET:
>  	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
>  	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
> +	case NVSW_REG_PS_2_EVENT_OFFSET:
> +	case NVSW_REG_PS_2_MASK_OFFSET:
> +	case NVSW_REG_PS_ALARM_EVENT_OFFSET:
> +	case NVSW_REG_PS_ALARM_MASK_OFFSET:
>  	case NVSW_REG_FAN_EVENT_OFFSET:
>  	case NVSW_REG_FAN_MASK_OFFSET:
>  	case NVSW_REG_PWRB_EVENT_OFFSET:
> @@ -147,6 +156,9 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
>  	case NVSW_REG_RESET_CAUSE1_OFFSET:
>  	case NVSW_REG_RESET_CAUSE2_OFFSET:
>  	case NVSW_REG_LED1_OFFSET:
> +	case NVSW_REG_LED2_OFFSET:
> +	case NVSW_REG_LED3_OFFSET:
> +	case NVSW_REG_LED4_OFFSET:
>  	case NVSW_REG_LED5_OFFSET:
>  	case NVSW_REG_LED6_OFFSET:
>  	case NVSW_REG_LED7_OFFSET:
> @@ -204,9 +216,18 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
>  	case NVSW_REG_VR2_ALERT_OFFSET:
>  	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
>  	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
> +	case NVSW_REG_PS_AC_2_OFFSET:
> +	case NVSW_REG_PS_AC_2_EVENT_OFFSET:
> +	case NVSW_REG_PS_AC_2_MASK_OFFSET:
> +	case NVSW_REG_PS_2_OFFSET:
> +	case NVSW_REG_PS_2_EVENT_OFFSET:
> +	case NVSW_REG_PS_2_MASK_OFFSET:
>  	case NVSW_REG_PS_DC_OK_OFFSET:
>  	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
>  	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
> +	case NVSW_REG_PS_ALARM_OFFSET:
> +	case NVSW_REG_PS_ALARM_EVENT_OFFSET:
> +	case NVSW_REG_PS_ALARM_MASK_OFFSET:
>  	case NVSW_REG_CPLD8_PN_OFFSET:
>  	case NVSW_REG_CPLD8_PN1_OFFSET:
>  	case NVSW_REG_CPLD8_VER_OFFSET:
> @@ -248,6 +269,16 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
>  	case NVSW_REG_TACHO10_OFFSET:
>  	case NVSW_REG_TACHO11_OFFSET:
>  	case NVSW_REG_TACHO12_OFFSET:
> +	case NVSW_REG_TACHO13_OFFSET:
> +	case NVSW_REG_TACHO14_OFFSET:
> +	case NVSW_REG_TACHO15_OFFSET:
> +	case NVSW_REG_TACHO16_OFFSET:
> +	case NVSW_REG_TACHO17_OFFSET:
> +	case NVSW_REG_TACHO18_OFFSET:
> +	case NVSW_REG_TACHO19_OFFSET:
> +	case NVSW_REG_TACHO20_OFFSET:
> +	case NVSW_REG_CURRENT_TEMP_RO:
> +	case NVSW_REG_SWITCH_IC_QTY:
>  	case NVSW_REG_FAN_CAP1_OFFSET:
>  	case NVSW_REG_FAN_DRW_CAP_OFFSET:
>  	case NVSW_REG_TACHO_SPEED_OFFSET:
> @@ -325,6 +356,9 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
>  	case NVSW_REG_RESET_CAUSE1_OFFSET:
>  	case NVSW_REG_RESET_CAUSE2_OFFSET:
>  	case NVSW_REG_LED1_OFFSET:
> +	case NVSW_REG_LED2_OFFSET:
> +	case NVSW_REG_LED3_OFFSET:
> +	case NVSW_REG_LED4_OFFSET:
>  	case NVSW_REG_LED5_OFFSET:
>  	case NVSW_REG_LED6_OFFSET:
>  	case NVSW_REG_LED7_OFFSET:
> @@ -380,9 +414,18 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
>  	case NVSW_REG_VR2_ALERT_OFFSET:
>  	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
>  	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
> +	case NVSW_REG_PS_AC_2_OFFSET:
> +	case NVSW_REG_PS_AC_2_EVENT_OFFSET:
> +	case NVSW_REG_PS_AC_2_MASK_OFFSET:
> +	case NVSW_REG_PS_2_OFFSET:
> +	case NVSW_REG_PS_2_EVENT_OFFSET:
> +	case NVSW_REG_PS_2_MASK_OFFSET:
>  	case NVSW_REG_PS_DC_OK_OFFSET:
>  	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
>  	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
> +	case NVSW_REG_PS_ALARM_OFFSET:
> +	case NVSW_REG_PS_ALARM_EVENT_OFFSET:
> +	case NVSW_REG_PS_ALARM_MASK_OFFSET:
>  	case NVSW_REG_CPLD8_PN_OFFSET:
>  	case NVSW_REG_CPLD8_PN1_OFFSET:
>  	case NVSW_REG_CPLD8_VER_OFFSET:
> @@ -409,6 +452,8 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
>  	case NVSW_REG_LEAK_MASK_OFFSET:
>  	case NVSW_REG_GP4_RO_OFFSET:
>  	case NVSW_REG_GP5_RO_OFFSET:
> +	case NVSW_REG_CURRENT_TEMP_RO:
> +	case NVSW_REG_SWITCH_IC_QTY:
>  	case NVSW_REG_CPLD1_MVER_OFFSET:
>  	case NVSW_REG_CPLD2_MVER_OFFSET:
>  	case NVSW_REG_CPLD3_MVER_OFFSET:
> @@ -426,6 +471,14 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
>  	case NVSW_REG_TACHO10_OFFSET:
>  	case NVSW_REG_TACHO11_OFFSET:
>  	case NVSW_REG_TACHO12_OFFSET:
> +	case NVSW_REG_TACHO13_OFFSET:
> +	case NVSW_REG_TACHO14_OFFSET:
> +	case NVSW_REG_TACHO15_OFFSET:
> +	case NVSW_REG_TACHO16_OFFSET:
> +	case NVSW_REG_TACHO17_OFFSET:
> +	case NVSW_REG_TACHO18_OFFSET:
> +	case NVSW_REG_TACHO19_OFFSET:
> +	case NVSW_REG_TACHO20_OFFSET:
>  	case NVSW_REG_FAN_CAP1_OFFSET:
>  	case NVSW_REG_FAN_DRW_CAP_OFFSET:
>  	case NVSW_REG_TACHO_SPEED_OFFSET:
> diff --git a/drivers/platform/mellanox/nvsw-host-spc6.c b/drivers/platform/mellanox/nvsw-host-spc6.c
> index a87d796004fa..cce18fd9ad64 100644
> --- a/drivers/platform/mellanox/nvsw-host-spc6.c
> +++ b/drivers/platform/mellanox/nvsw-host-spc6.c
> @@ -33,10 +33,14 @@
>   * struct nvsw_host_spc6_cfg - per SKU board description
>   * @regs_io: register access platform data;
>   * @led: led platform data;
> + * @fan: fan platform data, NULL on systems without fans;
> + * @set_reg_default: set default registers callback, NULL if not required;
>   */
>  struct nvsw_host_spc6_cfg {
>  	struct mlxreg_core_platform_data *regs_io;
>  	struct mlxreg_core_platform_data *led;
> +	struct mlxreg_core_platform_data *fan;
> +	int (*set_reg_default)(struct regmap *regmap);
>  };
>  
>  /* Platform mux channels */
> @@ -69,7 +73,9 @@ static struct mlxcpld_mux_plat_data *nvsw_host_mux_data[NVSW_MUX_MAX];
>  static struct i2c_board_info *nvsw_host_mux_brdinfo;
>  static struct mlxreg_core_platform_data *nvsw_led_data;
>  static struct mlxreg_core_platform_data *nvsw_regs_io_data;
> +static struct mlxreg_core_platform_data *nvsw_fan_data;
>  static struct mlxreg_core_platform_data *nvsw_wd_data[NVSW_WD_MAX];
> +static int (*nvsw_set_reg_default)(struct regmap *regmap);
>  static int nvsw_host_mux_num;
>  static struct platform_device *nvsw_host_dev;
>  
> @@ -562,6 +568,358 @@ static struct mlxreg_core_platform_data nvsw_host_spc6_lc_regs_io = {
>  	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_regs_io_data),
>  };
>  
> +/* Platform register access data for air cooled system */
> +static struct mlxreg_core_data nvsw_host_spc6_ac_regs_io_data[] = {
> +	{
> +		.label = "cpld1_version",
> +		.reg = NVSW_REG_CPLD1_VER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld1_version_min",
> +		.reg = NVSW_REG_CPLD1_MVER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld2_version",
> +		.reg = NVSW_REG_CPLD2_VER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld2_version_min",
> +		.reg = NVSW_REG_CPLD2_MVER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld3_version",
> +		.reg = NVSW_REG_CPLD3_VER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld3_version_min",
> +		.reg = NVSW_REG_CPLD3_MVER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld4_version",
> +		.reg = NVSW_REG_CPLD4_VER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld4_version_min",
> +		.reg = NVSW_REG_CPLD4_MVER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld1_pn",
> +		.reg = NVSW_REG_CPLD1_PN_OFFSET,
> +		.bit = GENMASK(15, 0),
> +		.mode = 0444,
> +		.regnum = 2,
> +	},
> +	{
> +		.label = "cpld2_pn",
> +		.reg = NVSW_REG_CPLD2_PN_OFFSET,
> +		.bit = GENMASK(15, 0),
> +		.mode = 0444,
> +		.regnum = 2,
> +	},
> +	{
> +		.label = "cpld3_pn",
> +		.reg = NVSW_REG_CPLD3_PN_OFFSET,
> +		.bit = GENMASK(15, 0),
> +		.mode = 0444,
> +		.regnum = 2,
> +	},
> +	{
> +		.label = "cpld4_pn",
> +		.reg = NVSW_REG_CPLD4_PN_OFFSET,
> +		.bit = GENMASK(15, 0),
> +		.mode = 0444,
> +		.regnum = 2,
> +	},
> +	{
> +		.label = "asic_reset",
> +		.reg = NVSW_REG_RESET_GP2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "reset_long_pb",
> +		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_short_pb",
> +		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(1),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_aux_pwr_or_reload",
> +		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(2),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_swb_dc_dc_pwr_fail",
> +		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_platform",
> +		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(4),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_swb_wd",
> +		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(6),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_asic_thermal",
> +		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(7),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_soc",
> +		.reg = NVSW_REG_RESET_CAUSE1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(5),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_system",
> +		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(1),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_sw_pwr_off",
> +		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(2),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_cpu_thermal",
> +		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_ac_pwr_fail",
> +		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(6),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_mgmt_pwr",
> +		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(7),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "fan_dir",
> +		.reg = NVSW_REG_GP0_RO_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpu_mctp_ready",
> +		.reg = NVSW_REG_GP0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(1),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "cpu_shutdown_req",
> +		.reg = NVSW_REG_GP0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(2),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "vpd_wp",
> +		.reg = NVSW_REG_GP0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0644,
> +		.secured = 1,
> +	},
> +	{
> +		.label = "pcie_asic_reset_dis",
> +		.reg = NVSW_REG_GP0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(4),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "cpu_power_off_ready",
> +		.reg = NVSW_REG_GP0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(6),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "pwr_converter_prog_en",
> +		.reg = NVSW_REG_GP7_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(0),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "graceful_pwr_off",
> +		.reg = NVSW_REG_GP7_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "pwr_cycle",
> +		.reg = NVSW_REG_GP1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(2),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "pwr_down",
> +		.reg = NVSW_REG_GP1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "bmc_to_cpu_ctrl",
> +		.reg = NVSW_REG_GP1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(5),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "uart_sel",
> +		.reg = NVSW_REG_GP1_OFFSET,
> +		.mask = NVSW_UART_SEL_MASK,
> +		.bit = 7,
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "psu1_on",
> +		.reg = NVSW_REG_GP4_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(0),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "psu2_on",
> +		.reg = NVSW_REG_GP4_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(1),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "psu3_on",
> +		.reg = NVSW_REG_GP4_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(2),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "psu4_on",
> +		.reg = NVSW_REG_GP4_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "jtag_enable",
> +		.reg = NVSW_REG_FIELD_UPGRADE,
> +		.mask = GENMASK(7, 0) & ~BIT(0),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "jtag_cap",
> +		.reg = NVSW_REG_FU_CAP_OFFSET,
> +		.mask = NVSW_FU_CAP_MASK,
> +		.bit = 1,
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "asic_health",
> +		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
> +		.mask = NVSW_ASIC_MASK,
> +		.bit = 1,
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "psu_status",
> +		.reg = NVSW_REG_PS_2_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "psu_event",
> +		.reg = NVSW_REG_PS_2_EVENT_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.bit = 1,
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "psu_ac_status",
> +		.reg = NVSW_REG_PS_AC_2_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "psu_ac_event",
> +		.reg = NVSW_REG_PS_AC_2_EVENT_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.bit = 1,
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "psu_dc_status",
> +		.reg = NVSW_REG_PS_DC_OK_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "psu_dc_event",
> +		.reg = NVSW_REG_PS_DC_OK_EVENT_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.bit = 1,
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "fan_status",
> +		.reg = NVSW_REG_FAN_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "fan_event",
> +		.reg = NVSW_REG_FAN_EVENT_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.bit = 1,
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "asic_pg_fail",
> +		.reg = NVSW_REG_GP4_RO_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(7),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "spi_chnl_select",
> +		.reg = NVSW_REG_SPI_CHNL_SELECT,
> +		.mask = GENMASK(7, 0),
> +		.bit = 1,
> +		.mode = 0644,
> +	},
> +};
> +
> +static struct mlxreg_core_platform_data nvsw_host_spc6_ac_regs_io = {
> +	.data = nvsw_host_spc6_ac_regs_io_data,
> +	.counter = ARRAY_SIZE(nvsw_host_spc6_ac_regs_io_data),
> +};
> +
>  /* Platform led data for liquid cooled system */
>  static struct mlxreg_core_data nvsw_host_spc6_lc_led_data[] = {
>  	{
> @@ -596,6 +954,219 @@ static struct mlxreg_core_platform_data nvsw_host_spc6_lc_led = {
>  	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_led_data),
>  };
>  
> +/* Platform led data for air cooled system */
> +static struct mlxreg_core_data nvsw_host_spc6_ac_led_data[] = {
> +	{
> +		.label = "status:green",
> +		.reg = NVSW_REG_LED1_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +	},
> +	{
> +		.label = "status:amber",
> +		.reg = NVSW_REG_LED1_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +	},
> +	{
> +		.label = "psu:green",
> +		.reg = NVSW_REG_LED1_OFFSET,
> +		.mask = NVSW_LED_HI_NIBBLE_MASK,
> +	},
> +	{
> +		.label = "psu:amber",
> +		.reg = NVSW_REG_LED1_OFFSET,
> +		.mask = NVSW_LED_HI_NIBBLE_MASK,
> +	},
> +	{
> +		.label = "fan:green",
> +		.reg = NVSW_REG_LED6_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +	},
> +	{
> +		.label = "fan:amber",
> +		.reg = NVSW_REG_LED6_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +	},
> +	{
> +		.label = "uid:blue",
> +		.reg = NVSW_REG_LED5_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +	},
> +	{
> +		.label = "fan1:green",
> +		.reg = NVSW_REG_LED2_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +		.slot = 1,
> +	},
> +	{
> +		.label = "fan1:orange",
> +		.reg = NVSW_REG_LED2_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +		.slot = 1,
> +	},
> +	{
> +		.label = "fan2:green",
> +		.reg = NVSW_REG_LED2_OFFSET,
> +		.mask = NVSW_LED_HI_NIBBLE_MASK,
> +		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +		.slot = 2,
> +	},
> +	{
> +		.label = "fan2:orange",
> +		.reg = NVSW_REG_LED2_OFFSET,
> +		.mask = NVSW_LED_HI_NIBBLE_MASK,
> +		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +		.slot = 2,
> +	},
> +	{
> +		.label = "fan3:green",
> +		.reg = NVSW_REG_LED3_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +		.slot = 3,
> +	},
> +	{
> +		.label = "fan3:orange",
> +		.reg = NVSW_REG_LED3_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +		.slot = 3,
> +	},
> +	{
> +		.label = "fan4:green",
> +		.reg = NVSW_REG_LED3_OFFSET,
> +		.mask = NVSW_LED_HI_NIBBLE_MASK,
> +		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +		.slot = 4,
> +	},
> +	{
> +		.label = "fan4:orange",
> +		.reg = NVSW_REG_LED3_OFFSET,
> +		.mask = NVSW_LED_HI_NIBBLE_MASK,
> +		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +		.slot = 4,
> +	},
> +	{
> +		.label = "fan5:green",
> +		.reg = NVSW_REG_LED4_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +		.slot = 5,
> +	},
> +	{
> +		.label = "fan5:orange",
> +		.reg = NVSW_REG_LED4_OFFSET,
> +		.mask = NVSW_LED_LO_NIBBLE_MASK,
> +		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +		.slot = 5,
> +	},
> +};
> +
> +static struct mlxreg_core_platform_data nvsw_host_spc6_ac_led = {
> +	.data = nvsw_host_spc6_ac_led_data,
> +	.counter = ARRAY_SIZE(nvsw_host_spc6_ac_led_data),
> +};
> +
> +/* Platform fan data for air cooled system */
> +static struct mlxreg_core_data nvsw_host_spc6_ac_fan_data[] = {
> +	{
> +		.label = "pwm1",
> +		.reg = NVSW_REG_PWM1_OFFSET,
> +	},
> +	{
> +		.label = "tacho1",
> +		.reg = NVSW_REG_TACHO1_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.capability = NVSW_REG_FAN_CAP1_OFFSET,
> +		.slot = 1,
> +		.reg_prsnt = NVSW_REG_FAN_OFFSET,
> +	},
> +	{
> +		.label = "tacho2",
> +		.reg = NVSW_REG_TACHO2_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.capability = NVSW_REG_FAN_CAP1_OFFSET,
> +		.slot = 2,
> +		.reg_prsnt = NVSW_REG_FAN_OFFSET,
> +	},
> +	{
> +		.label = "tacho3",
> +		.reg = NVSW_REG_TACHO3_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.capability = NVSW_REG_FAN_CAP1_OFFSET,
> +		.slot = 3,
> +		.reg_prsnt = NVSW_REG_FAN_OFFSET,
> +	},
> +	{
> +		.label = "tacho4",
> +		.reg = NVSW_REG_TACHO4_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.capability = NVSW_REG_FAN_CAP1_OFFSET,
> +		.slot = 4,
> +		.reg_prsnt = NVSW_REG_FAN_OFFSET,
> +	},
> +	{
> +		.label = "tacho5",
> +		.reg = NVSW_REG_TACHO5_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.capability = NVSW_REG_FAN_CAP1_OFFSET,
> +		.slot = 5,
> +		.reg_prsnt = NVSW_REG_FAN_OFFSET,
> +	},
> +	{
> +		.label = "tacho6",
> +		.reg = NVSW_REG_TACHO6_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.capability = NVSW_REG_FAN_CAP1_OFFSET,
> +		.slot = 6,
> +		.reg_prsnt = NVSW_REG_FAN_OFFSET,
> +	},
> +	{
> +		.label = "tacho7",
> +		.reg = NVSW_REG_TACHO7_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.capability = NVSW_REG_FAN_CAP1_OFFSET,
> +		.slot = 7,
> +		.reg_prsnt = NVSW_REG_FAN_OFFSET,
> +	},
> +	{
> +		.label = "tacho8",
> +		.reg = NVSW_REG_TACHO8_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.capability = NVSW_REG_FAN_CAP1_OFFSET,
> +		.slot = 8,
> +		.reg_prsnt = NVSW_REG_FAN_OFFSET,
> +	},
> +	{
> +		.label = "tacho9",
> +		.reg = NVSW_REG_TACHO9_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.capability = NVSW_REG_FAN_CAP1_OFFSET,
> +		.slot = 9,
> +		.reg_prsnt = NVSW_REG_FAN_OFFSET,
> +	},
> +	{
> +		.label = "tacho10",
> +		.reg = NVSW_REG_TACHO10_OFFSET,
> +		.mask = GENMASK(7, 0),
> +		.capability = NVSW_REG_FAN_CAP1_OFFSET,
> +		.slot = 10,
> +		.reg_prsnt = NVSW_REG_FAN_OFFSET,
> +	},
> +	{
> +		.label = "conf",
> +		.capability = NVSW_REG_TACHO_SPEED_OFFSET,
> +	},
> +};
> +
> +static struct mlxreg_core_platform_data nvsw_host_spc6_ac_fan = {
> +	.data = nvsw_host_spc6_ac_fan_data,
> +	.counter = ARRAY_SIZE(nvsw_host_spc6_ac_fan_data),
> +	.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
> +	.version = 1,
> +};
> +
>  /* Watchdog platform data */
>  static struct mlxreg_core_data nvsw_host_spc6_wd_main_regs[] = {
>  	{
> @@ -707,12 +1278,31 @@ static void nvsw_host_spc6_mux_topology_exit(struct nvsw_core *nvsw_core)
>  		platform_device_unregister(nvsw_core->mux[i]);
>  }
>  
> +/* Register default values callback. */
> +static int nvsw_host_spc6_set_reg_default(struct regmap *regmap)
> +{
> +	/* The CPLD can override the fan PWM and drive the fans at full speed
> +	 * on a fan fault. Clear the enable bit for that override, leaving the
> +	 * fan speed to the software.
> +	 */
> +	return regmap_update_bits(regmap, NVSW_REG_GP0_OFFSET,
> +				  NVSW_FAN_CONTROL_EN_MASK, 0);
> +}
> +
>  /* Liquid cooled systems, without power supplies and fans. */
>  static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_lc = {
>  	.regs_io = &nvsw_host_spc6_lc_regs_io,
>  	.led = &nvsw_host_spc6_lc_led,
>  };
>  
> +/* Air cooled system, equipped with power supplies and fan drawers. */
> +static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_ac = {
> +	.regs_io = &nvsw_host_spc6_ac_regs_io,
> +	.led = &nvsw_host_spc6_ac_led,
> +	.fan = &nvsw_host_spc6_ac_fan,
> +	.set_reg_default = nvsw_host_spc6_set_reg_default,
> +};
> +
>  static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *dmi)
>  {
>  	const struct nvsw_host_spc6_cfg *cfg = dmi->driver_data;
> @@ -725,6 +1315,8 @@ static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *
>  	nvsw_host_mux_brdinfo = &nvsw_host_spc6_mux_brdinfo;
>  	nvsw_regs_io_data = cfg->regs_io;
>  	nvsw_led_data = cfg->led;
> +	nvsw_fan_data = cfg->fan;
> +	nvsw_set_reg_default = cfg->set_reg_default;
>  	for (i = 0; i < ARRAY_SIZE(nvsw_host_spc6_wd_set); i++)
>  		nvsw_wd_data[i] = &nvsw_host_spc6_wd_set[i];
>  
> @@ -732,6 +1324,14 @@ static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *
>  }
>  
>  static const struct dmi_system_id nvsw_host_dmi_table[] __initconst = {
> +	{
> +		.callback = nvsw_host_dmi_spc6_switch_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "VMOD0025"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI186"),
> +		},
> +		.driver_data = (void *)&nvsw_host_spc6_cfg_ac,
> +	},
>  	{
>  		.callback = nvsw_host_dmi_spc6_switch_matched,
>  		.matches = {
> @@ -824,6 +1424,8 @@ static int nvsw_host_probe(struct platform_device *pdev)
>  		nvsw_core->wd_data[i] = nvsw_wd_data[i];
>  	nvsw_core->regio_data = nvsw_regs_io_data;
>  	nvsw_core->led_data = nvsw_led_data;
> +	nvsw_core->fan_data = nvsw_fan_data;
> +	nvsw_core->set_reg_default = nvsw_set_reg_default;
>  	nvsw_core->mux_init = nvsw_host_spc6_mux_topology_init;
>  	nvsw_core->mux_exit = nvsw_host_spc6_mux_topology_exit;
>  	platform_set_drvdata(pdev, nvsw_core);
> diff --git a/drivers/platform/mellanox/nvsw.h b/drivers/platform/mellanox/nvsw.h
> index 88b16d0a36d4..e834a36f2d1f 100644
> --- a/drivers/platform/mellanox/nvsw.h
> +++ b/drivers/platform/mellanox/nvsw.h
> @@ -48,6 +48,9 @@ struct regmap;
>  #define NVSW_REG_RESET_CAUSE1_OFFSET	0x251e
>  #define NVSW_REG_RESET_CAUSE2_OFFSET	0x251f
>  #define NVSW_REG_LED1_OFFSET		0x2520
> +#define NVSW_REG_LED2_OFFSET		0x2521
> +#define NVSW_REG_LED3_OFFSET		0x2522
> +#define NVSW_REG_LED4_OFFSET		0x2523
>  #define NVSW_REG_LED5_OFFSET		0x2524
>  #define NVSW_REG_LED6_OFFSET		0x2525
>  #define NVSW_REG_LED7_OFFSET		0x2526
> @@ -96,12 +99,21 @@ struct regmap;
>  #define NVSW_REG_VR1_ALERT_OFFSET	0x2558
>  #define NVSW_REG_VR1_ALERT_EVENT_OFFSET	0x2559
>  #define NVSW_REG_VR1_ALERT_MASK_OFFSET	0x255a
> +#define NVSW_REG_PS_2_OFFSET		0x255b
> +#define NVSW_REG_PS_2_EVENT_OFFSET	0x255c
> +#define NVSW_REG_PS_2_MASK_OFFSET	0x255d
>  #define NVSW_REG_VR2_ALERT_OFFSET	0x255e
>  #define NVSW_REG_VR2_ALERT_EVENT_OFFSET	0x255f
>  #define NVSW_REG_VR2_ALERT_MASK_OFFSET	0x2560
> +#define NVSW_REG_PS_AC_2_OFFSET		0x2561
> +#define NVSW_REG_PS_AC_2_EVENT_OFFSET	0x2562
> +#define NVSW_REG_PS_AC_2_MASK_OFFSET	0x2563
>  #define NVSW_REG_PS_DC_OK_OFFSET	0x2567
>  #define NVSW_REG_PS_DC_OK_EVENT_OFFSET	0x2568
>  #define NVSW_REG_PS_DC_OK_MASK_OFFSET	0x2569
> +#define NVSW_REG_PS_ALARM_OFFSET	0x256d
> +#define NVSW_REG_PS_ALARM_EVENT_OFFSET	0x256e
> +#define NVSW_REG_PS_ALARM_MASK_OFFSET	0x256f
>  #define NVSW_REG_CPLD8_PN_OFFSET	0x2573
>  #define NVSW_REG_CPLD8_PN1_OFFSET	0x2574
>  #define NVSW_REG_PG3_OFFSET		0x2576
> @@ -142,6 +154,10 @@ struct regmap;
>  #define NVSW_REG_LEAK_OFFSET		0x25af
>  #define NVSW_REG_LEAK_EVENT_OFFSET	0x25b0
>  #define NVSW_REG_LEAK_MASK_OFFSET	0x25b1
> +#define NVSW_REG_TACHO19_OFFSET		0x25b4
> +#define NVSW_REG_TACHO20_OFFSET		0x25b5
> +#define NVSW_REG_TACHO17_OFFSET		0x25ba
> +#define NVSW_REG_TACHO18_OFFSET		0x25bb
>  #define NVSW_REG_CURRENT_TEMP_RO	0x25c0
>  #define NVSW_REG_SWITCH_IC_QTY		0x25c1
>  #define NVSW_REG_GP4_RO_OFFSET		0x25c2
> @@ -184,6 +200,8 @@ struct regmap;
>  #define NVSW_REG_TACHO10_OFFSET		0x25ee
>  #define NVSW_REG_TACHO11_OFFSET		0x25ef
>  #define NVSW_REG_TACHO12_OFFSET		0x25f0
> +#define NVSW_REG_TACHO13_OFFSET		0x25f1
> +#define NVSW_REG_TACHO14_OFFSET		0x25f2
>  #define NVSW_REG_FAN_CAP1_OFFSET	0x25f5
>  #define NVSW_REG_FAN_DRW_CAP_OFFSET	0x25f7
>  #define NVSW_REG_TACHO_SPEED_OFFSET	0x25f8
> @@ -191,6 +209,8 @@ struct regmap;
>  #define NVSW_REG_CONFIG1_OFFSET		0x25fb
>  #define NVSW_REG_CONFIG2_OFFSET		0x25fc
>  #define NVSW_REG_CONFIG3_OFFSET		0x25fd
> +#define NVSW_REG_TACHO15_OFFSET		0x25fe
> +#define NVSW_REG_TACHO16_OFFSET		0x25ff
>  #define NVSW_REG_MIN			0x2500
>  #define NVSW_REG_MAX			0x26ff
>  
> @@ -210,6 +230,7 @@ struct regmap;
>  #define NVSW_LEAK_AGGR_MASK		BIT(7)
>  #define NVSW_EROT_MASK			GENMASK(2, 0)
>  #define NVSW_FAN_NG_MASK		GENMASK(6, 0)
> +#define NVSW_FAN_CONTROL_EN_MASK	BIT(0)
>  #define NVSW_ASIC_MASK			GENMASK(1, 0)
>  #define NVSW_ASIC2_MASK			GENMASK(3, 2)
>  #define NVSW_ASIC3_MASK			GENMASK(5, 4)
> 
