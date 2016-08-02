From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0853/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:31 +0800
Message-ID: <20160802115231.6854-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
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
 drivers/platform/x86/ibm_rtl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
index c62e5e1..ea318e2 100644
--- a/drivers/platform/x86/ibm_rtl.c
+++ b/drivers/platform/x86/ibm_rtl.c
@@ -40,7 +40,7 @@ module_param(force, bool, 0);
 MODULE_PARM_DESC(force, "Force driver load, ignore DMI data");
 
 static bool debug;
-module_param(debug, bool, 0644);
+module_param(debug, bool, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(debug, "Show debug output");
 
 MODULE_LICENSE("GPL");
@@ -199,7 +199,7 @@ static struct bus_type rtl_subsys = {
 };
 
 static DEVICE_ATTR(version, S_IRUGO, rtl_show_version, NULL);
-static DEVICE_ATTR(state, 0600, rtl_show_state, rtl_set_state);
+static DEVICE_ATTR(state, S_IRUSR | S_IWUSR, rtl_show_state, rtl_set_state);
 
 static struct device_attribute *rtl_attributes[] = {
 	&dev_attr_version,
-- 
2.9.2
