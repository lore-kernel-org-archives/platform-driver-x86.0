From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH 1/3] acpi: thermal: Don't call thermal_zone_device_is_enabled()
Date: Fri,  3 Jul 2020 12:43:52 +0200
Message-ID: <20200703104354.19657-2-andrzej.p@collabora.com>
References: <20200703104354.19657-1-andrzej.p@collabora.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20200703104354.19657-1-andrzej.p@collabora.com>
Sender: netdev-owner@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: platform-driver-x86.vger.kernel.org

thermal_zone_device_update() can now handle disabled thermal zones, so
the check here is not needed.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/acpi/thermal.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 29a2b73fe035..12c0ece746f0 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -499,9 +499,6 @@ static void acpi_thermal_check(void *data)
 {
 	struct acpi_thermal *tz = data;
 
-	if (!thermal_zone_device_is_enabled(tz->thermal_zone))
-		return;
-
 	thermal_zone_device_update(tz->thermal_zone,
 				   THERMAL_EVENT_UNSPECIFIED);
 }
-- 
2.17.1
