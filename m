From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 09/10] WMI: make use of class device's attributres
Date: Thu, 26 Aug 2010 00:15:25 -0700
Message-ID: <20100826071525.7976.28120.stgit@localhost.localdomain>
References: <20100826071442.7976.93972.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:56836 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752903Ab0HZHP2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 03:15:28 -0400
Received: by mail-pw0-f46.google.com with SMTP id 7so599247pwi.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2010 00:15:28 -0700 (PDT)
In-Reply-To: <20100826071442.7976.93972.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

Instead of adding modalias attribute manually set it up as class's
device attribute so driver core will create and remove it for us.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/wmi.c |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index b4e5bea..781321b 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -661,7 +661,7 @@ EXPORT_SYMBOL_GPL(wmi_has_guid);
 /*
  * sysfs interface
  */
-static ssize_t show_modalias(struct device *dev, struct device_attribute *attr,
+static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
 	char guid_string[37];
@@ -675,7 +675,11 @@ static ssize_t show_modalias(struct device *dev, struct device_attribute *attr,
 
 	return sprintf(buf, "wmi:%s\n", guid_string);
 }
-static DEVICE_ATTR(modalias, S_IRUGO, show_modalias, NULL);
+
+static struct device_attribute wmi_dev_attrs[] = {
+	__ATTR_RO(modalias),
+	__ATTR_NULL
+};
 
 static int wmi_dev_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
@@ -708,6 +712,7 @@ static struct class wmi_class = {
 	.name = "wmi",
 	.dev_release = wmi_dev_free,
 	.dev_uevent = wmi_dev_uevent,
+	.dev_attrs = wmi_dev_attrs,
 };
 
 static int wmi_create_devs(void)
@@ -740,10 +745,6 @@ static int wmi_create_devs(void)
 		result = device_register(guid_dev);
 		if (result)
 			return result;
-
-		result = device_create_file(guid_dev, &dev_attr_modalias);
-		if (result)
-			return result;
 	}
 
 	return 0;
@@ -763,8 +764,6 @@ static void wmi_remove_devs(void)
 		guid_dev = wblock->dev;
 		gblock = &wblock->gblock;
 
-		device_remove_file(guid_dev, &dev_attr_modalias);
-
 		device_unregister(guid_dev);
 	}
 }
