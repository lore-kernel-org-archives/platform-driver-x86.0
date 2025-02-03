Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668CF17991
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Feb 2025 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593493; cv=none; b=ImanZEWdOpzHyhNa4YoKMhebtP0zugDyFCV9FdKDH+XfPD0M+g0E8sumPRhDtcVoR5aikPNd0YBorhCpT3swnn0nNojvLad+C2l+eAkGrt8BnyNRgIPywKx+8NKf90V4UDAzJ9U4CWk+HaHGnO0IvEv+CV/fhY2xiz1E7496zBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593493; c=relaxed/simple;
	bh=GmNiE/fBqWNz3HGuIhMqMxUq3JbOXgLmIYS7h16yumM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d9htHc6UE5rLFsKtQqj9AigGFrAcKJFoVwXc8b8u1NwG2mks+xECP/UW7vclHntD1RM78/x9pAfHn8WxyH5pdmLUV7HJBqMHhJlw2rqzigIjyTtb4VbQkxY1uUf+3/y9s0HKBXv4KfSqJoWV0TzTGYRn3NK3LJdUjx+baw8ikSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VaT2Jq0Q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaT2Jq0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738593491; x=1770129491;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GmNiE/fBqWNz3HGuIhMqMxUq3JbOXgLmIYS7h16yumM=;
  b=VaT2Jq0QE/Tz2lzbtvKSzN+PzDOEmOMY0liUSG0FiWuBVJnzDzMrlfzX
   5dYeM8AgexOKgp4tBRG8GEhQvSU9D0HbMefow3+lSFZEuAPmQ3ijZjCTs
   NA3uO10MaHdnze/w0a9Ibrxiw9YTIDwJ5lbMXPwR8rS5PONZsOXrbvuWE
   GHQc7gdQb4wq6E1L8O0iY5guz2asQxNAWetMf3OeMrb5Me0f6F4a7ieYY
   2G1x52UqIYpNiy2H2K8wl26scADullFpMuFuHCkx0ePIlXHEpRxHVlBT8
   zXaJZMQojG6vx6Aci0HJzEYoYyny5bjVCEh0ekkenSfzAkIF73KldBPfP
   A==;
X-CSE-ConnectionGUID: 2taJDT6VQUGzdxFROMF8fA==
X-CSE-MsgGUID: c2qhyq3hQ1yfYhHFsdFkiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49691230"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="49691230"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:38:11 -0800
X-CSE-ConnectionGUID: 9Xz/kTRbRFy7QMSxOgcb5w==
X-CSE-MsgGUID: WN8ttxp7SKKoUmh7B3v3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115461306"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:38:08 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 16:38:05 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 10/12] platform: mellanox: mlx-platform: Add support
 for new Nvidia system
In-Reply-To: <20250124172632.22437-11-vadimp@nvidia.com>
Message-ID: <cb788be2-76be-0a1b-7caa-4d94295202ad@linux.intel.com>
References: <20250124172632.22437-1-vadimp@nvidia.com> <20250124172632.22437-11-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Jan 2025, Vadim Pasternak wrote:

