From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 4/5] intel_scu_ipc: switch to use module_pci_driver() macro
Date: Fri,  9 Oct 2015 17:11:35 +0300
Message-ID: <1444399896-78599-4-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1444399896-78599-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:30977 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754041AbbJIOLk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Oct 2015 10:11:40 -0400
In-Reply-To: <1444399896-78599-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The use of macro cleans up the code a bit.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 69e39cb..9de2029 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -567,10 +567,15 @@ static irqreturn_t ioc(int irq, void *dev_id)
  */
 static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	int platform;		/* Platform type */
 	int err;
 	struct intel_scu_ipc_dev *scu = &ipcdev;
 	struct intel_scu_ipc_pdata_t *pdata;
 
+	platform = intel_mid_identify_cpu();
+	if (platform == 0)
+		return -ENODEV;
+
 	if (scu->dev)		/* We support only one SCU */
 		return -EBUSY;
 
@@ -589,7 +594,7 @@ static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	init_completion(&scu->cmd_complete);
 
-	err = devm_request_irq(&pdev->dev, dev->irq, ioc, 0, "intel_scu_ipc",
+	err = devm_request_irq(&pdev->dev, pdev->irq, ioc, 0, "intel_scu_ipc",
 			       scu);
 	if (err)
 		return err;
@@ -651,24 +656,8 @@ static struct pci_driver ipc_driver = {
 	.remove = ipc_remove,
 };
 
-static int __init intel_scu_ipc_init(void)
-{
-	int platform;		/* Platform type */
-
-	platform = intel_mid_identify_cpu();
-	if (platform == 0)
-		return -ENODEV;
-	return  pci_register_driver(&ipc_driver);
-}
-
-static void __exit intel_scu_ipc_exit(void)
-{
-	pci_unregister_driver(&ipc_driver);
-}
+module_pci_driver(ipc_driver);
 
 MODULE_AUTHOR("Sreedhara DS <sreedhara.ds@intel.com>");
 MODULE_DESCRIPTION("Intel SCU IPC driver");
 MODULE_LICENSE("GPL");
-
-module_init(intel_scu_ipc_init);
-module_exit(intel_scu_ipc_exit);
-- 
2.5.3
