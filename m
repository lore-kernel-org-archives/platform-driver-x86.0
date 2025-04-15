Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16002C1781
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Apr 2025 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729212; cv=none; b=W9llEmK1vFW8pTENqWt4OcZ7v39iiLvFyDXLPUaR7m3nTIb4mhbegqKeLh/zSkf1xolpHP9eRPJEGzpMSYzxR6+ioTP2oUaa1Sq3MHxedHrn2ifutYNmOuyxIrQ2a0sZbFaptkvtTK7J8NhIRAgycblbH2YpFHr6n9+dDwM7npg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729212; c=relaxed/simple;
	bh=Bf7EAW93QoCRFlQqHaQ5uVoS2rI4rVCbRyblV0CJZP8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pmUgi1KSlHj/DvmpWJbrRvJwc/3mIFOD9vcaeox7Tc20R54pUGA2i3g7MhjK/idDnlJU7+jTuaUZDNVuHK0wFELvcN9XJikmujFCnD2Bvllr3gs17vLypiklWU1Pg7MSVTsdFCLcGKXnS6oPG3ZhnM9RedWRbFNt2rLTeCHSiTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azao2IAN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azao2IAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744729210; x=1776265210;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Bf7EAW93QoCRFlQqHaQ5uVoS2rI4rVCbRyblV0CJZP8=;
  b=azao2IANfVeZqCtsYnRfEq8ppV+mAvq9HWyr6wgX8luql/6KuqSGEcyj
   zQHw811SnsfQwvvz1/h8/zsBMrpwaoH3x6GXUj31/K24gKQe03O1YZEbH
   JHv/85mQjAayA/Oq2lwlg5rACkpcJk5Bp1ia1mUNdkcz+It0mrIigqzDh
   /x1v7ss9njpIVKdpVkZGIs6gMDqc8kRC/C8OPtgR96+0MBoaaEiEnuITZ
   QKdBHgIJTNCgD/Tt4c93QI7vYPD+EIUguzA6Nx4tKSxbAhDp7V7A7unYr
   Zovn9zHp6BXqRaIuE6BP3paK7AW4/OAETa5RLNlqILpPgzr+v2/gXdsql
   A==;
X-CSE-ConnectionGUID: K0MhMmUMSUCT3YtWkYHl5g==
X-CSE-MsgGUID: B5iDprP/QDK7uuHyslYmEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48941446"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="48941446"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 08:00:09 -0700
X-CSE-ConnectionGUID: tiFfY84RTA+UFFyJXsYn4g==
X-CSE-MsgGUID: huO4XH83SE+bQgF/8pqYDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="131118303"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 08:00:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Apr 2025 18:00:02 +0300 (EEST)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v8 6/7] platform: mellanox: nvsw-sn2200:
 Add support for new system flavour
In-Reply-To: <20250412091843.33943-7-vadimp@nvidia.com>
Message-ID: <63a14a9c-86f9-9ee6-0b0c-470cc0e0a9b9@linux.intel.com>
References: <20250412091843.33943-1-vadimp@nvidia.com> <20250412091843.33943-7-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 12 Apr 2025, Vadim Pasternak wrote:

