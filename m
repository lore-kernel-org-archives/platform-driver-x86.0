Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D23B1DDC3E
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Apr 2025 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728501; cv=none; b=bYw8EsN2NL3r5xXpIahRJOILOEnt8lz2yUcjLfw3idDPLn+W0/UyDNmg2Oj7bUUPaGccAaMiHr+70wOF9pHsKzBSoKJ30rXWFgXWetodL0uvT6mai+SmYjHGRrethdy07hPf7rhXJgiuHNkYIjjg1WEQ0PkoXsHnukY3Mgu6w9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728501; c=relaxed/simple;
	bh=ei1PZdmYgvsIvMf9VWbeLciTHQH3qURfF06I0+sstkQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gpxkPrE3PnRZa1p2+io/iGdbKd8efpD8Kgxwo692a/m8BoWJwJQlEubKevCdkk5BOqQ/eatkoq+ovvR/XCQcnzroPDuKNao25J1NnQYDyssm9U3l8gpslvIdz93O9j6Fo0sDOgEX3qBXKZqcB/hfvH3JNbEHJCRkfrdOHKiOJ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbwgYQUy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbwgYQUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744728500; x=1776264500;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ei1PZdmYgvsIvMf9VWbeLciTHQH3qURfF06I0+sstkQ=;
  b=HbwgYQUyIXqnd71ruuxY/DumyG0CiK+85AKeAiEcTl2MxW1vta6yCbKN
   DGEJd+ko5KdOB5dOA0Er7ZNOMsNxVAfVwZi0rzn6HVTIGQICAltky3bsS
   sz8NqJxNjxRAi+UGM/dGg8EcRex3xplYYBGbitXQJ02dD103yhP1jYxBG
   8N+bCopaRrGhmVR8XfOW8+9DNblRQJUk9adlh+2YDNV1hER9luqnlXwBx
   IaVQxNndIy3X1ckyQkT27LNuAh6o3ZDOo808VdySJhrN206IYvlf60+MS
   OY2+F+Q3DD8J+bNE+EZAqEJsbMlsj2tftGuShnDcT7e9LqF04pgLc0xYE
   g==;
X-CSE-ConnectionGUID: 2vLtqHZsSXeshm/kAfpfrA==
X-CSE-MsgGUID: PF8MY17cS1yRECQsjAPoTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46122184"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46122184"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 07:48:14 -0700
X-CSE-ConnectionGUID: +1u3LhO5S3ycp9fMRXKU4w==
X-CSE-MsgGUID: FfceMNzdShKqdnYBD1K1zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="135317628"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 07:48:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Apr 2025 17:48:08 +0300 (EEST)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v8 5/7] platform: mellanox: mlx-platform:
 Add support for new Nvidia system
In-Reply-To: <20250412091843.33943-6-vadimp@nvidia.com>
Message-ID: <16fda223-a4e0-d5d2-7e2a-ee39e4af0260@linux.intel.com>
References: <20250412091843.33943-1-vadimp@nvidia.com> <20250412091843.33943-6-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 12 Apr 2025, Vadim Pasternak wrote:

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

There's quite much duplication and repetition in the above. Could you 
simplify such that most repetition is eliminated.

There also seems to be details that are pretty irrelevant from the point 
of view of this change and look more like marketting material. Please try 
to drop such extra details (why would the kernel care if it fits to 2U :-)).

> 
> Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v6->v7
> Changes added bt Vadim:
> - Remove 'capability_mask' field.
> 
> v5->v6
> Comments pointed out by Ilpo:
> - Change 'int' to 'unsigned int' in mlxplat_dmi_ng400_hi171_matched().
> 
> v2->v3
> Comments pointed out by Ilpo:
> - Add empty lines for visibility in mlxplat_dmi_ng400_hi171_matched().
> ---
>  drivers/platform/mellanox/mlx-platform.c | 96 ++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
> index 4c7ff22117a6..9b8b430070b6 100644
> --- a/drivers/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/mellanox/mlx-platform.c
> @@ -3000,6 +3000,59 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data = {
>  	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_PWR_BUT,
>  };
>  
> +/* Platform hotplug for next-generation 800G systems family data  */

"next-generation" is soon going to be the current and then past 
generation so preferrably avoid such wordings.

Other than that, the code change seemed fine.

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
> @@ -4486,6 +4539,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
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
> @@ -7312,6 +7371,29 @@ static int __init mlxplat_dmi_smart_switch_matched(const struct dmi_system_id *d
>  	return mlxplat_register_platform_device();
>  }
>  
> +static int __init mlxplat_dmi_ng400_hi171_matched(const struct dmi_system_id *dmi)
> +{
> +	unsigned int i;
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
> @@ -7412,6 +7494,20 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
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

