From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [RFC 4/8] thermal: core: Introduce THERMAL_DEVICE_INITIAL
Date: Tue,  7 Apr 2020 19:49:22 +0200
Message-ID: <20200407174926.23971-5-andrzej.p@collabora.com>
References: <20200407174926.23971-1-andrzej.p@collabora.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200407174926.23971-1-andrzej.p@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Support Opensource <support.opensource@diasemi.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Allison Randal <allison@lohutok.net>, Enrico Weigelt <info@metux.net>, Gayatri Kammela <gayatri.k>
List-Id: platform-driver-x86.vger.kernel.org

Add a new mode: THERMAL_DEVICE_INITIAL. It is dedicated to handle devices
which must be initially DISABLED, but which are polled at startup
nonetheless. THERMAL_DEVICE_INITIAL shall be reported as "enabled" in
sysfs to keep the userspace interface intact.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/thermal/thermal_sysfs.c | 4 ++--
 include/linux/thermal.h         | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/thermal_sysfs.c b/drivers/thermal/thermal_sysfs.c
index aa99edb4dff7..6bfef21abce4 100644
--- a/drivers/thermal/thermal_sysfs.c
+++ b/drivers/thermal/thermal_sysfs.c
@@ -59,8 +59,8 @@ mode_show(struct device *dev, struct device_attribute *attr, char *buf)
 	if (result)
 		return result;
 
-	return sprintf(buf, "%s\n", mode == THERMAL_DEVICE_ENABLED ? "enabled"
-		       : "disabled");
+	return sprintf(buf, "%s\n", mode == THERMAL_DEVICE_DISABLED ? "disabled"
+		       : "enabled");
 }
 
 static ssize_t
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 126913c6a53b..1bc6b7998093 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -48,8 +48,9 @@ struct thermal_cooling_device;
 struct thermal_instance;
 
 enum thermal_device_mode {
-	THERMAL_DEVICE_DISABLED = 0,
+	THERMAL_DEVICE_INITIAL = 0,
 	THERMAL_DEVICE_ENABLED,
+	THERMAL_DEVICE_DISABLED,
 };
 
 enum thermal_trip_type {
-- 
2.17.1
