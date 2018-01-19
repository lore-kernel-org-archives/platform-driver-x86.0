From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/3] platform/x86: GPD pocket fan: Set speed to max on get_temp failure
Date: Fri, 19 Jan 2018 21:47:07 +0100
Message-ID: <20180119204709.16240-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42472 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752122AbeASUrR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jan 2018 15:47:17 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, James <kernel@madingley.org>

When we fail to get the temperature, assume the worst and set the speed
to max.

While at it introduce a define for MAX_SPEED.

Cc: James <kernel@madingley.org>
Suggested-by: James <kernel@madingley.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/gpd-pocket-fan.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
index c6f4d89b1437..1fdf2205730d 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -13,6 +13,8 @@
 #include <linux/thermal.h>
 #include <linux/workqueue.h>
 
+#define MAX_SPEED 3
+
 static int temp_limits[3] = { 55000, 60000, 65000 };
 module_param_array(temp_limits, int, NULL, 0444);
 MODULE_PARM_DESC(temp_limits,
@@ -53,9 +55,8 @@ static void gpd_pocket_fan_worker(struct work_struct *work)
 	if (thermal_zone_get_temp(fan->dts0, &t0) ||
 	    thermal_zone_get_temp(fan->dts1, &t1)) {
 		dev_warn(fan->dev, "Error getting temperature\n");
-		queue_delayed_work(system_wq, &fan->work,
-				   msecs_to_jiffies(1000));
-		return;
+		speed = MAX_SPEED;
+		goto set_speed;
 	}
 
 	temp = max(t0, t1);
@@ -79,8 +80,9 @@ static void gpd_pocket_fan_worker(struct work_struct *work)
 		speed = i;
 
 	if (fan->last_speed <= 0 && speed)
-		speed = 3; /* kick start motor */
+		speed = MAX_SPEED; /* kick start motor */
 
+set_speed:
 	gpd_pocket_fan_set_speed(fan, speed);
 
 	/* When mostly idle (low temp/speed), slow down the poll interval. */
-- 
2.14.3
