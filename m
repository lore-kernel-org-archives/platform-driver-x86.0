From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] drivers/platform: make x86/intel_scu_ipc.c explicitly non-modular
Date: Sun, 14 Feb 2016 15:00:52 -0500
Message-ID: <1455480052-1732-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:54687 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751283AbcBNUBi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 14 Feb 2016 15:01:38 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/platform/x86/Kconfig:config INTEL_SCU_IPC
drivers/platform/x86/Kconfig:   bool "Intel SCU IPC Support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_pci_driver() uses the same init level priority as
builtin_pci_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We don't replace module.h with init.h since the file already has that.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 35 ++++-------------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index f94b730540e2..e81daff65f62 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -24,7 +24,6 @@
 #include <linux/pci.h>
 #include <linux/interrupt.h>
 #include <linux/sfi.h>
-#include <linux/module.h>
 #include <asm/intel-mid.h>
 #include <asm/intel_scu_ipc.h>
 
@@ -611,28 +610,6 @@ static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return 0;
 }
 
-/**
- *	ipc_remove	-	remove a bound IPC device
- *	@pdev: PCI device
- *
- *	In practice the SCU is not removable but this function is also
- *	called for each device on a module unload or cleanup which is the
- *	path that will get used.
- *
- *	Free up the mappings and release the PCI resources
- */
-static void ipc_remove(struct pci_dev *pdev)
-{
-	struct intel_scu_ipc_dev *scu = pci_get_drvdata(pdev);
-
-	mutex_lock(&ipclock);
-	scu->dev = NULL;
-	mutex_unlock(&ipclock);
-
-	iounmap(scu->i2c_base);
-	intel_scu_devices_destroy();
-}
-
 static const struct pci_device_id pci_ids[] = {
 	{
 		PCI_VDEVICE(INTEL, PCI_DEVICE_ID_LINCROFT),
@@ -650,17 +627,13 @@ static const struct pci_device_id pci_ids[] = {
 		0,
 	}
 };
-MODULE_DEVICE_TABLE(pci, pci_ids);
 
 static struct pci_driver ipc_driver = {
+	.driver = {
+		.suppress_bind_attrs = true,
+	},
 	.name = "intel_scu_ipc",
 	.id_table = pci_ids,
 	.probe = ipc_probe,
-	.remove = ipc_remove,
 };
-
-module_pci_driver(ipc_driver);
-
-MODULE_AUTHOR("Sreedhara DS <sreedhara.ds@intel.com>");
-MODULE_DESCRIPTION("Intel SCU IPC driver");
-MODULE_LICENSE("GPL");
+builtin_pci_driver(ipc_driver);
-- 
2.6.1
