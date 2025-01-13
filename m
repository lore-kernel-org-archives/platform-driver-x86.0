Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5424022B
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 17:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736788585; cv=none; b=eSl3mzsLELhUh9JVcKnP2O2mxJigYjOsRR27LWRlpHFbG2HU+BQPtlyuCeKfGQi6dI1sCd5fpMc/SEFAM0NtQhpkvo+CQTxsOvC816lltHw2s2GC87c8BGv159hkbwNTknBkBsJv7bVIccnOq1RDZktkgkPAU6RUus7fJlna6Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736788585; c=relaxed/simple;
	bh=6DKUGtuz3oR13/nWJrEvnw3OH80wM7Pdoa+eRKY65c0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tBQHStMNGDmO+YQvAN6cdTYWkJCzCnuioaYSgFlSgAf7913zav8c9LC42XULd6Dy+c3zy5qDXbElegIYX5c99RdgpFZBePMSsYl0Cb1+7Ey/aqlW8Y4kREIFGU3r8syA9LMXeHcpr5E46CZSK9voMHxX+zCi4BrsYNby2Rd4wkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnrJJ600; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnrJJ600"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736788584; x=1768324584;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6DKUGtuz3oR13/nWJrEvnw3OH80wM7Pdoa+eRKY65c0=;
  b=EnrJJ600HPFFBY3RLhQkZy72fYAQh4AHUhgrBUrI1E5A6v09n1n3QsFT
   cGoosOEBrqpFveiL952OxmdA6+/GCbLTmVKPYeMTZMvpPGIwpL2FIyfUT
   Kk3KGflzcKzJNpIis93+Pc/NHHszS77gRE0nsYIqJUTj2x5rZ9C7okDvm
   3jkNsn7t4lstbjlud4WF7yXpfuId80oJ20v6qIL67Ci9oktQSvH15gxZL
   qk4a0RKiX8sBf+mangzv8yBne6WLWQUYHGh6ROHXZSvvK3l7JKEc69pNp
   MluS20TIXcZY3KiTKoE/OXFMNEkRlirFN6bV9zcp9FHjOnhLtZ+EjCL1Z
   g==;
X-CSE-ConnectionGUID: INzZTGFKQ+2nV+R7+rXEXg==
X-CSE-MsgGUID: LIU62BdDTEiBL0zlp9i1Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36275931"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36275931"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:16:23 -0800
X-CSE-ConnectionGUID: XcEZ6PMSRcek4eR5Ga79Sw==
X-CSE-MsgGUID: +kdtJcrRQnq6aWke06+XOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104723121"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.121])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:16:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Jan 2025 19:16:16 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v2 08/10] platform: mellanox: mlx-platform:
 Add support for new Nvidia system
In-Reply-To: <20250113084337.24763-9-vadimp@nvidia.com>
Message-ID: <a9efd6b8-57b2-ec10-497a-86cfd0931fc9@linux.intel.com>
References: <20250113084337.24763-1-vadimp@nvidia.com> <20250113084337.24763-9-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Jan 2025, Vadim Pasternak wrote:

> Add support for SN5640 Nvidia switch.
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
> Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlx-platform.c | 95 ++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
> index 9d237852d3e0..5ede7eb5977d 100644
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
> +	.counter = ARRAY_SIZE(mlxplat_mlxcpld_ng800_hi171_items),
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
> @@ -7353,6 +7413,27 @@ static int __init mlxplat_dmi_smart_switch_matched(const struct dmi_system_id *d
>  	return mlxplat_register_platform_device();
>  }
>  
> +static int __init mlxplat_dmi_ng400_hi171_matched(const struct dmi_system_id *dmi)
> +{
> +	int i;
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
> +	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type3); i++)
> +		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type3[i];

A suggestion, I'd add empty lines around the for loop. As is, I get the 
"big wall of text" feeling out of all these consecutive initalization 
lines. Giving it a little bit of space would help to keep eyes tracking 
the correct line.

-- 
 i.


> +	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
> +	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
> +
> +	return mlxplat_register_platform_device();
> +}
> +
>  static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
>  	{
>  		.callback = mlxplat_dmi_default_wc_matched,
> @@ -7453,6 +7534,20 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
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
