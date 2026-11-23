Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442542;
	b=sa4wtbHtFavD3+84e2xmyWXns9+6wR7iu17m8nbrVKq6nWTvbfGwfwjSvVw0I2zPNX1n
	 FxZoOq+wRM7rceNJ1uR8W4NcjCDX+jb//DbJIfjQCKrN4SIufgHmigY1yjsucZs7EJMyw
	 Bg4K9TI6BaTx89ju9Uu8+25phQiFRVNO12/JGaUyTo9zZQjY+phn6SarkU+qhi3i1kGG5
	 Dig1p5cKbrQUNHsZyjfaCDekKsUDdxO6Ju3j8pBxoCQmkinKSOBFIGCQ4/T3DyOc2U4tD
	 JZ3ePeuGjBAeW/TVrxhsNZQZW16yiAwy3UDVMvYsW8o26zbMU9fJ3Q3eiWW+CsRE8hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442542;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=+1BjVPcHCv1i8USjoNXnzhFJLvG5lD3hIfz/hU+hDu8=;
	b=U9UxNb7PAq4zGo73ZwNiPELmmTJfQIu/EfFC3NXIfNsTmj03EcrWigiUctQg4+hk77lj
	 +SxNreJ0WFu7pW0esz82tzC6oHCtNAxa3y/uxEYLnLftym0F6tGCZQLdlte+sSpTiO0Tu
	 GUOgNGOZz20L5joOWXbeB9sOHMNFIK2JoBQXVtC8EF8ltt/T3hIwytnVShGMrVT4ICweO
	 JDVNbqrztxJPbK5ucKGIzb3Pi1RB9xmTZygYRZ8hOM17lrNSAVMm0LfH9b5e7oxwVN/6y
	 qpeDpS5KmrBsGGJjDy4TpAs6Tlx57kjP29Vv8KpS5aIralrI7UrnD+Vj4EbDttgJ79A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KkH0pMQc;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB67606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 14:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB67606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KkH0pMQc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795442542; x=1826978542;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zOPFzLzhklfpotVUNwACrdVv/WGQMu1ND4mQIgC8cXA=;
  b=KkH0pMQcLzuiwS6+CmEzQEmj2ZCZzjJ7v1ax4ZpJzhtZbB5Ha4gtn9Vd
   Vre6o/NiyWYxRuYN2wKdD42A8CCdZmtah4HrbQyWBDh9YUjJS0b9CEudm
   zSRk3/2adh72V3XdyBPeIqr7i62hvRhmjUm1u1Kc281yblJtPbim+4FGQ
   KzCcqUNrWsS3XQNQ1urRh4qYwhZBuh5e4duVUHb6oUT7lPuO7eRG0UgwQ
   2T4r/rIEN9hu2TXNSnwW/WR7nFA9LeZ2+tBqEE/Ud7oBOKp+lirX90701
   f1zLsmk+nHcxGao+S5/Ss6UWtFDf7v84QeaqhMsnWEvLeccJUhVkQdV/q
   g==;
X-CSE-ConnectionGUID: ACOGA9N+RzGPk5lPZsKRvg==
X-CSE-MsgGUID: 8TMCMVk7Rx600PQUHgQ1ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4149502"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4149502"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:02:22 -0800
X-CSE-ConnectionGUID: zAQZwrk8Tj+pKXfpEA5zew==
X-CSE-MsgGUID: TsNf6xXTStOyVjb94c1KSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11717877"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:02:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 16:02:15 +0200 (EET)
To: Felix Radensky <fradensky@nvidia.com>
cc: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v3 2/3] platform/mellanox: nvsw-host-spc6:
 Add driver for Nvidia SPC6 switches
In-Reply-To: <20261020172756.4160946-3-fradensky@nvidia.com>
Message-ID: <c7cf11c8-d704-1515-f6c0-9bf71bac4b42@linux.intel.com>
References: <20261020172756.4160946-1-fradensky@nvidia.com> <20261020172756.4160946-3-fradensky@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Oct 2026, Felix Radensky wrote:

