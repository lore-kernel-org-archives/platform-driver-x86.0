From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0850/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:17 +0800
Message-ID: <20160802115217.6654-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: corentin.chary@gmail.com, dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com
List-Id: platform-driver-x86.vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/platform/x86/eeepc-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 17b365f..fc54481 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -51,7 +51,7 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_EVENT_GUID);
 
 static bool hotplug_wireless;
 
-module_param(hotplug_wireless, bool, 0444);
+module_param(hotplug_wireless, bool, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(hotplug_wireless,
 		 "Enable hotplug for wireless device. "
 		 "If your laptop needs that, please report to "
-- 
2.9.2