> Add support for SN2201 system flavour, which is fitting OCP rack
> form-factor and feeded from external power source through the rack
> standard busbar interface.
> 
> Validate system type through DMI decode.
> For new system flavour:
> - Skip internal power supply configuration.
> - Attach power hotswap device.
> 
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/nvsw-sn2201.c | 110 +++++++++++++++++++++++-
>  1 file changed, 107 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
> index 451d64c35c23..6f643e6ddb99 100644
> --- a/drivers/platform/mellanox/nvsw-sn2201.c
> +++ b/drivers/platform/mellanox/nvsw-sn2201.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/device.h>
> +#include <linux/dmi.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> @@ -104,6 +105,9 @@
>  	| NVSW_SN2201_CPLD_AGGR_PSU_MASK_DEF \
>  	| NVSW_SN2201_CPLD_AGGR_PWR_MASK_DEF \
>  	| NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF)
> +#define NVSW_SN2201_CPLD_AGGR_BUSBAR_MASK_DEF \
> +	(NVSW_SN2201_CPLD_AGGR_ASIC_MASK_DEF \
> +	| NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF)
>  
>  #define NVSW_SN2201_CPLD_ASIC_MASK		GENMASK(3, 1)
>  #define NVSW_SN2201_CPLD_PSU_MASK		GENMASK(1, 0)
> @@ -132,6 +136,7 @@
>   * @cpld_devs: I2C devices for cpld;
>   * @cpld_devs_num: number of I2C devices for cpld;
>   * @main_mux_deferred_nr: I2C adapter number must be exist prior creating devices execution;
> + * @ext_pwr_source: 1 if system powered by external power supply; 0 - by internal;
>   */
>  struct nvsw_sn2201 {
>  	struct device *dev;
> @@ -152,6 +157,7 @@ struct nvsw_sn2201 {
>  	struct mlxreg_hotplug_device *cpld_devs;
>  	int cpld_devs_num;
>  	int main_mux_deferred_nr;
> +	u8 ext_pwr_source;

Why is this u8? Wouldn't bool make more sense?

>  };
>  
>  static bool nvsw_sn2201_writeable_reg(struct device *dev, unsigned int reg)
> @@ -522,6 +528,35 @@ struct mlxreg_core_hotplug_platform_data nvsw_sn2201_hotplug = {
>  	.mask = NVSW_SN2201_CPLD_AGGR_MASK_DEF,
>  };
>  
> +static struct mlxreg_core_item nvsw_sn2201_busbar_items[] = {
> +	{
> +		.data = nvsw_sn2201_fan_items_data,
> +		.aggr_mask = NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF,
> +		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
> +		.mask = NVSW_SN2201_CPLD_FAN_MASK,
> +		.count = ARRAY_SIZE(nvsw_sn2201_fan_items_data),
> +		.inversed = 1,
> +		.health = false,
> +	},
> +	{
> +		.data = nvsw_sn2201_sys_items_data,
> +		.aggr_mask = NVSW_SN2201_CPLD_AGGR_ASIC_MASK_DEF,
> +		.reg = NVSW_SN2201_ASIC_STATUS_OFFSET,
> +		.mask = NVSW_SN2201_CPLD_ASIC_MASK,
> +		.count = ARRAY_SIZE(nvsw_sn2201_sys_items_data),
> +		.inversed = 1,
> +		.health = false,
> +	},
> +};
> +
> +static
> +struct mlxreg_core_hotplug_platform_data nvsw_sn2201_busbar_hotplug = {
> +	.items = nvsw_sn2201_items,
> +	.count = ARRAY_SIZE(nvsw_sn2201_busbar_items),
> +	.cell = NVSW_SN2201_SYS_INT_STATUS_OFFSET,
> +	.mask = NVSW_SN2201_CPLD_AGGR_BUSBAR_MASK_DEF,
> +};
> +
>  /* SN2201 static devices. */
>  static struct i2c_board_info nvsw_sn2201_static_devices[] = {
>  	{
> @@ -557,6 +592,9 @@ static struct i2c_board_info nvsw_sn2201_static_devices[] = {
>  	{
>  		I2C_BOARD_INFO("pmbus", 0x40),
>  	},
> +	{
> +		I2C_BOARD_INFO("lm5066i", 0x15),
> +	},
>  };
>  
>  /* SN2201 default static board info. */
> @@ -607,6 +645,58 @@ static struct mlxreg_hotplug_device nvsw_sn2201_static_brdinfo[] = {
>  	},
>  };
>  
> +/* SN2201 default basbar static board info. */
> +static struct mlxreg_hotplug_device nvsw_sn2201_busbar_static_brdinfo[] = {
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[0],
> +		.nr = NVSW_SN2201_MAIN_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[1],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[2],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[3],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[4],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH3_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[5],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[6],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[7],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[8],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH6_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[9],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH6_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[10],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH7_NR,
> +	},
> +	{
> +		.brdinfo = &nvsw_sn2201_static_devices[11],
> +		.nr = NVSW_SN2201_MAIN_MUX_CH1_NR,
> +	},
> +};
> +
>  /* LED default data. */
>  static struct mlxreg_core_data nvsw_sn2201_led_data[] = {
>  	{
> @@ -981,7 +1071,10 @@ static int nvsw_sn2201_config_init(struct nvsw_sn2201 *nvsw_sn2201, void *regmap
>  	nvsw_sn2201->io_data = &nvsw_sn2201_regs_io;
>  	nvsw_sn2201->led_data = &nvsw_sn2201_led;
>  	nvsw_sn2201->wd_data = &nvsw_sn2201_wd;
> -	nvsw_sn2201->hotplug_data = &nvsw_sn2201_hotplug;
> +	if (nvsw_sn2201->ext_pwr_source)
> +		nvsw_sn2201->hotplug_data = &nvsw_sn2201_busbar_hotplug;
> +	else
> +		nvsw_sn2201->hotplug_data = &nvsw_sn2201_hotplug;
>  
>  	/* Register IO access driver. */
>  	if (nvsw_sn2201->io_data) {
> @@ -1198,12 +1291,18 @@ static int nvsw_sn2201_config_pre_init(struct nvsw_sn2201 *nvsw_sn2201)
>  static int nvsw_sn2201_probe(struct platform_device *pdev)
>  {
>  	struct nvsw_sn2201 *nvsw_sn2201;
> +	const char *sku;
>  	int ret;
>  
>  	nvsw_sn2201 = devm_kzalloc(&pdev->dev, sizeof(*nvsw_sn2201), GFP_KERNEL);
>  	if (!nvsw_sn2201)
>  		return -ENOMEM;
>  
> +	/* Validate system powering type. */
> +	sku = dmi_get_system_info(DMI_PRODUCT_SKU);
> +	if (!strcmp(sku, "HI168"))

Will one entry suffice or should this be table based right from the start?

> +		nvsw_sn2201->ext_pwr_source = 1;
> +
>  	nvsw_sn2201->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, nvsw_sn2201);
>  	ret = platform_device_add_resources(pdev, nvsw_sn2201_lpc_io_resources,
> @@ -1214,8 +1313,13 @@ static int nvsw_sn2201_probe(struct platform_device *pdev)
>  	nvsw_sn2201->main_mux_deferred_nr = NVSW_SN2201_MAIN_MUX_DEFER_NR;
>  	nvsw_sn2201->main_mux_devs = nvsw_sn2201_main_mux_brdinfo;
>  	nvsw_sn2201->cpld_devs = nvsw_sn2201_cpld_brdinfo;
> -	nvsw_sn2201->sn2201_devs = nvsw_sn2201_static_brdinfo;
> -	nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_static_brdinfo);
> +	if (nvsw_sn2201->ext_pwr_source) {
> +		nvsw_sn2201->sn2201_devs = nvsw_sn2201_busbar_static_brdinfo;
> +		nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_busbar_static_brdinfo);
> +	} else {
> +		nvsw_sn2201->sn2201_devs = nvsw_sn2201_static_brdinfo;
> +		nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_static_brdinfo);
> +	}
>  
>  	return nvsw_sn2201_config_pre_init(nvsw_sn2201);
>  }
> 

Unrelated to this patch, .acpi_match_table is misindented in this file.

-- 
 i.

