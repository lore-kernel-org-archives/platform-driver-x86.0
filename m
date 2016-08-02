From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0846/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:51:59 +0800
Message-ID: <20160802115159.6390-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:53573 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965010AbcHBMet (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 08:34:49 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: cezary.jackiewicz@gmail.com, dvhart@infradead.org, david.vrabel@citrix.com, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/platform/x86/compal-laptop.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index e1c2b6d..eaa3ecb 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -680,17 +680,17 @@ static int bat_writeable_property(struct power_supply *psy,
 /* Driver Globals */
 /* ============== */
 static DEVICE_ATTR(wake_up_pme,
-		0644, wake_up_pme_show,		wake_up_pme_store);
+		S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, wake_up_pme_show,		wake_up_pme_store);
 static DEVICE_ATTR(wake_up_modem,
-		0644, wake_up_modem_show,	wake_up_modem_store);
+		S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, wake_up_modem_show,	wake_up_modem_store);
 static DEVICE_ATTR(wake_up_lan,
-		0644, wake_up_lan_show,	wake_up_lan_store);
+		S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, wake_up_lan_show,	wake_up_lan_store);
 static DEVICE_ATTR(wake_up_wlan,
-		0644, wake_up_wlan_show,	wake_up_wlan_store);
+		S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, wake_up_wlan_show,	wake_up_wlan_store);
 static DEVICE_ATTR(wake_up_key,
-		0644, wake_up_key_show,	wake_up_key_store);
+		S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, wake_up_key_show,	wake_up_key_store);
 static DEVICE_ATTR(wake_up_mouse,
-		0644, wake_up_mouse_show,	wake_up_mouse_store);
+		S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, wake_up_mouse_show,	wake_up_mouse_store);
 
 static DEVICE_ATTR(fan1_input,  S_IRUGO, fan_show,          NULL);
 static DEVICE_ATTR(temp1_input, S_IRUGO, temp_cpu,          NULL);
-- 
2.9.2
