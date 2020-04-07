From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [RFC 7/8] thermal: of: Monitor thermal zone after enabling it
Date: Tue,  7 Apr 2020 19:49:25 +0200
Message-ID: <20200407174926.23971-8-andrzej.p@collabora.com>
References: <20200407174926.23971-1-andrzej.p@collabora.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200407174926.23971-1-andrzej.p@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Support Opensource <support.opensource@diasemi.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Allison Randal <allison@lohutok.net>, Enrico Weigelt <info@metux.net>, Gayatri Kammela <gayatri.k>
List-Id: platform-driver-x86.vger.kernel.org

thermal/of calls its own ->set_mode() method, so monitor thermal zone
afterwards. This is needed for the DISABLED->ENABLED transition.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/thermal/of-thermal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index b7621dfab17c..cf2c43ebcb78 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -523,8 +523,11 @@ thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
 		if (sensor_specs.np == sensor_np && id == sensor_id) {
 			tzd = thermal_zone_of_add_sensor(child, sensor_np,
 							 data, ops);
-			if (!IS_ERR(tzd))
+			if (!IS_ERR(tzd)) {
 				tzd->ops->set_mode(tzd, THERMAL_DEVICE_ENABLED);
+				thermal_zone_device_update(tzd,
+						THERMAL_EVENT_UNSPECIFIED);
+			}
 
 			of_node_put(sensor_specs.np);
 			of_node_put(child);
-- 
2.17.1