> The driver allows system control and monitoring of Nvidia liquid
> cooled Ethernet switches based on the SPC6 ASIC through CPLD/FPGA
> devices from the host CPU.
> 
> This control includes:
> - Various resets handling through sysfs attributes.
> - Reset cause reports through sysfs attributes.
> - Mux attributes for hw components selection.
> - General purpose registers attributes.
> - LED control.
> - Watchdog control.
> 
> These systems carry no power supplies or fan drawers of their own, so
> the board description covers coolant leakage detection and power
> distribution board status instead of power supply and fan control.
> 
> The driver describes the SPC6 hardware and leaves the register map and
> platform device creation to nvsw-core.
> 
> The per SKU part of that description is held in struct
> nvsw_host_spc6_cfg and is selected through the driver_data of the
> matching DMI entry, so that the board data is chosen by the SKU that
> was matched rather than by inspecting DMI again, and further SKUs are
> added by describing them rather than by extending the match callback.
> 
> Document the register access attributes which are not yet covered by
> Documentation/ABI/stable/sysfs-driver-mlxreg-io.
> 
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> 
> v2->v3
> Additional fixes added by Felix:
> - Describe jtag_enable as the single bit it is. It was given a two
>   bit mask, but only the lower bit is defined in the CPLD register
>   map, so values 2 and 3 were accepted and wrote a reserved bit.
> - Drop the shutdown_unlock attribute. It was described over bit 5 of
>   the general purpose register, which the CPLD register map lists as
>   reserved. Thermal shutdown unlock is handled by the BMC on SPC6, so
>   the attribute is removed rather than moved.
> 
> Issues reported by the sashiko.dev review:
> - Fix the shift for asic2_health, asic3_health and asic4_health. The
>   four health fields share ASIC_HEALTH_INT_Stat_REG1, two bits each,
>   but all four entries carried .bit = 1, so only asic_health was
>   right-aligned. The other three reported their field still shifted
>   up, giving 0, 8 or 12 for asic2_health instead of the documented 0,
>   2 or 3, and likewise for asic3_health and asic4_health. Set .bit to
>   the one-based position of each mask's least significant bit.
> - Make pdb1_pwr_status..pdb4_pwr_status read only. They were exposed
>   with mode 0644 over NVSW_REG_PS_DC_OK_OFFSET, which is not listed in
>   nvsw_writeable_reg(), so any write returned -EIO. The ABI
>   documentation is updated to match the description, which only
>   defines read semantics.
> 
> v1->v2
> Comments pointed out by Ilpo:
> - Add the direct includes for the macros this file uses instead of
>   relying on them arriving transitively: linux/array_size.h,
>   linux/bits.h, linux/dev_printk.h and linux/err.h.
> - Register into a local in nvsw_host_spc6_mux_topology_init() and in
>   the probe path, publishing the pointer only once it is known good,
>   so the NULL assignments that were hiding an ERR_PTR are gone. The
>   only ones left are on nvsw_host_mux_i2c_client and
>   nvsw_host_mux_i2c_adapter, which are module scope and so outlive a
>   failed probe.

This looks generally better, thanks

But I still don't understand why these two cannot be inside drvdata?

You already put client into nvsw_core so I've really trouble in 
understanding why it couldn't be use from there where it is needed? Same 
goes for the adapter one, why it couldn't be carried across inside 
drvdata?

> - Drop the per-entry pointer tests from
>   nvsw_host_spc6_mux_topology_exit(), since init now rolls back fully
>   on failure.
> Additional fixes added by Felix:
> - Sort the include block.
> 
>  .../ABI/stable/sysfs-driver-mlxreg-io         | 159 ++++
>  drivers/platform/mellanox/Kconfig             |  10 +
>  drivers/platform/mellanox/Makefile            |   1 +
>  drivers/platform/mellanox/nvsw-host-spc6.c    | 901 ++++++++++++++++++
>  4 files changed, 1071 insertions(+)
>  create mode 100644 drivers/platform/mellanox/nvsw-host-spc6.c
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index f59461111221..e6128933f343 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -813,3 +813,162 @@ Description:	These files show status of Unified Fabric Manager upgrade.
>  		state. 0 - means upgrade is done, 1 - otherwise.
>  
>  		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld6_pn
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld6_version
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld6_version_min
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld7_pn
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld7_version
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld7_version_min
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld8_pn
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld8_version
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld8_version_min
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld9_pn
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld9_version
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld9_version_min
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld10_pn
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld10_version
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld10_version_min
> +Date:		September 2026
> +KernelVersion:	7.4

