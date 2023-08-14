Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66622C001B0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 14:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjHNONx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 10:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232322AbjHNONa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 10:13:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A96198E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 07:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692022390; x=1723558390;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NKbwb5L8wx+Ah4pGQ3sz7JqZwrZvsSX7GAiSc6f7WvU=;
  b=kZlqiicnjcdZpjYHOD+IoB1GOfPLwaEKAaNt5oZcX7oHA8vWIKBMblvD
   m7GMPjsf4ByZOGt74RKKhafJG2osPxcXJ1EmlapYo0B5Vzgri5b7Y5zHc
   S8onxMtEPeRyPOoLVqUPZ+EK4KQMQldgMAnNcdRo/Md3R2LTReEfAp7gO
   vwdVtFJJ1ifLvP8Ae4oo1e4pcV/veClS+sX4rwGznYsHAa3S5WhW25kil
   KirnZO4FO8pqfT6NerWiISnGX0jjPpWCPZ6F4i0V1irYHlNvsS0c/PIT5
   XGfVHpt85Q5I8bWA0IwO1Im2kIY9G+HmXo3xbVe7Tfe4ZRbtAXhLhdPBr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372040175"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="372040175"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 07:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803471330"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="803471330"
Received: from lgarello-mobl.ger.corp.intel.com ([10.249.40.121])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 07:07:40 -0700
Date:   Mon, 14 Aug 2023 17:07:37 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next 13/16] platform: mellanox: Add initial
 support for PCIe based programming logic device
In-Reply-To: <20230814085910.56069-14-vadimp@nvidia.com>
Message-ID: <e742d08e-1135-0c4-39cd-5e88ab642833@linux.intel.com>
References: <20230814085910.56069-1-vadimp@nvidia.com> <20230814085910.56069-14-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 14 Aug 2023, Vadim Pasternak wrote:

