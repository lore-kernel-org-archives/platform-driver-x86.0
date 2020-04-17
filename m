From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [RFC v3 0/2] Stop monitoring disabled devices
Date: Fri, 17 Apr 2020 18:20:18 +0200
Message-ID: <20200417162020.19980-1-andrzej.p@collabora.com>
References: <9ac3b37a-8746-b8ee-70e1-9c876830ac83@linaro.org>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <9ac3b37a-8746-b8ee-70e1-9c876830ac83@linaro.org>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Support Opensource <support.opensource@diasemi.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Allison Randal <allison@lohutok.net>, Enrico Weigelt <info@metux.net>, Gayatri Kammela <gayatri.k>
List-Id: platform-driver-x86.vger.kernel.org

This is the third iteration of this RFC. It has been substantially
rewritten compared to v2.

The first patch makes all the drivers store their mode in struct
thermal_zone_device. Such a move has consequences: driver-specific
variables for storing mode are not necessary. Consequently get_mode()
methods become obsolete. Then sysfs "mode" attribute stops depending
on get_mode() being provided, because it is always provided from now on.

The first patch also introduces the initial mode to be optionally passed
to thermal_zone_device_register().

Given all the groundwork done in patch 1/2 patch 2/2 becomes very simple.

This series addresses comments from Daniel and Bartlomiej - thank you guys!

Andrzej Pietrasiewicz (2):
  thermal: core: Let thermal zone device's mode be stored in its struct
  thermal: core: Stop polling DISABLED thermal devices

 drivers/acpi/thermal.c                        | 46 +++++---------
 .../ethernet/mellanox/mlxsw/core_thermal.c    | 57 ++++--------------
 drivers/platform/x86/acerhdf.c                | 17 +-----
 drivers/thermal/da9062-thermal.c              | 16 ++---
 drivers/thermal/imx_thermal.c                 | 29 +++------
 .../intel/int340x_thermal/int3400_thermal.c   | 30 ++--------
 .../thermal/intel/intel_quark_dts_thermal.c   | 22 ++-----
 drivers/thermal/of-thermal.c                  | 30 +++-------
 drivers/thermal/thermal_core.c                | 60 +++++++++++++++++--
 drivers/thermal/thermal_core.h                | 16 +++++
 drivers/thermal/thermal_sysfs.c               | 29 +--------
 include/linux/thermal.h                       |  7 ++-
 12 files changed, 139 insertions(+), 220 deletions(-)

-- 
2.17.1
