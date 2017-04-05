From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/5] platform/x86: intel_scu_ipc: Introduce SCU_DEVICE() macro
Date: Wed,  5 Apr 2017 19:05:27 +0300
Message-ID: <20170405160528.9678-4-andriy.shevchenko@linux.intel.com>
References: <20170405160528.9678-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170405160528.9678-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

For better maintainability and readability introduce a macro
for device ID table.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 6d626a8878c7..f9d3eb505a0b 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -609,22 +609,14 @@ static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return 0;
 }
 
+#define SCU_DEVICE(id, pdata)	{PCI_VDEVICE(INTEL, id), (kernel_ulong_t)&pdata}
+
 static const struct pci_device_id pci_ids[] = {
-	{
-		PCI_VDEVICE(INTEL, PCI_DEVICE_ID_LINCROFT),
-		(kernel_ulong_t)&intel_scu_ipc_lincroft_pdata,
-	}, {
-		PCI_VDEVICE(INTEL, PCI_DEVICE_ID_PENWELL),
-		(kernel_ulong_t)&intel_scu_ipc_penwell_pdata,
-	}, {
-		PCI_VDEVICE(INTEL, PCI_DEVICE_ID_CLOVERVIEW),
-		(kernel_ulong_t)&intel_scu_ipc_penwell_pdata,
-	}, {
-		PCI_VDEVICE(INTEL, PCI_DEVICE_ID_TANGIER),
-		(kernel_ulong_t)&intel_scu_ipc_tangier_pdata,
-	}, {
-		0,
-	}
+	SCU_DEVICE(PCI_DEVICE_ID_LINCROFT,	intel_scu_ipc_lincroft_pdata),
+	SCU_DEVICE(PCI_DEVICE_ID_PENWELL,	intel_scu_ipc_penwell_pdata),
+	SCU_DEVICE(PCI_DEVICE_ID_CLOVERVIEW,	intel_scu_ipc_penwell_pdata),
+	SCU_DEVICE(PCI_DEVICE_ID_TANGIER,	intel_scu_ipc_tangier_pdata),
+	{}
 };
 
 static struct pci_driver ipc_driver = {
-- 
2.11.0
