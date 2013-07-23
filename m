From: Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v1 2/3] ipc: Enabled ipc support for additional intel platforms
Date: Mon, 22 Jul 2013 19:48:44 -0700
Message-ID: <2a0d2c08fd193d4589a20ad4ffc9f3d05b5ead8d.1374547036.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <cover.1374547036.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1374547036.git.sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <cover.1374547036.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <cover.1374547036.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: matthew.garrett@nebula.com, linux-kernel@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Enabled ipc support for penwell, clovertrail & tangier platforms.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 93c1b57..aaaf1c1 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -63,6 +63,9 @@
 
 enum {
 	SCU_IPC_LINCROFT,
+	SCU_IPC_PENWELL,
+	SCU_IPC_CLOVERVIEW,
+	SCU_IPC_TANGIER,
 };
 
 /* intel scu ipc driver data*/
@@ -80,6 +83,24 @@ static struct intel_scu_ipc_pdata_t intel_scu_ipc_pdata[] = {
 		.ipc_len = 0x100,
 		.i2c_len = 0x10,
 	},
+	[SCU_IPC_PENWELL] = {
+		.ipc_base = 0xff11c000,
+		.i2c_base = 0xff12b000,
+		.ipc_len = 0x100,
+		.i2c_len = 0x10,
+	},
+	[SCU_IPC_CLOVERVIEW] = {
+		.ipc_base = 0xff11c000,
+		.i2c_base = 0xff12b000,
+		.ipc_len = 0x100,
+		.i2c_len = 0x10,
+	},
+	[SCU_IPC_TANGIER] = {
+		.ipc_base = 0xff009000,
+		.i2c_base  = 0xff00d000,
+		.ipc_len  = 0x100,
+		.i2c_len = 0x10,
+	},
 };
 
 static int ipc_probe(struct pci_dev *dev, const struct pci_device_id *id);
@@ -586,6 +607,9 @@ static void ipc_remove(struct pci_dev *pdev)
 
 static DEFINE_PCI_DEVICE_TABLE(pci_ids) = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x082a), SCU_IPC_LINCROFT},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x080e), SCU_IPC_PENWELL},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x08ea), SCU_IPC_CLOVERVIEW},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x11a0), SCU_IPC_TANGIER},
 	{ 0,}
 };
 MODULE_DEVICE_TABLE(pci, pci_ids);
-- 
1.7.9.5
