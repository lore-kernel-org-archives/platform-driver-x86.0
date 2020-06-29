From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v7 03/11] thermal: Add current mode to thermal zone device
Date: Mon, 29 Jun 2020 14:29:17 +0200
Message-ID: <20200629122925.21729-4-andrzej.p@collabora.com>
References: <20200629122925.21729-1-andrzej.p@collabora.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20200629122925.21729-1-andrzej.p@collabora.com>
Sender: netdev-owner@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: platform-driver-x86.vger.kernel.org

Prepare for changing the place where the mode is stored: now it is in
drivers, which might or might not implement get_mode()/set_mode() methods.
A lot of cleanup can be done thanks to storing it in struct tzd. The
get_mode() methods will become redundant.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 include/linux/thermal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 216185bb3014..5f91d7f04512 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -128,6 +128,7 @@ struct thermal_cooling_device {
  * @trip_temp_attrs:	attributes for trip points for sysfs: trip temperature
  * @trip_type_attrs:	attributes for trip points for sysfs: trip type
  * @trip_hyst_attrs:	attributes for trip points for sysfs: trip hysteresis
+ * @mode:		current mode of this thermal zone
  * @devdata:	private pointer for device private data
  * @trips:	number of trip points the thermal zone supports
  * @trips_disabled;	bitmap for disabled trips
@@ -170,6 +171,7 @@ struct thermal_zone_device {
 	struct thermal_attr *trip_temp_attrs;
 	struct thermal_attr *trip_type_attrs;
 	struct thermal_attr *trip_hyst_attrs;
+	enum thermal_device_mode mode;
 	void *devdata;
 	int trips;
 	unsigned long trips_disabled;	/* bitmap for disabled trips */
-- 
2.17.1
