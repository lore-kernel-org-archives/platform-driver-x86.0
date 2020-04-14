From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [RFC v2 0/9] Stop monitoring disabled devices
Date: Tue, 14 Apr 2020 20:00:56 +0200
Message-ID: <20200414180105.20042-1-andrzej.p@collabora.com>
References: <2bc5a902-acde-526a-11a5-2357d899916c@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <2bc5a902-acde-526a-11a5-2357d899916c@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, platform-driver-x86@vger.kernel.org, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-acpi@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, Len Brown <lenb@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Ido Schimmel <idosch@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org, Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>, Peter Kaestle <peter@piie.net>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.
List-Id: platform-driver-x86.vger.kernel.org

This is the second iteration of this RFC.

The series now focuses on cleaning up the code in the first place.

After the cleanups in patches 1-3 struct thermal_zone_device is extended
so that it contains a "mode" member (patch 4/9).

The next patch (5/9) makes all thermal zone devices use the "mode" member.
This patch makes drivers' ->get_mode() methods redundant, so the next one
(6/9) removes the method altogether.

Patches 7-8/9 ensure that after changing thermal zone device's mode
an attempt will be made to monitor the device.

And finally patch 9/9 prevents DISABLED devices from being monitored.
It also adds THERMAL_DEVICE_INITIAL to accommodate the devices, which
should be monitored but cannot be initially ENABLED.

Andrzej Pietrasiewicz (9):
  thermal: int3400_thermal: Statically initialize
    .get_mode()/.set_mode() ops
  thermal: Eliminate an always-false condition
  thermal: Properly handle mode values in .set_mode()
  thermal: core: Let thermal zone device's mode be stored in its struct
  thermal: Store mode in thermal_zone_device
  thermal: Remove get_mode() method
  thermal: core: Monitor thermal zone after mode change
  thermal: of: Monitor thermal zone after enabling it
  thermal: core: Stop polling DISABLED thermal devices

 drivers/acpi/thermal.c                        | 44 +++++----------
 .../ethernet/mellanox/mlxsw/core_thermal.c    | 43 ++++-----------
 drivers/platform/x86/acerhdf.c                | 28 +++++-----
 drivers/thermal/da9062-thermal.c              | 12 +---
 drivers/thermal/imx_thermal.c                 | 30 ++++------
 .../intel/int340x_thermal/int3400_thermal.c   | 39 +++----------
 .../thermal/intel/intel_quark_dts_thermal.c   | 27 ++++-----
 drivers/thermal/of-thermal.c                  | 28 ++++------
 drivers/thermal/thermal_core.c                | 40 ++++++++++++--
 drivers/thermal/thermal_core.h                |  2 +
 drivers/thermal/thermal_sysfs.c               | 40 ++++----------
 include/linux/thermal.h                       | 55 ++++++++++++++++++-
 12 files changed, 180 insertions(+), 208 deletions(-)

-- 
2.17.1
