From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/3] platform/x86: GPD pocket fan: Use a min-speed of 2 while charging
Date: Fri, 19 Jan 2018 21:47:08 +0100
Message-ID: <20180119204709.16240-2-hdegoede@redhat.com>
References: <20180119204709.16240-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51958 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754267AbeASUrU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jan 2018 15:47:20 -0500
In-Reply-To: <20180119204709.16240-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, James <kernel@madingley.org>

Newer versions of the GPD pocket BIOS set the fan-speed to 2 when a
charger gets plugged in while the device is off. Mirror this in our
fan driver and use a minimum speed of 2 while charging,

Cc: James <kernel@madingley.org>
Suggested-by: James <kernel@madingley.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/gpd-pocket-fan.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
index 1fdf2205730d..f7b4980c0aa6 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -7,6 +7,7 @@
 
 #include <linux/acpi.h>
 #include <linux/gpio/consumer.h>
+#include <linux/power_supply.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/platform_device.h>
@@ -25,6 +26,11 @@ module_param(hysteresis, int, 0444);
 MODULE_PARM_DESC(hysteresis,
 		 "Hysteresis in milli-celcius before lowering the fan speed");
 
+static int speed_on_ac = 2;
+module_param(speed_on_ac, int, 0444);
+MODULE_PARM_DESC(speed_on_ac,
+		 "minimum fan speed to allow when system is powered by AC");
+
 struct gpd_pocket_fan_data {
 	struct device *dev;
 	struct thermal_zone_device *dts0;
@@ -46,11 +52,19 @@ static void gpd_pocket_fan_set_speed(struct gpd_pocket_fan_data *fan, int speed)
 	fan->last_speed = speed;
 }
 
+static int gpd_pocket_fan_min_speed(void)
+{
+	if (power_supply_is_system_supplied())
+		return speed_on_ac;
+	else
+		return 0;
+}
+
 static void gpd_pocket_fan_worker(struct work_struct *work)
 {
 	struct gpd_pocket_fan_data *fan =
 		container_of(work, struct gpd_pocket_fan_data, work.work);
-	int t0, t1, temp, speed, i;
+	int t0, t1, temp, speed, min_speed, i;
 
 	if (thermal_zone_get_temp(fan->dts0, &t0) ||
 	    thermal_zone_get_temp(fan->dts1, &t1)) {
@@ -62,9 +76,10 @@ static void gpd_pocket_fan_worker(struct work_struct *work)
 	temp = max(t0, t1);
 
 	speed = fan->last_speed;
+	min_speed = gpd_pocket_fan_min_speed();
 
 	/* Determine minimum speed */
-	for (i = 0; i < ARRAY_SIZE(temp_limits); i++) {
+	for (i = min_speed; i < ARRAY_SIZE(temp_limits); i++) {
 		if (temp < temp_limits[i])
 			break;
 	}
@@ -72,7 +87,7 @@ static void gpd_pocket_fan_worker(struct work_struct *work)
 		speed = i;
 
 	/* Use hysteresis before lowering speed again */
-	for (i = 0; i < ARRAY_SIZE(temp_limits); i++) {
+	for (i = min_speed; i < ARRAY_SIZE(temp_limits); i++) {
 		if (temp <= (temp_limits[i] - hysteresis))
 			break;
 	}
@@ -113,6 +128,11 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
 			hysteresis);
 		return -EINVAL;
 	}
+	if (speed_on_ac < 0 || speed_on_ac > MAX_SPEED) {
+		dev_err(&pdev->dev, "Invalid speed_on_ac %d (must be between 0 and 3)\n",
+			speed_on_ac);
+		return -EINVAL;
+	}
 
 	fan = devm_kzalloc(&pdev->dev, sizeof(*fan), GFP_KERNEL);
 	if (!fan)
@@ -157,7 +177,7 @@ static int gpd_pocket_fan_suspend(struct device *dev)
 {
 	struct gpd_pocket_fan_data *fan = dev_get_drvdata(dev);
 
-	gpd_pocket_fan_set_speed(fan, 0);
+	gpd_pocket_fan_set_speed(fan, gpd_pocket_fan_min_speed());
 	return 0;
 }
 
-- 
2.14.3
