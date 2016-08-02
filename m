From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0848/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:08 +0800
Message-ID: <20160802115208.6522-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pali.rohar@gmail.com, dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com
List-Id: platform-driver-x86.vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/platform/x86/dell-rbtn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index dcd9f40..769754a 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -481,7 +481,7 @@ static void rbtn_notify(struct acpi_device *device, u32 event)
 
 module_acpi_driver(rbtn_driver);
 
-module_param(auto_remove_rfkill, bool, 0444);
+module_param(auto_remove_rfkill, bool, S_IRUSR | S_IRGRP | S_IROTH);
 
 MODULE_PARM_DESC(auto_remove_rfkill, "Automatically remove rfkill devices when "
 				     "other modules start receiving events "
-- 
2.9.2
