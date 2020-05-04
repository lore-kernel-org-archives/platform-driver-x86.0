From: michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
Subject: [PATCH v4 1/4] platform_data/mlxreg: support new watchdog type with longer timeout period
Date: Mon,  4 May 2020 17:14:24 +0300
Message-ID: <20200504141427.17685-2-michaelsh@mellanox.com>
References: <20200504141427.17685-1-michaelsh@mellanox.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200504141427.17685-1-michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

Add new watchdog type 3 with longer timeout period.
Extend size of health_cntr field that that can be used to init watchdog
timeout period.

Signed-off-by: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Reviewed-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Acked-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v3-v4
Platform driver part acknowledged by Andy Shevchenko
---
 include/linux/platform_data/mlxreg.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index b8da8aef2446..2c5e58d1d77b 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -43,10 +43,13 @@
  *
  * TYPE1 HW watchdog implementation exist in old systems.
  * All new systems have TYPE2 HW watchdog.
+ * TYPE3 HW watchdog can exist on all systems with new CPLD.
+ * TYPE3 is selected by WD capability bit.
  */
 enum mlxreg_wdt_type {
 	MLX_WDT_TYPE1,
 	MLX_WDT_TYPE2,
+	MLX_WDT_TYPE3,
 };
 
 /**
@@ -90,7 +93,7 @@ struct mlxreg_core_data {
 	umode_t	mode;
 	struct device_node *np;
 	struct mlxreg_hotplug_device hpdev;
-	u8 health_cntr;
+	u32 health_cntr;
 	bool attached;
 };
 
-- 
2.11.0
