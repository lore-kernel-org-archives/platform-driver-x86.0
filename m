From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: [PATCH 5/5] intel_ips: Remove empty legacy PM callbacks
Date: Sun, 17 Jun 2012 22:30:40 +0200
Message-ID: <201206172230.40711.rjw@sisk.pl>
References: <201206172226.42729.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201206172226.42729.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Joey Lee <jlee@novell.com>, Jesse Barnes <jesse.barnes@intel.com>, Jesse Barnes <jbarnes@virtuousgeek.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Rafael J. Wysocki <rjw@sisk.pl>

The legacy PM callbacks provided by the Intel IPS driver are
empty routines returning 0, so they can be safely dropped.

Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
---
 drivers/platform/x86/intel_ips.c |   17 -----------------
 1 file changed, 17 deletions(-)

Index: linux/drivers/platform/x86/intel_ips.c
===================================================================
--- linux.orig/drivers/platform/x86/intel_ips.c
+++ linux/drivers/platform/x86/intel_ips.c
@@ -1697,21 +1697,6 @@ static void ips_remove(struct pci_dev *d
 	dev_dbg(&dev->dev, "IPS driver removed\n");
 }
 
-#ifdef CONFIG_PM
-static int ips_suspend(struct pci_dev *dev, pm_message_t state)
-{
-	return 0;
-}
-
-static int ips_resume(struct pci_dev *dev)
-{
-	return 0;
-}
-#else
-#define ips_suspend NULL
-#define ips_resume NULL
-#endif /* CONFIG_PM */
-
 static void ips_shutdown(struct pci_dev *dev)
 {
 }
@@ -1721,8 +1706,6 @@ static struct pci_driver ips_pci_driver
 	.id_table = ips_id_table,
 	.probe = ips_probe,
 	.remove = ips_remove,
-	.suspend = ips_suspend,
-	.resume = ips_resume,
 	.shutdown = ips_shutdown,
 };
 
