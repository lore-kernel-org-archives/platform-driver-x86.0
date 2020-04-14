From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [RFC v2 1/9] thermal: int3400_thermal: Statically initialize .get_mode()/.set_mode() ops
Date: Tue, 14 Apr 2020 20:00:57 +0200
Message-ID: <20200414180105.20042-2-andrzej.p@collabora.com>
References: <2bc5a902-acde-526a-11a5-2357d899916c@linaro.org>
 <20200414180105.20042-1-andrzej.p@collabora.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200414180105.20042-1-andrzej.p@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Support Opensource <support.opensource@diasemi.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Allison Randal <allison@lohutok.net>, Enrico Weigelt <info@metux.net>, Gayatri Kammela <gayatri.k>
List-Id: platform-driver-x86.vger.kernel.org

int3400_thermal_ops is used inside int3400_thermal_probe() only after
the assignments, which can just as well be made statically at struct's
initizer.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
index ceef89c956bd..e802922a13cf 100644
--- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
@@ -271,6 +271,8 @@ static int int3400_thermal_set_mode(struct thermal_zone_device *thermal,
 
 static struct thermal_zone_device_ops int3400_thermal_ops = {
 	.get_temp = int3400_thermal_get_temp,
+	.get_mode = int3400_thermal_get_mode,
+	.set_mode = int3400_thermal_set_mode,
 };
 
 static struct thermal_zone_params int3400_thermal_params = {
@@ -309,9 +311,6 @@ static int int3400_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	int3400_thermal_ops.get_mode = int3400_thermal_get_mode;
-	int3400_thermal_ops.set_mode = int3400_thermal_set_mode;
-
 	priv->thermal = thermal_zone_device_register("INT3400 Thermal", 0, 0,
 						priv, &int3400_thermal_ops,
 						&int3400_thermal_params, 0, 0);
-- 
2.17.1
