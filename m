From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0855/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:40 +0800
Message-ID: <20160802115240.6986-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:18080 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964899AbcHBMfF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 08:35:05 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@suse.com, dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/platform/x86/msi-laptop.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 4231770..8d9dc0e 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -534,17 +534,17 @@ static ssize_t store_auto_fan(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(lcd_level, 0644, show_lcd_level, store_lcd_level);
-static DEVICE_ATTR(auto_brightness, 0644, show_auto_brightness,
+static DEVICE_ATTR(lcd_level, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, show_lcd_level, store_lcd_level);
+static DEVICE_ATTR(auto_brightness, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, show_auto_brightness,
 		   store_auto_brightness);
-static DEVICE_ATTR(bluetooth, 0444, show_bluetooth, NULL);
-static DEVICE_ATTR(wlan, 0444, show_wlan, NULL);
-static DEVICE_ATTR(threeg, 0444, show_threeg, NULL);
-static DEVICE_ATTR(touchpad, 0444, show_touchpad, NULL);
-static DEVICE_ATTR(turbo_mode, 0444, show_turbo, NULL);
-static DEVICE_ATTR(eco_mode, 0444, show_eco, NULL);
-static DEVICE_ATTR(turbo_cooldown, 0444, show_turbo_cooldown, NULL);
-static DEVICE_ATTR(auto_fan, 0644, show_auto_fan, store_auto_fan);
+static DEVICE_ATTR(bluetooth, S_IRUSR | S_IRGRP | S_IROTH, show_bluetooth, NULL);
+static DEVICE_ATTR(wlan, S_IRUSR | S_IRGRP | S_IROTH, show_wlan, NULL);
+static DEVICE_ATTR(threeg, S_IRUSR | S_IRGRP | S_IROTH, show_threeg, NULL);
+static DEVICE_ATTR(touchpad, S_IRUSR | S_IRGRP | S_IROTH, show_touchpad, NULL);
+static DEVICE_ATTR(turbo_mode, S_IRUSR | S_IRGRP | S_IROTH, show_turbo, NULL);
+static DEVICE_ATTR(eco_mode, S_IRUSR | S_IRGRP | S_IROTH, show_eco, NULL);
+static DEVICE_ATTR(turbo_cooldown, S_IRUSR | S_IRGRP | S_IROTH, show_turbo_cooldown, NULL);
+static DEVICE_ATTR(auto_fan, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, show_auto_fan, store_auto_fan);
 
 static struct attribute *msipf_attributes[] = {
 	&dev_attr_bluetooth.attr,
-- 
2.9.2
