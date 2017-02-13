From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH] platform/x86: intel_pmc_ipc: Add APL PMC PCI Id
Date: Mon, 13 Feb 2017 16:11:47 +0530
Message-ID: <1486982507-6891-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:27218 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752157AbdBMKlv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2017 05:41:51 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, qipeng.zha@intel.com, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

This patch adds the PCI Device id for Power Management Controller on Intel
Apollo Lake platforms.

Intel PMC IPC Driver loads as a platform driver on Apollo Lake platforms
since Intel BIOS hides the PCI Configuration space for 0:13:1 and
re-enumerates it as ACPI device (INT34D2). The correct PCI Device ID should
be added if some platform firmware choses to enumerate the device via PCI
space.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 0bf51d5..ff665b9 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -389,6 +389,7 @@ static void ipc_pci_remove(struct pci_dev *pdev)
 static const struct pci_device_id ipc_pci_ids[] = {
 	{PCI_VDEVICE(INTEL, 0x0a94), 0},
 	{PCI_VDEVICE(INTEL, 0x1a94), 0},
+	{PCI_VDEVICE(INTEL, 0x5a94), 0},
 	{ 0,}
 };
 MODULE_DEVICE_TABLE(pci, ipc_pci_ids);
-- 
1.9.1