Please update these as 7.4 was missed.

--
 i.

> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	These files show with which CPLD part numbers, version and minor
> +		versions have been burned the 6-th to the 10-th CPLD devices
> +		equipped on a system.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic1_reset
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic3_reset
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic4_reset
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	These files allow to reset the first, the third and the fourth
> +		ASIC on a multi-ASIC system. Writing 1 puts the related ASIC
> +		into reset state, writing 0 releases it.
> +
> +		The files are read/write.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic3_health
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic4_health
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	These files show health status of the third and the fourth ASIC
> +		on a multi-ASIC system. The possible values are:
> +		0 - health failed, 2 - health OK, 3 - ASIC in booting state.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage1
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage2
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage3
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage4
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage5
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	These files show the status of the liquid leakage sensors
> +		equipped on a liquid cooled system. Value 1 means that a leak
> +		has been detected by the related sensor, 0 - otherwise. The
> +		number of sensors actually connected depends on the system
> +		type.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb1_pwr_status
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb2_pwr_status
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb3_pwr_status
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb4_pwr_status
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	These files show the power status of the power distribution
> +		boards equipped on a system. Value 1 means that the related
> +		board is powered and operational, 0 - otherwise.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/graceful_pwr_off
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	This file allows to initiate a graceful power off sequence and
> +		shows whether such a sequence is in progress. Writing 1 starts
> +		the sequence.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpu_shutdown_req
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	This file shows a shutdown request raised towards the CPU.
> +		Value 1 means that a shutdown of the system has been
> +		requested, 0 - otherwise.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpu_power_off_ready
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	This file allows the CPU to report that it has completed its
> +		shutdown procedures and that the system can be powered down.
> +		Writing 1 signals readiness for power off.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpu_mctp_ready
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	This file indicates whether the CPU side of the MCTP link
> +		towards the Board Management Controller is ready. Value 1
> +		means the link is ready, 0 - otherwise.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bmc_to_cpu_ctrl
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	This file selects the owner of the shared I2C bus between the
> +		Board Management Controller and the CPU. Value 0 selects the
> +		CPU as the owner, 1 selects the Board Management Controller.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/uart_sel
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	This file selects which of the system consumers is connected to
> +		the shared UART console.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/aux_pwr_cycle
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	This file allows to power cycle the auxiliary power domain of
> +		the system. Writing 1 performs the power cycle.
> +
> +		The file is write only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_aux_pwr_or_reload
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_cpu_thermal
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_main_51v
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_mgmt_pwr
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Felix Radensky <fradensky@nvidia.com>
> +Description:	These files show the system reset cause. Respectively:
> +		auxiliary power failure or CPLD field upgrade, CPU thermal
> +		shutdown, management board 5.1V rail failure and management
> +		board power failure. Value 1 means the related event caused
> +		the last reset.
> +
> +		The files are read only.
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
> index 383906a77b6c..650f7f463c9e 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -114,6 +114,16 @@ config NVSW_CORE
>  	  selected by the drivers that need it, which are built as separate
>  	  modules against it.
>  
> +config NVSW_HOST_SPC6
> +	tristate "Nvidia SPC6 host CPLD/FPGA Hardware Control and Monitoring"
> +	depends on DMI && HWMON && I2C
> +	select NVSW_CORE
> +	help
> +	  Say Y here to include support for the FPGA/CPLD logic by host CPU
> +	  equipped on Nvidia SPC6 ethernet switches.
> +	  This driver can also be built as a module. If so the module
> +	  will be called nvsw-host-spc6.
> +
>  config NVSW_SN2201
>  	tristate "Nvidia SN2201 platform driver support"
>  	depends on HWMON && I2C
> diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
> index 22e40759dd49..a959d07f1787 100644
> --- a/drivers/platform/mellanox/Makefile
> +++ b/drivers/platform/mellanox/Makefile
> @@ -12,4 +12,5 @@ obj-$(CONFIG_MLXREG_HOTPLUG)	+= mlxreg-hotplug.o
>  obj-$(CONFIG_MLXREG_IO) += mlxreg-io.o
>  obj-$(CONFIG_MLXREG_LC) += mlxreg-lc.o
>  obj-$(CONFIG_NVSW_CORE) += nvsw-core.o
> +obj-$(CONFIG_NVSW_HOST_SPC6) += nvsw-host-spc6.o
>  obj-$(CONFIG_NVSW_SN2201) += nvsw-sn2201.o
> diff --git a/drivers/platform/mellanox/nvsw-host-spc6.c b/drivers/platform/mellanox/nvsw-host-spc6.c
> new file mode 100644
> index 000000000000..a87d796004fa
> --- /dev/null
> +++ b/drivers/platform/mellanox/nvsw-host-spc6.c
> @@ -0,0 +1,901 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Nvidia SPC6 host platform driver
> + *
> + * Copyright (C) 2025-2026 Nvidia Technologies Ltd.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/i2c-mux.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/mlxcpld.h>
> +#include <linux/platform_data/mlxreg.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "nvsw.h"
> +
> +#define NVSW_HOST_DEVICE_NAME	"mlxplat"
> +
> +/* Bus number of mux parent device */
> +#define NVSW_I2C_MUX_PARENT_BUS_NR	2
> +
> +/* Bus number of the last host I2C bus */
> +#define NVSW_I2C_LAST_HOST_BUS_NR	3
> +
> +/**
> + * struct nvsw_host_spc6_cfg - per SKU board description
> + * @regs_io: register access platform data;
> + * @led: led platform data;
> + */
> +struct nvsw_host_spc6_cfg {
> +	struct mlxreg_core_platform_data *regs_io;
> +	struct mlxreg_core_platform_data *led;
> +};
> +
> +/* Platform mux channels */
> +static int nvsw_host_spc6_mux_channels[] = {
> +	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
> +	18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
> +	33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
> +	48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62,
> +	63, 64, 65, 66, 67,
> +};
> +
> +/* Platform mux data */
> +static struct mlxcpld_mux_plat_data nvsw_host_spc6_mux_data[] = {
> +	{
> +		.chan_ids = nvsw_host_spc6_mux_channels,
> +		.num_adaps = ARRAY_SIZE(nvsw_host_spc6_mux_channels),
> +		.sel_reg_addr = NVSW_REG_MUX1_OFFSET,
> +		.reg_size = 2,
> +	},
> +};
> +
> +/* Platform mux board info */
> +static struct i2c_board_info nvsw_host_spc6_mux_brdinfo = {
> +	I2C_BOARD_INFO("i2c-mux-mlxcpld", 0x33),
> +};
> +
> +static struct i2c_adapter *nvsw_host_mux_i2c_adapter;
> +static struct i2c_client *nvsw_host_mux_i2c_client;

