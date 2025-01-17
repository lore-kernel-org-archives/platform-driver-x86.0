Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14D1A08CA
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133164; cv=none; b=hxlAj7HGezGsMIlMffyX9j6TZb/N/RCFlohuMLN75Wg1wwr4TvaDVPSu8vtZKZj20prEksr8rMRV3klIeUyaWyy0etOkRCUXmH0PD4M27yKSv0Gatce9EWRDujw6sW4PvB3lyza2dE+zmEBgHgnMvBF/vp3L2nAo45JSGW+VNQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133164; c=relaxed/simple;
	bh=yAGFGluOuaFGU7wR2k5o5XCVjdqH/37tz5makYPedvY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hfNTZyqGq7uWPTCQIVW0fZkAdbHcHoTGOd4MxfBMaFmc2PaAgsfKwNOqcGC92u9uGvFOefilKJx+rQv3XsuIrpgwa6b6je0bNzsKxnEeQT/X+PjDJIENyIQeWPuYKPQUwHeaC7F+Gh/Se8rM42ys4TpYWGObv6zAqiMInZpJB6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wg6mLFtq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wg6mLFtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737133162; x=1768669162;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yAGFGluOuaFGU7wR2k5o5XCVjdqH/37tz5makYPedvY=;
  b=Wg6mLFtqcTw5qmGTj8HqQxuz9iM7iVyXWsNPuOQukWHQNG5iYn2SSYTz
   K8SjWYxhBIBz8v8V4NYbVJZJbfxWF+UnkJ2COFkj71qywC5T45kq482uE
   I0lF/2AD15nJet/F4QjpT2LBAeTjAWPHysomzjUT7Qb7xzXQ00NKj9qiM
   mah4VPL0edplCY8m2hcnyD49jql2NOOdCYgijXPIf7OJNYpzXsNgHPMZ5
   vClewiwYyAfk7OFZqGfK+o0EkoOTRYUkTO1cddcKLtXGoxE1SsSOKtNj8
   3PMbZ4UzukWs9IgJvYfDywx6skvNZNB+a7DZQ4B03Z/834bT9T84dWQJD
   A==;
X-CSE-ConnectionGUID: nlgSJFZ8RqGRpmeAI/RaNA==
X-CSE-MsgGUID: n2+Q1Ht9TCC6KX9gqrBBOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="55119482"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="55119482"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:58:50 -0800
X-CSE-ConnectionGUID: RgSYFkNuTsq1RpSPFKTW5w==
X-CSE-MsgGUID: b1h2EBbvTY2Y2c/SAPIQXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143138181"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.76])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:58:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 17 Jan 2025 18:58:42 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 06/10] platform/mellanox: mlxreg-dpu: Add initial
 support for Nvidia DPU
In-Reply-To: <20250116075919.34270-7-vadimp@nvidia.com>
Message-ID: <908880b1-88e6-de66-c55f-af08c682603f@linux.intel.com>
References: <20250116075919.34270-1-vadimp@nvidia.com> <20250116075919.34270-7-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-290032576-1737133122=:932"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-290032576-1737133122=:932
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 16 Jan 2025, Vadim Pasternak wrote:

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
> Comments pointed out by Ilpo:
> - Fix s/pltaform/platform.
> - Remove semicolon from structure description.
> - In routine mlxreg_dpu_copy_hotplug_data() use 'const struct' for the
>   third argument.
> - In mlxreg_dpu_copy_hotplug_data() remove redunadant devm_kmemdup()
>   call.
> - Fix identifications in mlxreg_dpu_config_init().
> - Remove label 'fail_register_io" from error flow.
> - One line for devm_regmap_init_i2c() call in mlxreg_dpu_probe().
> ---
>  drivers/platform/mellanox/Kconfig      |  12 +
>  drivers/platform/mellanox/Makefile     |   1 +
>  drivers/platform/mellanox/mlxreg-dpu.c | 615 +++++++++++++++++++++++++
>  3 files changed, 628 insertions(+)
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
> index 000000000000..0d4cede4eebe
> --- /dev/null
> +++ b/drivers/platform/mellanox/mlxreg-dpu.c
> @@ -0,0 +1,615 @@
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
> + * @dev: platform device
> + * @data: platform core data
> + * @io_data: register access platform data
> + * @io_regs: register access device
> + * @hotplug_data: hotplug platform data
> + * @hotplug: hotplug device
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
> +static int
> +mlxreg_dpu_copy_hotplug_data(struct device *dev, struct mlxreg_dpu *mlxr=
eg_dpu,
> +=09=09=09     const struct mlxreg_core_hotplug_platform_data *hotplug_da=
ta)
> +{
> +=09struct mlxreg_core_item *item;
> +=09int i;
> +
> +=09mlxreg_dpu->hotplug_data =3D devm_kmemdup(dev, hotplug_data,
> +=09=09=09=09=09=09sizeof(*mlxreg_dpu->hotplug_data), GFP_KERNEL);
> +=09if (!mlxreg_dpu->hotplug_data)
> +=09=09return -ENOMEM;
> +
> +=09item =3D mlxreg_dpu->hotplug_data->items;
> +=09for (i =3D 0; i < mlxreg_dpu->hotplug_data->counter; i++, item++) {

This still has the same issue wrt. what is assigned to item. The item=20
related code on the two lines above this point do nothing because the=20
variable's value will be overwritten by this:

> +=09=09item =3D devm_kmemdup(dev, &hotplug_data->items[i], sizeof(*item),=
 GFP_KERNEL);

What is the intent here? The allocated item will be left dangling, only=20
thing that holds pointer to it after this iteration complets is the devm=20
machinery, is that the intention here? Or did you perhaps want to put it=20
into the ->items (which btw is no longer allocated at all since you didn't=
=20
replace the memdup with kcalloc)?

If you don't understand what I'm trying to tell here, please try to=20
explain what this loop does, in terms of where you want the allocated=20
item be stored into?

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

--=20
 i.


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
> +=09=09=09platform_device_register_resndata(dev, "mlxreg-io",
> +=09=09=09=09=09=09=09  data->slot, NULL, 0,
> +=09=09=09=09=09=09=09  mlxreg_dpu->io_data,
> +=09=09=09=09=09=09=09  sizeof(*mlxreg_dpu->io_data));
> +=09=09if (IS_ERR(mlxreg_dpu->io_regs)) {
> +=09=09=09dev_err(dev, "Failed to create regio for client %s at bus %d at=
 addr 0x%02x\n",
> +=09=09=09=09data->hpdev.brdinfo->type, data->hpdev.nr,
> +=09=09=09=09data->hpdev.brdinfo->addr);
> +=09=09=09return PTR_ERR(mlxreg_dpu->io_regs);
> +=09=09}
> +=09}
> +
> +=09/* Register hotplug driver. */
> +=09if (mlxreg_dpu->hotplug_data && irq) {
> +=09=09mlxreg_dpu->hotplug_data->regmap =3D regmap;
> +=09=09mlxreg_dpu->hotplug_data->irq =3D irq;
> +=09=09mlxreg_dpu->hotplug =3D
> +=09=09=09platform_device_register_resndata(dev, "mlxreg-hotplug",
> +=09=09=09=09=09=09=09  data->slot, NULL, 0,
> +=09=09=09=09=09=09=09  mlxreg_dpu->hotplug_data,
> +=09=09=09=09=09=09=09  sizeof(*mlxreg_dpu->hotplug_data));
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
> +=09regmap =3D devm_regmap_init_i2c(data->hpdev.client, &mlxreg_dpu_regma=
p_conf);
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
--8323328-290032576-1737133122=:932--