> Extend driver to support logic implemented by FPGA device connected
> through PCIe bus.
> 
> The motivation two support new generation of Nvidia COME module
> equipped with Lattice LFD2NX-40 FPGA device.
> 
> In order to support new Nvidia COME module FPGA device driver
> initialization flow is modified. In case FPGA device is detected,
> system resources are to be mapped to this device, otherwise system
> resources are to be mapped same as it has been done before for Lattice
> LPC based CPLD.
> 
> FPGA device is associated with three PCIe devices:
> - PCIe-LPC bridge for main register space access.
> - PCIe-I2C bridge for I2C controller access.
> - PCIe-JTAG bridge for JTAG access.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 134 +++++++++++++++++++++++++++-
>  1 file changed, 132 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index a70b86e60721..d60f7470e208 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -12,6 +12,7 @@
>  #include <linux/i2c-mux.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/i2c-mux-reg.h>
>  #include <linux/platform_data/mlxreg.h>
> @@ -330,6 +331,12 @@
>  #define MLXPLAT_I2C_MAIN_BUS_NOTIFIED		0x01
>  #define MLXPLAT_I2C_MAIN_BUS_HANDLE_CREATED	0x02
>  
> +/* Lattice FPGA PCI configuration */
> +#define PCI_VENDOR_ID_LATTICE			0x1204
> +#define PCI_DEVICE_ID_LATTICE_I2C_BRIDGE	0x9c2f
> +#define PCI_DEVICE_ID_LATTICE_JTAG_BRIDGE	0x9c30
> +#define PCI_DEVICE_ID_LATTICE_LPC_BRIDGE	0x9c32
> +
>  /* mlxplat_priv - platform private data
>   * @pdev_i2c - i2c controller platform device
>   * @pdev_mux - array of mux platform devices
> @@ -361,6 +368,7 @@ struct mlxplat_priv {
>  
>  static struct platform_device *mlxplat_dev;
>  static int mlxplat_i2c_main_complition_notify(void *handle, int id);
> +static void __iomem *i2c_bridge_addr, *jtag_bridge_addr;
>  
>  /* Regions for LPC I2C controller and LPC base register space */
>  static const struct resource mlxplat_lpc_resources[] = {
> @@ -5543,6 +5551,9 @@ static struct mlxreg_core_platform_data *mlxplat_fan;
>  static struct mlxreg_core_platform_data
>  	*mlxplat_wd_data[MLXPLAT_CPLD_WD_MAX_DEVS];
>  static const struct regmap_config *mlxplat_regmap_config;
> +static struct pci_dev *lpc_bridge;
> +static struct pci_dev *i2c_bridge;
> +static struct pci_dev *jtag_bridge;
>  
>  /* Platform default reset function */
>  static int mlxplat_reboot_notifier(struct notifier_block *nb, unsigned long action, void *unused)
> @@ -6171,15 +6182,131 @@ static void mlxplat_lpc_cpld_device_exit(void)
>  {
>  }
>  
> +static int
> +mlxplat_pci_fpga_device_init(unsigned int device, const char *res_name, struct pci_dev **pci_bridge,
> +			     void __iomem **pci_bridge_addr)
> +{
> +	void __iomem *pci_mem_addr;
> +	struct pci_dev *pci_dev;
> +	int err;
> +
> +	pci_dev = pci_get_device(PCI_VENDOR_ID_LATTICE, device, NULL);
> +	if (!pci_dev)
> +		return -ENODEV;
> +
> +	err = pci_enable_device(pci_dev);
> +	if (err) {
> +		dev_err(&pci_dev->dev, "pci_enable_device failed with error %d\n", err);
> +		goto fail_pci_enable_device;
> +	}
> +
> +	err = pci_request_region(pci_dev, 0, res_name);
> +	if (err) {
> +		dev_err(&pci_dev->dev, "pci_request_regions failed with error %d\n", err);
> +		goto fail_pci_request_regions;
> +	}
> +
> +	err = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(64));
> +	if (err) {
> +		err = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
> +		if (err) {
> +			dev_err(&pci_dev->dev, "dma_set_mask failed with error %d\n", err);
> +			goto fail_pci_set_dma_mask;
> +		}
> +	}
> +
> +	pci_set_master(pci_dev);
> +
> +	pci_mem_addr = devm_ioremap(&pci_dev->dev, pci_resource_start(pci_dev, 0),
> +				    pci_resource_len(pci_dev, 0));
> +	if (!pci_mem_addr) {
> +		dev_err(&mlxplat_dev->dev, "ioremap failed\n");
> +		err = -EIO;
> +		goto fail_ioremap;
> +	}
> +
> +	*pci_bridge = pci_dev;
> +	*pci_bridge_addr = pci_mem_addr;
> +
> +	return 0;
> +
> +fail_ioremap:
> +fail_pci_set_dma_mask:

The problem with using what fails to name labels produces this very 
problem of duplicated labels. If you'd have a label called 
release_regions: it wouldn't be necessary.

-- 
 i.

> +	pci_release_regions(pci_dev);
> +fail_pci_request_regions:
> +	pci_disable_device(pci_dev);
> +fail_pci_enable_device:
> +	return err;
> +}
> +
> +static void
> +mlxplat_pci_fpga_device_exit(struct pci_dev *pci_bridge,
> +			     void __iomem *pci_bridge_addr)
> +{
> +	iounmap(pci_bridge_addr);
> +	pci_release_regions(pci_bridge);
> +	pci_disable_device(pci_bridge);
> +}
> +
> +static int
> +mlxplat_pci_fpga_devices_init(struct resource **hotplug_resources,
> +			      unsigned int *hotplug_resources_size)
> +{
> +	int err;
> +
> +	err = mlxplat_pci_fpga_device_init(PCI_DEVICE_ID_LATTICE_LPC_BRIDGE,
> +					   "mlxplat_lpc_bridge", &lpc_bridge,
> +					   &mlxplat_mlxcpld_regmap_ctx.base);
> +	if (err)
> +		goto mlxplat_pci_fpga_device_init_lpc_fail;
> +
> +	err = mlxplat_pci_fpga_device_init(PCI_DEVICE_ID_LATTICE_I2C_BRIDGE,
> +					   "mlxplat_i2c_bridge", &i2c_bridge,
> +					    &i2c_bridge_addr);
> +	if (err)
> +		goto mlxplat_pci_fpga_device_init_i2c_fail;
> +
> +	err = mlxplat_pci_fpga_device_init(PCI_DEVICE_ID_LATTICE_JTAG_BRIDGE,
> +					   "mlxplat_jtag_bridge", &jtag_bridge,
> +					    &jtag_bridge_addr);
> +	if (err)
> +		goto mlxplat_pci_fpga_device_init_jtag_fail;
> +
> +	return 0;
> +
> +mlxplat_pci_fpga_device_init_jtag_fail:
> +	mlxplat_pci_fpga_device_exit(i2c_bridge, i2c_bridge_addr);
> +mlxplat_pci_fpga_device_init_i2c_fail:
> +	mlxplat_pci_fpga_device_exit(lpc_bridge, mlxplat_mlxcpld_regmap_ctx.base);
> +mlxplat_pci_fpga_device_init_lpc_fail:
> +	return err;
> +}
> +
> +static void mlxplat_pci_fpga_devices_exit(void)
> +{
> +	mlxplat_pci_fpga_device_exit(jtag_bridge, jtag_bridge_addr);
> +	mlxplat_pci_fpga_device_exit(i2c_bridge, i2c_bridge_addr);
> +	mlxplat_pci_fpga_device_exit(lpc_bridge, mlxplat_mlxcpld_regmap_ctx.base);
> +}
> +
>  static int
>  mlxplat_pre_init(struct resource **hotplug_resources, unsigned int *hotplug_resources_size)
>  {
> -	return mlxplat_lpc_cpld_device_init(hotplug_resources, hotplug_resources_size);
> +	int err;
> +
> +	err = mlxplat_pci_fpga_devices_init(hotplug_resources, hotplug_resources_size);
> +	if (err == -ENODEV)
> +		return mlxplat_lpc_cpld_device_init(hotplug_resources, hotplug_resources_size);
> +
> +	return err;
>  }
>  
>  static void mlxplat_post_exit(void)
>  {
> -	mlxplat_lpc_cpld_device_exit();
> +	if (lpc_bridge)
> +		mlxplat_pci_fpga_devices_exit();
> +	else
> +		mlxplat_lpc_cpld_device_exit();
>  }
>  
>  static int mlxplat_post_init(struct mlxplat_priv *priv)
> @@ -6365,6 +6492,9 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
>  	mlxplat_i2c->regmap = priv->regmap;
>  	mlxplat_i2c->handle = priv;
>  
> +	/* Set mapped base address of I2C-LPC bridge over PCIe */
> +	if (lpc_bridge)
> +		mlxplat_i2c->addr = i2c_bridge_addr;
>  	priv->pdev_i2c = platform_device_register_resndata(&mlxplat_dev->dev, "i2c_mlxcpld",
>  							   nr, priv->hotplug_resources,
>  							   priv->hotplug_resources_size,
> 
