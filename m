From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v7 00/11] Stop monitoring disabled devices
Date: Tue, 30 Jun 2020 14:57:52 +0200
Message-ID: <aab40d90-3f72-657c-5e14-e53a34c4b420@linaro.org>
References: <20200629122925.21729-1-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200629122925.21729-1-andrzej.p@collabora.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


Hi Andrzej,

I've tested your series with kernelci and there are 3 regressions for
the imx6.

https://kernelci.org/test/job/thermal/branch/testing/kernel/v5.8-rc3-11-gf5e50bf4d3ef/plan/baseline/


On 29/06/2020 14:29, Andrzej Pietrasiewicz wrote:
> A respin of v6 with these changes:
> 
> v6..v7:
> - removed duplicate S-o-b line from patch 6/11
> 
> v5..v6:
> - staticized thermal_zone_device_set_mode() (kbuild test robot)
> 
> v4..v5:
> 
> - EXPORT_SYMBOL -> EXPORT_SYMBOL_GPL (Daniel)
> - dropped unnecessary thermal_zone_device_enable() in int3400_thermal.c
> and in thermal_of.c (Bartlomiej)
> 
> Andrzej Pietrasiewicz (11):
>   acpi: thermal: Fix error handling in the register function
>   thermal: Store thermal mode in a dedicated enum
>   thermal: Add current mode to thermal zone device
>   thermal: Store device mode in struct thermal_zone_device
>   thermal: remove get_mode() operation of drivers
>   thermal: Add mode helpers
>   thermal: Use mode helpers in drivers
>   thermal: Explicitly enable non-changing thermal zone devices
>   thermal: core: Stop polling DISABLED thermal devices
>   thermal: Simplify or eliminate unnecessary set_mode() methods
>   thermal: Rename set_mode() to change_mode()
> 
>  drivers/acpi/thermal.c                        | 75 +++++----------
>  .../ethernet/chelsio/cxgb4/cxgb4_thermal.c    |  8 ++
>  .../ethernet/mellanox/mlxsw/core_thermal.c    | 91 ++++---------------
>  drivers/net/wireless/intel/iwlwifi/mvm/tt.c   |  9 +-
>  drivers/platform/x86/acerhdf.c                | 33 +++----
>  drivers/platform/x86/intel_mid_thermal.c      |  6 ++
>  drivers/power/supply/power_supply_core.c      |  9 +-
>  drivers/thermal/armada_thermal.c              |  6 ++
>  drivers/thermal/da9062-thermal.c              | 16 +---
>  drivers/thermal/dove_thermal.c                |  6 ++
>  drivers/thermal/hisi_thermal.c                |  6 +-
>  drivers/thermal/imx_thermal.c                 | 57 ++++--------
>  .../intel/int340x_thermal/int3400_thermal.c   | 38 ++------
>  .../int340x_thermal/int340x_thermal_zone.c    |  5 +
>  drivers/thermal/intel/intel_pch_thermal.c     |  5 +
>  .../thermal/intel/intel_quark_dts_thermal.c   | 34 ++-----
>  drivers/thermal/intel/intel_soc_dts_iosf.c    |  3 +
>  drivers/thermal/intel/x86_pkg_temp_thermal.c  |  6 ++
>  drivers/thermal/kirkwood_thermal.c            |  7 ++
>  drivers/thermal/rcar_thermal.c                |  9 +-
>  drivers/thermal/rockchip_thermal.c            |  6 +-
>  drivers/thermal/spear_thermal.c               |  7 ++
>  drivers/thermal/sprd_thermal.c                |  6 +-
>  drivers/thermal/st/st_thermal.c               |  5 +
>  drivers/thermal/thermal_core.c                | 76 ++++++++++++++--
>  drivers/thermal/thermal_of.c                  | 41 +--------
>  drivers/thermal/thermal_sysfs.c               | 37 +-------
>  include/linux/thermal.h                       | 19 +++-
>  28 files changed, 275 insertions(+), 351 deletions(-)
> 
> 
> base-commit: 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