> +static struct mlxcpld_mux_plat_data *nvsw_host_mux_data[NVSW_MUX_MAX];
> +static struct i2c_board_info *nvsw_host_mux_brdinfo;
> +static struct mlxreg_core_platform_data *nvsw_led_data;
> +static struct mlxreg_core_platform_data *nvsw_regs_io_data;
> +static struct mlxreg_core_platform_data *nvsw_wd_data[NVSW_WD_MAX];
> +static int nvsw_host_mux_num;

Can these like be stored into one structure that is held in stack until 

> +static struct platform_device *nvsw_host_dev;





> +/* Mux init/exit callbacks. */
> +static int nvsw_host_spc6_mux_topology_init(struct nvsw_core *nvsw_core)
> +{
> +	struct platform_device *pdev;
> +	int i, err;
> +
> +	/* Create mux infrastructure. */
> +	for (i = 0; i < nvsw_core->mux_num; i++) {
> +		pdev = platform_device_register_resndata(&nvsw_host_mux_i2c_client->dev,
> +							 "i2c-mux-mlxcpld", i, NULL,
> +							 0, nvsw_host_mux_data[i],
> +							 sizeof(*nvsw_host_mux_data[i]));
> +		if (IS_ERR(pdev)) {
> +			dev_err(nvsw_core->dev, "Failed to create mux infra\n");
> +			err = PTR_ERR(pdev);
> +			goto err_unregister_mux;
> +		}
> +		nvsw_core->mux[i] = pdev;
> +	}
> +
> +	return 0;
> +
> +err_unregister_mux:
> +	while (i--)
> +		platform_device_unregister(nvsw_core->mux[i]);
> +
> +	return err;
> +}
> +
> +static void nvsw_host_spc6_mux_topology_exit(struct nvsw_core *nvsw_core)
> +{
> +	int i;
> +
> +	for (i = nvsw_core->mux_num - 1; i >= 0; i--)
> +		platform_device_unregister(nvsw_core->mux[i]);
> +}
> +
> +/* Liquid cooled systems, without power supplies and fans. */
> +static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_lc = {
> +	.regs_io = &nvsw_host_spc6_lc_regs_io,
> +	.led = &nvsw_host_spc6_lc_led,
> +};
> +
> +static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *dmi)
> +{
> +	const struct nvsw_host_spc6_cfg *cfg = dmi->driver_data;
> +	int i;
> +
> +	/* Set system configuration. */
> +	nvsw_host_mux_num = ARRAY_SIZE(nvsw_host_spc6_mux_data);
> +	for (i = 0; i < nvsw_host_mux_num; i++)
> +		nvsw_host_mux_data[i] = &nvsw_host_spc6_mux_data[i];
> +	nvsw_host_mux_brdinfo = &nvsw_host_spc6_mux_brdinfo;
> +	nvsw_regs_io_data = cfg->regs_io;
> +	nvsw_led_data = cfg->led;
> +	for (i = 0; i < ARRAY_SIZE(nvsw_host_spc6_wd_set); i++)
> +		nvsw_wd_data[i] = &nvsw_host_spc6_wd_set[i];
> +
> +	return 1;
> +}

