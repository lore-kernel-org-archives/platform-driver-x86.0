From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0856/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:45 +0800
Message-ID: <20160802115245.7052-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:17891 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934837AbcHBMdD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 08:33:03 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: malattia@linux.it, dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/platform/x86/sony-laptop.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 1dba359..408bbe5 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -95,22 +95,22 @@ MODULE_PARM_DESC(debug, "set this to 1 (and RTFM) if you want to help "
 		 "the development of this driver");
 
 static int no_spic;		/* = 0 */
-module_param(no_spic, int, 0444);
+module_param(no_spic, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(no_spic,
 		 "set this if you don't want to enable the SPIC device");
 
 static int compat;		/* = 0 */
-module_param(compat, int, 0444);
+module_param(compat, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(compat,
 		 "set this if you want to enable backward compatibility mode");
 
 static unsigned long mask = 0xffffffff;
-module_param(mask, ulong, 0644);
+module_param(mask, ulong, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(mask,
 		 "set this to the mask of event you want to enable (see doc)");
 
 static int camera;		/* = 0 */
-module_param(camera, int, 0444);
+module_param(camera, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(camera,
 		 "set this to 1 to enable Motion Eye camera controls "
 		 "(only use it if you have a C1VE or C1VN model)");
@@ -124,14 +124,14 @@ MODULE_PARM_DESC(minor,
 #endif
 
 static int kbd_backlight = -1;
-module_param(kbd_backlight, int, 0444);
+module_param(kbd_backlight, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(kbd_backlight,
 		 "set this to 0 to disable keyboard backlight, "
 		 "1 to enable it with automatic control and 2 to have it always "
 		 "on (default: no change from current value)");
 
 static int kbd_backlight_timeout = -1;
-module_param(kbd_backlight_timeout, int, 0444);
+module_param(kbd_backlight_timeout, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(kbd_backlight_timeout,
 		 "meaningful values vary from 0 to 3 and their meaning depends "
 		 "on the model (default: no change from current value)");
@@ -4021,9 +4021,9 @@ struct device_attribute spic_attr_##_name = __ATTR(_name,	\
 		_mode, sony_pic_## _name ##_show,		\
 		sony_pic_## _name ##_store)
 
-static SPIC_ATTR(bluetoothpower, 0644);
-static SPIC_ATTR(wwanpower, 0644);
-static SPIC_ATTR(fanspeed, 0644);
+static SPIC_ATTR(bluetoothpower, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+static SPIC_ATTR(wwanpower, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+static SPIC_ATTR(fanspeed, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 
 static struct attribute *spic_attributes[] = {
 	&spic_attr_bluetoothpower.attr,
-- 
2.9.2
