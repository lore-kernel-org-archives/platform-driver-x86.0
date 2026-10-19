Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082024848B4
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393857; cv=none; b=AVL3kmmlvm2O+Pnumv5TxQ+d7kPvJ0puPuOLJfFIaAHxiUGHt3y+Hy16x8hhj6Zshq7UGS6nZTr3HD3wMgCZGB8HmdB52H36VJNDn9sb7o/HPmtL40alciJv6RjVKzTJ5c6HAZFVRmncQYp8Y0qwlT+xd3T10sTt+1Nrccm9y4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393857; c=relaxed/simple;
	bh=8rB5XB62n+Tqng26XhRqgAwExWu6kCTKwgUO8p8KG/g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cqrPDyMz9kiN0A9nC6AFzD+HwpouwG0LV1Ud5CNkttZL4M0NxVmFevXhJmuk7dxfVznlIyJAy0fgH+ZI8778POnrfC2N3lyy/ukpSQ9EiwA9fq+M7rNheoWx67Ka5XX8g6u3w8ZebSOVBWUZJ6hxd1MwHOEnqxVcEsoJ744I/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiFHcjea; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiFHcjea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792393854; x=1823929854;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8rB5XB62n+Tqng26XhRqgAwExWu6kCTKwgUO8p8KG/g=;
  b=MiFHcjeaxX9nWIsBpv9JrNwEUCjo+Ajnw7xKS0qo9ZxCluAuhNo6X6oN
   qztLnftkR9G1BDVv40Y7f6nLOQc8UwJgk1bhIsMr7pSQPxrT/VEzyIouw
   Op3oE1fsK3CsQNqBnM+WeUC1Oa0gVelMaLyymI8pRg/4cwRqc3OY/1Xar
   b/H8ecg6Jpp5OvCikfa5Waug7wezaSDv+pzarbYcklnbvu9pHwBCTjuvn
   YtfBSF346rnUOZzU2tvgTXI9/51VXFhUH29j5hP/FnlIq6/NM8XoXJec7
   vPXZ2AsOB5uf/VkZ5SKV5mqD+4A1KqymilSsiw9WtQu/itmcAHpJoDvRh
   g==;
X-CSE-ConnectionGUID: 22M/Qu1sRcOe+mW5ij1mKQ==
X-CSE-MsgGUID: sz0Wq5ZjT0qtGOuGsIPPFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1079931"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1079931"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:10:53 -0700
X-CSE-ConnectionGUID: zi2sLf3+R/mqW0oJC35OHw==
X-CSE-MsgGUID: ufmU/eOPTjaupeKeYLHLXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2547373"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:10:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Oct 2026 10:10:48 +0300 (EEST)
To: Felix Radensky <fradensky@nvidia.com>
cc: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v2 1/3] platform/mellanox: nvsw-core: Add
 core driver for Nvidia switches
In-Reply-To: <20261018101156.699575-2-fradensky@nvidia.com>
Message-ID: <ea5aaa1e-f802-ad2a-391f-877de87ddf04@linux.intel.com>
References: <20261018101156.699575-1-fradensky@nvidia.com> <20261018101156.699575-2-fradensky@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 Oct 2026, Felix Radensky wrote:

> The Nvidia switch systems expose system control and monitoring through
> CPLD/FPGA devices. The register layout and the set of mlxreg-* devices
> built on top of it are common across switch generations, while the
> description of which devices exist on a given board is not.
> 
> Add nvsw-core, which implements the shared part: creation of the
> register map for the I2C attached CPLD/FPGA, the I2C mux topology, and
> the registration of the mlxreg-io, mlxreg-hotplug, mlxreg-fan,
> leds-mlxreg and mlx-wdt platform devices from a board supplied
> description.
> 
> Board drivers provide a struct nvsw_core describing their hardware and
> call nvsw_core_init() and nvsw_core_exit(). Both symbols are exported
> in the NVSW namespace, so consumers declare the dependency explicitly
> and the core adds nothing to the global symbol table.
> 
> The core is selected by the board drivers rather than being directly
> selectable, since it is not useful on its own.
> 
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v1->v2
> Comments pointed out by Ilpo:
> - Add the direct includes for the macros this file uses instead of
>   relying on them arriving transitively: linux/array_size.h,
>   linux/bits.h, linux/dev_printk.h, linux/err.h, linux/export.h and
>   linux/types.h.
> - Return platform_device_register_resndata() and
>   devm_regmap_init_i2c() into a local, so a struct nvsw_core field is
>   only ever assigned a valid pointer and never an ERR_PTR.
> - Drop the NULL assignments from the error paths and from
>   nvsw_core_platform_exit(), and make the rollback in
>   nvsw_core_platform_init() positional.
> Additional fixes added by Felix:
> - Sort the include block.
> 
>  drivers/platform/mellanox/Kconfig     |   9 +
>  drivers/platform/mellanox/Makefile    |   1 +
>  drivers/platform/mellanox/nvsw-core.c | 686 ++++++++++++++++++++++++++
>  drivers/platform/mellanox/nvsw.h      | 297 +++++++++++
>  4 files changed, 993 insertions(+)
>  create mode 100644 drivers/platform/mellanox/nvsw-core.c
>  create mode 100644 drivers/platform/mellanox/nvsw.h
> 
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
> index e3afbe62c7f6..383906a77b6c 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -105,6 +105,15 @@ config MLXBF_PMC
>  	  to performance monitoring counters within various blocks in the
>  	  Mellanox BlueField SoC via a sysfs interface.
>  
> +config NVSW_CORE
> +	tristate
> +	select REGMAP_I2C
> +	help
> +	  Shared register map setup and platform device creation for the Nvidia
> +	  switch CPLD/FPGA drivers. This symbol has no prompt of its own and is
> +	  selected by the drivers that need it, which are built as separate
> +	  modules against it.
> +
>  config NVSW_SN2201
>  	tristate "Nvidia SN2201 platform driver support"
>  	depends on HWMON && I2C
> diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
> index e86723b44c2e..22e40759dd49 100644
> --- a/drivers/platform/mellanox/Makefile
> +++ b/drivers/platform/mellanox/Makefile
> @@ -11,4 +11,5 @@ obj-$(CONFIG_MLXREG_DPU)	+= mlxreg-dpu.o
>  obj-$(CONFIG_MLXREG_HOTPLUG)	+= mlxreg-hotplug.o
>  obj-$(CONFIG_MLXREG_IO) += mlxreg-io.o
>  obj-$(CONFIG_MLXREG_LC) += mlxreg-lc.o
> +obj-$(CONFIG_NVSW_CORE) += nvsw-core.o
>  obj-$(CONFIG_NVSW_SN2201) += nvsw-sn2201.o
> diff --git a/drivers/platform/mellanox/nvsw-core.c b/drivers/platform/mellanox/nvsw-core.c
> new file mode 100644
> index 000000000000..623b44df7688
> --- /dev/null
> +++ b/drivers/platform/mellanox/nvsw-core.c
> @@ -0,0 +1,686 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Nvidia switch platform driver
> + *
> + * Copyright (C) 2025-2026 Nvidia Technologies Ltd.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/export.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/mlxreg.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#include "nvsw.h"
> +
> +static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case NVSW_REG_CPLD1_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD2_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD3_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD4_DBG_LED_OFFSET:
> +	case NVSW_REG_PG1_EVENT_OFFSET:
> +	case NVSW_REG_PG1_MASK_OFFSET:
> +	case NVSW_REG_PG2_EVENT_OFFSET:
> +	case NVSW_REG_PG2_MASK_OFFSET:
> +	case NVSW_REG_PG3_EVENT_OFFSET:
> +	case NVSW_REG_PG3_MASK_OFFSET:
> +	case NVSW_REG_PG4_EVENT_OFFSET:
> +	case NVSW_REG_PG4_MASK_OFFSET:
> +	case NVSW_REG_RESET_GP1_OFFSET:
> +	case NVSW_REG_FIELD_UPGRADE:
> +	case NVSW_REG_GP0_OFFSET:
> +	case NVSW_REG_GP1_OFFSET:
> +	case NVSW_REG_GP7_OFFSET:
> +	case NVSW_REG_UART_BAUD_OFFSET:
> +	case NVSW_REG_PWM_CONTROL_OFFSET:
> +	case NVSW_REG_RESET_GP2_OFFSET:
> +	case NVSW_REG_GP4_OFFSET:
> +	case NVSW_REG_GP5_OFFSET:
> +	case NVSW_REG_GP6_OFFSET:
> +	case NVSW_REG_LED1_OFFSET:
> +	case NVSW_REG_LED5_OFFSET:
> +	case NVSW_REG_LED6_OFFSET:
> +	case NVSW_REG_LED7_OFFSET:
> +	case NVSW_REG_AGGRCO_MASK_OFFSET:
> +	case NVSW_REG_HEALTH_EVENT_OFFSET:
> +	case NVSW_REG_HEALTH_MASK_OFFSET:
> +	case NVSW_REG_AGGR_MASK_OFFSET:
> +	case NVSW_REG_FU_CAP_OFFSET:
> +	case NVSW_REG_BRD4_EVENT_OFFSET:
> +	case NVSW_REG_BRD4_MASK_OFFSET:
> +	case NVSW_REG_AGGRLO_MASK_OFFSET:
> +	case NVSW_REG_BRD1_EVENT_OFFSET:
> +	case NVSW_REG_BRD1_MASK_OFFSET:
> +	case NVSW_REG_BRD2_EVENT_OFFSET:
> +	case NVSW_REG_BRD2_MASK_OFFSET:
> +	case NVSW_REG_ASIC1_EVENT_OFFSET:
> +	case NVSW_REG_ASIC1_MASK_OFFSET:
> +	case NVSW_REG_ASIC2_EVENT_OFFSET:
> +	case NVSW_REG_ASIC2_MASK_OFFSET:
> +	case NVSW_REG_ASIC3_EVENT_OFFSET:
> +	case NVSW_REG_ASIC3_MASK_OFFSET:
> +	case NVSW_REG_ASIC4_EVENT_OFFSET:
> +	case NVSW_REG_ASIC4_MASK_OFFSET:
> +	case NVSW_REG_VR1_ALERT_EVENT_OFFSET:
> +	case NVSW_REG_VR1_ALERT_MASK_OFFSET:
> +	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
> +	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
> +	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
> +	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
> +	case NVSW_REG_FAN_EVENT_OFFSET:
> +	case NVSW_REG_FAN_MASK_OFFSET:
> +	case NVSW_REG_PWRB_EVENT_OFFSET:
> +	case NVSW_REG_PWRB_MASK_OFFSET:
> +	case NVSW_REG_EROT_EVENT_OFFSET:
> +	case NVSW_REG_EROT_MASK_OFFSET:
> +	case NVSW_REG_EROT_ERR_EVENT_OFFSET:
> +	case NVSW_REG_EROT_ERR_MASK_OFFSET:
> +	case NVSW_REG_FRU1_EVENT_OFFSET:
> +	case NVSW_REG_FRU1_MASK_OFFSET:
> +	case NVSW_REG_LEAK_EVENT_OFFSET:
> +	case NVSW_REG_LEAK_MASK_OFFSET:
> +	case NVSW_REG_SPI_CHNL_SELECT:
> +	case NVSW_REG_WD2_TMR_OFFSET:
> +	case NVSW_REG_WD2_TLEFT_OFFSET:
> +	case NVSW_REG_WD2_ACT_OFFSET:
> +	case NVSW_REG_WD3_TMR_OFFSET:
> +	case NVSW_REG_WD3_TLEFT_OFFSET:
> +	case NVSW_REG_WD3_ACT_OFFSET:
> +	case NVSW_REG_PWM1_OFFSET:
> +	case NVSW_REG_MUX0_OFFSET:
> +	case NVSW_REG_MUX1_OFFSET:
> +	case NVSW_REG_MUX2_OFFSET:
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case NVSW_REG_CPLD1_VER_OFFSET:
> +	case NVSW_REG_CPLD1_PN_OFFSET:
> +	case NVSW_REG_CPLD1_PN1_OFFSET:
> +	case NVSW_REG_CPLD2_VER_OFFSET:
> +	case NVSW_REG_CPLD2_PN_OFFSET:
> +	case NVSW_REG_CPLD2_PN1_OFFSET:
> +	case NVSW_REG_CPLD3_VER_OFFSET:
> +	case NVSW_REG_CPLD3_PN_OFFSET:
> +	case NVSW_REG_CPLD3_PN1_OFFSET:
> +	case NVSW_REG_CPLD4_VER_OFFSET:
> +	case NVSW_REG_CPLD4_PN_OFFSET:
> +	case NVSW_REG_CPLD4_PN1_OFFSET:
> +	case NVSW_REG_CPLD1_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD2_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD3_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD4_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD7_VER_OFFSET:
> +	case NVSW_REG_PG1_OFFSET:
> +	case NVSW_REG_PG1_EVENT_OFFSET:
> +	case NVSW_REG_PG1_MASK_OFFSET:
> +	case NVSW_REG_PG2_OFFSET:
> +	case NVSW_REG_PG2_EVENT_OFFSET:
> +	case NVSW_REG_PG2_MASK_OFFSET:
> +	case NVSW_REG_PG3_OFFSET:
> +	case NVSW_REG_PG3_EVENT_OFFSET:
> +	case NVSW_REG_PG3_MASK_OFFSET:
> +	case NVSW_REG_PG4_OFFSET:
> +	case NVSW_REG_PG4_EVENT_OFFSET:
> +	case NVSW_REG_PG4_MASK_OFFSET:
> +	case NVSW_REG_CPLD6_VER_OFFSET:
> +	case NVSW_REG_CPLD6_PN_OFFSET:
> +	case NVSW_REG_CPLD6_PN1_OFFSET:
> +	case NVSW_REG_CPLD9_VER_OFFSET:
> +	case NVSW_REG_CPLD10_PN_OFFSET:
> +	case NVSW_REG_CPLD10_PN1_OFFSET:
> +	case NVSW_REG_RESET_GP1_OFFSET:
> +	case NVSW_REG_FIELD_UPGRADE:
> +	case NVSW_REG_SAFE_BIOS_OFFSET:
> +	case NVSW_REG_RESET_CAUSE_OFFSET:
> +	case NVSW_REG_RESET_CAUSE1_OFFSET:
> +	case NVSW_REG_RESET_CAUSE2_OFFSET:
> +	case NVSW_REG_LED1_OFFSET:
> +	case NVSW_REG_LED5_OFFSET:
> +	case NVSW_REG_LED6_OFFSET:
> +	case NVSW_REG_LED7_OFFSET:
> +	case NVSW_REG_CPLD7_PN_OFFSET:
> +	case NVSW_REG_CPLD7_PN1_OFFSET:
> +	case NVSW_REG_RESET_GP2_OFFSET:
> +	case NVSW_REG_GP0_RO_OFFSET:
> +	case NVSW_REG_GP1_RO_OFFSET:
> +	case NVSW_REG_GP2_RO_OFFSET:
> +	case NVSW_REG_GP4_RO_OFFSET:
> +	case NVSW_REG_GP5_RO_OFFSET:
> +	case NVSW_REG_GPCOM0_OFFSET:
> +	case NVSW_REG_GP0_OFFSET:
> +	case NVSW_REG_GP1_OFFSET:
> +	case NVSW_REG_GP7_OFFSET:
> +	case NVSW_REG_UART_BAUD_OFFSET:
> +	case NVSW_REG_PWM_CONTROL_OFFSET:
> +	case NVSW_REG_GP4_OFFSET:
> +	case NVSW_REG_GP5_OFFSET:
> +	case NVSW_REG_GP6_OFFSET:
> +	case NVSW_REG_AGGRCO_OFFSET:
> +	case NVSW_REG_AGGRCO_MASK_OFFSET:
> +	case NVSW_REG_HEALTH_OFFSET:
> +	case NVSW_REG_HEALTH_EVENT_OFFSET:
> +	case NVSW_REG_HEALTH_MASK_OFFSET:
> +	case NVSW_REG_AGGR_OFFSET:
> +	case NVSW_REG_AGGR_MASK_OFFSET:
> +	case NVSW_REG_FU_CAP_OFFSET:
> +	case NVSW_REG_BRD4_OFFSET:
> +	case NVSW_REG_BRD4_EVENT_OFFSET:
> +	case NVSW_REG_BRD4_MASK_OFFSET:
> +	case NVSW_REG_AGGRLO_OFFSET:
> +	case NVSW_REG_AGGRLO_MASK_OFFSET:
> +	case NVSW_REG_BRD1_OFFSET:
> +	case NVSW_REG_BRD1_EVENT_OFFSET:
> +	case NVSW_REG_BRD1_MASK_OFFSET:
> +	case NVSW_REG_BRD2_OFFSET:
> +	case NVSW_REG_BRD2_EVENT_OFFSET:
> +	case NVSW_REG_BRD2_MASK_OFFSET:
> +	case NVSW_REG_ASIC1_HEALTH_OFFSET:
> +	case NVSW_REG_ASIC1_EVENT_OFFSET:
> +	case NVSW_REG_ASIC1_MASK_OFFSET:
> +	case NVSW_REG_ASIC2_HEALTH_OFFSET:
> +	case NVSW_REG_ASIC2_EVENT_OFFSET:
> +	case NVSW_REG_ASIC2_MASK_OFFSET:
> +	case NVSW_REG_ASIC3_HEALTH_OFFSET:
> +	case NVSW_REG_ASIC3_EVENT_OFFSET:
> +	case NVSW_REG_ASIC3_MASK_OFFSET:
> +	case NVSW_REG_ASIC4_HEALTH_OFFSET:
> +	case NVSW_REG_ASIC4_EVENT_OFFSET:
> +	case NVSW_REG_ASIC4_MASK_OFFSET:
> +	case NVSW_REG_VR1_ALERT_OFFSET:
> +	case NVSW_REG_VR1_ALERT_EVENT_OFFSET:
> +	case NVSW_REG_VR1_ALERT_MASK_OFFSET:
> +	case NVSW_REG_VR2_ALERT_OFFSET:
> +	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
> +	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
> +	case NVSW_REG_PS_DC_OK_OFFSET:
> +	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
> +	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
> +	case NVSW_REG_CPLD8_PN_OFFSET:
> +	case NVSW_REG_CPLD8_PN1_OFFSET:
> +	case NVSW_REG_CPLD8_VER_OFFSET:
> +	case NVSW_REG_FAN_OFFSET:
> +	case NVSW_REG_FAN_EVENT_OFFSET:
> +	case NVSW_REG_FAN_MASK_OFFSET:
> +	case NVSW_REG_CPLD5_VER_OFFSET:
> +	case NVSW_REG_CPLD5_PN_OFFSET:
> +	case NVSW_REG_CPLD5_PN1_OFFSET:
> +	case NVSW_REG_EROT_OFFSET:
> +	case NVSW_REG_EROT_EVENT_OFFSET:
> +	case NVSW_REG_EROT_MASK_OFFSET:
> +	case NVSW_REG_EROT_ERR_OFFSET:
> +	case NVSW_REG_EROT_ERR_EVENT_OFFSET:
> +	case NVSW_REG_EROT_ERR_MASK_OFFSET:
> +	case NVSW_REG_PWRB_OFFSET:
> +	case NVSW_REG_PWRB_EVENT_OFFSET:
> +	case NVSW_REG_PWRB_MASK_OFFSET:
> +	case NVSW_REG_FRU1_OFFSET:
> +	case NVSW_REG_FRU1_EVENT_OFFSET:
> +	case NVSW_REG_FRU1_MASK_OFFSET:
> +	case NVSW_REG_LEAK_OFFSET:
> +	case NVSW_REG_LEAK_EVENT_OFFSET:
> +	case NVSW_REG_LEAK_MASK_OFFSET:
> +	case NVSW_REG_CPLD1_MVER_OFFSET:
> +	case NVSW_REG_CPLD2_MVER_OFFSET:
> +	case NVSW_REG_CPLD3_MVER_OFFSET:
> +	case NVSW_REG_CPLD4_MVER_OFFSET:
> +	case NVSW_REG_PWM1_OFFSET:
> +	case NVSW_REG_TACHO1_OFFSET:
> +	case NVSW_REG_TACHO2_OFFSET:
> +	case NVSW_REG_TACHO3_OFFSET:
> +	case NVSW_REG_TACHO4_OFFSET:
> +	case NVSW_REG_TACHO5_OFFSET:
> +	case NVSW_REG_TACHO6_OFFSET:
> +	case NVSW_REG_TACHO7_OFFSET:
> +	case NVSW_REG_TACHO8_OFFSET:
> +	case NVSW_REG_TACHO9_OFFSET:
> +	case NVSW_REG_TACHO10_OFFSET:
> +	case NVSW_REG_TACHO11_OFFSET:
> +	case NVSW_REG_TACHO12_OFFSET:
> +	case NVSW_REG_FAN_CAP1_OFFSET:
> +	case NVSW_REG_FAN_DRW_CAP_OFFSET:
> +	case NVSW_REG_TACHO_SPEED_OFFSET:
> +	case NVSW_REG_CONFIG1_OFFSET:
> +	case NVSW_REG_CONFIG2_OFFSET:
> +	case NVSW_REG_CONFIG3_OFFSET:
> +	case NVSW_REG_SPI_CHNL_SELECT:
> +	case NVSW_REG_CPLD5_MVER_OFFSET:
> +	case NVSW_REG_CPLD9_PN_OFFSET:
> +	case NVSW_REG_CPLD9_PN1_OFFSET:
> +	case NVSW_REG_CPLD10_VER_OFFSET:
> +	case NVSW_REG_WD2_TMR_OFFSET:
> +	case NVSW_REG_WD2_TLEFT_OFFSET:
> +	case NVSW_REG_WD2_ACT_OFFSET:
> +	case NVSW_REG_WD3_TMR_OFFSET:
> +	case NVSW_REG_WD3_TLEFT_OFFSET:
> +	case NVSW_REG_WD3_ACT_OFFSET:
> +	case NVSW_REG_CPLD7_MVER_OFFSET:
> +	case NVSW_REG_CPLD8_MVER_OFFSET:
> +	case NVSW_REG_CPLD9_MVER_OFFSET:
> +	case NVSW_REG_CPLD10_MVER_OFFSET:
> +	case NVSW_REG_CPLD6_MVER_OFFSET:
> +	case NVSW_REG_MUX0_OFFSET:
> +	case NVSW_REG_MUX1_OFFSET:
> +	case NVSW_REG_MUX2_OFFSET:
> +	case NVSW_REG_UFM_VERSION_OFFSET:
> +	case NVSW_REG_SYS_CPBLTY0:
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case NVSW_REG_CPLD1_VER_OFFSET:
> +	case NVSW_REG_CPLD1_PN_OFFSET:
> +	case NVSW_REG_CPLD1_PN1_OFFSET:
> +	case NVSW_REG_CPLD2_VER_OFFSET:
> +	case NVSW_REG_CPLD2_PN_OFFSET:
> +	case NVSW_REG_CPLD2_PN1_OFFSET:
> +	case NVSW_REG_CPLD3_VER_OFFSET:
> +	case NVSW_REG_CPLD3_PN_OFFSET:
> +	case NVSW_REG_CPLD3_PN1_OFFSET:
> +	case NVSW_REG_CPLD4_VER_OFFSET:
> +	case NVSW_REG_CPLD4_PN_OFFSET:
> +	case NVSW_REG_CPLD4_PN1_OFFSET:
> +	case NVSW_REG_CPLD1_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD2_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD3_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD4_DBG_LED_OFFSET:
> +	case NVSW_REG_CPLD7_VER_OFFSET:
> +	case NVSW_REG_PG1_OFFSET:
> +	case NVSW_REG_PG1_EVENT_OFFSET:
> +	case NVSW_REG_PG1_MASK_OFFSET:
> +	case NVSW_REG_PG2_OFFSET:
> +	case NVSW_REG_PG2_EVENT_OFFSET:
> +	case NVSW_REG_PG2_MASK_OFFSET:
> +	case NVSW_REG_PG3_OFFSET:
> +	case NVSW_REG_PG3_EVENT_OFFSET:
> +	case NVSW_REG_PG3_MASK_OFFSET:
> +	case NVSW_REG_PG4_OFFSET:
> +	case NVSW_REG_PG4_EVENT_OFFSET:
> +	case NVSW_REG_PG4_MASK_OFFSET:
> +	case NVSW_REG_CPLD6_VER_OFFSET:
> +	case NVSW_REG_CPLD6_PN_OFFSET:
> +	case NVSW_REG_CPLD6_PN1_OFFSET:
> +	case NVSW_REG_CPLD9_VER_OFFSET:
> +	case NVSW_REG_CPLD10_PN_OFFSET:
> +	case NVSW_REG_CPLD10_PN1_OFFSET:
> +	case NVSW_REG_RESET_GP1_OFFSET:
> +	case NVSW_REG_FIELD_UPGRADE:
> +	case NVSW_REG_SAFE_BIOS_OFFSET:
> +	case NVSW_REG_RESET_CAUSE_OFFSET:
> +	case NVSW_REG_RESET_CAUSE1_OFFSET:
> +	case NVSW_REG_RESET_CAUSE2_OFFSET:
> +	case NVSW_REG_LED1_OFFSET:
> +	case NVSW_REG_LED5_OFFSET:
> +	case NVSW_REG_LED6_OFFSET:
> +	case NVSW_REG_LED7_OFFSET:
> +	case NVSW_REG_CPLD7_PN_OFFSET:
> +	case NVSW_REG_CPLD7_PN1_OFFSET:
> +	case NVSW_REG_RESET_GP2_OFFSET:
> +	case NVSW_REG_GP0_RO_OFFSET:
> +	case NVSW_REG_GP1_RO_OFFSET:
> +	case NVSW_REG_GP2_RO_OFFSET:
> +	case NVSW_REG_GPCOM0_OFFSET:
> +	case NVSW_REG_GP0_OFFSET:
> +	case NVSW_REG_GP1_OFFSET:
> +	case NVSW_REG_GP7_OFFSET:
> +	case NVSW_REG_UART_BAUD_OFFSET:
> +	case NVSW_REG_PWM_CONTROL_OFFSET:
> +	case NVSW_REG_GP4_OFFSET:
> +	case NVSW_REG_GP5_OFFSET:
> +	case NVSW_REG_GP6_OFFSET:
> +	case NVSW_REG_AGGRCO_OFFSET:
> +	case NVSW_REG_AGGRCO_MASK_OFFSET:
> +	case NVSW_REG_HEALTH_OFFSET:
> +	case NVSW_REG_HEALTH_EVENT_OFFSET:
> +	case NVSW_REG_HEALTH_MASK_OFFSET:
> +	case NVSW_REG_AGGR_OFFSET:
> +	case NVSW_REG_AGGR_MASK_OFFSET:
> +	case NVSW_REG_FU_CAP_OFFSET:
> +	case NVSW_REG_BRD4_OFFSET:
> +	case NVSW_REG_BRD4_EVENT_OFFSET:
> +	case NVSW_REG_BRD4_MASK_OFFSET:
> +	case NVSW_REG_AGGRLO_OFFSET:
> +	case NVSW_REG_AGGRLO_MASK_OFFSET:
> +	case NVSW_REG_BRD1_OFFSET:
> +	case NVSW_REG_BRD1_EVENT_OFFSET:
> +	case NVSW_REG_BRD1_MASK_OFFSET:
> +	case NVSW_REG_BRD2_OFFSET:
> +	case NVSW_REG_BRD2_EVENT_OFFSET:
> +	case NVSW_REG_BRD2_MASK_OFFSET:
> +	case NVSW_REG_ASIC1_HEALTH_OFFSET:
> +	case NVSW_REG_ASIC1_EVENT_OFFSET:
> +	case NVSW_REG_ASIC1_MASK_OFFSET:
> +	case NVSW_REG_ASIC2_HEALTH_OFFSET:
> +	case NVSW_REG_ASIC2_EVENT_OFFSET:
> +	case NVSW_REG_ASIC2_MASK_OFFSET:
> +	case NVSW_REG_ASIC3_HEALTH_OFFSET:
> +	case NVSW_REG_ASIC3_EVENT_OFFSET:
> +	case NVSW_REG_ASIC3_MASK_OFFSET:
> +	case NVSW_REG_ASIC4_HEALTH_OFFSET:
> +	case NVSW_REG_ASIC4_EVENT_OFFSET:
> +	case NVSW_REG_ASIC4_MASK_OFFSET:
> +	case NVSW_REG_VR1_ALERT_OFFSET:
> +	case NVSW_REG_VR1_ALERT_EVENT_OFFSET:
> +	case NVSW_REG_VR1_ALERT_MASK_OFFSET:
> +	case NVSW_REG_VR2_ALERT_OFFSET:
> +	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
> +	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
> +	case NVSW_REG_PS_DC_OK_OFFSET:
> +	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
> +	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
> +	case NVSW_REG_CPLD8_PN_OFFSET:
> +	case NVSW_REG_CPLD8_PN1_OFFSET:
> +	case NVSW_REG_CPLD8_VER_OFFSET:
> +	case NVSW_REG_FAN_OFFSET:
> +	case NVSW_REG_FAN_EVENT_OFFSET:
> +	case NVSW_REG_FAN_MASK_OFFSET:
> +	case NVSW_REG_CPLD5_VER_OFFSET:
> +	case NVSW_REG_CPLD5_PN_OFFSET:
> +	case NVSW_REG_CPLD5_PN1_OFFSET:
> +	case NVSW_REG_EROT_OFFSET:
> +	case NVSW_REG_EROT_EVENT_OFFSET:
> +	case NVSW_REG_EROT_MASK_OFFSET:
> +	case NVSW_REG_EROT_ERR_OFFSET:
> +	case NVSW_REG_EROT_ERR_EVENT_OFFSET:
> +	case NVSW_REG_EROT_ERR_MASK_OFFSET:
> +	case NVSW_REG_PWRB_OFFSET:
> +	case NVSW_REG_PWRB_EVENT_OFFSET:
> +	case NVSW_REG_PWRB_MASK_OFFSET:
> +	case NVSW_REG_FRU1_OFFSET:
> +	case NVSW_REG_FRU1_EVENT_OFFSET:
> +	case NVSW_REG_FRU1_MASK_OFFSET:
> +	case NVSW_REG_LEAK_OFFSET:
> +	case NVSW_REG_LEAK_EVENT_OFFSET:
> +	case NVSW_REG_LEAK_MASK_OFFSET:
> +	case NVSW_REG_GP4_RO_OFFSET:
> +	case NVSW_REG_GP5_RO_OFFSET:
> +	case NVSW_REG_CPLD1_MVER_OFFSET:
> +	case NVSW_REG_CPLD2_MVER_OFFSET:
> +	case NVSW_REG_CPLD3_MVER_OFFSET:
> +	case NVSW_REG_CPLD4_MVER_OFFSET:
> +	case NVSW_REG_PWM1_OFFSET:
> +	case NVSW_REG_TACHO1_OFFSET:
> +	case NVSW_REG_TACHO2_OFFSET:
> +	case NVSW_REG_TACHO3_OFFSET:
> +	case NVSW_REG_TACHO4_OFFSET:
> +	case NVSW_REG_TACHO5_OFFSET:
> +	case NVSW_REG_TACHO6_OFFSET:
> +	case NVSW_REG_TACHO7_OFFSET:
> +	case NVSW_REG_TACHO8_OFFSET:
> +	case NVSW_REG_TACHO9_OFFSET:
> +	case NVSW_REG_TACHO10_OFFSET:
> +	case NVSW_REG_TACHO11_OFFSET:
> +	case NVSW_REG_TACHO12_OFFSET:
> +	case NVSW_REG_FAN_CAP1_OFFSET:
> +	case NVSW_REG_FAN_DRW_CAP_OFFSET:
> +	case NVSW_REG_TACHO_SPEED_OFFSET:
> +	case NVSW_REG_CONFIG1_OFFSET:
> +	case NVSW_REG_CONFIG2_OFFSET:
> +	case NVSW_REG_CONFIG3_OFFSET:
> +	case NVSW_REG_SPI_CHNL_SELECT:
> +	case NVSW_REG_CPLD5_MVER_OFFSET:
> +	case NVSW_REG_CPLD9_PN_OFFSET:
> +	case NVSW_REG_CPLD9_PN1_OFFSET:
> +	case NVSW_REG_CPLD10_VER_OFFSET:
> +	case NVSW_REG_WD2_TMR_OFFSET:
> +	case NVSW_REG_WD2_TLEFT_OFFSET:
> +	case NVSW_REG_WD2_ACT_OFFSET:
> +	case NVSW_REG_CPLD7_MVER_OFFSET:
> +	case NVSW_REG_CPLD8_MVER_OFFSET:
> +	case NVSW_REG_CPLD9_MVER_OFFSET:
> +	case NVSW_REG_CPLD10_MVER_OFFSET:
> +	case NVSW_REG_CPLD6_MVER_OFFSET:
> +	case NVSW_REG_WD3_TMR_OFFSET:
> +	case NVSW_REG_WD3_TLEFT_OFFSET:
> +	case NVSW_REG_WD3_ACT_OFFSET:
> +	case NVSW_REG_MUX0_OFFSET:
> +	case NVSW_REG_MUX1_OFFSET:
> +	case NVSW_REG_MUX2_OFFSET:
> +	case NVSW_REG_UFM_VERSION_OFFSET:
> +	case NVSW_REG_SYS_CPBLTY0:
> +		return true;
> +	}
> +	return false;
> +}
> +
> +/* Configuration for the register map of a device with 2 bytes address space. */
> +static const struct reg_default nvsw_core_reg_def[] = {
> +	{ NVSW_REG_AGGRCO_MASK_OFFSET, GENMASK(1, 0)},
> +	{ NVSW_REG_PWM_CONTROL_OFFSET, 0x00 },
> +};
> +
> +static const struct regmap_config nvsw_regmap_i2c_conf = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.max_register = NVSW_REG_MAX,
> +	.cache_type = REGCACHE_FLAT,
> +	.reg_defaults = nvsw_core_reg_def,
> +	.num_reg_defaults = ARRAY_SIZE(nvsw_core_reg_def),
> +	.writeable_reg = nvsw_writeable_reg,
> +	.readable_reg = nvsw_readable_reg,
> +	.volatile_reg = nvsw_volatile_reg,
> +};
> +
> +static int nvsw_core_platform_init(struct nvsw_core *nvsw_core)
> +{
> +	struct platform_device *pdev;
> +	int i, err;
> +
> +	/* Add registers io access driver. */
> +	if (nvsw_core->regio_data) {
> +		nvsw_core->regio_data->regmap = nvsw_core->regmap;
> +		pdev = platform_device_register_resndata(nvsw_core->dev, "mlxreg-io",
> +							 PLATFORM_DEVID_NONE, NULL, 0,
> +							 nvsw_core->regio_data,
> +							 sizeof(*nvsw_core->regio_data));
> +		if (IS_ERR(pdev)) {
> +			dev_err(nvsw_core->dev, "Failed to register mlxreg-io driver\n");
> +			return PTR_ERR(pdev);
> +		}
> +		nvsw_core->regio = pdev;
> +	}
> +
> +	/* Add FAN driver. */
> +	if (nvsw_core->fan_data) {
> +		nvsw_core->fan_data->regmap = nvsw_core->regmap;
> +		pdev = platform_device_register_resndata(nvsw_core->dev, "mlxreg-fan",
> +							 PLATFORM_DEVID_NONE, NULL, 0,
> +							 nvsw_core->fan_data,
> +							 sizeof(*nvsw_core->fan_data));
> +		if (IS_ERR(pdev)) {
> +			dev_err(nvsw_core->dev, "Failed to register mlxreg-fan driver\n");
> +			err = PTR_ERR(pdev);
> +			goto err_unregister_regio;
> +		}
> +		nvsw_core->fan = pdev;
> +	}
> +
> +	/* Add LED driver. */
> +	if (nvsw_core->led_data) {
> +		nvsw_core->led_data->regmap = nvsw_core->regmap;
> +		pdev = platform_device_register_resndata(nvsw_core->dev, "leds-mlxreg",
> +							 PLATFORM_DEVID_NONE, NULL, 0,
> +							 nvsw_core->led_data,
> +							 sizeof(*nvsw_core->led_data));
> +		if (IS_ERR(pdev)) {
> +			dev_err(nvsw_core->dev, "Failed to register leds-mlxreg driver\n");
> +			err = PTR_ERR(pdev);
> +			goto err_unregister_fan;
> +		}
> +		nvsw_core->led = pdev;
> +	}
> +
> +	/* Add hotplug driver. Hotplug events are reported through the interrupt
> +	 * of the I2C device the register map is attached to.
> +	 */
> +	if (nvsw_core->hotplug_data) {
> +		if (!nvsw_core->client || !nvsw_core->client->irq) {
> +			dev_err(nvsw_core->dev,
> +				"Hotplug requires an I2C device with an interrupt\n");
> +			err = -EINVAL;
> +			goto err_unregister_led;
> +		}
> +		nvsw_core->hotplug_data->irq = nvsw_core->client->irq;
> +		nvsw_core->hotplug_data->regmap = nvsw_core->regmap;
> +		pdev = platform_device_register_resndata(nvsw_core->dev, "mlxreg-hotplug",
> +							 PLATFORM_DEVID_NONE, NULL, 0,
> +							 nvsw_core->hotplug_data,
> +							 sizeof(*nvsw_core->hotplug_data));
> +		if (IS_ERR(pdev)) {
> +			dev_err(nvsw_core->dev, "Failed to register mlxreg-hotplug driver\n");
> +			err = PTR_ERR(pdev);
> +			goto err_unregister_led;
> +		}
> +		nvsw_core->hotplug = pdev;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(nvsw_core->wd_data); i++) {
> +		if (!nvsw_core->wd_data[i])
> +			continue;
> +
> +		nvsw_core->wd_data[i]->regmap = nvsw_core->regmap;
> +		pdev = platform_device_register_resndata(nvsw_core->dev, "mlx-wdt", i,
> +							 NULL, 0, nvsw_core->wd_data[i],
> +							 sizeof(*nvsw_core->wd_data[i]));
> +		if (IS_ERR(pdev)) {
> +			dev_err(nvsw_core->dev, "Failed to register mlx-wdt driver\n");
> +			err = PTR_ERR(pdev);
> +			goto err_unregister_wd;
> +		}
> +		nvsw_core->wd[i] = pdev;
> +	}
> +
> +	return 0;
> +
> +	/* The devices below are optional, so the pointers of those a board
> +	 * does not describe stay NULL, which platform_device_unregister()
> +	 * accepts.
> +	 */
> +err_unregister_wd:
> +	while (i--)
> +		platform_device_unregister(nvsw_core->wd[i]);
> +	platform_device_unregister(nvsw_core->hotplug);
> +err_unregister_led:
> +	platform_device_unregister(nvsw_core->led);
> +err_unregister_fan:
> +	platform_device_unregister(nvsw_core->fan);
> +err_unregister_regio:
> +	platform_device_unregister(nvsw_core->regio);
> +
> +	return err;
> +}
> +
> +static void nvsw_core_platform_exit(struct nvsw_core *nvsw_core)
> +{
> +	int i;
> +
> +	for (i = ARRAY_SIZE(nvsw_core->wd) - 1; i >= 0; i--)
> +		platform_device_unregister(nvsw_core->wd[i]);
> +	platform_device_unregister(nvsw_core->hotplug);
> +	platform_device_unregister(nvsw_core->led);
> +	platform_device_unregister(nvsw_core->fan);
> +	platform_device_unregister(nvsw_core->regio);
> +}
> +
> +static int nvsw_core_mux_topology_init(struct nvsw_core *nvsw_core)
> +{
> +	if (!nvsw_core->mux_init)
> +		return 0;
> +
> +	return nvsw_core->mux_init(nvsw_core);
> +}
> +
> +static void nvsw_core_mux_topology_exit(struct nvsw_core *nvsw_core)
> +{
> +	if (nvsw_core->mux_exit)
> +		nvsw_core->mux_exit(nvsw_core);
> +}
> +
> +static int nvsw_core_regmap_init(struct nvsw_core *nvsw_core)
> +{
> +	struct regmap *regmap;
> +	int err;
> +
> +	if (!nvsw_core->client)
> +		return -EINVAL;
> +
> +	regmap = devm_regmap_init_i2c(nvsw_core->client, &nvsw_regmap_i2c_conf);
> +	if (IS_ERR(regmap)) {
> +		dev_err(nvsw_core->dev, "Failed to create regmap\n");
> +		return PTR_ERR(regmap);
> +	}
> +	nvsw_core->regmap = regmap;
> +
> +	/* Sync registers with hardware. */
> +	regcache_mark_dirty(nvsw_core->regmap);
> +	err = regcache_sync(nvsw_core->regmap);
> +	if (err) {
> +		dev_err(nvsw_core->dev, "Failed to sync regmap\n");
> +		return err;
> +	}
> +
> +	/* Set registers default values. */
> +	if (nvsw_core->set_reg_default) {
> +		err = nvsw_core->set_reg_default(nvsw_core->regmap);
> +		if (err) {
> +			dev_err(nvsw_core->dev, "Failed to set default regmap\n");
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int nvsw_core_init(struct nvsw_core *nvsw_core)
> +{
> +	int err;
> +
> +	err = nvsw_core_regmap_init(nvsw_core);
> +	if (err)
> +		return err;
> +
> +	err = nvsw_core_mux_topology_init(nvsw_core);
> +	if (err)
> +		goto nvsw_core_mux_topology_init_fail;

Drop this label and return directly instead of goto'ing just to do a 
return right after.

On a general note, the rollbacks looked better now without all those NULL 
assignment. So thanks for addressing them!

> +	err = nvsw_core_platform_init(nvsw_core);
> +	if (err)
> +		goto nvsw_core_platform_init_fail;
> +
> +	return 0;
> +nvsw_core_platform_init_fail:
> +	nvsw_core_mux_topology_exit(nvsw_core);
> +nvsw_core_mux_topology_init_fail:
> +	return err;
> +}
> +EXPORT_SYMBOL_NS_GPL(nvsw_core_init, "NVSW");
> +
> +void nvsw_core_exit(struct nvsw_core *nvsw_core)
> +{
> +	nvsw_core_platform_exit(nvsw_core);
> +	nvsw_core_mux_topology_exit(nvsw_core);
> +	if (nvsw_core->set_reg_default)
> +		nvsw_core->set_reg_default(nvsw_core->regmap);
> +}
> +EXPORT_SYMBOL_NS_GPL(nvsw_core_exit, "NVSW");

-- 
 i.

> +MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
> +MODULE_DESCRIPTION("Nvidia platform core driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/platform/mellanox/nvsw.h b/drivers/platform/mellanox/nvsw.h
> new file mode 100644
> index 000000000000..88b16d0a36d4
> --- /dev/null
> +++ b/drivers/platform/mellanox/nvsw.h
> @@ -0,0 +1,297 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> + *
> + * Nvidia switch platform driver
> + *
> + * Copyright (C) 2025-2026 Nvidia Technologies Ltd.
> + */
> +
> +#ifndef __NVSW_H__
> +#define __NVSW_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +struct device;
> +struct i2c_client;
> +struct mlxreg_core_hotplug_platform_data;
> +struct mlxreg_core_platform_data;
> +struct platform_device;
> +struct regmap;
> +
> +/* I2C bus IO offsets */
> +#define NVSW_REG_CPLD1_VER_OFFSET	0x2500
> +#define NVSW_REG_CPLD2_VER_OFFSET	0x2501
> +#define NVSW_REG_CPLD3_VER_OFFSET	0x2502
> +#define NVSW_REG_CPLD4_VER_OFFSET	0x2503
> +#define NVSW_REG_CPLD1_PN_OFFSET	0x2504
> +#define NVSW_REG_CPLD1_PN1_OFFSET	0x2505
> +#define NVSW_REG_CPLD2_PN_OFFSET	0x2506
> +#define NVSW_REG_CPLD2_PN1_OFFSET	0x2507
> +#define NVSW_REG_CPLD3_PN_OFFSET	0x2508
> +#define NVSW_REG_CPLD3_PN1_OFFSET	0x2509
> +#define NVSW_REG_CPLD4_PN_OFFSET	0x250a
> +#define NVSW_REG_CPLD4_PN1_OFFSET	0x250b
> +#define NVSW_REG_CPLD1_DBG_LED_OFFSET	0x250c
> +#define NVSW_REG_CPLD2_DBG_LED_OFFSET	0x250d
> +#define NVSW_REG_CPLD3_DBG_LED_OFFSET	0x250e
> +#define NVSW_REG_CPLD4_DBG_LED_OFFSET	0x250f
> +#define NVSW_REG_CPLD7_VER_OFFSET	0x2510
> +#define NVSW_REG_PG1_OFFSET		0x2511
> +#define NVSW_REG_PG1_EVENT_OFFSET	0x2512
> +#define NVSW_REG_PG1_MASK_OFFSET	0x2513
> +#define NVSW_REG_PG2_OFFSET		0x2514
> +#define NVSW_REG_PG2_EVENT_OFFSET	0x2515
> +#define NVSW_REG_PG2_MASK_OFFSET	0x2516
> +#define NVSW_REG_RESET_GP1_OFFSET	0x2517
> +#define NVSW_REG_RESET_GP2_OFFSET	0x2519
> +#define NVSW_REG_RESET_CAUSE_OFFSET	0x251d
> +#define NVSW_REG_RESET_CAUSE1_OFFSET	0x251e
> +#define NVSW_REG_RESET_CAUSE2_OFFSET	0x251f
> +#define NVSW_REG_LED1_OFFSET		0x2520
> +#define NVSW_REG_LED5_OFFSET		0x2524
> +#define NVSW_REG_LED6_OFFSET		0x2525
> +#define NVSW_REG_LED7_OFFSET		0x2526
> +#define NVSW_REG_CPLD7_PN_OFFSET	0x2528
> +#define NVSW_REG_CPLD7_PN1_OFFSET	0x2529
> +#define NVSW_REG_GP0_RO_OFFSET		0x252a
> +#define NVSW_REG_GP2_RO_OFFSET		0x252b
> +#define NVSW_REG_GP1_RO_OFFSET		0x252c
> +#define NVSW_REG_GPCOM0_OFFSET		0x252d
> +#define NVSW_REG_GP0_OFFSET		0x252e
> +#define NVSW_REG_GP7_OFFSET		0x252f
> +#define NVSW_REG_GP1_OFFSET		0x2530
> +#define NVSW_REG_UART_BAUD_OFFSET	0x2531
> +#define NVSW_REG_GP4_OFFSET		0x2532
> +#define NVSW_REG_GP5_RO_OFFSET		0x2533
> +#define NVSW_REG_FIELD_UPGRADE		0x2534
> +#define NVSW_REG_SAFE_BIOS_OFFSET	0x2535
> +#define NVSW_REG_PWM_CONTROL_OFFSET	0x2537
> +#define NVSW_REG_GP5_OFFSET		0x2538
> +#define NVSW_REG_GP6_OFFSET		0x2539
> +#define NVSW_REG_AGGR_OFFSET		0x253a
> +#define NVSW_REG_AGGR_MASK_OFFSET	0x253b
> +#define NVSW_REG_FU_CAP_OFFSET		0x253c
> +#define NVSW_REG_BRD4_OFFSET		0x253d
> +#define NVSW_REG_BRD4_EVENT_OFFSET	0x253e
> +#define NVSW_REG_BRD4_MASK_OFFSET	0x253f
> +#define NVSW_REG_AGGRLO_OFFSET		0x2540
> +#define NVSW_REG_AGGRLO_MASK_OFFSET	0x2541
> +#define NVSW_REG_AGGRCO_OFFSET		0x2542
> +#define NVSW_REG_AGGRCO_MASK_OFFSET	0x2543
> +#define NVSW_REG_BRD1_OFFSET		0x2547
> +#define NVSW_REG_BRD1_EVENT_OFFSET	0x2548
> +#define NVSW_REG_BRD1_MASK_OFFSET	0x2549
> +#define NVSW_REG_BRD2_OFFSET		0x254a
> +#define NVSW_REG_BRD2_EVENT_OFFSET	0x254b
> +#define NVSW_REG_BRD2_MASK_OFFSET	0x254c
> +#define NVSW_REG_HEALTH_OFFSET		0x254d
> +#define NVSW_REG_HEALTH_EVENT_OFFSET	0x254e
> +#define NVSW_REG_HEALTH_MASK_OFFSET	0x254f
> +#define NVSW_REG_ASIC1_HEALTH_OFFSET	0x2550
> +#define NVSW_REG_ASIC1_EVENT_OFFSET	0x2551
> +#define NVSW_REG_ASIC1_MASK_OFFSET	0x2552
> +#define NVSW_REG_ASIC2_HEALTH_OFFSET	0x2553
> +#define NVSW_REG_ASIC2_EVENT_OFFSET	0x2554
> +#define NVSW_REG_ASIC2_MASK_OFFSET	0x2555
> +#define NVSW_REG_VR1_ALERT_OFFSET	0x2558
> +#define NVSW_REG_VR1_ALERT_EVENT_OFFSET	0x2559
> +#define NVSW_REG_VR1_ALERT_MASK_OFFSET	0x255a
> +#define NVSW_REG_VR2_ALERT_OFFSET	0x255e
> +#define NVSW_REG_VR2_ALERT_EVENT_OFFSET	0x255f
> +#define NVSW_REG_VR2_ALERT_MASK_OFFSET	0x2560
> +#define NVSW_REG_PS_DC_OK_OFFSET	0x2567
> +#define NVSW_REG_PS_DC_OK_EVENT_OFFSET	0x2568
> +#define NVSW_REG_PS_DC_OK_MASK_OFFSET	0x2569
> +#define NVSW_REG_CPLD8_PN_OFFSET	0x2573
> +#define NVSW_REG_CPLD8_PN1_OFFSET	0x2574
> +#define NVSW_REG_PG3_OFFSET		0x2576
> +#define NVSW_REG_PG3_EVENT_OFFSET	0x2577
> +#define NVSW_REG_PG3_MASK_OFFSET	0x2578
> +#define NVSW_REG_PG4_OFFSET		0x2579
> +#define NVSW_REG_PG4_EVENT_OFFSET	0x257a
> +#define NVSW_REG_PG4_MASK_OFFSET	0x257b
> +#define NVSW_REG_CPLD6_VER_OFFSET	0x257c
> +#define NVSW_REG_CPLD6_PN_OFFSET	0x257d
> +#define NVSW_REG_CPLD6_PN1_OFFSET	0x257e
> +#define NVSW_REG_CPLD10_PN_OFFSET	0x2580
> +#define NVSW_REG_CPLD10_PN1_OFFSET	0x2581
> +#define NVSW_REG_ASIC3_HEALTH_OFFSET	0x2582
> +#define NVSW_REG_ASIC3_EVENT_OFFSET	0x2583
> +#define NVSW_REG_ASIC3_MASK_OFFSET	0x2584
> +#define NVSW_REG_ASIC4_HEALTH_OFFSET	0x2585
> +#define NVSW_REG_ASIC4_EVENT_OFFSET	0x2586
> +#define NVSW_REG_ASIC4_MASK_OFFSET	0x2587
> +#define NVSW_REG_FAN_OFFSET		0x2588
> +#define NVSW_REG_FAN_EVENT_OFFSET	0x2589
> +#define NVSW_REG_FAN_MASK_OFFSET	0x258a
> +#define NVSW_REG_CPLD5_VER_OFFSET	0x258e
> +#define NVSW_REG_CPLD5_PN_OFFSET	0x258f
> +#define NVSW_REG_CPLD5_PN1_OFFSET	0x2590
> +#define NVSW_REG_EROT_OFFSET		0x2591
> +#define NVSW_REG_EROT_EVENT_OFFSET	0x2592
> +#define NVSW_REG_EROT_MASK_OFFSET	0x2593
> +#define NVSW_REG_EROT_ERR_OFFSET	0x2594
> +#define NVSW_REG_EROT_ERR_EVENT_OFFSET	0x2595
> +#define NVSW_REG_EROT_ERR_MASK_OFFSET	0x2596
> +#define NVSW_REG_PWRB_OFFSET		0x2597
> +#define NVSW_REG_PWRB_EVENT_OFFSET	0x2598
> +#define NVSW_REG_PWRB_MASK_OFFSET	0x2599
> +#define NVSW_REG_FRU1_OFFSET		0x25ac
> +#define NVSW_REG_FRU1_EVENT_OFFSET	0x25ad
> +#define NVSW_REG_FRU1_MASK_OFFSET	0x25ae
> +#define NVSW_REG_LEAK_OFFSET		0x25af
> +#define NVSW_REG_LEAK_EVENT_OFFSET	0x25b0
> +#define NVSW_REG_LEAK_MASK_OFFSET	0x25b1
> +#define NVSW_REG_CURRENT_TEMP_RO	0x25c0
> +#define NVSW_REG_SWITCH_IC_QTY		0x25c1
> +#define NVSW_REG_GP4_RO_OFFSET		0x25c2
> +#define NVSW_REG_SPI_CHNL_SELECT	0x25c3
> +#define NVSW_REG_CPLD5_MVER_OFFSET	0x25c4
> +#define NVSW_REG_CPLD8_VER_OFFSET	0x25c8
> +#define NVSW_REG_CPLD9_VER_OFFSET	0x25c9
> +#define NVSW_REG_CPLD10_VER_OFFSET	0x25ca
> +#define NVSW_REG_CPLD9_PN_OFFSET	0x25cb
> +#define NVSW_REG_CPLD9_PN1_OFFSET	0x25cc
> +#define NVSW_REG_WD2_TMR_OFFSET		0x25cd
> +#define NVSW_REG_WD2_TLEFT_OFFSET	0x25ce
> +#define NVSW_REG_WD2_ACT_OFFSET		0x25cf
> +#define NVSW_REG_WD3_TMR_OFFSET		0x25d1
> +#define NVSW_REG_WD3_TLEFT_OFFSET	0x25d2
> +#define NVSW_REG_WD3_ACT_OFFSET		0x25d3
> +#define NVSW_REG_CPLD7_MVER_OFFSET	0x25d5
> +#define NVSW_REG_CPLD8_MVER_OFFSET	0x25d6
> +#define NVSW_REG_CPLD9_MVER_OFFSET	0x25d7
> +#define NVSW_REG_CPLD10_MVER_OFFSET	0x25d8
> +#define NVSW_REG_CPLD6_MVER_OFFSET	0x25d9
> +#define NVSW_REG_MUX0_OFFSET		0x25da
> +#define NVSW_REG_MUX1_OFFSET		0x25db
> +#define NVSW_REG_MUX2_OFFSET		0x25dc
> +#define NVSW_REG_CPLD1_MVER_OFFSET	0x25de
> +#define NVSW_REG_CPLD2_MVER_OFFSET	0x25df
> +#define NVSW_REG_CPLD3_MVER_OFFSET	0x25e0
> +#define NVSW_REG_CPLD4_MVER_OFFSET	0x25e1
> +#define NVSW_REG_UFM_VERSION_OFFSET	0x25e2
> +#define NVSW_REG_PWM1_OFFSET		0x25e3
> +#define NVSW_REG_TACHO1_OFFSET		0x25e4
> +#define NVSW_REG_TACHO2_OFFSET		0x25e5
> +#define NVSW_REG_TACHO3_OFFSET		0x25e6
> +#define NVSW_REG_TACHO4_OFFSET		0x25e7
> +#define NVSW_REG_TACHO5_OFFSET		0x25e8
> +#define NVSW_REG_TACHO6_OFFSET		0x25e9
> +#define NVSW_REG_TACHO7_OFFSET		0x25eb
> +#define NVSW_REG_TACHO8_OFFSET		0x25ec
> +#define NVSW_REG_TACHO9_OFFSET		0x25ed
> +#define NVSW_REG_TACHO10_OFFSET		0x25ee
> +#define NVSW_REG_TACHO11_OFFSET		0x25ef
> +#define NVSW_REG_TACHO12_OFFSET		0x25f0
> +#define NVSW_REG_FAN_CAP1_OFFSET	0x25f5
> +#define NVSW_REG_FAN_DRW_CAP_OFFSET	0x25f7
> +#define NVSW_REG_TACHO_SPEED_OFFSET	0x25f8
> +#define NVSW_REG_SYS_CPBLTY0		0x25f9
> +#define NVSW_REG_CONFIG1_OFFSET		0x25fb
> +#define NVSW_REG_CONFIG2_OFFSET		0x25fc
> +#define NVSW_REG_CONFIG3_OFFSET		0x25fd
> +#define NVSW_REG_MIN			0x2500
> +#define NVSW_REG_MAX			0x26ff
> +
> +#define NVSW_AGGR_MASK_COMEX		BIT(0)
> +#define NVSW_LOW_AGGR_MASK_I2C		BIT(6)
> +#define NVSW_AGGR_MASK			BIT(2)
> +#define NVSW_LOW_AGGR_MASK_LOW		0xe0
> +#define NVSW_REG_FRU1_MASK		GENMASK(3, 0)
> +#define NVSW_LEAK_MASK			GENMASK(5, 0)
> +#define NVSW_SSD_I2C_ALERT_MASK		BIT(0)
> +#define NVSW_WD_EXP_MASK		BIT(1)
> +#define NVSW_5V_USB_MASK		BIT(2)
> +#define NVSW_PCB_TEMP1_MASK		BIT(3)
> +#define NVSW_PCB_TEMP2_MASK		BIT(4)
> +#define NVSW_SGMII_MASK			BIT(5)
> +#define NVSW_SDD_PG_MASK		BIT(6)
> +#define NVSW_LEAK_AGGR_MASK		BIT(7)
> +#define NVSW_EROT_MASK			GENMASK(2, 0)
> +#define NVSW_FAN_NG_MASK		GENMASK(6, 0)
> +#define NVSW_ASIC_MASK			GENMASK(1, 0)
> +#define NVSW_ASIC2_MASK			GENMASK(3, 2)
> +#define NVSW_ASIC3_MASK			GENMASK(5, 4)
> +#define NVSW_ASIC4_MASK			GENMASK(7, 6)
> +#define NVSW_ASICS_MASK			GENMASK(7, 0)
> +#define NVSW_LOW_AGGR_MASK_ASIC1	BIT(0)
> +#define NVSW_LOW_AGGR_MASK_ASIC2	BIT(1)
> +#define NVSW_LOW_AGGR_MASK_ASIC3	BIT(2)
> +#define NVSW_PWR_BUTTON_MASK		BIT(0)
> +#define NVSW_AMB_TEMP_SENSE_MASK	BIT(1)
> +#define NVSW_GRACEFUL_POWER_OFF_MASK	BIT(2)
> +#define NVSW_CPU_POWER_OFF_READY_MASK	BIT(3)
> +#define NVSW_CPU_RESET_MASK		BIT(4)
> +#define NVSW_APML_SMB_ALERT_MASK	BIT(5)
> +#define NVSW_CPU_UNEXP_POWER_OFF_MASK	BIT(6)
> +#define NVSW_UID_PUSH_BUTTON_MASK	BIT(7)
> +#define NVSW_RTC_MASK			BIT(0)
> +#define NVSW_HOT_SWAP_ALERT_MASK	BIT(1)
> +#define NVSW_LED_LO_NIBBLE_MASK		GENMASK(7, 4)
> +#define NVSW_LED_HI_NIBBLE_MASK		GENMASK(3, 0)
> +#define NVSW_UART_SEL_MASK		GENMASK(7, 6)
> +#define NVSW_UART_BAUD_MASK		GENMASK(3, 0)
> +#define NVSW_BIOS_STATUS_MASK		GENMASK(3, 1)
> +#define NVSW_REG_RESET_MASK		BIT(1)
> +#define NVSW_MASTER_MASK		BIT(5)
> +#define NVSW_FU_CAP_MASK		GENMASK(1, 0)
> +#define NVSW_WD_RESET_ACT_MASK		GENMASK(7, 1)
> +#define NVSW_WD_FAN_ACT_MASK		(GENMASK(7, 0) & ~BIT(4))
> +#define NVSW_WD_TYPE2_TO_MASK		0
> +#define NVSW_WD3_DFLT_TIMEOUT		600
> +#define NVSW_I2C_CAP_BIT		0x04
> +#define NVSW_I2C_CAP_MASK		GENMASK(5, NVSW_I2C_CAP_BIT)
> +#define NVSW_I2C_TRAN_END_L		BIT(5)
> +
> +#define NVSW_NR_NONE			-1
> +#define NVSW_MUX_MAX			2
> +#define NVSW_WD_MAX			2
> +
> +/**
> + * struct nvsw_core - device private data
> + * @dev: device;
> + * @client: I2C client device;
> + * @regmap: device register map;
> + * @regio_data: register access platform data;
> + * @regio: register access device;
> + * @hotplug_data: hotplug platform data;
> + * @hotplug: hotplug device;
> + * @led: led device;
> + * @led_data: led platform data;
> + * @fan: fan device;
> + * @fan_data: fan platform data;
> + * @wd: watchdog devices;
> + * @wd_data: watchdog platform data;
> + * @set_reg_default: set default registers callback;
> + * @mux_init: mux initialization callback;
> + * @mux_exit: mux de-initialization callback;
> + * @mux: mux devices;
> + * @mux_num: number of mux devices;
> + */
> +struct nvsw_core {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	struct mlxreg_core_platform_data *regio_data;
> +	struct platform_device *regio;
> +	struct mlxreg_core_hotplug_platform_data *hotplug_data;
> +	struct platform_device *hotplug;
> +	struct platform_device *led;
> +	struct mlxreg_core_platform_data *led_data;
> +	struct platform_device *fan;
> +	struct mlxreg_core_platform_data *fan_data;
> +	struct platform_device *wd[NVSW_WD_MAX];
> +	struct mlxreg_core_platform_data *wd_data[NVSW_WD_MAX];
> +	int (*set_reg_default)(struct regmap *regmap);
> +	int (*mux_init)(struct nvsw_core *nvsw_core);
> +	void (*mux_exit)(struct nvsw_core *nvsw_core);
> +	struct platform_device *mux[NVSW_MUX_MAX];
> +	u32 mux_num;
> +};
> +
> +/* Platform core init/exit functions. */
> +int nvsw_core_init(struct nvsw_core *nvsw_core);
> +void nvsw_core_exit(struct nvsw_core *nvsw_core);
> +
> +#endif /* !defined(__NVSW_H__) */
> 
> 
