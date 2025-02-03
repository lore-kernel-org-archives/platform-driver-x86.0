Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C67D205E05
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Feb 2025 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590766; cv=none; b=kVv3FzJw0KU6Ddi1ZJsboxEHDRsK+xkMs/kKurnwyTdG8qQRzXWjpMKz0OsyYcnAQD4VaRQC3l7BMal+LaTZT9jPTsedEmpH8D+xVr+s0PKonFixQowJPM+rgRRv3R4kV1p9Jg5nevb+DK1yVgJ/1IE7fGetV3vLLVkRUhqSesw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590766; c=relaxed/simple;
	bh=vgPgfTNj8kIIfU1F04woviNduELfJIPAoMVMta2+x6c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ikhEgIxvWcYE+gvTeb++3GuTso7MOxpKFtPZ/OammxxyfUJHUkNeNnaKOJSTjQSLcwdTyyrWBaAwm5PI/KG387f1O27uJc7wXZ6mYXbXaw/IEBAqYohIJ8TnthVfG9Tull7AnuKDWqgecCyEdGRKGe81YublERbhx54Iv87ePyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSdjMbsp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSdjMbsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738590764; x=1770126764;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vgPgfTNj8kIIfU1F04woviNduELfJIPAoMVMta2+x6c=;
  b=fSdjMbspDyBgi9IXkDdUhSMK/ZNtomkFMroP3CY4dIfRaKFJ/2zJLP6K
   CoRvFzXTifMOuw0alhhL2QPBQOFcecvYmYSSe/i7n7ynwbnfZJeEUEzbW
   xaDhFdMH8g7HTthDKnPNeRgZ1qBU+g+XAhionkcDNJ8WGzOB8xwEF1vWt
   mV0Ph8Zn49FSrI5hjYnbFEkIuEHmsVCXju3dTM6gwT0muxI+iVxqnvSdt
   yOh1nWmTN3+Ic7H7MgYmn+9kc0nL3qInLtAG+cRud0HeDPyw4+h+q9vOc
   hwkRbKJOUy5XEFn0IbVap4iIjseGf+48JyoVEIT5JqqQipOcXfHSw+bNJ
   Q==;
X-CSE-ConnectionGUID: 2t66Uj/rQoKV1glLBuDHuw==
X-CSE-MsgGUID: XXTUw3yJQL2xOfnS4paRNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38289340"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38289340"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:52:43 -0800
X-CSE-ConnectionGUID: NgA8hNpKSBSyaP3t4ayRpA==
X-CSE-MsgGUID: IzJ8pEM2QOKKQf+DWgCeYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111145287"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:52:39 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 15:52:36 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 06/12] platform/mellanox: Rename field to improve code
 readability
In-Reply-To: <20250124172632.22437-7-vadimp@nvidia.com>
Message-ID: <9e8c020a-618e-db44-45fe-dd2ac965bf8e@linux.intel.com>
References: <20250124172632.22437-1-vadimp@nvidia.com> <20250124172632.22437-7-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Jan 2025, Vadim Pasternak wrote:

> Rename field 'item' in structure 'mlxreg_core_item' to 'count'.
> Rename field 'counter' in 'mlxreg_core_hotplug_platform_data' to count.

You only seem to rename in one struct now?? And not renaming a field named 
'item'.

> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v4->v5
> Comments pointed out by Ilpo:
> - Fix misspelling in submit text.
> - Fix structures names to 'count'.
> ---
>  drivers/platform/mellanox/mlx-platform.c   | 26 +++++++++++-----------
>  drivers/platform/mellanox/mlxreg-hotplug.c |  8 +++----
>  drivers/platform/mellanox/nvsw-sn2201.c    |  2 +-
>  include/linux/platform_data/mlxreg.h       |  4 ++--
>  4 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
> index bd3bb06ff8f2..2334b740267c 100644
> --- a/drivers/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/mellanox/mlx-platform.c
> @@ -852,7 +852,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_data = {
>  	.items = mlxplat_mlxcpld_default_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_default_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -892,7 +892,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_wc_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_wc_data = {
>  	.items = mlxplat_mlxcpld_default_wc_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_wc_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_default_wc_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -902,7 +902,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_wc_data = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_comex_data = {
>  	.items = mlxplat_mlxcpld_comex_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_comex_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_comex_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_CARR_DEF,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRCX_OFFSET,
> @@ -949,7 +949,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn21xx_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn21xx_data = {
>  	.items = mlxplat_mlxcpld_msn21xx_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -1058,7 +1058,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn274x_data = {
>  	.items = mlxplat_mlxcpld_msn274x_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -1105,7 +1105,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn201x_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn201x_data = {
>  	.items = mlxplat_mlxcpld_msn201x_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -1229,7 +1229,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_ng_data = {
>  	.items = mlxplat_mlxcpld_default_ng_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -1389,7 +1389,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
>  	.items = mlxplat_mlxcpld_ext_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_ext_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -1399,7 +1399,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ng800_data = {
>  	.items = mlxplat_mlxcpld_ng800_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_ng800_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_ng800_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -2240,7 +2240,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_modular_data = {
>  	.items = mlxplat_mlxcpld_modular_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_modular_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_MODULAR,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -2272,7 +2272,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_chassis_blade_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_chassis_blade_data = {
>  	.items = mlxplat_mlxcpld_chassis_blade_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_COMEX,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -2363,7 +2363,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_rack_switch_data = {
>  	.items = mlxplat_mlxcpld_rack_switch_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_rack_switch_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_rack_switch_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> @@ -2518,7 +2518,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data = {
>  	.items = mlxplat_mlxcpld_l1_switch_events_items,
> -	.counter = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_events_items),
> +	.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_events_items),
>  	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
>  	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index c525b8754d48..5e143a18c654 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -262,7 +262,7 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
>  	item = pdata->items;
>  
>  	/* Go over all kinds of items - psu, pwr, fan. */
> -	for (i = 0; i < pdata->counter; i++, item++) {
> +	for (i = 0; i < pdata->count; i++, item++) {
>  		if (item->capability) {
>  			/*
>  			 * Read group capability register to get actual number
> @@ -559,7 +559,7 @@ static void mlxreg_hotplug_work_handler(struct work_struct *work)
>  		goto unmask_event;
>  
>  	/* Handle topology and health configuration changes. */
> -	for (i = 0; i < pdata->counter; i++, item++) {
> +	for (i = 0; i < pdata->count; i++, item++) {
>  		if (aggr_asserted & item->aggr_mask) {
>  			if (item->health)
>  				mlxreg_hotplug_health_work_helper(priv, item);
> @@ -608,7 +608,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
>  	pdata = dev_get_platdata(&priv->pdev->dev);
>  	item = pdata->items;
>  
> -	for (i = 0; i < pdata->counter; i++, item++) {
> +	for (i = 0; i < pdata->count; i++, item++) {
>  		/* Clear group presense event. */
>  		ret = regmap_write(priv->regmap, item->reg +
>  				   MLXREG_HOTPLUG_EVENT_OFF, 0);
> @@ -692,7 +692,7 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
>  		     0);
>  
>  	/* Clear topology configurations. */
> -	for (i = 0; i < pdata->counter; i++, item++) {
> +	for (i = 0; i < pdata->count; i++, item++) {
>  		data = item->data;
>  		/* Mask group presense event. */
>  		regmap_write(priv->regmap, data->reg + MLXREG_HOTPLUG_MASK_OFF,
> diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
> index abe7be602f84..451d64c35c23 100644
> --- a/drivers/platform/mellanox/nvsw-sn2201.c
> +++ b/drivers/platform/mellanox/nvsw-sn2201.c
> @@ -517,7 +517,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
>  static
>  struct mlxreg_core_hotplug_platform_data nvsw_sn2201_hotplug = {
>  	.items = nvsw_sn2201_items,
> -	.counter = ARRAY_SIZE(nvsw_sn2201_items),
> +	.count = ARRAY_SIZE(nvsw_sn2201_items),
>  	.cell = NVSW_SN2201_SYS_INT_STATUS_OFFSET,
>  	.mask = NVSW_SN2201_CPLD_AGGR_MASK_DEF,
>  };
> diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
> index d9f679752226..20f84cf629af 100644
> --- a/include/linux/platform_data/mlxreg.h
> +++ b/include/linux/platform_data/mlxreg.h
> @@ -217,7 +217,7 @@ struct mlxreg_core_platform_data {
>   * @items: same type components with the hotplug capability;
>   * @irq: platform interrupt number;
>   * @regmap: register map of parent device;
> - * @counter: number of the components with the hotplug capability;
> + * @count: number of the components with the hotplug capability;
>   * @cell: location of top aggregation interrupt register;
>   * @mask: top aggregation interrupt common mask;
>   * @cell_low: location of low aggregation interrupt register;
> @@ -232,7 +232,7 @@ struct mlxreg_core_hotplug_platform_data {
>  	struct mlxreg_core_item *items;
>  	int irq;
>  	void *regmap;
> -	int counter;
> +	int count;
>  	u32 cell;
>  	u32 mask;
>  	u32 cell_low;
> 

-- 
 i.

