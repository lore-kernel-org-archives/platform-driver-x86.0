Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47563321AC
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Jan 2026 14:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437643; cv=none; b=PPiBDphLEAawIXmJlPto67e47X6tnTyO0dofkr0dJbWyNVGHzUpICskuwIA9I4ahBNvFptM3SVUDwMzLxqoTwTIdYVu3BCpVx3Zg59Z5dYBAA9HmhFMLv+FOhPQabBBMu11wfyakUnPfg7OFhgID81HyZaP1EzpHQJP6L9I96WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437643; c=relaxed/simple;
	bh=1Dg4ULI9n29Hwnc4AH5g/huwfTiH6lGh0HF+j61if4U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mCPXRYEuTN/shuTmxVyEdbMoBaebNcxRdc04DSKqLoCe5KmO9+Z+bKmUmpFBVhO0BPTturXgd4XEqScU3Pk7OWyt7HjIRs57TBmoi+J83o4dqgcx8ahmRIfeNv3qCOpUTxM2mXfSjnRRW9G2w6RAK+7kpHvP9emJH3kDd5PcdX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMZNISCW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMZNISCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769437642; x=1800973642;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1Dg4ULI9n29Hwnc4AH5g/huwfTiH6lGh0HF+j61if4U=;
  b=bMZNISCWovu3BTqSM0S+at8+5V/JyLMsdUiRmWLz4m+YD/QK5G3G5vWq
   A+K594ZpEJr9E4+7QaG976SYPtqhs+nu5v096r0etVDDIUIEfb9eo2Rbq
   RghxIxsElcra02OTLE+CwP61XX/7G62QcjC5fNexwg6IluNHbmPwSjSGq
   tbPBtvV2vK0qOcGG9HnwhFRQ7ljZsB4wWNpWP7VzzcYGkBOfbNbDBInG8
   zg2iF7GuYGaotx2P0IWtzpVPRtSxnyc7pqbz9bzPAfATVXgXKxuKSbCvE
   YN0yi1KO5/ghz8yXm3cxKAT02azICf3ca2rEo1znl2pb60KiqU8ZFy4xx
   w==;
X-CSE-ConnectionGUID: w0JRigSjQL2NLlJKx7pKNw==
X-CSE-MsgGUID: CGWRceu0RBih92eJ8HRIfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70581559"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70581559"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:27:22 -0800
X-CSE-ConnectionGUID: 9ECZphkWSCaUSg/wNzBkaw==
X-CSE-MsgGUID: ++Aj1yf8RJCaL9fFm04oVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212162326"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:27:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Jan 2026 16:27:16 +0200 (EET)
To: Oleksandr Shamray <oleksandrs@nvidia.com>
cc: vadimp@nvidia.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform: mellanox: mlx-platform: Add support DGX
 flavor of next-generation 800GB/s ethernet switch.
In-Reply-To: <20260121145214.4021631-3-oleksandrs@nvidia.com>
Message-ID: <6e44e65c-aa52-1101-1dbe-9bd5f71a9d75@linux.intel.com>
References: <20260121145214.4021631-1-oleksandrs@nvidia.com> <20260121145214.4021631-3-oleksandrs@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Jan 2026, Oleksandr Shamray wrote:

> This system is based on Nvidia SN5600 Spectrum-4 Based 64x800Gb/s ETH Switch System, with the
> following key changes:
> 
> Key changes:
> - New Power Supply: AC/DC PSUs power replaced by rack busbar input power ORv3 DC 48V-54V.
> - Dimensions MGX/DGX 1U compliance Tool-less top cover

Same question here as with patch 1?

-- 
 i.

> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
> ---
>  drivers/platform/mellanox/mlx-platform.c | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
> index af0c6f4e8c12..1d1b7caef5f0 100644
> --- a/drivers/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/mellanox/mlx-platform.c
> @@ -7772,6 +7772,27 @@ static int __init mlxplat_dmi_ng800_matched(const struct dmi_system_id *dmi)
>  	return mlxplat_register_platform_device();
>  }
>  
> +static int __init mlxplat_dmi_ng800_dgx_matched(const struct dmi_system_id *dmi)
> +{
> +	int i;
> +
> +	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
> +	mlxplat_mux_num = ARRAY_SIZE(mlxplat_ng800_mux_data);
> +	mlxplat_mux_data = mlxplat_ng800_mux_data;
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
>  static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
>  {
>  	int i;
> @@ -7926,6 +7947,13 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_BOARD_NAME, "VMOD0011"),
>  		},
>  	},
> +	{
> +		.callback = mlxplat_dmi_ng800_dgx_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "VMOD0013"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI174"),
> +		},
> +	},
>  	{
>  		.callback = mlxplat_dmi_ng800_matched,
>  		.matches = {
> 
