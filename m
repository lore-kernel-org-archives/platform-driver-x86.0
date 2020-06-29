From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v6 03/11] thermal: Add current mode to thermal zone device
Date: Mon, 29 Jun 2020 13:16:07 +0200
Message-ID: <20200629111615.18131-4-andrzej.p@collabora.com>
References: <CAHLCerO2XOOX9akEwaTu_cjSqRycFpNmoVxkSe36L8B4ALWidA@mail.gmail.com>
 <20200629111615.18131-1-andrzej.p@collabora.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200629111615.18131-1-andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vishal Kulkarni <vishal-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Jiri Pirko <jiri-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ido Schimmel <idosch-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Johannes Berg <johannes.berg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Emmanuel Grumbach <emmanuel.grumbach-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Luca Coelho <luciano.coelho-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Intel Linux Wireless <linuxwifi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Kaestle <peter-p08lbbvQ7EI@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Miquel Raynal <miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Amit Kucheria <amit.kucheria-LY4KaoCqKrnby3iVrkZq2A@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Prepare for changing the place where the mode is stored: now it is in
drivers, which might or might not implement get_mode()/set_mode() methods.
A lot of cleanup can be done thanks to storing it in struct tzd. The
get_mode() methods will become redundant.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
