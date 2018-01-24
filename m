From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v11 - re-ordered 03/12] FIXME platform/mellanox: Remove redundant dev_err messages on device_create
Date: Wed, 24 Jan 2018 20:33:37 +0000
Message-ID: <1516826019-124903-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

The upper layer will manage and report errors returned by the create and
destroy functions.

FIXME: but it doesn't - we don't even check

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
[dvhart: refactored into smaller functional changes]
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index e55f576..0ccd327 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -187,16 +187,11 @@ static int mlxreg_hotplug_device_create(struct device *dev,
 					struct mlxreg_hotplug_device *item)
 {
 	item->adapter = i2c_get_adapter(item->bus);
-	if (!item->adapter) {
-		dev_err(dev, "Failed to get adapter for bus %d\n",
-			item->bus);
+	if (!item->adapter)
 		return -EFAULT;
-	}
 
 	item->client = i2c_new_device(item->adapter, &item->brdinfo);
 	if (!item->client) {
-		dev_err(dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
-			item->brdinfo.type, item->bus, item->brdinfo.addr);
 		i2c_put_adapter(item->adapter);
 		item->adapter = NULL;
 		return -EFAULT;
-- 
2.1.4
