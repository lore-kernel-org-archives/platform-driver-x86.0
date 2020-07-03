From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH 0/3] Fixes for stop monitoring disabled devices series
Date: Fri,  3 Jul 2020 12:43:51 +0200
Message-ID: <20200703104354.19657-1-andrzej.p@collabora.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vishal Kulkarni <vishal-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Jiri Pirko <jiri-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ido Schimmel <idosch-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Johannes Berg <johannes.berg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Emmanuel Grumbach <emmanuel.grumbach-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Luca Coelho <luciano.coelho-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Intel Linux Wireless <linuxwifi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Kaestle <peter-p08lbbvQ7EI@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Miquel Raynal <miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Amit Kucheria <amit.kucheria-LY4KaoCqKrnby3iVrkZq2A@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

This short series contains fixes for "Stop monitoring disabled devices"
series https://www.spinics.net/lists/arm-kernel/msg817861.html

Invocation of thermal_zone_device_is_enabled() in acpi/thermal is now
redundant, because thermal_zone_device_update() now is capable of
handling disabled devices.

In imx's ->get_temp() the lock must not be taken, otherwise a deadlock
happens. The decision whether explicitly running a measurement cycle
is needed is taken based on driver's local irq_enabled variable.

Finally, thermal_zone_device_is_enabled() is made available to the
core only, as there are no driver users of it.

Andrzej Pietrasiewicz (3):
  acpi: thermal: Don't call thermal_zone_device_is_enabled()
  thermal: imx: Use driver's local data to decide whether to run a
    measurement
  thermal: Make thermal_zone_device_is_enabled() available to core only

 drivers/acpi/thermal.c         | 3 ---
 drivers/thermal/imx_thermal.c  | 7 ++++---
 drivers/thermal/thermal_core.c | 1 -
 drivers/thermal/thermal_core.h | 2 ++
 include/linux/thermal.h        | 5 -----
 5 files changed, 6 insertions(+), 12 deletions(-)

-- 
2.17.1
