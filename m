Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D139449B
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jan 2026 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481230; cv=none; b=VhNXE+KSbtcZswj5dJzqmqZqGsipG5RsRoN7dZ+/pA/vKKXk2c3Sj1quUXzXlk5ZNtkTxKuqkikyRZamEZqOSdx2NCFReJ/zIUIGj3658InpnaKAif2iPs12f6aapRjTagSyr6l7SQOuUVoLpW3qcENOc94vOHc+8bgQyfxpSaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481230; c=relaxed/simple;
	bh=EW+N1XuOb1MAKQb/dWgdFM/A4kFIQo3tGfX2gu7l1sk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QUVo/uLcbMPOf9Bnq0zd4/wOb0XlsyhNOfEZuIFqmADRoEkRAhsGpucXvQKzsXbsaHLs+wEAdxowpB1wqZ5bn6eFzgTiuFbmc6PxDJ77SaU//W1xQYapDH92zE9Dr6lKwk/23VAviSBTQMKW6FkN/3NiO19IXmm8sdY2M35Jrs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxvQdWZo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxvQdWZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768481228; x=1800017228;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EW+N1XuOb1MAKQb/dWgdFM/A4kFIQo3tGfX2gu7l1sk=;
  b=TxvQdWZoXCuZD3Cp5yV0QjMxSmrjtS5oDbm95GVsQtt6irw8UTtTaQYS
   uVmK8yX2gjyc6Mjn762NoihA+x7PEqy4b44DSl4ErcmQnUl8eExiONbeP
   zVmlHTSTIx6B9h2R1z/qkbBY1Fmcj88yiuBQtN1ixUdZutwhQDDcPAGsS
   Q8cJAd1BluU/BUyXJF3+WKNuxWeBxvx0giSr1LjlEx3Xd7IRsD7KaanmQ
   gqklJ7CLzL0fhyEiitR3fhJkERpSF5EEWyJu5xGFmLaTuSh7zsl7Xbmhf
   BGe7nXtXYW//PES4KGmqhsC/RFxgQngX54f+q0U7jhmphYJwp5eI62cQm
   Q==;
X-CSE-ConnectionGUID: 5FSOgkYIR5q2aRLmvs9EBw==
X-CSE-MsgGUID: Pm2WmfI5TkSUa6B33K/QaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="87197024"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="87197024"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:47:07 -0800
X-CSE-ConnectionGUID: Q/dziR4ZTW26WZy0jhaQtQ==
X-CSE-MsgGUID: L82KTElTSyG1PJ8ZFPqlxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204568067"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:47:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 14:47:02 +0200 (EET)
To: Oleksandr Shamray <oleksandrs@nvidia.com>
cc: hdegoede@redhat.com, vadimp@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform: mellanox: mlx-platform: Add support for
 new Nvidia DGX system based on class VMOD0010
In-Reply-To: <20260107141417.913935-2-oleksandrs@nvidia.com>
Message-ID: <3b9b8a5e-2f51-2fe4-5af7-d617eadb8742@linux.intel.com>
References: <20260107141417.913935-1-oleksandrs@nvidia.com> <20260107141417.913935-2-oleksandrs@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Jan 2026, Oleksandr Shamray wrote:

