From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 1/5] platform/x86: fujitsu-laptop: remove backlight-related attributes from the platform device
Date: Tue, 14 Mar 2017 11:26:27 +0100
Message-ID: <20170314102631.8203-2-kernel@kempniu.pl>
References: <20170314102631.8203-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33623 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750824AbdCNK0l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2017 06:26:41 -0400
Received: by mail-lf0-f67.google.com with SMTP id r36so13781937lfi.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2017 03:26:40 -0700 (PDT)
In-Reply-To: <20170314102631.8203-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Setting backlight level using a vendor-specific interface should only be
possible when using the latter is either explicitly requested by the
user or automatically selected by the kernel.  fujitsu-laptop violates
that premise by unconditionally attaching three backlight-related
attributes to the platform device it registers.  Remove the offending
attributes from the platform device.  Update module comments to reflect
this change.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 90 ++---------------------------------
 1 file changed, 3 insertions(+), 87 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 3c795d591de0..9b9348af7626 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -32,18 +32,9 @@
  * features made available on a range of Fujitsu laptops including the
  * P2xxx/P5xxx/S6xxx/S7xxx series.
  *
- * This driver exports a few files in /sys/devices/platform/fujitsu-laptop/;
- * others may be added at a later date.
- *
- *   lcd_level - Screen brightness: contains a single integer in the
- *   range 0..7. (rw)
- *
- * In addition to these platform device attributes the driver
- * registers itself in the Linux backlight control subsystem and is
- * available to userspace under /sys/class/backlight/fujitsu-laptop/.
- *
- * Hotkeys present on certain Fujitsu laptops (eg: the S6xxx series) are
- * also supported by this driver.
+ * This driver implements a vendor-specific backlight control interface for
+ * Fujitsu laptops and provides support for hotkeys present on certain Fujitsu
+ * laptops.
  *
  * This driver has been tested on a Fujitsu Lifebook S6410, S7020 and
  * P8010.  It should work on most P-series and S-series Lifebooks, but
@@ -489,74 +480,6 @@ static const struct backlight_ops fujitsu_bl_ops = {
 	.update_status = bl_update_status,
 };
 
-/* Platform LCD brightness device */
-
-static ssize_t
-show_max_brightness(struct device *dev,
-		    struct device_attribute *attr, char *buf)
-{
-
-	int ret;
-
-	ret = get_max_brightness();
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%i\n", ret);
-}
-
-static ssize_t
-show_brightness_changed(struct device *dev,
-			struct device_attribute *attr, char *buf)
-{
-
-	int ret;
-
-	ret = fujitsu_bl->brightness_changed;
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%i\n", ret);
-}
-
-static ssize_t show_lcd_level(struct device *dev,
-			      struct device_attribute *attr, char *buf)
-{
-
-	int ret;
-
-	ret = get_lcd_level();
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%i\n", ret);
-}
-
-static ssize_t store_lcd_level(struct device *dev,
-			       struct device_attribute *attr, const char *buf,
-			       size_t count)
-{
-
-	int level, ret;
-
-	if (sscanf(buf, "%i", &level) != 1
-	    || (level < 0 || level >= fujitsu_bl->max_brightness))
-		return -EINVAL;
-
-	if (use_alt_lcd_levels)
-		ret = set_lcd_level_alt(level);
-	else
-		ret = set_lcd_level(level);
-	if (ret < 0)
-		return ret;
-
-	ret = get_lcd_level();
-	if (ret < 0)
-		return ret;
-
-	return count;
-}
-
 static ssize_t
 ignore_store(struct device *dev,
 	     struct device_attribute *attr, const char *buf, size_t count)
@@ -600,18 +523,11 @@ show_radios_state(struct device *dev,
 		return sprintf(buf, "killed\n");
 }
 
-static DEVICE_ATTR(max_brightness, 0444, show_max_brightness, ignore_store);
-static DEVICE_ATTR(brightness_changed, 0444, show_brightness_changed,
-		   ignore_store);
-static DEVICE_ATTR(lcd_level, 0644, show_lcd_level, store_lcd_level);
 static DEVICE_ATTR(lid, 0444, show_lid_state, ignore_store);
 static DEVICE_ATTR(dock, 0444, show_dock_state, ignore_store);
 static DEVICE_ATTR(radios, 0444, show_radios_state, ignore_store);
 
 static struct attribute *fujitsu_pf_attributes[] = {
-	&dev_attr_brightness_changed.attr,
-	&dev_attr_max_brightness.attr,
-	&dev_attr_lcd_level.attr,
 	&dev_attr_lid.attr,
 	&dev_attr_dock.attr,
 	&dev_attr_radios.attr,
-- 
2.12.0
