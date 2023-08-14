Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086E3C001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 13:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjHNNxe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 09:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbjHNNx2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 09:53:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455F4E6D
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692021207; x=1723557207;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pUPmszvT8E1pF5ogJSWFehyOtrG4mLMVLdK5jEbBIxw=;
  b=T+GxE+rVPeX/hbPu/1/6JT8wmdvLdZ9iAqK5AawvUpzJIvFx5gOooRBL
   pOIWZt/kF2FzKynkGR9EuS+VxKq2LaURqG/FHP961iOCHtKvQkXorl3Ho
   ugjdQYj1wmnPNAoSiVBwZOqI+ZxBET4hRdlWcLMG1fWrqdpfy5SuQooEF
   RJU2yUCwEuq7QLuBkXumSKsmm0nH3Fr7N41yDSCh0+DOLbU5L3EoZwXVW
   h8GFdgD5Pd+DieRSp2NsOOUt5tM4AD9X6H01wrtnojkCzpwbR/+/nMzcL
   Uzb95ajlRi9HMFsraIjU0xz4ciu/GRLL7E8uXEj/c6RVVVU959RYTFn3i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372036815"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="372036815"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="847666439"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="847666439"
Received: from lgarello-mobl.ger.corp.intel.com ([10.249.40.121])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:53:25 -0700
Date:   Mon, 14 Aug 2023 16:53:23 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next 12/16] platform: mellanox: mlx-platform:
 Get interrupt line through ACPI
In-Reply-To: <20230814085910.56069-13-vadimp@nvidia.com>
Message-ID: <6472b24-cd9a-4fde-5a0-881fb557fcb3@linux.intel.com>
References: <20230814085910.56069-1-vadimp@nvidia.com> <20230814085910.56069-13-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 14 Aug 2023, Vadim Pasternak wrote:

> Add support for getting system interrupt line from ACPI table.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index e2226c218a54..a70b86e60721 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -342,6 +342,7 @@
>   * @hotplug_resources: system hotplug resources
>   * @hotplug_resources_size: size of system hotplug resources
>   * @hi2c_main_init_status: init status of I2C main bus
> + * @irq_fpga: FPGA IRQ number
>   */
>  struct mlxplat_priv {
>  	struct platform_device *pdev_i2c;
> @@ -355,6 +356,7 @@ struct mlxplat_priv {
>  	struct resource *hotplug_resources;
>  	unsigned int hotplug_resources_size;
>  	u8 i2c_main_init_status;
> +	int irq_fpga;
>  };
>  
>  static struct platform_device *mlxplat_dev;
> @@ -6187,6 +6189,8 @@ static int mlxplat_post_init(struct mlxplat_priv *priv)
>  	/* Add hotplug driver */
>  	if (mlxplat_hotplug) {
>  		mlxplat_hotplug->regmap = priv->regmap;
> +		if (priv->irq_fpga)
> +			mlxplat_hotplug->irq = priv->irq_fpga;
>  		priv->pdev_hotplug =
>  		platform_device_register_resndata(&mlxplat_dev->dev,
>  						  "mlxreg-hotplug", PLATFORM_DEVID_NONE,
> @@ -6395,11 +6399,17 @@ static int mlxplat_probe(struct platform_device *pdev)
>  {
>  	unsigned int hotplug_resources_size = 0;
>  	struct resource *hotplug_resources = NULL;
> +	struct acpi_device *acpi_dev;
>  	struct mlxplat_priv *priv;
> -	int i, err;
> +	int irq_fpga = 0, i, err;
>  
> -	if (ACPI_COMPANION(&pdev->dev))
> +	acpi_dev = ACPI_COMPANION(&pdev->dev);
> +	if (acpi_dev) {

Just add this intermediate variable in the previous patch to have less 
churn in this patch.

-- 
 i.

> +		irq_fpga = acpi_dev_gpio_irq_get(acpi_dev, 0);
> +		if (irq_fpga < 0)
> +			return -ENODEV;
>  		mlxplat_dev = pdev;
> +	}
>  
>  	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
>  	if (err)
> @@ -6414,6 +6424,7 @@ static int mlxplat_probe(struct platform_device *pdev)
>  	platform_set_drvdata(mlxplat_dev, priv);
>  	priv->hotplug_resources = hotplug_resources;
>  	priv->hotplug_resources_size = hotplug_resources_size;
> +	priv->irq_fpga = irq_fpga;
>  
>  	if (!mlxplat_regmap_config)
>  		mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config;
> 
