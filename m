From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0859/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:52:58 +0800
Message-ID: <20160802115258.7252-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:52306 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965054AbcHBMeu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 08:34:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/platform/x86/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index ceeb8c1..d3dc738 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -81,12 +81,12 @@ struct wmi_block {
 #define ACPI_WMI_EVENT       0x8	/* GUID is an event */
 
 static bool debug_event;
-module_param(debug_event, bool, 0444);
+module_param(debug_event, bool, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(debug_event,
 		 "Log WMI Events [0/1]");
 
 static bool debug_dump_wdg;
-module_param(debug_dump_wdg, bool, 0444);
+module_param(debug_dump_wdg, bool, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(debug_dump_wdg,
 		 "Dump available WMI interfaces [0/1]");
 
-- 
2.9.2
