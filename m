From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0854/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:35 +0800
Message-ID: <20160802115235.6920-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ike.pan@canonical.com, dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
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
 drivers/platform/x86/ideapad-laptop.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index d1a091b..1611d4d 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -100,7 +100,7 @@ struct ideapad_private {
 };
 
 static bool no_bt_rfkill;
-module_param(no_bt_rfkill, bool, 0444);
+module_param(no_bt_rfkill, bool, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetooth.");
 
 /*
@@ -388,7 +388,7 @@ static ssize_t store_ideapad_cam(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(camera_power, 0644, show_ideapad_cam, store_ideapad_cam);
+static DEVICE_ATTR(camera_power, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, show_ideapad_cam, store_ideapad_cam);
 
 static ssize_t show_ideapad_fan(struct device *dev,
 				struct device_attribute *attr,
@@ -421,7 +421,7 @@ static ssize_t store_ideapad_fan(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
+static DEVICE_ATTR(fan_mode, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, show_ideapad_fan, store_ideapad_fan);
 
 static struct attribute *ideapad_attributes[] = {
 	&dev_attr_camera_power.attr,
-- 
2.9.2