> This system is based on Nvidia QM9700 64x400G QTM-2 switch, with the
> following key changes:
> 
> Key changes:
>   1.Power Supply: Rack busbar input power ORv3 DC 48V-54V
>   2.Dimensions MGX/DGX 1U compliance
> 
> Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlx-platform.c | 454 +++++++++++++++++++++++
>  1 file changed, 454 insertions(+)
> 
> diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
> index d0df18be93c7..14b3adf870e7 100644
> --- a/drivers/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/mellanox/mlx-platform.c
> @@ -727,6 +727,16 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_psu_items_data[] = {
>  	},
>  };
>  
> +/* Platform hotplug dgx data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_dgx_pdb_items_data[] = {
> +	{
> +		.label = "pdb1",
> +		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +		.mask = BIT(0),

+ include.

There seems to some missing includes in this file (a pre-existing 
problem, I know). Please go through what you add and make sure you've the 
required header included directly by this file, thanks.

> +		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
> +	},
> +};
> +
>  static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_items_data[] = {
>  	{
>  		.label = "pwr1",
> @@ -776,6 +786,15 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_ng800_items_data[] =
>  	},
>  };
>  
> +static struct mlxreg_core_data mlxplat_mlxcpld_dgx_pwr_items_data[] = {
> +	{
> +		.label = "pwr1",
> +		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +		.mask = BIT(0),
> +		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
> +	},
> +};
> +
>  static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_items_data[] = {
>  	{
>  		.label = "fan1",
> @@ -1399,6 +1418,45 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
>  	}
>  };
>  
> +static struct mlxreg_core_item mlxplat_mlxcpld_ext_dgx_items[] = {
> +	{
> +		.data = mlxplat_mlxcpld_dgx_pdb_items_data,
> +		.aggr_mask = MLXPLAT_CPLD_AGGR_PSU_MASK_DEF,
> +		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +		.mask = MLXPLAT_CPLD_PSU_MASK,
> +		.count = ARRAY_SIZE(mlxplat_mlxcpld_dgx_pdb_items_data),

+ include.

> +		.inversed = 1,
> +		.health = false,
> +	},
> +	{
> +		.data = mlxplat_mlxcpld_dgx_pwr_items_data,
> +		.aggr_mask = MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
> +		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +		.mask = MLXPLAT_CPLD_PWR_MASK,
> +		.count = ARRAY_SIZE(mlxplat_mlxcpld_dgx_pwr_items_data),
> +		.inversed = 0,
> +		.health = false,
> +	},
> +	{
> +		.data = mlxplat_mlxcpld_default_ng_fan_items_data,
> +		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
> +		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
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
>  static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
>  	{
>  		.data = mlxplat_mlxcpld_default_ng_psu_items_data,
> @@ -1450,6 +1508,16 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
>  	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,
>  };
>  
> +static
> +struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_dgx_ext_data = {
> +	.items = mlxplat_mlxcpld_ext_dgx_items,
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_dgx_items),
> +	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
> +	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
> +	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> +	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,
> +};
> +
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ng800_data = {
>  	.items = mlxplat_mlxcpld_ng800_items,
> @@ -4625,6 +4693,359 @@ static struct mlxreg_core_platform_data mlxplat_default_ng_regs_io_data = {
>  		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_regs_io_data),
>  };
>  
> +/* Platform register access for next generation systems families data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_dgx_ng_regs_io_data[] = {
> +	{
> +		.label = "cpld1_version",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
> +		.bit = GENMASK(7, 0),

This include too is missing but it will be the same as for BIT().

--
 i.

> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld2_version",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_VER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld3_version",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld4_version",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD4_VER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld1_pn",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET,
> +		.bit = GENMASK(15, 0),
> +		.mode = 0444,
> +		.regnum = 2,
> +	},
> +	{
> +		.label = "cpld2_pn",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET,
> +		.bit = GENMASK(15, 0),
> +		.mode = 0444,
> +		.regnum = 2,
> +	},
> +	{
> +		.label = "cpld3_pn",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET,
> +		.bit = GENMASK(15, 0),
> +		.mode = 0444,
> +		.regnum = 2,
> +	},
> +	{
> +		.label = "cpld4_pn",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET,
> +		.bit = GENMASK(15, 0),
> +		.mode = 0444,
> +		.regnum = 2,
> +	},
> +	{
> +		.label = "cpld1_version_min",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld2_version_min",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld3_version_min",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "cpld4_version_min",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CPLD4_MVER_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "asic_reset",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "reset_long_pb",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_short_pb",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(1),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_aux_pwr_or_ref",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(2),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_swb_dc_dc_pwr_fail",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_from_asic",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(5),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_swb_wd",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(6),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_asic_thermal",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(7),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_sw_reset",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_comex_pwr_fail",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_platform",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(4),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_soc",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(5),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_comex_wd",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(6),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_system",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(1),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_sw_pwr_off",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(2),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_comex_thermal",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_reload_bios",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(5),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "reset_pdb_pwr_fail",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(6),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "pdb_reset_stby",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(0),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "pwr_cycle",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(2),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "pwr_down",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "deep_pwr_cycle",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(5),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "latch_reset",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(6),
> +		.mode = 0200,
> +	},
> +	{
> +		.label = "jtag_cap",
> +		.reg = MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET,
> +		.mask = MLXPLAT_CPLD_FU_CAP_MASK,
> +		.bit = 1,
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "jtag_enable",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(4),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "dbg1",
> +		.reg = MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "dbg2",
> +		.reg = MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "dbg3",
> +		.reg = MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "dbg4",
> +		.reg = MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "asic_health",
> +		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
> +		.mask = MLXPLAT_CPLD_ASIC_MASK,
> +		.bit = 1,
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "fan_dir",
> +		.reg = MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "bios_safe_mode",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(4),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "bios_active_image",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(5),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "bios_auth_fail",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(6),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "bios_upgrade_fail",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(7),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "voltreg_update_status",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
> +		.mask = MLXPLAT_CPLD_VOLTREG_UPD_MASK,
> +		.bit = 5,
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "pwr_converter_prog_en",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(0),
> +		.mode = 0644,
> +		.secured = 1,
> +	},
> +	{
> +		.label = "vpd_wp",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(3),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "pcie_asic_reset_dis",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(4),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "shutdown_unlock",
> +		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(5),
> +		.mode = 0644,
> +	},
> +	{
> +		.label = "config1",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "config2",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "config3",
> +		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +	{
> +		.label = "ufm_version",
> +		.reg = MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
> +		.bit = GENMASK(7, 0),
> +		.mode = 0444,
> +	},
> +};
> +
> +static struct mlxreg_core_platform_data mlxplat_dgx_ng_regs_io_data = {
> +		.data = mlxplat_mlxcpld_dgx_ng_regs_io_data,
> +		.counter = ARRAY_SIZE(mlxplat_mlxcpld_dgx_ng_regs_io_data),
> +};
> +
>  /* Platform register access for modular systems families data */
>  static struct mlxreg_core_data mlxplat_mlxcpld_modular_regs_io_data[] = {
>  	{
> @@ -7239,6 +7660,32 @@ static int __init mlxplat_dmi_ng400_matched(const struct dmi_system_id *dmi)
>  	return mlxplat_register_platform_device();
>  }
>  
> +static int __init mlxplat_dmi_ng400_dgx_matched(const struct dmi_system_id *dmi)
> +{
> +	int i;
> +
> +	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
> +	mlxplat_mux_num = ARRAY_SIZE(mlxplat_default_mux_data);
> +	mlxplat_mux_data = mlxplat_default_mux_data;
> +	for (i = 0; i < mlxplat_mux_num; i++) {
> +		mlxplat_mux_data[i].values = mlxplat_msn21xx_channels;
> +		mlxplat_mux_data[i].n_values =
> +				ARRAY_SIZE(mlxplat_msn21xx_channels);
> +	}
> +	mlxplat_hotplug = &mlxplat_mlxcpld_dgx_ext_data;
> +	mlxplat_hotplug->deferred_nr =
> +		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
> +	mlxplat_led = &mlxplat_default_ng_led_data;
> +	mlxplat_regs_io = &mlxplat_dgx_ng_regs_io_data;
> +	mlxplat_fan = &mlxplat_default_fan_data;
> +	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
> +		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
> +	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
> +	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
> +
> +	return mlxplat_register_platform_device();
> +}
> +
>  static int __init mlxplat_dmi_modular_matched(const struct dmi_system_id *dmi)
>  {
>  	int i;
> @@ -7458,6 +7905,13 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
>  			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI142"),
>  		},
>  	},
> +	{
> +		.callback = mlxplat_dmi_ng400_dgx_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "VMOD0010"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI173"),
> +		},
> +	},
>  	{
>  		.callback = mlxplat_dmi_ng400_matched,
>  		.matches = {
> 