Why can't .driver_data point to all these and you carry just a single 
pointer over instead of copying gazillions of them?

> +
> +static const struct dmi_system_id nvsw_host_dmi_table[] __initconst = {
> +	{
> +		.callback = nvsw_host_dmi_spc6_switch_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "VMOD0025"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI193"),
> +		},
> +		.driver_data = (void *)&nvsw_host_spc6_cfg_lc,
> +	},
> +	{
> +		.callback = nvsw_host_dmi_spc6_switch_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "VMOD0027"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI183"),
> +		},
> +		.driver_data = (void *)&nvsw_host_spc6_cfg_lc,
> +	},
> +	{
> +		.callback = nvsw_host_dmi_spc6_switch_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "VMOD0027"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI187"),
> +		},
> +		.driver_data = (void *)&nvsw_host_spc6_cfg_lc,
> +	},
> +	{
> +		.callback = nvsw_host_dmi_spc6_switch_matched,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "VMOD0027"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI188"),
> +		},
> +		.driver_data = (void *)&nvsw_host_spc6_cfg_lc,
> +	},
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(dmi, nvsw_host_dmi_table);
> +
> +static int nvsw_host_probe(struct platform_device *pdev)
> +{
> +	struct i2c_adapter *last_host_adapter;
> +	struct nvsw_core *nvsw_core;
> +	struct i2c_client *client;
> +	int i, err;
> +
> +	/* Ensure the I2C host driver has finished registering
> +	 * all 4 buses (0-3) to prevent the mux from stealing bus 3
> +	 */
> +	last_host_adapter = i2c_get_adapter(NVSW_I2C_LAST_HOST_BUS_NR);
> +	if (!last_host_adapter) {
> +		dev_dbg(&pdev->dev,
> +			"I2C adapter for bus %d is not ready, deferring probe\n",
> +			NVSW_I2C_LAST_HOST_BUS_NR);
> +		return -EPROBE_DEFER;
> +	}
> +	i2c_put_adapter(last_host_adapter);
> +
> +	/* Get I2C mux parent adapter */
> +	nvsw_host_mux_i2c_adapter = i2c_get_adapter(NVSW_I2C_MUX_PARENT_BUS_NR);
> +	if (!nvsw_host_mux_i2c_adapter) {
> +		dev_err(&pdev->dev,
> +			"I2C adapter for bus %d is not available\n",
> +			NVSW_I2C_MUX_PARENT_BUS_NR);
> +		return -ENODEV;
> +	}
> +
> +	/* Create device at the top of host I2C tree */
> +	nvsw_host_mux_brdinfo->platform_data = nvsw_host_mux_data;
> +	client = i2c_new_client_device(nvsw_host_mux_i2c_adapter, nvsw_host_mux_brdinfo);
> +	if (IS_ERR(client)) {
> +		dev_err(&pdev->dev,
> +			"Failed to create client %s at bus %d at addr 0x%02x\n",
> +			nvsw_host_mux_brdinfo->type, NVSW_I2C_MUX_PARENT_BUS_NR,
> +			nvsw_host_mux_brdinfo->addr);
> +		err = PTR_ERR(client);
> +		goto err_put_adapter;
> +	}
> +	nvsw_host_mux_i2c_client = client;
> +
> +	nvsw_core = devm_kzalloc(&pdev->dev, sizeof(*nvsw_core), GFP_KERNEL);
> +	if (!nvsw_core) {
> +		err = -ENOMEM;
> +		goto err_unregister_client;
> +	}
> +
> +	/* Set system configuration. */
> +	nvsw_core->dev = &pdev->dev;
> +	nvsw_core->client = nvsw_host_mux_i2c_client;
> +	nvsw_core->mux_num = nvsw_host_mux_num;
> +	for (i = 0; i < ARRAY_SIZE(nvsw_wd_data); i++)
> +		nvsw_core->wd_data[i] = nvsw_wd_data[i];
> +	nvsw_core->regio_data = nvsw_regs_io_data;
> +	nvsw_core->led_data = nvsw_led_data;
> +	nvsw_core->mux_init = nvsw_host_spc6_mux_topology_init;
> +	nvsw_core->mux_exit = nvsw_host_spc6_mux_topology_exit;
> +	platform_set_drvdata(pdev, nvsw_core);
> +
> +	err = nvsw_core_init(nvsw_core);
> +	if (err)
> +		goto err_unregister_client;
> +
> +	return 0;
> +
> +	/* The two pointers below are module scope, so they are cleared to
> +	 * keep them from outliving the objects they refer to.
> +	 */
> +err_unregister_client:
> +	i2c_unregister_device(nvsw_host_mux_i2c_client);
> +	nvsw_host_mux_i2c_client = NULL;
> +err_put_adapter:
> +	i2c_put_adapter(nvsw_host_mux_i2c_adapter);
> +	nvsw_host_mux_i2c_adapter = NULL;
> +
> +	return err;
> +}
> +
> +static void nvsw_host_remove(struct platform_device *pdev)
> +{
> +	struct nvsw_core *nvsw_core = platform_get_drvdata(pdev);
> +
> +	nvsw_core_exit(nvsw_core);
> +	i2c_unregister_device(nvsw_host_mux_i2c_client);
> +	nvsw_host_mux_i2c_client = NULL;
> +	i2c_put_adapter(nvsw_host_mux_i2c_adapter);
> +	nvsw_host_mux_i2c_adapter = NULL;
> +}
> +
> +static struct platform_driver nvsw_host_driver = {
> +	.driver		= {
> +		.name	= NVSW_HOST_DEVICE_NAME,
> +		.probe_type = PROBE_FORCE_SYNCHRONOUS,
> +	},
> +	.probe		= nvsw_host_probe,
> +	.remove		= nvsw_host_remove,
> +};
> +
> +static int __init nvsw_host_init(void)
> +{
> +	int err;
> +
> +	if (!dmi_check_system(nvsw_host_dmi_table))
> +		return -ENODEV;
> +
> +	nvsw_host_dev = platform_device_register_simple(NVSW_HOST_DEVICE_NAME,
> +							PLATFORM_DEVID_NONE,
> +							NULL, 0);
> +	if (IS_ERR(nvsw_host_dev))
> +		return PTR_ERR(nvsw_host_dev);
> +
> +	err = platform_driver_register(&nvsw_host_driver);
> +	if (err)
> +		platform_device_unregister(nvsw_host_dev);
> +
> +	return err;
> +}
> +module_init(nvsw_host_init);
> +
> +static void __exit nvsw_host_exit(void)
> +{
> +	platform_driver_unregister(&nvsw_host_driver);
> +	platform_device_unregister(nvsw_host_dev);
> +}
> +module_exit(nvsw_host_exit);
> +
> +MODULE_AUTHOR("Felix Radensky <fradensky@nvidia.com>");
> +MODULE_DESCRIPTION("Nvidia platform SPC6 driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_IMPORT_NS("NVSW");
> 

-- 
 i.

