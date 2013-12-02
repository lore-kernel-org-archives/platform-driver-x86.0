From: Jingoo Han <jg1.han@samsung.com>
Subject: PATCH 23/39] platform: x86: remove DEFINE_PCI_DEVICE_TABLE macro
Date: Tue, 03 Dec 2013 08:21:55 +0900
Message-ID: <002c01ceefb5$4a627a90$df276fb0$%han@samsung.com>
References: <001501ceefb1$69c96820$3d5c3860$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30058 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751530Ab3LBXV6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 2 Dec 2013 18:21:58 -0500
In-reply-to: <001501ceefb1$69c96820$3d5c3860$%han@samsung.com>
Content-language: ko
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Matthew Garrett' <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org

Don't use DEFINE_PCI_DEVICE_TABLE macro, because this macro
is not preferred.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/platform/x86/intel_ips.c     |    2 +-
 drivers/platform/x86/intel_scu_ipc.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 18dcb58..a0d1f57 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1478,7 +1478,7 @@ ips_link_to_i915_driver(void)
 }
 EXPORT_SYMBOL_GPL(ips_link_to_i915_driver);
 
-static DEFINE_PCI_DEVICE_TABLE(ips_id_table) = {
+static const struct pci_device_id ips_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL,
 		     PCI_DEVICE_ID_INTEL_THERMAL_SENSOR), },
 	{ 0, }
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 60ea476..6a39f03 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -649,7 +649,7 @@ static void ipc_remove(struct pci_dev *pdev)
 	intel_scu_devices_destroy();
 }
 
-static DEFINE_PCI_DEVICE_TABLE(pci_ids) = {
+static const struct pci_device_id pci_ids[] = {
 	{PCI_VDEVICE(INTEL, 0x082a), SCU_IPC_LINCROFT},
 	{PCI_VDEVICE(INTEL, 0x080e), SCU_IPC_PENWELL},
 	{PCI_VDEVICE(INTEL, 0x08ea), SCU_IPC_CLOVERVIEW},
-- 
1.7.10.4
