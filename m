Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC980C001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 13:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjHNNtp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 09:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbjHNNtf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 09:49:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776D2E7D
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 06:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692020974; x=1723556974;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UeKnuRFBnqxDs8uCdmrNp5gTwTEj070GhvIrksUhNeg=;
  b=QJtYoQ/2pWl4GToYV2zEOPFjmA8wzov2gYBw/jGC+SxBkSpNlC+DR4uo
   1c35xoHnA8UEP2i0G1L3+spp+tctARo6w4DYxDPZHqPP+BOo7Im2mWwMV
   so4ZV1Ator078Zy76qyyMA7DKZ4hn7/TNA8hU6Pm83TTJpRk4hftd/umX
   i6TLxCiRZZU1L39YizTGjVvN7WPLFqs3WnEJ9jXXvOtEDElcwtg6TG8yZ
   ekcvVDm9MrO9WxxW079VFomfKmzufWWUj3sk9w3k0i86xAm6KrR+6fvQD
   gVyj3//Twf30sifFqQC9VZ/EYS+8VaMh6E046j0GQaecr8pjfY6HZw9m2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="369511002"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="369511002"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="798820874"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="798820874"
Received: from lgarello-mobl.ger.corp.intel.com ([10.249.40.121])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:49:32 -0700
Date:   Mon, 14 Aug 2023 16:49:30 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next 09/16] platform: mellanox: mlx-platform:
 Add reset callback
In-Reply-To: <20230814085910.56069-10-vadimp@nvidia.com>
Message-ID: <934fcbe3-9f5b-e84b-106b-50aa1a15cfdd@linux.intel.com>
References: <20230814085910.56069-1-vadimp@nvidia.com> <20230814085910.56069-10-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 14 Aug 2023, Vadim Pasternak wrote:

> On L1 switches reset should include special actions against CPLD device
> for performing graceful operations.
> For that purpose, special PLATFORM_RESET# signal should be indicated.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 45 +++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 1010064d54e9..b577ce572ab1 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -35,6 +35,7 @@
>  #define MLXPLAT_CPLD_LPC_REG_CPLD3_PN1_OFFSET	0x09
>  #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET	0x0a
>  #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET	0x0b
> +#define MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET	0x17
>  #define MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET	0x19
>  #define MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET	0x1c
>  #define MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET	0x1d
> @@ -265,6 +266,7 @@
>  #define MLXPLAT_CPLD_LPC_LC_MASK	GENMASK(7, 0)
>  
>  #define MLXPLAT_CPLD_HALT_MASK		BIT(3)
> +#define MLXPLAT_CPLD_RESET_MASK		0xfe

GENMASK()

>  /* Default I2C parent bus number */
>  #define MLXPLAT_CPLD_PHYS_ADAPTER_DEF_NR	1
> @@ -441,6 +443,7 @@ static struct i2c_mux_reg_platform_data mlxplat_default_mux_data[] = {
>  static int mlxplat_max_adap_num;
>  static int mlxplat_mux_num;
>  static struct i2c_mux_reg_platform_data *mlxplat_mux_data;
> +static struct notifier_block *mlxplat_reboot_nb;
>  
>  /* Platform extended mux data */
>  static struct i2c_mux_reg_platform_data mlxplat_extended_mux_data[] = {
> @@ -2361,8 +2364,11 @@ static int
>  mlxplat_mlxcpld_l1_switch_pwr_events_handler(void *handle, enum mlxreg_hotplug_kind kind,
>  					     u8 action)
>  {
> -	dev_info(&mlxplat_dev->dev, "System shutdown due to short press of power button");
> -	kernel_power_off();
> +	if (action) {
> +		dev_info(&mlxplat_dev->dev, "System shutdown due to short press of power button");
> +		kernel_power_off();
> +	}
> +
>  	return 0;
>  }
>  
> @@ -4957,6 +4963,7 @@ static struct mlxreg_core_platform_data mlxplat_mlxcpld_wd_set_type3[] = {
>  static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
>  {
>  	switch (reg) {
> +	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_LED1_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_LED2_OFFSET:
> @@ -5065,6 +5072,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
>  	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
> +	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
> @@ -5229,6 +5237,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
>  	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
> +	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
>  	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
> @@ -5533,11 +5542,33 @@ static struct mlxreg_core_platform_data
>  	*mlxplat_wd_data[MLXPLAT_CPLD_WD_MAX_DEVS];
>  static const struct regmap_config *mlxplat_regmap_config;
>  
> +/* Platform default reset function */
> +static int mlxplat_reboot_notifier(struct notifier_block *nb, unsigned long action, void *unused)
> +{
> +	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
> +	u32 regval;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET, &regval);
> +
> +	if (action == SYS_RESTART && !ret && regval & BIT(0))

Use a named define instead of BIT(0) here.

-- 
 i.


> +		regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET,
> +			     MLXPLAT_CPLD_RESET_MASK);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block mlxplat_reboot_default_nb = {
> +	.notifier_call = mlxplat_reboot_notifier,
> +};
> +
>  /* Platform default poweroff function */
>  static void mlxplat_poweroff(void)
>  {
>  	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
>  
> +	if (mlxplat_reboot_nb)
> +		unregister_reboot_notifier(mlxplat_reboot_nb);
>  	regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET, MLXPLAT_CPLD_HALT_MASK);
>  	kernel_halt();
>  }
> @@ -5861,6 +5892,7 @@ static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
>  	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
>  	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_rack_switch;
>  	pm_power_off = mlxplat_poweroff;
> +	mlxplat_reboot_nb = &mlxplat_reboot_default_nb;
>  
>  	return 1;
>  }
> @@ -6410,8 +6442,15 @@ static int __init mlxplat_init(void)
>  	if (err)
>  		goto fail_regcache_sync;
>  
> +	if (mlxplat_reboot_nb) {
> +		err = register_reboot_notifier(mlxplat_reboot_nb);
> +		if (err)
> +			goto fail_register_reboot_notifier;
> +	}
> +
>  	return 0;
>  
> +fail_register_reboot_notifier:
>  fail_regcache_sync:
>  	mlxplat_pre_exit(priv);
>  fail_mlxplat_i2c_main_init:
> @@ -6429,6 +6468,8 @@ static void __exit mlxplat_exit(void)
>  
>  	if (pm_power_off)
>  		pm_power_off = NULL;
> +	if (mlxplat_reboot_nb)
> +		unregister_reboot_notifier(mlxplat_reboot_nb);
>  	mlxplat_pre_exit(priv);
>  	mlxplat_i2c_main_exit(priv);
>  	mlxplat_post_exit();
> 
