From: Benoit Taine <benoit.taine@lip6.fr>
Subject: [PATCH 6/25] x86: Replace DEFINE_PCI_DEVICE_TABLE macro use
Date: Fri, 18 Jul 2014 17:26:53 +0200
Message-ID: <1405697232-11785-7-git-send-email-benoit.taine@lip6.fr>
References: <1405697232-11785-1-git-send-email-benoit.taine@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405697232-11785-1-git-send-email-benoit.taine@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: benoit.taine@lip6.fr, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We should prefer `struct pci_device_id` over `DEFINE_PCI_DEVICE_TABLE` to meet
kernel coding style guidelines. This issue was reported by checkpatch.

Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>

---
Tested by compilation without errors.

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
index 76ca094..66a4d32 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -640,7 +640,7 @@ static void ipc_remove(struct pci_dev *pdev)
 	intel_scu_devices_destroy();
 }
 
-static DEFINE_PCI_DEVICE_TABLE(pci_ids) = {
+static const struct pci_device_id pci_ids[] = {
 	{
 		PCI_VDEVICE(INTEL, PCI_DEVICE_ID_LINCROFT),
 		(kernel_ulong_t)&intel_scu_ipc_lincroft_pdata,
