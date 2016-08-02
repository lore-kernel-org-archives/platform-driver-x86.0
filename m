From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0849/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:13 +0800
Message-ID: <20160802115213.6588-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:45179 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934920AbcHBMdE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 08:33:04 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/platform/x86/eeepc-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 8cdf315..0bff4d6 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -53,7 +53,7 @@ MODULE_LICENSE("GPL");
 
 static bool hotplug_disabled;
 
-module_param(hotplug_disabled, bool, 0444);
+module_param(hotplug_disabled, bool, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(hotplug_disabled,
 		 "Disable hotplug for wireless device. "
 		 "If your laptop need that, please report to "
-- 
2.9.2
