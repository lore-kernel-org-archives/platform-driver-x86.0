From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v3 01/10] usb: typec: Take care of driver module reference counting
Date: Tue,  4 Sep 2018 14:22:10 +0300
Message-ID: <20180904112219.89287-2-heikki.krogerus@linux.intel.com>
References: <20180904112219.89287-1-heikki.krogerus@linux.intel.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180904112219.89287-1-heikki.krogerus@linux.intel.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Functions typec_mux_get() and typec_switch_get() already
make sure that the mux device reference count is
incremented, but the same must be done to the driver module
as well to prevent the drivers from being unloaded in the
middle of operation.

This fixes a potential "BUG: unable to handle kernel paging
request at ..." from happening.

Fixes: 93dd2112c7b2 ("usb: typec: mux: Get the mux identifier from function parameter")
Cc: <stable@vger.kernel.org>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index ddaac63ecf12..d990aa510fab 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/list.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/usb/typec_mux.h>
 
@@ -49,8 +50,10 @@ struct typec_switch *typec_switch_get(struct device *dev)
 	mutex_lock(&switch_lock);
 	sw = device_connection_find_match(dev, "typec-switch", NULL,
 					  typec_switch_match);
-	if (!IS_ERR_OR_NULL(sw))
+	if (!IS_ERR_OR_NULL(sw)) {
+		WARN_ON(!try_module_get(sw->dev->driver->owner));
 		get_device(sw->dev);
+	}
 	mutex_unlock(&switch_lock);
 
 	return sw;
@@ -65,8 +68,10 @@ EXPORT_SYMBOL_GPL(typec_switch_get);
  */
 void typec_switch_put(struct typec_switch *sw)
 {
-	if (!IS_ERR_OR_NULL(sw))
+	if (!IS_ERR_OR_NULL(sw)) {
+		module_put(sw->dev->driver->owner);
 		put_device(sw->dev);
+	}
 }
 EXPORT_SYMBOL_GPL(typec_switch_put);
 
@@ -136,8 +141,10 @@ struct typec_mux *typec_mux_get(struct device *dev, const char *name)
 
 	mutex_lock(&mux_lock);
 	mux = device_connection_find_match(dev, name, NULL, typec_mux_match);
-	if (!IS_ERR_OR_NULL(mux))
+	if (!IS_ERR_OR_NULL(mux)) {
+		WARN_ON(!try_module_get(mux->dev->driver->owner));
 		get_device(mux->dev);
+	}
 	mutex_unlock(&mux_lock);
 
 	return mux;
@@ -152,8 +159,10 @@ EXPORT_SYMBOL_GPL(typec_mux_get);
  */
 void typec_mux_put(struct typec_mux *mux)
 {
-	if (!IS_ERR_OR_NULL(mux))
+	if (!IS_ERR_OR_NULL(mux)) {
+		module_put(mux->dev->driver->owner);
 		put_device(mux->dev);
+	}
 }
 EXPORT_SYMBOL_GPL(typec_mux_put);
 
-- 
2.18.0
