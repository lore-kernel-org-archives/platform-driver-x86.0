From: Geliang Tang <geliangtang@163.com>
Subject: [PATCH] asus-wmi: drop to_platform_driver macro
Date: Tue, 22 Dec 2015 22:16:13 +0800
Message-ID: <e04e60378a5e76bf5f5bbde8172a850de2e11922.1450793632.git.geliangtang@163.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Geliang Tang <geliangtang@163.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

to_platform_driver has been defined in platform_device.h, so drop
this repetitive macro in asus-wmi.c.

Signed-off-by: Geliang Tang <geliangtang@163.com>
---
 drivers/platform/x86/asus-wmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index f96f7b8..a96630d 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -56,9 +56,6 @@ MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>, "
 MODULE_DESCRIPTION("Asus Generic WMI Driver");
 MODULE_LICENSE("GPL");
 
-#define to_platform_driver(drv)					\
-	(container_of((drv), struct platform_driver, driver))
-
 #define to_asus_wmi_driver(pdrv)					\
 	(container_of((pdrv), struct asus_wmi_driver, platform_driver))
 
-- 
2.5.0
