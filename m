From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v4 00/11] Stop monitoring disabled devices
Date: Thu, 28 May 2020 21:20:40 +0200
Message-ID: <20200528192051.28034-1-andrzej.p@collabora.com>
References: <Message-ID: <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <Message-ID: <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: platform-driver-x86.vger.kernel.org

There is already a reviewed v3 (not to be confused with RFC v3), which can
be considered for merging:

https://lore.kernel.org/linux-pm/20200423165705.13585-2-andrzej.p@collabora.com/

Let me cite Bartlomiej Zolnierkiewicz:

"I couldn't find the problems with the patch itself (no new issues
being introduced, all changes seem to be improvements over the current
situation).

Also the patch is not small but it also not that big and it mostly
removes the code:

17 files changed, 105 insertions(+), 244 deletions(-)"

There have been raised some concerns about bisectability and about
introducing "initial_mode" member in struct thermal_zone_params.

This v4 series addresses those concerns: it takes a more gradual
approach and uses explicit tzd state initialization, hence there are more
insertions than in v3, and the net effect is -63 lines versus -139 lines
in v3.

Patch 2/11 converts the 3 drivers which don't store their mode in
enum thermal_device_mode to do so. Once that is cleared,
struct thermal_zone_device gains its "mode" member (patch 3/11) and then
all interested drivers change the location where they store their
state: instead of storing it in some variable in a driver, they store it
in struct thermal_zone_device (patch 4/11). Patch 4/11 does not introduce
other changes. Then get_mode() driver method becomes redundant, and so
it is removed (patch 5/11). This is the first part of the groundwork.

The second part of the groundwork is to add (patch 6/11) and use (patch
7/11) helpers for accessing tzd's state from drivers. From this moment
on the drivers don't access tzd->mode directly. Please note that after
patch 4/11 all thermal zone devices have their mode implicitly initialized
to DISABLED, as a result of kzalloc and THERMAL_DEVICE_DISABLED == 0.
This is not a problem from the point of view of polling them, because
their state is not considered when deciding to poll or to cease polling.
In preparation for considering tzd's state when deciding to poll or to
cease polling it ensured (patch 8/11 and some in patch 7/11) that all the
drivers are explicitly initialized with regard to their state.

With all that groundwork in place now it makes sense to modify thermal_core
so that it stops polling DISABLED devices (patch 9/11), which is the
ultimate purpose of this work.

While at it, some set_mode() implementations only change the polling
variables to make the core stop polling their drivers, but that is now
unnecessary and those set_mode() implementations are removed. In other
implementations polling variables modifications are removed. Some other
set_mode() implementations are simplified or removed (patch 10/11).

set_mode() is now only called when tzd's mode is about to change. Actual
setting is performed in thermal_core, in thermal_zone_device_set_mode().
The meaning of set_mode() callback is actually to notify the driver about
the mode being changed and giving the driver a chance to oppose such
a change. To better reflect the purpose of the method it is renamed to
change_mode() (patch 11/11).

Andrzej Pietrasiewicz (11):
  acpi: thermal: Fix error handling in the register function
  thermal: Store thermal mode in a dedicated enum
  thermal: Add current mode to thermal zone device
  thermal: Store device mode in struct thermal_zone_device
  thermal: remove get_mode() operation of drivers
  thermal: Add mode helpers
  thermal: Use mode helpers in drivers
  thermal: Explicitly enable non-changing thermal zone devices
  thermal: core: Stop polling DISABLED thermal devices
  thermal: Simplify or eliminate unnecessary set_mode() methods
  thermal: Rename set_mode() to change_mode()

 drivers/acpi/thermal.c                        | 75 +++++----------
 .../ethernet/chelsio/cxgb4/cxgb4_thermal.c    |  8 ++
 .../ethernet/mellanox/mlxsw/core_thermal.c    | 91 ++++---------------
 drivers/net/wireless/intel/iwlwifi/mvm/tt.c   |  9 +-
 drivers/platform/x86/acerhdf.c                | 33 +++----
 drivers/platform/x86/intel_mid_thermal.c      |  6 ++
 drivers/power/supply/power_supply_core.c      |  9 +-
 drivers/thermal/armada_thermal.c              |  6 ++
 drivers/thermal/da9062-thermal.c              | 16 +---
 drivers/thermal/dove_thermal.c                |  6 ++
 drivers/thermal/hisi_thermal.c                |  6 +-
 drivers/thermal/imx_thermal.c                 | 57 ++++--------
 .../intel/int340x_thermal/int3400_thermal.c   | 43 +++------
 .../int340x_thermal/int340x_thermal_zone.c    |  5 +
 drivers/thermal/intel/intel_pch_thermal.c     |  5 +
 .../thermal/intel/intel_quark_dts_thermal.c   | 34 ++-----
 drivers/thermal/intel/intel_soc_dts_iosf.c    |  3 +
 drivers/thermal/intel/x86_pkg_temp_thermal.c  |  6 ++
 drivers/thermal/kirkwood_thermal.c            |  7 ++
 drivers/thermal/rcar_thermal.c                |  9 +-
 drivers/thermal/rockchip_thermal.c            |  6 +-
 drivers/thermal/spear_thermal.c               |  7 ++
 drivers/thermal/sprd_thermal.c                |  6 +-
 drivers/thermal/st/st_thermal.c               |  5 +
 drivers/thermal/thermal_core.c                | 76 ++++++++++++++--
 drivers/thermal/thermal_of.c                  | 51 ++---------
 drivers/thermal/thermal_sysfs.c               | 37 +-------
 include/linux/thermal.h                       | 19 +++-
 28 files changed, 289 insertions(+), 352 deletions(-)


base-commit: 351f4911a477ae01239c42f771f621d85b06ea10
-- 
2.17.1
