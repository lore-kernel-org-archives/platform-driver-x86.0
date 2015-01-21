From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] intel_scu_ipc: take resources from PCI configuration
Date: Wed, 21 Jan 2015 21:38:11 +0200
Message-ID: <1421869091-11543-3-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1421869091-11543-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:9683 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752306AbbAUTlO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Jan 2015 14:41:14 -0500
In-Reply-To: <1421869091-11543-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The patch makes driver to take the resources from PCI BAR0 instead of using
hardcoded values.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index e6430a3..001b199 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -43,10 +43,9 @@
 /*
  * IPC register summary
  *
- * IPC register blocks are memory mapped at fixed address of 0xFF11C000
+ * IPC register blocks are memory mapped at fixed address of PCI BAR 0.
  * To read or write information to the SCU, driver writes to IPC-1 memory
- * mapped registers (base address 0xFF11C000). The following is the IPC
- * mechanism
+ * mapped registers. The following is the IPC mechanism
  *
  * 1. IA core cDMI interface claims this transaction and converts it to a
  *    Transaction Layer Packet (TLP) message which is sent across the cDMI.
@@ -69,34 +68,26 @@
 
 /* intel scu ipc driver data */
 struct intel_scu_ipc_pdata_t {
-	u32 ipc_base;
 	u32 i2c_base;
-	u32 ipc_len;
 	u32 i2c_len;
 	u8 irq_mode;
 };
 
 static struct intel_scu_ipc_pdata_t intel_scu_ipc_lincroft_pdata = {
-	.ipc_base = 0xff11c000,
 	.i2c_base = 0xff12b000,
-	.ipc_len = 0x100,
 	.i2c_len = 0x10,
 	.irq_mode = 0,
 };
 
 /* Penwell and Cloverview */
 static struct intel_scu_ipc_pdata_t intel_scu_ipc_penwell_pdata = {
-	.ipc_base = 0xff11c000,
 	.i2c_base = 0xff12b000,
-	.ipc_len = 0x100,
 	.i2c_len = 0x10,
 	.irq_mode = 1,
 };
 
 static struct intel_scu_ipc_pdata_t intel_scu_ipc_tangier_pdata = {
-	.ipc_base = 0xff009000,
 	.i2c_base  = 0xff00d000,
-	.ipc_len  = 0x100,
 	.i2c_len = 0x10,
 	.irq_mode = 0,
 };
@@ -572,7 +563,7 @@ static int ipc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int err;
 	struct intel_scu_ipc_pdata_t *pdata;
-	resource_size_t pci_resource;
+	resource_size_t base;
 
 	if (ipcdev.pdev)		/* We support only one SCU */
 		return -EBUSY;
@@ -590,8 +581,8 @@ static int ipc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (err)
 		return err;
 
-	pci_resource = pci_resource_start(dev, 0);
-	if (!pci_resource)
+	base = pci_resource_start(dev, 0);
+	if (!base)
 		return -ENOMEM;
 
 	init_completion(&ipcdev.cmd_complete);
@@ -599,7 +590,7 @@ static int ipc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (request_irq(dev->irq, ioc, 0, "intel_scu_ipc", &ipcdev))
 		return -EBUSY;
 
-	ipcdev.ipc_base = ioremap_nocache(pdata->ipc_base, pdata->ipc_len);
+	ipcdev.ipc_base = ioremap_nocache(base, pci_resource_len(dev, 0));
 	if (!ipcdev.ipc_base)
 		return -ENOMEM;
 
-- 
2.1.4
