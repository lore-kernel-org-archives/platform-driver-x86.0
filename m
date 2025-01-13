Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FEC22DF94
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 17:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736788342; cv=none; b=AUL5dt6XbjqCWVXOZF4OrX/qdsQ164wWbDeHu0tGBk8vQO7HjQpOUAnI1J4lIDvBz9PvRU1o7r2lDM/NARL4tUaWAvF7zcO5QCGjbnkQyrWRrb7gRLDHaOHBXMF/DYRM3RRBGU2PpdC4PqShTOdTO4N9hmxmYcAQi1dvn60IWk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736788342; c=relaxed/simple;
	bh=ApGzIRMLzyfPtohWfm4YM5jdjGEbBE9N/xl+D6L8qkE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mE5FUbs2PE8u4vok5qHkWdTH3fs6zngHe8cWu+iC36iNe5m+pUO82ZWCV+TCgPa0lvb4EcvcDTw3awt6j5zFtDAbu1Dh1CYqOBfKJA2AiEDB45Fov8IbZFzI0d6gASat+DOZxdwVz9zvtOkNAqFuBK1rPIDPgV1L/BXW1k30tSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWss91MT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWss91MT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736788338; x=1768324338;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ApGzIRMLzyfPtohWfm4YM5jdjGEbBE9N/xl+D6L8qkE=;
  b=PWss91MTf7Rum+hv7y8nHSHjqyi5TgDDqwGOHrFrL3Mv342PpmyA6Mk2
   EnyteFebqMgRADNqT4J+0UPH9/zFYgK9GMXdyPDb0K1iBH7PoI/AHwdT8
   i/IeqPDAB9Gk0BO0syVSnEyZGi1LTb0FGjf+Unh0qnlTeztqHD5l4speH
   FMGu+sYR3HnKrZUCBQsOyLAU9b+7F3HSZ8YGRadc8wTpRKIm6CxPw8Oji
   uP5H/go13KWnntqi7wcElnMH9a0B2U++DoGy+1q4dIfB+kqQ2VH4f0urz
   ajEf1+1zLP9G67TpiTwo68gzjwf9fNdHMwGVDuqDihyhnLmw64EbmOiIp
   g==;
X-CSE-ConnectionGUID: LvN5VprhTPSGjCBY2fFBag==
X-CSE-MsgGUID: t5vg+OJLT++TReKFTIbyUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36972246"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36972246"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:12:17 -0800
X-CSE-ConnectionGUID: pCVxqElcSqCJpIaHkpc0aw==
X-CSE-MsgGUID: ytYs5M4pQmqQ+pTwyYZO1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104412642"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.121])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:12:12 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Jan 2025 19:12:08 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v2 07/10] platform: mellanox: Introduce
 support of Nvidia smart switch
In-Reply-To: <20250113084337.24763-8-vadimp@nvidia.com>
Message-ID: <04557916-88ca-2a8d-3a20-78960f68dc34@linux.intel.com>
References: <20250113084337.24763-1-vadimp@nvidia.com> <20250113084337.24763-8-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2105703565-1736788328=:881"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2105703565-1736788328=:881
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 13 Jan 2025, Vadim Pasternak wrote:

