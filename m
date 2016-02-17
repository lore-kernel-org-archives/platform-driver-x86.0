From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH 1/2] intel_pmc_ipc: Fix GCR register base address and length
Date: Thu, 18 Feb 2016 02:03:37 +0800
Message-ID: <1455732218-27283-1-git-send-email-qipeng.zha@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:28457 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933388AbcBQJ6j (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 04:58:39 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, qipeng.zha@intel.com, Francois-Nicolas Muller <francois-nicolas.muller@intel.com>

GCR register (pmc_cfg register) is at offset 0x1008, and
remapping of 0x4 bytes is enough.

Signed-off-by: Francois-Nicolas Muller <francois-nicolas.muller@intel.com>
Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index ca69135..abdf67c 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -67,7 +67,8 @@
 /* exported resources from IFWI */
 #define PLAT_RESOURCE_IPC_INDEX		0
 #define PLAT_RESOURCE_IPC_SIZE		0x1000
-#define PLAT_RESOURCE_GCR_SIZE		0x1000
+#define PLAT_RESOURCE_GCR_OFFSET	0x1008
+#define PLAT_RESOURCE_GCR_SIZE		0x4
 #define PLAT_RESOURCE_BIOS_DATA_INDEX	1
 #define PLAT_RESOURCE_BIOS_IFACE_INDEX	2
 #define PLAT_RESOURCE_ISP_DATA_INDEX	4
@@ -688,7 +689,7 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 	}
 	ipcdev.ipc_base = addr;
 
-	ipcdev.gcr_base = res->start + size;
+	ipcdev.gcr_base = res->start + PLAT_RESOURCE_GCR_OFFSET;
 	ipcdev.gcr_size = PLAT_RESOURCE_GCR_SIZE;
 	dev_info(&pdev->dev, "ipc res: %pR\n", res);
 
-- 
1.8.3.2
