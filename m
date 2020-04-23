From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v3 2/2] thermal: core: Stop polling DISABLED thermal devices
Date: Thu, 23 Apr 2020 18:57:05 +0200
Message-ID: <20200423165705.13585-3-andrzej.p@collabora.com>
References: <a3998ad2-19bc-0893-a10d-2bb5adf7d99f@samsung.com>
 <20200423165705.13585-1-andrzej.p@collabora.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200423165705.13585-1-andrzej.p@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Support Opensource <support.opensource@diasemi.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang7@gma>
List-Id: platform-driver-x86.vger.kernel.org

Polling DISABLED devices is not desired, as all such "disabled" devices
are meant to be handled by userspace. This patch introduces and uses
should_stop_polling() to decide whether the device should be polled or not.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/thermal/thermal_core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index a2a5034f76e7..03c4d8d23284 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -305,13 +305,22 @@ static void thermal_zone_device_set_polling(struct thermal_zone_device *tz,
 		cancel_delayed_work(&tz->poll_queue);
 }
 
+static inline bool should_stop_polling(struct thermal_zone_device *tz)
+{
+	return thermal_zone_device_get_mode(tz) == THERMAL_DEVICE_DISABLED;
+}
+
 static void monitor_thermal_zone(struct thermal_zone_device *tz)
 {
+	bool stop;
+
+	stop = should_stop_polling(tz);
+
 	mutex_lock(&tz->lock);
 
-	if (tz->passive)
+	if (!stop && tz->passive)
 		thermal_zone_device_set_polling(tz, tz->passive_delay);
-	else if (tz->polling_delay)
+	else if (!stop && tz->polling_delay)
 		thermal_zone_device_set_polling(tz, tz->polling_delay);
 	else
 		thermal_zone_device_set_polling(tz, 0);
@@ -503,6 +512,9 @@ void thermal_zone_device_update(struct thermal_zone_device *tz,
 {
 	int count;
 
+	if (should_stop_polling(tz))
+		return;
+
 	if (atomic_read(&in_suspend))
 		return;
 
-- 
2.17.1
