From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0852/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:26 +0800
Message-ID: <20160802115226.6786-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: frank@f-seidel.de, dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
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
 drivers/platform/x86/hdaps.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/hdaps.c b/drivers/platform/x86/hdaps.c
index 458e6c9..b8a7dfe 100644
--- a/drivers/platform/x86/hdaps.c
+++ b/drivers/platform/x86/hdaps.c
@@ -454,14 +454,14 @@ static ssize_t hdaps_invert_store(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(position, 0444, hdaps_position_show, NULL);
-static DEVICE_ATTR(variance, 0444, hdaps_variance_show, NULL);
-static DEVICE_ATTR(temp1, 0444, hdaps_temp1_show, NULL);
-static DEVICE_ATTR(temp2, 0444, hdaps_temp2_show, NULL);
-static DEVICE_ATTR(keyboard_activity, 0444, hdaps_keyboard_activity_show, NULL);
-static DEVICE_ATTR(mouse_activity, 0444, hdaps_mouse_activity_show, NULL);
-static DEVICE_ATTR(calibrate, 0644, hdaps_calibrate_show,hdaps_calibrate_store);
-static DEVICE_ATTR(invert, 0644, hdaps_invert_show, hdaps_invert_store);
+static DEVICE_ATTR(position, S_IRUSR | S_IRGRP | S_IROTH, hdaps_position_show, NULL);
+static DEVICE_ATTR(variance, S_IRUSR | S_IRGRP | S_IROTH, hdaps_variance_show, NULL);
+static DEVICE_ATTR(temp1, S_IRUSR | S_IRGRP | S_IROTH, hdaps_temp1_show, NULL);
+static DEVICE_ATTR(temp2, S_IRUSR | S_IRGRP | S_IROTH, hdaps_temp2_show, NULL);
+static DEVICE_ATTR(keyboard_activity, S_IRUSR | S_IRGRP | S_IROTH, hdaps_keyboard_activity_show, NULL);
+static DEVICE_ATTR(mouse_activity, S_IRUSR | S_IRGRP | S_IROTH, hdaps_mouse_activity_show, NULL);
+static DEVICE_ATTR(calibrate, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, hdaps_calibrate_show,hdaps_calibrate_store);
+static DEVICE_ATTR(invert, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, hdaps_invert_show, hdaps_invert_store);
 
 static struct attribute *hdaps_attributes[] = {
 	&dev_attr_position.attr,
-- 
2.9.2
