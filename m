Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8B165EFC
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736787916; cv=none; b=pkrzG4S5KF556FBC0aHFNyOe6SjchQIME8NulvcI1QajJeWJfxbLsJymxynJtDVpte9W3GwzkGngOqum0D33Z1q1+vr9T9uljIJ7LhlkCLFx6Y0N1eI0b3MMmLzaTnGrV3/B5N655DiY1+X7cXk+MJAuLn/chHmG3h1j4nstH5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736787916; c=relaxed/simple;
	bh=HVPJ7re4NUjaMSBDlYYKwp47gjqVuHvwqoj6gFuuKWI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bx+cI4/hng/5FLbZosMS6TM/jJRRJpcWMcGJIqMtqjM1GcCF1vv5XN/FDgpSyrZhwZrUNDvyWXwGYvO00Yvkz1Jhk4yfwYTwdTJxL7kI6ixW7qlO+JFlQ7M6F4gwIThnmnwLdnbc6vDLUQ45+/eI4mfRtaFEmg1tkKg9eA1BWcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ed9BSn7p; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed9BSn7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736787914; x=1768323914;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=HVPJ7re4NUjaMSBDlYYKwp47gjqVuHvwqoj6gFuuKWI=;
  b=ed9BSn7p1FlVjjUjcN62ErRyHeLCt0AmOIMNUtcNTXP+6D+KBJ5ekwG9
   krEMioILT8ZhEv+CFMrNu08b3aMl+7MSxkd6q2PbY/1fFAhKdpks8MDXQ
   G6L2VXIS8cjPaFiayTxtfzoVTo7i4z842YDbL+udcGDV0UO09ZnwpxDLC
   bwSRX36qLwoHPXpXpHHlwej6V0AoHiuBj5a1JT7Kf9vO0gcnYL/peQo6m
   Tl6SX8HHjLuY3lA4wQm+8KO8dR0nv/+XTJARtuF6uS38+1VhYAz8uD8rk
   zpnGXKgzx1FO0Etc8GN4izMquX7cdUdLdajTIgKyMsWEi0fCheAPDqwZ/
   w==;
X-CSE-ConnectionGUID: 2ZaT0jAqTHinccAHvGK1pA==
X-CSE-MsgGUID: J2p0n3LeSTCwr0pc2WVVrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36971598"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36971598"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:05:13 -0800
X-CSE-ConnectionGUID: hcLlIE5aTiisgMxX9aKm/g==
X-CSE-MsgGUID: 7z3Bj6mQRNOsbDv26a08Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104410621"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.121])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:05:10 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Jan 2025 19:05:07 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: hdegoede@redhat.com, michaelsh@nvidia.com, crajank@nvidia.com, 
    fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v2 06/10] platform/mellanox: mlxreg-dpu:
 Add initial support for Nvidia DPU
In-Reply-To: <20250113084337.24763-7-vadimp@nvidia.com>
Message-ID: <6e51baf7-5c0c-fb24-6729-22de13cf171f@linux.intel.com>
References: <20250113084337.24763-1-vadimp@nvidia.com> <20250113084337.24763-7-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1272013915-1736787161=:881"
Content-ID: <4829d5b6-7b8f-aed7-9ba9-fc03d21ee1e5@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1272013915-1736787161=:881
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <edf905e9-3560-7435-6e34-6fd8dcd91125@linux.intel.com>

On Mon, 13 Jan 2025, Vadim Pasternak wrote:

> Provide platform support for Nvidia (DPU) Data Processor Unit for the
> Smart Switch SN4280.
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
> Drivers provides support for the platform management and monitoring
> of DPU components.
> It includes support for health events, resets and boot progress
> indications logic, implemented by FPGA device.
>=20
> Reviewed-by: Ciju Rajan K <crajank@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/Kconfig      |  12 +
>  drivers/platform/mellanox/Makefile     |   1 +
>  drivers/platform/mellanox/mlxreg-dpu.c | 622 +++++++++++++++++++++++++
>  3 files changed, 635 insertions(+)
>  create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c
>=20
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellano=
x/Kconfig
> index aa760f064a17..7da0fc46b1e7 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -27,6 +27,18 @@ config MLX_PLATFORM
> =20
>  =09  If you have a Mellanox system, say Y or M here.
> =20
> +config MLXREG_DPU
> +=09tristate "Nvidia Data Processor Unit platform driver support"
> +=09select REGMAP_I2C
> +=09help
> +=09  This driver provides support for the Nvidia BF3 Data Processor Unit=
s,
> +=09  which are the part of SN4280 Ethernet smart switch systems
> +=09  providing a high performance switching solution for Enterprise Data
> +=09  Centers (EDC) for building Ethernet based clusters, High-Performanc=
e
> +=09  Computing (HPC) and embedded environments.
> +
> +=09  If you have a Nvidia smart swicth system, say Y or M here.
> +
>  config MLXREG_HOTPLUG
>  =09tristate "Mellanox platform hotplug driver support"
>  =09depends on HWMON
> diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellan=
ox/Makefile
> index ba56485cbe8c..e86723b44c2e 100644
> --- a/drivers/platform/mellanox/Makefile
> +++ b/drivers/platform/mellanox/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_MLX_PLATFORM)=09+=3D mlx-platform.o
>  obj-$(CONFIG_MLXBF_BOOTCTL)=09+=3D mlxbf-bootctl.o
>  obj-$(CONFIG_MLXBF_PMC)=09=09+=3D mlxbf-pmc.o
>  obj-$(CONFIG_MLXBF_TMFIFO)=09+=3D mlxbf-tmfifo.o
> +obj-$(CONFIG_MLXREG_DPU)=09+=3D mlxreg-dpu.o
>  obj-$(CONFIG_MLXREG_HOTPLUG)=09+=3D mlxreg-hotplug.o
>  obj-$(CONFIG_MLXREG_IO) +=3D mlxreg-io.o
>  obj-$(CONFIG_MLXREG_LC) +=3D mlxreg-lc.o
> diff --git a/drivers/platform/mellanox/mlxreg-dpu.c b/drivers/platform/me=
llanox/mlxreg-dpu.c
> new file mode 100644
> index 000000000000..2288595310e3
> --- /dev/null
> +++ b/drivers/platform/mellanox/mlxreg-dpu.c
> @@ -0,0 +1,622 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Nvidia Data Processor Unit platform driver
> + *
> + * Copyright (C) 2025 Nvidia Technologies Ltd.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/mlxcpld.h>
> +#include <linux/platform_data/mlxreg.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +/* I2C bus IO offsets */
> +#define MLXREG_DPU_REG_FPGA1_VER_OFFSET=09=09=090x2400
> +#define MLXREG_DPU_REG_FPGA1_PN_OFFSET=09=09=090x2404
> +#define MLXREG_DPU_REG_FPGA1_PN1_OFFSET=09=09=090x2405
> +#define MLXREG_DPU_REG_PG_OFFSET=09=09=090x2414
> +#define MLXREG_DPU_REG_PG_EVENT_OFFSET=09=09=090x2415
> +#define MLXREG_DPU_REG_PG_MASK_OFFSET=09=09=090x2416
> +#define MLXREG_DPU_REG_RESET_GP1_OFFSET=09=09=090x2417
> +#define MLXREG_DPU_REG_RST_CAUSE1_OFFSET=09=090x241e
> +#define MLXREG_DPU_REG_GP0_RO_OFFSET=09=09=090x242b
> +#define MLXREG_DPU_REG_GP0_OFFSET=09=09=090x242e
> +#define MLXREG_DPU_REG_GP1_OFFSET=09=09=090x242c
> +#define MLXREG_DPU_REG_GP4_OFFSET=09=09=090x2438
> +#define MLXREG_DPU_REG_AGGRCO_OFFSET=09=09=090x2442
> +#define MLXREG_DPU_REG_AGGRCO_MASK_OFFSET=09=090x2443
> +#define MLXREG_DPU_REG_HEALTH_OFFSET=09=09=090x244d
> +#define MLXREG_DPU_REG_HEALTH_EVENT_OFFSET=09=090x244e
> +#define MLXREG_DPU_REG_HEALTH_MASK_OFFSET=09=090x244f
> +#define MLXREG_DPU_REG_FPGA1_MVER_OFFSET=09=090x24de
> +#define MLXREG_DPU_REG_CONFIG3_OFFSET=09=09=090x24fd
> +#define MLXREG_DPU_REG_MAX=09=09=09=090x3fff
> +
> +/* Power Good event masks. */
> +#define MLXREG_DPU_PG_VDDIO_MASK=09=09=09BIT(0)
> +#define MLXREG_DPU_PG_VDD_CPU_MASK=09=09=09BIT(1)
> +#define MLXREG_DPU_PG_VDD_MASK=09=09=09=09BIT(2)
> +#define MLXREG_DPU_PG_1V8_MASK=09=09=09=09BIT(3)
> +#define MLXREG_DPU_PG_COMPARATOR_MASK=09=09=09BIT(4)
> +#define MLXREG_DPU_PG_VDDQ_MASK=09=09=09=09BIT(5)
> +#define MLXREG_DPU_PG_HVDD_MASK=09=09=09=09BIT(6)
> +#define MLXREG_DPU_PG_DVDD_MASK=09=09=09=09BIT(7)
> +#define MLXREG_DPU_PG_MASK=09=09=09=09(MLXREG_DPU_PG_DVDD_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_PG_HVDD_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_PG_VDDQ_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_PG_COMPARATOR_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_PG_1V8_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_PG_VDD_CPU_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_PG_VDD_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_PG_VDDIO_MASK)
> +
> +/* Health event masks. */
> +#define MLXREG_DPU_HLTH_THERMAL_TRIP_MASK=09=09BIT(0)
> +#define MLXREG_DPU_HLTH_UFM_UPGRADE_DONE_MASK=09=09BIT(1)
> +#define MLXREG_DPU_HLTH_VDDQ_HOT_ALERT_MASK=09=09BIT(2)
> +#define MLXREG_DPU_HLTH_VDD_CPU_HOT_ALERT_MASK=09=09BIT(3)
> +#define MLXREG_DPU_HLTH_VDDQ_ALERT_MASK=09=09=09BIT(4)
> +#define MLXREG_DPU_HLTH_VDD_CPU_ALERT_MASK=09=09BIT(5)
> +#define MLXREG_DPU_HEALTH_MASK=09=09=09=09(MLXREG_DPU_HLTH_UFM_UPGRADE_D=
ONE_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_HLTH_VDDQ_HOT_ALERT_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_HLTH_VDD_CPU_HOT_ALERT_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_HLTH_VDDQ_ALERT_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_HLTH_VDD_CPU_ALERT_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_HLTH_THERMAL_TRIP_MASK)
> +
> +/* Hotplug aggregation masks. */
> +#define MLXREG_DPU_HEALTH_AGGR_MASK=09=09=09BIT(0)
> +#define MLXREG_DPU_PG_AGGR_MASK=09=09=09=09BIT(1)
> +#define MLXREG_DPU_AGGR_MASK=09=09=09=09(MLXREG_DPU_HEALTH_AGGR_MASK | \
> +=09=09=09=09=09=09=09 MLXREG_DPU_PG_AGGR_MASK)
> +
> +/* Voltage regulator firmware update status mask. */
> +#define MLXREG_DPU_VOLTREG_UPD_MASK=09=09=09GENMASK(5, 4)
> +
> +#define MLXREG_DPU_NR_NONE=09=09=09=09(-1)
> +
> +/*
> + * enum mlxreg_dpu_type - Data Processor Unit types
> + *
> + * @MLXREG_DPU_BF3: DPU equipped with BF3 SoC;
> + */
> +enum mlxreg_dpu_type {
> +=09MLXREG_DPU_BF3 =3D 0x0050,
> +};
> +
> +/* Default register access data. */
> +static struct mlxreg_core_data mlxreg_dpu_io_data[] =3D {
> +=09{
> +=09=09.label =3D "fpga1_version",
> +=09=09.reg =3D MLXREG_DPU_REG_FPGA1_VER_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "fpga1_pn",
> +=09=09.reg =3D MLXREG_DPU_REG_FPGA1_PN_OFFSET,
> +=09=09.bit =3D GENMASK(15, 0),
> +=09=09.mode =3D 0444,
> +=09=09.regnum =3D 2,
> +=09},
> +=09{
> +=09=09.label =3D "fpga1_version_min",
> +=09=09.reg =3D MLXREG_DPU_REG_FPGA1_MVER_OFFSET,
> +=09=09.bit =3D GENMASK(7, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "perst_rst",
> +=09=09.reg =3D MLXREG_DPU_REG_RESET_GP1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "usbphy_rst",
> +=09=09.reg =3D MLXREG_DPU_REG_RESET_GP1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "phy_rst",
> +=09=09.reg =3D MLXREG_DPU_REG_RESET_GP1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "tpm_rst",
> +=09=09.reg =3D MLXREG_DPU_REG_RESET_GP1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> +=09=09.mode =3D 0644,
> +=09},
> +=09{
> +=09=09.label =3D "reset_from_main_board",
> +=09=09.reg =3D MLXREG_DPU_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_aux_pwr_or_reload",
> +=09=09.reg =3D MLXREG_DPU_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_comex_pwr_fail",
> +=09=09.reg =3D MLXREG_DPU_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_dpu_thermal",
> +=09=09.reg =3D MLXREG_DPU_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "reset_pwr_off",
> +=09=09.reg =3D MLXREG_DPU_REG_RST_CAUSE1_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "dpu_id",
> +=09=09.reg =3D MLXREG_DPU_REG_GP0_RO_OFFSET,
> +=09=09.mask =3D GENMASK(3, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "voltreg_update_status",
> +=09=09.reg =3D MLXREG_DPU_REG_GP0_RO_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_VOLTREG_UPD_MASK,
> +=09=09.bit =3D 5,
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "boot_progress",
> +=09=09.reg =3D MLXREG_DPU_REG_GP0_OFFSET,
> +=09=09.mask =3D GENMASK(3, 0),
> +=09=09.mode =3D 0444,
> +=09},
> +=09{
> +=09=09.label =3D "ufm_upgrade",
> +=09=09.reg =3D MLXREG_DPU_REG_GP4_OFFSET,
> +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> +=09=09.mode =3D 0644,
> +=09},
> +};
> +
> +static struct mlxreg_core_platform_data mlxreg_dpu_default_regs_io_data =
=3D {
> +=09=09.data =3D mlxreg_dpu_io_data,
> +=09=09.counter =3D ARRAY_SIZE(mlxreg_dpu_io_data),
> +};
> +
> +/* Default hotplug data. */
> +static struct mlxreg_core_data mlxreg_dpu_power_events_items_data[] =3D =
{
> +=09{
> +=09=09.label =3D "pg_vddio",
> +=09=09.reg =3D MLXREG_DPU_REG_PG_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_PG_VDDIO_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "pg_vdd_cpu",
> +=09=09.reg =3D MLXREG_DPU_REG_PG_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_PG_VDD_CPU_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "pg_vdd",
> +=09=09.reg =3D MLXREG_DPU_REG_PG_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_PG_VDD_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "pg_1v8",
> +=09=09.reg =3D MLXREG_DPU_REG_PG_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_PG_1V8_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "pg_comparator",
> +=09=09.reg =3D MLXREG_DPU_REG_PG_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_PG_COMPARATOR_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "pg_vddq",
> +=09=09.reg =3D MLXREG_DPU_REG_PG_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_PG_VDDQ_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "pg_hvdd",
> +=09=09.reg =3D MLXREG_DPU_REG_PG_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_PG_HVDD_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "pg_dvdd",
> +=09=09.reg =3D MLXREG_DPU_REG_PG_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_PG_DVDD_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +};
> +
> +static struct mlxreg_core_data mlxreg_dpu_health_events_items_data[] =3D=
 {
> +=09{
> +=09=09.label =3D "thermal_trip",
> +=09=09.reg =3D MLXREG_DPU_REG_HEALTH_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_HLTH_THERMAL_TRIP_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "ufm_upgrade_done",
> +=09=09.reg =3D MLXREG_DPU_REG_HEALTH_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_HLTH_UFM_UPGRADE_DONE_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "vddq_hot_alert",
> +=09=09.reg =3D MLXREG_DPU_REG_HEALTH_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_HLTH_VDDQ_HOT_ALERT_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "vdd_cpu_hot_alert",
> +=09=09.reg =3D MLXREG_DPU_REG_HEALTH_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_HLTH_VDD_CPU_HOT_ALERT_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "vddq_alert",
> +=09=09.reg =3D MLXREG_DPU_REG_HEALTH_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_HLTH_VDDQ_ALERT_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +=09{
> +=09=09.label =3D "vdd_cpu_alert",
> +=09=09.reg =3D MLXREG_DPU_REG_HEALTH_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_HLTH_VDD_CPU_ALERT_MASK,
> +=09=09.hpdev.nr =3D MLXREG_DPU_NR_NONE,
> +=09},
> +};
> +
> +static struct mlxreg_core_item mlxreg_dpu_hotplug_items[] =3D {
> +=09{
> +=09=09.data =3D mlxreg_dpu_power_events_items_data,
> +=09=09.aggr_mask =3D MLXREG_DPU_PG_AGGR_MASK,
> +=09=09.reg =3D MLXREG_DPU_REG_PG_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_PG_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxreg_dpu_power_events_items_data),
> +=09=09.health =3D false,
> +=09=09.inversed =3D 1,
> +=09},
> +=09{
> +=09=09.data =3D mlxreg_dpu_health_events_items_data,
> +=09=09.aggr_mask =3D MLXREG_DPU_HEALTH_AGGR_MASK,
> +=09=09.reg =3D MLXREG_DPU_REG_HEALTH_OFFSET,
> +=09=09.mask =3D MLXREG_DPU_HEALTH_MASK,
> +=09=09.count =3D ARRAY_SIZE(mlxreg_dpu_health_events_items_data),
> +=09=09.health =3D false,
> +=09=09.inversed =3D 1,
> +=09},
> +};
> +
> +static
> +struct mlxreg_core_hotplug_platform_data mlxreg_dpu_default_hotplug_data=
 =3D {
> +=09.items =3D mlxreg_dpu_hotplug_items,
> +=09.counter =3D ARRAY_SIZE(mlxreg_dpu_hotplug_items),
> +=09.cell =3D MLXREG_DPU_REG_AGGRCO_OFFSET,
> +=09.mask =3D MLXREG_DPU_AGGR_MASK,
> +};
> +
> +/* mlxreg_dpu - device private data

/**
 * struct mlxreg_dpu - ...

> + * @dev: platform device;
> + * @data: pltaform core data;

platform

> + * @io_data: register access platform data;
> + * @io_regs: register access device;
> + * @hotplug_data: hotplug platform data;
> + * @hotplug: hotplug device;

I don't recall seeing semicolons in kerneldoc anywhere else that in mlx=20
files, what's the purpose of them?

> + */
> +struct mlxreg_dpu {
> +=09struct device *dev;
> +=09struct mlxreg_core_data *data;
> +=09struct mlxreg_core_platform_data *io_data;
> +=09struct platform_device *io_regs;
> +=09struct mlxreg_core_hotplug_platform_data *hotplug_data;
> +=09struct platform_device *hotplug;
> +};
> +
> +static bool mlxreg_dpu_writeable_reg(struct device *dev, unsigned int re=
g)
> +{
> +=09switch (reg) {
> +=09case MLXREG_DPU_REG_PG_EVENT_OFFSET:
> +=09case MLXREG_DPU_REG_PG_MASK_OFFSET:
> +=09case MLXREG_DPU_REG_RESET_GP1_OFFSET:
> +=09case MLXREG_DPU_REG_GP0_OFFSET:
> +=09case MLXREG_DPU_REG_GP1_OFFSET:
> +=09case MLXREG_DPU_REG_GP4_OFFSET:
> +=09case MLXREG_DPU_REG_AGGRCO_OFFSET:
> +=09case MLXREG_DPU_REG_AGGRCO_MASK_OFFSET:
> +=09case MLXREG_DPU_REG_HEALTH_EVENT_OFFSET:
> +=09case MLXREG_DPU_REG_HEALTH_MASK_OFFSET:
> +=09=09return true;
> +=09}
> +=09return false;
> +}
> +
> +static bool mlxreg_dpu_readable_reg(struct device *dev, unsigned int reg=
)
> +{
> +=09switch (reg) {
> +=09case MLXREG_DPU_REG_FPGA1_VER_OFFSET:
> +=09case MLXREG_DPU_REG_FPGA1_PN_OFFSET:
> +=09case MLXREG_DPU_REG_FPGA1_PN1_OFFSET:
> +=09case MLXREG_DPU_REG_PG_OFFSET:
> +=09case MLXREG_DPU_REG_PG_EVENT_OFFSET:
> +=09case MLXREG_DPU_REG_PG_MASK_OFFSET:
> +=09case MLXREG_DPU_REG_RESET_GP1_OFFSET:
> +=09case MLXREG_DPU_REG_RST_CAUSE1_OFFSET:
> +=09case MLXREG_DPU_REG_GP0_RO_OFFSET:
> +=09case MLXREG_DPU_REG_GP0_OFFSET:
> +=09case MLXREG_DPU_REG_GP1_OFFSET:
> +=09case MLXREG_DPU_REG_GP4_OFFSET:
> +=09case MLXREG_DPU_REG_AGGRCO_OFFSET:
> +=09case MLXREG_DPU_REG_AGGRCO_MASK_OFFSET:
> +=09case MLXREG_DPU_REG_HEALTH_OFFSET:
> +=09case MLXREG_DPU_REG_HEALTH_EVENT_OFFSET:
> +=09case MLXREG_DPU_REG_HEALTH_MASK_OFFSET:
> +=09case MLXREG_DPU_REG_FPGA1_MVER_OFFSET:
> +=09case MLXREG_DPU_REG_CONFIG3_OFFSET:
> +=09=09return true;
> +=09}
> +=09return false;
> +}
> +
> +static bool mlxreg_dpu_volatile_reg(struct device *dev, unsigned int reg=
)
> +{
> +=09switch (reg) {
> +=09case MLXREG_DPU_REG_FPGA1_VER_OFFSET:
> +=09case MLXREG_DPU_REG_FPGA1_PN_OFFSET:
> +=09case MLXREG_DPU_REG_FPGA1_PN1_OFFSET:
> +=09case MLXREG_DPU_REG_PG_OFFSET:
> +=09case MLXREG_DPU_REG_PG_EVENT_OFFSET:
> +=09case MLXREG_DPU_REG_PG_MASK_OFFSET:
> +=09case MLXREG_DPU_REG_RESET_GP1_OFFSET:
> +=09case MLXREG_DPU_REG_RST_CAUSE1_OFFSET:
> +=09case MLXREG_DPU_REG_GP0_RO_OFFSET:
> +=09case MLXREG_DPU_REG_GP0_OFFSET:
> +=09case MLXREG_DPU_REG_GP1_OFFSET:
> +=09case MLXREG_DPU_REG_GP4_OFFSET:
> +=09case MLXREG_DPU_REG_AGGRCO_OFFSET:
> +=09case MLXREG_DPU_REG_AGGRCO_MASK_OFFSET:
> +=09case MLXREG_DPU_REG_HEALTH_OFFSET:
> +=09case MLXREG_DPU_REG_HEALTH_EVENT_OFFSET:
> +=09case MLXREG_DPU_REG_HEALTH_MASK_OFFSET:
> +=09case MLXREG_DPU_REG_FPGA1_MVER_OFFSET:
> +=09case MLXREG_DPU_REG_CONFIG3_OFFSET:
> +=09=09return true;
> +=09}
> +=09return false;
> +}
> +
> +/* Configuration for the register map of a device with 2 bytes address s=
pace. */
> +static const struct regmap_config mlxreg_dpu_regmap_conf =3D {
> +=09.reg_bits =3D 16,
> +=09.val_bits =3D 8,
> +=09.max_register =3D MLXREG_DPU_REG_MAX,
> +=09.cache_type =3D REGCACHE_FLAT,
> +=09.writeable_reg =3D mlxreg_dpu_writeable_reg,
> +=09.readable_reg =3D mlxreg_dpu_readable_reg,
> +=09.volatile_reg =3D mlxreg_dpu_volatile_reg,
> +};
> +
> +static int mlxreg_dpu_copy_hotplug_data(struct device *dev, struct mlxre=
g_dpu *mlxreg_dpu,
> +=09=09=09=09=09struct mlxreg_core_hotplug_platform_data *hotplug_data)

const struct ?

> +{
> +=09struct mlxreg_core_item *item;
> +=09int i;
> +
> +=09mlxreg_dpu->hotplug_data =3D devm_kmemdup(dev, hotplug_data,
> +=09=09=09=09=09=09sizeof(*mlxreg_dpu->hotplug_data), GFP_KERNEL);
> +=09if (!mlxreg_dpu->hotplug_data)
> +=09=09return -ENOMEM;
> +
> +=09mlxreg_dpu->hotplug_data->items =3D devm_kmemdup(dev, hotplug_data->i=
tems,
> +=09=09=09=09=09=09       mlxreg_dpu->hotplug_data->counter *
> +=09=09=09=09=09=09       sizeof(*hotplug_data->items),
> +=09=09=09=09=09=09       GFP_KERNEL);
> +=09if (!mlxreg_dpu->hotplug_data->items)
> +=09=09return -ENOMEM;
> +

> +=09item =3D mlxreg_dpu->hotplug_data->items;
> +=09for (i =3D 0; i < mlxreg_dpu->hotplug_data->counter; i++, item++) {
> +=09=09item =3D devm_kmemdup(dev, &hotplug_data->items[i], sizeof(*item),=
 GFP_KERNEL);

I think there is something wrong here wrt. what is assigned into the item=
=20
variable. The third line is going to overwrite what is the intention of=20
the first 2 lines.

And I suspect you don't even want to devm_kmemdup() into=20
mlxreg_dpu->hotplug_data->items above but just devm_kcalloc() it as I=20
think this loop tries to overwrite (duplicate) all entries (even if it=20
looks flawed in its current form).

> +=09=09if (!item)
> +=09=09=09return -ENOMEM;
> +=09=09item->data =3D devm_kmemdup(dev, hotplug_data->items[i].data,
> +=09=09=09=09=09  hotplug_data->items[i].count * sizeof(item->data),
> +=09=09=09=09=09  GFP_KERNEL);
> +=09=09if (!item->data)
> +=09=09=09return -ENOMEM;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int mlxreg_dpu_config_init(struct mlxreg_dpu *mlxreg_dpu, void *r=
egmap,
> +=09=09=09=09  struct mlxreg_core_data *data, int irq)
> +{
> +=09struct device *dev =3D &data->hpdev.client->dev;
> +=09u32 regval;
> +=09int err;
> +
> +=09/* Validate DPU type. */
> +=09err =3D regmap_read(regmap, MLXREG_DPU_REG_CONFIG3_OFFSET, &regval);
> +=09if (err)
> +=09=09return err;
> +=09switch (regval) {
> +=09case MLXREG_DPU_BF3:
> +=09=09/* Copy platform specific hotplug data. */
> +=09=09err =3D mlxreg_dpu_copy_hotplug_data(dev, mlxreg_dpu,
> +=09=09=09=09=09=09   &mlxreg_dpu_default_hotplug_data);
> +=09=09if (err)
> +=09=09=09return err;
> +
> +=09=09mlxreg_dpu->io_data =3D &mlxreg_dpu_default_regs_io_data;
> +
> +=09=09break;
> +=09default:
> +=09=09return -ENODEV;
> +=09}
> +
> +=09/* Register IO access driver. */
> +=09if (mlxreg_dpu->io_data) {
> +=09=09mlxreg_dpu->io_data->regmap =3D regmap;
> +=09=09mlxreg_dpu->io_regs =3D
> +=09=09platform_device_register_resndata(dev, "mlxreg-io", data->slot, NU=
LL, 0,

Misleadingly indented line.

> +=09=09=09=09=09=09  mlxreg_dpu->io_data,
> +=09=09=09=09=09=09  sizeof(*mlxreg_dpu->io_data));
> +=09=09if (IS_ERR(mlxreg_dpu->io_regs)) {
> +=09=09=09dev_err(dev, "Failed to create regio for client %s at bus %d at=
 addr 0x%02x\n",
> +=09=09=09=09data->hpdev.brdinfo->type, data->hpdev.nr,
> +=09=09=09=09data->hpdev.brdinfo->addr);
> +=09=09=09err =3D PTR_ERR(mlxreg_dpu->io_regs);
> +=09=09=09goto fail_register_io;
> +=09=09}
> +=09}
> +
> +=09/* Register hotplug driver. */
> +=09if (mlxreg_dpu->hotplug_data && irq) {
> +=09=09mlxreg_dpu->hotplug_data->regmap =3D regmap;
> +=09=09mlxreg_dpu->hotplug_data->irq =3D irq;
> +=09=09mlxreg_dpu->hotplug =3D
> +=09=09platform_device_register_resndata(dev, "mlxreg-hotplug", data->slo=
t, NULL, 0,

Ditto.

> +=09=09=09=09=09=09  mlxreg_dpu->hotplug_data,
> +=09=09=09=09=09=09  sizeof(*mlxreg_dpu->hotplug_data));
> +=09=09if (IS_ERR(mlxreg_dpu->hotplug)) {
> +=09=09=09err =3D PTR_ERR(mlxreg_dpu->hotplug);
> +=09=09=09goto fail_register_hotplug;
> +=09=09}
> +=09}
> +
> +=09return 0;
> +
> +fail_register_hotplug:
> +=09platform_device_unregister(mlxreg_dpu->io_regs);
> +fail_register_io:

Why is this label needed? Just return directly above instead of goto.

> +
> +=09return err;
> +}
> +
> +static void mlxreg_dpu_config_exit(struct mlxreg_dpu *mlxreg_dpu)
> +{
> +=09/* Unregister hotplug driver. */
> +=09platform_device_unregister(mlxreg_dpu->hotplug);
> +=09/* Unregister IO access driver. */
> +=09platform_device_unregister(mlxreg_dpu->io_regs);
> +}
> +
> +static int mlxreg_dpu_probe(struct platform_device *pdev)
> +{
> +=09struct mlxreg_core_data *data;
> +=09struct mlxreg_dpu *mlxreg_dpu;
> +=09void *regmap;
> +=09int err;
> +
> +=09data =3D dev_get_platdata(&pdev->dev);
> +=09if (!data || !data->hpdev.brdinfo)
> +=09=09return -EINVAL;
> +
> +=09mlxreg_dpu =3D devm_kzalloc(&pdev->dev, sizeof(*mlxreg_dpu), GFP_KERN=
EL);
> +=09if (!mlxreg_dpu)
> +=09=09return -ENOMEM;
> +
> +=09data->hpdev.adapter =3D i2c_get_adapter(data->hpdev.nr);
> +=09if (!data->hpdev.adapter)
> +=09=09return -EPROBE_DEFER;
> +
> +=09/* Create device at the top of DPU I2C tree.*/
> +=09data->hpdev.client =3D i2c_new_client_device(data->hpdev.adapter,
> +=09=09=09=09=09=09   data->hpdev.brdinfo);
> +=09if (IS_ERR(data->hpdev.client)) {
> +=09=09dev_err(&pdev->dev, "Failed to create client %s at bus %d at addr =
0x%02x\n",
> +=09=09=09data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo-=
>addr);
> +=09=09err =3D PTR_ERR(data->hpdev.client);
> +=09=09goto i2c_new_device_fail;
> +=09}
> +
> +=09regmap =3D devm_regmap_init_i2c(data->hpdev.client,
> +=09=09=09=09      &mlxreg_dpu_regmap_conf);

One line.

> +=09if (IS_ERR(regmap)) {
> +=09=09dev_err(&pdev->dev, "Failed to create regmap for client %s at bus =
%d at addr 0x%02x\n",
> +=09=09=09data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo-=
>addr);
> +=09=09err =3D PTR_ERR(regmap);
> +=09=09goto devm_regmap_init_i2c_fail;
> +=09}
> +
> +=09/* Sync registers with hardware. */
> +=09regcache_mark_dirty(regmap);
> +=09err =3D regcache_sync(regmap);
> +=09if (err) {
> +=09=09dev_err(&pdev->dev, "Failed to sync regmap for client %s at bus %d=
 at addr 0x%02x\n",
> +=09=09=09data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo-=
>addr);
> +=09=09err =3D PTR_ERR(regmap);
> +=09=09goto regcache_sync_fail;
> +=09}
> +
> +=09mlxreg_dpu->data =3D data;
> +=09mlxreg_dpu->dev =3D &pdev->dev;
> +=09platform_set_drvdata(pdev, mlxreg_dpu);
> +
> +=09/* Configure DPU. */
> +=09err =3D mlxreg_dpu_config_init(mlxreg_dpu, regmap, data, data->hpdev.=
brdinfo->irq);
> +=09if (err)
> +=09=09goto mlxreg_dpu_config_init_fail;
> +
> +=09return err;
> +
> +mlxreg_dpu_config_init_fail:
> +regcache_sync_fail:
> +devm_regmap_init_i2c_fail:
> +=09if (data->hpdev.client) {
> +=09=09i2c_unregister_device(data->hpdev.client);
> +=09=09data->hpdev.client =3D NULL;
> +=09}
> +i2c_new_device_fail:
> +=09i2c_put_adapter(data->hpdev.adapter);
> +=09data->hpdev.adapter =3D NULL;
> +=09return err;
> +}
> +
> +static void mlxreg_dpu_remove(struct platform_device *pdev)
> +{
> +=09struct mlxreg_core_data *data =3D dev_get_platdata(&pdev->dev);
> +=09struct mlxreg_dpu *mlxreg_dpu =3D platform_get_drvdata(pdev);
> +
> +=09mlxreg_dpu_config_exit(mlxreg_dpu);
> +=09if (data->hpdev.client) {
> +=09=09i2c_unregister_device(data->hpdev.client);
> +=09=09data->hpdev.client =3D NULL;
> +=09=09i2c_put_adapter(data->hpdev.adapter);
> +=09=09data->hpdev.adapter =3D NULL;
> +=09}
> +}
> +
> +static struct platform_driver mlxreg_dpu_driver =3D {
> +=09.probe =3D mlxreg_dpu_probe,
> +=09.remove =3D mlxreg_dpu_remove,
> +=09.driver =3D {
> +=09=09.name =3D "mlxreg-dpu",
> +=09},
> +};
> +
> +module_platform_driver(mlxreg_dpu_driver);
> +
> +MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
> +MODULE_DESCRIPTION("Nvidia Data Processor Unit platform driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_ALIAS("platform:mlxreg-dpu");
>=20

--=20
 i.
--8323328-1272013915-1736787161=:881--
