From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [RFC v1 1/6] platform/x86: intel_pmc_ipc: Fix error handling in ipc_pci_probe()
Date: Tue,  1 Aug 2017 11:13:49 -0700
Message-ID: <5d15388eeb82aed7839b6d842c26168a935c915a.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:47406 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751035AbdHASOQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 14:14:16 -0400
In-Reply-To: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: x86@kernel.org, mingo@redhat.com, qipeng.zha@intel.com, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

This patch adds proper error handling for failure cases in
ipc_pci_probe() function.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index bb792a5..7b65237 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -489,33 +489,46 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	ret = pci_enable_device(pdev);
 	if (ret)
-		return ret;
+		goto release_device;
 
 	ret = pci_request_regions(pdev, "intel_pmc_ipc");
 	if (ret)
-		return ret;
+		goto disable_device;
 
 	pci_resource = pci_resource_start(pdev, 0);
 	len = pci_resource_len(pdev, 0);
 	if (!pci_resource || !len) {
 		dev_err(&pdev->dev, "Failed to get resource\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto free_pci_resources;
 	}
 
 	init_completion(&ipcdev.cmd_complete);
 
 	if (request_irq(pdev->irq, ioc, 0, "intel_pmc_ipc", &ipcdev)) {
 		dev_err(&pdev->dev, "Failed to request irq\n");
-		return -EBUSY;
+		ret = -EBUSY;
+		goto free_pci_resources;
 	}
 
 	ipcdev.ipc_base = ioremap_nocache(pci_resource, len);
 	if (!ipcdev.ipc_base) {
 		dev_err(&pdev->dev, "Failed to ioremap ipc base\n");
-		free_irq(pdev->irq, &ipcdev);
 		ret = -ENOMEM;
+		goto free_irq;
 	}
 
+	return 0;
+
+free_irq:
+	free_irq(pdev->irq, &ipcdev);
+free_pci_resources:
+	pci_release_regions(pdev);
+disable_device:
+	pci_disable_device(pdev);
+release_device:
+	pci_dev_put(pdev);
+
 	return ret;
 }
 
-- 
2.7.4