> Add support for SN5640 and SN5610 Nvidia switch.
> 
> SN5640 is a 51.2Tbps switch based on Nvidia SPC-5 ASIC.
> It provides up-to 400Gbps full bidirectional bandwidth per port.
> The system supports 64 OSFP cages and fits into standard 2U racks.
> 
> SN5640 Features:
> - 64 OSFP ports supporting 2.5Gbps - 400Gbps speeds.
> - Air-cooled with 4 + 1 redundant fan units.
> - 2 + 2 redundant 2000W PSUs.
> - System management board based on AMD CPU with secure-boot support.
> 
> SN5610 is a 51.2Tbps switch based on Nvidia SPC-4 ASIC.
> It provides up-to 800Gbps full bidirectional bandwidth per port.
> The system supports 64 OSFP cages and fits into standard 2U racks.
> 
> SN5610 Features:
>  - 64 OSFP ports supporting 10Gbps - 800Gbps speeds.
>  - Air-cooled with 4 + 1 redundant fan units.
>  - 2 + 2 redundant 2000W PSUs.
>  - System management board based on AMD CPU with secure-boot support.
> 
> Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v2->v3
> Comments pointed out by Ilpo:
> - Add empty lines for visibility in mlxplat_dmi_ng400_hi171_matched().
> ---
>  drivers/platform/mellanox/mlx-platform.c | 97 ++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
> index ee72a53a8b06..953f92a7cf22 100644
> --- a/drivers/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/mellanox/mlx-platform.c
> @@ -3042,6 +3042,60 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data = {
>  	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_PWR_BUT,
>  };
>  
> +/* Platform hotplug for next-generation 800G systems family data  */
> +static struct mlxreg_core_item mlxplat_mlxcpld_ng800_hi171_items[] = {
> +	{
> +		.data = mlxplat_mlxcpld_ext_psu_items_data,
> +		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
> +		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
> +		.inversed = 1,
> +		.health = false,
> +	},
> +	{
> +		.data = mlxplat_mlxcpld_modular_pwr_items_data,
> +		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
> +		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
> +		.inversed = 0,
> +		.health = false,
> +	},
> +	{
> +		.data = mlxplat_mlxcpld_xdr_fan_items_data,
> +		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +		.mask = MLXPLAT_CPLD_FAN_XDR_MASK,
> +		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +		.capability_mask = MLXPLAT_CPLD_FAN_CAP_MASK,
> +		.count = ARRAY_SIZE(mlxplat_mlxcpld_xdr_fan_items_data),
> +		.inversed = 1,
> +		.health = false,
> +	},
> +	{
> +		.data = mlxplat_mlxcpld_default_asic_items_data,
> +		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
> +		.mask = MLXPLAT_CPLD_ASIC_MASK,
> +		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.inversed = 0,
> +		.health = true,
> +	},
> +};
> +
> +static
> +struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ng800_hi171_data = {
> +	.items = mlxplat_mlxcpld_ng800_hi171_items,
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_ng800_hi171_items),
> +	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
> +	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
> +	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> +	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,
> +};
> +
>  /* Platform led default data */
>  static struct mlxreg_core_data mlxplat_mlxcpld_default_led_data[] = {
>  	{
> @@ -4528,6 +4582,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
>  		.mask = GENMASK(7, 0) & ~BIT(4),
>  		.mode = 0644,
>  	},
> +	{
> +		.label = "shutdown_unlock",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(5),
> +		.mode = 0644,
> +	},
>  	{
>  		.label = "erot1_ap_reset",
>  		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
> @@ -7355,6 +7415,29 @@ static int __init mlxplat_dmi_smart_switch_matched(const struct dmi_system_id *d
>  	return mlxplat_register_platform_device();
>  }
>  
> +static int __init mlxplat_dmi_ng400_hi171_matched(const struct dmi_system_id *dmi)
> +{
> +	int i;

unsigned int

> +
> +	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
> +	mlxplat_mux_num = ARRAY_SIZE(mlxplat_ng800_mux_data);
> +	mlxplat_mux_data = mlxplat_ng800_mux_data;
> +	mlxplat_hotplug = &mlxplat_mlxcpld_ng800_hi171_data;
> +	mlxplat_hotplug->deferred_nr =
> +		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
> +	mlxplat_led = &mlxplat_default_ng_led_data;
> +	mlxplat_regs_io = &mlxplat_default_ng_regs_io_data;
> +	mlxplat_fan = &mlxplat_xdr_fan_data;
> +
> +	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type3); i++)
> +		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type3[i];
> +
> +	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
> +	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
> +
> +	return mlxplat_register_platform_device();
> +}
> +
>  static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
>  	{
>  		.callback = mlxplat_dmi_default_wc_matched,
> @@ -7455,6 +7538,20 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_BOARD_NAME, "VMOD0019"),
>  		},
>  	},
> +	{
> +		.callback = mlxplat_dmi_ng400_hi171_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "VMOD0022"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI171"),
> +		},
> +	},
> +	{
> +		.callback = mlxplat_dmi_ng400_hi171_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "VMOD0022"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI172"),
> +		},
> +	},
>  	{
>  		.callback = mlxplat_dmi_msn274x_matched,
>  		.matches = {
> 

-- 
 i.

