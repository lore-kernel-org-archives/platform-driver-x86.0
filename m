From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0840/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:51:31 +0800
Message-ID: <20160802115131.5992-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jlee@suse.com, dvhart@infradead.org, david.vrabel@citrix.com, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
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
 drivers/platform/x86/acer-wmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 79d64ea..be9b00a 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -233,11 +233,11 @@ static bool has_type_aa;
 static u16 commun_func_bitmap;
 static u8 commun_fn_key_number;
 
-module_param(mailled, int, 0444);
-module_param(brightness, int, 0444);
-module_param(threeg, int, 0444);
-module_param(force_series, int, 0444);
-module_param(ec_raw_mode, bool, 0444);
+module_param(mailled, int, S_IRUSR | S_IRGRP | S_IROTH);
+module_param(brightness, int, S_IRUSR | S_IRGRP | S_IROTH);
+module_param(threeg, int, S_IRUSR | S_IRGRP | S_IROTH);
+module_param(force_series, int, S_IRUSR | S_IRGRP | S_IROTH);
+module_param(ec_raw_mode, bool, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(mailled, "Set initial state of Mail LED");
 MODULE_PARM_DESC(brightness, "Set initial LCD backlight brightness");
 MODULE_PARM_DESC(threeg, "Set initial state of 3G hardware");
-- 
2.9.2
