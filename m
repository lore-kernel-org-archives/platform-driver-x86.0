From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v10 1/6] platform/mellanox: mlxreg-hotplug: Remove unused wait.h include
Date: Tue, 23 Jan 2018 20:34:20 +0000
Message-ID: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

The driver does not make use of anything defined in wait.h.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v9->v10:
 Fixes provideded by Darren:
 - make separate patch for cleaning unused includes;
 - do not remove spinlock.h from includes and make;
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 2866c76..c015fe9 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -42,7 +42,6 @@
 #include <linux/platform_data/mlxreg.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
-#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 /* Offset of event and mask registers from status register */
-- 
2.1.4
