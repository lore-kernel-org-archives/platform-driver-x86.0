From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0843/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:51:45 +0800
Message-ID: <20160802115145.6192-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:41071 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934929AbcHBM3k (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 08:29:40 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, dvhart@infradead.org, david.vrabel@citrix.com, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/platform/x86/asus-laptop.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 15f1311..a1fdd5a 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -78,18 +78,18 @@ MODULE_LICENSE("GPL");
  *  4  | Software  | Software
  */
 static uint wapf = 1;
-module_param(wapf, uint, 0444);
+module_param(wapf, uint, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(wapf, "WAPF value");
 
 static char *wled_type = "unknown";
 static char *bled_type = "unknown";
 
-module_param(wled_type, charp, 0444);
+module_param(wled_type, charp, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(wled_type, "Set the wled type on boot "
 		 "(unknown, led or rfkill). "
 		 "default is unknown");
 
-module_param(bled_type, charp, 0444);
+module_param(bled_type, charp, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(bled_type, "Set the bled type on boot "
 		 "(unknown, led or rfkill). "
 		 "default is unknown");
@@ -100,27 +100,27 @@ static int wimax_status = -1;
 static int wwan_status = -1;
 static int als_status;
 
-module_param(wlan_status, int, 0444);
+module_param(wlan_status, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(wlan_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
 		 "default is -1");
 
-module_param(bluetooth_status, int, 0444);
+module_param(bluetooth_status, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(bluetooth_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
 		 "default is -1");
 
-module_param(wimax_status, int, 0444);
+module_param(wimax_status, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(wimax_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
 		 "default is -1");
 
-module_param(wwan_status, int, 0444);
+module_param(wwan_status, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(wwan_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
 		 "default is -1");
 
-module_param(als_status, int, 0444);
+module_param(als_status, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(als_status, "Set the ALS status on boot "
 		 "(0 = disabled, 1 = enabled). "
 		 "default is 0");
-- 
2.9.2
