From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v3 02/10] usb: roles: Handle driver reference counting
Date: Tue,  4 Sep 2018 14:22:11 +0300
Message-ID: <20180904112219.89287-3-heikki.krogerus@linux.intel.com>
References: <20180904112219.89287-1-heikki.krogerus@linux.intel.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180904112219.89287-1-heikki.krogerus@linux.intel.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This fixes potential "BUG: unable to handle kernel paging
request at ..." from happening.

Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
Cc: <stable@vger.kernel.org>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/common/roles.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/common/roles.c b/drivers/usb/common/roles.c
index 15cc76e22123..3d8a776e55ee 100644
--- a/drivers/usb/common/roles.c
+++ b/drivers/usb/common/roles.c
@@ -109,8 +109,15 @@ static void *usb_role_switch_match(struct device_connection *con, int ep,
  */
 struct usb_role_switch *usb_role_switch_get(struct device *dev)
 {
-	return device_connection_find_match(dev, "usb-role-switch", NULL,
-					    usb_role_switch_match);
+	struct usb_role_switch *sw;
+
+	sw = device_connection_find_match(dev, "usb-role-switch", NULL,
+					  usb_role_switch_match);
+
+	if (!IS_ERR(sw))
+		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+
+	return sw;
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_get);
 
@@ -122,8 +129,10 @@ EXPORT_SYMBOL_GPL(usb_role_switch_get);
  */
 void usb_role_switch_put(struct usb_role_switch *sw)
 {
-	if (!IS_ERR_OR_NULL(sw))
+	if (!IS_ERR_OR_NULL(sw)) {
 		put_device(&sw->dev);
+		module_put(sw->dev.parent->driver->owner);
+	}
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_put);
 
-- 
2.18.0
