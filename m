From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0858/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:53 +0800
Message-ID: <20160802115253.7186-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: coproscefalo@gmail.com, dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
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
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 01e12d2..46e7579 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -222,7 +222,7 @@ struct toshiba_acpi_dev {
 static struct toshiba_acpi_dev *toshiba_acpi;
 
 static bool disable_hotkeys;
-module_param(disable_hotkeys, bool, 0444);
+module_param(disable_hotkeys, bool, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(disable_hotkeys, "Disables the hotkeys activation");
 
 static const struct acpi_device_id toshiba_device_ids[] = {
-- 
2.9.2
