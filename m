From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0845/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:51:54 +0800
Message-ID: <20160802115154.6324-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:58829 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934977AbcHBM3g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 08:29:36 -0400
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
 drivers/platform/x86/asus-wmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a26dca3..cc2ed81 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1727,11 +1727,11 @@ static ssize_t show_sys_wmi(struct asus_wmi *asus, int devid, char *buf)
 		.store  = store_##_name,				\
 	}
 
-ASUS_WMI_CREATE_DEVICE_ATTR(touchpad, 0644, ASUS_WMI_DEVID_TOUCHPAD);
-ASUS_WMI_CREATE_DEVICE_ATTR(camera, 0644, ASUS_WMI_DEVID_CAMERA);
-ASUS_WMI_CREATE_DEVICE_ATTR(cardr, 0644, ASUS_WMI_DEVID_CARDREADER);
-ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, 0644, ASUS_WMI_DEVID_LID_RESUME);
-ASUS_WMI_CREATE_DEVICE_ATTR(als_enable, 0644, ASUS_WMI_DEVID_ALS_ENABLE);
+ASUS_WMI_CREATE_DEVICE_ATTR(touchpad, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, ASUS_WMI_DEVID_TOUCHPAD);
+ASUS_WMI_CREATE_DEVICE_ATTR(camera, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, ASUS_WMI_DEVID_CAMERA);
+ASUS_WMI_CREATE_DEVICE_ATTR(cardr, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, ASUS_WMI_DEVID_CARDREADER);
+ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, ASUS_WMI_DEVID_LID_RESUME);
+ASUS_WMI_CREATE_DEVICE_ATTR(als_enable, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, ASUS_WMI_DEVID_ALS_ENABLE);
 
 static ssize_t store_cpufv(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t count)
-- 
2.9.2
