From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0841/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:51:36 +0800
Message-ID: <20160802115136.6059-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:11471 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934621AbcHBM3S (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 08:29:18 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: peter@piie.net, dvhart@infradead.org, david.vrabel@citrix.com, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/platform/x86/acerhdf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 460fa67..a4706dd 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -96,13 +96,13 @@ static struct platform_device *acerhdf_dev;
 
 module_param(kernelmode, uint, 0);
 MODULE_PARM_DESC(kernelmode, "Kernel mode fan control on / off");
-module_param(interval, uint, 0600);
+module_param(interval, uint, S_IRUSR | S_IWUSR);
 MODULE_PARM_DESC(interval, "Polling interval of temperature check");
-module_param(fanon, uint, 0600);
+module_param(fanon, uint, S_IRUSR | S_IWUSR);
 MODULE_PARM_DESC(fanon, "Turn the fan on above this temperature");
-module_param(fanoff, uint, 0600);
+module_param(fanoff, uint, S_IRUSR | S_IWUSR);
 MODULE_PARM_DESC(fanoff, "Turn the fan off below this temperature");
-module_param(verbose, uint, 0600);
+module_param(verbose, uint, S_IRUSR | S_IWUSR);
 MODULE_PARM_DESC(verbose, "Enable verbose dmesg output");
 module_param_string(force_bios, force_bios, 16, 0);
 MODULE_PARM_DESC(force_bios, "Force BIOS version and omit BIOS check");
-- 
2.9.2
