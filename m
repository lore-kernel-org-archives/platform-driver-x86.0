From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0842/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:51:40 +0800
Message-ID: <20160802115140.6126-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, david.vrabel@citrix.com, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
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
 drivers/platform/x86/alienware-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 0056294..ce6527f 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -416,7 +416,7 @@ static ssize_t store_control_state(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(lighting_control_state, 0644, show_control_state,
+static DEVICE_ATTR(lighting_control_state, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, show_control_state,
 		   store_control_state);
 
 static int alienware_zone_init(struct platform_device *dev)
-- 
2.9.2
