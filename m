From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v7 00/11] Stop monitoring disabled devices
Date: Tue, 30 Jun 2020 15:43:20 +0200
Message-ID: <3d03d1a2-ac06-b69b-93cb-e0203be62c10@collabora.com>
References: <20200629122925.21729-1-andrzej.p@collabora.com>
 <aab40d90-3f72-657c-5e14-e53a34c4b420@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <aab40d90-3f72-657c-5e14-e53a34c4b420-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vishal Kulkarni <vishal-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Jiri Pirko <jiri-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ido Schimmel <idosch-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Johannes Berg <johannes.berg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Emmanuel Grumbach <emmanuel.grumbach-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Luca Coelho <luciano.coelho-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Intel Linux Wireless <linuxwifi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Kaestle <peter-p08lbbvQ7EI@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Miquel Raynal <miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Amit Kucheria <amit.kucheria-LY4KaoCqKrnby3iVrkZq2A@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Daniel,

I am reading the logs and can't find anything specific to thermal.

What I can see is

"random: crng init done"

with large times (~200s) and then e.g.

'auto-login-action timed out after 283 seconds'

I'm looking at e.g. 
https://storage.kernelci.org/thermal/testing/v5.8-rc3-11-gf5e50bf4d3ef/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-sabrelite.html

Is there anywhere else I can look at?

Andrzej

W dniu 30.06.2020 o 14:57, Daniel Lezcano pisze:
> 
> Hi Andrzej,
> 
> I've tested your series with kernelci and there are 3 regressions for
> the imx6.
> 
> https://kernelci.org/test/job/thermal/branch/testing/kernel/v5.8-rc3-11-gf5e50bf4d3ef/plan/baseline/
> 
> 
> On 29/06/2020 14:29, Andrzej Pietrasiewicz wrote:
>> A respin of v6 with these changes:
>>
>> v6..v7:
>> - removed duplicate S-o-b line from patch 6/11
>>
>> v5..v6:
>> - staticized thermal_zone_device_set_mode() (kbuild test robot)
>>
>> v4..v5:
>>
>> - EXPORT_SYMBOL -> EXPORT_SYMBOL_GPL (Daniel)
>> - dropped unnecessary thermal_zone_device_enable() in int3400_thermal.c
>> and in thermal_of.c (Bartlomiej)
>>
>> Andrzej Pietrasiewicz (11):
>>    acpi: thermal: Fix error handling in the register function
>>    thermal: Store thermal mode in a dedicated enum
>>    thermal: Add current mode to thermal zone device
>>    thermal: Store device mode in struct thermal_zone_device
>>    thermal: remove get_mode() operation of drivers
>>    thermal: Add mode helpers
>>    thermal: Use mode helpers in drivers
>>    thermal: Explicitly enable non-changing thermal zone devices
>>    thermal: core: Stop polling DISABLED thermal devices
>>    thermal: Simplify or eliminate unnecessary set_mode() methods
>>    thermal: Rename set_mode() to change_mode()
>>
>>   drivers/acpi/thermal.c                        | 75 +++++----------
>>   .../ethernet/chelsio/cxgb4/cxgb4_thermal.c    |  8 ++
>>   .../ethernet/mellanox/mlxsw/core_thermal.c    | 91 ++++---------------
>>   drivers/net/wireless/intel/iwlwifi/mvm/tt.c   |  9 +-
>>   drivers/platform/x86/acerhdf.c                | 33 +++----
>>   drivers/platform/x86/intel_mid_thermal.c      |  6 ++
>>   drivers/power/supply/power_supply_core.c      |  9 +-
>>   drivers/thermal/armada_thermal.c              |  6 ++
>>   drivers/thermal/da9062-thermal.c              | 16 +---
>>   drivers/thermal/dove_thermal.c                |  6 ++
>>   drivers/thermal/hisi_thermal.c                |  6 +-
>>   drivers/thermal/imx_thermal.c                 | 57 ++++--------
>>   .../intel/int340x_thermal/int3400_thermal.c   | 38 ++------
>>   .../int340x_thermal/int340x_thermal_zone.c    |  5 +
>>   drivers/thermal/intel/intel_pch_thermal.c     |  5 +
>>   .../thermal/intel/intel_quark_dts_thermal.c   | 34 ++-----
>>   drivers/thermal/intel/intel_soc_dts_iosf.c    |  3 +
>>   drivers/thermal/intel/x86_pkg_temp_thermal.c  |  6 ++
>>   drivers/thermal/kirkwood_thermal.c            |  7 ++
>>   drivers/thermal/rcar_thermal.c                |  9 +-
>>   drivers/thermal/rockchip_thermal.c            |  6 +-
>>   drivers/thermal/spear_thermal.c               |  7 ++
>>   drivers/thermal/sprd_thermal.c                |  6 +-
>>   drivers/thermal/st/st_thermal.c               |  5 +
>>   drivers/thermal/thermal_core.c                | 76 ++++++++++++++--
>>   drivers/thermal/thermal_of.c                  | 41 +--------
>>   drivers/thermal/thermal_sysfs.c               | 37 +-------
>>   include/linux/thermal.h                       | 19 +++-
>>   28 files changed, 275 insertions(+), 351 deletions(-)
>>
>>
>> base-commit: 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68
>>
> 
> 
