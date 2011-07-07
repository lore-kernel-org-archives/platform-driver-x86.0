From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH 1/2] platform-drivers-x86: intel_rar_register: convert to
 DEFINE_PCI_DEVICE_TABLE
Date: Thu, 07 Jul 2011 10:21:15 +0800
Message-ID: <1310005275.2481.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Alan Cox <alan@linux.intel.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

And also remove unused variable 'my_id_table'.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/intel_rar_register.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_rar_register.c b/drivers/platform/x86/intel_rar_register.c
index bde47e9..c8a6aed 100644
--- a/drivers/platform/x86/intel_rar_register.c
+++ b/drivers/platform/x86/intel_rar_register.c
@@ -637,15 +637,13 @@ end_function:
 	return error;
 }
 
-const struct pci_device_id rar_pci_id_tbl[] = {
+static DEFINE_PCI_DEVICE_TABLE(rar_pci_id_tbl) = {
 	{ PCI_VDEVICE(INTEL, 0x4110) },
 	{ 0 }
 };
 
 MODULE_DEVICE_TABLE(pci, rar_pci_id_tbl);
 
-const struct pci_device_id *my_id_table = rar_pci_id_tbl;
-
 /* field for registering driver to PCI device */
 static struct pci_driver rar_pci_driver = {
 	.name = "rar_register_driver",
-- 
1.7.4.1
