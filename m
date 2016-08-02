From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0851/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:22 +0800
Message-ID: <20160802115222.6720-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:28088 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935110AbcHBMix (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 08:38:53 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jwoithe@just42.net, dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/platform/x86/fujitsu-laptop.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index ce41bc3..168f89b 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -568,13 +568,13 @@ show_radios_state(struct device *dev,
 		return sprintf(buf, "killed\n");
 }
 
-static DEVICE_ATTR(max_brightness, 0444, show_max_brightness, ignore_store);
-static DEVICE_ATTR(brightness_changed, 0444, show_brightness_changed,
+static DEVICE_ATTR(max_brightness, S_IRUSR | S_IRGRP | S_IROTH, show_max_brightness, ignore_store);
+static DEVICE_ATTR(brightness_changed, S_IRUSR | S_IRGRP | S_IROTH, show_brightness_changed,
 		   ignore_store);
-static DEVICE_ATTR(lcd_level, 0644, show_lcd_level, store_lcd_level);
-static DEVICE_ATTR(lid, 0444, show_lid_state, ignore_store);
-static DEVICE_ATTR(dock, 0444, show_dock_state, ignore_store);
-static DEVICE_ATTR(radios, 0444, show_radios_state, ignore_store);
+static DEVICE_ATTR(lcd_level, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, show_lcd_level, store_lcd_level);
+static DEVICE_ATTR(lid, S_IRUSR | S_IRGRP | S_IROTH, show_lid_state, ignore_store);
+static DEVICE_ATTR(dock, S_IRUSR | S_IRGRP | S_IROTH, show_dock_state, ignore_store);
+static DEVICE_ATTR(radios, S_IRUSR | S_IRGRP | S_IROTH, show_radios_state, ignore_store);
 
 static struct attribute *fujitsupf_attributes[] = {
 	&dev_attr_brightness_changed.attr,
@@ -1252,13 +1252,13 @@ static void __exit fujitsu_cleanup(void)
 module_init(fujitsu_init);
 module_exit(fujitsu_cleanup);
 
-module_param(use_alt_lcd_levels, uint, 0644);
+module_param(use_alt_lcd_levels, uint, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(use_alt_lcd_levels,
 		 "Use alternative interface for lcd_levels (needed for Lifebook s6410).");
-module_param(disable_brightness_adjust, uint, 0644);
+module_param(disable_brightness_adjust, uint, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(disable_brightness_adjust, "Disable brightness adjustment .");
 #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
-module_param_named(debug, dbg_level, uint, 0644);
+module_param_named(debug, dbg_level, uint, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(debug, "Sets debug level bit-mask");
 #endif
 
-- 
2.9.2
