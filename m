From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH 2/2] platform-drivers-x86: intel_scu_ipc: convert to
 DEFINE_PCI_DEVICE_TABLE
Date: Thu, 07 Jul 2011 10:22:46 +0800
Message-ID: <1310005366.2481.5.camel@phoenix>
References: <1310005275.2481.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:41247 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751971Ab1GGCWv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jul 2011 22:22:51 -0400
In-Reply-To: <1310005275.2481.3.camel@phoenix>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Sreedhara DS <sreedhara.ds@intel.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/intel_scu_ipc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 940accb..c866653 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -725,7 +725,7 @@ static void ipc_remove(struct pci_dev *pdev)
 	intel_scu_devices_destroy();
 }
 
-static const struct pci_device_id pci_ids[] = {
+static DEFINE_PCI_DEVICE_TABLE(pci_ids) = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x080e)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x082a)},
 	{ 0,}
-- 
1.7.4.1
