From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/5] intel_scu_ipc: switch to use module_pci_driver() macro
Date: Mon, 12 Oct 2015 14:19:47 +0300
Message-ID: <1444648788-74265-5-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1444648788-74265-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444648788-74265-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Eliminate some boilerplate code by using module_pci_driver() instead of
init/exit, moving the salient bits from init into probe.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 5087485..9de2029 100644
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