> Provide platform support for Nvidia Smart Switch SN4280.
>=20
> The Smart Switch equipped with:
> - Nvidia COME module based on AMD EPYC=E2=84=A2 Embedded 3451 CPU.
> - Nvidia Spectrum-3 ASIC.
> - Four DPUs, each equipped with Nvidia BF3 ARM based processor and
>   with Lattice LFD2NX-40 FPGA device.
> - 28xQSFP-DD external ports.
> - Two power supplies.
> - Four cooling drawers.
>=20
> Introduce configuration structures for the new systems to allow proper
> activation of the required platform drivers.
>=20
> Reviewed-by: Ciju Rajan K <crajank@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlx-platform.c | 1965 +++++++++++++++++++---
>  1 file changed, 1711 insertions(+), 254 deletions(-)
>=20
> diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/=
mellanox/mlx-platform.c
> index bd3bb06ff8f2..9d237852d3e0 100644
> --- a/drivers/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/mellanox/mlx-platform.c
> @@ -38,6 +38,7 @@
>  #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET=090x0b
>  #define MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET=090x17
>  #define MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET=090x19
> +#define MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET=090x1b
>  #define MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET=090x1c
>  #define MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET=090x1d
>  #define MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET=090x1e
> @@ -49,9 +50,11 @@
>  #define MLXPLAT_CPLD_LPC_REG_LED5_OFFSET=090x24
>  #define MLXPLAT_CPLD_LPC_REG_LED6_OFFSET=090x25
>  #define MLXPLAT_CPLD_LPC_REG_LED7_OFFSET=090x26
> +#define MLXPLAT_CPLD_LPC_REG_LED8_OFFSET=090x27
>  #define MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION=090x2a
>  #define MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET=090x2b
>  #define MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET=090x2d
> +#define MLXPLAT_CPLD_LPC_REG_GP1_RO_OFFSET=090x2c
>  #define MLXPLAT_CPLD_LPC_REG_GP0_OFFSET=09=090x2e
>  #define MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET=090x2f
>  #define MLXPLAT_CPLD_LPC_REG_GP1_OFFSET=09=090x30
> @@ -71,12 +74,14 @@
>  #define MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET=090x43
>  #define MLXPLAT_CPLD_LPC_REG_AGGRCX_OFFSET=090x44
>  #define MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET 0x45
> +#define MLXPLAT_CPLD_LPC_REG_GP3_OFFSET=09=090x46
>  #define MLXPLAT_CPLD_LPC_REG_BRD_OFFSET=09=090x47
>  #define MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET=090x48
>  #define MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET=090x49
>  #define MLXPLAT_CPLD_LPC_REG_GWP_OFFSET=09=090x4a
>  #define MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET=090x4b
>  #define MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET=090x4c
> +#define MLXPLAT_CPLD_LPC_REG_GPI_MASK_OFFSET=090x4e
>  #define MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET 0x50
>  #define MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET=090x51
>  #define MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET=090x52
> @@ -88,15 +93,20 @@
>  #define MLXPLAT_CPLD_LPC_REG_PSU_OFFSET=09=090x58
>  #define MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET=090x59
>  #define MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET=090x5a
> +#define MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET=090x5e
>  #define MLXPLAT_CPLD_LPC_REG_PWR_OFFSET=09=090x64
>  #define MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET=090x65
>  #define MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET=090x66
> +#define MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET=090x6a
>  #define MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET=090x70
>  #define MLXPLAT_CPLD_LPC_REG_LC_IN_EVENT_OFFSET=090x71
>  #define MLXPLAT_CPLD_LPC_REG_LC_IN_MASK_OFFSET=090x72
>  #define MLXPLAT_CPLD_LPC_REG_FAN_OFFSET=09=090x88
>  #define MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET=090x89
>  #define MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET=090x8a
> +#define MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET=090x8b
> +#define MLXPLAT_CPLD_LPC_REG_FAN2_EVENT_OFFSET=090x8c
> +#define MLXPLAT_CPLD_LPC_REG_FAN2_MASK_OFFSET=090x8d
>  #define MLXPLAT_CPLD_LPC_REG_CPLD5_VER_OFFSET=090x8e
>  #define MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET=090x8f
>  #define MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET=090x90
> @@ -128,10 +138,15 @@
>  #define MLXPLAT_CPLD_LPC_REG_LC_SD_EVENT_OFFSET=090xaa
>  #define MLXPLAT_CPLD_LPC_REG_LC_SD_MASK_OFFSET=090xab
>  #define MLXPLAT_CPLD_LPC_REG_LC_PWR_ON=09=090xb2
> +#define MLXPLAT_CPLD_LPC_REG_TACHO19_OFFSET=090xb4
> +#define MLXPLAT_CPLD_LPC_REG_TACHO20_OFFSET=090xb5
>  #define MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET=090xb6
>  #define MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET=090xb7
>  #define MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET=090xb8
>  #define MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET=090xb9
> +#define MLXPLAT_CPLD_LPC_REG_TACHO17_OFFSET=090xba
> +#define MLXPLAT_CPLD_LPC_REG_TACHO18_OFFSET=090xbb
> +#define MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET=090xc1
>  #define MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET=090xc2
>  #define MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT=090xc3
>  #define MLXPLAT_CPLD_LPC_REG_CPLD5_MVER_OFFSET=090xc4
> @@ -182,6 +197,9 @@
>  #define MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET=090xfb
>  #define MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET=090xfc
>  #define MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET=090xfd
> +#define MLXPLAT_CPLD_LPC_REG_TACHO15_OFFSET=090xfe
> +#define MLXPLAT_CPLD_LPC_REG_TACHO16_OFFSET=090xff
> +
>  #define MLXPLAT_CPLD_LPC_IO_RANGE=09=090x100
> =20
>  #define MLXPLAT_CPLD_LPC_PIO_OFFSET=09=090x10000UL
> @@ -210,9 +228,15 @@
>  #define MLXPLAT_CPLD_AGGR_MASK_NG_DEF=090x04
>  #define MLXPLAT_CPLD_AGGR_MASK_COMEX=09BIT(0)
>  #define MLXPLAT_CPLD_AGGR_MASK_LC=09BIT(3)
> +#define MLXPLAT_CPLD_AGGR_MASK_DPU_BRD=09BIT(4)
> +#define MLXPLAT_CPLD_AGGR_MASK_DPU_CORE=09BIT(5)
>  #define MLXPLAT_CPLD_AGGR_MASK_MODULAR=09(MLXPLAT_CPLD_AGGR_MASK_NG_DEF =
| \
>  =09=09=09=09=09 MLXPLAT_CPLD_AGGR_MASK_COMEX | \
>  =09=09=09=09=09 MLXPLAT_CPLD_AGGR_MASK_LC)
> +#define MLXPLAT_CPLD_AGGR_MASK_SMART_SW=09(MLXPLAT_CPLD_AGGR_MASK_COMEX =
| \
> +=09=09=09=09=09 MLXPLAT_CPLD_AGGR_MASK_NG_DEF | \
> +=09=09=09=09=09 MLXPLAT_CPLD_AGGR_MASK_DPU_BRD | \
> +=09=09=09=09=09 MLXPLAT_CPLD_AGGR_MASK_DPU_CORE)
>  #define MLXPLAT_CPLD_AGGR_MASK_LC_PRSNT=09BIT(0)
>  #define MLXPLAT_CPLD_AGGR_MASK_LC_RDY=09BIT(1)
>  #define MLXPLAT_CPLD_AGGR_MASK_LC_PG=09BIT(2)
> @@ -235,15 +259,24 @@
>  #define MLXPLAT_CPLD_PWR_MASK=09=09GENMASK(1, 0)
>  #define MLXPLAT_CPLD_PSU_EXT_MASK=09GENMASK(3, 0)
>  #define MLXPLAT_CPLD_PWR_EXT_MASK=09GENMASK(3, 0)
> +#define MLXPLAT_CPLD_PSU_XDR_MASK=09GENMASK(7, 0)
> +#define MLXPLAT_CPLD_PWR_XDR_MASK=09GENMASK(7, 0)
>  #define MLXPLAT_CPLD_FAN_MASK=09=09GENMASK(3, 0)
>  #define MLXPLAT_CPLD_ASIC_MASK=09=09GENMASK(1, 0)
> +#define MLXPLAT_CPLD_ASIC_XDR_MASK=09GENMASK(3, 0)
>  #define MLXPLAT_CPLD_FAN_NG_MASK=09GENMASK(6, 0)
> +#define MLXPLAT_CPLD_FAN_XDR_MASK=09GENMASK(7, 0)
>  #define MLXPLAT_CPLD_LED_LO_NIBBLE_MASK=09GENMASK(7, 4)
>  #define MLXPLAT_CPLD_LED_HI_NIBBLE_MASK=09GENMASK(3, 0)
>  #define MLXPLAT_CPLD_VOLTREG_UPD_MASK=09GENMASK(5, 4)
>  #define MLXPLAT_CPLD_GWP_MASK=09=09GENMASK(0, 0)
>  #define MLXPLAT_CPLD_EROT_MASK=09=09GENMASK(1, 0)
>  #define MLXPLAT_CPLD_FU_CAP_MASK=09GENMASK(1, 0)
> +#define MLXPLAT_CPLD_PSU_CAP_MASK=09GENMASK(7, 0)
> +#define MLXPLAT_CPLD_FAN_CAP_MASK=09GENMASK(7, 0)
> +#define MLXPLAT_CPLD_ASIC_CAP_MASK=09GENMASK(7, 0)
> +#define MLXPLAT_CPLD_BIOS_STATUS_MASK=09GENMASK(3, 1)
> +#define MLXPLAT_CPLD_DPU_MASK=09=09GENMASK(3, 0)
>  #define MLXPLAT_CPLD_PWR_BUTTON_MASK=09BIT(0)
>  #define MLXPLAT_CPLD_LATCH_RST_MASK=09BIT(6)
>  #define MLXPLAT_CPLD_THERMAL1_PDB_MASK=09BIT(3)
> @@ -267,6 +300,9 @@
>  /* Masks for aggregation for modular systems */
>  #define MLXPLAT_CPLD_LPC_LC_MASK=09GENMASK(7, 0)
> =20
> +/* Masks for aggregation for smart switch systems */
> +#define MLXPLAT_CPLD_LPC_SM_SW_MASK=09GENMASK(7, 0)
> +
>  #define MLXPLAT_CPLD_HALT_MASK=09=09BIT(3)
>  #define MLXPLAT_CPLD_RESET_MASK=09=09GENMASK(7, 1)
> =20
> @@ -297,15 +333,18 @@
>  #define MLXPLAT_CPLD_NR_NONE=09=09=09-1
>  #define MLXPLAT_CPLD_PSU_DEFAULT_NR=09=0910
>  #define MLXPLAT_CPLD_PSU_MSNXXXX_NR=09=094
> +#define MLXPLAT_CPLD_PSU_XDR_NR=09=09=093
>  #define MLXPLAT_CPLD_FAN1_DEFAULT_NR=09=0911
>  #define MLXPLAT_CPLD_FAN2_DEFAULT_NR=09=0912
>  #define MLXPLAT_CPLD_FAN3_DEFAULT_NR=09=0913
>  #define MLXPLAT_CPLD_FAN4_DEFAULT_NR=09=0914
>  #define MLXPLAT_CPLD_NR_ASIC=09=09=093
>  #define MLXPLAT_CPLD_NR_LC_BASE=09=09=0934
> +#define MLXPLAT_CPLD_NR_DPU_BASE=09=0918
> =20
>  #define MLXPLAT_CPLD_NR_LC_SET(nr)=09(MLXPLAT_CPLD_NR_LC_BASE + (nr))
>  #define MLXPLAT_CPLD_LC_ADDR=09=090x32
> +#define MLXPLAT_CPLD_DPU_ADDR=09=090x68
> =20
>  /* Masks and default values for watchdogs */
>  #define MLXPLAT_CPLD_WD1_CLEAR_MASK=09GENMASK(7, 1)
> @@ -320,6 +359,7 @@
>  #define MLXPLAT_CPLD_WD_DFLT_TIMEOUT=0930
>  #define MLXPLAT_CPLD_WD3_DFLT_TIMEOUT=09600
>  #define MLXPLAT_CPLD_WD_MAX_DEVS=092
> +#define MLXPLAT_CPLD_DPU_MAX_DEVS=094
> =20
>  #define MLXPLAT_CPLD_LPC_SYSIRQ=09=0917
> =20
> @@ -346,6 +386,7 @@
>   * @pdev_io_regs - register access platform devices
>   * @pdev_fan - FAN platform devices
>   * @pdev_wd - array of watchdog platform devices
> + * pdev_dpu - array of Data Processor Unit platform devices
>   * @regmap: device register map
>   * @hotplug_resources: system hotplug resources
>   * @hotplug_resources_size: size of system hotplug resources
> @@ -360,6 +401,7 @@ struct mlxplat_priv {
>  =09struct platform_device *pdev_io_regs;
>  =09struct platform_device *pdev_fan;
>  =09struct platform_device *pdev_wd[MLXPLAT_CPLD_WD_MAX_DEVS];
> +=09struct platform_device *pdev_dpu[MLXPLAT_CPLD_DPU_MAX_DEVS];
>  =09void *regmap;
>  =09struct resource *hotplug_resources;
>  =09unsigned int hotplug_resources_size;
> @@ -626,6 +668,21 @@ static struct i2c_board_info mlxplat_mlxcpld_pwr_ng8=
00[] =3D {
>  =09},
>  };
> =20
> +static struct i2c_board_info mlxplat_mlxcpld_xdr_pwr[] =3D {
> +=09{
> +=09=09I2C_BOARD_INFO("dps460", 0x5d),
> +=09},
> +=09{
> +=09=09I2C_BOARD_INFO("dps460", 0x5c),
> +=09},
> +=09{
> +=09=09I2C_BOARD_INFO("dps460", 0x5e),
> +=09},
> +=09{
> +=09=09I2C_BOARD_INFO("dps460", 0x5f),
> +=09},
> +};
> +
>  static struct i2c_board_info mlxplat_mlxcpld_fan[] =3D {
>  =09{
>  =09=09I2C_BOARD_INFO("24c32", 0x50),
> @@ -2370,205 +2427,665 @@ struct mlxreg_core_hotplug_platform_data mlxpla=
t_mlxcpld_rack_switch_data =3D {
>  =09.mask_low =3D MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
>  };
> =20
> -/* Callback performs graceful shutdown after notification about power bu=
tton event */
> -static int
> -mlxplat_mlxcpld_l1_switch_pwr_events_handler(void *handle, enum mlxreg_h=
otplug_kind kind,
> -=09=09=09=09=09     u8 action)
> -{
> -=09if (action) {
> -=09=09dev_info(&mlxplat_dev->dev, "System shutdown due to short press of=
 power button");
> -=09=09kernel_power_off();
> -=09}
> -
> -=09return 0;
> -}
> -
> -static struct mlxreg_core_hotplug_notifier mlxplat_mlxcpld_l1_switch_pwr=
_events_notifier =3D {
> -=09.user_handler =3D mlxplat_mlxcpld_l1_switch_pwr_events_handler,
> -};
> -
> -/* Platform hotplug for l1 switch systems family data */
> -static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_pwr_events_item=
s_data[] =3D {
> +/* Platform hotplug XDR and smart switch system family data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_xdr_psu_items_data[] =3D =
{
>  =09{
> -=09=09.label =3D "power_button",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_PWR_BUTTON_MASK,
> +=09=09.label =3D "psu1",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +=09=09.mask =3D BIT(0),
> +=09=09.slot =3D 1,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
>  =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> -=09=09.hpdev.action =3D MLXREG_HOTPLUG_DEVICE_NO_ACTION,
> -=09=09.hpdev.notifier =3D &mlxplat_mlxcpld_l1_switch_pwr_events_notifier=
,
>  =09},
> -};
> -
> -/* Callback activates latch reset flow after notification about intrusio=
n event */
> -static int
> -mlxplat_mlxcpld_l1_switch_intrusion_events_handler(void *handle, enum ml=
xreg_hotplug_kind kind,
> -=09=09=09=09=09=09   u8 action)
> -{
> -=09struct mlxplat_priv *priv =3D platform_get_drvdata(mlxplat_dev);
> -=09u32 regval;
> -=09int err;
> -
> -=09err =3D regmap_read(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET, &r=
egval);
> -=09if (err)
> -=09=09goto fail_regmap_read;
> -
> -=09if (action) {
> -=09=09dev_info(&mlxplat_dev->dev, "Detected intrusion - system latch is =
opened");
> -=09=09err =3D regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET=
,
> -=09=09=09=09   regval | MLXPLAT_CPLD_LATCH_RST_MASK);
> -=09} else {
> -=09=09dev_info(&mlxplat_dev->dev, "System latch is properly closed");
> -=09=09err =3D regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET=
,
> -=09=09=09=09   regval & ~MLXPLAT_CPLD_LATCH_RST_MASK);
> -=09}
> -
> -=09if (err)
> -=09=09goto fail_regmap_write;
> -
> -=09return 0;
> -
> -fail_regmap_read:
> -fail_regmap_write:
> -=09dev_err(&mlxplat_dev->dev, "Register access failed");
> -=09return err;
> -}
> -
> -static struct mlxreg_core_hotplug_notifier mlxplat_mlxcpld_l1_switch_int=
rusion_events_notifier =3D {
> -=09.user_handler =3D mlxplat_mlxcpld_l1_switch_intrusion_events_handler,
> -};
> -
> -static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_health_events_i=
tems_data[] =3D {
>  =09{
> -=09=09.label =3D "thermal1_pdb",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_THERMAL1_PDB_MASK,
> +=09=09.label =3D "psu2",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +=09=09.mask =3D BIT(1),
> +=09=09.slot =3D 2,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
>  =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
>  =09},
>  =09{
> -=09=09.label =3D "thermal2_pdb",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_THERMAL2_PDB_MASK,
> +=09=09.label =3D "psu3",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +=09=09.mask =3D BIT(2),
> +=09=09.slot =3D 3,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
>  =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
>  =09},

Why's the diff such a mess in this patch?

Are you perhaps doing two things in this patch, that is, reorganizing the=
=20
existing code/structs and adding new stuff? If that's the case, please try=
=20
to do the reorganization in another patch before this one so the diff=20
spaghetti is hopefully avoided.

--
 i.

>  =09{
> -=09=09.label =3D "intrusion",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_INTRUSION_MASK,
> +=09=09.label =3D "psu4",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +=09=09.mask =3D BIT(3),
> +=09=09.slot =3D 4,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
>  =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> -=09=09.hpdev.action =3D MLXREG_HOTPLUG_DEVICE_NO_ACTION,
> -=09=09.hpdev.notifier =3D &mlxplat_mlxcpld_l1_switch_intrusion_events_no=
tifier,
>  =09},
>  =09{
> -=09=09.label =3D "pwm_pg",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_PWM_PG_MASK,
> +=09=09.label =3D "psu5",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +=09=09.mask =3D BIT(4),
> +=09=09.slot =3D 5,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
>  =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
>  =09},
> -};
> -
> -static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] =
=3D {
> -=09{
> -=09=09.data =3D mlxplat_mlxcpld_default_ng_fan_items_data,
> -=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_FAN_NG_MASK,
> -=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
> -=09=09.inversed =3D 1,
> -=09=09.health =3D false,
> -=09},
> -=09{
> -=09=09.data =3D mlxplat_mlxcpld_erot_ap_items_data,
> -=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_EROT_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_EROT_MASK,
> -=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
> -=09=09.inversed =3D 1,
> -=09=09.health =3D false,
> -=09},
>  =09{
> -=09=09.data =3D mlxplat_mlxcpld_erot_error_items_data,
> -=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_EROT_MASK,
> -=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
> -=09=09.inversed =3D 1,
> -=09=09.health =3D false,
> +=09=09.label =3D "psu6",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +=09=09.mask =3D BIT(5),
> +=09=09.slot =3D 6,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
>  =09},
>  =09{
> -=09=09.data =3D mlxplat_mlxcpld_l1_switch_pwr_events_items_data,
> -=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_PWR_BUTTON_MASK,
> -=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_pwr_events_items_d=
ata),
> -=09=09.inversed =3D 1,
> -=09=09.health =3D false,
> +=09=09.label =3D "psu7",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +=09=09.mask =3D BIT(6),
> +=09=09.slot =3D 7,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
>  =09},
>  =09{
> -=09=09.data =3D mlxplat_mlxcpld_l1_switch_health_events_items_data,
> -=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_L1_CHA_HEALTH_MASK,
> -=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_health_events_item=
s_data),
> -=09=09.inversed =3D 1,
> -=09=09.health =3D false,
> -=09=09.ind =3D 8,
> +=09=09.label =3D "psu8",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +=09=09.mask =3D BIT(7),
> +=09=09.slot =3D 8,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
>  =09},
>  };
> =20
> -static
> -struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data =
=3D {
> -=09.items =3D mlxplat_mlxcpld_l1_switch_events_items,
> -=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_events_items),
> -=09.cell =3D MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
> -=09.mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COME=
X,
> -=09.cell_low =3D MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> -=09.mask_low =3D MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_=
MASK_PWR_BUT,
> -};
> -
> -/* Platform led default data */
> -static struct mlxreg_core_data mlxplat_mlxcpld_default_led_data[] =3D {
> +static struct mlxreg_core_data mlxplat_mlxcpld_xdr_pwr_items_data[] =3D =
{
>  =09{
> -=09=09.label =3D "status:green",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.label =3D "pwr1",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +=09=09.mask =3D BIT(0),
> +=09=09.slot =3D 1,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_pwr[0],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_PSU_MSNXXXX_NR,
>  =09},
>  =09{
> -=09=09.label =3D "status:red",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
> +=09=09.label =3D "pwr2",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +=09=09.mask =3D BIT(1),
> +=09=09.slot =3D 2,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_pwr[1],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_PSU_MSNXXXX_NR,
>  =09},
>  =09{
> -=09=09.label =3D "psu:green",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.label =3D "pwr3",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +=09=09.mask =3D BIT(2),
> +=09=09.slot =3D 3,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_ext_pwr[0],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_PSU_MSNXXXX_NR,
>  =09},
>  =09{
> -=09=09.label =3D "psu:red",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.label =3D "pwr4",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +=09=09.mask =3D BIT(3),
> +=09=09.slot =3D 4,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_ext_pwr[1],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_PSU_MSNXXXX_NR,
>  =09},
>  =09{
> -=09=09.label =3D "fan1:green",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.label =3D "pwr5",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +=09=09.mask =3D BIT(4),
> +=09=09.slot =3D 5,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_xdr_pwr[0],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_PSU_XDR_NR,
>  =09},
>  =09{
> -=09=09.label =3D "fan1:red",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.label =3D "pwr6",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +=09=09.mask =3D BIT(5),
> +=09=09.slot =3D 6,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_xdr_pwr[1],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_PSU_XDR_NR,
>  =09},
>  =09{
> -=09=09.label =3D "fan2:green",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.label =3D "pwr7",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +=09=09.mask =3D BIT(6),
> +=09=09.slot =3D 7,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_xdr_pwr[2],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_PSU_XDR_NR,
>  =09},
>  =09{
> -=09=09.label =3D "fan2:red",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.label =3D "pwr8",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +=09=09.mask =3D BIT(7),
> +=09=09.slot =3D 8,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_xdr_pwr[3],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_PSU_XDR_NR,
>  =09},
> +};
> +
> +static struct mlxreg_core_data mlxplat_mlxcpld_xdr_fan_items_data[] =3D =
{
>  =09{
> -=09=09.label =3D "fan3:green",
> +=09=09.label =3D "fan1",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09=09.mask =3D BIT(0),
> +=09=09.slot =3D 1,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> +=09=09.bit =3D BIT(0),
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "fan2",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09=09.mask =3D BIT(1),
> +=09=09.slot =3D 2,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> +=09=09.bit =3D BIT(1),
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "fan3",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09=09.mask =3D BIT(2),
> +=09=09.slot =3D 3,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> +=09=09.bit =3D BIT(2),
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "fan4",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09=09.mask =3D BIT(3),
> +=09=09.slot =3D 4,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> +=09=09.bit =3D BIT(3),
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "fan5",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09=09.mask =3D BIT(4),
> +=09=09.slot =3D 5,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> +=09=09.bit =3D BIT(4),
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "fan6",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09=09.mask =3D BIT(5),
> +=09=09.slot =3D 6,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> +=09=09.bit =3D BIT(5),
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "fan7",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09=09.mask =3D BIT(6),
> +=09=09.slot =3D 7,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> +=09=09.bit =3D BIT(6),
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "fan8",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09=09.mask =3D BIT(7),
> +=09=09.slot =3D 8,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> +=09=09.bit =3D BIT(7),
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +};
> +
> +static struct mlxreg_core_data mlxplat_mlxcpld_xdr_asic1_items_data[] =
=3D {
> +=09{
> +=09=09.label =3D "asic1",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_ASIC_MASK,
> +=09=09.slot =3D 1,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_ASIC_CAP_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09}
> +};
> +
> +/* Platform hotplug for smart switch systems families data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_smart_switch_dpu_ready_da=
ta[] =3D {
> +=09{
> +=09=09.label =3D "dpu1_ready",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
> +=09=09.mask =3D BIT(0),
> +=09=09.slot =3D 1,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "dpu2_ready",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
> +=09=09.mask =3D BIT(1),
> +=09=09.slot =3D 2,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "dpu3_ready",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
> +=09=09.mask =3D BIT(2),
> +=09=09.slot =3D 3,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "dpu4_ready",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
> +=09=09.mask =3D BIT(3),
> +=09=09.slot =3D 4,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +};
> +
> +static struct mlxreg_core_data mlxplat_mlxcpld_smart_switch_dpu_shtdn_re=
ady_data[] =3D {
> +=09{
> +=09=09.label =3D "dpu1_shtdn_ready",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
> +=09=09.mask =3D BIT(0),
> +=09=09.slot =3D 1,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "dpu2_shtdn_ready",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
> +=09=09.mask =3D BIT(1),
> +=09=09.slot =3D 2,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "dpu3_shtdn_ready",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
> +=09=09.mask =3D BIT(2),
> +=09=09.slot =3D 3,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "dpu4_shtdn_ready",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
> +=09=09.mask =3D BIT(3),
> +=09=09.slot =3D 4,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +};
> +
> +static struct mlxreg_core_item mlxplat_mlxcpld_smart_switch_items[] =3D =
{
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_xdr_psu_items_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_PSU_XDR_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_xdr_psu_items_data),
> +=09=09.inversed =3D 1,
> +=09=09.health =3D false,
> +=09},
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_xdr_pwr_items_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_PWR_XDR_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_xdr_pwr_items_data),
> +=09=09.inversed =3D 0,
> +=09=09.health =3D false,
> +=09},
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_xdr_fan_items_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_FAN_CAP_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_xdr_fan_items_data),
> +=09=09.inversed =3D 1,
> +=09=09.health =3D false,
> +=09},
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_xdr_asic1_items_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_ASIC_XDR_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_ASIC_CAP_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_xdr_asic1_items_data),
> +=09=09.inversed =3D 0,
> +=09=09.health =3D true,
> +=09},
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_smart_switch_dpu_ready_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_DPU_CORE,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_dpu_ready_data)=
,
> +=09=09.inversed =3D 1,
> +=09=09.health =3D false,
> +=09},
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_smart_switch_dpu_shtdn_ready_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_DPU_CORE,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
> +=09=09.capability_mask =3D MLXPLAT_CPLD_DPU_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_dpu_shtdn_ready=
_data),
> +=09=09.inversed =3D 1,
> +=09=09.health =3D false,
> +=09},
> +};
> +
> +static
> +struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_smart_switch_da=
ta =3D {
> +=09.items =3D mlxplat_mlxcpld_smart_switch_items,
> +=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_items),
> +=09.cell =3D MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
> +=09.mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COME=
X |
> +=09=09MLXPLAT_CPLD_AGGR_MASK_DPU_BRD | MLXPLAT_CPLD_AGGR_MASK_DPU_CORE,
> +=09.cell_low =3D MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> +=09.mask_low =3D MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
> +};
> +
> +/* Smart switch data  processor units data */
> +static struct i2c_board_info mlxplat_mlxcpld_smart_switch_dpu_devs[] =3D=
 {
> +=09{
> +=09=09I2C_BOARD_INFO("mlxreg-dpu", MLXPLAT_CPLD_DPU_ADDR),
> +=09=09.irq =3D MLXPLAT_CPLD_LPC_SYSIRQ,
> +=09},
> +=09{
> +=09=09I2C_BOARD_INFO("mlxreg-dpu", MLXPLAT_CPLD_DPU_ADDR),
> +=09=09.irq =3D MLXPLAT_CPLD_LPC_SYSIRQ,
> +=09},
> +=09{
> +=09=09I2C_BOARD_INFO("mlxreg-dpu", MLXPLAT_CPLD_DPU_ADDR),
> +=09=09.irq =3D MLXPLAT_CPLD_LPC_SYSIRQ,
> +=09},
> +=09{
> +=09=09I2C_BOARD_INFO("mlxreg-dpu", MLXPLAT_CPLD_DPU_ADDR),
> +=09=09.irq =3D MLXPLAT_CPLD_LPC_SYSIRQ,
> +=09},
> +};
> +
> +static struct mlxreg_core_data mlxplat_mlxcpld_smart_switch_dpu_data[] =
=3D {
> +=09{
> +=09=09.label =3D "dpu1",
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_smart_switch_dpu_devs[0],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_DPU_BASE,
> +=09=09.slot =3D 1,
> +=09},
> +=09{
> +=09=09.label =3D "dpu2",
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_smart_switch_dpu_devs[1],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_DPU_BASE + 1,
> +=09=09.slot =3D 2,
> +=09},
> +=09{
> +=09=09.label =3D "dpu3",
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_smart_switch_dpu_devs[2],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_DPU_BASE + 2,
> +=09=09.slot =3D 3,
> +=09},
> +=09{
> +=09=09.label =3D "dpu4",
> +=09=09.hpdev.brdinfo =3D &mlxplat_mlxcpld_smart_switch_dpu_devs[2],
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_DPU_BASE + 3,
> +=09=09.slot =3D 4,
> +=09},
> +};
> +
> +/* Callback performs graceful shutdown after notification about power bu=
tton event */
> +static int
> +mlxplat_mlxcpld_l1_switch_pwr_events_handler(void *handle, enum mlxreg_h=
otplug_kind kind,
> +=09=09=09=09=09     u8 action)
> +{
> +=09if (action) {
> +=09=09dev_info(&mlxplat_dev->dev, "System shutdown due to short press of=
 power button");
> +=09=09kernel_power_off();
> +=09}
> +
> +=09return 0;
> +}
> +
> +static struct mlxreg_core_hotplug_notifier mlxplat_mlxcpld_l1_switch_pwr=
_events_notifier =3D {
> +=09.user_handler =3D mlxplat_mlxcpld_l1_switch_pwr_events_handler,
> +};
> +
> +/* Platform hotplug for l1 switch systems family data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_pwr_events_item=
s_data[] =3D {
> +=09{
> +=09=09.label =3D "power_button",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_PWR_BUTTON_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09=09.hpdev.action =3D MLXREG_HOTPLUG_DEVICE_NO_ACTION,
> +=09=09.hpdev.notifier =3D &mlxplat_mlxcpld_l1_switch_pwr_events_notifier=
,
> +=09},
> +};
> +
> +/* Callback activates latch reset flow after notification about intrusio=
n event */
> +static int
> +mlxplat_mlxcpld_l1_switch_intrusion_events_handler(void *handle, enum ml=
xreg_hotplug_kind kind,
> +=09=09=09=09=09=09   u8 action)
> +{
> +=09struct mlxplat_priv *priv =3D platform_get_drvdata(mlxplat_dev);
> +=09u32 regval;
> +=09int err;
> +
> +=09err =3D regmap_read(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET, &r=
egval);
> +=09if (err)
> +=09=09goto fail_regmap_read;
> +
> +=09if (action) {
> +=09=09dev_info(&mlxplat_dev->dev, "Detected intrusion - system latch is =
opened");
> +=09=09err =3D regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET=
,
> +=09=09=09=09   regval | MLXPLAT_CPLD_LATCH_RST_MASK);
> +=09} else {
> +=09=09dev_info(&mlxplat_dev->dev, "System latch is properly closed");
> +=09=09err =3D regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET=
,
> +=09=09=09=09   regval & ~MLXPLAT_CPLD_LATCH_RST_MASK);
> +=09}
> +
> +=09if (err)
> +=09=09goto fail_regmap_write;
> +
> +=09return 0;
> +
> +fail_regmap_read:
> +fail_regmap_write:
> +=09dev_err(&mlxplat_dev->dev, "Register access failed");
> +=09return err;
> +}
> +
> +static struct mlxreg_core_hotplug_notifier mlxplat_mlxcpld_l1_switch_int=
rusion_events_notifier =3D {
> +=09.user_handler =3D mlxplat_mlxcpld_l1_switch_intrusion_events_handler,
> +};
> +
> +static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_health_events_i=
tems_data[] =3D {
> +=09{
> +=09=09.label =3D "thermal1_pdb",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_THERMAL1_PDB_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "thermal2_pdb",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_THERMAL2_PDB_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "intrusion",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_INTRUSION_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09=09.hpdev.action =3D MLXREG_HOTPLUG_DEVICE_NO_ACTION,
> +=09=09.hpdev.notifier =3D &mlxplat_mlxcpld_l1_switch_intrusion_events_no=
tifier,
> +=09},
> +=09{
> +=09=09.label =3D "pwm_pg",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_PWM_PG_MASK,
> +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +=09},
> +};
> +
> +static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] =
=3D {
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_default_ng_fan_items_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_FAN_NG_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
> +=09=09.inversed =3D 1,
> +=09=09.health =3D false,
> +=09},
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_erot_ap_items_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_EROT_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_EROT_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
> +=09=09.inversed =3D 1,
> +=09=09.health =3D false,
> +=09},
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_erot_error_items_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_EROT_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
> +=09=09.inversed =3D 1,
> +=09=09.health =3D false,
> +=09},
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_l1_switch_pwr_events_items_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_PWR_BUTTON_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_pwr_events_items_d=
ata),
> +=09=09.inversed =3D 1,
> +=09=09.health =3D false,
> +=09},
> +=09{
> +=09=09.data =3D mlxplat_mlxcpld_l1_switch_health_events_items_data,
> +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_L1_CHA_HEALTH_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_health_events_item=
s_data),
> +=09=09.inversed =3D 1,
> +=09=09.health =3D false,
> +=09=09.ind =3D 8,
> +=09},
> +};
> +
> +static
> +struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data =
=3D {
> +=09.items =3D mlxplat_mlxcpld_l1_switch_events_items,
> +=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_events_items),
> +=09.cell =3D MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
> +=09.mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COME=
X,
> +=09.cell_low =3D MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> +=09.mask_low =3D MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_=
MASK_PWR_BUT,
> +};
> +
> +/* Platform led default data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_default_led_data[] =3D {
> +=09{
> +=09=09.label =3D "status:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09},
> +=09{
> +=09=09.label =3D "status:red",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
> +=09},
> +=09{
> +=09=09.label =3D "psu:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09},
> +=09{
> +=09=09.label =3D "psu:red",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09},
> +=09{
> +=09=09.label =3D "fan1:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09},
> +=09{
> +=09=09.label =3D "fan1:red",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09},
> +=09{
> +=09=09.label =3D "fan2:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09},
> +=09{
> +=09=09.label =3D "fan2:red",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09},
> +=09{
> +=09=09.label =3D "fan3:green",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
>  =09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
>  =09},
> @@ -3088,67 +3605,241 @@ static struct mlxreg_core_data mlxplat_mlxcpld_l=
1_switch_led_data[] =3D {
>  =09=09.bit =3D BIT(1),
>  =09},
>  =09{
> -=09=09.label =3D "fan2:orange",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> +=09=09.label =3D "fan2:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.bit =3D BIT(1),
> +=09},
> +=09{
> +=09=09.label =3D "fan3:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.bit =3D BIT(2),
> +=09},
> +=09{
> +=09=09.label =3D "fan3:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.bit =3D BIT(2),
> +=09},
> +=09{
> +=09=09.label =3D "fan4:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.bit =3D BIT(3),
> +=09},
> +=09{
> +=09=09.label =3D "fan4:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.bit =3D BIT(3),
> +=09},
> +=09{
> +=09=09.label =3D "fan5:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.bit =3D BIT(4),
> +=09},
> +=09{
> +=09=09.label =3D "fan5:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.bit =3D BIT(4),
> +=09},
> +=09{
> +=09=09.label =3D "fan6:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.bit =3D BIT(5),
> +=09},
> +=09{
> +=09=09.label =3D "fan6:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.bit =3D BIT(5),
> +=09},
> +=09{
> +=09=09.label =3D "uid:blue",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED5_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09},
> +};
> +
> +static struct mlxreg_core_platform_data mlxplat_l1_switch_led_data =3D {
> +=09=09.data =3D mlxplat_mlxcpld_l1_switch_led_data,
> +=09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_led_data),
> +};
> +
> +/* Platform led data for XDR and smart switch systems */
> +static struct mlxreg_core_data mlxplat_mlxcpld_xdr_led_data[] =3D {
> +=09{
> +=09=09.label =3D "status:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09},
> +=09{
> +=09=09.label =3D "status:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
> +=09},
> +=09{
> +=09=09.label =3D "psu:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09},
> +=09{
> +=09=09.label =3D "psu:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09},
> +=09{
> +=09=09.label =3D "fan1:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 1,
> +=09},
> +=09{
> +=09=09.label =3D "fan1:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 1,
> +=09},
> +=09{
> +=09=09.label =3D "fan2:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 2,
> +=09},
> +=09{
> +=09=09.label =3D "fan2:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 2,
> +=09},
> +=09{
> +=09=09.label =3D "fan3:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 3,
> +=09},
> +=09{
> +=09=09.label =3D "fan3:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 3,
> +=09},
> +=09{
> +=09=09.label =3D "fan4:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 4,
> +=09},
> +=09{
> +=09=09.label =3D "fan4:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 4,
> +=09},
> +=09{
> +=09=09.label =3D "fan5:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 5,
> +=09},
> +=09{
> +=09=09.label =3D "fan5:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 5,
> +=09},
> +=09{
> +=09=09.label =3D "fan6:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 6,
> +=09},
> +=09{
> +=09=09.label =3D "fan6:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 6,
> +=09},
> +=09{
> +=09=09.label =3D "fan7:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED6_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.slot =3D 7,
> +=09},
> +=09{
> +=09=09.label =3D "fan7:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED6_OFFSET,
>  =09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
>  =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> -=09=09.bit =3D BIT(1),
> +=09=09.slot =3D 7,
>  =09},
>  =09{
> -=09=09.label =3D "fan3:green",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.label =3D "fan8:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED7_OFFSET,
>  =09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
>  =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> -=09=09.bit =3D BIT(2),
> +=09=09.slot =3D 8,
>  =09},
>  =09{
> -=09=09.label =3D "fan3:orange",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.label =3D "fan8:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED7_OFFSET,
>  =09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
>  =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> -=09=09.bit =3D BIT(2),
> +=09=09.slot =3D 8,
>  =09},
>  =09{
> -=09=09.label =3D "fan4:green",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.label =3D "fan9:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED7_OFFSET,
>  =09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
>  =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> -=09=09.bit =3D BIT(3),
> +=09=09.slot =3D 9,
>  =09},
>  =09{
> -=09=09.label =3D "fan4:orange",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
> +=09=09.label =3D "fan9:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED7_OFFSET,
>  =09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
>  =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> -=09=09.bit =3D BIT(3),
> +=09=09.slot =3D 9,
>  =09},
>  =09{
> -=09=09.label =3D "fan5:green",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> +=09=09.label =3D "fan10:green",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED8_OFFSET,
>  =09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
>  =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> -=09=09.bit =3D BIT(4),
> +=09=09.slot =3D 10,
>  =09},
>  =09{
> -=09=09.label =3D "fan5:orange",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> +=09=09.label =3D "fan10:orange",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED8_OFFSET,
>  =09=09.mask =3D MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
>  =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> -=09=09.bit =3D BIT(4),
> -=09},
> -=09{
> -=09=09.label =3D "fan6:green",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> -=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> -=09=09.bit =3D BIT(5),
> -=09},
> -=09{
> -=09=09.label =3D "fan6:orange",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
> -=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> -=09=09.bit =3D BIT(5),
> +=09=09.slot =3D 10,
>  =09},
>  =09{
>  =09=09.label =3D "uid:blue",
> @@ -3157,9 +3848,9 @@ static struct mlxreg_core_data mlxplat_mlxcpld_l1_s=
witch_led_data[] =3D {
>  =09},
>  };
> =20
> -static struct mlxreg_core_platform_data mlxplat_l1_switch_led_data =3D {
> -=09=09.data =3D mlxplat_mlxcpld_l1_switch_led_data,
> -=09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_led_data),
> +static struct mlxreg_core_platform_data mlxplat_xdr_led_data =3D {
> +=09=09.data =3D mlxplat_mlxcpld_xdr_led_data,
> +=09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_xdr_led_data),
>  };
> =20
>  /* Platform register access default */
> @@ -4396,19 +5087,240 @@ static struct mlxreg_core_data mlxplat_mlxcpld_m=
odular_regs_io_data[] =3D {
>  =09},
>  };
> =20
> -static struct mlxreg_core_platform_data mlxplat_modular_regs_io_data =3D=
 {
> -=09=09.data =3D mlxplat_mlxcpld_modular_regs_io_data,
> -=09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_modular_regs_io_data),
> +static struct mlxreg_core_platform_data mlxplat_modular_regs_io_data =3D=
 {
> +=09=09.data =3D mlxplat_mlxcpld_modular_regs_io_data,
> +=09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_modular_regs_io_data),
> +};
> +
> +/* Platform register access for chassis blade systems family data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_chassis_blade_regs_io_dat=
a[] =3D {
> +=09{
> +=09=09.label =3D "cpld1_version",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "cpld1_pn",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET,
> +=09=09.bit =3D GENMASK(15, 0),
> +=09=09.mode =3D 0444,
> +=09=09.regnum =3D 2,
> +=09},
> +=09{
> +=09=09.label =3D "cpld1_version_min",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_aux_pwr_or_ref",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_from_comex",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_comex_pwr_fail",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_platform",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_soc",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_comex_wd",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_voltmon_upgrade_fail",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_system",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_sw_pwr_off",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_comex_thermal",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_reload_bios",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_ac_pwr_fail",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_long_pwr_pb",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "pwr_cycle",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "pwr_down",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "global_wp_request",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "jtag_enable",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "comm_chnl_ready",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "bios_safe_mode",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "bios_active_image",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "bios_auth_fail",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "bios_upgrade_fail",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "voltreg_update_status",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_VOLTREG_UPD_MASK,
> +=09=09.bit =3D 5,
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "vpd_wp",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "pcie_asic_reset_dis",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "global_wp_response",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GWP_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "config1",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "config2",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "config3",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "ufm_version",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +};
> +
> +static struct mlxreg_core_platform_data mlxplat_chassis_blade_regs_io_da=
ta =3D {
> +=09=09.data =3D mlxplat_mlxcpld_chassis_blade_regs_io_data,
> +=09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_regs_io_data=
),
>  };
> =20
> -/* Platform register access for chassis blade systems family data */
> -static struct mlxreg_core_data mlxplat_mlxcpld_chassis_blade_regs_io_dat=
a[] =3D {
> +/* Platform register access for smart switch systems families data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_smart_switch_regs_io_data=
[] =3D {
>  =09{
>  =09=09.label =3D "cpld1_version",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
>  =09=09.bit =3D GENMASK(7, 0),
>  =09=09.mode =3D 0444,
>  =09},
> +=09{
> +=09=09.label =3D "cpld2_version",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD2_VER_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "cpld3_version",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
>  =09{
>  =09=09.label =3D "cpld1_pn",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET,
> @@ -4416,12 +5328,116 @@ static struct mlxreg_core_data mlxplat_mlxcpld_c=
hassis_blade_regs_io_data[] =3D {
>  =09=09.mode =3D 0444,
>  =09=09.regnum =3D 2,
>  =09},
> +=09{
> +=09=09.label =3D "cpld2_pn",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET,
> +=09=09.bit =3D GENMASK(15, 0),
> +=09=09.mode =3D 0444,
> +=09=09.regnum =3D 2,
> +=09},
> +=09{
> +=09=09.label =3D "cpld3_pn",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET,
> +=09=09.bit =3D GENMASK(15, 0),
> +=09=09.mode =3D 0444,
> +=09=09.regnum =3D 2,
> +=09},
>  =09{
>  =09=09.label =3D "cpld1_version_min",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET,
>  =09=09.bit =3D GENMASK(7, 0),
>  =09=09.mode =3D 0444,
>  =09},
> +=09{
> +=09=09.label =3D "cpld2_version_min",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "cpld3_version_min",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "kexec_activated",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "asic_reset",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "eth_switch_reset",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "dpu1_rst",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "dpu2_rst",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "dpu3_rst",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "dpu4_rst",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "dpu1_pwr",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "dpu2_pwr",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "dpu3_pwr",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "dpu4_pwr",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "reset_long_pb",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_short_pb",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0444,
> +=09},
>  =09{
>  =09=09.label =3D "reset_aux_pwr_or_ref",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> @@ -4429,9 +5445,33 @@ static struct mlxreg_core_data mlxplat_mlxcpld_cha=
ssis_blade_regs_io_data[] =3D {
>  =09=09.mode =3D 0444,
>  =09},
>  =09{
> -=09=09.label =3D "reset_from_comex",
> +=09=09.label =3D "reset_swb_dc_dc_pwr_fail",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_swb_wd",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_asic_thermal",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_sw_reset",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_aux_pwr_or_reload",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
>  =09=09.mode =3D 0444,
>  =09},
>  =09{
> @@ -4453,13 +5493,13 @@ static struct mlxreg_core_data mlxplat_mlxcpld_ch=
assis_blade_regs_io_data[] =3D {
>  =09=09.mode =3D 0444,
>  =09},
>  =09{
> -=09=09.label =3D "reset_comex_wd",
> +=09=09.label =3D "reset_pwr",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
>  =09=09.mode =3D 0444,
>  =09},
>  =09{
> -=09=09.label =3D "reset_voltmon_upgrade_fail",
> +=09=09.label =3D "reset_pwr_converter_fail",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
>  =09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
>  =09=09.mode =3D 0444,
> @@ -4483,23 +5523,103 @@ static struct mlxreg_core_data mlxplat_mlxcpld_c=
hassis_blade_regs_io_data[] =3D {
>  =09=09.mode =3D 0444,
>  =09},
>  =09{
> -=09=09.label =3D "reset_reload_bios",
> +=09=09.label =3D "reset_ac_pwr_fail",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
>  =09=09.mode =3D 0444,
>  =09},
>  =09{
> -=09=09.label =3D "reset_ac_pwr_fail",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> +=09=09.label =3D "voltreg_update_status",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_VOLTREG_UPD_MASK,
> +=09=09.bit =3D 5,
>  =09=09.mode =3D 0444,
>  =09},
>  =09{
> -=09=09.label =3D "reset_long_pwr_pb",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
> +=09=09.label =3D "port80",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_RO_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "bios_status",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_BIOS_STATUS_MASK,
> +=09=09.bit =3D 2,
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "bios_start_retry",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "bios_active_image",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "vpd_wp",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "pcie_asic_reset_dis",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "shutdown_unlock",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "fan_dir",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION,
> +=09=09.bit =3D GENMASK(7, 0),
>  =09=09.mode =3D 0444,
>  =09},
> +=09{
> +=09=09.label =3D "dpu1_rst_en",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "dpu2_rst_en",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "dpu3_rst_en",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "dpu4_rst_en",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "psu1_on",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0200,
> +=09},
> +=09{
> +=09=09.label =3D "psu2_on",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0200,
> +=09},
>  =09{
>  =09=09.label =3D "pwr_cycle",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> @@ -4513,72 +5633,117 @@ static struct mlxreg_core_data mlxplat_mlxcpld_c=
hassis_blade_regs_io_data[] =3D {
>  =09=09.mode =3D 0200,
>  =09},
>  =09{
> -=09=09.label =3D "global_wp_request",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.label =3D "jtag_cap",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_FU_CAP_MASK,
> +=09=09.bit =3D 1,
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "jtag_enable",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FIELD_UPGRADE,
> +=09=09.mask =3D GENMASK(1, 0),
> +=09=09.bit =3D 1,
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "non_active_bios_select",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09    .label =3D "bios_upgrade_fail",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "bios_image_invert",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
>  =09=09.mode =3D 0644,
>  =09},
>  =09{
> -=09=09.label =3D "jtag_enable",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.label =3D "me_reboot",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
>  =09=09.mode =3D 0644,
>  =09},
>  =09{
> -=09=09.label =3D "comm_chnl_ready",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> +=09=09.label =3D "dpu1_pwr_force",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP3_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
>  =09=09.mode =3D 0200,
>  =09},
>  =09{
> -=09=09.label =3D "bios_safe_mode",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> -=09=09.mode =3D 0444,
> +=09=09.label =3D "dpu2_pwr_force",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP3_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0200,
>  =09},
>  =09{
> -=09=09.label =3D "bios_active_image",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> -=09=09.mode =3D 0444,
> +=09=09.label =3D "dpu3_pwr_force",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP3_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> +=09=09.mode =3D 0200,
>  =09},
>  =09{
> -=09=09.label =3D "bios_auth_fail",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> -=09=09.mode =3D 0444,
> +=09=09.label =3D "dpu4_pwr_force",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP3_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0200,
>  =09},
>  =09{
> -=09=09.label =3D "bios_upgrade_fail",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
> +=09=09.label =3D "ufm_done",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPI_MASK_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
>  =09=09.mode =3D 0444,
>  =09},
>  =09{
> -=09=09.label =3D "voltreg_update_status",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
> -=09=09.mask =3D MLXPLAT_CPLD_VOLTREG_UPD_MASK,
> -=09=09.bit =3D 5,
> +=09=09.label =3D "asic_health",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
> +=09=09.mask =3D MLXPLAT_CPLD_ASIC_MASK,
> +=09=09.bit =3D 1,
>  =09=09.mode =3D 0444,
>  =09},
>  =09{
> -=09=09.label =3D "vpd_wp",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.label =3D "psu1_ac_ok",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
>  =09=09.mode =3D 0644,
>  =09},
>  =09{
> -=09=09.label =3D "pcie_asic_reset_dis",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> -=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> +=09=09.label =3D "psu2_ac_ok",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
>  =09=09.mode =3D 0644,
>  =09},
>  =09{
> -=09=09.label =3D "global_wp_response",
> -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GWP_OFFSET,
> +=09=09.label =3D "psu1_no_alert",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET,
>  =09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "psu2_no_alert",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "asic_pg_fail",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
>  =09=09.mode =3D 0444,
>  =09},
> +=09{
> +=09=09.label =3D "spi_chnl_select",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.bit =3D 1,
> +=09=09.mode =3D 0644,
> +=09},
>  =09{
>  =09=09.label =3D "config1",
>  =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
> @@ -4605,9 +5770,9 @@ static struct mlxreg_core_data mlxplat_mlxcpld_chas=
sis_blade_regs_io_data[] =3D {
>  =09},
>  };
> =20
> -static struct mlxreg_core_platform_data mlxplat_chassis_blade_regs_io_da=
ta =3D {
> -=09=09.data =3D mlxplat_mlxcpld_chassis_blade_regs_io_data,
> -=09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_regs_io_data=
),
> +static struct mlxreg_core_platform_data mlxplat_smart_switch_regs_io_dat=
a =3D {
> +=09=09.data =3D mlxplat_mlxcpld_smart_switch_regs_io_data,
> +=09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_regs_io_data)=
,
>  };
> =20
>  /* Platform FAN default */
> @@ -4751,6 +5916,185 @@ static struct mlxreg_core_platform_data mlxplat_d=
efault_fan_data =3D {
>  =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
>  };
> =20
> +/* XDR and smart switch platform fan data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_xdr_fan_data[] =3D {
> +=09{
> +=09=09.label =3D "pwm1",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho1",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 1,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho2",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO2_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 2,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho3",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO3_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 3,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho4",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO4_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 4,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho5",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO5_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 5,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho6",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO6_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 6,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho7",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO7_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 7,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho8",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO8_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 8,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho9",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO9_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 9,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho10",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO10_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 10,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho11",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO11_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 11,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho12",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO12_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 12,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho13",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO13_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 13,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho14",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO14_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 14,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho15",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO15_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 15,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho16",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO16_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 16,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho17",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO17_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 17,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho18",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO18_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 18,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho19",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO19_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 19,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "tacho20",
> +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_TACHO20_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
> +=09=09.slot =3D 20,
> +=09=09.reg_prsnt =3D MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
> +=09},
> +=09{
> +=09=09.label =3D "conf",
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_TACHO_SPEED_OFFSET,
> +=09},
> +};
> +
> +static struct mlxreg_core_platform_data mlxplat_xdr_fan_data =3D {
> +=09=09.data =3D mlxplat_mlxcpld_xdr_fan_data,
> +=09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_xdr_fan_data),
> +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> +=09=09.version =3D 1,
> +};
> +
>  /* Watchdog type1: hardware implementation version1
>   * (MSN2700, MSN2410, MSN2740, MSN2100 and MSN2140 systems).
>   */
> @@ -4975,6 +6319,8 @@ static bool mlxplat_mlxcpld_writeable_reg(struct de=
vice *dev, unsigned int reg)
>  {
>  =09switch (reg) {
>  =09case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_LED1_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_LED2_OFFSET:
> @@ -4983,12 +6329,14 @@ static bool mlxplat_mlxcpld_writeable_reg(struct =
device *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_LED5_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_LED6_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_LED7_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_LED8_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP0_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP1_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_WP1_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP2_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_WP2_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_GP3_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FIELD_UPGRADE:
>  =09case MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
> @@ -5012,10 +6360,14 @@ static bool mlxplat_mlxcpld_writeable_reg(struct =
device *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_ASIC2_MASK_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_FAN2_EVENT_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_FAN2_MASK_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_EROT_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_EROT_MASK_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_EROTE_EVENT_OFFSET:
> @@ -5083,6 +6435,8 @@ static bool mlxplat_mlxcpld_readable_reg(struct dev=
ice *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
> @@ -5094,15 +6448,18 @@ static bool mlxplat_mlxcpld_readable_reg(struct d=
evice *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_LED5_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_LED6_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_LED7_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_LED8_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION:
>  =09case MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_GP1_RO_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP0_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP1_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_WP1_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP2_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_WP2_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_GP3_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FIELD_UPGRADE:
>  =09case MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
> @@ -5122,6 +6479,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct dev=
ice *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_GWP_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_GPI_MASK_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_BRD_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET:
> @@ -5134,12 +6492,17 @@ static bool mlxplat_mlxcpld_readable_reg(struct d=
evice *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_PSU_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PWR_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_FAN2_EVENT_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_FAN2_MASK_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_EROT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_EROT_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_EROT_MASK_OFFSET:
> @@ -5213,6 +6576,13 @@ static bool mlxplat_mlxcpld_readable_reg(struct de=
vice *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_TACHO12_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_TACHO13_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_TACHO14_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO15_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO16_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO17_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO18_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO19_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO20_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET:
> @@ -5248,6 +6618,8 @@ static bool mlxplat_mlxcpld_volatile_reg(struct dev=
ice *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
> @@ -5259,13 +6631,16 @@ static bool mlxplat_mlxcpld_volatile_reg(struct d=
evice *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_LED5_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_LED6_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_LED7_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_LED8_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION:
>  =09case MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_GP1_RO_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP0_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP1_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GP2_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_GP3_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FIELD_UPGRADE:
>  =09case MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
> @@ -5285,6 +6660,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct dev=
ice *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_GWP_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_GPI_MASK_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_BRD_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET:
> @@ -5297,9 +6673,11 @@ static bool mlxplat_mlxcpld_volatile_reg(struct de=
vice *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_PSU_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PWR_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
> @@ -5370,6 +6748,13 @@ static bool mlxplat_mlxcpld_volatile_reg(struct de=
vice *dev, unsigned int reg)
>  =09case MLXPLAT_CPLD_LPC_REG_TACHO12_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_TACHO13_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_TACHO14_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO15_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO16_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO17_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO18_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO19_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_TACHO20_OFFSET:
> +=09case MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET:
>  =09case MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET:
> @@ -5431,6 +6816,15 @@ static const struct reg_default mlxplat_mlxcpld_re=
gmap_eth_modular[] =3D {
>  =09  MLXPLAT_CPLD_AGGR_MASK_LC_LOW },
>  };
> =20
> +static const struct reg_default mlxplat_mlxcpld_regmap_smart_switch[] =
=3D {
> +=09{ MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET, 0x00 },
> +=09{ MLXPLAT_CPLD_LPC_REG_WD1_ACT_OFFSET, 0x00 },
> +=09{ MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET, 0x00 },
> +=09{ MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET, 0x00 },
> +=09{ MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET,
> +=09  MLXPLAT_CPLD_LPC_SM_SW_MASK },
> +};
> +
>  struct mlxplat_mlxcpld_regmap_context {
>  =09void __iomem *base;
>  };
> @@ -5539,6 +6933,20 @@ static const struct regmap_config mlxplat_mlxcpld_=
regmap_config_eth_modular =3D {
>  =09.reg_write =3D mlxplat_mlxcpld_reg_write,
>  };
> =20
> +static const struct regmap_config mlxplat_mlxcpld_regmap_config_smart_sw=
itch =3D {
> +=09.reg_bits =3D 8,
> +=09.val_bits =3D 8,
> +=09.max_register =3D 255,
> +=09.cache_type =3D REGCACHE_FLAT,
> +=09.writeable_reg =3D mlxplat_mlxcpld_writeable_reg,
> +=09.readable_reg =3D mlxplat_mlxcpld_readable_reg,
> +=09.volatile_reg =3D mlxplat_mlxcpld_volatile_reg,
> +=09.reg_defaults =3D mlxplat_mlxcpld_regmap_smart_switch,
> +=09.num_reg_defaults =3D ARRAY_SIZE(mlxplat_mlxcpld_regmap_smart_switch)=
,
> +=09.reg_read =3D mlxplat_mlxcpld_reg_read,
> +=09.reg_write =3D mlxplat_mlxcpld_reg_write,
> +};
> +
>  static struct resource mlxplat_mlxcpld_resources[] =3D {
>  =09[0] =3D DEFINE_RES_IRQ_NAMED(MLXPLAT_CPLD_LPC_SYSIRQ, "mlxreg-hotplug=
"),
>  };
> @@ -5550,6 +6958,7 @@ static struct mlxreg_core_platform_data *mlxplat_re=
gs_io;
>  static struct mlxreg_core_platform_data *mlxplat_fan;
>  static struct mlxreg_core_platform_data
>  =09*mlxplat_wd_data[MLXPLAT_CPLD_WD_MAX_DEVS];
> +static struct mlxreg_core_data *mlxplat_dpu_data[MLXPLAT_CPLD_DPU_MAX_DE=
VS];
>  static const struct regmap_config *mlxplat_regmap_config;
>  static struct pci_dev *lpc_bridge;
>  static struct pci_dev *i2c_bridge;
> @@ -5921,6 +7330,29 @@ static int __init mlxplat_dmi_l1_switch_matched(co=
nst struct dmi_system_id *dmi)
>  =09return mlxplat_register_platform_device();
>  }
> =20
> +static int __init mlxplat_dmi_smart_switch_matched(const struct dmi_syst=
em_id *dmi)
> +{
> +=09int i;
> +
> +=09mlxplat_max_adap_num =3D MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
> +=09mlxplat_mux_num =3D ARRAY_SIZE(mlxplat_ng800_mux_data);
> +=09mlxplat_mux_data =3D mlxplat_ng800_mux_data;
> +=09mlxplat_hotplug =3D &mlxplat_mlxcpld_smart_switch_data;
> +=09mlxplat_hotplug->deferred_nr =3D
> +=09=09mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
> +=09mlxplat_led =3D &mlxplat_xdr_led_data;
> +=09mlxplat_regs_io =3D &mlxplat_smart_switch_regs_io_data;
> +=09mlxplat_fan =3D &mlxplat_xdr_fan_data;
> +=09for (i =3D 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
> +=09=09mlxplat_wd_data[i] =3D &mlxplat_mlxcpld_wd_set_type2[i];
> +=09for (i =3D 0; i < ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_dpu_data); =
i++)
> +=09=09mlxplat_dpu_data[i] =3D &mlxplat_mlxcpld_smart_switch_dpu_data[i];
> +=09mlxplat_i2c =3D &mlxplat_mlxcpld_i2c_ng_data;
> +=09mlxplat_regmap_config =3D &mlxplat_mlxcpld_regmap_config_smart_switch=
;
> +
> +=09return mlxplat_register_platform_device();
> +}
> +
>  static const struct dmi_system_id mlxplat_dmi_table[] __initconst =3D {
>  =09{
>  =09=09.callback =3D mlxplat_dmi_default_wc_matched,
> @@ -6015,6 +7447,12 @@ static const struct dmi_system_id mlxplat_dmi_tabl=
e[] __initconst =3D {
>  =09=09=09DMI_MATCH(DMI_BOARD_NAME, "VMOD0017"),
>  =09=09},
>  =09},
> +=09{
> +=09=09.callback =3D mlxplat_dmi_smart_switch_matched,
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_BOARD_NAME, "VMOD0019"),
> +=09=09},
> +=09},
>  =09{
>  =09=09.callback =3D mlxplat_dmi_msn274x_matched,
>  =09=09.matches =3D {
> @@ -6390,8 +7828,25 @@ static int mlxplat_platdevs_init(struct mlxplat_pr=
iv *priv)
>  =09=09}
>  =09}
> =20
> +=09/* Add DPU drivers. */
> +=09for (i =3D 0; i < MLXPLAT_CPLD_DPU_MAX_DEVS; i++) {
> +=09=09if (mlxplat_dpu_data[i]) {
> +=09=09=09priv->pdev_dpu[i] =3D
> +=09=09=09=09platform_device_register_resndata(&mlxplat_dev->dev, "mlxreg=
-dpu",
> +=09=09=09=09=09=09=09=09  i, NULL, 0, mlxplat_dpu_data[i],
> +=09=09=09=09=09=09=09=09  sizeof(*mlxplat_dpu_data[i]));
> +=09=09=09if (IS_ERR(priv->pdev_dpu[i])) {
> +=09=09=09=09err =3D PTR_ERR(priv->pdev_dpu[i]);
> +=09=09=09=09goto fail_platform_dpu_register;
> +=09=09=09}
> +=09=09}
> +=09}
> +
>  =09return 0;
> =20
> +fail_platform_dpu_register:
> +=09while (--i >=3D 0)
> +=09=09platform_device_unregister(priv->pdev_dpu[i]);
>  fail_platform_wd_register:
>  =09while (--i >=3D 0)
>  =09=09platform_device_unregister(priv->pdev_wd[i]);
> @@ -6412,6 +7867,8 @@ static void mlxplat_platdevs_exit(struct mlxplat_pr=
iv *priv)
>  {
>  =09int i;
> =20
> +=09for (i =3D MLXPLAT_CPLD_DPU_MAX_DEVS - 1; i >=3D 0 ; i--)
> +=09=09platform_device_unregister(priv->pdev_dpu[i]);
>  =09for (i =3D MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >=3D 0 ; i--)
>  =09=09platform_device_unregister(priv->pdev_wd[i]);
>  =09if (priv->pdev_fan)
>=20

--=20
 i.

--8323328-2105703565-1736788328=:881--
