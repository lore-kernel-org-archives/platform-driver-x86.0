From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [RFC v2 2/9] thermal: Eliminate an always-false condition
Date: Tue, 14 Apr 2020 20:00:58 +0200
Message-ID: <20200414180105.20042-3-andrzej.p@collabora.com>
References: <2bc5a902-acde-526a-11a5-2357d899916c@linaro.org>
 <20200414180105.20042-1-andrzej.p@collabora.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20200414180105.20042-1-andrzej.p@collabora.com>
Sender: netdev-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Support Opensource <support.opensource@diasemi.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Allison Randal <allison@lohutok.net>, Enrico Weigelt <info@metux.net>, Gayatri Kammela <gayatri.k>
List-Id: platform-driver-x86.vger.kernel.org

This driver provides a non-NULL "devdata" argument for
thermal_zone_device_register(). Thermal core never sets it to NULL
afterwards, so checking for its being NULL in this driver makes no sense.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/acpi/thermal.c                                  | 6 ------
 drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 6 ------
 2 files changed, 12 deletions(-)

diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 19067a5e5293..328b479ce7f6 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -531,9 +531,6 @@ static int thermal_get_mode(struct thermal_zone_device *thermal,
 {
 	struct acpi_thermal *tz = thermal->devdata;
 
-	if (!tz)
-		return -EINVAL;
-
 	*mode = tz->tz_enabled ? THERMAL_DEVICE_ENABLED :
 		THERMAL_DEVICE_DISABLED;
 
@@ -546,9 +543,6 @@ static int thermal_set_mode(struct thermal_zone_device *thermal,
 	struct acpi_thermal *tz = thermal->devdata;
 	int enable;
 
-	if (!tz)
-		return -EINVAL;
-
 	/*
 	 * enable/disable thermal management from ACPI thermal driver
 	 */
diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
index e802922a13cf..fbb59dd09481 100644
--- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
@@ -235,9 +235,6 @@ static int int3400_thermal_get_mode(struct thermal_zone_device *thermal,
 {
 	struct int3400_thermal_priv *priv = thermal->devdata;
 
-	if (!priv)
-		return -EINVAL;
-
 	*mode = priv->mode;
 
 	return 0;
@@ -250,9 +247,6 @@ static int int3400_thermal_set_mode(struct thermal_zone_device *thermal,
 	bool enable;
 	int result = 0;
 
-	if (!priv)
-		return -EINVAL;
-
 	if (mode == THERMAL_DEVICE_ENABLED)
 		enable = true;
 	else if (mode == THERMAL_DEVICE_DISABLED)
-- 
2.17.1
