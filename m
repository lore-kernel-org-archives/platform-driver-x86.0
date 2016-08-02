From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0844/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:51:50 +0800
Message-ID: <20160802115150.6258-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:35859 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934963AbcHBM3c (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 08:29:32 -0400
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
 drivers/platform/x86/asus-nb-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 091ca7a..136f009 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -50,7 +50,7 @@ MODULE_ALIAS("wmi:"ASUS_NB_WMI_EVENT_GUID);
  *  4  | Software  | Software
  */
 static int wapf = -1;
-module_param(wapf, uint, 0444);
+module_param(wapf, uint, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(wapf, "WAPF value");
 
 static struct quirk_entry *quirks;
-- 
2.9.2
